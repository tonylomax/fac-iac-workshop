import * as cdk from "aws-cdk-lib";
import { Stack, StackProps } from "aws-cdk-lib";
import * as ecs from "aws-cdk-lib/aws-ecs";
import * as ecs_patterns from "aws-cdk-lib/aws-ecs-patterns";
import { Repository } from "aws-cdk-lib/aws-ecr";

export class EcsStack extends Stack {
  constructor(scope: cdk.App, id: string, props?: StackProps) {
    super(scope, id, props);

    const ecrRepo = Repository.fromRepositoryName(
      this,
      `${id}-fac-repo`,
      "fac-repo"
    );

    const ecsFargateService =
      new ecs_patterns.ApplicationLoadBalancedFargateService(
        this,
        "fac-service-cdk",
        {
          taskImageOptions: {
            image: ecs.ContainerImage.fromEcrRepository(ecrRepo, "latest"),
            containerPort: 3000,
          },
        }
      );

    ecsFargateService.targetGroup.configureHealthCheck({
      path: "/health-check",
    });

    new cdk.CfnOutput(this, "loadBalancerDNS", {
      value: ecsFargateService.loadBalancer.loadBalancerDnsName,
      description: "The public address to access the load balancer",
    });
  }
}

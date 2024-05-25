# ECS CDK TypeScript project

The `cdk.json` file tells the CDK Toolkit how to execute your app.

- This folder is all you need to spin up and destroy a full microservices architecture using the resources we learned about
- To get it to work just add your account and region into the relevant section and run one of the above commands
- The CLI should then output something like this `EcsStack.loadBalancerDNS = 1234567890-asdfghjkl.eu-west-2.elb.amazonaws.com` which if you navigate to will demonstrate that everything is working!

## Useful commands

- `npm run build` compile typescript to js
- `npm run watch` watch for changes and compile
- `npm run test` perform the jest unit tests
- `npx cdk deploy` deploy this stack to your default AWS account/region
- `npx cdk diff` compare deployed stack with current state
- `npx cdk synth` emits the synthesized CloudFormation template

#!/usr/bin/env node
import "source-map-support/register";
import * as cdk from "aws-cdk-lib";
import { EcsStack } from "../lib/ecs";

const app = new cdk.App();

new EcsStack(app, "EcsStack", {
  env: { account: "", region: "" }, // Specify your account number and region here
});
app.synth();

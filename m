Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7D8A7BB9E2
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Oct 2023 15:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232486AbjJFN7C (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Oct 2023 09:59:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232447AbjJFN7B (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Oct 2023 09:59:01 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89E2BD6;
        Fri,  6 Oct 2023 06:58:59 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D68CC433B6;
        Fri,  6 Oct 2023 13:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696600739;
        bh=B+nSMcPQ6Dfl5BlciIkViTGxDzdj1bYUxQNg0HS+Vlw=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=k04UhtoGjZnMPVLw1q7zv7NSaXAEqjNHtEAZ6QQwW/wQXu3UXIRE53/OhcfRygQFj
         8cfsn5qYN4SUe7gTGM6NtQ62xmxxbk7ejeFoTRi0UcOK+hVT4hbRAI5F+EgOUNlATV
         JHD0CgF5uFi8/RCs+vAvITjxJq8Skzhm0jKgIJxAgi6w4sucOptQ+o+ISnCw7H27n4
         imMHSuXHOAZGEn5xUkU9kPd9xFmqJaM0XhfLbaIKlmszJmQP3IPgSCx0F+k8/zBZ5S
         Zq0GKUfvRS/g1WPl1/rrZ7qJgDt2JWQUNrEI6SK33mpZ1g7xoyM/qT7lEyIR461a5k
         BzNlNQjyw1sAA==
Received: (nullmailer pid 3776809 invoked by uid 1000);
        Fri, 06 Oct 2023 13:58:51 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     konrad.dybcio@linaro.org, andi.shyti@kernel.org,
        mchehab@kernel.org, conor+dt@kernel.org, linux-i2c@vger.kernel.org,
        andersson@kernel.org, linux-media@vger.kernel.org,
        rfoss@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, loic.poulain@linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        todor.too@gmail.com, agross@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20231006120159.3413789-5-bryan.odonoghue@linaro.org>
References: <20231006120159.3413789-1-bryan.odonoghue@linaro.org>
 <20231006120159.3413789-5-bryan.odonoghue@linaro.org>
Message-Id: <169660073123.3776792.1207909917818505118.robh@kernel.org>
Subject: Re: [PATCH 4/5] media: dt-bindings: media: camss: Add
 qcom,sc8280xp-camss binding
Date:   Fri, 06 Oct 2023 08:58:51 -0500
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On Fri, 06 Oct 2023 13:01:58 +0100, Bryan O'Donoghue wrote:
> Add bindings for qcom,sc8280xp-camss in order to support the camera
> subsystem for sc8280xp as found in the Lenovo x13s Laptop.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/media/qcom,sc8280xp-camss.yaml   | 598 ++++++++++++++++++
>  1 file changed, 598 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml: properties:power-domain-names:items: 'oneOf' conditional failed, one must be fixed:
	[{'description': 'ife0'}, {'description': 'ife1'}, {'description': 'ife2'}, {'description': 'ife3'}, {'description': 'top'}] is not of type 'object'
	Additional properties are not allowed ('description' was unexpected)
	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#
Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.example.dts:26:18: fatal error: dt-bindings/clock/qcom,sc8280xp-camcc.h: No such file or directory
   26 |         #include <dt-bindings/clock/qcom,sc8280xp-camcc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1427: dt_binding_check] Error 2
make: *** [Makefile:234: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231006120159.3413789-5-bryan.odonoghue@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


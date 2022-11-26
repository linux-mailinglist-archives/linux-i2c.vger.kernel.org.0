Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFE8B639872
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Nov 2022 23:26:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbiKZWZk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 26 Nov 2022 17:25:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbiKZWZj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 26 Nov 2022 17:25:39 -0500
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04018E0C3;
        Sat, 26 Nov 2022 14:25:38 -0800 (PST)
Received: by mail-io1-f47.google.com with SMTP id i85so5247372ioa.5;
        Sat, 26 Nov 2022 14:25:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/RMyYOFIS/k1shCeQijOTAmK/nl8iYEKcVhmij4E6XQ=;
        b=D13Erg+D8DbrzX35QriFFSH5iFZjlehMtLZsaDbOue8wdOo2vgoR4F0e0MQmupThvs
         Zrt2rAKhwPYEILB9f8LDxFB8klDdkRdqDLqhqooOLX07+bPbdgEiG0owtAXxR7ZVI6tC
         Qs0pn49j/6l+umoQkKJWn6iqE3cI5VV42wRhxcsCt0I37+yBuWnGsWZtIytENxUgqPvI
         GaF/N0frhSnArD+wV4YwJuqkgHSXPkBh6Gh5MUeBf0i244Os1RmByDPqJQK7ZffvaMcD
         +jWkcaePxdZ/Uu6NNsoBP7TrR1Feauv/IAjgUCrfkCUgJgAn+ex1h5zbPxIxzMu5NZ5J
         cdhA==
X-Gm-Message-State: ANoB5plyWaSvC495quLEpb2y9fLg6y+HT6fL9hUT/G174Xs8RMZTzPTm
        1arL/A+rRlIYnRX7H8yppFssA5VT+A==
X-Google-Smtp-Source: AA0mqf6L5vpWQSgA/6k8bcYQ9iY//s4vl30Rngyl90snp4mmdp+Xi+UVan/7Qhv91B1sR/JhIJYCkg==
X-Received: by 2002:a02:9547:0:b0:375:3dd1:743c with SMTP id y65-20020a029547000000b003753dd1743cmr13248207jah.281.1669501537580;
        Sat, 26 Nov 2022 14:25:37 -0800 (PST)
Received: from robh_at_kernel.org ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id c12-20020a02330c000000b003898778bed7sm2202159jae.134.2022.11.26.14.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 14:25:37 -0800 (PST)
Received: (nullmailer pid 35349 invoked by uid 1000);
        Sat, 26 Nov 2022 22:25:36 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     WANG Xuerui <kernel@xen0n.name>,
        Jianmin Lv <lvjianmin@loongson.cn>, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Rob Herring <robh+dt@kernel.org>, loongarch@lists.linux.dev,
        Wolfram Sang <wsa@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To:  =?utf-8?q?=3C57339e73b6c0bfe446e19a7f55a48b7ca640b9ec=2E166935?=
 =?utf-8?q?9515=2Egit=2Ezhoubinbin=40loongson=2Ecn=3E?=
References: <cover.1669359515.git.zhoubinbin@loongson.cn>  =?utf-8?q?=3C5733?=
 =?utf-8?q?9e73b6c0bfe446e19a7f55a48b7ca640b9ec=2E1669359515=2Egit=2Ezhoubin?=
 =?utf-8?q?bin=40loongson=2Ecn=3E?=
Message-Id: <166950113038.8130.14678253677023396314.robh@kernel.org>
Subject: Re: [PATCH V3 3/5] dt-bindings: i2c: add bindings for Loongson LS2X I2C
Date:   Sat, 26 Nov 2022 16:25:36 -0600
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On Fri, 25 Nov 2022 16:54:13 +0800, Binbin Zhou wrote:
> Add device tree bindings for the i2c controller on the Loongson-2K Soc
> or Loongosn LS7A bridge.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../bindings/i2c/loongson,ls2x-i2c.yaml       | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.example.dtb: i2c@1fe21000: reg: [[0, 534908928], [0, 8]] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.example.dtb: i2c@1fe21000: Unevaluated properties are not allowed ('reg' was unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/57339e73b6c0bfe446e19a7f55a48b7ca640b9ec.1669359515.git.zhoubinbin@loongson.cn

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command.


Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED2556B9765
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Mar 2023 15:11:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230502AbjCNOLH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Mar 2023 10:11:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232602AbjCNOKw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Mar 2023 10:10:52 -0400
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 492989FBDD;
        Tue, 14 Mar 2023 07:10:46 -0700 (PDT)
Received: by mail-io1-f49.google.com with SMTP id f14so6450664iow.5;
        Tue, 14 Mar 2023 07:10:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678803045;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KPNzf+HQqdCHDIm57ke58vX4Ge6Far2yuTyMjYWrrg8=;
        b=EgnPdKxiPNAz2yT1kP/ptS/cguAi9KECytbPns2HHHehwXDgtbDLWui/I4apR23QXp
         3xAblLXrI3Yhozed9tJzbB+xnV+bm0nWYKgQOVfUVmN7Aq09ervme2H4TWzeim3F19sX
         ZGtL0Lmva2dlTXWZLg7+SIFKZ259PsthZsg+7t+ErFeOJYhR9hueiJLzQ0uJxWBvr+v8
         HkYfP5Q2skbpzNow1t0C6MS2OoYt9J75MLiaP2QplLY5IPC92Vo1bIzX16PPrJUI6+QT
         gb0ZbWMSIk1Rph55PuZp+RBml9rVWap0G2nKmYWNbZfef4ENv0cP4kMF0adibQjpYdeD
         isVw==
X-Gm-Message-State: AO0yUKV9DLYBFpVYMgREsrXvwctJi/2zWWoaZwX9QmySh2r/6Z8U+L8k
        bpqaSvKKwap4rSORaMFo0Q==
X-Google-Smtp-Source: AK7set/ocHiedGVn3EYKa+oI9LdcoqYevEqv/MuedJEJn4ARvKcoiOUJNoQKDEkorOs6HTOylwSY5w==
X-Received: by 2002:a6b:d216:0:b0:74c:9235:8753 with SMTP id q22-20020a6bd216000000b0074c92358753mr19035122iob.13.1678803045491;
        Tue, 14 Mar 2023 07:10:45 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id s14-20020a6bd30e000000b00734ac8a5ef7sm833864iob.25.2023.03.14.07.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 07:10:43 -0700 (PDT)
Received: (nullmailer pid 83779 invoked by uid 1000);
        Tue, 14 Mar 2023 14:10:19 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     linux-i2c@vger.kernel.org, Ryan Chen <ryan_chen@aspeedtech.com>,
        Wolfram Sang <wsa@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20230312233613.303408-2-andi.shyti@kernel.org>
References: <20230312233613.303408-1-andi.shyti@kernel.org>
 <20230312233613.303408-2-andi.shyti@kernel.org>
Message-Id: <167880254331.25515.17901856481962486896.robh@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: i2c: mpc: Mark "fsl,timeout" as
 deprecated
Date:   Tue, 14 Mar 2023 09:10:19 -0500
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On Mon, 13 Mar 2023 00:36:11 +0100, Andi Shyti wrote:
> Now we have the i2c-scl-clk-low-timeout-ms property defined in
> the i2c schema.
> 
> Mark "fsl,timeout" as deprecated and update the example.
> 
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mpc.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/i2c-mpc.example.dtb: i2c@3100: Unevaluated properties are not allowed ('i2c-scl-clk-low-timeout-ms' was unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230312233613.303408-2-andi.shyti@kernel.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


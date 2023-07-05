Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC69748DF7
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jul 2023 21:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233401AbjGETjl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jul 2023 15:39:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232714AbjGETjk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jul 2023 15:39:40 -0400
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED11D1732;
        Wed,  5 Jul 2023 12:39:38 -0700 (PDT)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-345f50577d3so29125815ab.2;
        Wed, 05 Jul 2023 12:39:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688585978; x=1691177978;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n9XXXuHpMOQBfJPbmDE208zmHNLuLmJ5W06p0NFVR4Q=;
        b=ersniBmhizjJuc99EwCsgydFhJ5WYMocEo29tBHvxmubbVUK+AlfvRziEwMxGMjKFa
         mgnRc/aRTBjXc28hUfwRn5lf5kD73U3+0e7aPlqPUFc+FoogeOirN8Z6n3dlUF+0j+WL
         IbgDx/RKGAaN8IMUnHoLOp2P8UxqxEa9+AjmTyRdwE2lDpL4gzzbi85zlihP6MILiuU/
         TGKNIDUgXuriR0f2TBMGgUxIWbQI6ILPEAzUX5Y0nd6NEz7Lr+WjAZoH7xv3D0jXQifp
         F84CvV9nsJ5o2JS6pmWTNoP5gsSxfy5gLoLoGOyYS7AJ8noY4bPU/mS8RRJl+aABjZAm
         1eow==
X-Gm-Message-State: ABy/qLbj+zQvs+ONbVPWLm2f6k/p3ugZ4zO4p16R4XFkkmuQpnRQ8Qv1
        0Afn141UvS2QfN9VOSVYJw==
X-Google-Smtp-Source: APBJJlHeCCgfywEkTbD8TaGxOES0xf6LHwH4LNaopQfeQ1Mlc+0XwkrXc56AMYZDW2D01Tl0iYFNfw==
X-Received: by 2002:a92:c70d:0:b0:345:af3e:3aa8 with SMTP id a13-20020a92c70d000000b00345af3e3aa8mr110268ilp.25.1688585978167;
        Wed, 05 Jul 2023 12:39:38 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id n24-20020a5e8c18000000b007835686237asm7580752ioj.27.2023.07.05.12.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 12:39:37 -0700 (PDT)
Received: (nullmailer pid 1714647 invoked by uid 1000);
        Wed, 05 Jul 2023 19:39:32 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc:     linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, lee@kernel.org, davem@davemloft.net,
        pabeni@redhat.com, linux-stm32@st-md-mailman.stormreply.com,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, alexandre.torgue@foss.st.com, will@kernel.org,
        dmaengine@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-phy@lists.infradead.org, catalin.marinas@arm.com,
        Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
        arnd@kernel.org, devicetree@vger.kernel.org,
        netdev@vger.kernel.org, fabrice.gasnier@foss.st.com,
        edumazet@google.com, hugues.fruchet@foss.st.com,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        herbert@gondor.apana.org.au, Oleksii_Moisieiev@epam.com,
        andi.shyti@kernel.org, linux-crypto@vger.kernel.org,
        kuba@kernel.org, linux-mmc@vger.kernel.org, conor+dt@kernel.org,
        olivier.moysan@foss.st.com, linux-i2c@vger.kernel.org,
        alsa-devel@alsa-project.org, jic23@kernel.org,
        linux-arm-kernel@lists.infradead.org, richardcochran@gmail.com,
        vkoul@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        ulf.hansson@linaro.org, arnaud.pouliquen@foss.st.com
In-Reply-To: <20230705172759.1610753-2-gatien.chevallier@foss.st.com>
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-2-gatien.chevallier@foss.st.com>
Message-Id: <168858597047.1714514.3836923282073685393.robh@kernel.org>
Subject: Re: [IGNORE][PATCH 01/10] dt-bindings: Document common device
 controller bindings
Date:   Wed, 05 Jul 2023 13:39:32 -0600
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On Wed, 05 Jul 2023 19:27:50 +0200, Gatien Chevallier wrote:
> From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
> 
> Introducing of the common device controller bindings for the controller
> provider and consumer devices. Those bindings are intended to allow
> divided system on chip into muliple domains, that can be used to
> configure hardware permissions.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> ---
> 
> Depends-on: https://lore.kernel.org/lkml/c869d2751125181a55bc8a88c96e3a892b42f37a.1668070216.git.oleksii_moisieiev@epam.com/
> 
>  .../feature-domain-controller.yaml            | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/feature-controllers/feature-domain-controller.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/feature-controllers/feature-domain-controller.yaml: title: 'Generic Domain Controller bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230705172759.1610753-2-gatien.chevallier@foss.st.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


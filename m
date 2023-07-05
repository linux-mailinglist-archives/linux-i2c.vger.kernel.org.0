Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54DCF748E16
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jul 2023 21:40:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234317AbjGETj6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jul 2023 15:39:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234279AbjGETjx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jul 2023 15:39:53 -0400
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29740199E;
        Wed,  5 Jul 2023 12:39:49 -0700 (PDT)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-78666f06691so164440839f.0;
        Wed, 05 Jul 2023 12:39:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688585988; x=1691177988;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EmigWppDMAwntmLPkpHMViFD3zfbB0BalUBHyRmY93I=;
        b=O0Hx0DJjaXwYP+yvm0yoGbkrJfx9adX747Wx8eccbhjCijufql33tPIigemLgwYP07
         WmdleyqbK2jthxf4WIbHBCB/D45wsSToLzMHer0D4wQ3OM1rYd8vrW8Ejea/XkxYgVlD
         RdIFih6oJUvcTOUP3n/POr5sMXlTGRF7TtW1Tkl8Ut7J7TVlZ4vP/mLY/hcZ/Xn4MScL
         ZZK7qu35f7CDOzEvY96oyGpv64sHtOlR9wGOmjmad/61EXZCEU7QZDfsG60G5zj9dc8N
         KUgZujUdI+o3GqdLwoddvC7B+1M0qnJ2Ew7YJ8Uo2Ql45DJM4Yzke7qJ4wLnY+VHA4FV
         G9jg==
X-Gm-Message-State: ABy/qLZFlIKvxvKGqXQZTz0o/LFFOCdFQkrKPqlxpFh6gP4Gif3nQnv6
        4sC4xEaxllPtYm8C2qF7FA==
X-Google-Smtp-Source: APBJJlE1T+SG//kQOjsdrxPqC6WYFy+jVqYd/9wV9AIbQOA/LFJUSpnFw6o7MHDprdjfMYp8ihzVDA==
X-Received: by 2002:a6b:3c02:0:b0:786:45f7:fb7e with SMTP id k2-20020a6b3c02000000b0078645f7fb7emr58527iob.13.1688585988126;
        Wed, 05 Jul 2023 12:39:48 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id d21-20020a02a495000000b0042ad887f705sm6314042jam.143.2023.07.05.12.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 12:39:47 -0700 (PDT)
Received: (nullmailer pid 1714652 invoked by uid 1000);
        Wed, 05 Jul 2023 19:39:32 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc:     fabrice.gasnier@foss.st.com, jic23@kernel.org, conor+dt@kernel.org,
        hugues.fruchet@foss.st.com, richardcochran@gmail.com,
        will@kernel.org, davem@davemloft.net, vkoul@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
        arnd@kernel.org, gregkh@linuxfoundation.org,
        linux-i2c@vger.kernel.org, linux-usb@vger.kernel.org,
        arnaud.pouliquen@foss.st.com, mchehab@kernel.org,
        olivier.moysan@foss.st.com, andi.shyti@kernel.org,
        alexandre.torgue@foss.st.com, kuba@kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-serial@vger.kernel.org,
        alsa-devel@alsa-project.org, pabeni@redhat.com,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Oleksii_Moisieiev@epam.com, lee@kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
        robh+dt@kernel.org, ulf.hansson@linaro.org,
        catalin.marinas@arm.com, edumazet@google.com,
        linux-spi@vger.kernel.org, herbert@gondor.apana.org.au,
        linux-iio@vger.kernel.org, linux-crypto@vger.kernel.org
In-Reply-To: <20230705172759.1610753-4-gatien.chevallier@foss.st.com>
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-4-gatien.chevallier@foss.st.com>
Message-Id: <168858597253.1714602.9996873148476929300.robh@kernel.org>
Subject: Re: [PATCH 03/10] dt-bindings: bus: add device tree bindings for
 ETZPC
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


On Wed, 05 Jul 2023 19:27:52 +0200, Gatien Chevallier wrote:
> Document ETZPC (Extended TrustZone protection controller). ETZPC is a
> firewall controller.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>  .../bindings/bus/st,stm32-etzpc.yaml          | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml: title: 'STM32 Extended TrustZone protection controller bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
Documentation/devicetree/bindings/bus/st,stm32-etzpc.example.dtb: /example-0/etzpc@5c007000: failed to match any schema with compatible: ['st,stm32mp13-sys-bus']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230705172759.1610753-4-gatien.chevallier@foss.st.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


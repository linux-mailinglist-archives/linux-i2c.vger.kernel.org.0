Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDFA46C6A3C
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Mar 2023 14:59:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231960AbjCWN7I (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Mar 2023 09:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232004AbjCWN6x (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Mar 2023 09:58:53 -0400
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA419EC7E;
        Thu, 23 Mar 2023 06:58:47 -0700 (PDT)
Received: by mail-ot1-f54.google.com with SMTP id d22-20020a9d5e16000000b0069b5252ced7so12141507oti.13;
        Thu, 23 Mar 2023 06:58:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679579927;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iftv/UVVJj/lSHrLqdwit449ySjt+SsZDKPn5SnNnGk=;
        b=4HfNYiNIZS1avMpt3YUTkTkJNPuf67o2/xVxhmvRkYfnBAwmOfGwvVVZbOfUIB6ThQ
         ijsTXfXL8vOrepXI9dpvS/7CvOTj4ueFo4mbmCQfFgHvMq3vu5r5jgxy6N5wPIzS/JWi
         ZQH/+7V5jTMGpclJotKveqXnAuD1Gfz6Aoj/MEkBgnEoguFQJXED1/qCeND2Pa5NO/xn
         xhKG4J/h/LPX4R/jhRXKUufqILLK3oylmy1QJkl0VISrykmefQtiWNGHDNr2+jnrqJL4
         b9ZO9Fk2yDAwzcRscJRGHTvrthkzDXtDLz+em2++0XSBDUM7bZT5ZOhTokA1idyc6xi+
         2USA==
X-Gm-Message-State: AO0yUKU+xrr2d6s6Tjzchvr26IZR5TbkdxTgmmMhkg+iyvfzjU9QkrT1
        INHneUtnEH85FJeT6uLwAGlR1uCorw==
X-Google-Smtp-Source: AK7set+Mmtab+QowtbtUIs0AkQgw44ebIs/y/ueeb1Uidwvrh0fuWUUGHnR6wTLtq4V1opvclJ4LbQ==
X-Received: by 2002:a9d:7b46:0:b0:69f:9036:bec9 with SMTP id f6-20020a9d7b46000000b0069f9036bec9mr3449148oto.30.1679579926956;
        Thu, 23 Mar 2023 06:58:46 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p24-20020a9d6958000000b0069f0794861asm6258216oto.63.2023.03.23.06.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 06:58:46 -0700 (PDT)
Received: (nullmailer pid 3103744 invoked by uid 1000);
        Thu, 23 Mar 2023 13:58:37 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     linux-i2c@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20230323115356.2602042-2-patrick.rudolph@9elements.com>
References: <20230323115356.2602042-1-patrick.rudolph@9elements.com>
 <20230323115356.2602042-2-patrick.rudolph@9elements.com>
Message-Id: <167957963187.3095349.11637520534710691125.robh@kernel.org>
Subject: Re: [PATCH v10 1/3] dt-bindings: i2c: Add Maxim MAX735x/MAX736x
 variants
Date:   Thu, 23 Mar 2023 08:58:37 -0500
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On Thu, 23 Mar 2023 12:53:53 +0100, Patrick Rudolph wrote:
> Update the pca954x bindings to add support for the Maxim MAX735x/MAX736x
> chips. The functionality will be provided by the exisintg pca954x driver.
> 
> While on it make the interrupts support conditionally as not all of the
> existing chips have interrupts.
> 
> For chips that are powered off by default add an optional regulator
> called vdd-supply.
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> ---
>  .../bindings/i2c/i2c-mux-pca954x.yaml         | 43 ++++++++++++++++---
>  1 file changed, 38 insertions(+), 5 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.example.dtb: i2c-mux@74: interrupts: False schema does not allow [[17, 8]]
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.example.dtb: i2c-mux@74: #interrupt-cells: False schema does not allow [[2]]
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.example.dtb: i2c-mux@74: interrupt-controller: False schema does not allow True
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230323115356.2602042-2-patrick.rudolph@9elements.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


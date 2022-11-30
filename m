Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A087463D716
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Nov 2022 14:47:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbiK3Nru (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 30 Nov 2022 08:47:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbiK3Nrt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 30 Nov 2022 08:47:49 -0500
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7473D26FB;
        Wed, 30 Nov 2022 05:47:39 -0800 (PST)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-142b72a728fso20989942fac.9;
        Wed, 30 Nov 2022 05:47:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=seGCIQpV/gpvjnLqrRAttrUZC/KeZw23Ao+wHzN0Wd8=;
        b=QKs703g/nLQMORPP5WpzS51TIfVNikmCQwxNQrn8lC93fkOaeYImR4M5lrckDEQW1L
         lfvAbHLxOMOIFAJRVrKSTbwn2h5PxgxsWcExTJhvc/zrxYsLozHmLQzC6fxZo0MojfvJ
         T2+Stfs4pdZaL/V+TPaeTBhd1FwtB9LDU2BCdXaNOSRKLmr7d5iu8VxYjLH/4DUScwOk
         VQ9k2TRWUOSiUf1hEArya2A+rNln4w2wMdG/eSBOI8uTPAVHt2woS4DUfhsWlJpl4MDF
         WsF8fA6n0bI9QejMEsUPzB52vlRyigZpKIiKP5JgOCOZdtpXwAt8x333RMIlI251p5i6
         Maig==
X-Gm-Message-State: ANoB5pnfqxehtP50532XAnj64tsOGuLTa7688gF/zlOzotbeeqiFrSmu
        bJAtRjv5yGZKxWoe27z5xw==
X-Google-Smtp-Source: AA0mqf6bSZBKUGp5+4gpBC4spVxEYTFL+jIgIXJoRus4aB5OZONHshtpPMdps+k6DfC1a9bbxlbGNA==
X-Received: by 2002:a05:6870:6984:b0:13b:254d:6500 with SMTP id my4-20020a056870698400b0013b254d6500mr35322161oab.229.1669816058951;
        Wed, 30 Nov 2022 05:47:38 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r34-20020a056870e9a200b0013b1301ce42sm1152916oao.47.2022.11.30.05.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 05:47:38 -0800 (PST)
Received: (nullmailer pid 1848611 invoked by uid 1000);
        Wed, 30 Nov 2022 13:47:34 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     WANG Xuerui <kernel@xen0n.name>, Wolfram Sang <wsa@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jianmin Lv <lvjianmin@loongson.cn>, linux-i2c@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Huacai Chen <chenhuacai@loongson.cn>,
        loongarch@lists.linux.dev, Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To:  =?utf-8?q?=3C8503ed054d5b4984b5d6e18891767cace2d36a31=2E166977?=
 =?utf-8?q?7792=2Egit=2Ezhoubinbin=40loongson=2Ecn=3E?=
References: <cover.1669777792.git.zhoubinbin@loongson.cn>  =?utf-8?q?=3C8503?=
 =?utf-8?q?ed054d5b4984b5d6e18891767cace2d36a31=2E1669777792=2Egit=2Ezhoubin?=
 =?utf-8?q?bin=40loongson=2Ecn=3E?=
Message-Id: <166981596682.1846552.1915746875446058794.robh@kernel.org>
Subject: Re: [PATCH V4 3/5] dt-bindings: i2c: add bindings for Loongson LS2X I2C
Date:   Wed, 30 Nov 2022 07:47:34 -0600
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On Wed, 30 Nov 2022 13:55:53 +0800, Binbin Zhou wrote:
> Add Loongson LS2X I2C controller binding with DT schema format using
> json-schema.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../bindings/i2c/loongson,ls2x-i2c.yaml       | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.example.dts:25.30-31 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:406: Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1492: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/8503ed054d5b4984b5d6e18891767cace2d36a31.1669777792.git.zhoubinbin@loongson.cn

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


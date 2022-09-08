Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F1455B1D27
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Sep 2022 14:35:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230488AbiIHMfT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Sep 2022 08:35:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbiIHMfF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Sep 2022 08:35:05 -0400
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39D634D146;
        Thu,  8 Sep 2022 05:35:03 -0700 (PDT)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-127f5411b9cso12561517fac.4;
        Thu, 08 Sep 2022 05:35:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=e5C7jtJ6NTss+adUkRAgRxPy8Hmrq7CnsR0YOjkHy3s=;
        b=19EqMuCQIo6WgmVRo+SO+y6nHafUalNXl4E9NEOO/2QimIwUeGfZF0U4PC6SyG0H+j
         JoOJc3NfS7FPAv2XQKZUk5lwy+PUwkMtPEArykFzBUJQiLeDscO158AJ7V0czA1OqmpX
         AEl/RDXQy4cUosGjv72TnsFPiK6cASnvV8ioTS/5tXgFqLZTgj7arhqZNtrfYe0XQEYJ
         Iib3LthWLcITpOlr29QeCUQ1GrOUG/uiyyIz9ntc8hOThV06/im1vqiFqjI4CdKyy9x8
         Dv/0k9Egz52YnxBnJtHJTcQSbSBE9ZEEdwJWT5iq+ESsBjXx2cX28Og9LIgL0NqHKvOS
         NDyw==
X-Gm-Message-State: ACgBeo0BuWs2Eq7BYg1f+AfvkLEJVpRkgSYW/+opsIAAHpyTEDB+X8Pn
        d+G7UlTtoV6XiCRKJ6LJ0OOd8TFA8A==
X-Google-Smtp-Source: AA6agR6TDF1O7/bAlgHsru8fB4QnA/WpWyopfiDsnBoIOKPW0VBNKyKyXMzbD+fNLIJuXm64uTWpKA==
X-Received: by 2002:a05:6870:b429:b0:127:8747:69fc with SMTP id x41-20020a056870b42900b00127874769fcmr1758108oap.171.1662640502392;
        Thu, 08 Sep 2022 05:35:02 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k12-20020a056870818c00b00127a91041a9sm4442599oae.38.2022.09.08.05.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 05:35:02 -0700 (PDT)
Received: (nullmailer pid 2262545 invoked by uid 1000);
        Thu, 08 Sep 2022 12:35:00 -0000
From:   Rob Herring <robh@kernel.org>
To:     Weilong Chen <chenweilong@huawei.com>
Cc:     xuwei5@huawei.com, robh+dt@kernel.org, wsa@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, yangyicong@hisilicon.com
In-Reply-To: <20220908025701.330210-2-chenweilong@huawei.com>
References: <20220908025701.330210-1-chenweilong@huawei.com> <20220908025701.330210-2-chenweilong@huawei.com>
Subject: Re: [PATCH next v3 2/2] dt-bindings: i2c: add entry for hisilicon,hisi-i2c
Date:   Thu, 08 Sep 2022 07:35:00 -0500
Message-Id: <1662640500.384045.2262544.nullmailer@robh.at.kernel.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 08 Sep 2022 10:57:01 +0800, Weilong Chen wrote:
> Add the new compatible for HiSilicon common i2c.
> 
> Signed-off-by: Weilong Chen <chenweilong@huawei.com>
> ---
>  .../bindings/i2c/hisilicon,hisi-i2c.yaml      | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.example.dtb: i2c@5038B0000: 'i2c-digital-filter' is a dependency of 'i2c-digital-filter-width-ns'
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.example.dtb: i2c@5038B0000: reg: [[5, 59441152], [0, 65536]] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.example.dtb: i2c@5038B0000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'reg' were unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.example.dtb: i2c@5038B0000: 'i2c-digital-filter' is a dependency of 'i2c-digital-filter-width-ns'
	From schema: /usr/local/lib/python3.10/dist-packages/dtschema/schemas/i2c/i2c-controller.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


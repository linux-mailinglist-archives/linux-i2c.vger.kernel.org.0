Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C0796077E2
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Oct 2022 15:09:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230235AbiJUNJq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Oct 2022 09:09:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230263AbiJUNJg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Oct 2022 09:09:36 -0400
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D05026DB37;
        Fri, 21 Oct 2022 06:09:10 -0700 (PDT)
Received: by mail-oo1-xc31.google.com with SMTP id g15-20020a4a894f000000b0047f8e899623so428985ooi.5;
        Fri, 21 Oct 2022 06:09:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o2uVwyIoK/AO9QLWJP4nXjuyQPSRjlUdQQs2JXJIPI4=;
        b=g/a7JamEGe6V9eWt6DVvT9TYEZydcVOzY/+6IrsiB9ejhjnZNCMxgUB3b44+aH8u34
         9vWHj4TWw5gRqPLT83AUrpWHgl4DTlkgIJqa/1vPpSanyMCFJPbCez76KvhrChuaYLwX
         KPLd2iUBIbS3fTSBw6Xdvy/RED2kZPtrKH+Ttk/aNXGWJMuNIAG0V3OaHRjYgnuJeqzK
         RWhZi1x+bB9KIDOwxfEGG4OmX0wsL0HVP5OfzvigrmxLkj1MPZTRPbNBWLeb3alzwjLI
         1z4rM/qkSEOSZVtHAIqi4KmijtenwwIkS3deIbCh4hCamFtfcyU9oJWXCtNCNh7JrqR/
         Fu8w==
X-Gm-Message-State: ACrzQf34qG+5n0JvlLlEI7QyhX2a2kAg5bcoFhMaeuJ7ohZdasOtITGD
        vrGwgmVS5W9Ty0KZTDtfH/PvB8kl7w==
X-Google-Smtp-Source: AMsMyM5rD+V8DIgJpEQ2jWbOLvTPZ8HN/VAs7V552hBTr2YMWRiQKqGemUR6xfxsxlIVPH6Y9JO9Yw==
X-Received: by 2002:a05:6820:168b:b0:476:2e4c:6cf1 with SMTP id bc11-20020a056820168b00b004762e4c6cf1mr9026657oob.69.1666357671392;
        Fri, 21 Oct 2022 06:07:51 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id f80-20020a4a5853000000b0044afc1ba91asm8884377oob.44.2022.10.21.06.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 06:07:50 -0700 (PDT)
Received: (nullmailer pid 3431622 invoked by uid 1000);
        Fri, 21 Oct 2022 13:07:51 -0000
From:   Rob Herring <robh@kernel.org>
To:     Weilong Chen <chenweilong@huawei.com>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        xuwei5@huawei.com, yangyicong@hisilicon.com,
        linux-i2c@vger.kernel.org, robh+dt@kernel.org, wsa@kernel.org
In-Reply-To: <20221021035638.203929-2-chenweilong@huawei.com>
References: <20221021035638.203929-1-chenweilong@huawei.com> <20221021035638.203929-2-chenweilong@huawei.com>
Message-Id: <166635752527.3428089.707277745439761591.robh@kernel.org>
Subject: Re: [PATCH next v7 2/2] dt-bindings: i2c: add entry for hisilicon,i2c-ascend910
Date:   Fri, 21 Oct 2022 08:07:51 -0500
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 21 Oct 2022 11:56:38 +0800, Weilong Chen wrote:
> Add the new compatible for HiSilicon i2c.
> 
> Signed-off-by: Weilong Chen <chenweilong@huawei.com>
> ---
> Change since v6:
> - Rename to hisilicon,i2c-ascend910.yaml
> - Change all IIC to I2C
> - Add maintainer name
> Link: https://lore.kernel.org/lkml/7520818b-de40-7f2a-1b03-b1dcd29a2023@huawei.com/T/#ma89d78cef45e7ac6f2c6251ed958e8658e5c1eb5
> 
>  .../bindings/i2c/hisilicon,i2c-ascend910.yaml | 70 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/hisilicon,i2c-ascend910.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/i2c/hisilicon,i2c-ascend910.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/i2c/hisilicon,i2c-ascend910.yaml#

doc reference errors (make refcheckdocs):
MAINTAINERS: Documentation/devicetree/bindings/i2c/hisilicon,i2c-xxx.yaml

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


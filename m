Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3F8B5B6D12
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Sep 2022 14:22:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbiIMMWL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Sep 2022 08:22:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231849AbiIMMWI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Sep 2022 08:22:08 -0400
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 985E043E57;
        Tue, 13 Sep 2022 05:22:05 -0700 (PDT)
Received: by mail-ot1-f43.google.com with SMTP id br15-20020a056830390f00b0061c9d73b8bdso7943296otb.6;
        Tue, 13 Sep 2022 05:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=hD+/5DE8NOemSNCJ30BEmA9AOrYqx/O7A0+pY0Ckx+A=;
        b=7UlQRsPneP+IK2OI2ggGC6tpd+BKjALePuEqnAivU+++YJ8Ttaec6Yy6QvXHMq7AE9
         VNYHovJeV+yO03asVLKz/qi0/RePctkXpwjKJ5A+urmHV65mJDAw5MgFXvNg5ADHd5SR
         v24Hpzeo4CGOSqUcTn+EutwRG/dmD2JGV+5YZ7mjmGGfzXtrnl/ugtuCRcZAVjK3o6mX
         DeKpTzNSNQQAw8igXGjWQt08vN78BzhFjs2m3Qy/+74bhZJw4pzyvgmTa5SMU2EAIbuV
         Bpbe0R/tOtcDglHYzvHBH4PGte1ulXPmIbvR+0hpRYuw1BrmqYQifXrusB10voox5gai
         nCwQ==
X-Gm-Message-State: ACgBeo3CwEAfwsBLVgRYcpdNCrLiybprF0W+stMe8dFADVTKbdhoa5Ba
        Ewzu+kDanXBZ4vYWQrXp+A==
X-Google-Smtp-Source: AA6agR7cEIsiIBAIhpGD3+Wm/i+AEEDZzS7LxsqzGC+62Vo+hOx9HR+92vNjvrIHtbBNwbzT4ZZc+Q==
X-Received: by 2002:a9d:7cc9:0:b0:655:b6e0:a855 with SMTP id r9-20020a9d7cc9000000b00655b6e0a855mr7401159otn.121.1663071724731;
        Tue, 13 Sep 2022 05:22:04 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id f19-20020a056870899300b0011f400edb17sm7066358oaq.4.2022.09.13.05.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 05:22:04 -0700 (PDT)
Received: (nullmailer pid 3428702 invoked by uid 1000);
        Tue, 13 Sep 2022 12:22:03 -0000
Date:   Tue, 13 Sep 2022 07:22:03 -0500
From:   Rob Herring <robh@kernel.org>
To:     Weilong Chen <chenweilong@huawei.com>
Cc:     yangyicong@hisilicon.com, xuwei5@huawei.com, wsa@kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH next v4 2/2] dt-bindings: i2c: add entry for
 hisilicon,hisi-i2c
Message-ID: <20220913122203.GA3413501-robh@kernel.org>
References: <20220909074842.281232-1-chenweilong@huawei.com>
 <20220909074842.281232-2-chenweilong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909074842.281232-2-chenweilong@huawei.com>
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

On Fri, Sep 09, 2022 at 03:48:42PM +0800, Weilong Chen wrote:
> Add the new compatible for HiSilicon common i2c.
> 
> Signed-off-by: Weilong Chen <chenweilong@huawei.com>
> ---
>  .../bindings/i2c/hisilicon,hisi-i2c.yaml      | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.yaml b/Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.yaml
> new file mode 100644
> index 000000000000..f1cb6a4c70d1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/i2c/hisilicon,hisi-i2c.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: HiSilicon common IIC controller Device Tree Bindings
> +
> +maintainers:
> +  - yangyicong@huawei.com
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: hisilicon,hisi-i2c

You need SoC specific compatibles.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clk_rate:
> +    default: 0xEE6B280

What is this property for? Use the clock binding.

> +
> +  clock-frequency:
> +    default: 400000
> +
> +  i2c-sda-falling-time-ns:
> +    default: 343
> +
> +  i2c-scl-falling-time-ns:
> +    default: 203
> +
> +  i2c-sda-hold-time-ns:
> +    default: 0x33E

The rest are in decimal. Be consistent.

> +
> +  i2c-scl-rising-time-ns:
> +    default: 365
> +
> +  i2c-digital-filter-width-ns:
> +    default: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c1: i2c@5038B0000{

Space needed              ^

Use lowercase hex.

Drop unused labels.
  
> +      compatible = "hisilicon,hisi-i2c";
> +      reg = <0x38B0000 0x10000>;
> +      interrupts = <0x0 120 0x4>;
> +      i2c-sda-falling-time-ns = <56>;
> +      i2c-scl-falling-time-ns = <56>;
> +      i2c-sda-hold-time-ns = <56>;
> +      i2c-scl-rising-time-ns = <56>;
> +      i2c-digital-filter;
> +      i2c-digital-filter-width-ns = <0x0>;
> +      clk_rate = <0x0 0xEE6B280>;
> +      clock-frequency = <400000>;
> +    };
> -- 
> 2.31.GIT
> 
> 

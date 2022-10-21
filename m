Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69EC7606CED
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Oct 2022 03:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbiJUBQy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Oct 2022 21:16:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbiJUBQw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Oct 2022 21:16:52 -0400
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15BF722D5C0;
        Thu, 20 Oct 2022 18:16:52 -0700 (PDT)
Received: by mail-ot1-f51.google.com with SMTP id cb2-20020a056830618200b00661b6e5dcd8so929628otb.8;
        Thu, 20 Oct 2022 18:16:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wtNmOohzDZObaSwCDBQgBJXLytW286+sFzEJ+6e5xmw=;
        b=6EzOkBZ5BQl5FsyHBc8iC6UkUYPA9U+1rc3om6F9Npj2nIE/lnafeZfC1/Z0oAZ/6a
         UXzV3vIv+0GHZBt2rXsnzmNTpmxGH3/VTuGZrRZQ7Y68NrM9CAAMyYn8FirB+DU2QnFg
         YJSdiSI1l0ACHuHh+T8cpbxzM8ENaUeZ+zXNnGpXCXIFjqnpxLFyF4WvyasuMkZXC7hq
         3ZQCCidgNZ2nXpfrF2tqNUZuViJaQIed9Kv+wrPP6o3zDLr4L1p8iDMrYq+NCAUch8XD
         MLbIJ01TjCSl/6WdpU2Iisx1hgKuSw6Yms82ldmk1kmcMBnPMslBaa4JMlCvMoHH/oL8
         Yj8Q==
X-Gm-Message-State: ACrzQf1Nq/h1uX/gVZ+q6yudkX+tsYB8bMu8jEB9LRU3WZlmXFS9NKYy
        AEoVoLXAaoBeWqm6EhMQxA==
X-Google-Smtp-Source: AMsMyM6JGxYjxrnkBjviIwaLPYXP/vjA4QkMmMvDzACvp23W9SGmDCaLNeC9OPf+P3nM6IPrEjkxYQ==
X-Received: by 2002:a05:6830:1cc8:b0:661:ad03:da3 with SMTP id p8-20020a0568301cc800b00661ad030da3mr8641706otg.87.1666315011256;
        Thu, 20 Oct 2022 18:16:51 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 30-20020a9d0121000000b00661a3f4113bsm532060otu.64.2022.10.20.18.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 18:16:50 -0700 (PDT)
Received: (nullmailer pid 2114145 invoked by uid 1000);
        Fri, 21 Oct 2022 01:16:52 -0000
Date:   Thu, 20 Oct 2022 20:16:52 -0500
From:   Rob Herring <robh@kernel.org>
To:     Weilong Chen <chenweilong@huawei.com>
Cc:     yangyicong@hisilicon.com, xuwei5@huawei.com, wsa@kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH next v6 2/2] dt-bindings: i2c: add entry for
 hisilicon,i2c-ascend910
Message-ID: <20221021011652.GA2111327-robh@kernel.org>
References: <20221018073012.309355-1-chenweilong@huawei.com>
 <20221018073012.309355-2-chenweilong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221018073012.309355-2-chenweilong@huawei.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Oct 18, 2022 at 03:30:12PM +0800, Weilong Chen wrote:
> Add the new compatible for HiSilicon i2c.
> 
> Signed-off-by: Weilong Chen <chenweilong@huawei.com>
> ---
> Change since v5:
> - Use hisilicon,i2c-ascend910 as compatible string. For more information about
>   the SoC at https://e.huawei.com/en/products/cloud-computing-dc/atlas/ascend-910
> - Alphabetic order the MAINTAINERS
> 
> Change since v4:
> - Add description for SoC specific compatibles.
> - Use the clock binding.
> - Fix decimal, space, case, unused labels.
> Link: https://lore.kernel.org/lkml/20220909074842.281232-1-chenweilong@huawei.com/T/#m4e1c915ead04f4e2e48d69131053a966801625db
> 
>  .../bindings/i2c/hisilicon,i2c-xxx.yaml       | 70 +++++++++++++++++++

hisilicon,i2c-ascend910.yaml

>  MAINTAINERS                                   |  1 +
>  2 files changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/hisilicon,i2c-xxx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/hisilicon,i2c-xxx.yaml b/Documentation/devicetree/bindings/i2c/hisilicon,i2c-xxx.yaml
> new file mode 100644
> index 000000000000..a7285ddc260d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/hisilicon,i2c-xxx.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/i2c/hisilicon,i2c-xxx.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: HiSilicon common IIC controller Device Tree Bindings

'HiSilicon common I2C controller'

> +
> +maintainers:
> +  - yangyicong@huawei.com

Name and email please.
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: hisilicon,i2c-ascend910
> +    description:
> +      The HiSilicon common IIC controller can be used for many different

I2C

> +      types of SoC such as Huawei Ascend AI series chips.
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
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
> +    default: 830
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
> +    i2c@5038b0000 {
> +      compatible = "hisilicon,i2c-ascend910";
> +      reg = <0x38b0000 0x10000>;
> +      interrupts = <0x0 120 0x4>;
> +      i2c-sda-falling-time-ns = <56>;
> +      i2c-scl-falling-time-ns = <56>;
> +      i2c-sda-hold-time-ns = <56>;
> +      i2c-scl-rising-time-ns = <56>;
> +      i2c-digital-filter;
> +      i2c-digital-filter-width-ns = <0x0>;
> +      clocks = <&alg_clk>;
> +      clock-frequency = <400000>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ad32dc9c4822..961e4442fb08 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9211,6 +9211,7 @@ M:	Yicong Yang <yangyicong@hisilicon.com>
>  L:	linux-i2c@vger.kernel.org
>  S:	Maintained
>  W:	https://www.hisilicon.com
> +F:	Documentation/devicetree/bindings/i2c/hisilicon,i2c-xxx.yaml
>  F:	drivers/i2c/busses/i2c-hisi.c
>  
>  HISILICON LPC BUS DRIVER
> -- 
> 2.31.GIT
> 
> 

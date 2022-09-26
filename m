Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 860A55EB173
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Sep 2022 21:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbiIZTms (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Sep 2022 15:42:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbiIZTms (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Sep 2022 15:42:48 -0400
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73D1B9F8EF;
        Mon, 26 Sep 2022 12:42:46 -0700 (PDT)
Received: by mail-oi1-f172.google.com with SMTP id s125so9550073oie.4;
        Mon, 26 Sep 2022 12:42:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=Yaz9xN1wZ8PegBFKrxXCCeI1yx7ipjAsWW+pfBTAo9s=;
        b=6NcTgJ1Z1XXC4FEqysMyMWw2YD/le9U0nx3f7Ttwaet2iFFuTL8Eai4XmS6agku0/g
         thk+19RaM/84lYEKVR41+eJ3lu+L0KW0NBXOgyFkiw5TGS7iKWL9qWFOVdmTZTmEw3Fq
         2GLGxLA5SO+SD3rMu+pmsOw7JmcatM+Ii5yvPW7EB6N9E7nMXK5IsnQomAK/kl5BbuDh
         lJurLTH6aW/kcYxLNJzd/GNsdw/AuE03Szw+VC8apGAkYv2N3JWd5yP60aWgUO6rkivq
         roIU+FZd24dEAAcbkOGa6oaeC/0/+bDllnxNAeAClLQWU+uVTGNBB6HiZu7WjupJJkM2
         /U+A==
X-Gm-Message-State: ACrzQf3AEJ031ugz1wbaEAu71487s4qyYzSy1qhY6Wnlj/JO5MJ33opf
        S2IaMTTf4g2gegICZvxs8Gchyd3L/g==
X-Google-Smtp-Source: AMsMyM4db/y8w0UoKENez3vnKZltGLbqZyh9D8qL7qFoW0zRnJ5s/K7BcLnbvzy42QUlrQJVLg64uw==
X-Received: by 2002:aca:5d07:0:b0:351:27ee:1fc4 with SMTP id r7-20020aca5d07000000b0035127ee1fc4mr167898oib.157.1664221364837;
        Mon, 26 Sep 2022 12:42:44 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id f11-20020a056870548b00b001278611f0f6sm9263689oan.32.2022.09.26.12.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 12:42:44 -0700 (PDT)
Received: (nullmailer pid 2667512 invoked by uid 1000);
        Mon, 26 Sep 2022 19:42:43 -0000
Date:   Mon, 26 Sep 2022 14:42:43 -0500
From:   Rob Herring <robh@kernel.org>
To:     Weilong Chen <chenweilong@huawei.com>
Cc:     yangyicong@hisilicon.com, xuwei5@huawei.com, wsa@kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH next v5 2/2] dt-bindings: i2c: add entry for
 hisilicon,hisi-i2c
Message-ID: <20220926194243.GA2650435-robh@kernel.org>
References: <20220920072215.161331-1-chenweilong@huawei.com>
 <20220920072215.161331-2-chenweilong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920072215.161331-2-chenweilong@huawei.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Sep 20, 2022 at 03:22:15PM +0800, Weilong Chen wrote:
> Add the new compatible for HiSilicon common i2c.
> 
> Signed-off-by: Weilong Chen <chenweilong@huawei.com>
> ---
> Change since v4:
> - Add description for SoC specific compatibles.

A description is not sufficient. A single compatible is saying all SoCs 
have exactly the same features and bugs.

> - Use the clock binding.
> - Fix decimal, space, case, unused labels.
> Link: https://lore.kernel.org/lkml/20220909074842.281232-1-chenweilong@huawei.com/T/#m4e1c915ead04f4e2e48d69131053a966801625db
> 
>  .../bindings/i2c/hisilicon,hisi-i2c.yaml      | 72 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.yaml b/Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.yaml
> new file mode 100644
> index 000000000000..b06eb8cb88bc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.yaml
> @@ -0,0 +1,72 @@
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

Needs to be a name and email.

> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: hisilicon,hisi-i2c
> +    description:
> +      The HiSilicon common IIC controller can be used for many different
> +      types of SoC such as Huawei Ascend AI series chips. We use the common
> +      string (hisi) for specific compatibles to avoid confusion caused by a
> +      lot of different names.
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
> +      compatible = "hisilicon,hisi-i2c";
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
> index d213a831133f..4c928a444e4b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9155,6 +9155,7 @@ L:	linux-i2c@vger.kernel.org
>  S:	Maintained
>  W:	https://www.hisilicon.com
>  F:	drivers/i2c/busses/i2c-hisi.c
> +F:	Documentation/devicetree/bindings/i2c/hisilicon,hisi-i2c.yaml
>  
>  HISILICON LPC BUS DRIVER
>  M:	john.garry@huawei.com
> -- 
> 2.31.GIT
> 
> 

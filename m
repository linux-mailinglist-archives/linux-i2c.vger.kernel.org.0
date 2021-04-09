Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC10335A371
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Apr 2021 18:33:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233896AbhDIQdb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Apr 2021 12:33:31 -0400
Received: from mail-oi1-f178.google.com ([209.85.167.178]:46005 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232796AbhDIQd3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Apr 2021 12:33:29 -0400
Received: by mail-oi1-f178.google.com with SMTP id d12so6316350oiw.12;
        Fri, 09 Apr 2021 09:33:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WX24hTh19GWrclK+Aaotm/JHmM9sFZrKJmRMWYv3PiM=;
        b=iIzYEVrlkaLiLZVX4R6RVXKw1z2UTnhoENqk489o6ZtbHYbkOsHGra9NLPiwL7PSY3
         KT9ITxDnxYio2gHrSRbc8njy5QOThsaTEjdcTaRvlgVmJuYyeUb7THnnY5oudJbG+uHh
         KbqLSHMo84gWuiJ+rThZXtM8ZFNG8KCVBDqdqUtvYFXympmZQqe8L/Uml7pC9LiZZ/Mk
         J0k4p5hrFDzPF9OF+tBqYeBQ5/gk0vbJ1gqc/07IRof0u9unLzHxTyh8IkbXjBPK5B4H
         SF/gcacB9aikaXum2cw9mZh365vS3jTEeIEgSb/HHJSWqfLNFQv7mNmkwvXpW0Tq8/7/
         TxnA==
X-Gm-Message-State: AOAM530Cx/RZg8VSmp91/ItyIWC6+MCCwuQgMS8xR3oaLLh9frXLmd0N
        UdvjmYG8ou+aI4ahcyZeBA==
X-Google-Smtp-Source: ABdhPJxOPVazcfAvZNhAXnhribnx0KTP/8fznYpFWK+c/T/lN1HXo1dBaQsSts8xWbEld3FOpxdOhA==
X-Received: by 2002:a05:6808:8f6:: with SMTP id d22mr5315438oic.52.1617985995838;
        Fri, 09 Apr 2021 09:33:15 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x25sm679853oto.72.2021.04.09.09.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 09:33:15 -0700 (PDT)
Received: (nullmailer pid 3768891 invoked by uid 1000);
        Fri, 09 Apr 2021 16:33:13 -0000
Date:   Fri, 9 Apr 2021 11:33:13 -0500
From:   Rob Herring <robh@kernel.org>
To:     Clark Wang <xiaoning.wang@nxp.com>
Cc:     aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, kernel@pengutronix.de, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 15/18] dt-bindings: i2c: imx-lpi2c: Add dma
 configuration example
Message-ID: <20210409163313.GA3750926@robh.at.kernel.org>
References: <20210406113306.2633595-1-xiaoning.wang@nxp.com>
 <20210406113306.2633595-16-xiaoning.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210406113306.2633595-16-xiaoning.wang@nxp.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 06, 2021 at 07:33:03PM +0800, Clark Wang wrote:
> Add i2c bus dma mode configuration example.
> 
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> ---
> V2 changes:
>  - New patch added in V2
> ---
>  .../devicetree/bindings/i2c/i2c-imx-lpi2c.yaml       | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
> index 0a4b28827dcc..3868fec0cf27 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
> @@ -51,6 +51,16 @@ properties:
>    sda-gpios:
>      maxItems: 1
>  
> +  dmas:
> +    minItems: 2
> +    maxItems: 2
> +
> +  dma-names:
> +    minItems: 2
> +    maxItems: 2
> +    items:
> +      enum: [ "tx", "rx" ]

Please define the order:

items:
  - const: tx
  - const: rx

> +
>  required:
>    - compatible
>    - reg
> @@ -75,4 +85,6 @@ examples:
>          pinctrl-1 = <&pinctrl_i2c_recovery>;
>          scl-gpios = <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>          sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +        dmas = <&edma1 0 16>, <&edma1 0 15>;
> +        dma-names = "tx","rx";
>      };
> -- 
> 2.25.1
> 

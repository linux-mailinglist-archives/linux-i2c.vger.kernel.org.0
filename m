Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4885042E25C
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Oct 2021 22:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230495AbhJNUFS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Oct 2021 16:05:18 -0400
Received: from mail-oo1-f54.google.com ([209.85.161.54]:36651 "EHLO
        mail-oo1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229932AbhJNUFR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Oct 2021 16:05:17 -0400
Received: by mail-oo1-f54.google.com with SMTP id r1-20020a4a9641000000b002b6b55007bfso2273719ooi.3;
        Thu, 14 Oct 2021 13:03:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b35/8Ly81aRobPFM7Pcaw78v/nOqpcRxlYIlEx7HFJo=;
        b=MSQYITueUrPQBRu+DL0FtdeRNhCJz2BpTVpH3JVO+3f1o5NBRuMImx17UYIBAQxvPc
         vQoPCMDgIlm5ut9/3J6kef900ySGzQCrjR7mWfhDWgJijIyg6KlWnFASyPBHCADwi6Oq
         H8ZYfK5shQNb+po8Tl2BOgjNZT8e4Kv8EPwO8AoJbF1efoCI9VPFTES+vicVZ34bB35/
         4WambRASH+C1pG6Sjd0vA0RWirVNTdzPfr81z9jRaHW4mP9VINDC2mHVVG5I4LIQf7lI
         f3mynPBfluHSuEFKY/emRU0PrE9rqA2xQBC1P2rwPjjpnTFw1tpCfNflBr9tZlGpTxo9
         47eA==
X-Gm-Message-State: AOAM530PlxE/tv3ZgytBl561qdIzmBOnYVmQEIo4MSEi8I6OEL/HOyqZ
        N3ebJWz0JeZwmP1QK89YWQ==
X-Google-Smtp-Source: ABdhPJwQ1D56h0+99QK5rctU0LO6xxcARbxttiJxE/IIR2/MraNZS+xeHh6+CZPuANHxJWNLrdle/A==
X-Received: by 2002:a4a:a3c8:: with SMTP id t8mr5752668ool.2.1634241791805;
        Thu, 14 Oct 2021 13:03:11 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 103sm758936otj.44.2021.10.14.13.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 13:03:11 -0700 (PDT)
Received: (nullmailer pid 3828063 invoked by uid 1000);
        Thu, 14 Oct 2021 20:03:10 -0000
Date:   Thu, 14 Oct 2021 15:03:10 -0500
From:   Rob Herring <robh@kernel.org>
To:     Abel Vesa <abel.vesa@nxp.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 10/11] dt-bindings: i2c: imx-lpi2c: Add i.MX8DXL
 compatible match
Message-ID: <YWiM/vn8RPR1J9+r@robh.at.kernel.org>
References: <1633526764-30151-1-git-send-email-abel.vesa@nxp.com>
 <1633526764-30151-11-git-send-email-abel.vesa@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1633526764-30151-11-git-send-email-abel.vesa@nxp.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Oct 06, 2021 at 04:26:03PM +0300, Abel Vesa wrote:
> Add i.MX8DXL lpi2c compatible to the bindings documentation.
> 
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
> index acf2d5f45f4e..f277b4de5344 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
> @@ -17,10 +17,12 @@ properties:
>      oneOf:
>        - enum:
>            - fsl,imx7ulp-lpi2c
> +          - fsl,imx8dxl-lpi2c
>            - fsl,imx8qm-lpi2c
>            - fsl,imx8qxp-lpi2c
>        - items:
>            - enum:
> +              - fsl,imx8dxl-lpi2c

Nope. Adding in both spots is wrong.

>                - fsl,imx8qm-lpi2c
>                - fsl,imx8qxp-lpi2c
>            - const: fsl,imx7ulp-lpi2c
> -- 
> 2.31.1
> 
> 

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C55B42E257
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Oct 2021 22:02:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232647AbhJNUE1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Oct 2021 16:04:27 -0400
Received: from mail-oi1-f175.google.com ([209.85.167.175]:38631 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230495AbhJNUE0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Oct 2021 16:04:26 -0400
Received: by mail-oi1-f175.google.com with SMTP id t4so9944444oie.5;
        Thu, 14 Oct 2021 13:02:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g4HNNfUuMfqGW0wCEtDz9pypLfcfO76bsX3obswXY14=;
        b=R6D9NrhQ5aC8BWghbAzpJcdqPflSjA4IfIksercilJc7yqxL8FbFHjmsCok/LJ5B61
         Ssxod+VhwY7VOpklQ7st/XRuaS8Mo7slwzwJDA/uujNH/VvYIZurGqjMnDSPGVM9Jqgm
         R/+3xfkh2wCsZgn6yw3Y3XvFpodWcwFkzkHZqaL7uY1o2KWsVZjEn7iLyoSgpWiQtE13
         P4l0p+8cobjC+q4nTPJ35Slh3fF5+rG4rmcLE4YiCZZ+Z+QTeIPCymYN8JoR9eJKYoaN
         VYsBWyf1by/u+F+7TfGauCgpZaD+gQ8MwPffb07FOTgJbOfquWgTTRVcD1xblKjfHFKt
         Uffg==
X-Gm-Message-State: AOAM532jSF29f19CG6BHH1WlXkV01y0O+uA7YVgGuQDnojowE+BpYcmV
        RIblXg1laR9SWPDALami2Q==
X-Google-Smtp-Source: ABdhPJy7/LDJJU9kPykK7ghU9aMT63q/w6ejiedfSbkkQBN7DVZGbRVmx7Ei6ySo7QX3FZpT3ypAqw==
X-Received: by 2002:aca:3656:: with SMTP id d83mr14456939oia.176.1634241740946;
        Thu, 14 Oct 2021 13:02:20 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id e25sm612967oot.38.2021.10.14.13.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 13:02:20 -0700 (PDT)
Received: (nullmailer pid 3826470 invoked by uid 1000);
        Thu, 14 Oct 2021 20:02:19 -0000
Date:   Thu, 14 Oct 2021 15:02:19 -0500
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
Subject: Re: [PATCH v3 09/11] dt-bindings: i2c: i2c-imx-lpi2c: Fix dtbs_check
 compatible oneOf error
Message-ID: <YWiMy5J/J/dxmkY4@robh.at.kernel.org>
References: <1633526764-30151-1-git-send-email-abel.vesa@nxp.com>
 <1633526764-30151-10-git-send-email-abel.vesa@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1633526764-30151-10-git-send-email-abel.vesa@nxp.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Oct 06, 2021 at 04:26:02PM +0300, Abel Vesa wrote:
> Fix following dtbs_check error:
> 
> arch/arm64/boot/dts/freescale/imx8qm-mek.dt.yaml:
> i2c@5a800000: compatible: 'oneOf' conditional failed, one must be fixed:
>         ['fsl,imx8qm-lpi2c', 'fsl,imx7ulp-lpi2c'] is too long
>         Additional items are not allowed ('fsl,imx7ulp-lpi2c' was
> unexpected)
>         'fsl,imx8qxp-lpi2c' was expected
>         From schema:
> Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
> 
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
> index 29b9447f3b84..acf2d5f45f4e 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
> @@ -18,8 +18,11 @@ properties:
>        - enum:
>            - fsl,imx7ulp-lpi2c
>            - fsl,imx8qm-lpi2c
> +          - fsl,imx8qxp-lpi2c

Both with and without a fallback should not be valid.

Why are you changing fsl,imx8qxp-lpi2c when the error was for 
fsl,imx8qm-lpi2c?

>        - items:
> -          - const: fsl,imx8qxp-lpi2c
> +          - enum:
> +              - fsl,imx8qm-lpi2c
> +              - fsl,imx8qxp-lpi2c
>            - const: fsl,imx7ulp-lpi2c
>  
>    reg:
> -- 
> 2.31.1
> 
> 

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D48A8456735
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Nov 2021 02:04:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232312AbhKSBHH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Nov 2021 20:07:07 -0500
Received: from mail-ot1-f41.google.com ([209.85.210.41]:39888 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230133AbhKSBHG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Nov 2021 20:07:06 -0500
Received: by mail-ot1-f41.google.com with SMTP id r10-20020a056830080a00b0055c8fd2cebdso14145343ots.6;
        Thu, 18 Nov 2021 17:04:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=v917wAgzhWr2HX1sCSNueTi9WROJRtpV947wxT/gCV4=;
        b=7Q+fnu2f5svckYVosDafST+AL1l7FECkPVud/tA4zYB9bv3XztZUSRklWBbXRGqtgJ
         hdCoudlv/mpLzDbI04D3mLTuCQhAc/LjqnWAZQfoAnXE8E61Q1fPaL5vk4LKuuZXMF1w
         cxDEn1jkP4BrB5uyx166i8r+pImxDyFExPad+2w/t+F+5baVun/HwxuP4vhWlg1eELJL
         xQRFlBRbCK5QafqSgC9eXaAMEGDbBzT0dXgyVQmkzUIQbOQeNv76nKcIRdl5rsC/W/2Z
         GNL1wCgYZ2h3UjYAHCN/7vlv1YxAFDO1kAMwNVmrt0VuIzVQxD72cyR3JYoKZV9tU6s6
         X9Xg==
X-Gm-Message-State: AOAM530cF4wxPWGHd0zc1CK4q6vl+8dYP4FGEDiQVLo+dpZOba5O+MC3
        QIgWQgNq+sbUFA5bwHlKHA==
X-Google-Smtp-Source: ABdhPJzT4HF64KJ/W7x22WnoWZt3RmG6X26Hyge4RAK7kStsVzG/azanpwHaxBYlSirwF+K2Q92CKw==
X-Received: by 2002:a9d:3cc:: with SMTP id f70mr1304438otf.253.1637283845501;
        Thu, 18 Nov 2021 17:04:05 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id j14sm392504oil.43.2021.11.18.17.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 17:04:04 -0800 (PST)
Received: (nullmailer pid 2143262 invoked by uid 1000);
        Fri, 19 Nov 2021 01:04:04 -0000
Date:   Thu, 18 Nov 2021 19:04:04 -0600
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
Subject: Re: [PATCH v4 12/12] dt-bindings: serial: fsl-lpuart: Add i.MX8DXL
 compatible
Message-ID: <YZb4BClv4fXU65yz@robh.at.kernel.org>
References: <1636566415-22750-1-git-send-email-abel.vesa@nxp.com>
 <1636566415-22750-13-git-send-email-abel.vesa@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1636566415-22750-13-git-send-email-abel.vesa@nxp.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Nov 10, 2021 at 07:46:55PM +0200, Abel Vesa wrote:
> Add i.MX8DXL lpuart compatible to the bindings documentation.
> 
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> ---
>  Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> index dc1f0e07cbd4..fa8a602ccb22 100644
> --- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> +++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> @@ -27,6 +27,10 @@ properties:
>        - items:
>            - const: fsl,imx8qm-lpuart
>            - const: fsl,imx8qxp-lpuart
> +      - items:
> +          - const: fsl,imx8dxl-lpuart
> +          - const: fsl,imx8qxp-lpuart
> +          - const: fsl,imx7ulp-lpuart

I'm confused why 8dxl is compatible with 7ulp, but 8qm is not? From the 
driver, it looks like the difference is clocks.

>  
>    reg:
>      maxItems: 1
> -- 
> 2.31.1
> 
> 

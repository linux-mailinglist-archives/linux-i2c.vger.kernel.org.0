Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 808B742E261
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Oct 2021 22:04:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233742AbhJNUGn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Oct 2021 16:06:43 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:45867 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229932AbhJNUGn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Oct 2021 16:06:43 -0400
Received: by mail-ot1-f42.google.com with SMTP id l16-20020a9d6a90000000b0054e7ab56f27so9740157otq.12;
        Thu, 14 Oct 2021 13:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gbYub33Z91e1QS79cd7omO33DSQ85uKXQk88sxDuHRo=;
        b=1nbehc6lsQTFSMgzJhqHH1xBSMS+TY2DFJU2svaV7b8z0pg+ErK47ExJ0THzYmOCjv
         CNAyocc0EAhi6F+LSqGvI/Kzo0ywiu1j5esMM94S82tLAylhRDqYiNhHrjTDenDEIJrh
         dt1g74HN7JWjQbTZu+x/h7+b2u20LziMDbK1hvndGhxdIIbWikezc+/u0rcsVxDsLXbU
         5ob91O44zz6Q7f4cVuFq8DSKWoKy5mU061/tv+u1f8Z4BJ72cdfiKxeDzGOArne0NaYQ
         2YWtFL5fPXcSwfvekkWLCXhKS4jZW6jzCOXBCjQNAdiabu6rhaux57y7TxhsWoWhnUc5
         /JBA==
X-Gm-Message-State: AOAM532MTePYL610ZvXphya4p84ClR4XOQZc9K+oXkgUt+Hx77qEudNh
        rzYi31hM0TlQkF4zS8tJNw==
X-Google-Smtp-Source: ABdhPJyEZuDhUeC1wXYtsFMhBNQ+e7kVyhZEdS6H6Gd1iP1+azFmVrVZKD3F43EjhI4/xoqt25auqw==
X-Received: by 2002:a9d:8e1:: with SMTP id 88mr4367769otf.339.1634241877348;
        Thu, 14 Oct 2021 13:04:37 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id g29sm763533oic.27.2021.10.14.13.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 13:04:36 -0700 (PDT)
Received: (nullmailer pid 3830439 invoked by uid 1000);
        Thu, 14 Oct 2021 20:04:35 -0000
Date:   Thu, 14 Oct 2021 15:04:35 -0500
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
Subject: Re: [PATCH v3 11/11] dt-bindings: serial: fsl-lpuart: Add i.MX8DXL
 compatible
Message-ID: <YWiNUxP2rLat5T4p@robh.at.kernel.org>
References: <1633526764-30151-1-git-send-email-abel.vesa@nxp.com>
 <1633526764-30151-12-git-send-email-abel.vesa@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1633526764-30151-12-git-send-email-abel.vesa@nxp.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Oct 06, 2021 at 04:26:04PM +0300, Abel Vesa wrote:
> Add i.MX8DXL lpuart compatible to the bindings documentation.
> 
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> ---
>  Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> index a90c971b4f1f..d84bb33f3b4c 100644
> --- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> +++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> @@ -22,6 +22,7 @@ properties:
>            - fsl,imx7ulp-lpuart
>            - fsl,imx8qm-lpuart
>        - items:
> +          - const: fsl,imx8dxl-lpuart
>            - const: fsl,imx8qxp-lpuart
>            - const: fsl,imx7ulp-lpuart

If you needed to support:

compatible = "fsl,imx8qxp-lpuart", "fsl,imx7ulp-lpuart";

You just broke it.

Rob

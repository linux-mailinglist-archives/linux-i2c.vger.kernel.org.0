Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8272B45670E
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Nov 2021 01:54:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231949AbhKSA5j (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Nov 2021 19:57:39 -0500
Received: from mail-oi1-f169.google.com ([209.85.167.169]:43749 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229851AbhKSA5i (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Nov 2021 19:57:38 -0500
Received: by mail-oi1-f169.google.com with SMTP id o4so18266035oia.10;
        Thu, 18 Nov 2021 16:54:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NJ9HnG2UMCEE4biBm5ej/tJE9ReBS+RZcFUyPPeYoTY=;
        b=eRGN8v9Q14nixr42468lPZ9n9Pdf2iWXsyWhoo1gmVFuSoMdED3Weu4fMLwTiR0R9t
         zUk9aS/JN3Cb05bsjwjggeMY7pCBM8OVqH7bDoc8qApSk//I1a2Ss8k1+V8fK/xAyUUW
         wQSFtr5fqnm0PKZLG9pblriVBR7KzEEmOr+Z0VfUTqhqN9PkqMKioFVXL2bjyRQyAZzp
         8FPg+OEds/EhvE/mvEopEhC798aktxuhnY586oU+uxv7sLrFhzQcMMMWfgjK3UumCAga
         IVYDDUY7ghoC1RJt4x3iXpUQiG4i29L7kR2wdN+cG362Snn1S8AhWG6yK5ayOGGP5Od0
         GFCg==
X-Gm-Message-State: AOAM531h8DE4EL8XIbVAc7JgFjfBwbl5utWlPIkA65SnJpLMGnHREf4M
        1tAkD81xHYwtrJRvLDWeDA==
X-Google-Smtp-Source: ABdhPJxY4T9LF2F11iACJ3TIzLy6vgQ/UROqzyeIhb7PVJmARYDeMS8HZCif76ujP4ztygxu18BiBw==
X-Received: by 2002:a05:6808:11c8:: with SMTP id p8mr1273757oiv.72.1637283277541;
        Thu, 18 Nov 2021 16:54:37 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id b26sm256384oti.56.2021.11.18.16.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 16:54:36 -0800 (PST)
Received: (nullmailer pid 2126530 invoked by uid 1000);
        Fri, 19 Nov 2021 00:54:35 -0000
Date:   Thu, 18 Nov 2021 18:54:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     linux-i2c@vger.kernel.org, linux-imx@nxp.com,
        linux-watchdog@vger.kernel.org, linux@rempel-privat.de,
        linux-kernel@vger.kernel.org, aisheng.dong@nxp.com,
        linux-spi@vger.kernel.org, kernel@pengutronix.de,
        linux-serial@vger.kernel.org, robh+dt@kernel.org,
        linux-mmc@vger.kernel.org, festevam@gmail.com, shawnguo@kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux@roeck-us.net, ulf.hansson@linaro.org,
        daniel.lezcano@linaro.org, Peng Fan <peng.fan@nxp.com>,
        wim@linux-watchdog.org, Jacky Bai <ping.bai@nxp.com>,
        s.hauer@pengutronix.de, broonie@kernel.org
Subject: Re: [PATCH V5 8/9] arm64: dts: imx8ulp: Add the basic dtsi file for
 imx8ulp
Message-ID: <YZb1y5GpI7XPb/Ji@robh.at.kernel.org>
References: <20211112082930.3809351-1-peng.fan@oss.nxp.com>
 <20211112082930.3809351-9-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211112082930.3809351-9-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 12 Nov 2021 16:29:29 +0800, Peng Fan (OSS) wrote:
> From: Jacky Bai <ping.bai@nxp.com>
> 
> Add the basic dtsi support for i.MX8ULP.
> 
> i.MX 8ULP is part of the ULP family with emphasis on extreme
> low-power techniques using the 28 nm fully depleted silicon on
> insulator process. Like i.MX 7ULP, i.MX 8ULP continues to be
> based on asymmetric architecture, however will add a third DSP
> domain for advanced voice/audio capability and a Graphics domain
> where it is possible to access graphics resources from the
> application side or the realtime side.
> 
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> 
>   - v4
>    Fix build error after rebase
>    Drop usb nodes and alias, drop fec node
> 
>   - v3 changes:
>     no
> 
>   - v2 changes:
>     update the license
>     update the compatible property for usb related node
> 
>  .../boot/dts/freescale/imx8ulp-pinfunc.h      | 978 ++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    | 396 +++++++
>  2 files changed, 1374 insertions(+)
>  create mode 100755 arch/arm64/boot/dts/freescale/imx8ulp-pinfunc.h
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> 

Reviewed-by: Rob Herring <robh@kernel.org>

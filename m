Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C3F189751
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2019 08:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725923AbfHLGsQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Aug 2019 02:48:16 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:54903 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbfHLGsQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Aug 2019 02:48:16 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1hx47p-0006k9-HG; Mon, 12 Aug 2019 08:48:13 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1hx47n-00025n-RF; Mon, 12 Aug 2019 08:48:11 +0200
Date:   Mon, 12 Aug 2019 08:48:11 +0200
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Wolfram Sang <wsa@the-dreams.de>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        linux-i2c@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Chris Healy <cphealy@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>
Subject: Re: [PATCH v1] MAINTAINERS: i2c-imx: take over maintainership
Message-ID: <20190812064811.427cy7ahim54odkk@pengutronix.de>
References: <20190812050817.23279-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190812050817.23279-1-o.rempel@pengutronix.de>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Aug 12, 2019 at 07:08:17AM +0200, Oleksij Rempel wrote:
> I would like to maintain the i2c-imx driver. Since I work with
> different i.MX variants and have access to the hardware, I can spend
> some time on the reviewing of this driver.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e81e60bd7c26..ddc1cf5cb0b9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6441,6 +6441,14 @@ S:	Maintained
>  F:	drivers/perf/fsl_imx8_ddr_perf.c
>  F:	Documentation/devicetree/bindings/perf/fsl-imx-ddr.txt
>  
> +FREESCALE IMX I2C DRIVER
> +M:	Oleksij Rempel <o.rempel@pengutronix.de>
> +R:	Pengutronix Kernel Team <kernel@pengutronix.de>
> +L:	linux-i2c@vger.kernel.org
> +S:	Maintained
> +F:	drivers/i2c/busses/i2c-imx.c
> +F:	Documentation/devicetree/bindings/i2c/i2c-imx.txt
> +

Even without this patch the generic "ARM/FREESCALE IMX / MXC ARM
ARCHITECTURE" entry matches the i2c-imx driver. Maybe it is worth to
point that out in the commit log?

Other than that arch/arm/mach-imx/devices/platform-imx-i2c.c might be
related, but not sure this is still used at all.

Great you pick that up.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECD1D14577
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2019 09:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725851AbfEFHlR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 May 2019 03:41:17 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:47333 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbfEFHlO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 May 2019 03:41:14 -0400
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <sha@pengutronix.de>)
        id 1hNYFH-00044r-HR; Mon, 06 May 2019 09:41:07 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <sha@pengutronix.de>)
        id 1hNYFH-0007AF-12; Mon, 06 May 2019 09:41:07 +0200
Date:   Mon, 6 May 2019 09:41:07 +0200
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     Chuanhua Han <chuanhua.han@nxp.com>
Cc:     shawnguo@kernel.org, leoyang.li@nxp.com, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, festevam@gmail.com, linux-imx@nxp.com,
        wsa+renesas@sang-engineering.com, u.kleine-koenig@pengutronix.de,
        eha@deif.com, linux@rempel-privat.de, l.stach@pengutronix.de,
        peda@axentia.se, sumit.batra@nxp.com
Subject: Re: [PATCH 2/2] arm64: dts: fsl: ls1046a: Add the guts node in dts
Message-ID: <20190506074106.eqa7xhktn2vlmtio@pengutronix.de>
References: <20190430044719.30720-1-chuanhua.han@nxp.com>
 <20190430044719.30720-2-chuanhua.han@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190430044719.30720-2-chuanhua.han@nxp.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:38:31 up 48 days, 18:49, 81 users,  load average: 1.08, 1.22,
 1.26
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 30, 2019 at 12:47:19PM +0800, Chuanhua Han wrote:
> For NXP ls1046a SoC, the i2c clock needs to be configured with the
> appropriate bit of RCW, so we add the guts node (GUTS/DCFG global
> utilities block) for the driver to read.
> 
> Signed-off-by: Sumit Batra <sumit.batra@nxp.com>
> Signed-off-by: Chuanhua Han <chuanhua.han@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> index 373310e4c0ea..f88599df18bb 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> @@ -205,6 +205,11 @@
>  			status = "disabled";
>  		};
>  
> +		guts: global-utilities@1ee0000 {
> +			compatible = "fsl,qoriq-device-config";
> +			reg = <0x0 0x1ee0000 0x0 0x1000>;
> +		};

According to Documentation/devicetree/bindings/soc/fsl/guts.txt we have
the following compatibles:

        "fsl,qoriq-device-config-1.0"
        "fsl,qoriq-device-config-2.0"
        "fsl,<chip>-device-config"
        "fsl,<chip>-guts"

"fsl,qoriq-device-config" is none of them and I don't think you should
give this SoC specific thing a generic compatible.
"fsl,ls1046a-device-config" would be better.

Sascha


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

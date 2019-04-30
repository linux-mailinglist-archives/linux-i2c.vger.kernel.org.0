Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 160CCF09E
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2019 08:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbfD3Gif (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Apr 2019 02:38:35 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:39981 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726520AbfD3Gie (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Apr 2019 02:38:34 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1hLMPK-00082m-6Z; Tue, 30 Apr 2019 08:38:26 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1hLMPG-0001N4-Gz; Tue, 30 Apr 2019 08:38:22 +0200
Date:   Tue, 30 Apr 2019 08:38:22 +0200
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Chuanhua Han <chuanhua.han@nxp.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, leoyang.li@nxp.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com, festevam@gmail.com,
        wsa+renesas@sang-engineering.com, eha@deif.com,
        linux@rempel-privat.de, sumit.batra@nxp.com,
        l.stach@pengutronix.de, peda@axentia.se
Subject: Re: [PATCH 1/3] dt-bindings: i2c: add optional mul-value property to
 binding
Message-ID: <20190430063822.dk5nerqa2m36ua6x@pengutronix.de>
References: <20190430043242.29687-1-chuanhua.han@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190430043242.29687-1-chuanhua.han@nxp.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 30, 2019 at 12:32:40PM +0800, Chuanhua Han wrote:
> NXP Layerscape SoC have up to three MUL options available for all
> divider values, we choice of MUL determines the internal monitor rate
> of the I2C bus (SCL and SDA signals):
> A lower MUL value results in a higher sampling rate of the I2C signals.
> A higher MUL value results in a lower sampling rate of the I2C signals.
> 
> So in Optional properties we added our custom mul-value property in the
> binding to select which mul option for the device tree i2c controller
> node.
> 
> Signed-off-by: Chuanhua Han <chuanhua.han@nxp.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-imx.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx.txt b/Documentation/devicetree/bindings/i2c/i2c-imx.txt
> index b967544590e8..ba8e7b7b3fa8 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-imx.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-imx.txt
> @@ -18,6 +18,9 @@ Optional properties:
>  - sda-gpios: specify the gpio related to SDA pin
>  - pinctrl: add extra pinctrl to configure i2c pins to gpio function for i2c
>    bus recovery, call it "gpio" state
> +- mul-value: NXP Layerscape SoC have up to three MUL options available for
> +all I2C divider values, it describes which MUL we choose to use for the driver,
> +the values should be 1,2,4.

Indention is broken.

I wonder why this needs to be configurable on a per-machine/device
level. What is the trade-off?

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19F592FB483
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Jan 2021 09:49:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728777AbhASIsb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Jan 2021 03:48:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728349AbhASIs2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Jan 2021 03:48:28 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18403C061574
        for <linux-i2c@vger.kernel.org>; Tue, 19 Jan 2021 00:47:48 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1l1mfx-0000aa-Md; Tue, 19 Jan 2021 09:47:45 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1l1mfx-0006va-4A; Tue, 19 Jan 2021 09:47:45 +0100
Date:   Tue, 19 Jan 2021 09:47:45 +0100
To:     Fabio Estevam <festevam@gmail.com>
Cc:     linux@rempel-privat.de, wsa@kernel.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] i2c: imx: Remove unused .id_table support
Message-ID: <20210119084745.GS19063@pengutronix.de>
References: <20210119003148.1793614-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210119003148.1793614-1-festevam@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:41:42 up 47 days, 21:08, 85 users,  load average: 0.32, 0.17,
 0.15
User-Agent: Mutt/1.10.1 (2018-07-13)
From:   Sascha Hauer <sha@pengutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Fabio,

On Mon, Jan 18, 2021 at 09:31:47PM -0300, Fabio Estevam wrote:
> Since 5.10-rc1 i.MX is a devicetree-only platform and the existing
> .id_table support in this driver was only useful for old non-devicetree
> platforms.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/i2c/busses/i2c-imx.c | 20 +-------------------
>  1 file changed, 1 insertion(+), 19 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index c98529c76348..ebf66120c51e 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -233,19 +233,6 @@ static struct imx_i2c_hwdata vf610_i2c_hwdata = {
>  
>  };
>  
> -static const struct platform_device_id imx_i2c_devtype[] = {
> -	{
> -		.name = "imx1-i2c",
> -		.driver_data = (kernel_ulong_t)&imx1_i2c_hwdata,
> -	}, {

Please grep for the driver name instead of guessing that it is unused.
This driver is indeed used with platform binding in the coldfire
architecture.

Regards,
 Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

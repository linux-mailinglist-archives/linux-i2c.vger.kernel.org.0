Return-Path: <linux-i2c+bounces-8619-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BF08F9F746E
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 06:57:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C20131886217
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 05:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 938ED2165F7;
	Thu, 19 Dec 2024 05:55:24 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576E51F8ACD
	for <linux-i2c@vger.kernel.org>; Thu, 19 Dec 2024 05:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734587724; cv=none; b=bEahX3HzYlhBN/UWprmp9qx+HVbpuEnQ/rndDuTLUKxHRxyNBlbIpawU4EJvawrZZGoX+UmEJmvTQ8YHdo7UZ2f2v2kXXzIepA2roI8v4Nv1QylClTWbMpImE1FlY7yOR0H9lbvp1cPp3ihVEEnLoRKnrFhzClJYdawv8KXWuKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734587724; c=relaxed/simple;
	bh=c9jMDSK6MB2WUmBIXLwrNVjC9aBDwFici4TSo2IHYrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cdmvRF+2G6Qdtx+TZwzQ9gMWBgPiy3Gs6Mbde6DWpxKcSEsgArrFYrN9qXV58LXdLBljgD1Xgrwk87u8bkHkboSbP0ThE5eo2Q9A78ieukJ52XIqhc9cls2UEds2bgjMdJ38/oppnRWrgQ35DRHjI57zUkAdSVFKGsjprtNEcwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tO9V7-0008By-CH; Thu, 19 Dec 2024 06:55:09 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tO9V6-0049ds-0j;
	Thu, 19 Dec 2024 06:55:09 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tO9V6-008Mx6-2s;
	Thu, 19 Dec 2024 06:55:08 +0100
Date: Thu, 19 Dec 2024 06:55:08 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Carlos Song <carlos.song@nxp.com>
Cc: andi.shyti@kernel.org, frank.li@nxp.com, kernel@pengutronix.de,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Haibo Chen <haibo.chen@nxp.com>
Subject: Re: [PATCH v3] i2c: imx: add imx7d compatible string for applying
 errata ERR007805
Message-ID: <Z2O1PFr4ZQHXTsrX@pengutronix.de>
References: <20241218044238.143414-1-carlos.song@nxp.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241218044238.143414-1-carlos.song@nxp.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

On Wed, Dec 18, 2024 at 12:42:38PM +0800, Carlos Song wrote:
> Compatible string "fsl,imx7d-i2c" is not exited at i2c-imx driver
                                       do not exist?
> compatible string table, at the result, "fsl,imx21-i2c" will be
> matched, but it will cause errata ERR007805 not be applied in fact.
> 
> So Add "fsl,imx7d-i2c" compatible string in i2c-imx driver to apply
> the errata ERR007805(https://www.nxp.com/webapp/Download?colCode=
> IMX7DS_2N09P).

This link is not working, may be this one:
https://www.nxp.com/docs/en/errata/IMX7DS_3N09P.pdf

More practical is to include the erratum text with list of affected SoC
variants.

> "fsl,imx7d-i2c" already is documented in binding doc. This errata

s/errata/erratum

Errata is plural
Erratum is singular

> fix has been included in imx6_i2c_hwdata and it is the same in all
> I.MX6/7/8, so just reuse it.
> 

Please Fixes tag, this patch should go stable:
Fixes: 39c025721d70 ("i2c: imx: Implement errata ERR007805 or e7805 bus frequency limit")
Cc: stable@vger.kernel.org

> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

With fixes in the commit message you can add my:
Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>

> ---
> Change for V3:
> - No ACK, so resend this patch.
> Change for V2:
> - I have tried to fix this issue at imx7s.dtsi in V1, according to
>   the community suggestion, I make V2 patch for i2c-imx driver to
>   avoid updating the FDT to fix an errata. Discussion in V1:
>   Subject: [PATCH] ARM: dts: imx7s: change i2c compatible string for applying errata ERR007805
>   Message-ID: <20241021031148.2682015-1-carlos.song@nxp.com> (raw)
> ---
>  drivers/i2c/busses/i2c-imx.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 350346a7892c..9d5caa032c5c 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -335,6 +335,7 @@ static const struct of_device_id i2c_imx_dt_ids[] = {
>  	{ .compatible = "fsl,imx6sll-i2c", .data = &imx6_i2c_hwdata, },
>  	{ .compatible = "fsl,imx6sx-i2c", .data = &imx6_i2c_hwdata, },
>  	{ .compatible = "fsl,imx6ul-i2c", .data = &imx6_i2c_hwdata, },
> +	{ .compatible = "fsl,imx7d-i2c", .data = &imx6_i2c_hwdata, },
>  	{ .compatible = "fsl,imx7s-i2c", .data = &imx6_i2c_hwdata, },
>  	{ .compatible = "fsl,imx8mm-i2c", .data = &imx6_i2c_hwdata, },
>  	{ .compatible = "fsl,imx8mn-i2c", .data = &imx6_i2c_hwdata, },
> -- 
> 2.34.1
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


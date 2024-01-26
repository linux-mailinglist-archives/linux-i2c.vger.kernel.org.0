Return-Path: <linux-i2c+bounces-1452-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 757FC83D427
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 07:12:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05A90B2141A
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 06:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6028B1171E;
	Fri, 26 Jan 2024 06:07:36 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A905411711
	for <linux-i2c@vger.kernel.org>; Fri, 26 Jan 2024 06:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706249256; cv=none; b=ewz6S2zG8bRdmLHiMUT+n0ags8UuT0XRtFcTZ9Ev75gV3rvVANDGZ67DuifPmRxT1kFkgi9pl+KMns5xj3gEsBpnlLrKtmV68OH3Y/8XeLArQO4moieLI5fuOcvi6IGfpPV2mnfNeLa6GP25W3tkth1bJwL+iw5sxe0xPHfjMjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706249256; c=relaxed/simple;
	bh=HuHGp3d4m9h+723TGTSdEUd9edN48dSr2KiqSS8JsYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Slu2aja0N/a5w1AltlZ6p+qOnZW/M2qCkZLxGV2pvKkX4GmODzxQDFCEqOM+iiG7Yek7G2VSfURw6EfxtdKdm2IBe6lP1nCHXD7CR+vtmj09jLiMv3nDLsahRU6Q48yq+8v/Lp8dKwfP2Q/Fml4whP9/NqJqBpwNY+PqqFyx9CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1rTFN5-0006cg-5S; Fri, 26 Jan 2024 07:07:23 +0100
Received: from [2a0a:edc0:2:b01:1d::c0] (helo=ptx.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ore@pengutronix.de>)
	id 1rTFN1-002S0p-Ly; Fri, 26 Jan 2024 07:07:19 +0100
Received: from ore by ptx.whiteo.stw.pengutronix.de with local (Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1rTFN1-001rth-IN; Fri, 26 Jan 2024 07:07:19 +0100
Date: Fri, 26 Jan 2024 07:07:19 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Esben Haabendal <esben@geanix.com>
Cc: linux-i2c@vger.kernel.org,
	Gregor Herburger <gregor.herburger@ew.tq-group.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, linux-kernel@vger.kernel.org,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] i2c: imx: move to generic GPIO recovery
Message-ID: <20240126060719.GD381737@pengutronix.de>
References: <01abf8ccc0af74b4fb0124977ed6bdfb9d7107b6.1706190706.git.esben@geanix.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <01abf8ccc0af74b4fb0124977ed6bdfb9d7107b6.1706190706.git.esben@geanix.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

Hi,

On Thu, Jan 25, 2024 at 02:56:36PM +0100, Esben Haabendal wrote:
> Starting with
> commit 75820314de26 ("i2c: core: add generic I2C GPIO recovery")
> GPIO bus recovery is supported by the I2C core, so we can remove the
> driver implementation and use that one instead.
> 
> As a nice side-effect, pinctrl becomes optional, allowing bus recovery on
> LS1021A, which does not have such luxury, but can be wired up to use extra
> fixed GPIO pins.
> 
> Note: The previous error messages about bus recovery not being supported is
> dropped with this change. Given that it is perfectly possible to have platforms
> where bus recovery works without pinctrl support, I happen to work on one such,
> both error messages does not really make sense in those cases. And I don't see
> how to know if this is the case or not.
> 
> Signed-off-by: Esben Haabendal <esben@geanix.com>

Thank you for your work.

> ---
....
> +	struct i2c_bus_recovery_info *bri = &i2c_imx->rinfo;
>  
> -	dev_dbg(&pdev->dev, "using scl%s for recovery\n",
> -		rinfo->sda_gpiod ? ",sda" : "");
> +	bri->pinctrl = devm_pinctrl_get(&pdev->dev);
> +	if (IS_ERR(bri->pinctrl))
> +		return PTR_ERR(bri->pinctrl);

According to the commit message - "pinctrl becomes optional", but this
code stops probe if pinctrl will fail for one or another reason. I do
not see any place returning NULL on fail. Do I'm missing something?

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


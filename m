Return-Path: <linux-i2c+bounces-8638-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 843259F7B2B
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 13:23:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48DDB1883C74
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 12:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A944F221DAD;
	Thu, 19 Dec 2024 12:23:25 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C6533EA
	for <linux-i2c@vger.kernel.org>; Thu, 19 Dec 2024 12:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734611005; cv=none; b=Iw+xp8nb7I1hV6oHN7XuvigUruV133OKOBAQdePuAR8ZzqJLedRGNe6xmx1y2V/A3DODpckH7miftRyLCRRMH/dWKKNpfl9yOLUtX+ByAf9YnzNDQCHQBw34aLQZ81MFzzijlzcnsFdL3HkgVQauacf1HWu0kfH9VaFiG9yCBD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734611005; c=relaxed/simple;
	bh=nx/ClxoX/uva0K0jBMWBhjzkN2ZHZO0y8U0MBz9buis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M+iBSPvejMndH1WiOJjT9RFw4Hh/9U0ckiIoMoOSEIMn1xEEpdKX49NJf9NSmzXDtwQrcMmLVlaUxSgj/jJCtow2GIxSowjtuD4AHBKgOa54kLgsUpycPDahwiz7q2JtucMjaPPJnjeptshzjhPLyYTKTrP7rwudlhnmasWP4Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tOFYR-000535-OG; Thu, 19 Dec 2024 13:22:59 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tOFYQ-004CcC-2E;
	Thu, 19 Dec 2024 13:22:59 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tOFYR-008SaE-19;
	Thu, 19 Dec 2024 13:22:59 +0100
Date: Thu, 19 Dec 2024 13:22:59 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Carlos Song <carlos.song@nxp.com>, frank.li@nxp.com,
	kernel@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
	festevam@gmail.com, linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Clark Wang <xiaoning.wang@nxp.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v5] i2c: imx: support DMA defer probing
Message-ID: <Z2QQI2gJNLjI-fam@pengutronix.de>
References: <20241218043541.143194-1-carlos.song@nxp.com>
 <dhn3f2xpdpu757pizdhcksqiqo53szeh65gtmddfxfhotimh2z@dfxfpl3int53>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dhn3f2xpdpu757pizdhcksqiqo53szeh65gtmddfxfhotimh2z@dfxfpl3int53>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

On Thu, Dec 19, 2024 at 01:02:29PM +0100, Andi Shyti wrote:
> Hi Carlos,
> 
> > +	/*
> > +	 * Init DMA config if supported, -ENODEV means DMA not enabled at
> > +	 * this platform, that is not a real error, so just remind "only
> > +	 * PIO mode is used". If DMA is enabled, but meet error when request
> > +	 * DMA channel, error should be showed in probe error log. PIO mode
> > +	 * should be available regardless of DMA.
> > +	 */
> > +	ret = i2c_imx_dma_request(i2c_imx, phy_addr);
> > +	if (ret) {
> > +		if (ret == -EPROBE_DEFER)
> > +			goto clk_notifier_unregister;
> > +		else if (ret == -ENODEV)
> > +			dev_dbg(&pdev->dev, "Only use PIO mode\n");
> > +		else
> > +			dev_err_probe(&pdev->dev, ret, "Failed to setup DMA, only use PIO mode\n");
> 
> Just for understanding, should we quit in this last case, as
> well?
> 
> Before we were ignoring ENODEV and EPROBE_DEFER, but now you are
> making it clear that other failures like ENOMEM might happen.

Good point, dev_err_probe() would not print an error in case of EPROBE_DEFER,
but in this case we should only print error and continue with PIO.

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


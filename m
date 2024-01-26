Return-Path: <linux-i2c+bounces-1454-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 890B583D549
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 10:03:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B99C71C25A65
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 09:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B30625FF1E;
	Fri, 26 Jan 2024 07:43:28 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC4C5FBBE
	for <linux-i2c@vger.kernel.org>; Fri, 26 Jan 2024 07:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706255008; cv=none; b=Loop6OGjA8UziBfgyvYVEq7ULccc3x8K/0UhoTMZnGOzoWGnh0ggx30Rnw0Iu/WxTjwtH3lWChyGWDtnXKIPXZhMCLIT2KIH8wvmCWx0ssV4WF8kJLxwqp7dwzIMI7ibUNwHbpvYZc3Jn4JAzh1ZxlbHJUOCGTwoRQ1vIjMOR1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706255008; c=relaxed/simple;
	bh=bh4DnAIp844o0MAVMefmOG3k05BtVm3TzcLgj5nvm4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T/FrJGe50EeCrD8crcgKjme7/B127cAYhOXRllf4ZcaJ3NKerWUnwwgwy3KBySNeqLcMHfdUicTyK5XdTHxjwsyNGTCXDWPchcXly4uJzTJROSM5pJk1n97jBCI6RvS+74avChBB784K/oBbmBXHsJY3bDUbb6Mgd2jscgxXTsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1rTGru-0001Ke-Ir; Fri, 26 Jan 2024 08:43:18 +0100
Received: from [2a0a:edc0:2:b01:1d::c0] (helo=ptx.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ore@pengutronix.de>)
	id 1rTGrr-002Sf6-CF; Fri, 26 Jan 2024 08:43:15 +0100
Received: from ore by ptx.whiteo.stw.pengutronix.de with local (Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1rTGrr-001sXQ-9R; Fri, 26 Jan 2024 08:43:15 +0100
Date: Fri, 26 Jan 2024 08:43:15 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Esben Haabendal <esben@geanix.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
	Gregor Herburger <gregor.herburger@ew.tq-group.com>,
	linux-i2c@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	NXP Linux Team <linux-imx@nxp.com>
Subject: Re: [PATCH] i2c: imx: move to generic GPIO recovery
Message-ID: <20240126074315.GE381737@pengutronix.de>
References: <01abf8ccc0af74b4fb0124977ed6bdfb9d7107b6.1706190706.git.esben@geanix.com>
 <20240126060719.GD381737@pengutronix.de>
 <875xzgh7dr.fsf@geanix.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <875xzgh7dr.fsf@geanix.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

On Fri, Jan 26, 2024 at 08:38:08AM +0100, Esben Haabendal wrote:
> Oleksij Rempel <o.rempel@pengutronix.de> writes:
> 
> > ....
> >> +	struct i2c_bus_recovery_info *bri = &i2c_imx->rinfo;
> >>  
> >> -	dev_dbg(&pdev->dev, "using scl%s for recovery\n",
> >> -		rinfo->sda_gpiod ? ",sda" : "");
> >> +	bri->pinctrl = devm_pinctrl_get(&pdev->dev);
> >> +	if (IS_ERR(bri->pinctrl))
> >> +		return PTR_ERR(bri->pinctrl);
> >
> > According to the commit message - "pinctrl becomes optional", but this
> > code stops probe if pinctrl will fail for one or another reason. I do
> > not see any place returning NULL on fail. Do I'm missing something?
> 
> The caller, i2c_imx_probe(), does only check for -EPROBE_DEFER, and
> simply ignores any other error codes.
> 
> I assume it is on purpose, so any problems with initializing i2c
> recovery does not cause complete failure of the i2c controller, which
> seems sane to me.

Good point, this is what I overlooked :)

Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


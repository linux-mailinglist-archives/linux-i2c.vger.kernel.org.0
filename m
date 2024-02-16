Return-Path: <linux-i2c+bounces-1806-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 551AA8576DC
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 08:37:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10F84284804
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 07:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C5B0171B6;
	Fri, 16 Feb 2024 07:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GTRnjZLf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3039D14AB0;
	Fri, 16 Feb 2024 07:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708069011; cv=none; b=u/B74JbSSJZhW2w9wUdrF4vQWn5elGh8aN0sx9+ajgth8YmT5fwSvGCBYowJ4wvpkXSTik07udxQU9y3qtkWKF/CpbDbgUuTD6k3lMtokE2UQa6GHHGrjw61CK7KJoNePXvYY7ziLDV4QltG6/Q0+tLTJYRgNvYZ3S4uAJYLOqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708069011; c=relaxed/simple;
	bh=f8O5RfA11gnSkEMTAztpJrLXeJDtOAHp8CFzTBzu+lc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q16QICcUlv3ElwKXpTv50eQ+TBabCLKHkQFbET/YRipbg9+AaqqPKu+QGbLySrntSiPYN9auC9/ItzySA6MYAMo9oNp0ZAZBkBl4CXJsWtPSSlI0WTJiwMk7suFDzYq90XcqvBq5pASn8Ai2wsPaFPU9STHrDLJ4GYy5xcJZloU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GTRnjZLf; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4FD8924000B;
	Fri, 16 Feb 2024 07:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708069005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OceffZlD1lIRrksGFR8T20wExx5FlLvt5rO7c2PaCW0=;
	b=GTRnjZLfmc2MBgiM1Zf60+hsxmEgvJSAgGfpD3EUcdMGy67ksahC4u4bWw6gKe4BQLm9hS
	LSV9/i/SxXWbTXIqhaVJny94dwU7J7Isx8fOfAUKJFhgAgoCYOrmGsMTESGCeDB6JTGFIx
	q5CjZxup1yTajZRgaH2xgPhKjnLk2R2zInVEGgxJpobpIO5whKDl979ttmSKs20EC9Fekb
	QbuTDbEJbLinNt/aR2Gd7PolhTTx71myPFc0Qrt8WHYyWBLbc6YElGLJ1iqsVEV3vjBB/k
	Cm9HzvOLZsKgKefbLRhMbBSa+TJXzKMTB3VgMlVA5smCpuKtnfYMNLZP2B8axw==
Message-ID: <e009fda0-3dd1-4834-8dce-73756c1e32f6@bootlin.com>
Date: Fri, 16 Feb 2024 08:36:41 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/18] phy: cadence-torrent: add suspend and resume
 support
Content-Language: en-US
To: Andy Shevchenko <andy@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>,
 Haojian Zhuang <haojian.zhuang@linaro.org>, Vignesh R <vigneshr@ti.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Andi Shyti
 <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pci@vger.kernel.org, gregory.clement@bootlin.com,
 theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com, u-kumar1@ti.com
References: <20240102-j7200-pcie-s2r-v3-0-5c2e4a3fac1f@bootlin.com>
 <20240102-j7200-pcie-s2r-v3-14-5c2e4a3fac1f@bootlin.com>
 <Zc4x7kvFfBI2sb_E@smile.fi.intel.com>
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <Zc4x7kvFfBI2sb_E@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: thomas.richard@bootlin.com

On 2/15/24 16:46, Andy Shevchenko wrote:
>> +static int cdns_torrent_phy_suspend_noirq(struct device *dev)
>> +{
>> +	struct cdns_torrent_phy *cdns_phy = dev_get_drvdata(dev);
>> +	int i;
> 
> Why signed?

In the for loop below, the i variable is compared to
cdns_phy->nsubnodes, which is an int.

https://elixir.bootlin.com/linux/latest/source/drivers/phy/cadence/phy-cadence-torrent.c#L360

> 
>> +	reset_control_assert(cdns_phy->phy_rst);
>> +	reset_control_assert(cdns_phy->apb_rst);
>> +	for (i = 0; i < cdns_phy->nsubnodes; i++)
>> +		reset_control_assert(cdns_phy->phys[i].lnk_rst);
>> +
>> +	if (cdns_phy->already_configured)
>> +		cdns_phy->already_configured = 0;
>> +	else
>> +		clk_disable_unprepare(cdns_phy->clk);
>> +
>> +	return 0;
>> +}
>> +
>> +static int cdns_torrent_phy_resume_noirq(struct device *dev)
>> +{
>> +	struct cdns_torrent_phy *cdns_phy = dev_get_drvdata(dev);
>> +	int node = cdns_phy->nsubnodes;
>> +	int ret, i;
> 
> Ditto>

Same reason

>> +	ret = cdns_torrent_clk(cdns_phy);
>> +	if (ret)
>> +		goto clk_cleanup;
>> +
>> +	/* Enable APB */
>> +	reset_control_deassert(cdns_phy->apb_rst);
>> +
>> +	if (cdns_phy->nsubnodes > 1) {
>> +		ret = cdns_torrent_phy_configure_multilink(cdns_phy);
>> +		if (ret)
>> +			goto put_lnk_rst;
>> +	}
>> +
>> +	return 0;
>> +
>> +put_lnk_rst:
>> +	for (i = 0; i < node; i++)
>> +		reset_control_assert(cdns_phy->phys[i].lnk_rst);
>> +	reset_control_assert(cdns_phy->apb_rst);
>> +	clk_disable_unprepare(cdns_phy->clk);
>> +clk_cleanup:
>> +	cdns_torrent_clk_cleanup(cdns_phy);
>> +	return ret;
>> +}
> 
-- 
Thomas Richard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



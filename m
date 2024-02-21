Return-Path: <linux-i2c+bounces-1894-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C6485DB76
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 14:41:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F324283A34
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 13:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3424579953;
	Wed, 21 Feb 2024 13:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Qcj4zsH+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BABA78B4A;
	Wed, 21 Feb 2024 13:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708522894; cv=none; b=ChIDo3Mpu/YRiFbw7F6oc2gSnv9i+h/k5+xRfLyb6mV3uV7Dj7ARA27fKyZZPYf5f7y7t0qTD3MYEujNRra4VKPPgqLrq5iAwPyu5r1ZTjLMocKdEme4zobMMNQbhs6kbppf00ZA1rsxWu1SmTyzhQ3wZJ5VQZbQhzX2AwfQjQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708522894; c=relaxed/simple;
	bh=5W72ftqe+QlgdRvNBAPvGYPV4VKvtGrjgGhD5Xkh/Ws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pXbCWasUKAYptvSl6NAF6ilnRycKlwHm7NUKLChE8/urEDrvE1a1mv3BrUT2Q3ceWQrRP3Yfan8PFQmHP2rvc8sWRXDJLzg5zEAfgT1xVIqz+g2x2IIvvIl6ITQ645v6qiqCxgz63whF67vF69iDR2n0GcQeA4cZXIdACXHoHO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Qcj4zsH+; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E46DD40009;
	Wed, 21 Feb 2024 13:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708522883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HChv7AMFaSV60Wh6fSWATnd6gL2rY85Q3tCAwMqY42A=;
	b=Qcj4zsH+5m4yg0nj/CeFRq48awmMTU4BMthbaywS1PL69ZM6N8LSIp0O0Sgf6Rs20z+THm
	+d7AZmPS7tfde1Zu39+eYBeJ5ZN0GODxigMjV8NaO3vVWRfzd1wqotTv7b2awrqFFtSl++
	sCEusvP5+z6apuRg+dTZxq1xwpFtDjBi986kTruWgM17X1Jj9OubWE1M/dwBEhqHxzr3T6
	NoOeFGeKAPZf6Hn9XtVFkEEwfL5wxITnqbUqc02IiF8H35zdd0Rx0bMzE/lS8rVr8DyNa+
	p07Ld9yyRXcyRY5FS3OZbpK01KpWHiIV2t6hkZEZ/SJlCdsJaXi/2gkC4OK9MA==
Message-ID: <113b7f2e-1313-4ebf-a403-e5fcae8f01ca@bootlin.com>
Date: Wed, 21 Feb 2024 14:41:12 +0100
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
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Haojian Zhuang
 <haojian.zhuang@linaro.org>, Vignesh R <vigneshr@ti.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Andi Shyti
 <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pci@vger.kernel.org, gregory.clement@bootlin.com,
 theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com, u-kumar1@ti.com
References: <20240102-j7200-pcie-s2r-v3-0-5c2e4a3fac1f@bootlin.com>
 <20240102-j7200-pcie-s2r-v3-14-5c2e4a3fac1f@bootlin.com>
 <c105bfa8567f9e76731f2b018f4ca3176357204d.camel@pengutronix.de>
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <c105bfa8567f9e76731f2b018f4ca3176357204d.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.richard@bootlin.com

On 2/21/24 14:09, Philipp Zabel wrote:
> On Do, 2024-02-15 at 16:17 +0100, Thomas Richard wrote:
>> Add suspend and resume support.
>>
>> The already_configured flag is cleared during the suspend stage to force
>> the PHY initialization during the resume stage.
>>
>> Based on the work of Théo Lebrun <theo.lebrun@bootlin.com>
>>
>> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
>> ---
>>  drivers/phy/cadence/phy-cadence-torrent.c | 54 +++++++++++++++++++++++++++++++
>>  1 file changed, 54 insertions(+)
>>
>> diff --git a/drivers/phy/cadence/phy-cadence-torrent.c b/drivers/phy/cadence/phy-cadence-torrent.c
>> index 52cadca4c07b..f8945a11e7ca 100644
>> --- a/drivers/phy/cadence/phy-cadence-torrent.c
>> +++ b/drivers/phy/cadence/phy-cadence-torrent.c
>> @@ -3005,6 +3005,59 @@ static void cdns_torrent_phy_remove(struct platform_device *pdev)
>>  	cdns_torrent_clk_cleanup(cdns_phy);
>>  }
>>  
>> +static int cdns_torrent_phy_suspend_noirq(struct device *dev)
>> +{
>> +	struct cdns_torrent_phy *cdns_phy = dev_get_drvdata(dev);
>> +	int i;
>> +
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
>> +
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
> 
> The same cleanup is found in probe. Would it be cleaner to move this
> into cdns_torrent_phy_configure_multilink() instead of duplicating it
> here?

Hello Philipp,

Yes I could, but from my point of view, it would not be cleaner.
This cleanup is called from many places in the probe:
-
https://elixir.bootlin.com/linux/v6.8-rc5/source/drivers/phy/cadence/phy-cadence-torrent.c#L2948
-
https://elixir.bootlin.com/linux/v6.8-rc5/source/drivers/phy/cadence/phy-cadence-torrent.c#L2954
-
https://elixir.bootlin.com/linux/v6.8-rc5/source/drivers/phy/cadence/phy-cadence-torrent.c#L2960

If I add this cleanup in cdns_torrent_phy_configure_multilink(), yes I
could remove it from cdns_torrent_phy_resume_noirq(), but I should keep
it in the probe. And I should modify the probe to jump to clk_cleanup if
cdns_torrent_phy_configure_multilink() fails.

> 
>> +	reset_control_assert(cdns_phy->apb_rst);
>> +	clk_disable_unprepare(cdns_phy->clk);
>> +clk_cleanup:
>> +	cdns_torrent_clk_cleanup(cdns_phy);
> 
> This calls of_clk_del_provider(), seems misplaced here.

Yes you're right, it's called in cdns_torrent_phy_remove().
So I should not call it in the resume callback, this will cause some
issues during the remove.

Regards,

-- 
Thomas Richard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



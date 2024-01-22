Return-Path: <linux-i2c+bounces-1416-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0626083655C
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 15:28:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9800C1F21350
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 14:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A6A93D3AF;
	Mon, 22 Jan 2024 14:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Eo/4/GbP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5C93C488;
	Mon, 22 Jan 2024 14:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705933700; cv=none; b=FSKdqZl5aLFzMOrDNRnKC6Nl7sWb0qHULd0njzaG8RFdt9E1FbRT6gdf99N6omJwZwMFOBtJD5o+yUiwo3nREe1zwr7D6bNFb9YFw9JZWE1YlVQ7ZAtjtNawnYUPS3QStOzROKcXVKac8BQTslpt9s05FK+wJrZi8fKuYXBHG6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705933700; c=relaxed/simple;
	bh=cobDFEarhSrpaarf/hflxidRDBHdiSClIDCuWn2EHZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DwJtNaeIlnH9M5CI7aIkiWxU2S4u8qMh+cbC9FzM4FXZUnscw/UkxNw7QdwsjqQXwLKlpteNL0GN49Gi66HUFlM2gvYEjWnTCKaJM2UTKFOVbXVRA6s5Pmypkgt4y9KipmHYabgS7od464JAPzNFxi5RzZZ3MGR4DCgNOM004eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Eo/4/GbP; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8BA25C000B;
	Mon, 22 Jan 2024 14:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705933689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hUHwKKXyN83iQW+8ASCaMDdQ+1ucr+vrFhxoE1hk85s=;
	b=Eo/4/GbP6NNCg+QhObmRPD/F7PbEwojKkEc+ZqeTp2whemggtZ9XGLV0arqYTPmU3zEKBt
	t06b5DM+lTctrEpAzlwuUZEwEx4o7ZXF2rnrTHnCeUzCsmmgMwKVD5Yb/l+kKCYqgrV7Y/
	DqwdaLijb8hL8B2owHwWEVC+o8EDt46F5Yh2ZEFeIhaHmAADA9Qsj/PwoJE2Itqpgq4BFf
	IuEFB24TUpKpyiOnFztQ2Ystc+LWgI+9uA4y9Gw9D6jmnUptRbBGk9dFJytBKFFEncWyrE
	rGIfQqx9CiBFmORwpIlqIjIIVVtky6HM7KhZ3mHcE15YBa/lTTEVG3clfQNkZw==
Message-ID: <27eff12c-6d80-48e3-82b9-3a4aa90ce76c@bootlin.com>
Date: Mon, 22 Jan 2024 15:28:05 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/14] phy: cadence-torrent: add suspend and resume
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
 Tom Joseph <tjoseph@cadence.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pci@vger.kernel.org, gregory.clement@bootlin.com,
 theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com, u-kumar1@ti.com
References: <20240102-j7200-pcie-s2r-v1-0-84e55da52400@bootlin.com>
 <20240102-j7200-pcie-s2r-v1-11-84e55da52400@bootlin.com>
 <cf6440c08b8b7382e6693e18cdd29325aaea9cc9.camel@pengutronix.de>
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <cf6440c08b8b7382e6693e18cdd29325aaea9cc9.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.richard@bootlin.com

Hello Philipp,

On 1/17/24 16:12, Philipp Zabel wrote:
> Hi Thomas,
> 
> On Mo, 2024-01-15 at 17:14 +0100, Thomas Richard wrote:
>> Add suspend and resume support.
>> The alread_configured flag is cleared during suspend stage to force the
>> phy initialization during the resume stage.
>>
>> Based on the work of Théo Lebrun <theo.lebrun@bootlin.com>
>>
>> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
>> ---
>>  drivers/phy/cadence/phy-cadence-torrent.c | 57 +++++++++++++++++++++++++++++++
>>  1 file changed, 57 insertions(+)
>>
>> diff --git a/drivers/phy/cadence/phy-cadence-torrent.c b/drivers/phy/cadence/phy-cadence-torrent.c
>> index 70413fca5776..31b2594e5942 100644
>> --- a/drivers/phy/cadence/phy-cadence-torrent.c
>> +++ b/drivers/phy/cadence/phy-cadence-torrent.c
>> @@ -3006,6 +3006,62 @@ static void cdns_torrent_phy_remove(struct platform_device *pdev)
> [...]
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
>> +		reset_control_put(cdns_phy->phys[i].lnk_rst);
> 
> What is this intended to do? I expect this to explode in _remove, where
> the lnk_rst are put again. Should this be:
> 
> 		reset_control_assert(cdns_phy->phys[i].lnk_rst);
> 
> ?

Yes indeed, it's reset_control_assert instead of reset_control_put.

Thanks for the review.

Regards,

-- 
Thomas Richard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



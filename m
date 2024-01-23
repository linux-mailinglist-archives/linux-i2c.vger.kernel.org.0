Return-Path: <linux-i2c+bounces-1430-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6C78388B5
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jan 2024 09:20:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DA261F23BCE
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jan 2024 08:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC5156B65;
	Tue, 23 Jan 2024 08:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aBl1u3WK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9CF56768;
	Tue, 23 Jan 2024 08:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705998023; cv=none; b=PQ2v7hChx0MYxd2bMyGgN+yRP8OgZeW6wTxo2QN6NE3Rd42yccQAGKF2ttlyK8JZBry+z6dPkHFYXmwhIY6xIq5msZRz99H5YqCLBAvTDfDoFei5QqpYeB00QCSXTKpBPOEuP4PUri58sROq0hYHS71046OsjS+WKh0ek/SdONg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705998023; c=relaxed/simple;
	bh=8w+80Oj0dEeWrwkODQ7mQYpIvHywugtJ5h/IUiUyu0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WNpW4LbEsemrwmCilHdILlCqQWY+1CTyuq/wnN41oO8DwgZb78vUWVRJ0lkXWU0boPyWk4N5F8Ff5A4wKs7kvLhXNXaHH45Ttcv5/DYj2UJ43rwlL6E0vZovoKtvrQa0Q/NbK1ToZkviv00zYm00cLXqeq2KdxPORXiRx53Uz5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=aBl1u3WK; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 48FE360005;
	Tue, 23 Jan 2024 08:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705998012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hRb7TeIHk44yo6aUmwYhCI2i2ouU8zTc+wLvrMIpmr4=;
	b=aBl1u3WK+HzKOi12YlfomEPiXE7oEjgKgdx9VA4kJ607Zqrod7ESeoT2g8JjsJyFYARVSn
	8hqbBf0oCB1OO9XCYJ3b6msx1ODtd6kQ7Vay/Tdi6BA24BUi5FaTbbtBFHkTplj3lzkmZl
	bfkxBc0hTEk1hKVRwHEWMpi11uw5zt683rJdppYxfmIKeTti0ptM74oGMWiRGnDs77h6Y/
	kbZbcbW1GElFkmmQFze0Nrx4jgK01qfw99AtNBOnhPsRX/dUlhYpmcp6GJ9B8UcDZaBhSi
	Gn0nD1t7Ef5dFHw/aG5RzE8T4P2ifgrIZMFb4h1Tx4a20+06K+UVKPoynRFrQg==
Message-ID: <d005e3c5-08b3-4a4f-b1ed-e02bde82c2f9@bootlin.com>
Date: Tue, 23 Jan 2024 09:20:08 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/14] phy: ti: phy-j721e-wiz: make wiz_clock_init
 callable multiple times
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Haojian Zhuang
 <haojian.zhuang@linaro.org>, Vignesh R <vigneshr@ti.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Andi Shyti
 <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Tom Joseph <tjoseph@cadence.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pci@vger.kernel.org, gregory.clement@bootlin.com,
 theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com, u-kumar1@ti.com
References: <20240102-j7200-pcie-s2r-v1-0-84e55da52400@bootlin.com>
 <20240102-j7200-pcie-s2r-v1-5-84e55da52400@bootlin.com>
 <Za9oR8BpoufCRNIw@matsya>
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <Za9oR8BpoufCRNIw@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: thomas.richard@bootlin.com

>>  
>> -	ret = wiz_clock_init(wiz, node);
>> +	ret = wiz_clock_init(wiz, node, true);
> 
> You are calling it one once? So what am I missing

In patch 6/14, wiz_clock_init is called in resume_noirq callback:

ret = wiz_clock_init(wiz, node, false);

Regards

-- 
Thomas Richard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



Return-Path: <linux-i2c+bounces-9303-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 623B0A287DC
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Feb 2025 11:24:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C817816988F
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Feb 2025 10:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD7422AE75;
	Wed,  5 Feb 2025 10:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pXUBfIoL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906392063D8;
	Wed,  5 Feb 2025 10:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751033; cv=none; b=uCQg2HzfL1TL+DtEpaXtf1vVpJzNWZEV3ExaefmVvMPepn/TBjUte5v/37D+ZtCwuQZOK+KidIZCpiScK9gpqoupcXg260JlTBBFLaU12O7gBA+0a1slG4j62mRi8Bj4HIK7l8U2RmvhV0WtO8gZbFj2tL/Zx/ssZjNoVr9yjks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751033; c=relaxed/simple;
	bh=l8WUMCh4/bacxntxMeJpQkFivTbCQf82Fd87xLkpqaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eyedkiCT/O4K+Zw9NGYvQ2ok744E19GFjC1dEr48Fmmbqdk9bwWwQfygu6BmXd/KFCCNIjDOWIxNQ/4ZxAldWhgWq+a3gEeDnUD99YlUCabM9foiWldjeytPV82Bglv3JnugraYsgbh1u7KZhDmP3Jkv1E5rBBX+TeJG4RhSMPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pXUBfIoL; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B591520479;
	Wed,  5 Feb 2025 10:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738751027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OCgPDTwzHkVl8WwhlQzvIZcaXBEvz3BrPQEMI8PN0Po=;
	b=pXUBfIoL9X29WYaV553bYN5PrfgONgLKE0knP7SlKPqVv8uGlYh9Bxe9QxV2k630fFi61g
	8JRtqr1lglESNL4ldKtcPtWvovVbwaqyMR0Us/3eYh/dt/ecKtai3h5N+oQ8dALkZieMF8
	NrQ3XW6n0EHwPolG4QhWEa3bXAy4FEXlyvt8LHrEMEFJiqeryImqpOCzfjOAb0QT1kXH+F
	DVNnx+VR7FjW5+Y2NHaNxyO6fm+lRrj3Rg/HHOI5nfMjUf1aM4xPM0l6EYBbkGv9e/xKt4
	mntXL3TnTl67ISClR5aS1I3sPi67Gh/ZwRD0iAkDtq2PmS/01ZNjbIl8GXJEMQ==
Date: Wed, 5 Feb 2025 11:23:46 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, andi.shyti@kernel.org, mkl@pengutronix.de,
	mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, wqlinux@roeck-us.net, jdelvare@suse.com,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
	netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v6 7/7] rtc: Add Nuvoton NCT6694 RTC support
Message-ID: <20250205102214a6357365@mail.local>
References: <20250123091115.2079802-1-a0282524688@gmail.com>
 <20250123091115.2079802-8-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123091115.2079802-8-a0282524688@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfedvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeeiudeuteehhfekgeejveefhfeiudejuefhgfeljefgjeegkeeujeeugfehgefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemrggutdefmeegfheltgemfeefjehfmehffeefugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemrggutdefmeegfheltgemfeefjehfmehffeefugdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdegpdhrtghpthhtoheprgdtvdekvdehvdegieekkeesghhmrghilhdrtghomhdprhgtphhtthhopehtmhihuhdtsehnuhhvohhtohhnrdgtohhmpdhrtghpthhtoheplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhus
 hdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhklhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepmhgrihhlhhholhdrvhhinhgtvghnthesfigrnhgrughoohdrfhhr
X-GND-Sasl: alexandre.belloni@bootlin.com

On 23/01/2025 17:11:15+0800, Ming Yu wrote:
> +	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
> +					nct6694_irq, IRQF_ONESHOT,
> +					"rtc-nct6694", data);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to request irq\n");
> +
> +	ret = devm_rtc_register_device(data->rtc);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to register rtc\n");

This message is not necessary, all the error paths of
devm_rtc_register_device already print a message

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


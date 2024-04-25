Return-Path: <linux-i2c+bounces-3137-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDB48B1E40
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 11:42:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E68E0B270DF
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 09:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E1284E06;
	Thu, 25 Apr 2024 09:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HGckbk8E"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B650984D2C;
	Thu, 25 Apr 2024 09:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714038146; cv=none; b=KfBt17hStteMUL2N182zMpi9479ZcsH4EZKgczqOhjOWFqERxo17bSS0uQhXkD+86gDMTIBN9Q+5g/7gHvXU2pxEUt++kjuhkVSV6jxDvNcrYMtJGrtXvyq9x03F8e0M72DYmemHW9yrCCHggGY5nGNEjoSEA21NFjXonpAJOOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714038146; c=relaxed/simple;
	bh=F0WHKwSmgWiVv/5nuQeJXZbMjXxLKGdgzu5oruOJP+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ohr+jvCooB0aVk6THH2DFxaluwRTVOWBt9t8z4Is19CcSW64MFnAdbPbCW0HPfRAS2npHNd6MuTIXgbOzpwLCxKI9LC8QmbKq9Jm9rLapWHMXZhYjR4G+kyZ/Ril5IZTb/01goE1PD84A6boyRNm1XSgIuDyfo9rzlVGac2GviI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HGckbk8E; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C6B21BF206;
	Thu, 25 Apr 2024 09:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714038136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r3IJKX6YYOrWpRdOFBbgw2YGdZZtaDeVC9l9frr3qlM=;
	b=HGckbk8E/FnUpqauUFlW/BLyQd6u5rhkIC/Qnq3mXWzUv0BqcRm1UNi1ZwlqzpcR1lf5y+
	BZ0bd+V+rPX8/IitYi+rQMb8095bDihlh0QDkssdtANr3uQbj2beWTjSE2+pnIwSaRMvsw
	nG90Sbbd7TwwyFPzBfG+yl7kRQ6HpO0/l8g4oM7g09M22HukRXLOsM37mOy8dOXbg420ut
	qJVFTEQ2o3kDntr95ivu1D0Y6FwJEOC/HLVIXgbKwecvslRgn+eBrAgwCXTiItpmL1UxuA
	JInfxalOGUCmNPEp1J60asyhcvKZ3hRp3YUi/YHXBRljnICX4+zpVauMeEiYlg==
Message-ID: <5e52bbd6-d336-4101-8740-0f5cd759227b@bootlin.com>
Date: Thu, 25 Apr 2024 11:42:12 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add I2C support on TH1520
To: Conor Dooley <conor.dooley@microchip.com>
Cc: jszhang@kernel.org, guoren@kernel.org, wefu@redhat.com,
 andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, linux-riscv@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Drew Fustini <dfustini@tenstorrent.com>
References: <20240425082138.374445-1-thomas.bonnefille@bootlin.com>
 <20240425-boxcar-maroon-f07c5aba9272@wendy>
Content-Language: en-US
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
In-Reply-To: <20240425-boxcar-maroon-f07c5aba9272@wendy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: thomas.bonnefille@bootlin.com



On 4/25/24 11:00 AM, Conor Dooley wrote:
> On Thu, Apr 25, 2024 at 10:21:31AM +0200, Thomas Bonnefille wrote:
>> This adds I2C support in the device tree of the T-Head TH1520 RISCV-SoC
>> and a default configuration for the BeagleV-Ahead. It appears that the
>> TH1520 I2C is already supported in the upstream kernel through the
>> Synopsis Designware I2C adapter driver.
> 
>> As there is no clock driver for this board as of today, this patch
>> series uses a fixed-clock named i2c_ic_clk.
>> There is also no pinctrl driver yet so pinmux must be handled manually
>> for now.
> 
> https://lore.kernel.org/linux-riscv/20240103132852.298964-1-emil.renner.berthing@canonical.com/
> https://lore.kernel.org/linux-riscv/20240110-clk-th1520-v1-0-8b0682567984@tenstorrent.com/
> 
> These seem to be the most recent versions of each. I guess they're both
> just waiting for their authors to have the time to get another version
> written.

Yes, actually, I used Emil's patch with a custom pinctrl configuration 
to test the I2C. It appeared to be ready enough for my use.


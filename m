Return-Path: <linux-i2c+bounces-4600-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4159256EB
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2024 11:35:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBB7F1C22A69
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2024 09:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05EAC13D60F;
	Wed,  3 Jul 2024 09:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="M57Z6r6t"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26A61A28C;
	Wed,  3 Jul 2024 09:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719999328; cv=none; b=bjWl6oyAOZUK8rFfEyTVxgB8x6cD8jUL6GxzvRzPPG/cYV2gidlCXmD/7Iuo7kBTdfdZrQx0T1dhqfN/JUAz0zjQ97GyfFJx7Pc31GToytyRUhB5ERHH88B/XvXbRplldui+SRLG4DPkI6VnywAowPs1LeWE5n2y27LsPMP8wmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719999328; c=relaxed/simple;
	bh=hyxdXXEw+6VSTFplXOuf3m30k/fibz4guY5RiPbIDuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vu3D+AoxqQxlmJ5EF6biqDVY+ZlpQPNRlr+OiVekyO431bjxER9062f9wt/rAcXXpwef4pOtC2KwvPVWWPLeCf5ygfeRrFCWEHDRx9mKs6rEadCg9ZlKtzXYNlKBl0m5fDV+4DuY+uGX9xBr7XL6xjSf9I4Ms7TqiOyG29tAL5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=M57Z6r6t; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6600E240005;
	Wed,  3 Jul 2024 09:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719999324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vqzoLI1+yvmXy8VMaMNQtqCXe4bzPqUcV6pOw+4ir8s=;
	b=M57Z6r6tLC60owdSAu6dzlV3nZt/TGP/+zwMmMxEW/XXTE1vr4pDslTkJhk8H1suZpUTfq
	YTbwUP4BzczXwvBHBxo69cQy56ldCBDpAf2Q/ERCyJ6Ble3GPG45KqL7nWPhSOh+mhZJk+
	ccMqRKEnBp0eQyBNrKFmwBV9E0rcG40eWJQvs85twxFnidOzFTPgIdg0xZRNofbk1PsHzC
	YWcqs8L10ci5Sydv6MFkYAAUmS0Mntcdm5kD4l5I0zO53o/Buqg5wlGE8wP/rrFj248xhz
	lBdyFk+zZMh8I7L5QaaF2WDsVx0CaJv72BclvpcidXzUjkt97+KV5PQKywkAbQ==
Message-ID: <135887c3-4eac-4397-bad9-6bd0a03283de@bootlin.com>
Date: Wed, 3 Jul 2024 11:35:22 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] i2c: mux: gpio: Add 'settle-time-us' property
To: Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Peter Korsgaard <peter.korsgaard@barco.com>, Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Herve Codina <herve.codina@bootlin.com>,
 Christopher Cordahi <christophercordahi@nanometrics.ca>
References: <20240617120818.81237-1-bastien.curutchet@bootlin.com>
Content-Language: en-US
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
In-Reply-To: <20240617120818.81237-1-bastien.curutchet@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: bastien.curutchet@bootlin.com

Hi all,

On 6/17/24 14:08, Bastien Curutchet wrote:
> Hi all,
> 
> The i2c-gpio-mux can be used to describe a multiplexer built upon
> several i2c isolators having an enable pin (such as LTC4310):
> 
>   +---------------+                     +------+  +------+
>   | +-----------+ |                     | dev  |  | dev  |
>   | | GPIO_EN_A |-|-----------|         +------+  +------+
>   | +-----------+ |     +-----+---+         |         |
>   |               |  |--| isol. A |---------+---------+
>   |     +-----+   |  |  +---------+
>   | SOC | I2C |---|--|
>   |     +-----+   |  |  +---------+
>   |               |  |--| isol. B |------+---------+---------+
>   | +-----------+ |     +-----+---+      |         |         |
>   | | GPIO_EN_B |-|-----------|      +------+  +------+  +------+
>   | +-----------+ |                  | dev  |  | dev  |  | dev  |
>   +---------------+                  +------+  +------+  +------+
> 
> These isolators often need some time between their enable pin's
> assertion and the first i2c transfer. If the first i2c transfer
> happens before this enabling time is reached, transfer fails.
> 
> There is no available option to configure such a time in the
> i2c-gpio-mux driver.
> 
> Add a optional property in the bindings called 'transition-delay-us'.
> If present, driver waits for this delay every time a new bus is
> selected, i.e. before returning from the bus_select() callback.
> 
> Changes in v2:
>   * Rewrite bindings' commit log
>   * Express the 'transition delay' in us instead of ms
> 
> Changes in v3:
>   * Rename DT property to 'settle-time-us'
>   * Use fsleep instead of udelay
> 
> [v1] : https://lore.kernel.org/all/20240527113908.127893-1-bastien.curutchet@bootlin.com/
> [v2] : https://lore.kernel.org/all/20240529091739.10808-1-bastien.curutchet@bootlin.com/
> 

I don't think I've received any feedback since the bindings were 
reviewed by Krzysztof. Has anyone had a chance to look at this V3 
iteration yet?


Best regards,
Bastien


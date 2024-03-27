Return-Path: <linux-i2c+bounces-2637-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D081E88F364
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Mar 2024 01:02:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82F0A1F29B3C
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Mar 2024 00:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD90620;
	Thu, 28 Mar 2024 00:02:42 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from stcim.de (stcim.de [5.9.120.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07644368
	for <linux-i2c@vger.kernel.org>; Thu, 28 Mar 2024 00:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.9.120.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711584162; cv=none; b=rQaXFwIUgAWBovWzEP1pWkI0KIeXbaRcfqNbeyJz+bIPUp5/lO1A099ZDt5FxSC0qxtiispIAoDDbNRTs27+FvBBOqwmukE3nY2Hlucp6Zk9NcbDvWmEKeaWKxqvi257+jqXaqzrA+CYoAKNUJolF6mK/Rs3TC2Do4Zum4V083E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711584162; c=relaxed/simple;
	bh=Xs7Mc9qayoiqBeR1vCP7Qdxt/v5eN1DKNu/DkA30vy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Da9zechE7hlmdbHASYr8azHB9P/fDFbE/z4NBgsiVCN6wEoZtEAQkahBSlJGxjsEOdQNh+QGy4L8mAHh9vlyfOW/sR/sKHDAiG22Mq2my+yYgtaUXrYl8ZXiVIasp5bOEA/ivHhaENODQdH9x5JNO5z5/om1iRaKD/Q0wYE5gSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lengfeld.xyz; spf=pass smtp.mailfrom=lengfeld.xyz; arc=none smtp.client-ip=5.9.120.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lengfeld.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lengfeld.xyz
Received: from [146.0.107.31] (helo=porty)
	by stcim with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <stefan@lengfeld.xyz>)
	id 1rpclk-00BpMQ-1c;
	Thu, 28 Mar 2024 00:33:20 +0100
Date: Thu, 28 Mar 2024 00:33:19 +0100
From: Stefan Lengfeld <stefan@lengfeld.xyz>
To: Patryk <pbiel7@gmail.com>
Cc: linux-i2c@vger.kernel.org
Subject: Re: User userspace access to I2C device acquired by kernel driver
Message-ID: <20240327233319.qcst5ukbrq3j4j76@porty>
References: <CA+DkFDbsa2tApdHJGDos5jvD7Q3o4Px_O7RxVBqA07ffbWPiUA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+DkFDbsa2tApdHJGDos5jvD7Q3o4Px_O7RxVBqA07ffbWPiUA@mail.gmail.com>

Hi Patryk,

On Tue, Mar 26, 2024 at 01:26:10PM +0100, Patryk wrote:
> Suppose that I want to create a Kernel driver that will handle GPIO
> Expander and Interrupt controller parts whereas the watchdog
> functionality will be handled in Userspace using /sys/class/i2c-dev
> 
> Correct me if I'm wrong - but if the kernel driver claims that it
> handles the communication with a particular device, does it
> automatically prevent userspace programs from communicating with this
> device using i2c-dev?

Yes, if a device is claimed by a kernel driver, userspace cannot claim
it again. This prevents accidental usages of I2C devices from userspace.

> So splitting responsibilities between kernel and userspace which both
> handle the same physical device will not work, yes?

No, it can work. For the i2c-dev userspace API there exists the flag 

    #define I2C_SLAVE_FORCE	0x0706	/* Use this slave address, even if it
    				           is already in use by a driver! */

See https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/uapi/linux/i2c-dev.h#n29

So userspace can override the safety check and also use the I2C device,
by providing this flag.

> For me it makes sense because accessing the device that is already
> used by a kernel, from userspace might be unexpected by the kernel,
> however, I haven't found any solid confirmation (it may be my poor
> research though)

Yes, you can very easily mess things up, if a kernel driver and a
userspace driver uses the same device at once. It would require
carefully programming and coordination to make it work correctly and
robust. Nevertheless if you really really want it, you can do it.

But why? 

> Suppose that I have an I2C device (CPLD MAX10 with custom
> configuration) that implements the following functionalities:
> - GPIO Expander && Interrupt controller
> - Watchdog

It's possible and already done to implement a kernel watchdog driver and
combine all the functionalites (gpio expander, interrupt controller and
watchdog) in a multi-function device (MFD)[1],

Kind regards,
Stefan

[1]: https://bootlin.com/pub/conferences/2015/elce/belloni-mfd-regmap-syscon/belloni-mfd-regmap-syscon.pdf

-- 
website:     https://stefan.lengfeld.xyz/
pgp-key id:  0xE44A23B289092311
download:    https://stefan.lengfeld.xyz/key.gpg
fingerprint: CAFC B28D 1612 3A5C 2D31  45F0 E44A 23B2 8909 2311



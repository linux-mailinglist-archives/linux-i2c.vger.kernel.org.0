Return-Path: <linux-i2c+bounces-6811-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 319B697AC9B
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 10:09:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62458B2955D
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 08:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA915157488;
	Tue, 17 Sep 2024 08:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QJyC6IcX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D531156C70;
	Tue, 17 Sep 2024 08:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726560581; cv=none; b=M+2R+ROxGo41d9o6fTlPpJ0l7kRaQ3lswDE+m5r34AIWNPKIyUZnO3yHjTR9aXuqSx/tMDpMnvcH+H62rLCJC+i4gVQrv+LQhEGppqsWuQI+Q7BZ3EIrqnkDgWdRaoqmS3cK9JgM+owoJ5RzCalIQQXq/lHbUwolqGS4gPbXqXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726560581; c=relaxed/simple;
	bh=6s7C8hobD3fIYgLx8J4qWFbmevZAmpnrWRmu1pRVBTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZQLQHRt1JY0BYvAGoy6RfgPrx3VeNWSv6iwCtFyPeJZoDvXuxuMPUOvqVXpCZjQI2ng1uVF0UTxw9ubKpH/lrYOPymTtv4VcCc5/ugSdGnMWrj2M6rl4b/xB+31gwIrpWOe0spg9IgRjUf/9oFFAYmr/fvSn5t6b6dIPDkz6d5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QJyC6IcX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACC3FC4CEC6;
	Tue, 17 Sep 2024 08:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726560581;
	bh=6s7C8hobD3fIYgLx8J4qWFbmevZAmpnrWRmu1pRVBTA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QJyC6IcX1sm/0OS30slFVeEI3bzrgd4GDjjVWXPqBLYfX0uzsSejy2qcQHJayBaS8
	 YX1DqT+qmcpf35HK/oWtY5TlOJ52UMEKF2VQ6NXObGBkgQMlSwwfhuNiZBAzmvPjLG
	 j1gq4V7p6FM1e8LOE1zkWcIlkX+3y2A4WQ+XZzJKekx6PYVH9RcUk2fctzNz4p71p7
	 gQ8cQqg+69mcZsFUUiPqAbFeMEZ/c5c0ElNjPVJ9sjehSapBH7+IHTy52uB5xfhXVD
	 m5YkGvA2F2nG8Rsss5+plnfOKd5KcymxJKqILz66iDLhIxnknfWGaL/vK3KFnQAZCV
	 KLaJCTJ65l/2Q==
Date: Tue, 17 Sep 2024 09:09:35 +0100
From: Lee Jones <lee@kernel.org>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-watchdog@vger.kernel.org, thomas.petazzoni@bootlin.com,
	blake.vermeer@keysight.com
Subject: Re: [PATCH 1/5] mfd: add Congatec Board Controller mfd driver
Message-ID: <20240917080935.GC9955@google.com>
References: <20240503-congatec-board-controller-v1-0-fec5236270e7@bootlin.com>
 <20240503-congatec-board-controller-v1-1-fec5236270e7@bootlin.com>
 <20240822103858.GH6858@google.com>
 <9f29d904-e7ba-40fb-b5d8-1efeddf6f148@bootlin.com>
 <20240912141309.GC24460@google.com>
 <618cb281-9fec-471f-9e3d-c7a471f75a7a@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <618cb281-9fec-471f-9e3d-c7a471f75a7a@bootlin.com>

On Fri, 13 Sep 2024, Thomas Richard wrote:

> On 9/12/24 16:13, Lee Jones wrote:
> > On Tue, 10 Sep 2024, Thomas Richard wrote:
> > 
> >> On 8/22/24 12:38, Lee Jones wrote:
> >>> On Fri, 09 Aug 2024, Thomas Richard wrote:
> >>>
> >>>> Add core MFD driver for the Board Controller found on some Congatec SMARC
> >>>> module. This Board Controller provides functions like watchdog, GPIO, and
> >>>> I2C busses.
> >>>>
> >>>> This commit add support only for the conga-SA7 module.
> >>>>
> >>>> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> >>>> ---
> >>>>  drivers/mfd/Kconfig      |  12 ++
> >>>>  drivers/mfd/Makefile     |   1 +
> >>>>  drivers/mfd/cgbc-core.c  | 453 +++++++++++++++++++++++++++++++++++++++++++++++
> >>>>  include/linux/mfd/cgbc.h |  44 +++++
> >>>>  4 files changed, 510 insertions(+)
> >>>>
> >>>> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> >>>> index bc8be2e593b6..3e0530f30267 100644
> >>>> --- a/drivers/mfd/Kconfig
> >>>> +++ b/drivers/mfd/Kconfig
> >>>> @@ -224,6 +224,18 @@ config MFD_AXP20X_RSB
> >>>>  	  components like regulators or the PEK (Power Enable Key) under the
> >>>>  	  corresponding menus.
> >>>>  
> >>>> +config MFD_CGBC
> >>>> +	tristate "Congatec Board Controller"
> >>>> +	select MFD_CORE
> >>>> +	depends on X86
> >>>> +	help
> >>>> +	  This is the core driver of the Board Controller found on some Congatec
> >>>> +	  SMARC modules. The Board Controller provides functions like watchdog,
> >>>> +	  I2C busses, and GPIO controller.
> >>>> +
> >>>> +	  To compile this driver as a module, choose M here: the module will be
> >>>> +	  called cgbc-core.
> >>>> +
> >>>>  config MFD_CROS_EC_DEV
> >>>>  	tristate "ChromeOS Embedded Controller multifunction device"
> >>>>  	select MFD_CORE
> >>>> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> >>>> index 02b651cd7535..d5da3fcd691c 100644
> >>>> --- a/drivers/mfd/Makefile
> >>>> +++ b/drivers/mfd/Makefile
> >>>> @@ -13,6 +13,7 @@ obj-$(CONFIG_MFD_SM501)		+= sm501.o
> >>>>  obj-$(CONFIG_ARCH_BCM2835)	+= bcm2835-pm.o
> >>>>  obj-$(CONFIG_MFD_BCM590XX)	+= bcm590xx.o
> >>>>  obj-$(CONFIG_MFD_BD9571MWV)	+= bd9571mwv.o
> >>>> +obj-$(CONFIG_MFD_CGBC)		+= cgbc-core.o
> >>>>  obj-$(CONFIG_MFD_CROS_EC_DEV)	+= cros_ec_dev.o
> >>>>  obj-$(CONFIG_MFD_CS42L43)	+= cs42l43.o
> >>>>  obj-$(CONFIG_MFD_CS42L43_I2C)	+= cs42l43-i2c.o
> >>>> diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
> >>>> new file mode 100644
> >>>> index 000000000000..cca9b1170cc9
> >>>> --- /dev/null
> >>>> +++ b/drivers/mfd/cgbc-core.c
> >>>> @@ -0,0 +1,453 @@
> >>>> +// SPDX-License-Identifier: GPL-2.0-or-later
> >>>> +/*
> >>>> + * Congatec Board Controller MFD core driver.
> >>>
> >>> No such thing as an MFD.
> >>
> >> What should it be if it's not an MFD ?
> > 
> > You should be telling me this. :)
> > 
> > "Board Controller" according to the Kconfig entry.
> > 
> 
> This Congatec Board Controller is an external micro-controller that is
> interfaced with the CPU through a eSPI bus.
> This Board Controller provides multiple functions: an I2C controller, a
> GPIO controller, a watchdog and other not yet implemented functions
> (temp/voltage sensors, backlight).
> 
> Therefore, the MFD subsystem is a very good fit, as it allows to have a
> core driver that implements the communication with the external
> micro-controller, and then individual drivers for each of the functions
> offered by this Board Controller.

Sorry for the ambiguity, that was not the point of the review comment.

Please remove all mentions to MFD in the help/header text.

-- 
Lee Jones [李琼斯]


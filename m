Return-Path: <linux-i2c+bounces-6617-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCDD976BB0
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 16:13:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE3771F22EAF
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 14:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71A751B12DE;
	Thu, 12 Sep 2024 14:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OPgiSTgG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233F11A76D7;
	Thu, 12 Sep 2024 14:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726150395; cv=none; b=N+ISYwkZMFi8YUQ8xMbWtD98l/VHWJF0KBGRisLoM7xc3ywJgirGXU/kPOiH4CACe7gGjoDi8ajs05pHCrhopiGNJeAZt9J5I7kniEWcDEfgHou41N7YbHktPJ4mDKfWZYM0dXjWSaJyUAZRgeYmjUizAJx6O03vAljOBtRyQlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726150395; c=relaxed/simple;
	bh=kXjpfaVns/nj896PmdqGTjthglMvBn0iP0onDqfWyFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D5JLGcuXxb9SjfA6rld1rddaUwW59YJhm5mdIwYhtoWCqap2MnTrGjcSZIj0IUks7cTn1ghCskwg/ltas93Fqy8YhKIMUggxdy7sR2+dhIYJEi6y34FLws/sc3TuPEyLStoVC1Cs/9gSO4zwlhJU8dJVmlJsCVhIO8KNzW1aIcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OPgiSTgG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FF82C4CEC3;
	Thu, 12 Sep 2024 14:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726150394;
	bh=kXjpfaVns/nj896PmdqGTjthglMvBn0iP0onDqfWyFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OPgiSTgGaUKCv+MD5g0j23Ehs2YDDWS9ueOtTXIvEJBmoCnjyBpIbktmZPmPBcJDd
	 GUyW205/NFsQZ307bmnnHcrVl1IqURBvJ5aP2nvjYTDqpBLTARZsCLyO45OWlLQdGD
	 kxWzpJVhpe3EWaBuiL/prPJAuBD5CLxQTKElUNDZIgQCJonRGiz9hBic+1jivETG0w
	 ssxksQ5YqP+hA1K6qg+epvin90x4jlA8m608qpk3Mrs38FGGXJiblyWsdA4ext057W
	 e1JqJT7RSZavqQ/CrE30oYbEpKSF2I8vSF8DTD8puDuLLPeQRJ1jLE8UbQk0NTfdHa
	 VTLTsAlh+VoKg==
Date: Thu, 12 Sep 2024 15:13:09 +0100
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
Message-ID: <20240912141309.GC24460@google.com>
References: <20240503-congatec-board-controller-v1-0-fec5236270e7@bootlin.com>
 <20240503-congatec-board-controller-v1-1-fec5236270e7@bootlin.com>
 <20240822103858.GH6858@google.com>
 <9f29d904-e7ba-40fb-b5d8-1efeddf6f148@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9f29d904-e7ba-40fb-b5d8-1efeddf6f148@bootlin.com>

On Tue, 10 Sep 2024, Thomas Richard wrote:

> On 8/22/24 12:38, Lee Jones wrote:
> > On Fri, 09 Aug 2024, Thomas Richard wrote:
> > 
> >> Add core MFD driver for the Board Controller found on some Congatec SMARC
> >> module. This Board Controller provides functions like watchdog, GPIO, and
> >> I2C busses.
> >>
> >> This commit add support only for the conga-SA7 module.
> >>
> >> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> >> ---
> >>  drivers/mfd/Kconfig      |  12 ++
> >>  drivers/mfd/Makefile     |   1 +
> >>  drivers/mfd/cgbc-core.c  | 453 +++++++++++++++++++++++++++++++++++++++++++++++
> >>  include/linux/mfd/cgbc.h |  44 +++++
> >>  4 files changed, 510 insertions(+)
> >>
> >> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> >> index bc8be2e593b6..3e0530f30267 100644
> >> --- a/drivers/mfd/Kconfig
> >> +++ b/drivers/mfd/Kconfig
> >> @@ -224,6 +224,18 @@ config MFD_AXP20X_RSB
> >>  	  components like regulators or the PEK (Power Enable Key) under the
> >>  	  corresponding menus.
> >>  
> >> +config MFD_CGBC
> >> +	tristate "Congatec Board Controller"
> >> +	select MFD_CORE
> >> +	depends on X86
> >> +	help
> >> +	  This is the core driver of the Board Controller found on some Congatec
> >> +	  SMARC modules. The Board Controller provides functions like watchdog,
> >> +	  I2C busses, and GPIO controller.
> >> +
> >> +	  To compile this driver as a module, choose M here: the module will be
> >> +	  called cgbc-core.
> >> +
> >>  config MFD_CROS_EC_DEV
> >>  	tristate "ChromeOS Embedded Controller multifunction device"
> >>  	select MFD_CORE
> >> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> >> index 02b651cd7535..d5da3fcd691c 100644
> >> --- a/drivers/mfd/Makefile
> >> +++ b/drivers/mfd/Makefile
> >> @@ -13,6 +13,7 @@ obj-$(CONFIG_MFD_SM501)		+= sm501.o
> >>  obj-$(CONFIG_ARCH_BCM2835)	+= bcm2835-pm.o
> >>  obj-$(CONFIG_MFD_BCM590XX)	+= bcm590xx.o
> >>  obj-$(CONFIG_MFD_BD9571MWV)	+= bd9571mwv.o
> >> +obj-$(CONFIG_MFD_CGBC)		+= cgbc-core.o
> >>  obj-$(CONFIG_MFD_CROS_EC_DEV)	+= cros_ec_dev.o
> >>  obj-$(CONFIG_MFD_CS42L43)	+= cs42l43.o
> >>  obj-$(CONFIG_MFD_CS42L43_I2C)	+= cs42l43-i2c.o
> >> diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
> >> new file mode 100644
> >> index 000000000000..cca9b1170cc9
> >> --- /dev/null
> >> +++ b/drivers/mfd/cgbc-core.c
> >> @@ -0,0 +1,453 @@
> >> +// SPDX-License-Identifier: GPL-2.0-or-later
> >> +/*
> >> + * Congatec Board Controller MFD core driver.
> > 
> > No such thing as an MFD.
> 
> What should it be if it's not an MFD ?

You should be telling me this. :)

"Board Controller" according to the Kconfig entry.

> >> +static struct platform_device *cgbc_pdev;
> > 
> > No avoidable globals.
> 
> I don't see how can I have cgbc_pdev not global.

Because of the incestuous, "I am my own parent", thing?  Okay.

> >> +static void cgbc_session_release(struct cgbc_device_data *cgbc)
> >> +{
> >> +	if (cgbc_session_command(cgbc, cgbc->session) != cgbc->session)
> > 
> > What does this do?
> > 
> > Are we checking or doing something?  If the latter, then we shouldn't be
> > doing that in an if() statement.  If the former, then what's the point
> > of the function?
> 
> We try to close the session we opened with the device.
> We check that the session is closed correctly.

Please remove it from the if statement and store the result in variable
with suitable nomenclature please.

[...]

In future, please snip everything you do not wish to discuss.

> Thanks for the review !!

No problem.

-- 
Lee Jones [李琼斯]


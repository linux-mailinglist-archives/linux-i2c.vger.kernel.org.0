Return-Path: <linux-i2c+bounces-2832-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 813A289BE3E
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Apr 2024 13:42:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 370282830B0
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Apr 2024 11:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B855A69DEE;
	Mon,  8 Apr 2024 11:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RiTehVt7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4B253AC;
	Mon,  8 Apr 2024 11:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712576534; cv=none; b=koDjwQ8TCkuIbyhzEOr1dPVDT35cBnrYzPXaBstCxA8jLFc2pLdomL0KwjVAKZ7BeX3iU3xm3GFr1AKQp3olg0MTSs7FaYcMi9SFnWfF+e9IDe1EgHas0uuW0b6KLE6+/m0V9acbL900orgwGdSnu8mraBhgVqP0vVO3yk+dct8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712576534; c=relaxed/simple;
	bh=nNPSYahXleYlLrrINWryV7HMiMqL8rx38AhnCGE7+ZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=snk9cw6LoaIZk5endHl77nKf78/epS2Hqqzhbq7wsWhR82MHOKmfGCzfOPR2NokMO5Db8hImPGg8IHsdp4NpAObI2p5p/Pwj9TE3N7KjqN27FYmFtAlrGZxihkTi6b+d6BVS2RAVaktcYu1Y61W0rDyucd5SpT7OWMtlW99WGas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RiTehVt7; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1e3dda73192so8804475ad.3;
        Mon, 08 Apr 2024 04:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712576532; x=1713181332; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F7Q7LqhUOzgafb6Gz7z4EGohoVaiTS4bveRSGqzloyU=;
        b=RiTehVt73XAlkrDS1UpR8q/WAG+3HFc+iYV3C49tukBzQd/xDu/2BQesUeocjXJgFk
         vdq+3c/3FGZpmoXxbAWqsHDCIRAsqxvXr6la3l34NcRmRz3RH032ullyhR+eF98X1KGL
         3WQgW6l/JQbX9Y213P2FV5DR7neZSfzZUgiU6uDOywqMMJ5VK2lxt9OpOr1oFYXTIdRj
         j2yTvkkpsEvmMeo0ttAl0UVMCaheHdhLaHX2KbeGhH7eWmZ53kMg5IyFDgvFsD060IHu
         NEE4oqEAAeDq6gCMxJ3bZaYfhBdPwvGpZ3BUU2GEZqBaedrMKvYiaanIpAnBCtJ1qqgW
         JwIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712576532; x=1713181332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F7Q7LqhUOzgafb6Gz7z4EGohoVaiTS4bveRSGqzloyU=;
        b=ih8CAtyDYsnjaRiFEzaWqxqLkKHdjtPX/TuWWuyESmofKlv2Qe11Wuf5iZ1LyTqc/U
         KrM5dnhVFX0mBqvydpb6BbWjJHC5/SjnSLfx/WjOKMsc4OxO4Z2zHXJw+ge5A1tcsvsm
         RNIAJYvFDSlCldG5MBONB310zakFaKDPIFlgWF/LlLwjb3o5i3qT5Mw/XGEermxR8ivn
         ZE4lD4nK02rqA6y/3mWf83hCpq5gDW2KrX5uhlqb4Sen2ovm+wpd8ZAbeFV3+f6rXI8q
         hxCf1LXQgN4qrZYRbufObpxm0r/CFNBjh5OgGBiRmiFQaPuSR2N2G2HQ9o9Fx66Uh0kD
         x/HQ==
X-Forwarded-Encrypted: i=1; AJvYcCV84gAv1En/LnlOVK6j0LZesmo/Je4ISVIeobDWnWw9OaRU9AbMZLy26UooW0KRg3Nw2V2TNjmG4d1pv6Phif/U3ModI2BhUDLFbWVFNCkhaCZtZqKx7JVeLHoXk+T7HTB6jaT+B8NWcApTvii1IAUZfvCiojB+k+5nsWls7XjkbX2D8n2WsNE=
X-Gm-Message-State: AOJu0Yyu4F7NHJjRn8sOPcHrAkQhTvMcFuP8ywY4eMIC6gPb7+m84ojj
	1LnFZcBEMyZHcUIICLksG+NQujYkVZXWcBxaVwRKUnzqO9LEMQyi
X-Google-Smtp-Source: AGHT+IFm0C8FzIBPiJbTKspBKacDErtAzdNbk4xEcb3w9ZiOmRS4YZF595FbnRiyRLlWia+eCn4ulw==
X-Received: by 2002:a17:902:b7c9:b0:1e3:e0ca:d8a3 with SMTP id v9-20020a170902b7c900b001e3e0cad8a3mr4183246plz.6.1712576532097;
        Mon, 08 Apr 2024 04:42:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y5-20020a170902ed4500b001dd6f1516a0sm6782072plb.87.2024.04.08.04.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 04:42:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 8 Apr 2024 04:42:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: add I2C_MUX dependency
Message-ID: <a24a2a8a-2be9-414d-8378-668ba4408c71@roeck-us.net>
References: <20240405142823.615609-1-arnd@kernel.org>
 <e2d0fdde-ff8b-4851-b18a-89e69dd18d5f@roeck-us.net>
 <cea58361-16bd-4daf-85eb-4d63d47cb46f@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cea58361-16bd-4daf-85eb-4d63d47cb46f@app.fastmail.com>

On Sat, Apr 06, 2024 at 05:45:57PM +0200, Arnd Bergmann wrote:
> On Sat, Apr 6, 2024, at 15:08, Guenter Roeck wrote:
> > On Fri, Apr 05, 2024 at 04:27:43PM +0200, Arnd Bergmann wrote:
> >> 
> >> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> >> index 1872f1995c77..2619018dd756 100644
> >> --- a/drivers/i2c/busses/Kconfig
> >> +++ b/drivers/i2c/busses/Kconfig
> >> @@ -108,6 +108,7 @@ config I2C_HIX5HD2
> >>  config I2C_I801
> >>  	tristate "Intel 82801 (ICH/PCH)"
> >>  	depends on PCI
> >> +	depends on I2C_MUX || I2C_MUX_GPIO=n
> >>  	select P2SB if X86
> >>  	select CHECK_SIGNATURE if X86 && DMI
> >>  	select I2C_SMBUS
> >> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> >> index 0b0df3fe1efd..4dfb3773e6e2 100644
> >> --- a/drivers/watchdog/Kconfig
> >> +++ b/drivers/watchdog/Kconfig
> >> @@ -1301,8 +1301,6 @@ config ITCO_WDT
> >>  	select WATCHDOG_CORE
> >>  	depends on I2C || I2C=n
> >>  	depends on MFD_INTEL_PMC_BXT || !MFD_INTEL_PMC_BXT
> >> -	select LPC_ICH if !EXPERT
> >> -	select I2C_I801 if !EXPERT && I2C
> >
> > Sorry, I don't understand why LPC_ICH and I2C_I801 are neither a dependency
> > nor need to be selected. What if both LPC_ICH=n and I2C_I801=n, or if one is
> > selected but the other is needed to connect to the watchdog ?
> 
> The Kconfig dependencies are only required if there is a compile-time
> dependencies. In this case, both LPC_ICH and I2C_I801 create a
> platform device that is consumed by ITCO_WDT, but it could in
> theory work with any other such driver providing the device.
> 
> It would be fine to make this explicit by adding
> 'depends on LPC_ICH || I2C_I801' to enforce that the watchdog
> driver can only be selected on if at least one of these
> is present, but we have a lot of examples where we don't
> spell out this type of dependency.
> 

Yes, I know, there are lots of inconsistencies in the kernel and its
configuration. That should not be an excuse to making it worse.

Guenter


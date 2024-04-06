Return-Path: <linux-i2c+bounces-2799-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2316189AB01
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Apr 2024 15:08:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40CB41C20F70
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Apr 2024 13:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFC83364A9;
	Sat,  6 Apr 2024 13:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ApfK4vaI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89633611E;
	Sat,  6 Apr 2024 13:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712408930; cv=none; b=dQZl9kqdf3mImuNZxbwungue5OrvhuMFO3Se2bZDM1dyppsRwEiGqFBSnVK5LW3yLblIyM3rAJmnzR0WdFMmDoZmQQPVRUq5y3QMrEq3OrXTC+MFYx7kVih2e/I6ViHCnmFIJMCC9Iysqj8jCz4B0WpdfKe2j6SD5pGKi84DNFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712408930; c=relaxed/simple;
	bh=yYjDFI9ZKghoXrKcIYL6WKRRHeCz9Z9GdEQaHVKWBWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O/mWxfwaxMueEYxr0txt3aGSNiPMhHUTmk+aZ0pE33DwNAO74jcHISagWYSuqjooBAgnqPlza6YkaqYLp1R+VOFl1Et5zeeTStveAEZfZVpR7MG0QNOc+n4VBvnVCPmvitkN31l8qU/au8/yLbA+n6eDSnR9RDNJulXkbGj1U0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ApfK4vaI; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-368a663344eso11840505ab.2;
        Sat, 06 Apr 2024 06:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712408928; x=1713013728; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1nJCinrfZBqtHbptgKCevnPkG/FTidl3k5MY9MOWqZA=;
        b=ApfK4vaIGqRE6r9lc8TqqVUJ4c3H46/lNQJaD1hOrsX7ZqqDvN50pGdoq/kfJI7E80
         3upOIrsQ2lncj9LG363ZuP+6RL8SZWh9JTrnDL6/B7lzBChreA1MdankF7yDfssqgo9O
         USsSuBx//4gUf9BgUZ0+ldozYyTxNv1gxrD/+A3bfm1LM4jgrTHWAidfJKq48MLb41r2
         Q6YcOrLLXpt+/hOl6EfCIFZG6Cjd/5Ww4Db0bvYQxNkQDg3h8+k/lnyi6YVhCDcwEfWN
         UqyCbV7IDfEhJtKaAdeFBlepHggH3ykjMhEzSUOk9+aHIg6x1So1/5FSUDbxwUNnfMVm
         pthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712408928; x=1713013728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1nJCinrfZBqtHbptgKCevnPkG/FTidl3k5MY9MOWqZA=;
        b=EBjEcv+4WNVeq84R6qQGqaqI+jQh4uf9bRZOHEy0Q2YR3HH8Qha30lm+ZbyTAikx0a
         eWkkHQlt01H9HMKMC8u3YeRzBW8OHHZ6f23WBjDLmGeOhd1OKJPRtZL4HzMpi5Z0UCXk
         UJ8eBc/DQe+pp3JY3YN3QvB+Tl+m0L1MA+hp4g/CCM+0ngydqm4ghKb2/uZw/LxQZoPQ
         CxWD1mc0E6vijFhfpiS1qIrf2yM8IgHpbbKAC9Ea4w+5A5gEduAJRIxUMXWC1Bf8u2rp
         h9pFl0zto8nyfAjmceyPjqkTavvTcDt0yK3hYpvXwAAr6tMLMQTOZE0C3C4izsb803S7
         vFow==
X-Forwarded-Encrypted: i=1; AJvYcCUiI+jkJD7E6G0/s1/iEFgNaPLgcg0cVF8QgbOV3Gb9YyPENoh2E10QiuxMsrhi7JWFg43tzKgcD1fv6baDhYUTrBVz2wjPLJOP9UrI0glJiVzTrSvwtAae1jysydMRwQJZH5tzgaJA+cLy+EbB0TtQ+VgPBDZagMFvyF1azwGwjzcKlTHwgVo=
X-Gm-Message-State: AOJu0Yz8toUHVZfdARbTo4GF0rmSr6BeIYYWlfKJVk0E6eZNNYmrTs/d
	//vWUHJejHfpnG5e6xdOsfOzQuys30fcFSR2BVobpJV5QF4a3qSH
X-Google-Smtp-Source: AGHT+IEq96egabFjIWoJAlpe2kpHjL6Fgq+o/Btb4tyziAwF7UBDedWTRTIsV140sRRlpGQv2Q4ezw==
X-Received: by 2002:a05:6e02:184d:b0:369:98a3:6f82 with SMTP id b13-20020a056e02184d00b0036998a36f82mr4888675ilv.13.1712408927936;
        Sat, 06 Apr 2024 06:08:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q29-20020a63751d000000b005f3a8643176sm3146090pgc.44.2024.04.06.06.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Apr 2024 06:08:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 6 Apr 2024 06:08:46 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: add I2C_MUX dependency
Message-ID: <e2d0fdde-ff8b-4851-b18a-89e69dd18d5f@roeck-us.net>
References: <20240405142823.615609-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240405142823.615609-1-arnd@kernel.org>

On Fri, Apr 05, 2024 at 04:27:43PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When I2C_MUX is a loadable module but I2C_I801 is built-in, the newly
> added notifier function causes a link error:
> 
> x86_64-linux-ld: drivers/i2c/busses/i2c-i801.o: in function `i801_notifier_call':
> i2c-i801.c:(.text+0x1f5): undefined reference to `i2c_root_adapter'
> 
> This code is only built if I2C_MUX_GPIO is also enabled, so add a
> conditional dependency that allows building the driver as before if the
> GPIO part is disabled, but otherwise require the linker dependency at
> Kconfig level.
> 
> With the added dependency, the driver cannot be selected by a builtin
> ITCO_WDT driver when I2C_MUX_GPIO is a loadable module, so remove
> the 'select' statement in that driver as well. This was apparently
> never needed at compile-time, and the watchdog driver just needs either
> the LPC or the I2C drivers, but never both.
> 
> Configurations that rely on the implied 'select' from the watchdog
> driver now need to enable all three.
> 
> Fixes: 71b494e043d2 ("i2c: i801: Call i2c_register_spd for muxed child segments")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/i2c/busses/Kconfig | 1 +
>  drivers/watchdog/Kconfig   | 2 --
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 1872f1995c77..2619018dd756 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -108,6 +108,7 @@ config I2C_HIX5HD2
>  config I2C_I801
>  	tristate "Intel 82801 (ICH/PCH)"
>  	depends on PCI
> +	depends on I2C_MUX || I2C_MUX_GPIO=n
>  	select P2SB if X86
>  	select CHECK_SIGNATURE if X86 && DMI
>  	select I2C_SMBUS
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 0b0df3fe1efd..4dfb3773e6e2 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1301,8 +1301,6 @@ config ITCO_WDT
>  	select WATCHDOG_CORE
>  	depends on I2C || I2C=n
>  	depends on MFD_INTEL_PMC_BXT || !MFD_INTEL_PMC_BXT
> -	select LPC_ICH if !EXPERT
> -	select I2C_I801 if !EXPERT && I2C

Sorry, I don't understand why LPC_ICH and I2C_I801 are neither a dependency
nor need to be selected. What if both LPC_ICH=n and I2C_I801=n, or if one is
selected but the other is needed to connect to the watchdog ?

Guenter

>  	help
>  	  Hardware driver for the intel TCO timer based watchdog devices.
>  	  These drivers are included in the Intel 82801 I/O Controller
> -- 
> 2.39.2
> 


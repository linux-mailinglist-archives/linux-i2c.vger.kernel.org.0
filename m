Return-Path: <linux-i2c+bounces-2794-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2B289A7F2
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Apr 2024 02:31:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FB5E1F2324C
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Apr 2024 00:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE0111C10;
	Sat,  6 Apr 2024 00:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uL/8ZWKv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B7B632;
	Sat,  6 Apr 2024 00:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712363510; cv=none; b=qho5AiQpK3WQ4aBNTV+iwcpXbG7f00f5xRGz590Ki1uwRMXGBMZnlPJXAV4nITuN6IPvJK8DOEfGIx6zCrpJa/BkNo+FUXQoOOJNMvl5TwtTM5vYqUnVGxDliC8cM2/OueY/RNMV2SKE7PUdnB2oStAEMfTZwYTWw699rTwhkVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712363510; c=relaxed/simple;
	bh=bd9s04wUaLu4Yh59HHU7R0GCVInJamM+pcf+isBLVcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fnrhtj3u7pgF1VVMf5W5Dr+PuVg36eCmJ7C/wdcvnUSm9RqD6zFtWjRWPQ2Fye7FUijAR9SEyzvyVK3NRD4naRA2uUDYmvjipnx2j2EIN3Krsfxxtv1eDdSl/Fc9wPH/bFoYy+oimSORR10b94kTsvpM+ZZF8vGCJIoBeESlhJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uL/8ZWKv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8876BC433C7;
	Sat,  6 Apr 2024 00:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712363510;
	bh=bd9s04wUaLu4Yh59HHU7R0GCVInJamM+pcf+isBLVcQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uL/8ZWKvoDBZLY2DvZV5JDkTFZSm7KAWyfu9+7hcXWQVDKtfX7LpxD3gu31CHVfRy
	 i3xFX9ROamIugcypLbcMuOgmV92kLyW9wfMq6Ix90OvRhlqL7RUSj22OInkrpfu0aS
	 QpzeqU8PsrEzJm+Dq1jdWWoeQ2j9aKUUhOXZlqLyVcEvvj1wI9BTcjqyBwYgMle0Hn
	 AIMeEc8DF0k68qys/JPC83i+r6XqbAAdaTq/fkxGWxdFC1VA8CaFpVTpJ/1+aGJntI
	 SsY33okiP2B3lv9np65SZwv6BuEz6pLRx81eZSXD1C2mrd1yy93m2f7H9bXkAJYdGJ
	 eTEUf1ygmD/Dw==
Date: Sat, 6 Apr 2024 02:31:45 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Arnd Bergmann <arnd@arndb.de>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: add I2C_MUX dependency
Message-ID: <qghidicjaxiygws4hfme7yfa5kfzg3y7tz4inqnjhwk67hjtwy@apfooo4pplq3>
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

Hi Arnd,

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

thanks for the proposed fix, but Heiner has already submitted a
fix for this issue. I'm going to mark this patch as superseeded,
if that's OK with you.

Thanks,
Andi


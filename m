Return-Path: <linux-i2c+bounces-11126-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE489AC1F18
	for <lists+linux-i2c@lfdr.de>; Fri, 23 May 2025 11:00:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9986C4A0D69
	for <lists+linux-i2c@lfdr.de>; Fri, 23 May 2025 09:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B6102222CD;
	Fri, 23 May 2025 09:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nO06MBFx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A071537C6;
	Fri, 23 May 2025 09:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747990812; cv=none; b=Py/qlV+uuz1QuZvzqeU0QRsKE7zIUFvg0FQsw+F0ULYJpldVxN7f1Ip4zBOKraMguIGhOd3NsZ3IIZMrKksvZBY0XtSndoCT+TJY+q6qHFmHD12UKatB/lZGCZ8hBAIq65ES/vcZRsxSR3YOcxbhstTIcDGQl+ifQ8/Cbl/43+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747990812; c=relaxed/simple;
	bh=vBAD3B3RuAcHaVrtFlDId+NmOFJNwESunRfMjFyuPX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CTVal8M68Cpj91M+1F2V8f0uKk0SmvsmhrbRW6jPn2PXAmn5awAguEl40hKlm9cQbrKAuV+BV+a9FStrQvLw7slSmbHWYBIrO7RA/mPtxwJZiVxAvpQacNDPSJvCN20I/PWb5yVHPj2hh7Y4nUgVCRxtyJttBFI3hb8ATw15utM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nO06MBFx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C20F7C4CEE9;
	Fri, 23 May 2025 09:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747990812;
	bh=vBAD3B3RuAcHaVrtFlDId+NmOFJNwESunRfMjFyuPX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nO06MBFxJsDLr+YmqKsf42UYiLh214VkFBd5BSCzGIMjkMH2dpWZyEUVOBmCsDAEI
	 t9ByLYwzqp0JeG4rMkjVDC3IIKdLD5j3TxL7IXEvjnuIaZanD/cH8wyLuF4XzIB1R3
	 O+8CG436Chqk21R96Eg4BBchB51U/ArSrpih3kYYBjkSSRJ+/OY5O5NpcisRPm+4wV
	 iNe7THMhtWm9gcR9PxzzGmQQ3U9I3lGtUNFgFLyI3O7vjCqFlYoWUgqVgVMlGnyJ0F
	 /WfePNrvguUC1vGq8QdnPMGMceMb1CnTpgGBHrl/bUGv1xym7W4aqHkw8+VmuLJLTS
	 M8Q2dkGZlo4+A==
Date: Fri, 23 May 2025 10:00:04 +0100
From: Lee Jones <lee@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: a0282524688@gmail.com, linus.walleij@linaro.org, brgl@bgdev.pl,
	andi.shyti@kernel.org, mkl@pengutronix.de,
	mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net,
	jdelvare@suse.com, alexandre.belloni@bootlin.com,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-can@vger.kernel.org, netdev@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Subject: Re: [PATCH v11 6/7] hwmon: Add Nuvoton NCT6694 HWMON support
Message-ID: <20250523090004.GC1378991@google.com>
References: <20250520020355.3885597-7-tmyu0@nuvoton.com>
 <202505210555.mud6jZoi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202505210555.mud6jZoi-lkp@intel.com>

On Wed, 21 May 2025, kernel test robot wrote:

> Hi,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on andi-shyti/i2c/i2c-host]
> [also build test ERROR on mkl-can-next/testing groeck-staging/hwmon-next abelloni/rtc-next linus/master lee-mfd/for-mfd-fixes v6.15-rc7]
> [cannot apply to lee-mfd/for-mfd-next brgl/gpio/for-next next-20250516]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/a0282524688-gmail-com/mfd-Add-core-driver-for-Nuvoton-NCT6694/20250520-100732
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
> patch link:    https://lore.kernel.org/r/20250520020355.3885597-7-tmyu0%40nuvoton.com
> patch subject: [PATCH v11 6/7] hwmon: Add Nuvoton NCT6694 HWMON support
> config: i386-randconfig-013-20250521 (https://download.01.org/0day-ci/archive/20250521/202505210555.mud6jZoi-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505210555.mud6jZoi-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505210555.mud6jZoi-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/hwmon/nct6694-hwmon.c:12:10: fatal error: linux<mfd/core.h: No such file or directory
>       12 | #include <linux<mfd/core.h>

This suggests that the set wasn't even build (let alone run) tested!

-- 
Lee Jones [李琼斯]


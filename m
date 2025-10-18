Return-Path: <linux-i2c+bounces-13632-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B886EBEDA12
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Oct 2025 21:23:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 468424ECC74
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Oct 2025 19:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 787EE29BDB1;
	Sat, 18 Oct 2025 19:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PJTO+dF0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A682900A8;
	Sat, 18 Oct 2025 19:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760815348; cv=none; b=TSOKsiOW8A+3CW82V0tNZV+HOoSvIXtGUNVY1gRRy2YPz9Q3ZSejdTmhvlgqdKleobK+moElhA7C/0WAgy6NUQH9xnKruY6lR69pcovSRZlAhmGGFaYf9FWZL+ZPGtNIPt5E63zJd+iO9m59y0poqlHjk7utaWlSXzYe3dk3kzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760815348; c=relaxed/simple;
	bh=LyCmdIipytU++1xCmXNYxXqjVJpXEdehmaOhp4HHIBE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hcnw99H1GCKHGqphPLjB0b7ba1ajEh0J4fbn2P4LpJplmxNp1T4Ti5DLHyvty1LMlPRAZbAWXeRRibuUVixM7sr/T2G0uNEFmJFnajTNynHdBdlRU541XhktECV14tvoufD7z61LFuYAuAkOQPx9oCTxC3Q+rlTl7+eEOkopg5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PJTO+dF0; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760815347; x=1792351347;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LyCmdIipytU++1xCmXNYxXqjVJpXEdehmaOhp4HHIBE=;
  b=PJTO+dF0HwFWfAsQVTay21pf1ysdXkCZhgVy3g38utTJDrFzQ0IZvyKo
   O/9QKuMGYrt7sxe4XFWivccTnY/7a3cwpar/RTbTgkOP4L0akeI3NA8tL
   0+GTqWDixUe/BVtEPq9GLrw1NZuzIkk56BsJf+yCOZ4YnYYzei0yb2dCD
   ddqSgJFrGlYKTrimwdTZfSMSj3HmVkh++Dw9AMNsMh5E7m7ygy0n9Agqz
   JivrZopJLooEB5/iL8wEl/55cufp180ISzkuR25U/pXWAmv2n22tkmh1n
   scIRKoP2JPVWYcka99KZbb0RwD0Keul1utEb5HRqBXQtSfwgfnciH5cZb
   A==;
X-CSE-ConnectionGUID: gA2FM40HQgyt7rjV/TxiLQ==
X-CSE-MsgGUID: sUtyi5moRouaGMX9raASVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62701147"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="62701147"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 12:22:26 -0700
X-CSE-ConnectionGUID: mkNigIwrTji+X+IKWE9Hgw==
X-CSE-MsgGUID: NKxjGwB3Tyq2wUJfdM4r2A==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.194])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 12:22:24 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vACVR-00000000xRU-3VZe;
	Sat, 18 Oct 2025 22:22:21 +0300
Date: Sat, 18 Oct 2025 22:22:21 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jinhui Guo <guojinhui.liam@bytedance.com>
Cc: mika.westerberg@linux.intel.com, jsd@semihalf.com,
	andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] i2c: designware: Disable SMBus interrupts to prevent
 storms from mis-configured firmware
Message-ID: <aPPo7VWm4HyoHSIE@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo


On Sat, Oct 11, 2025 at 03:30:57PM +0800, Jinhui Guo wrote:
> When probing the I2C master, disable SMBus interrupts to prevent
> storms caused by broken firmware mis-configuring IC_SMBUS=1; the
> handler never services them and a mis-configured SMBUS Master
> extend-clock timeout can flood the CPU.

...

>  #define DW_IC_TX_ABRT_SOURCE			0x80
>  #define DW_IC_ENABLE_STATUS			0x9c
>  #define DW_IC_CLR_RESTART_DET			0xa8
> +#define DW_IC_SMBUS_INTR_MASK		0xcc

It seems one TAB too little.

>  #define DW_IC_COMP_PARAM_1			0xf4
>  #define DW_IC_COMP_VERSION			0xf8
>  #define DW_IC_SDA_HOLD_MIN_VERS			0x3131312A /* "111*" == v1.11* */

...

The rest LGTM, but let Mika to review.
FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko




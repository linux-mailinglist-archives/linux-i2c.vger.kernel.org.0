Return-Path: <linux-i2c+bounces-5989-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C655496818D
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 10:20:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E29F91C21FB9
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 08:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF17976048;
	Mon,  2 Sep 2024 08:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CEnyfjNu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384FC127E18
	for <linux-i2c@vger.kernel.org>; Mon,  2 Sep 2024 08:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725265216; cv=none; b=YwGOMzvyWTunX9CQk7VCwPyuaylets1t7KpoJw7ZnGTC7IoVDjSDqiMgC96uKqFWnla99mSnlRJf81zKdFeyWBqolO61IV0Uuzu59dK3evDVU9qUHbgjOuSwnJJU5rgErxRXN06+FUPw3xC80jlS1m0WHI/Dcwsds229zHP1NLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725265216; c=relaxed/simple;
	bh=ym65EUZy1Qh3qLNx40TrYHZeQsx0MXaVg6cmFo2sFM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HLGrzmqmyGYBmK3bkcH58jneNvNi1Q4+Q45pm42riPelNMsPoLx1hn6YeUbqfXSSjJB4SgqDIOL676nI0wOFtcOsWuwCvhFHLHAmTmUHxwg8m6nixwobKQrUj84/GDqYgeVEvtQYMoiMs37TA4zmt5PWuaZxHUc+R1HCKTHuXNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CEnyfjNu; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725265215; x=1756801215;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ym65EUZy1Qh3qLNx40TrYHZeQsx0MXaVg6cmFo2sFM4=;
  b=CEnyfjNutw50Nr3h3sap0VZJ5umRYmdp+Ch1YVVZYKbldxzBarI/JNoN
   5IoP7K+uHVl3RX9778k4BykNopdT10iXuw6dIDaynSWyDHvzjroWBgktO
   9NdlSGCdOuo3rG/iPh6OU6FpvEW97w8J80/iZQCxtV3TflnwXmrt+zgWm
   ciqGNflZMMQ9O+T5+tgFJXnxewFvURJmh4LdaPYIXN56fRygD6x84OZXH
   I3otJGzm1j7NoPvofSHNMj241UYq+MMTtLIQTNWO7KZ/eFqGs+s8QOrcf
   wKf3mpH5LR07eF+Gc0YlsXabMX924R0z+Gmvy3SJpWSfyuWw6Z4ugE3Rp
   A==;
X-CSE-ConnectionGUID: ODp6fhfWTGmJNQVtorT6+Q==
X-CSE-MsgGUID: /dTuQi8SQryhr8F+TtAatg==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="34993150"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="34993150"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 01:20:15 -0700
X-CSE-ConnectionGUID: hwU5vazlQt6q1lOi6JWAkQ==
X-CSE-MsgGUID: rcBQEGP/QeWtLdLkF2xTbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="95249652"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orviesa002.jf.intel.com with SMTP; 02 Sep 2024 01:20:11 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 02 Sep 2024 11:20:10 +0300
Date: Mon, 2 Sep 2024 11:20:10 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>, Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: Group all DesignWare drivers under a
 single option
Message-ID: <ZtV1OlpiJfy6I86o@kuha.fi.intel.com>
References: <20240830111222.2131172-1-heikki.krogerus@linux.intel.com>
 <202408312050.fs0rCgDO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202408312050.fs0rCgDO-lkp@intel.com>

Hi guys,

>    WARNING: unmet direct dependencies detected for I2C_DESIGNWARE_PLATFORM
>      Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && I2C_DESIGNWARE_CORE [=n] && (ACPI [=y] && COMMON_CLK [=y] || !ACPI [=y])
>      Selected by [y]:
>      - TXGBE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_WANGXUN [=y] && PCI [=y] && COMMON_CLK [=y]

I'll resend this patch together with another patch where I'll that
that that driver's configuration is changed so that it depends on
instead of selecting I2C_DESIGNWARE_PLATFORM.

thanks,

-- 
heikki


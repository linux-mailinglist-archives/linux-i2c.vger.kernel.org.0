Return-Path: <linux-i2c+bounces-7712-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B18319B8D40
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 09:44:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D8DD1F23B4A
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 08:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F377156F3A;
	Fri,  1 Nov 2024 08:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GoVkqtji"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F76156C70;
	Fri,  1 Nov 2024 08:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730450677; cv=none; b=DQLjr/y3KYbBEoqQs/ku1BB/Y6v6PB4P4vTrJau7y42mv1BJCdqu5RsHhp4XOx/K03a2eQn/D5T9mO+byK9PeXMMD1iCGX2DRmn1eNuKBy0OQDUsL4lsVkyl1UHaicsoXukw3yVLjDhHIBo70q9KLQjpLXC5bqtEGgIJU4pM5Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730450677; c=relaxed/simple;
	bh=GCMhYqA/YfCTsWWthvHXpoRveTvB5rQZPcmzM6duX/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WRiYJbIF3V9p/BPGX3jsQh1x9E6TvvG1GzEpMx1EDEJhngnqTmmEWcgY2dYsdMIgDwqGaLR/L/XZYWW1zSeaP83+KA4bSCPzIqZ4yRpmgvoWPCuUiJHBmWMSDDoX8whslgo10uBNCT9LNWeDonrUfh77DtOWUfs/dSgCPwmSZM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GoVkqtji; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730450676; x=1761986676;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GCMhYqA/YfCTsWWthvHXpoRveTvB5rQZPcmzM6duX/c=;
  b=GoVkqtjiacXdAEaNrBXuikxezAwEXxY7k+LEKRfEg5KYOozFqJByzPpj
   whoWaPDB9XGVRvs/qo1QjFeSy4GOnbrliQIrcdWloWPubUhv+gVwwQ+lL
   9FDSyHhTKCJnbGhi7CEWOzq+UHVeUGDEGJpc2gBy9iY3By1aTJI4jSmjL
   Op1PlrYsoRZp1gj3SJT3r/WDi178wv/M9HNpF8bkWaKRw7TWCMhbz3PkI
   /pZqWYQ/PsuHIxfF/JfkgEe5FsMD7o0r/uzXzExcvEs1nGwc+Y4HjUU94
   qiuIA/mqyLm//76J4CfKAhmi5fYlREy/7pOnS4SaLWABhR6eNfJa6Fcz2
   w==;
X-CSE-ConnectionGUID: eLiz2XhgQU+Gr9lwSWJ3lA==
X-CSE-MsgGUID: b30//yZ5SEiYWQSZD9W9dQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="41610084"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="41610084"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 01:44:35 -0700
X-CSE-ConnectionGUID: 9gYS7nxMRvSrRD3BNX6YFg==
X-CSE-MsgGUID: z0zU6Yh4Q32ZGvfo5g4uFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="82425556"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 01:44:32 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t6nGf-00000009y3g-4Bei;
	Fri, 01 Nov 2024 10:44:30 +0200
Date: Fri, 1 Nov 2024 10:44:29 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Liu Peibao <loven.liu@jaguarmicro.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	"xiaowu . ding" <xiaowu.ding@jaguarmicro.com>,
	Angus Chen <angus.chen@jaguarmicro.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND TO CC MAILLIST] i2c: designware: fix master
 holding SCL low when I2C_DYNAMIC_TAR_UPDATE not set
Message-ID: <ZySU7bEvct4_FbBX@smile.fi.intel.com>
References: <20241101081243.1230797-1-loven.liu@jaguarmicro.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101081243.1230797-1-loven.liu@jaguarmicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Nov 01, 2024 at 04:12:43PM +0800, Liu Peibao wrote:
> When Tx FIFO empty and last command with no STOP bit set, the master
> holds SCL low. If I2C_DYNAMIC_TAR_UPDATE is not set, BIT(13) MST_ON_HOLD
> of IC_RAW_INTR_STAT is not Enabled, causing the __i2c_dw_disable()
> timeout. This is quiet similar as commit 2409205acd3c ("i2c: designware:
> fix __i2c_dw_disable() in case master is holding SCL low") mentioned.
> Check BIT(7) MST_HOLD_TX_FIFO_EMPTY in IC_STATUS also which is available
> when IC_STAT_FOR_CLK_STRETCH is set.

Who are those people? Why Angus Chen is not a committer of the change?
Please, consult with the Submitting Patches documentation to clarify on these
tags.

Also, sounds to me that Fixes tag is needed.

-- 
With Best Regards,
Andy Shevchenko




Return-Path: <linux-i2c+bounces-9041-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD21A0B375
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 10:46:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B3FB7A54BD
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 09:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A3B6235BF5;
	Mon, 13 Jan 2025 09:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NRR1LZxQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7392E235BE0
	for <linux-i2c@vger.kernel.org>; Mon, 13 Jan 2025 09:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736761441; cv=none; b=rDsGouBLM39Sam8HttZTyFkdPkIgEAUluL8osYjNMxHinkx16wk18NB/tBiGB3OFLbE873MOzTzAga3xRg8mypPDw6ndCm5lu8P8j0Lj27GrQiQSuLx45aSsuWeYqgC9C4TgK1z9n79dNHiqsonq5zstk+fEXt90LzoocueZLbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736761441; c=relaxed/simple;
	bh=2v06g9L1mEC4BgOVI57INXPvLeDKFxNHO/n4YwCK1lE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bLi3ye4FVS26SJd5aHCCUFE5DDBEICudPXaF/QSRHI898/zXga025SvOD/FXLt3wTrl28o2D3A/xfv+nXMy4RvtI0clKdTtjzd5f/BH82YPAq2t/29yf8zypErf/wthxwLb6JWgKx3goHqa5YtIzcsSY4sKszVrqR7AioGFEEUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NRR1LZxQ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736761439; x=1768297439;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=2v06g9L1mEC4BgOVI57INXPvLeDKFxNHO/n4YwCK1lE=;
  b=NRR1LZxQboH8iIUfkDD64p1GPHVK3UpK2dQrtLe3APEqnu1Aab4AWCtx
   GL9ZVD4xWsjEBzuBBGjYFkQz4rzegwJ1v4dIdIRjdirBHggpdxAVYUOZg
   d19h1FTTbhuQSBV4Fds4YvdZqbjMGpKBGRf7R6adjyPHIA2D3ZjI/nyi0
   b+KAPEK7rkiW8aDKiqwiu7Vg47NYzUorwNBzjw121wgNSTOPB1ISyIfQ1
   sDTRCPMLRQJytf4rZJ6OWOiPQbLwf13zvXAK6W8JAe/6/jFCT7l6PT6sh
   8uS+t9EqAt37rYsdNT9XJWQpCIX/XitN8iWcgYMcM4l1H5bTv5yIIUTK2
   A==;
X-CSE-ConnectionGUID: xYYZnyblQse6b5LeCThnNQ==
X-CSE-MsgGUID: NOla53gXSW6ZFaGNzwaDGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="54427911"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="54427911"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 01:43:58 -0800
X-CSE-ConnectionGUID: XTslWLB6SSGo0j8DPTFEWg==
X-CSE-MsgGUID: 8CzN3OrpQPyL+lG3YnLxQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141711627"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.154])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 01:43:57 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tXGzB-00000000PSK-2JV8;
	Mon, 13 Jan 2025 11:43:53 +0200
Date: Mon, 13 Jan 2025 11:43:53 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] i2c: designware: Actually make use of the
 I2C_DW_COMMON and I2C_DW symbol namespaces
Message-ID: <Z4TgWaqZnpr5u6sp@smile.fi.intel.com>
References: <20241230155948.3211743-2-u.kleine-koenig@baylibre.com>
 <wkx55fripv35i4pv5jnosx2s37dm54mrik2r6cfzjkl6poekmz@sagdynptzopn>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <wkx55fripv35i4pv5jnosx2s37dm54mrik2r6cfzjkl6poekmz@sagdynptzopn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Jan 04, 2025 at 12:51:57AM +0100, Andi Shyti wrote:
> Hi Uwe,
> 
> On Mon, Dec 30, 2024 at 04:59:49PM +0100, Uwe Kleine-König wrote:
> > DEFAULT_SYMBOL_NAMESPACE must already be defined when <linux/export.h>
> > is included. So move the define above the include block.
> > 
> > Fixes: fd57a3325a77 ("i2c: designware: Move exports to I2C_DW namespaces")
> > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> > ---
> > Hello,
> > 
> > Changes since (implicit) v1 that is available at
> > https://lore.kernel.org/linux-i2c/20241203173640.1648939-2-u.kleine-koenig@baylibre.com:
> > 
> >  - Also fix drivers/i2c/busses/i2c-designware-master.c
> >  - Make added line breaks consistent
> 
> Thanks for this v2. I need to wait for Andy's ack, though, as he
> had some comments here.

Documentation fixes already were applied and this one follows it, so fine with
me:

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko




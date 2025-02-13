Return-Path: <linux-i2c+bounces-9445-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E608A34A93
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 17:48:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 508421897DC0
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 16:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E09242913;
	Thu, 13 Feb 2025 16:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="axcWBZ+7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A20242908;
	Thu, 13 Feb 2025 16:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739464693; cv=none; b=D1N8mhn5CmYcPAc0RbaKDRT5tF19fkojHuVNIBQ+OhKtcT49KjK1HxPzoXq42DcQD9sfziahbAMs0szrf8QbQ6Z145O6vCjpfH2kOQEKWGbHm7DS34TnDc65qsxJg+nmXVAYx02OYZpPY6Pv/hormZlXRAyPu7yopttzYtMja8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739464693; c=relaxed/simple;
	bh=Z4F6lLs5DIJbPs+bwuRZBqYEa3kLjWUhgDzZWRR+fM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JPfxYddmi+yr6DvT/w/9ldSvnK22Qea+/1T6nYjXq8Pdo+X+L1BhCTwPY1peMyT6qmjNnL7134UqHP4fSVXg+IIBYEiKkYalhmgnT2jtKndPCQd3juEWKMR68JFYJys+0Eo3yQIs0s2g458x5CaCvBP/PtFO0gzOHh2Mhyo9c5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=axcWBZ+7; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739464692; x=1771000692;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z4F6lLs5DIJbPs+bwuRZBqYEa3kLjWUhgDzZWRR+fM8=;
  b=axcWBZ+7WsgafvA1HPWo7UoyuASzT1FIDSUSm0yE2L3TNNsy+DNO8K+D
   g+dps3mdJW54nJ1cIwxd6n0sXQC1Ai06Plx+5/Frytzn4smojmRBskZ4v
   SuBwKzpSZTd3FBFRVPit82Ox2CQD+ODRGPZ/LhnlLIP3Gnl8mAUl8ESEa
   FCgPH4L9w/RnRE1Xl02LAKGAutHc+JsplyN/hhA+6c07OfDfbTcCOrTLx
   3n09DFtNkVnyEmx+Xrg03LCYiTmbsVgntc7HRzH/0NSfYSyjlqv8rXq5h
   HyKmSP+2QFlJ3t+4+okOEcxm37IZwdDfrzuEaeq+bc3SLElMO8h+SiHhs
   w==;
X-CSE-ConnectionGUID: hpl5/Cy6S5+xcAk4w/WYkw==
X-CSE-MsgGUID: 19hP06hkRMCCs2mehMjoiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="57584173"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="57584173"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 08:37:47 -0800
X-CSE-ConnectionGUID: niTSu+OLRH6SflrjdnL4zw==
X-CSE-MsgGUID: nDLWUmqKQx2tp+6jE5OMkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="118279941"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 08:37:43 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ticDb-0000000BDvA-3sGX;
	Thu, 13 Feb 2025 18:37:39 +0200
Date: Thu, 13 Feb 2025 18:37:39 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Adamski <krzysztof.adamski@nokia.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>, Stefan Roese <sr@denx.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: Re: [PATCH v2 07/10] i2c: mt7621: Use i2c_10bit_addr_*_from_msg()
 helpers
Message-ID: <Z64f08OhKlXuoYP-@smile.fi.intel.com>
References: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
 <20250213141045.2716943-8-andriy.shevchenko@linux.intel.com>
 <ceb1cb01-78b8-4ed4-b4fc-23fdac78ab21@collabora.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ceb1cb01-78b8-4ed4-b4fc-23fdac78ab21@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 13, 2025 at 05:01:20PM +0100, AngeloGioacchino Del Regno wrote:
> Il 13/02/25 15:07, Andy Shevchenko ha scritto:
> > Use i2c_10bit_addr_*_from_msg() helpers instead of local copy.
> > No functional change intended.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Can we please do the helper conversion as one commit and the (much needed)
> cleanup of assigning len and de-duplicating the call to mtk_i2c_cmd() as
> two commits?
> 
> One with just the conversion, one with the cleanup (or in inverse order,
> as you wish).

Yes we can.

-- 
With Best Regards,
Andy Shevchenko




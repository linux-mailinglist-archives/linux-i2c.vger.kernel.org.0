Return-Path: <linux-i2c+bounces-10379-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E26A8B02F
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 08:23:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC42D3BAD4B
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 06:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CF032206B3;
	Wed, 16 Apr 2025 06:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a0mhkPSC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A931F416A;
	Wed, 16 Apr 2025 06:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744784591; cv=none; b=VlIRUhXAPu8keDUEq1Zpi+hahIZEJVC7wavoZXO83xzyz7rgBhiEyowvvGrgRlx9R2wHR5o5BdAfJkwQP1n0pE22JaHwXArq8hILlF2tIOnzG4sKqJZRJ7XUr8TP63cH3N5HuNy19elkOXBWXG1vsX8KDYVXs+1WqMJNBR7K0jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744784591; c=relaxed/simple;
	bh=ZHdLc05wlZ9l+oR1/eUxxXhPe8JE1RcNik6A3HbhLZ0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CJlcA9pV2jByy/pxgcFlPN54Dz7mOrmjNYNcghdnYmJWrPwWNOmdJwL9pFNt1kA+2Fj9CRahxnVvTF2Oa+2Ydmc6h4QXDzjWnt2zkJHnR/p4S83opozDvwJLUtmhbNgtDNKBOuIzcSnmiELLRdfj7Tspu6VKxFdQpHECP9Alju4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a0mhkPSC; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744784590; x=1776320590;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=ZHdLc05wlZ9l+oR1/eUxxXhPe8JE1RcNik6A3HbhLZ0=;
  b=a0mhkPSCdCtP5i0+Jg2fuWV66QBaDjK7GrKHTE3Mm9EDjazMVgR4Jm0w
   Oh0TtvpqLWbxk5YwOk8Gki21wPgN8XKvGcb4QbyoEieSZd9mmG/iq5emU
   WZqUV7yPx5uW3kTdYGSu4a4My6UbaaTtV4o7RHz+lqvC+rkA5gtRQLyVw
   03H6gsVFHbIIg8mNx9ou7gD7cC/1fSDyKK5p1bfOi1T1u8G/TC0//pfdQ
   o+I83eq0qLFFuh22sv6fvVXXr96V2JQItFP1UzNULVRetQoZIEcAfpFsH
   3nqlhfsYLCgys2NGPPd8A2f4HpeCdhw34/BENrND8VH3d0bfOogxKbHOV
   g==;
X-CSE-ConnectionGUID: AD8X6zOKTYGLFWKqp1rpww==
X-CSE-MsgGUID: Jt78uMpZTDK+zoJTLWLo3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46205147"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="46205147"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 23:23:09 -0700
X-CSE-ConnectionGUID: 38LXj9+5QN+1gMWD58/g+g==
X-CSE-MsgGUID: 7POT3VQnRcK3bOTSaalfUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="131258627"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 23:23:06 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u4wAq-0000000ClOH-01NX;
	Wed, 16 Apr 2025 09:23:04 +0300
Date: Wed, 16 Apr 2025 09:23:03 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v4 3/7] i2c: core: Switch to fwnode APIs to get IRQ
Message-ID: <Z_9Mx0AoMDlrbpPV@smile.fi.intel.com>
References: <20250414100409.3910312-1-andriy.shevchenko@linux.intel.com>
 <20250414100409.3910312-4-andriy.shevchenko@linux.intel.com>
 <Z_68LsxyaQ-Q0k5j@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_68LsxyaQ-Q0k5j@shikoro>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 15, 2025 at 10:06:06PM +0200, Wolfram Sang wrote:
> On Mon, Apr 14, 2025 at 01:01:53PM +0300, Andy Shevchenko wrote:
> > Switch to fwnode APIs to get IRQ. In particular this enables
> > a support of the separate wakeup IRQ. The rest is converted
> 
> You mean it enables the support of wakeup irqs for ACPI? Otherwise I
> wouldn't know what you mean here...

Re-reading this I'm also puzzled if I was interrupted in the middle
of writing it :-) From the code perspective, yes, I meant something
like that (rather "in non-OF cases").

> > just for the sake of consistency and fwnode reuse.

-- 
With Best Regards,
Andy Shevchenko




Return-Path: <linux-i2c+bounces-10139-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CA7A7DD90
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 14:23:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADDE2188E56E
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 12:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC6AB231A3B;
	Mon,  7 Apr 2025 12:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eesl5/zA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AE6192B89;
	Mon,  7 Apr 2025 12:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744028610; cv=none; b=PVE5CLzCeRKfVfOeNam8r7zVZ1bJ2et16s3z2Mt1HLSW06sGRptJ0BcUkIjU+th6OCCKlZnb/xRsexCdNsX/FDbCzimaDmTzu/Mgr2GToUbJV/3XIJmmJCnRQ1b2itbFCi0m4UGuvJfsdnqyGntdu2A7VBjWpO6HW4f1sIabZ/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744028610; c=relaxed/simple;
	bh=grRP9IIZu+yzVT4nTI/ur2s0/bB6KpDJMElRNUUlS7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pYvyGp1KxzMUsPV9GdUc+O/pTk2UJru5777ZTsv++ZoVG2gKoTsviVhLxEVjpQ9houiYj5/5QAuZfBQxYwpc6uNnOdEMvNcdtFsrKvFC1eg8VXlUi1kaRzz5exijEraa/Hq3a3P8l05uZDQsrslcHIbec9qD/nL7AY1hvSrg5Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eesl5/zA; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744028608; x=1775564608;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=grRP9IIZu+yzVT4nTI/ur2s0/bB6KpDJMElRNUUlS7k=;
  b=Eesl5/zANuz024Lx2kvJhiepAKftOk/C2I7sPNdaxHd+NEXH198xUmb2
   aQG9C4tG9ipcZHanOhI74tR10aKP8IzHZgaixV/2QNoGZpqrY8tmxs0t+
   76Cveu+p8Aa/O5MREq8a/HSYx8T+U+7lM+HTYlY50WVl9uVctmzipLcBi
   95FHCSCMZU7iRkq3RPDsCotl0hXqRKLMb/9pE5vxE7h6X/u4KAMUueF/e
   7xc8U49fghRlVf0vfFgwnPpH9xy9Kf1LOSIMzaS+E1XEdprrTjQeSrM4k
   6/aNGlNchnUpuI8os7aounWgZCJ6ZxgnZn/IrN66GGBtGXnpXNboXStyH
   w==;
X-CSE-ConnectionGUID: 5HxFY114QOeWVt2+BqMU0A==
X-CSE-MsgGUID: eo423dVsQzqy2TUZCt39qA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="44554989"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="44554989"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 05:23:26 -0700
X-CSE-ConnectionGUID: r9NFi8VXRgyZc6Z/TpGkLg==
X-CSE-MsgGUID: +vw++kUxSJO/fOiJNdXVAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="128875979"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 05:23:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u1lVa-0000000A3zK-2mje;
	Mon, 07 Apr 2025 15:23:22 +0300
Date: Mon, 7 Apr 2025 15:23:22 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] i2c: core: Move client towards fwnode
Message-ID: <Z_PDuilyIYM_3STr@smile.fi.intel.com>
References: <20250407095852.215809-1-andriy.shevchenko@linux.intel.com>
 <d51a686c-583a-4fed-81bd-9287459c48fe@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d51a686c-583a-4fed-81bd-9287459c48fe@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 07, 2025 at 02:34:48PM +0300, Tomi Valkeinen wrote:
> On 07/04/2025 12:55, Andy Shevchenko wrote:
> > The struct i2c_board_info has of_node and fwnode members. This is
> > quite confusing as they are of the same semantics and it's tend
> > to have an issue if user assigns both. Luckily there is only a
> > single driver that does this and fix was sent today. Nevertheless
> > the series moves the client handling code to use fwnode and deprecates
> > the of_node member in the respective documentation.
> > 
> > Tomi, can you test this series + the patch we discussed earlier so it works as
> > expected?
> 
> I tested this series, and then tested this series + "[PATCH v1 1/1] media:
> i2c: ds90ub960: Remove of_node assignment". I didn't see anything amiss in
> either case.
> 
> Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Thank you very much for the testing!

> I assume the ds90ub960 patch is the "single driver that does this and fix
> was sent today"? If so, I think that patch could have been included in this
> series as well, there's hardly a chance of conflicts with the one liner. And
> if applied separately, we probably need to apply the ub960 patch one kernel
> version later than this series.

Yeah, I forgot to update the cover letter to point to that one out.
I agree on everything you said above. But let's wait a bit for Wolfram
to comment on / apply this first. It would be nice to have it in, so
we prevent new ambiguous users from appearing.

-- 
With Best Regards,
Andy Shevchenko




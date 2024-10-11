Return-Path: <linux-i2c+bounces-7344-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C191699A58E
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Oct 2024 15:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 713C31F244E8
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Oct 2024 13:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 930AD219493;
	Fri, 11 Oct 2024 13:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J0YJYmzh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59B5213ECC;
	Fri, 11 Oct 2024 13:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728655118; cv=none; b=ZWBya9jxuA8/DN5kgTwDJpJBwoEDI+1GVQaw/feFI37Ed42HMFLjVTHYpbZS9jmCmSpZiSL9/nYnDPYAxokhyQCI9jYG8dIPiU0emvnlTfDYIeLQuKz7eG9XFylUHK+LZ9NCOhIA7xupGN4h7ZHvQLBC08FyfI0Skh642J+HoKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728655118; c=relaxed/simple;
	bh=50t/8bIPuePIvNkFpNK6cx7S6M3odVVqVkTOhu9z+2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F6+rWwbX2ki1/3lrSxdglR1BXJEyOpCSixzv/pRFL3DsgG35tNRsmNEe5nkckIUaF60EWBWwwmpRutrXpMje/rluDC867a0LoSEf2KBuKqC1GG7ph/V6aDplyXrvu87CVj532F9azx+n5gvPHYShtKpTNax+Xj/p86VFC3QTLfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J0YJYmzh; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728655117; x=1760191117;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=50t/8bIPuePIvNkFpNK6cx7S6M3odVVqVkTOhu9z+2c=;
  b=J0YJYmzhJKqdrqT6XxQdOXmJvng4ZBpYrtSR2TKo2PysP+5voG86yrHs
   GSiU5kKElmkpsdJQDx1kD8aMSM7E3TzMaHqW+zzfsOnQMZXBWtZVhMG5e
   bhh+3v12t5SzppQZgQ0XBTSE4WRgyZIoflNlycMhUWoMLP2Jy4sU5OmIG
   c6P2EAAT+0QHfVSvHFDYLLCWN4vbI+T6HaVDu/7J2rKWP7/0ZfF69V+Jo
   mrbUOQIeYO4yAiFk+38LZBIcXtK4Z3KXdNSJwSO4KriU6q4uzoHs+KH6n
   GpcW1EXMqYt9vCxan5rnKx0NMYKGHq+dcOesF9ln6RvPnReefyZSvq8k9
   g==;
X-CSE-ConnectionGUID: jPF5BNjNQPS5zDbpMZF8tw==
X-CSE-MsgGUID: ixTCf0ggSsC111l+IEQ5Rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="38706076"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="38706076"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 06:58:36 -0700
X-CSE-ConnectionGUID: bP5oxpOOQqCAWQokdjP4HA==
X-CSE-MsgGUID: hedrGgucSQ2Cbsqo2kp53g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="76578587"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 06:58:31 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1szGA1-00000001uSU-026m;
	Fri, 11 Oct 2024 16:58:29 +0300
Date: Fri, 11 Oct 2024 16:58:28 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tyrone Ting <warp5tw@gmail.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
	venture@google.com, yuenn@google.com, benjaminfair@google.com,
	andi.shyti@kernel.org, wsa@kernel.org, rand.sec96@gmail.com,
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
	KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com,
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/4] i2c: npcm: Modify the client address assignment
Message-ID: <ZwkvBFHS1m3N2yoW@smile.fi.intel.com>
References: <20241011055231.9826-1-kfting@nuvoton.com>
 <20241011055231.9826-3-kfting@nuvoton.com>
 <ZwkFWVC3_5xr6OQW@smile.fi.intel.com>
 <CACD3sJY_79_VTe1EHPdh-1+FCBwb2KCW_N19==TMHAsrFL-rzg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACD3sJY_79_VTe1EHPdh-1+FCBwb2KCW_N19==TMHAsrFL-rzg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Oct 11, 2024 at 09:44:42PM +0800, Tyrone Ting wrote:
> > On Fri, Oct 11, 2024 at 01:52:29PM +0800, Tyrone Ting wrote:

...

> > > +             if (bus->dest_addr & I2C_M_RD)
> >
> > Redundant.
> 
> Just to double check. Is the code "if (bus->dest_addr & I2C_M_RD)" redundant?

Yes.

> > > +                     bus->dest_addr &= ~I2C_M_RD;

-- 
With Best Regards,
Andy Shevchenko




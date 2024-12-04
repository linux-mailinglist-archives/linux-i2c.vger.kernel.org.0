Return-Path: <linux-i2c+bounces-8317-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 789299E30BB
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Dec 2024 02:24:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4386316379A
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Dec 2024 01:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A4C79F5;
	Wed,  4 Dec 2024 01:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TRAd2Vun"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91F533D1
	for <linux-i2c@vger.kernel.org>; Wed,  4 Dec 2024 01:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733275451; cv=none; b=bQzcu+gnfF17gMcnXbxkk90jeyn2XcxqSL/XQcN3UNqGY+hExznBnklpJwMI/1UEmfcYM8fFBhZ25BWwBuSVZ3iT+E69JK7i+6rXNPkoDIMY49n7tqMrT9p22y1aLVpu7+wd2Bcjkrc9sZxhE5OsfJkW+gwhIU45YE6KAQrYIIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733275451; c=relaxed/simple;
	bh=fTgomgQPuOQ6uPQhSNhTtZ5qj+it02RT43ura07J3uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PlKdVGHvGvVhb2MM13Cm7p3e6ATgHmymqyzfknD7yX1UygP08uXsV0zwVx7Wu896ymEmewJy4+wgg+cKULW95DONc/qGjTYFaslda4cAujFN7lxBdkCahxj/Tlk+JnY0aL5FB8fMVuj6B/5PLIa3Q6QUffFFIOhZWoanEo1aUlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TRAd2Vun; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733275450; x=1764811450;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=fTgomgQPuOQ6uPQhSNhTtZ5qj+it02RT43ura07J3uo=;
  b=TRAd2VunuttxLBzkBWjSLTKCEyYV64fw+Qv6SBsqiirqG9R7sPhK6nYs
   0BWza/aH5vu2K8pOij9OOrs2VVKo+Q86PfXsuPv7aFeYqqOHlX180qMDs
   PGg7hIFKH0a+7vvn1GFE1bOX2oZ45jdFBHQ9+9ur+ebp9wttfaXhutE43
   Fr1aiqHhFMhQUwQ3itwOhvszgpOyBA6lxvB3GAYL0iQG33hCq2MY73Qj9
   D4WpdLedJmw0qfx0ktv5tP0+TJXx1QIYVPdC+KNo9MQdQJr5SOD/WZNiP
   1hKUN+TnwOI7tPiwYIbun4GR8TmjOA5W9gzmC9Im/dZl8oGiq9QXghNA8
   A==;
X-CSE-ConnectionGUID: H/Rr8dSoQEa/otkj+JuM4w==
X-CSE-MsgGUID: IPNqcStvRIijd5Oe0/Seuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="33577740"
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; 
   d="scan'208";a="33577740"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 17:24:02 -0800
X-CSE-ConnectionGUID: +WLBk8r8SMKegSiSoBJZPA==
X-CSE-MsgGUID: ICJFvDQERn2+Az+P4nLUMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; 
   d="scan'208";a="98418984"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 17:23:55 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tIe7N-00000003bbR-0CW0;
	Wed, 04 Dec 2024 03:23:53 +0200
Date: Wed, 4 Dec 2024 03:23:52 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: Actually make use of the I2C_DW_COMMON
 and I2C_DW symbol namespaces
Message-ID: <Z0-vKE3FLxa2BWmS@smile.fi.intel.com>
References: <20241203173640.1648939-2-u.kleine-koenig@baylibre.com>
 <Z09bp9uMzwXRLXuF@smile.fi.intel.com>
 <aenflylxg46hie6yj2hzlelnzbq42mox24fzzz7o44dvb3j575@r2hgad4ghgym>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aenflylxg46hie6yj2hzlelnzbq42mox24fzzz7o44dvb3j575@r2hgad4ghgym>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Dec 03, 2024 at 11:46:07PM +0100, Uwe Kleine-König wrote:
> On Tue, Dec 03, 2024 at 09:27:35PM +0200, Andy Shevchenko wrote:
> > On Tue, Dec 03, 2024 at 06:36:40PM +0100, Uwe Kleine-König wrote:
> > > DEFAULT_SYMBOL_NAMESPACE must already be defined when <linux/export.h>
> > > is included. So move the define above the include block.
> > 
> > As in the other email I pointed out the doc says that we need to undef the
> > symbol. No need to move it around.
> >
> > The only requirement is to place that before any EXPORT_SYMBOL*() we want to
> > add it to.
> 
> Did you test your statement?

I speak the documentation.

> I did on top of v6.13-rc1:
> 
>  - Remove the MODULE_IMPORT_NS(I2C_DW_COMMON) statements from
>    drivers/i2c/busses/i2c-designware-master.c,
>    drivers/i2c/busses/i2c-designware-pcidrv.c,
>    drivers/i2c/busses/i2c-designware-platdrv.c and
>    drivers/i2c/busses/i2c-designware-slave.c
>    => Built fine, ergo the symbols are not in the I2C_DW_COMMON
>    namespace.
> 
>  - On top of the previous: Add an #undef for DEFAULT_SYMBOL_NAMESPACE
>    directly before the #define
>    => Built fine, ergo the #undef doesn't make the namespace define
>    work.
> 
>  - On top of the previous: Move #undef + #define above the #includes
>    => Several warnings like:
> 
> 	WARNING: modpost: module i2c-designware-platform uses symbol i2c_dw_prepare_clk from namespace I2C_DW_COMMON, but does not import it.
> 
>    Ergo the position of the definition is relevant.
> 
>  - On top of the previous: Drop the #undef
>    => same as before, ergo the #undef is not needed.
> 
> Independent of what is in the docs that matches my understandment of C.
> 
> I don't expect that DEFAULT_SYMBOL_NAMESPACE to be already defined. If
> there was a definition already, a #define without #undef results (under
> some likely conditions) in a compiler warning. With the #undef this
> warning would be suppressed. So the #undef is something like a --force
> switch that I prefer not to use without reason, because I want to get
> the warning if my expectations are not met.
> 
> So I still think the patch is fine as is.

Perhaps we need to update the documentation first.

-- 
With Best Regards,
Andy Shevchenko




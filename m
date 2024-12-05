Return-Path: <linux-i2c+bounces-8346-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C10F39E4FAE
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Dec 2024 09:26:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 750A82836B6
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Dec 2024 08:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 228351D357A;
	Thu,  5 Dec 2024 08:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KgKLrl/e"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4842391BC
	for <linux-i2c@vger.kernel.org>; Thu,  5 Dec 2024 08:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733387200; cv=none; b=vE6kQuenr417lU0IcsoPQGktgb+38SbdCZlWRhIWMoT3R3g8xU4dIlNA4YY3ZlA3IfxrTkSlgdfPECYsgdYXaARdywhis/LlDX+w3RRMZl7L0SRIFt+iQ0A4AjMCBNMeOjPd/xDNL2Zq06NFlWdcLcbZTobW4IktOxAaRxXbIA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733387200; c=relaxed/simple;
	bh=yCIdDu0EIbmYS6iYaCgipVw8a+0biKo1Z2kQL5A2pAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hTRgtQlBPXebydlzNGh7BFUb765DaHiR77eebXTQb80wIC61KHI+DB5aTm6c+Z2sk7og274rvsy9ACQJdZLIO5R3yhYXniYgnCST6v+srOg/H3s3SVbATWQftWevlTySF60PRDRxJLq64YjsiCa/THBBEILpiirlbJBVmkYWe4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KgKLrl/e; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733387200; x=1764923200;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=yCIdDu0EIbmYS6iYaCgipVw8a+0biKo1Z2kQL5A2pAE=;
  b=KgKLrl/e1Jjy1sCQnYp58HWzrfXr379Uk2Uo3n/EgQ+7J77PVrwhYlCr
   jSI7fEfpYhvM4+t8nMY0ZfbzNfNHwsfFI2K3NoWJznoRXE0ja7tZKcdLK
   Tqzxf9PiCDkl0PbsYp/wdVenwQeTVxhLuW7j/xXQXzOamw1FalEi9yxs3
   AEeMOfusq++Gn8SVMLPICKNd5cUQwZs2+e8shD7cldWE+WSmohXBZQyhq
   KyuQqTF2LpGcHPBOhNtJ4GJvwOYeNhl/r8fcNpzeIPvLIOEH+nFZmXcwm
   G/bc9qfzv4fB5Du8FKLoWbaVCKPSA90zq12fjZ4hiMCAfg2ZM8CdWumBV
   g==;
X-CSE-ConnectionGUID: tZu5ezKqTnC4cDbajOe1YQ==
X-CSE-MsgGUID: ggsrC+SaR/SwPDEaxcRoYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="37466198"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="37466198"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 00:26:39 -0800
X-CSE-ConnectionGUID: rT/D8WWzQVi2KFsrMkDJKA==
X-CSE-MsgGUID: zQfxXZ3CSW6exCl3y6M8cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="98833393"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 00:26:37 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tJ7By-000000041h1-3pnC;
	Thu, 05 Dec 2024 10:26:34 +0200
Date: Thu, 5 Dec 2024 10:26:34 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: Actually make use of the I2C_DW_COMMON
 and I2C_DW symbol namespaces
Message-ID: <Z1Fjuo9Js0NzX5lH@smile.fi.intel.com>
References: <20241203173640.1648939-2-u.kleine-koenig@baylibre.com>
 <Z09bp9uMzwXRLXuF@smile.fi.intel.com>
 <aenflylxg46hie6yj2hzlelnzbq42mox24fzzz7o44dvb3j575@r2hgad4ghgym>
 <Z0-vKE3FLxa2BWmS@smile.fi.intel.com>
 <k75ryxfif2jhzb4b6ipkyxol22rt4p4uv4dquajkiwj5m5du6s@mxe2q7s2n575>
 <Z1Fb7eYPr8y_l2dT@smile.fi.intel.com>
 <907e39c2-ca06-4b51-9fb0-5b0745bf0f56@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <907e39c2-ca06-4b51-9fb0-5b0745bf0f56@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Dec 05, 2024 at 10:12:43AM +0200, Jarkko Nikula wrote:
> On 12/5/24 9:53 AM, Andy Shevchenko wrote:
> > On Wed, Dec 04, 2024 at 11:25:40AM +0100, Uwe Kleine-König wrote:
> > > On Wed, Dec 04, 2024 at 03:23:52AM +0200, Andy Shevchenko wrote:
> > > > On Tue, Dec 03, 2024 at 11:46:07PM +0100, Uwe Kleine-König wrote:
> > > > > On Tue, Dec 03, 2024 at 09:27:35PM +0200, Andy Shevchenko wrote:
> > > > > > On Tue, Dec 03, 2024 at 06:36:40PM +0100, Uwe Kleine-König wrote:
> > > > > > > DEFAULT_SYMBOL_NAMESPACE must already be defined when <linux/export.h>
> > > > > > > is included. So move the define above the include block.
> > > > > > 
> > > > > > As in the other email I pointed out the doc says that we need to undef the
> > > > > > symbol. No need to move it around.
> > > > > > 
> > > > > > The only requirement is to place that before any EXPORT_SYMBOL*() we want to
> > > > > > add it to.

[...]

> > > > Perhaps we need to update the documentation first.
> > > 
> > > I addressed that in https://lore.kernel.org/all/3dd7ff6fa0a636de86e091286016be8c90e03631.1733305665.git.ukleinek@kernel.org/
> > 
> > Thank you!

> Andy: is this your reviewed by? If so then
> 
> Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

I would like to have a clarifications from Documentation to be settled down
first. When it's done, depending on the outcome it may or may not be my Rb tag.

-- 
With Best Regards,
Andy Shevchenko




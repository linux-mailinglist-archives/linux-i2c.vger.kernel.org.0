Return-Path: <linux-i2c+bounces-8792-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7CE9FDC54
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2024 22:45:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9A9016146A
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2024 21:45:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 023A4192D79;
	Sat, 28 Dec 2024 21:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g3/Lmy8Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4069118A6CE
	for <linux-i2c@vger.kernel.org>; Sat, 28 Dec 2024 21:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735422319; cv=none; b=RudGlhxduAndg03hwS/YVQ6AdGGDf3Q3QN3GcFbglaOXEPH20qhs5RVTzjPMW+FFocu9dePLy2PJZ8XI94w7l17Y825cNnWab430M7wLXgJn2LTLk7p3wAzt+H3JefyA0x7zDLuW8ykbn8vh4p1OcU+0m0JUMJeBrojoCPQvWzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735422319; c=relaxed/simple;
	bh=zKXyaOzgTDZNTU89OEAMpGikt47btCzpmQNgMgfWTyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AT4ddihLA4Rs8AOwu+AWYTGFZLy1cGQYTmZNmCUh88eny5C6LFNFI6N1u1RaUhRSKr3RifMTU0PpobsAKZ3FLZMZdP9wQ5vMIcofQtaXqOaR6B0i4zfeX4fS0355qmlBYAUZ3q9b0nyxX6oVXetc8dyIwj9yn2C5O2eSrsdAvSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g3/Lmy8Y; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735422318; x=1766958318;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=zKXyaOzgTDZNTU89OEAMpGikt47btCzpmQNgMgfWTyk=;
  b=g3/Lmy8YtqPmr1oDKDcL10rDV1T80gLtTfc0kKz+fFIUTxyfzQk2cRGY
   A1Ym4ISBCNRbFsE7RpxkHrc0voUiIQ+Z68SupmBdkLxR8vGrabzDrLjio
   wx1S/yfsz7XFlM/zS28kC6ggs01X1JsWfwl2fQtyYlOeIFpCLvzcuRC4u
   5vVwC2uUNwQa6SKU45wFzKVyHkXxVOSyFcOTAckojYmTSGSsyUmw6wM3O
   rCm/0cGtBFmX4MkF0o4aJfhSJjeK76OutjiD5cnHIQS2Bu7m/4edNHQwT
   M8MnMWElRhlpRfxvG9A3u2pOaDY9Tf55WeUUf5a8+BhZxUIV/9b3v4s/K
   A==;
X-CSE-ConnectionGUID: 5K6h8BpgR3m+a5STsNlveA==
X-CSE-MsgGUID: 5yWQE7GqTFKO3/Ja79prCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="35077144"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="35077144"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 13:45:17 -0800
X-CSE-ConnectionGUID: pE0uwDFTR36dWjFNpofyXQ==
X-CSE-MsgGUID: DVXJVLRiSKeju1MY3bC5aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101279148"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 13:45:15 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tRecS-0000000DUSY-3evc;
	Sat, 28 Dec 2024 23:45:12 +0200
Date: Sat, 28 Dec 2024 23:45:12 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: Actually make use of the I2C_DW_COMMON
 and I2C_DW symbol namespaces
Message-ID: <Z3BxaFhtI1guVSle@smile.fi.intel.com>
References: <20241203173640.1648939-2-u.kleine-koenig@baylibre.com>
 <Z09bp9uMzwXRLXuF@smile.fi.intel.com>
 <aenflylxg46hie6yj2hzlelnzbq42mox24fzzz7o44dvb3j575@r2hgad4ghgym>
 <Z0-vKE3FLxa2BWmS@smile.fi.intel.com>
 <k75ryxfif2jhzb4b6ipkyxol22rt4p4uv4dquajkiwj5m5du6s@mxe2q7s2n575>
 <Z1Fb7eYPr8y_l2dT@smile.fi.intel.com>
 <907e39c2-ca06-4b51-9fb0-5b0745bf0f56@linux.intel.com>
 <Z1Fjuo9Js0NzX5lH@smile.fi.intel.com>
 <3lngh3xdllg5bx5u6uhzn42r557axqyrdpcmezg33nv75rngjv@pxifwvw3rhae>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3lngh3xdllg5bx5u6uhzn42r557axqyrdpcmezg33nv75rngjv@pxifwvw3rhae>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Dec 27, 2024 at 01:07:11AM +0100, Andi Shyti wrote:
> On Thu, Dec 05, 2024 at 10:26:34AM +0200, Andy Shevchenko wrote:
> > On Thu, Dec 05, 2024 at 10:12:43AM +0200, Jarkko Nikula wrote:
> > > On 12/5/24 9:53 AM, Andy Shevchenko wrote:
> > > > On Wed, Dec 04, 2024 at 11:25:40AM +0100, Uwe Kleine-König wrote:
> > > > > On Wed, Dec 04, 2024 at 03:23:52AM +0200, Andy Shevchenko wrote:
> > > > > > On Tue, Dec 03, 2024 at 11:46:07PM +0100, Uwe Kleine-König wrote:
> > > > > > > On Tue, Dec 03, 2024 at 09:27:35PM +0200, Andy Shevchenko wrote:
> > > > > > > > On Tue, Dec 03, 2024 at 06:36:40PM +0100, Uwe Kleine-König wrote:
> > > > > > > > > DEFAULT_SYMBOL_NAMESPACE must already be defined when <linux/export.h>
> > > > > > > > > is included. So move the define above the include block.
> > > > > > > > 
> > > > > > > > As in the other email I pointed out the doc says that we need to undef the
> > > > > > > > symbol. No need to move it around.
> > > > > > > > 
> > > > > > > > The only requirement is to place that before any EXPORT_SYMBOL*() we want to
> > > > > > > > add it to.

[...]

> > > > > > Perhaps we need to update the documentation first.
> > > > > 
> > > > > I addressed that in https://lore.kernel.org/all/3dd7ff6fa0a636de86e091286016be8c90e03631.1733305665.git.ukleinek@kernel.org/
> > > > 
> > > > Thank you!
> > 
> > > Andy: is this your reviewed by? If so then
> > > 
> > > Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> > 
> > I would like to have a clarifications from Documentation to be settled down
> > first. When it's done, depending on the outcome it may or may not be my Rb tag.
> 
> ping! Andy,

Sorry, I'm on vacation till mid-January.

> I don't feel like merging this patch without your ack
> as you had quite many comments here.

Yeah, it seems now we got the second approach, we need to choose one and
document it. This just makes my point: documentation needs to have
clarification to make sure everybody got it right and provide a unified
solution.

> Can you please check here again?

FWIW, technically the patch is correct and needed, but see above.

-- 
With Best Regards,
Andy Shevchenko




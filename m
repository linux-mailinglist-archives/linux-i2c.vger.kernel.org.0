Return-Path: <linux-i2c+bounces-12422-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAC6B34601
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Aug 2025 17:37:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BDC25E6C55
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Aug 2025 15:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 616682FE054;
	Mon, 25 Aug 2025 15:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dc0OLyys"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832502FB631;
	Mon, 25 Aug 2025 15:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756136208; cv=none; b=cWRBZ7MS88FrQdgL5vTKTEEHvds27c69pg4wvIn0FOIJSh2Rg6D09jM7kMxPVBLdnNhiNpRY9OWuOOAZPq/D2sUkbQTHpl0x8JO47UHUVSqGF1U6D7VC7pjZLi2wU935fRx3fPboc5gE1gNg/PaIxeOGSC3VClO+Oo9ZveYZieo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756136208; c=relaxed/simple;
	bh=/N+e2fzdzvHEqec+1vLZEoG/o3VY3GE8rhD0Hv2QYFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EOhK0syh5fp9GaEd6WzxOgyub/G+0WtkJkQaU42LjVRYNt0iqcuAUjcU8y9VK5gl2erc6i02Bqdpt0F0A939bYQD4YWFhgLxw2A5oqpQhS5kOWUUdiGbgYbMTb56yVaa3fW7u1Eb0XOkp4yTNAKH5hVwpYyyBHjdA5b9ta0B9b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dc0OLyys; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756136207; x=1787672207;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/N+e2fzdzvHEqec+1vLZEoG/o3VY3GE8rhD0Hv2QYFM=;
  b=dc0OLyys9lUk9R3z3GWsIGwY8C34WaQSHWyJa8d6VeMRtLPvxa0/kNEX
   KZbfPSGSvuv5UlrNKQWSP0G4iY1beOvm7VUGi9RyNwyDG1QQ0D8l6t0eW
   GolUTXjPhQ21XA1WRkFucyvah0R3RnbPhYeA4M/rYgBw9jmByjmBSPvvb
   +W3bR4oY1PiA2BDbwNYrqHy56jNoy+NPfc7oL/iv8e0atVJg7u/YLoUeQ
   GcPv2UgeJpJDkbRA4rpSycUzpJrs2GUSU5GXG8Bk+wlLKKuBqpHrcLAdK
   7edjYLRq2Fak3pTHT7C27sBdSB5jKfxZD8oiwuZvq9fauOq40xXOka6XD
   A==;
X-CSE-ConnectionGUID: Zr/JcRTwSxCOoJPqChncig==
X-CSE-MsgGUID: nkkBUwswQEKaspbSI+IItw==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69066219"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="69066219"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 08:36:46 -0700
X-CSE-ConnectionGUID: xkHHoNUCSqqFEsqi4pFGAA==
X-CSE-MsgGUID: 8LVu6i6pSnKd/mXXCMHeGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="169260341"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 08:36:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uqZFQ-00000008Y1x-089o;
	Mon, 25 Aug 2025 18:36:40 +0300
Date: Mon, 25 Aug 2025 18:36:39 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mario Limonciello <superm1@kernel.org>
Cc: Askar Safin <safinaskar@zohomail.com>,
	Linux i2c <linux-i2c@vger.kernel.org>,
	linux-acpi <linux-acpi@vger.kernel.org>,
	regressions <regressions@lists.linux.dev>,
	DellClientKernel <Dell.Client.Kernel@dell.com>,
	linux-gpio <linux-gpio@vger.kernel.org>,
	Raul E Rangel <rrangel@chromium.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [REGRESSION][BISECTED] Dell Precision 7780 wakes up on its own
 from suspend
Message-ID: <aKyDB7h7cUBOLbiJ@smile.fi.intel.com>
References: <197ae95ffd8.dc819e60457077.7692120488609091556@zohomail.com>
 <5d7ee2bc-6595-46f1-8c8f-0c439f033407@kernel.org>
 <197af82e9e7.10ca643e5467232.6943045931834955890@zohomail.com>
 <6f42c722-cfa5-416d-8b63-730ad88e6b9d@kernel.org>
 <197bfafc23e.e6344936595425.1881540896161671378@zohomail.com>
 <9eac81e6-b4ee-4210-84ac-cbf7bf811130@kernel.org>
 <aKyCl_ly_LhtEOpc@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKyCl_ly_LhtEOpc@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Aug 25, 2025 at 06:34:48PM +0300, Andy Shevchenko wrote:
> On Mon, Jun 30, 2025 at 02:40:28PM -0400, Mario Limonciello wrote:
> > On 6/30/2025 3:14 AM, Askar Safin wrote:
> > >   ---- On Fri, 27 Jun 2025 07:58:15 +0400  Mario Limonciello <superm1@kernel.org> wrote ---
> > >   > That's odd.  It should be made when the PMC core driver binds.  Maybe
> > >   > others will know what's missing here.
> > > 
> > > Command "grep -r -E -I last_hw_sleep ." in culpit kernel (1796f808e4bb2c074824d)
> > > shows nothing. (This is somewhere around 6.1).
> > > 
> > > So, culpit commit is too old.
> > > 
> > > If you want, I can retest this thing on current master and on current master with
> > > revert 1796f808e4bb2c074824d.
> > > 
> > >   > I see in your bad config interrupt 14 is waking the system.  In the good
> > >   > config interrupt 8 is waking it.
> > >   >
> > >   > What is in /proc/interrupts?
> > > 
> > > /proc/interrupts from culpit kernel: https://paste.debian.net/1382819/
> > > 
> > > --
> > > Askar Safin
> > > https://types.pl/@safinaskar
> > > 
> > 
> > Looks like your interrupt 14 is ACPI device INTC1085:00.
> > 
> > Some quick searches this seems to be an Intel GPIO controller.
> > 
> > Andy,
> > 
> > Any ideas how to debug next?
> 
> I believe it's related to the touchpad (can you check that wake happens due to
> actually IRQ on pin 355 of the GPIO controller?

In other words we need to enable debug of the pin control subsystem and see
what it will print in dmesg.

-- 
With Best Regards,
Andy Shevchenko




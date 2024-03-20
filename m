Return-Path: <linux-i2c+bounces-2453-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 362C6881327
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 15:16:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 675E81C22898
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 14:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39A004207B;
	Wed, 20 Mar 2024 14:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J+r942yA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471E43BBF7
	for <linux-i2c@vger.kernel.org>; Wed, 20 Mar 2024 14:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710944141; cv=none; b=n7jSrPRjiRhDvXCa4J5cz8DZ0AUOa/wndz5WdqFsKWjI/wVphxK34K+JOn3bnDijVdoTulo9taR8cxbsMzVHmzwsJy3wAoqVJ7pRBiBu1azVUwMiExUbkbg5Y8PL6xXWTw7vTQeFzLzAqxIiWGdhOLUykBcFn+n6Xr1P5UM0aVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710944141; c=relaxed/simple;
	bh=QpIAZE24qb7LABgu2zCEDiHLlT2aU9QkjS7N8r9C3kQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aJwaUcYpb6TavEBw+0uQZFaIekQb8kDn7KT+ZmtZXFyy0/4/VsgACxZH6ZemSI6wCEVFhgaWETI2QtKYKLBX8yHMCm+vS8LT7vPKgeN2fIT/BSDV7kL69UdcskpxLK2jRBFI1O6RuS4vbsKQYADGgvXZ10bOA8oWizEpcA638zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J+r942yA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710944140; x=1742480140;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QpIAZE24qb7LABgu2zCEDiHLlT2aU9QkjS7N8r9C3kQ=;
  b=J+r942yA0gqkVBFGoTRVtHg09+p3Lu0AxMkTYqV+sxy2AFfoPYD5W9x+
   9EJ/3noBscGSNaYj7VV92zSkXQsZBf7LUpSWlmlDMmGEpzIvjhoegD0wG
   Fv64mTLEPUGRSj5uaABFU/bwcLdLtFybMclvNgmFpHq+7p/S9ZcM5WFeT
   muG85wAni7R5b/1+mDyfLCy7i9OrM5ARWwjQ6XA22RcN0FsRoAX8yjfvq
   3Ut4GEzGiiumeCx7/QVO21sz8XIldIuYtwreLpRxyJsHlwIppj+B6I8lI
   Ebq8stgqfTP5N9vnAlqh/wt4EhpSGHExROVORMKmsqJin8y7Nz54eGNkY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="17013190"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="17013190"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 07:15:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="914669360"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="914669360"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 07:15:37 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rmwj8-0000000EaYj-3PDj;
	Wed, 20 Mar 2024 16:15:34 +0200
Date: Wed, 20 Mar 2024 16:15:34 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: i2c: designware: unhandled interrupt on N100 lpss channel 0
Message-ID: <ZfrvhvuW3ZgzWYjt@smile.fi.intel.com>
References: <e3f2debf-c762-48d9-876e-bcb60841f909@gmail.com>
 <af839910-2c3d-4559-b8b3-1c6f2372144e@gmail.com>
 <af547aab-e957-4dbf-922d-e2ad13e19877@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af547aab-e957-4dbf-922d-e2ad13e19877@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Mar 20, 2024 at 03:37:34PM +0200, Jarkko Nikula wrote:
> On 3/20/24 2:27 PM, Heiner Kallweit wrote:
> > On 19.03.2024 22:11, Heiner Kallweit wrote:
> > > On a N100-based mini pc I see the following. I found older reports with the same symptom,
> > > but root cause seems to be different.
> > > 
> > > - Interrupt 27 is not shared in my case
> > > - I checked register values on entering the ISR. Interrupt mask and DW_IC_RAW_INTR_STAT
> > >    are both 0.
> > > - After an interrupt storm of 100,000 interrupts the interrupt gets disabled
> > > - The issue affects channel 0 only
> > > 
> > > If not the I2C IP, then who else can touch the interrupt line?
> > 
> > I noticed that after including INTEL_IDMA64 in my config the problem no longer occurs.
> > So there seems to be a dependency. Should it be reflected in Kconfig, e.g.
> > make MFD_INTEL_LPSS dependent on INTEL_IDMA64, or let it imply INTEL_IDMA64?
> > 
> Hmm.. interesting. I'd say BIOS perhaps has left the IDMA active and is
> generating interrupts until the idma64 driver acknowledges it.
> 
> There should not be generic dependency since the i2c_designware is not using
> the DMA and a quick test on one platform where idma64 and i2c_designware are
> sharing the same interrupt without CONFIG_INTEL_IDMA64 not set didn't show
> similar behavior.
> 
> Andy: Do you have any additional ideas or debug hints to this?

Can you share `cat /proc/interrupts` in non-working and working cases?

Just to confirm: loading idma64 driver fixes the issue, correct?

-- 
With Best Regards,
Andy Shevchenko




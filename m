Return-Path: <linux-i2c+bounces-5248-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF8094CFFC
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 14:19:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81218282BE6
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 12:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 229FC194081;
	Fri,  9 Aug 2024 12:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KQ+RfkWG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A0A19309D;
	Fri,  9 Aug 2024 12:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723205959; cv=none; b=OjuysZQ0VKuMOlySoQwDqPG19vVll0fPpPyuOlMEkHKteNVRFC1bHbjCUz4Eq+yqfAL5USzdZLNurB6ArGlBgCip8Gx/KhrPDOxmw/93xKqfGATqqgPvlh5qjkDB1Q/j8IZkZ96qgDTFA8wvPm/j+g9I0o/YmGYeBYEhK7lenRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723205959; c=relaxed/simple;
	bh=EwpoTDeMRiz/mNTb0pde6dTI3Kfg9kV/geo7GvjFXps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XgKtahF7CSpEcz6JHdkyaXZyfynrMrbEY+lyG1yo1W+VDcKYD+/EycJYb/JICiw1li4CZnfGH/gZpmPiyfiy9mgdLCxF50N48X42R1NoPhTVPlSYr3LWmHJB1REf8H5ivyLB5u4I6zf0QmDgZCfzAqFLSXuic3yHqaflN2uy7MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KQ+RfkWG; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723205958; x=1754741958;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EwpoTDeMRiz/mNTb0pde6dTI3Kfg9kV/geo7GvjFXps=;
  b=KQ+RfkWGY6O7MLkA3vyTE7/yDmS9/XNO1xPl7eE8l8ErqFspNwn4gAbR
   CQQn932E/xQa3acAhDGgmTiAZXo4HpArsft1vWiMMBYTpVAOXFxCEqWxf
   soOdwd7N/EzNRQoSTA9PD5kmw3MNirOQwsym2cXn1n8uXCxp67ScCMP0/
   PRdGEj/YbheQS/zueKrWVIiRXG88rBQhohu5UhCjgMv82+1dwjehp2qoH
   o7clkwizJf87aILr6rgQdl/de80RMxBebwVflt+DCds7xZSlIRWXLQWm0
   r5Hg6gQSQwp6FxNECjxeBDrjQlt/R6621+Q29BfX68PQcy/g6UGAzhLLb
   g==;
X-CSE-ConnectionGUID: 1Fx/GmXdSnu4Bdgq36NtsQ==
X-CSE-MsgGUID: ShhLsWupTt+EQlDSY5ucNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="20939203"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="20939203"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 05:19:16 -0700
X-CSE-ConnectionGUID: 4K1gC6H/RZaDQcghtQpxFA==
X-CSE-MsgGUID: jvcRsWdxTxG5Egytdxe0Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="62505555"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 05:19:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1scOaL-0000000DPdS-3N8b;
	Fri, 09 Aug 2024 15:19:09 +0300
Date: Fri, 9 Aug 2024 15:19:09 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Breno Leitao <leitao@debian.org>
Cc: ldewangan@nvidia.com, Dmitry Osipenko <digetx@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, paulmck@kernel.org,
	apopple@nvidia.com, Michael van der Westhuizen <rmikey@meta.com>,
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] [i2c-tegra] Do not mark ACPI devices as irq safe
Message-ID: <ZrYJPdW0-MQMejP3@smile.fi.intel.com>
References: <20240606132708.1610308-1-leitao@debian.org>
 <ZmhHvpHlkxe4kid7@smile.fi.intel.com>
 <ZmmQu15Z2acgAjZQ@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZmmQu15Z2acgAjZQ@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Jun 12, 2024 at 05:12:43AM -0700, Breno Leitao wrote:
> On Tue, Jun 11, 2024 at 03:49:02PM +0300, Andy Shevchenko wrote:
> > On Thu, Jun 06, 2024 at 06:27:07AM -0700, Breno Leitao wrote:
> 
> > > The problem arises because during __pm_runtime_resume(), the spinlock
> > > &dev->power.lock is acquired before rpm_resume() is called. Later,
> > > rpm_resume() invokes acpi_subsys_runtime_resume(), which relies on
> > > mutexes, triggering the error.
> > > 
> > > To address this issue, devices on ACPI are now marked as not IRQ-safe,
> > > considering the dependency of acpi_subsys_runtime_resume() on mutexes.
> > 
> > ...
> > 
> > While it's a move in the right direction, the real fix is to get rid of
> > the IRQ safe PM hack completely.
> > Look at how OMAP code was modified for
> > the last few years and now it's pm_runtime_irq_safe()-free. The main
> > (ab)users are SH code followed by Tegra drivers.
> 
> Thanks. 
> 
> I think these are two different goals here. This near term goal is just
> fix the driver so it can use the pm_runtime_irq_safe() in a saner
> way, avoiding calling mutexes inside spinlocks.
> 
> Getting rid of the IRQ safe PM seems to me to be more a long term
> desirable goal, and unfortunately I cannot afford doing it now.
> 
> Laxman, what is your view on this topic?

Yes, please, comment on this. We would like to get rid of the hack named "IRQ
safe PM runtime".

-- 
With Best Regards,
Andy Shevchenko




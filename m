Return-Path: <linux-i2c+bounces-7027-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B3A987360
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 14:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D05A0B26199
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 12:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C2171714B3;
	Thu, 26 Sep 2024 12:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F1Kq308K"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EB69474;
	Thu, 26 Sep 2024 12:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727352953; cv=none; b=B1qczIorsUcgi9F/3Oy8jfAIa0WZekFzD/EtoQbi3cOVnDrfDrL4j+JldNHHtxz3iZ3la1UMRv0GA+WJuhLZmmegOetA30PXQ6CiaCQW8KUXaqo99WB6TVvFybgjK60WVLkmif8LRzcnOP1ZYYBoGW0rSFkXIuMzoaZuAKTPu9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727352953; c=relaxed/simple;
	bh=sjgU5g/CID282GP5kCGi+0lsDRY6kw1D1otvv4/9btc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q/QCPs/AA3iEw3QSXaJT3DZjTC5V0RoLAFscZ10j1a6AqDMSDf7p1/7XZicnBKMW77Rmbag26l+gaBSJhPXxBqVDf4hYImJl/ZYmuD4oiBaKhj26FCPEpU+v8HLeZ3EK6/mzd6IAKJIto5AJ2iVPsds4bFk5k0GFit2PwE/Rqvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F1Kq308K; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727352952; x=1758888952;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sjgU5g/CID282GP5kCGi+0lsDRY6kw1D1otvv4/9btc=;
  b=F1Kq308KZT+nc1rymhOVIAq0C4/bcvmzA526BYFOc17pf2UKqBQgEDAC
   QLI6zcFV5ng9XrrRvu7Ml1Tv4E2p0Ko1Y4Nfvd6QA9p5DsFyLM+G7vurN
   h2u1uZ4+7LLFTecyrSS91GM9fX+VTQs/bC0hOXUGtM9RsaIq+xevqiZO7
   cwRpb5rDhmHLUmGGby/G0GEwdSMC60CneTcGea065fdmEIZRB9mUO9HVp
   T7X+WtVPwSFiioP4JKxs2+O3Y6aVNq1bnrfb4ekgrrAelixfSmNK+gQ9y
   z4UIxyHYLD12Zem6dnDgCvCkE+k3FF12EVdFOKEIXla3M1tmlfjGBKimc
   Q==;
X-CSE-ConnectionGUID: i4jbkApYQXSerkr1Q3Ljdw==
X-CSE-MsgGUID: rcLYAihPS7O8/VA4sXxyyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26308888"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="26308888"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 05:15:52 -0700
X-CSE-ConnectionGUID: e9In3DOWSBOJhxCqfZpdAA==
X-CSE-MsgGUID: K3Fscl8ORdK9veuQtOLEZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="71723276"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 05:15:49 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1stnPP-0000000DBqJ-0ode;
	Thu, 26 Sep 2024 15:15:47 +0300
Date: Thu, 26 Sep 2024 15:15:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "hunter.yu" <hunter.yu@hj-micro.com>
Cc: jarkko.nikula@linux.intel.com, lenb@kernel.org, rafael@kernel.org,
	jsd@semihalf.com, andi.shyti@kernel.org, linux-acpi@vger.kernel.org,
	linux-i2c@vger.kernel.org, andy.xu@hj-micro.com,
	peter.du@hj-micro.com
Subject: Re: [PATCH v2 0/2] i2c: Add ACPI support for HJMC01
Message-ID: <ZvVQZG9NoEJrSmWV@smile.fi.intel.com>
References: <20240926024026.2539-1-hunter.yu@hj-micro.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926024026.2539-1-hunter.yu@hj-micro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Sep 26, 2024 at 10:40:04AM +0800, hunter.yu wrote:
> Hi, everyone:
> 
> HJMC01 is an ARM-based server processor that contain a
> Designware I2C controller. This series add ACPI support
> for the Designware i2c controller.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko




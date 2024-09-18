Return-Path: <linux-i2c+bounces-6847-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6170D97BA7A
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 11:58:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4326B22385
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 09:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70CA17A586;
	Wed, 18 Sep 2024 09:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AaZbRfWz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F3117920E
	for <linux-i2c@vger.kernel.org>; Wed, 18 Sep 2024 09:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726653522; cv=none; b=QQfEh2smAIu8Sqq0nVjCWnNhx6ENf0CVhwMNJ2TdLUDkVoBrPRZQHBIfAzNTnG2tZusreuymK28E1A4iC4FoxwydnYUIWKJm6JxxRSYxO75SXdkgBWA8P1CuAy1r6xzMzhdDvLXY2psSWugp7RSxaD/aqpeZdzZrKs+vL7Cagvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726653522; c=relaxed/simple;
	bh=T89eP0uK7Bl4pucOJ1BflLdxEXYtVx2KucY2rtfbDpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nq1EIRWFh+yKKDXwb3M3MJGZISv8qfRLlA1oZdagmODCOkxT+GXwaXdwWxnbg4ng/3kiMuXfp9N/UDPxPrfVxFZlRIevOm8HADr8cZFkxVvWBOFIlDomU++gY2GFrcraihgwD1m/p49JP2iWKRLOxQx14zrDF5V620U8LZmGxEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AaZbRfWz; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726653521; x=1758189521;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T89eP0uK7Bl4pucOJ1BflLdxEXYtVx2KucY2rtfbDpw=;
  b=AaZbRfWzRc+d7hSnf2C5qMIPUGxKyyyTtXc4CLGPlJCd1Fs7sDbVrAZl
   c4lnJ/qQRk3o/dcTlFICerF3uUuMB+C3vZuK8qo9bFmH7pOBI+AXG01ej
   DFhuh4LQSTGpJkLDreHVQetGgDKPtIWKQFyMVsTrr2PZmMIAQRJYTmeER
   wddqvll4FJH+IVFAbW+zssIioMaiJe5nnrLHFTzUYWLzifLARJTtNfzKG
   hmhY2HJML/iJoXtqxgTVpVP8wz2mUD+QcAQjBo7sxl8DxBMK0yiFSkfaw
   nV90qGOFkVWiH6+CdcR7H5NuG0ZsF/Dhr2J0qe8RAlnhMb6H+pZ1AgQq4
   g==;
X-CSE-ConnectionGUID: oDWje27zTOaWJrcVRF2M1Q==
X-CSE-MsgGUID: 8/57kYsJTAC5MkxY6x1eDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="36125741"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; 
   d="scan'208";a="36125741"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 02:58:40 -0700
X-CSE-ConnectionGUID: 9ID1GXcQR8KMSRgwFACkXQ==
X-CSE-MsgGUID: VsrrcblnQMmsek4LnInh1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; 
   d="scan'208";a="69495634"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 02:58:39 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sqrSG-0000000A8Ro-1QpP;
	Wed, 18 Sep 2024 12:58:36 +0300
Date: Wed, 18 Sep 2024 12:58:36 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com,
	Patil.Reddy@amd.com
Subject: Re: [PATCH v5 5/8] i2c: amd-asf: Add i2c_algorithm operations to
 support AMD ASF with SMBus
Message-ID: <ZuqkTPj-QVgTm8y4@smile.fi.intel.com>
References: <20240913121110.1611340-1-Shyam-sundar.S-k@amd.com>
 <20240913121110.1611340-6-Shyam-sundar.S-k@amd.com>
 <ZuSNkuVMnISqMtD9@smile.fi.intel.com>
 <af4fbf35-e6cc-4a21-8fa1-0424357a373e@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af4fbf35-e6cc-4a21-8fa1-0424357a373e@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Sep 17, 2024 at 11:47:00PM +0530, Shyam Sundar S K wrote:
> On 9/14/2024 00:38, Andy Shevchenko wrote:
> > On Fri, Sep 13, 2024 at 05:41:07PM +0530, Shyam Sundar S K wrote:

...

> >> +static void amd_asf_update_bytes(struct amd_asf_dev *dev, u8 bit, bool set)
> > 
> > I didn't get the naming, the above using IO port with _bits, and this is MMIO
> > with _bytes. Are you sure the naming schema is correct?
> 
> Thinking to merge both the functions into one, something like this:
> 
> enum io_type {
>     IO_PORT,
>     MMIO
> };
> 
> static void amd_asf_update_target(struct amd_asf_dev *dev, enum
> io_type type, u8 bit, bool set)
> {
> 
> ...
> 
> }

I'm not talking about merging them (and merged variant seems less readable
to me), but about naming. I.o.w. it's not obvious what the difference _bits vs.
_bytes.

> >> +{
> >> +	unsigned long reg;
> >> +
> >> +	reg = ioread32(dev->mmio_cfg.addr);
> >> +	if (set)
> >> +		set_bit(bit, &reg);
> >> +	else
> >> +		clear_bit(bit, &reg);
> >> +	iowrite32(reg, dev->mmio_cfg.addr);
> > 
> > Ditto (bitops and related things).
> > 
> >> +}

-- 
With Best Regards,
Andy Shevchenko




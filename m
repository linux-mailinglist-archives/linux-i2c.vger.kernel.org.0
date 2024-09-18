Return-Path: <linux-i2c+bounces-6848-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD73697BA7C
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 12:00:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C50CB27BA4
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 10:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08EB815D5A1;
	Wed, 18 Sep 2024 10:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V4ZpjO5I"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AC315B108
	for <linux-i2c@vger.kernel.org>; Wed, 18 Sep 2024 10:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726653628; cv=none; b=HD785XKCuHZFqUcYF0boNmFxCPs8fJq9PDbayWki84pA0cOD7GDczeCwmxEMEcpKPgaM81MIIzrHsXRJopKFso0f7CbijUO+Paluon/HTL2LCgV7EPxK5up+05Y4dj8D0qY4Va3W/QAnSZZrbOcL/DqcTdQtYXHC4VaGWPXUe4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726653628; c=relaxed/simple;
	bh=mNprADLrif39m9ZQhed7DVtVAHoY6s1vdjijk9hhogY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lj12erXsppw2Ab5+DxmOjewpMr0SPMCdIdkU7KVeelGm5bbBNanUkqCX1ghqllNXwrwxLcwDsWtNWEx+6eMR8vhQt8rjWbf+mnNCoFxadbKNquQ7R9/0saBp8tqOO2+DQlyyVJ4VdN07VVJOjGyiikWUyF4cDq+yG+XWouGa1M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V4ZpjO5I; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726653628; x=1758189628;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mNprADLrif39m9ZQhed7DVtVAHoY6s1vdjijk9hhogY=;
  b=V4ZpjO5I1HR1DK+AZ3ZYgxbutAkBRe7ILDiky2dUkLNsJqL831/qwRXh
   so0glyeJTzhyKSdcZI/ZBAk9rn92qTD6CIaBiZ4sV4s7wSc9HFaMDn5Pm
   a8Kcda2fua4G9iPWH76v5r/lOB2G/fp9WammIHcoJxJW/QBvSv7fwUx14
   SMKyh88DgF1DAoFc2d4zMfeCgWUhWfFZJ01d2dtSiFpZjefoHXHbky147
   zxwPQOB8eqDoDU+8XBjoScwzx2Tg5T/YfxlmwRPo8i3iIUEKUC9KL1UqL
   HEPPpz34aqc1tdEsXF8kRMuCYGRq5HpUP1j6DfGoeREJtgBYoOyMih4uk
   g==;
X-CSE-ConnectionGUID: j5LRVFaFTaqj6TpZgPWrHA==
X-CSE-MsgGUID: sQk1OpMgTuG0icgsg1ZmCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="29341626"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; 
   d="scan'208";a="29341626"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 03:00:23 -0700
X-CSE-ConnectionGUID: fPiUL15oT5ycObrrfz8GuA==
X-CSE-MsgGUID: rvKszdOEQbSUZJgD4POyiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; 
   d="scan'208";a="106949000"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 03:00:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sqrTu-0000000A8TH-1TjO;
	Wed, 18 Sep 2024 13:00:18 +0300
Date: Wed, 18 Sep 2024 13:00:18 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com,
	Patil.Reddy@amd.com
Subject: Re: [PATCH v5 6/8] i2c: amd-asf: Add routine to handle the ASF slave
 process
Message-ID: <ZuqksnAqCAEFnhK-@smile.fi.intel.com>
References: <20240913121110.1611340-1-Shyam-sundar.S-k@amd.com>
 <20240913121110.1611340-7-Shyam-sundar.S-k@amd.com>
 <ZuSP3ztZ9G5-Y7G0@smile.fi.intel.com>
 <8378c4e5-0164-43a9-89f6-aa53d2ab4738@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8378c4e5-0164-43a9-89f6-aa53d2ab4738@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Sep 17, 2024 at 11:51:27PM +0530, Shyam Sundar S K wrote:
> On 9/14/2024 00:47, Andy Shevchenko wrote:
> > On Fri, Sep 13, 2024 at 05:41:08PM +0530, Shyam Sundar S K wrote:

...

> >> +	i2c_slave_event(dev->target, I2C_SLAVE_WRITE_REQUESTED, &val);
> > 
> > Can this fail / return an error code? (I haven't checked)
> 
> i2c_slave_event() returns an error code, but here it is done with the
> workqueue callback context. Hence I skipped the error checking part.

This requires a comment why it's okay.

...

> >> +	for (idx = 0; idx < len; idx++) {
> >> +		val = data[idx];
> >> +		i2c_slave_event(dev->target, I2C_SLAVE_WRITE_RECEIVED, &val);
> >> +	}
> >> +	i2c_slave_event(dev->target, I2C_SLAVE_STOP, &val);

Same here.

> >> +}

-- 
With Best Regards,
Andy Shevchenko




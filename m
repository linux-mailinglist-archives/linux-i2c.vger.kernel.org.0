Return-Path: <linux-i2c+bounces-6871-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5A297CB58
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Sep 2024 17:08:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 778D91F2682D
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Sep 2024 15:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4188B1A0AFA;
	Thu, 19 Sep 2024 15:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Db1Hz+DT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB5219FA86;
	Thu, 19 Sep 2024 15:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726758482; cv=none; b=B3O1OxLP0m2rVhLUytBY3bCHgATOLIe0AHygmEd51C//mfgusxvZnQy1I2qwt4T8oZ8m0SLeW2EcUg8lm9Q/hLR7hvdRCSMAdMHUFVZKSKwzF08h5ijx9s1fiRKLErzu2Ee5JVGAu95hMHmE0gT7Urc3dN/jufKX0/IAH1ca+JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726758482; c=relaxed/simple;
	bh=d7+e0z+HM1FbDSJBPiuL6+IjrnUUWlSgvKoD5/oI7pM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rNhkEQ0oyscOkhk51KNpuF1t/PizrU/cvqVJg7bq7t6kGt0Bh9L/oJqujVwyKyJ0qq+J+M91oiIoM+l3E2FXyjG+wEtxsnzwT9lTd+YQwJEKTyxsK0Ur3j2v+VQ4fUkKA6KbTUR4m7VUSKTminDII2gBAvDqvxwUWFRAurpNnJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Db1Hz+DT; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726758449; x=1758294449;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d7+e0z+HM1FbDSJBPiuL6+IjrnUUWlSgvKoD5/oI7pM=;
  b=Db1Hz+DTl9xKespZ90NxKa+2mQI7HOdBiMmwgZlLAW2Wek/X0f5F/f+F
   OayZO6IhMk7WIOPD8t9O7p2sHJYUqJenVhD6iIxoqzIEy1TkpjIhmBh+I
   isa1M+7onrog2QspmhUIeg4mEGgiEDqKVdYx0v9Rsp2OqkIPjWw/SrOid
   XNISPlHzDa8kQuso/HC2MTlhGD1gnFu1fECcJzO3q/VAZcxBsew3RKQht
   FsJihdKc4nKDUGZDrG7J0Hz3UEI+9qPlqoaMZ0Vjula9VokWSMB8XCOXn
   7HQShNFpQvFkre0Yif03PrmByjR8pSkaAoH1AD6KuBQtiT6hFDPY9gh8e
   A==;
X-CSE-ConnectionGUID: Y5QieRS5RBic2AVc+s420w==
X-CSE-MsgGUID: GhXBp/aQRYmS+ZBJbm8aUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25871510"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; 
   d="scan'208";a="25871510"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 08:07:29 -0700
X-CSE-ConnectionGUID: OQWyeYaBR02ud/un0Yp+tg==
X-CSE-MsgGUID: IQZdqQKYSmCe6TMWJ/cAbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; 
   d="scan'208";a="69851509"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 08:07:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1srIkd-0000000AZEX-3SIC;
	Thu, 19 Sep 2024 18:07:23 +0300
Date: Thu, 19 Sep 2024 18:07:23 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: hunter.yu@hj-micro.com
Cc: rafael@kernel.org, lenb@kernel.org, jarkko.nikula@linux.intel.com,
	mika.westerberg@linux.intel.com, jsd@semihalf.com,
	andi.shyti@kernel.org, linux-acpi@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: designware: Add a new ACPI HID for HJMC01 I2C
 controller
Message-ID: <Zuw-K-UT0fbnoQBS@smile.fi.intel.com>
References: <20240919062943.1551197-1-hunter.yu@hj-micro.com>
 <20240919062943.1551197-3-hunter.yu@hj-micro.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240919062943.1551197-3-hunter.yu@hj-micro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Sep 19, 2024 at 02:29:43PM +0800, hunter.yu@hj-micro.com wrote:
> From: "hunter.yu" <hunter.yu@hj-micro.com>
> 
> Define a new ACPI HID for HJMC01

Missing period at the end.

...

>  	{ "HISI02A2", 0 },
>  	{ "HISI02A3", 0 },
>  	{ "HYGO0010", ACCESS_INTR_MASK },
> +	{ "HJMC3001", 0 },

Please, keep them ordered.

-- 
With Best Regards,
Andy Shevchenko




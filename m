Return-Path: <linux-i2c+bounces-9378-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B98A3244E
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 12:08:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1BF5168338
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 11:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1623C209F46;
	Wed, 12 Feb 2025 11:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SmpDLEsd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A1B2AF19;
	Wed, 12 Feb 2025 11:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739358495; cv=none; b=FLVuP9LIDdgnTmaMI7BCHB94upWdmDFDUdGetBLT76AuWUZZzfY5LTbOPAj3iXBfI6AzqQiIh2m8ofOd7bsq4DJdhuFU7BHXfTlHr1OcjslUq114Cjjv/bJryomal+nz93sT23JVcHIGn5f9Pm/fphZk8X5f9/DBFKAqiPeR+N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739358495; c=relaxed/simple;
	bh=qThsziivxyZWyQ1D5LgFpNGNRInTExrtwDdoyyk9n1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FdVPFcBEbQG+8scqi1zBE/+SOniMtIGsH3TUqnrrpJq5VmpvTM1YVs/CI0Dxk1y7Jdjaa7tftBdcDRyJygMv69BkfVJ2ibUiG4PTZ9zgj3jdCdJGiqOMQAbpLQzzfyswryWYqNP074KlW4a4xMITEd0mQCRnWXEaBamr/F0/Ld4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SmpDLEsd; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739358495; x=1770894495;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qThsziivxyZWyQ1D5LgFpNGNRInTExrtwDdoyyk9n1E=;
  b=SmpDLEsdYWrnD5WaWh934d346fRpgmyOo0zLk6X822QrQNlA1+dT5vZ5
   96z1OORuy5qpcVzzUB9nRYDUDz55tp2+shmac/ahEuDIl2EafLkkeUOQW
   T/Qyer1I/ObBI2IlFshIvs728xrt6FnwkrgqClnCfbI1Hc87tMOtOcDHS
   ++EZkQec8Y+MMKenBLq3b6KYpUu15xzUPP46iA4nO+YWMnBvxn5EljEgv
   5QaIYktGgK2u/bBy2c05DgtA/9LJn0QPy1cagh1LPIMmlzmkRMJaylV+H
   e1la2e6qljHN2D8uUopskTpg9DQoSrJPd+CKIun2f6RJ2ErJJ7InKBH5m
   w==;
X-CSE-ConnectionGUID: u0LIsKsmSfGo7HTE+dXY3Q==
X-CSE-MsgGUID: JF/xxYzuRUWb6yXb4Qlnxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="40272517"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="40272517"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 03:08:14 -0800
X-CSE-ConnectionGUID: IZ9Wn3FET8+DAoxhvXFWTw==
X-CSE-MsgGUID: xOb3JxTNQEGWV6NqYgDxkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117416943"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 03:08:13 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tiAbC-0000000AoUN-3DMp;
	Wed, 12 Feb 2025 13:08:10 +0200
Date: Wed, 12 Feb 2025 13:08:10 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Konstantin Aladyshev <aladyshev22@gmail.com>
Cc: linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: Assigning fixed numbers to i2c buses via ACPI code
Message-ID: <Z6yBGoUeoNQGZHVn@smile.fi.intel.com>
References: <CACSj6VVNFZWJZVk4k98QYGdCQ=u5TzyfRE9NC_3xAKMRoPGzJA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACSj6VVNFZWJZVk4k98QYGdCQ=u5TzyfRE9NC_3xAKMRoPGzJA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Feb 12, 2025 at 11:18:44AM +0300, Konstantin Aladyshev wrote:
> Hello!
> 
> Is it possible to assign fixed numbers to i2c buses via ACPI code?
> 
> In DTS code it is done via aliases
> (https://docs.kernel.org/i2c/i2c-sysfs.html#caveat).
> 
> For example:
> ```
> aliases {
>     i2c20 = &imux20;
> }
> 
> &i2c1 {
> status = "okay";
> 
>   i2c-mux@77 {
>      ...
>      imux20: i2c@0 {
>         ...
>      }
>      ...
>   }
> }
> ```
> 
> Is it possible to do something like that in ACPI code?

Why? What the problem do you actually have?

-- 
With Best Regards,
Andy Shevchenko




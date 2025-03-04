Return-Path: <linux-i2c+bounces-9718-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC91A4DD23
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Mar 2025 12:56:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B45A31899FE8
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Mar 2025 11:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DF55202F88;
	Tue,  4 Mar 2025 11:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X/3bW/hH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0534202F67;
	Tue,  4 Mar 2025 11:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741089241; cv=none; b=roR35ELbwdxmLh5AMZMhbLYLp52lUdpXdY2A+0Dm6mwnEdggdczId4QmtXefBDHjh7m1XUhxORBSV7oo+VasWvpHjOvroWq5jeSeGXLni4qD0XJ55khAsIoFcBtZo1yVZ4pmJGnx3mOYECKHJ+9yNvznC8U9Wox6A7oFwtswDyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741089241; c=relaxed/simple;
	bh=qq7TZvcZSktmWVe6C6ZIq89UVbAqUNI01Xhm1mJcWnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LLOLeDwyTW/uKEF8+e8xAMlqhU5mW3ZhwwE3qJoSoRaubCTOR7JT3sehVCJK1tLvMnF1OnQAj+k/mdNv1cfOwA/v2mzagBpPGEgJtlk2aPKH1M3wA5Pe4dAY7+BL2h9qsJ7iQjfnY3Xta07jHqJIO87Di96HYMgGdy4L6V23lwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X/3bW/hH; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741089240; x=1772625240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qq7TZvcZSktmWVe6C6ZIq89UVbAqUNI01Xhm1mJcWnQ=;
  b=X/3bW/hHMzh84AXdHNCDWKw289GLJn5Xfcwt2zALu902zSNI03kSI947
   /baNtvRDY3degselOQuuigYc0nM5a9qoFf/RrU4W3jsvGcB34WG5Ek9Wx
   KvcgQqh++g0Uoi5vXK157AvlbHEwh8RxW6G+sJ+GEi0WFA9wXnFbuaS0C
   Nf2pYTT8LC4HFKNjep5whmhB73BYtop66j1G+GeoRRC7ZxhXlb2BxP3ZW
   P2lCXjdFxvyyYOOzwjRv9eVjLawIrZdKRnso1AS5I8iGJS/6bgMAbiGut
   afwWI+IhTgrpin0zi3zRlfywW4YCE2ySdU3xd5qbZbuhvmVhARhEEhCrZ
   w==;
X-CSE-ConnectionGUID: gzcVkUZpTICISUgYBbqPRg==
X-CSE-MsgGUID: tDsEVoA8SEeZHxjL/zyhyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="52639899"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="52639899"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 03:53:59 -0800
X-CSE-ConnectionGUID: /IUV9+TERLOqCL7vV5ZhRw==
X-CSE-MsgGUID: 19jezb68TVK8GAei3XrfqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122484442"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 03:53:57 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tpQqQ-0000000H76x-24PC;
	Tue, 04 Mar 2025 13:53:54 +0200
Date: Tue, 4 Mar 2025 13:53:54 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH] i2c: designware: Add ACPI HID for DWAPB I2C controller
 on Sophgo SG2044
Message-ID: <Z8bp0qRvE0CzF6S_@smile.fi.intel.com>
References: <20250304070212.350155-3-inochiama@gmail.com>
 <Z8bnX8zcY3yIxh9n@smile.fi.intel.com>
 <53dkcpiewy64hv37kpqhrvpkprr7mgg7bl6f7ofpmpl5utqbe6@yldveipvbisb>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53dkcpiewy64hv37kpqhrvpkprr7mgg7bl6f7ofpmpl5utqbe6@yldveipvbisb>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Mar 04, 2025 at 07:46:09PM +0800, Inochi Amaoto wrote:
> On Tue, Mar 04, 2025 at 01:43:27PM +0200, Andy Shevchenko wrote:
> > On Tue, Mar 04, 2025 at 03:02:11PM +0800, Inochi Amaoto wrote:
> > > Add ACPI ID for DWAPB I2C controller on Sophgo SG2044 so
> > > the SoC can enumerated the device via ACPI.
> > 
> > Same as per UART:
> > 
> > ---8<---
> > 
> > This is fake ACPI ID. Please work with a vendor to issue the proper one.
> > Vendor ACPI ID registry has no records on Sophgo:
> > https://uefi.org/ACPI_ID_List?acpi_search=SophGo
> > 
> > NAK.
> > 
> > ---8<---
> > 
> > But, it might be that is already in the process of getting proper ACPI vendor
> > ID, please provide an evidence in such a case.
> > 
> > Otherwise drag the representative of the vendor to this email thread to answer
> > the question why the heck they abuse ACPI specification.
> 
> OK, I will ask for the vendor and check whether there is some
> evidence for it. Now let's pause these patch.
> 
> Thanks for your info.

You're welcome! As I already replied in another mail, feel free to contact me
or give my contacts to the vendor in order to help them to follow the process.
I will be glad to help.

-- 
With Best Regards,
Andy Shevchenko




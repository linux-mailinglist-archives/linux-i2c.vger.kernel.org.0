Return-Path: <linux-i2c+bounces-10383-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6A8A8B13F
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 08:56:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEDC716BF12
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 06:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62AC822B8A9;
	Wed, 16 Apr 2025 06:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B/zDjv0x"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC461DC9A8;
	Wed, 16 Apr 2025 06:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744786374; cv=none; b=VKP1M10us6XCg3WLbslFtxJbOVi10sbSIgqV5y4RWtllIRcfeVAb6Qq9wBEOAYq02mgAwbxk+OvcfVsDZkaeSOnKgnRKiU//SkcYbBYJUPfNGe41RIm7V8XY7tI+I4SsoAtv5BHvNDLkkZAruStRz7RtGTdxNdsnEwpqmZvEFgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744786374; c=relaxed/simple;
	bh=AALvs82VGU6r21sYWIBoJca5H6BZpX+xxfk7Tk3yZz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oLC7W/P3/UeD2CqqdHzI6vU+ZJE0eCesqHL04Ktyy4HOMQeYbFdcpMxDhg9Kg8SpqJxM9H9jalMOTB8+NvrSeMIgcdStUMm4S2ixXT1sgTlojmwPESYgBAeqFJY21Uch7cpc5jOcY185O4LCsPuDAFCJMUQYggllmJUedWdjpfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B/zDjv0x; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744786372; x=1776322372;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AALvs82VGU6r21sYWIBoJca5H6BZpX+xxfk7Tk3yZz0=;
  b=B/zDjv0xd+Buvego5IFBpZdoV+8wTtHtfKFzyaQxKBt72UZ36NTDMNOJ
   LBLZhbmc5Y1uHAS8snxneTvplphcwHADMY6TTALB9tow4lwSdRJnPoYrC
   5VBkjZFOEmgQ9FzSc3aqRj/lK+EZo7VAutjMVTX8UOlN7ECpLucGlLlId
   sz6VeXPenwBi97mTvWU1vfIqYf+DbULHzqOs9dEs7UAy4YwVqS0b8ehKj
   jx617XGKnOILJVKZk3DAOrW4eJWt08nhR+DCZCiiNYx+YM0PwZBnZ1TaJ
   LAOuIQJkYv7NRyhbrrY/zCpeAReIDBS7lPmjS9flCFn8ywXFkg5EN8jrs
   Q==;
X-CSE-ConnectionGUID: umnJUB51R8eA0XhNAn+VQQ==
X-CSE-MsgGUID: UFrVzygVSVuQvmuMinXDiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="71712333"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="71712333"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 23:52:52 -0700
X-CSE-ConnectionGUID: rX6buXhdRRipQoCFI+N39Q==
X-CSE-MsgGUID: Eml7jxD3R2eIMB1qbYGdOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="130888110"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 23:52:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u4wdb-0000000ClsR-0Wie;
	Wed, 16 Apr 2025 09:52:47 +0300
Date: Wed, 16 Apr 2025 09:52:46 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v4 2/7] i2c: core: Unify the firmware node type check
Message-ID: <Z_9TvqfEK-HsQpmM@smile.fi.intel.com>
References: <20250414100409.3910312-1-andriy.shevchenko@linux.intel.com>
 <20250414100409.3910312-3-andriy.shevchenko@linux.intel.com>
 <Z_9Ta5CpplHUTK_X@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_9Ta5CpplHUTK_X@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 16, 2025 at 09:51:24AM +0300, Andy Shevchenko wrote:
> On Mon, Apr 14, 2025 at 01:01:52PM +0300, Andy Shevchenko wrote:
> > OF and ACPI currently are using asymmetrical APIs to check
> > for the firmware node type. Unify them by using is_*_node()
> > against struct fwnode_handle pointer.
> 
> Note, media CI complains on wrong {} style, but
> 1) it was in the original code;

Ah, actually not, it was not in the original code, so I can improve that,
of course, in v5.

> 2) it is gone after the whole series applied.
> 
> I suggest to ignore that report based on the above.

-- 
With Best Regards,
Andy Shevchenko




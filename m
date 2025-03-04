Return-Path: <linux-i2c+bounces-9717-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A94FA4DCE7
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Mar 2025 12:47:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A55FA1895AB6
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Mar 2025 11:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CE571F37D1;
	Tue,  4 Mar 2025 11:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BYWqU3d1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CA91FE473;
	Tue,  4 Mar 2025 11:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741088853; cv=none; b=jUlUsvy8O/iRGAO3KgOMoQdlS/6g0rts1oeeEG69B7KNnleeXfww5JzqT1k3VQwF/fDv0JiGrNsUg2uH1aoUIr2RRunEkm0ot0fyG6Bjm+VF+DBr1223HK566S/oc2yprsZtB64a5+/DhyuzdlSzSnAOsO+MsfknMUlU4lwnfGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741088853; c=relaxed/simple;
	bh=KjKvf+aAe0LbUJJ+AcFO0xtU+lwhK1JudqHmVMPFgrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F1CnjGUZKE0lHwRrRVfhE9hnECjN9WSa1MopxvWrpbUMdR7u3OiiVTuI4xJx30cKnEPbzDIcCZXmjNCfgv+62i0U1IYf+tzefGCPETl0Jr5TphsFEHgQO+KKI4N5YUD1gxpoAqKRJv44ahBeYMUULeh8LClMmHF4YsxBkH/HlZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BYWqU3d1; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741088852; x=1772624852;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KjKvf+aAe0LbUJJ+AcFO0xtU+lwhK1JudqHmVMPFgrM=;
  b=BYWqU3d1qD74l0jmxPR3ZmqAUhd+mlx293Ai76Bwc2drWlMyaFydtueT
   Ts173JJjeXHQQ8B4kGcXh5bsFVf+Y6jTPUofkZTShQrTx8aA+97l+5465
   at6avYPiwV14aH/pKhC0qVz/8Ndep4S1+PqCMK+WgZBKDQOLE38DuTUpT
   X/LUNjbZyvgBL0gWbWuNNILcLTMv9XJqeTJ0pOFc7IZm4+zAvj/AnRvK0
   dKXbQ/Jat1nLTHlUhSIUJ8BGFuGgQlaTAqydtoagopHymGuBteNTsllSt
   22wy4pCSmnzDJnL3bQgTqFc7P3m5nWsO1QGwqw4I3QGS9xaIGLotCjqi1
   Q==;
X-CSE-ConnectionGUID: bTYZ85R7ToO3EgTLLZDW6g==
X-CSE-MsgGUID: C4cpSZqrQk2bp30PJAIZ+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="53396255"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="53396255"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 03:47:32 -0800
X-CSE-ConnectionGUID: dxZIAq0zSOGd7OdBED1Zhw==
X-CSE-MsgGUID: 0+Smm7iLQZuJ76r/kOgHaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="149282035"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 03:47:29 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tpQkA-0000000H6zR-292d;
	Tue, 04 Mar 2025 13:47:26 +0200
Date: Tue, 4 Mar 2025 13:47:26 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH] i2c: designware: Add ACPI HID for DWAPB I2C controller
 on Sophgo SG2044
Message-ID: <Z8boTsGU-o2MwNZ2@smile.fi.intel.com>
References: <20250304070212.350155-3-inochiama@gmail.com>
 <Z8bnX8zcY3yIxh9n@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8bnX8zcY3yIxh9n@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Mar 04, 2025 at 01:43:27PM +0200, Andy Shevchenko wrote:
> On Tue, Mar 04, 2025 at 03:02:11PM +0800, Inochi Amaoto wrote:
> > Add ACPI ID for DWAPB I2C controller on Sophgo SG2044 so
> > the SoC can enumerated the device via ACPI.
> 
> Same as per UART:
> 
> ---8<---
> 
> This is fake ACPI ID. Please work with a vendor to issue the proper one.
> Vendor ACPI ID registry has no records on Sophgo:
> https://uefi.org/ACPI_ID_List?acpi_search=SophGo
> 
> NAK.
> 
> ---8<---
> 
> But, it might be that is already in the process of getting proper ACPI vendor
> ID, please provide an evidence in such a case.

Looking even closer to the ID, it is completely bogus as it uses CAPITAL O
instead of 0 in device ID part.

> Otherwise drag the representative of the vendor to this email thread to answer
> the question why the heck they abuse ACPI specification.

So, go and work with the vendor to fix their misunderstanding of ACPI and tell
them that they are free to contact me for the details. I will glad to help them
to make right things right.

Also read this success story of similar case:
https://andy-shev.dreamwidth.org/151340.html
and feel free to share with the vendor.

-- 
With Best Regards,
Andy Shevchenko




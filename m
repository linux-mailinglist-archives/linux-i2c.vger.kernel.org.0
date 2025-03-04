Return-Path: <linux-i2c+bounces-9715-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49059A4DCD4
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Mar 2025 12:43:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACC133AEE74
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Mar 2025 11:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05EA61FF1A2;
	Tue,  4 Mar 2025 11:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KyRTydvW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BD81F5850;
	Tue,  4 Mar 2025 11:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741088614; cv=none; b=ZkltJflMgWjAeJgolte0yr/tqOBC9m+PJ2VMgpZ9YVBFzyisu7/pEH7/VIWpMni7f0utYzG9ZPAR4IyIkMicMlnJ+YOU+Yi9li6fZbaIlGYmxBJFhElFQLBtCLUkAW7r2nbgxlJohIV73I9C0hso8P54r6mu86weDjdTFFdOWVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741088614; c=relaxed/simple;
	bh=FcNzcsYCEp9nj205UUzc+DgPRS6a1O12QwDnx6WQ1y0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ell4eOtUUJeddUlPzcUREgeP+DnmBG0ahn/qClXITWXoEMeboF2RrkwjkcGtcNbTtIrxgJsH/JsmG+OcsnbrdnGLWXuj7Gzzzlepoqg5Z5gDGkIAshzhsG+l57fQxalY2WMi/2h0BpFEbgIs1PVjDHcccZ7hLPVvCw6oh3BPxYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KyRTydvW; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741088613; x=1772624613;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FcNzcsYCEp9nj205UUzc+DgPRS6a1O12QwDnx6WQ1y0=;
  b=KyRTydvWxz89v6dN3x9K/pOVzXKv6NLGEmkR85qvPm8Z0tyjLBxoqlU4
   x6euQikTWuBfvQcCCHwCw4a1uZaAiw03lJvhvl8vFZ97ONOpJ1PXC7WXC
   gmIVCtjkCI/bWnhAKXyEWhGgDtCYzet9vCqcaWqVSjrcSilNQZZnTq8EG
   Rcb6RBYsoXOTrCw1Bd3HvfuSLyiN+2f40Xvg7M6/7hixVloX3sXP23S3M
   L737nxHQafOtL4MfUXwnsxSMzy8k29DK/xT2pDK/x4wGWL7uXqCzgKrii
   NrYOt4SDUtgRzOeo8dw7EaGGqc7sFvAdQhIj0reWKoLaLE1ihcm5pXSi2
   Q==;
X-CSE-ConnectionGUID: 4+Ayx1xsT6G1aVBpT4Is0A==
X-CSE-MsgGUID: kUDB/2nmSoCV0h+08rAevg==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41858544"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="41858544"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 03:43:32 -0800
X-CSE-ConnectionGUID: Ec7/tvZsSAGefPECBu0b1Q==
X-CSE-MsgGUID: VHM9taCqSBCl8Na4A6e60A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123553148"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 03:43:30 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tpQgJ-0000000H6su-2sMG;
	Tue, 04 Mar 2025 13:43:27 +0200
Date: Tue, 4 Mar 2025 13:43:27 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH] i2c: designware: Add ACPI HID for DWAPB I2C controller
 on Sophgo SG2044
Message-ID: <Z8bnX8zcY3yIxh9n@smile.fi.intel.com>
References: <20250304070212.350155-3-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304070212.350155-3-inochiama@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Mar 04, 2025 at 03:02:11PM +0800, Inochi Amaoto wrote:
> Add ACPI ID for DWAPB I2C controller on Sophgo SG2044 so
> the SoC can enumerated the device via ACPI.

Same as per UART:

---8<---

This is fake ACPI ID. Please work with a vendor to issue the proper one.
Vendor ACPI ID registry has no records on Sophgo:
https://uefi.org/ACPI_ID_List?acpi_search=SophGo

NAK.

---8<---

But, it might be that is already in the process of getting proper ACPI vendor
ID, please provide an evidence in such a case.

Otherwise drag the representative of the vendor to this email thread to answer
the question why the heck they abuse ACPI specification.

-- 
With Best Regards,
Andy Shevchenko




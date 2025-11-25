Return-Path: <linux-i2c+bounces-14259-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FE7C84632
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Nov 2025 11:11:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CE494341E60
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Nov 2025 10:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D2952ED872;
	Tue, 25 Nov 2025 10:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kz0CyX7Z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95B42BF001;
	Tue, 25 Nov 2025 10:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764065468; cv=none; b=fHsN3VLam+7xsnfgQcDyw+OBMItgLHs4hGRVOwddSRcjIXowz3Rv4di9A3Isw500DQ+xhCHV7Pj4GURPc0Pm7rwLVGApmbMDrCASHu5X0iAYhhGPPw5sa9GOKKomjURThe+pDM7evUzYaH73Dz5XuA+H6SCjFeSip9OBnZ4tN40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764065468; c=relaxed/simple;
	bh=BpBuyvSZHkQFCZlmH+DV+aClxlnNHZOqh0PRZANORPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=akJYkg6zsklfFrcl2umoiwq7gqhmKF5EFklISakf0o0yzBlom8fb9ZwRlFg9z0ys+pWjI3DFtgQ+Yz+ptTezVxSzh/wBGrd0oALx9T4RZSB9ecfH/Lsw5MYbYqU5uXtKeQjQAYT3I0i2EwdtMBESTNSVs61UffkY1j+dJE+cR38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kz0CyX7Z; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764065466; x=1795601466;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BpBuyvSZHkQFCZlmH+DV+aClxlnNHZOqh0PRZANORPw=;
  b=Kz0CyX7ZPnuvgvV2vzfgGhWjsvzvHojelNRm3eIZ0sm/jizObgjq+j/B
   CX+VVs5WEdKJo+psjyIy4ez1w+Qr1k8cWgLKn9IoxsxdjVHwXIPasuFX0
   DS0UJHjOJqXvf0RTaxFUM0IlbEO++H0InvRoZzphEF6R5RRchrfULHiOt
   taDvi21cefsN73NURehzTLHSGrm2JMNgmb96QCMQNHJhXbjBmQxvqqb17
   ZInREiw8Gjd+LP+m6zKM2xDPwwigwA+TSGcyG0GrvnaoaoFOq4BHQ3ZB0
   /fXiQACRsh/sim+NGQlINnwpyuzo/F7Yzo7YRJXWYB98k9TZc/7lZTx0Z
   Q==;
X-CSE-ConnectionGUID: 89nuUtWWQdC/cKZjmLRnnQ==
X-CSE-MsgGUID: XWmux/v7SlecbosMroeMBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="68668300"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="68668300"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 02:11:05 -0800
X-CSE-ConnectionGUID: xMPnIGJCQ9S4u4SDfIto3Q==
X-CSE-MsgGUID: Hldz7eUERRCpq8g+tO+46Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="192592051"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.152])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 02:11:02 -0800
Date: Tue, 25 Nov 2025 12:10:59 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Baojun Xu <baojun.xu@ti.com>, linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mika Westerberg <westeri@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v1 1/2] i2c: acpi: Return -ENOENT when no resources found
 in i2c_acpi_client_count()
Message-ID: <aSWAs71tl5s9_Rup@smile.fi.intel.com>
References: <20251125094249.1627498-1-andriy.shevchenko@linux.intel.com>
 <20251125094249.1627498-2-andriy.shevchenko@linux.intel.com>
 <20251125095046.GB323117@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125095046.GB323117@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 25, 2025 at 10:50:46AM +0100, Mika Westerberg wrote:
> On Tue, Nov 25, 2025 at 10:40:11AM +0100, Andy Shevchenko wrote:
> > Some users want to return an error to the upper layers when
> > i2c_acpi_client_count() returns 0. Follow the common pattern
> > in such cases, i.e. return -ENOENT instead of 0.
> 
> Well what does 0 mean then?

There is no 0.

> To me it's logical that i2c_acpi_client_count() as it returns count,
> returns 0 if the count is 0. Let's not make it any more complex than that.
> ;-)

The same approach used elsewhere, e.g., gpiod_count(),
   of_reset_control_get_count() / reset_control_get_count().
And other count methods used for IRQ resource, for example.
However PCI MSI/MSI-X counters never return 0.

-- 
With Best Regards,
Andy Shevchenko




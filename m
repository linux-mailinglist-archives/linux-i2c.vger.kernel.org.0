Return-Path: <linux-i2c+bounces-11559-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F40AE5E15
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jun 2025 09:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E458189FF51
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jun 2025 07:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3403F25D8FD;
	Tue, 24 Jun 2025 07:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JYqFwX8A"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D3225D548;
	Tue, 24 Jun 2025 07:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750750567; cv=none; b=osIPKOJO4r9iladCT/si5KOkAx1kB77zmbyeE1z9kHeff7j4kU/6xxS3PPPLdEYz6bdfKZ32VXI7BY+6yWu6od05lIvrsRyc7kHUbfGk9KaKm2QYNKshgexbgdF5J1yam36EOP/iq6wleQu3zqQX2OkpeAlhuyS8wRLk05DFUCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750750567; c=relaxed/simple;
	bh=p1BCckKI1VLjf0H6yX/KbuZqmDDBzRIgscjBVJaTNHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tmyltK31XtW8l2em4gaX3Cl22iHAFg+l+jtNjXxGN5SBx0t+345Wert5BBCRun3aETZW9gVwtohYNHWjtTSqJ5tpzQc0HQZtJH1o8YYvdawvoS5mHmSoEsAZmF6VOunriYIw3MiUhkyXdymyslR4JbXk1KA2nw8JZMkNvhAKtCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JYqFwX8A; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750750565; x=1782286565;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p1BCckKI1VLjf0H6yX/KbuZqmDDBzRIgscjBVJaTNHg=;
  b=JYqFwX8Aw4n6dkH6BPHdNFeFU6mQAO/YBAJUwZlBKdi+gn2BH0h4WoKu
   EEsnCksNeCSNsw4XoNnC3cJe9YoqAxZZqcXju+bD9PpJ44OMVfecn2nZD
   XhnRRran687e6c0QKhnSLkkwDiQwnJ+UwESzlJbOL0TT4FD2Dbpkn/Yqf
   839as69Hy6bX+LUdeJz5APaGZiL1dN0L/rJ3Nk6j+qeX03w3E8LvPa4Yp
   aWRDf/HtM2bUhudRMP42xU7OHUS+A/VbX/0UB9vdjMM/0FEzNM5p3bQ47
   5pY9NgHzzAzmfwuw1LY8FIaVsbjeeTIIpPzSIJN086NYQpdpuUuKarnXl
   w==;
X-CSE-ConnectionGUID: hS3W1462RmS35WpKqaFy3Q==
X-CSE-MsgGUID: INBHR9EIRG+/EVKLTdn77w==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="56760224"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="56760224"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 00:36:04 -0700
X-CSE-ConnectionGUID: Mya1kTKgTeqT3gq4Q/s+yA==
X-CSE-MsgGUID: JW0shPs/QmG9H78FzpjBQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="151978287"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 00:36:02 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uTyCF-00000009PGy-3Fdm;
	Tue, 24 Jun 2025 10:35:59 +0300
Date: Tue, 24 Jun 2025 10:35:59 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Randolph Ha <rha051117@gmail.com>, linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mika Westerberg <westeri@kernel.org>
Subject: Re: [PATCH v1 1/1] i2c: acpi: Replace custom code with
 device_match_acpi_handle()
Message-ID: <aFpVX05xv4j4uRiP@smile.fi.intel.com>
References: <20250623134521.158447-1-andriy.shevchenko@linux.intel.com>
 <20250624054508.GA2824380@black.fi.intel.com>
 <aFpRZoIkQod6g2Dm@smile.fi.intel.com>
 <20250624072559.GB2824380@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624072559.GB2824380@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jun 24, 2025 at 10:25:59AM +0300, Mika Westerberg wrote:
> On Tue, Jun 24, 2025 at 10:19:02AM +0300, Andy Shevchenko wrote:
> > On Tue, Jun 24, 2025 at 08:45:08AM +0300, Mika Westerberg wrote:
> > > On Mon, Jun 23, 2025 at 04:45:21PM +0300, Andy Shevchenko wrote:
> > > > Since driver core provides a generic device_match_acpi_handle()
> > > > we may replace the custom code with it.
> > > 
> > > Well okay but now you replace a simple comparison with a function call. I'm
> > > fine with the patch but I also don't think this is an improvement ;-)
> > 
> > The improvement is in using standard API for such cases.
> 
> Well ACPI_HANDLE() and comparing handles is also a "standard API".

In some [rare] cases this might lead to removing acpi.h which is a monsteur
that slows down a build and provokes developer to avoid IWYU principle from
enforcement.

> > You may argue on many things that may be open coded in
> > the kernel while we have helpers (in some cases exported)
> > functions that are one-liners or so. Note, the helper also
> > performs an additional check and having an open coded copy
> > may miss such a change. To me it's an improvement.
> 
> Which is unnecessary check in this case.

In this perhaps, but my point is that any of such amendments will be applied in
one place for all, while open coding prevents this.

> But like I said, no objections. I just don't think this improves anything.

I think there is an improvement.

-- 
With Best Regards,
Andy Shevchenko




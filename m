Return-Path: <linux-i2c+bounces-11558-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E944AE5D9F
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jun 2025 09:26:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DE6D3A3115
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jun 2025 07:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D672254AE4;
	Tue, 24 Jun 2025 07:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UdjVn9cd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A002505A9;
	Tue, 24 Jun 2025 07:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750749965; cv=none; b=TXlBEIBNwP5tAP85AsZO9BWyJpvH3AUYyZMFH/KGznzH4z9xWFsBOpl9GKf2uCGILJX16HOpTS8kFXSB1R81EG5YQW+eIo9dEC2HQrhI/NDfaW2uH5KyRq2rfNBhrefBenyb+ukelVV8ZilEGYesTqkZiAEk0+ZTyBZVaidYozg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750749965; c=relaxed/simple;
	bh=NYdKbcFwu7oY8DRW1Ox6wAWvpbMQxW6/Wp56dk9Iqfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VUj8TclQqEciwdFN/Liy9UMOFQulnljtEY9RdNlUs0vCKjVD/XzenEBjFVMDhJ1748iFxHzxhorjUUZa68V6GvcNF6YuzMKOwg7iTSjim5cRxSH8W0UurDfraKAnonUb/M4XzLZ9Kv1C6d3+ihjUkwNEO1c9Li9u+v9SglRbmfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UdjVn9cd; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750749964; x=1782285964;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NYdKbcFwu7oY8DRW1Ox6wAWvpbMQxW6/Wp56dk9Iqfk=;
  b=UdjVn9cd1VJon0AeEqgcQps/iCuMWdXBRsMAvHH348c35bUShfHi+hw5
   8QIbWpAEwDyhTw2yU7LXDKBayjurXe23zd2qjyLLD6unUJ6Agvs+bDXOA
   a7LeIcln3jqOEanavPPkvEoEQgsjoZVW973l3EAuHDNtVFVTNNTeucGJZ
   v3Or5SMlYr5NHNpHTeABjgjA3Hp2aduX1n9n5uwN+2r61bilcds+BUhUD
   PJdpUF1jdNzrkm6vioHd918akVisD37qf5pZu08/+Xwn5MvtslI/dM54t
   V1s5ZKdLKLYKX37S6+jlPCSWGYn0BQx0GY0JPsa2z8xXAB25DtwaedyzL
   Q==;
X-CSE-ConnectionGUID: GHo+8Jb3Tve4iuapeCw6mw==
X-CSE-MsgGUID: ZVAuEtmmROywjcTw0A74+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="56758577"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="56758577"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 00:26:04 -0700
X-CSE-ConnectionGUID: E4xcZJouSxS3O/r83nvG8A==
X-CSE-MsgGUID: AckDEsMeTsiQGcDxfMHqdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="152360952"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 24 Jun 2025 00:26:01 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id A15BE138; Tue, 24 Jun 2025 10:25:59 +0300 (EEST)
Date: Tue, 24 Jun 2025 10:25:59 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Randolph Ha <rha051117@gmail.com>, linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mika Westerberg <westeri@kernel.org>
Subject: Re: [PATCH v1 1/1] i2c: acpi: Replace custom code with
 device_match_acpi_handle()
Message-ID: <20250624072559.GB2824380@black.fi.intel.com>
References: <20250623134521.158447-1-andriy.shevchenko@linux.intel.com>
 <20250624054508.GA2824380@black.fi.intel.com>
 <aFpRZoIkQod6g2Dm@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aFpRZoIkQod6g2Dm@smile.fi.intel.com>

On Tue, Jun 24, 2025 at 10:19:02AM +0300, Andy Shevchenko wrote:
> On Tue, Jun 24, 2025 at 08:45:08AM +0300, Mika Westerberg wrote:
> > On Mon, Jun 23, 2025 at 04:45:21PM +0300, Andy Shevchenko wrote:
> > > Since driver core provides a generic device_match_acpi_handle()
> > > we may replace the custom code with it.
> > 
> > Well okay but now you replace a simple comparison with a function call. I'm
> > fine with the patch but I also don't think this is an improvement ;-)
> 
> The improvement is in using standard API for such cases.

Well ACPI_HANDLE() and comparing handles is also a "standard API".

> You may argue on many things that may be open coded in
> the kernel while we have helpers (in some cases exported)
> functions that are one-liners or so. Note, the helper also
> performs an additional check and having an open coded copy
> may miss such a change. To me it's an improvement.

Which is unnecessary check in this case.

But like I said, no objections. I just don't think this improves anything.


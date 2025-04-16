Return-Path: <linux-i2c+bounces-10397-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4C3A8B20F
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 09:26:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82B4C44036B
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 07:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D882E227B94;
	Wed, 16 Apr 2025 07:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lz7TwojL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED548F66;
	Wed, 16 Apr 2025 07:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744788401; cv=none; b=tV7G/BOCViMkDDoVxzm5SmqkMgbcMOXDgIyhU6KglqxyV8OCtWlmzPAOIEaJtKQli5yfehXSluzrcPBMy+hOlCt1Mc895f/RQ/X7MpfINllRhak3C/vGw1JOzJ4cCdDr3mYW/RPNNrWvrj8Qd5ooVieXB48nLS3wGykIevNLMVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744788401; c=relaxed/simple;
	bh=5018CdRyndcE5VdnMWo/nD3PfaSPtnvvi+wu6Lzs7lk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KXfbBXAbgoee87s2c6ixfjn8wmBRSMSj43979MfuwWilldDsg8d3+ZTcne7TN/jWVurIJn1oU1qZbbzvd6ipG+r3NeJ2vud6NKGXflKVy9BP7+JIgejWQzGhNptW8h+XtQ5WCcheqafHGePkdBVNtFxk/BJ7+x8MBzxQKt4TbDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lz7TwojL; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744788400; x=1776324400;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=5018CdRyndcE5VdnMWo/nD3PfaSPtnvvi+wu6Lzs7lk=;
  b=Lz7TwojLStfWrGgWhRWx8lDwojqm3yXdIrAxEkQ80O5+7kvGu0XseJKe
   d8vTLpV1EkqjzIikWbCgPXetExxKEKlwlJM/JDe/I+21Gmy0o/FGZrXFo
   YVhDDiJW3nnT0VRoIVSqoVc60KBPua5KD3+/atUGCB5XnLWldif/jGBVl
   Zry5E/9JBqnQRDHwLmx8+YZ2UwMqdfEx5PrEQdc5VQSPHRQhZWgjqp/WD
   7uoL6XTR5Am3Cxy7EoK8YP8rQE2a0WX0jYpqwDvZat06SVWg/orzo/kd0
   Zv7q9ObOrtpvWq0PpJ9SQjG8thKce0rK89waGWWn5CYyxtuxSYdbbXD/g
   g==;
X-CSE-ConnectionGUID: HBbwJ7kJTqqCqcxTG/++kA==
X-CSE-MsgGUID: ljZKZHGnSCiaM8/sHwlWgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="57711257"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="57711257"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 00:26:39 -0700
X-CSE-ConnectionGUID: Fil5QTBHTn+WtxYNaPHOgA==
X-CSE-MsgGUID: 554fOTEgS1eYRe+1e8ivIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="130325291"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 00:26:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u4xAI-0000000CmXN-2rf9;
	Wed, 16 Apr 2025 10:26:34 +0300
Date: Wed, 16 Apr 2025 10:26:34 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v4 5/7] i2c: core: Do not dereference fwnode in struct
 device
Message-ID: <Z_9bqmOp7-bvHCwu@smile.fi.intel.com>
References: <20250414100409.3910312-1-andriy.shevchenko@linux.intel.com>
 <20250414100409.3910312-6-andriy.shevchenko@linux.intel.com>
 <Z_9UX9xkGjvhnub_@shikoro>
 <Z_9V9x_YBfxiCh1w@smile.fi.intel.com>
 <Z_9aVAYrorIyO8sg@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_9aVAYrorIyO8sg@shikoro>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 16, 2025 at 09:20:52AM +0200, Wolfram Sang wrote:
> On Wed, Apr 16, 2025 at 10:02:15AM +0300, Andy Shevchenko wrote:
> > On Wed, Apr 16, 2025 at 08:55:27AM +0200, Wolfram Sang wrote:
> > > On Mon, Apr 14, 2025 at 01:01:55PM +0300, Andy Shevchenko wrote:
> > > > In order to make the underneath API easier to change in the future,
> > > > prevent users from dereferencing fwnode from struct device.
> > > > Instead, use the specific device_set_node() API for that.
> > > > 
> > > > Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > > Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > 
> > > I'll check this patch later today. Rest of the series looks good to me
> > > already.
> > 
> > Note, I'm planning to send a v5 shortly with the style fixes and commit
> > messages as you suggested.
> 
> Please wait with that like half an hour.

Too late, I have sent it already...

-- 
With Best Regards,
Andy Shevchenko




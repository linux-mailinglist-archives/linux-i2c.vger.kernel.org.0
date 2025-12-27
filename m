Return-Path: <linux-i2c+bounces-14793-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC714CDFE5F
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Dec 2025 16:32:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 64B39300949A
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Dec 2025 15:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92FE5243387;
	Sat, 27 Dec 2025 15:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fhPtFMDY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED6F241665;
	Sat, 27 Dec 2025 15:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766849532; cv=none; b=awJkrjA6XNuSRq50HlRDVnOCAZjSEj3VlzOIkX7c3MwhvFTJF3q0OZg6e5etIrkPmt0cOtfLOEyv7ASqUVLBhoxWCleL6D44CZaeWMJoUUzCbYMB58FEvp3eKB1Z56VdrsQ88gxL/yZmm+gl/SVZDmwXKeRAvqi0zC5U7WV3VqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766849532; c=relaxed/simple;
	bh=6UuoWbKa3mc+HzwRyKN8DoeodP2KuykdAmCA/D49QXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RHbPqNYNRuVSvlwFmArqY19p63HKzGoE8oNs5u+HXRtygkJ53mXkXeXjqagAZfll3/KTLRHgxr52W3R/i2ofRPaJS1V5nfPUZp2ZJ+UNOOHKD1c/jXdH3LuBHypnQN/or3uLRKS+CJLeXw91xbYva03NgVh7ynVO2SPt5fkNN4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fhPtFMDY; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766849530; x=1798385530;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6UuoWbKa3mc+HzwRyKN8DoeodP2KuykdAmCA/D49QXg=;
  b=fhPtFMDYPm2zG+IXU2aIlrAd5Wg0cz8KOcvjEWSfVq1P6YFJ6LdHwMca
   oY8/JfyIgXjQLf6KY+3diKuCZzorJqv2nY0l60pAj7F5XnUaKu7AXiRnk
   mFM2QPhD/A4wHef7nMm0OWz/ntIiwTJB4ZAbyI2kKHv3uWLL0jaZtccH2
   agsw0y9GMNHP5NFA4/ccCLUjQ4STS6KygoFYBx9kGVaXCrp2EnkX4xhrB
   +s6etAdvyAqPvbeHGHKFMDo06CqNU3dIGKThJHMJeFj8WNfdr63+psJa1
   RhyYWoUCA+WhJNwzgmNfw4ej+DRf9ahVdaniGivp7X7R8sDwfs8taNV5S
   w==;
X-CSE-ConnectionGUID: CMiL2mK8R0OjxG4asUDreg==
X-CSE-MsgGUID: 5P5RxsYZRD65ZiMNdsCutQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="94017537"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="94017537"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 07:32:08 -0800
X-CSE-ConnectionGUID: kGpyQSvzSDihimM6VSTAUw==
X-CSE-MsgGUID: /W1/5s0pRKuKtxjQtU5DDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="224059244"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.211])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 07:32:07 -0800
Date: Sat, 27 Dec 2025 17:32:04 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Raag Jadav <raag.jadav@intel.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] i2c: designware: Remove an unnecessary condition
Message-ID: <aU_79AWhv6ieAtxm@smile.fi.intel.com>
References: <20251218151509.361617-1-heikki.krogerus@linux.intel.com>
 <20251218151509.361617-7-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218151509.361617-7-heikki.krogerus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Dec 18, 2025 at 04:15:05PM +0100, Heikki Krogerus wrote:
> Writing also the high speed timing registers unconditionally.
> The reset value for these registers is 0, so this should
> always be safe.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko




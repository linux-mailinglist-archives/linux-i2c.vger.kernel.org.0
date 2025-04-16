Return-Path: <linux-i2c+bounces-10382-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B282DA8B11B
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 08:51:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46A2A3B0865
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 06:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 765DD221DB7;
	Wed, 16 Apr 2025 06:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l5ynJXuq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9691DDC1B;
	Wed, 16 Apr 2025 06:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744786291; cv=none; b=Pk5ugtDaCSEBIjopowoBNmE0LJ313FTih42vd1BUEBGnNpdg1G0BrYwjfafPzwgzeJQFaXwW73VqABsGygapcXtR5jbJGVyNNM7TmTKAH+eVmadQn7Dox4frkvD1GCWqT3rvaf6BdIp1zberNy5UF1862F4UnQQRs6LGmjHQeBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744786291; c=relaxed/simple;
	bh=FGgt10fsKaB31v9J8sD2pS75CuOzx1QkbiWqKQvt16E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z4tnjoFfc0CaBwEu91V0AeO4zedClQP4Y41g3BNCb6yGfB1j/6oR3Uia67wYfTx0HCnzPBHk1PWK5ZayXFskovkRjPSNgs34xWfBP3SKPox1AagzF6NOPZcrDRXniapgdLdV3iGEXdVnFc4qNp/oqp2LeObAJ19dB9u5ZB1XJuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l5ynJXuq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744786289; x=1776322289;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FGgt10fsKaB31v9J8sD2pS75CuOzx1QkbiWqKQvt16E=;
  b=l5ynJXuqvAMM/oup95FEqccXRl4gqIDRaxtoFunjICxhYDH6C0Chm4Pj
   LkLOQi5+Uvdn1WrYdi2CwzeuDae43fCSbkNuf6gHSQw+xGy2+y8XcS6Z7
   /OqNe3b6aKwx79rhxnOTzX1C6Ayopj33biud7AwIwa6WyEi1heg0jQ6ME
   wps1kND1BUR7J19ljX9mZDnZ4KIagFDnnNX/pjqfjROwTg7uRbaiwL+1+
   uLK+QbDBOtqRTuSBvxMAa91tewy2wsw7KJ0OvHjZbTLEhx31Lj9VUh5F9
   MMFbwvMDFuuqrwYT64x1DpQYM4YZ+Il67nkjFE57t0APsrNQswGOKWtH/
   Q==;
X-CSE-ConnectionGUID: yjTEW/roQMetWuUoQSwEUQ==
X-CSE-MsgGUID: tpEhxyQzT3Su+5eRlivl4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46035146"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="46035146"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 23:51:29 -0700
X-CSE-ConnectionGUID: kVR8noIGRCis9km2Bq+BGQ==
X-CSE-MsgGUID: VevFSuRVT06zP80/VHmn3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="130301713"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 23:51:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u4wcF-0000000Clqu-4Ap9;
	Wed, 16 Apr 2025 09:51:23 +0300
Date: Wed, 16 Apr 2025 09:51:23 +0300
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
Message-ID: <Z_9Ta5CpplHUTK_X@smile.fi.intel.com>
References: <20250414100409.3910312-1-andriy.shevchenko@linux.intel.com>
 <20250414100409.3910312-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414100409.3910312-3-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 14, 2025 at 01:01:52PM +0300, Andy Shevchenko wrote:
> OF and ACPI currently are using asymmetrical APIs to check
> for the firmware node type. Unify them by using is_*_node()
> against struct fwnode_handle pointer.

Note, media CI complains on wrong {} style, but
1) it was in the original code;
2) it is gone after the whole series applied.

I suggest to ignore that report based on the above.

-- 
With Best Regards,
Andy Shevchenko




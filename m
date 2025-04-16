Return-Path: <linux-i2c+bounces-10426-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA54AA90A6A
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 19:48:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38F495A288E
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 17:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53D22192E1;
	Wed, 16 Apr 2025 17:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ke4aSG9l"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F9814B950;
	Wed, 16 Apr 2025 17:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744825702; cv=none; b=QiER7k6vhUwWTI2jDJIqqBKg1+q70Ka1HR58RHFptZwXu2fPVWXYbpFHY9VMc8VQbGEI6cS3fup8ovzQqfNXuwwnqsOEdF1Yx3ShAMf5unv60V0wRaOGDVAiEFkUqFv2hEJm2GkkixLkqCp7McE3qND4JMKUGgEFh7d+UgG5vqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744825702; c=relaxed/simple;
	bh=K01BARh6HijRfnPdurMe8L58/LzFkiQR5RkCkKbib+U=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SH/47vUya5vj7azHr0n7yjRHu1IQt8RaCs74y+uqGrbhItrGeGYLAwUgHnTtWusIDust5J+uKtHlYxN0vcOGN5pkFDsfUJuyJcBvRdAQhtHVt7QptfOj1QXcj+0rcFWqlBglTfVNseG9O9uRnOs3oeUogvbWjEjVChwvLm6eU4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ke4aSG9l; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744825701; x=1776361701;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=K01BARh6HijRfnPdurMe8L58/LzFkiQR5RkCkKbib+U=;
  b=Ke4aSG9lI9T0AYgKxlMv9sTtwB/a/ZfDFlrnIPWpca4IbDf+ZwGwsXVi
   yM+JEOQNgEqj1fzQzSlkFgbh1ywgnQWS2DoKfHPJl7QTIBDPXroANeicJ
   B5IzvY62zGjIk2fOoVT+kjY9FgQpj59+QcAoHcIcdpHWjRurUbUjwjPSM
   M9tzhw8H1w2/VekIW05ECoN6rQGpXfi9hgFx2U5jKZLlCxEJg067QMzo2
   19ea2LD7mBj5FLKa65DdlZBj/QZZ7chVjv6OWfeQrHerfXAd/tdhEccLO
   J1lDob6svI68hWjJoG+UmujD2pa1NkCgr0ILBGcJJ59OEesWNC05cdFHO
   Q==;
X-CSE-ConnectionGUID: sQ9lVC+HRHibdbYbjQrodA==
X-CSE-MsgGUID: M7MD8GztSdOLYok6cd2DEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="57029321"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="57029321"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 10:48:20 -0700
X-CSE-ConnectionGUID: INewvuJ4Qp6+WveIGxtopQ==
X-CSE-MsgGUID: 3/VcZldXSeOxWjFwqIBbFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="167736133"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 10:48:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u56rv-0000000CvgL-0iO1;
	Wed, 16 Apr 2025 20:48:15 +0300
Date: Wed, 16 Apr 2025 20:48:14 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jai Luthra <jai.luthra@ideasonboard.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v5 0/7] i2c: core: Move client towards fwnode
Message-ID: <Z__tXkgOhvJUIYXq@smile.fi.intel.com>
References: <20250416070409.1867862-1-andriy.shevchenko@linux.intel.com>
 <Z__Wlri8-tjuctsa@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z__Wlri8-tjuctsa@shikoro>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 16, 2025 at 06:11:02PM +0200, Wolfram Sang wrote:
> On Wed, Apr 16, 2025 at 10:01:30AM +0300, Andy Shevchenko wrote:
> > The struct i2c_board_info has of_node and fwnode members. This is quite
> > confusing as they are of the same semantics and it's tend to have an issue
> > if user assigns both. Luckily there is only a single driver that does this
> > and fix is provided in the last patch. Nevertheless the series moves
> > the client handling code to use fwnode and deprecates the of_node member
> > in the respective documentation.

...

> Works at least on my OF-based platform. Let's go CI.
> 
> Applied to for-next, thanks!
Thank you!

-- 
With Best Regards,
Andy Shevchenko




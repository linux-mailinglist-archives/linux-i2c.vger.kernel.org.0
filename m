Return-Path: <linux-i2c+bounces-12360-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 599CBB2E200
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Aug 2025 18:12:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E0AA3B11CF
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Aug 2025 16:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CDDC32255E;
	Wed, 20 Aug 2025 16:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SRfQ9Dco"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C8525FA0E;
	Wed, 20 Aug 2025 16:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755705971; cv=none; b=tc1uPe8Iw1ogweveWNpsOr56FLoJT79OjrKAWMk003qsZXwUeTLC9wOCYto05/HWFCyTgwfPoOAEjW5biI+Krdw5aBmkmWN1p4eo4o+ZxTls/1ioNF2mJfd2K5SYzIHHp9KpcAhU6SJpPvh9qBVK1kgqkFVUlkp+mK6S8Clabrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755705971; c=relaxed/simple;
	bh=u7hvnba260jlvKO+AqyRxxzWCWDfLK0QYuIZU0wiFZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AViQf+iwac+u88v0c6DK3Q35nL53j6a3EQcsPZ7zrorKhwAXt48GHi8BsoNTfAsk6KXR9/xdoBJ0YZuuD5OxqJVt2uGguP6mVprURkfgluxTPVzM2jJSR1nwzq2umXPZcEj53q3KcuVTF96smBKawhQR7ty+NvCyWMai7Oi0Q68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SRfQ9Dco; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755705970; x=1787241970;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u7hvnba260jlvKO+AqyRxxzWCWDfLK0QYuIZU0wiFZw=;
  b=SRfQ9Dco2071hXMrXMolDTCxjfda4WdOKfHEmwwd2Oe7JtubMoB7XOZz
   uiVfZ+ZGKOCTyt5ho2FoNpoy/lpVNsyyD8ynT8JiM+ym/8RDmEIlMcYJR
   CeMauRBQHRHX77Wdp13fNbETIeLWkmKAlb+HgLX8H6DjkO9nEEWs7F0XJ
   wkhpzwP7q+bzPKfXX6CcKiqz72bVJ5AXVYY74UK99zZzfgilvjzEZESLt
   vfOqkkDPiiViSThuYLZ6wLh9bSlAGfvdE8HiKgbap+vkj0qNFwfKMCUFP
   RUyHgi3kW8TyIzOwK20Pe0XMDd5tYavginEfZBetzaWNw39+F7capTr16
   g==;
X-CSE-ConnectionGUID: Tct8kNouRgCckNKNUQpcCA==
X-CSE-MsgGUID: bjK+AKusQNypi0DsUH9a0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="61792928"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="61792928"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 09:05:49 -0700
X-CSE-ConnectionGUID: W+o3TTfKRvO+L/RvR/X9UA==
X-CSE-MsgGUID: hErrF+lUSV+bE2QshYYoAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="168433244"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 09:05:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uolJn-00000006zB9-1TBv;
	Wed, 20 Aug 2025 19:05:43 +0300
Date: Wed, 20 Aug 2025 19:05:42 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: designware: Avoid taking clk_prepare mutex in
 PM callbacks
Message-ID: <aKXyVvFOvpsaAEAB@smile.fi.intel.com>
References: <20250820153125.22002-1-jszhang@kernel.org>
 <20250820153125.22002-2-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820153125.22002-2-jszhang@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Aug 20, 2025 at 11:31:24PM +0800, Jisheng Zhang wrote:
> This is unsafe, as the runtime PM callbacks are called from the PM
> workqueue, so this may deadlock when handling an i2c attached clock,
> which may already hold the clk_prepare mutex from another context.

Can you be more specific? What is the actual issue in practice?
Do you have traces and lockdep warnings?

AFAICS it seems related to the bus recovery mechanism. Is this what you have in
mind?

-- 
With Best Regards,
Andy Shevchenko




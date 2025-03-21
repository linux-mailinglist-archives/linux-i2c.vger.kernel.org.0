Return-Path: <linux-i2c+bounces-9976-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 382FAA6C2E3
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Mar 2025 19:58:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B665C1B626CD
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Mar 2025 18:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE6E21859F;
	Fri, 21 Mar 2025 18:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iVBdVfbX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABED2B664;
	Fri, 21 Mar 2025 18:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742583483; cv=none; b=LIjTcV5oQ4o6pOBBme5LRaPJ3kzLLS9gMLartDYiFeIdbTDfjux2dn5WS3IS8pVBBKRmJFJqCaJqrPPTejbfDUtmw1EXpk26McFkrpb8bIIPv2E72SBh+CimK/leNB4Tsfz6MKFIHs0/kmeRP7eJMJTv6+2O+5hl3PO7ZvIGGZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742583483; c=relaxed/simple;
	bh=gGskX/EDyuM1cIMA8VOOs4nGmlFR8fI2S6yxYV1Dr1U=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rvjzvJEksCiC00Am0A447ZU23MDrvnW1J4ZzSriUT+cLqX04POg0IoFUYkHJ/1C8qOnEDwUluTbszH544I5YC4wzSQVMdfhebnGXgrlaLqsHAgPxaTXAAsDvw1yo6zMJTA9lO1dkK582ELxcu8fjnft8c8FTKNOkK3RU+rc34cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iVBdVfbX; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742583481; x=1774119481;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=gGskX/EDyuM1cIMA8VOOs4nGmlFR8fI2S6yxYV1Dr1U=;
  b=iVBdVfbX5NDv4F0O5Ixv3koWp6XbX6a/GVID+9FPg7zzOo/crsPbwM1E
   tK3dzjZjvi3kYl1JDmLhjOtudFK8MrSmvvyGlGD1gxLz55ZtDHgXz+9Qa
   Wz2Ys0UdqE4sFECawzr/pPZGqCxx4JissV2YgfdIYDLvqtlDxNeoUEyqg
   DrUq877lQ9OXY1QEQE/At+ljQ3c52t6bndstBX/R0feh4ufV89uhSMjeW
   AnBCkl3poPmLyjG6FrkYDaRKT5uLK/0HvO0t3QrjWWhQEkDjtjIs3pB2i
   FbD1vpI4aPROsp/l68QBIPa6i15mTVW5nnGwd9+8FSt5Due/1tcFaL73v
   g==;
X-CSE-ConnectionGUID: hfM3rvIsRQiQlVA+v+T4iw==
X-CSE-MsgGUID: MBJYYCK/Ry2IhiZLv92i/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="69214798"
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; 
   d="scan'208";a="69214798"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 11:58:01 -0700
X-CSE-ConnectionGUID: ew3y3JH6RcqCx9W5I5KNrg==
X-CSE-MsgGUID: x8gyBdHJShCcVpni3QNn6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; 
   d="scan'208";a="146695512"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 11:58:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tvhZ7-00000004bLE-3QbL;
	Fri, 21 Mar 2025 20:57:57 +0200
Date: Fri, 21 Mar 2025 20:57:57 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 5/6] i2c: core: Do not dereference fwnode in struct
 device
Message-ID: <Z922tWnr4JH3hdlU@smile.fi.intel.com>
References: <20250312185137.4154173-1-andriy.shevchenko@linux.intel.com>
 <20250312185137.4154173-6-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312185137.4154173-6-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Mar 12, 2025 at 08:48:52PM +0200, Andy Shevchenko wrote:
> In order to make the underneath API easier to change in the future,
> prevent users from dereferencing fwnode from struct device.
> Instead, use the specific device_set_node() API for that.

>  drivers/i2c/i2c-core-base.c | 18 ++++++++++--------

This missed i2c-core-of.c changes.

-- 
With Best Regards,
Andy Shevchenko




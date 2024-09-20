Return-Path: <linux-i2c+bounces-6900-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B99397D6EA
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 16:31:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EC141C226F8
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 14:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2AF617BB0F;
	Fri, 20 Sep 2024 14:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FQAwTvO+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1271482F0;
	Fri, 20 Sep 2024 14:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726842659; cv=none; b=Xj4HZUEI96Vr5RsZFRg2Hy80CVsgUKDDWDpaXafzCXKV2oZN5dH4WXHgWHnPGSy7cmjdsNZTd9+TpxRbLrp5BLpirmxb6keM4jtwV+s0VH849EUwf9mBAG8B9coec4+G9OAI9NvfifEZc2o06Pj7vy+T5VDL3m2BAJ0W/Ah1gd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726842659; c=relaxed/simple;
	bh=vb1mlYEI0m2HdYRCsq804tsecR/GPPDj7yvi33gn2g0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ibEHsVdFKqK1qEIvDnhxpO7u0zvMh+lB9h6Sz4wMo5O70AAbZ3CtN2D1zlvdKQE9fQ8MU/kJeDRkB0o19cKOxiDCCmtDgR6S3UxqGopJcEhHul2mILo0SZYi5fMEpc2woWFSUFJ7pVBArqScUTHqASTDkaUaKMguirFLqvfW2xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FQAwTvO+; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726842658; x=1758378658;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vb1mlYEI0m2HdYRCsq804tsecR/GPPDj7yvi33gn2g0=;
  b=FQAwTvO+0+mtkdf8gWcoHKrKrhutNsoEJmcx2DY9oODE/oG/34tNCVak
   DFUPjrufkYagkaVlpdvMLMHv7hxwFyp2qHGiq8PoD/guiCsr9Xm+BWNEA
   fz9zzd4WUTMqikpxCSMHAwpqIDgCM3PVdOUfIfzDvVoVFDJ/8OwF3gnRz
   fkMWPHd98DKLrJCjkL+Zn5AGWYp0rc1mETFB0gX433jenLVaDvNOKYxL9
   6de/SdnozMJH1xvvBhLlYJRfhgOLNuPsfEqvcnf8x/QikSrGJlr5k7yqC
   LPKdNPNG/O+T1fpkTC6Jm6FXD40gIWuwwMnF9BkBWGDsMyxG6vstyvMQ3
   A==;
X-CSE-ConnectionGUID: zN+/6lV6QcaZn05IwZVrcQ==
X-CSE-MsgGUID: Kto0JO3HQS2LiHxP4uS04w==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25948015"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="25948015"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 07:30:58 -0700
X-CSE-ConnectionGUID: PRjBQ4eRSZ25VQOQKvFwNg==
X-CSE-MsgGUID: cL6Lh7OnQLafA4rleM5aRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="71167211"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 07:30:53 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sreeo-0000000AwIn-1X9L;
	Fri, 20 Sep 2024 17:30:50 +0300
Date: Fri, 20 Sep 2024 17:30:50 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: warp5tw@gmail.com
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
	venture@google.com, yuenn@google.com, benjaminfair@google.com,
	andi.shyti@kernel.org, wsa@kernel.org, rand.sec96@gmail.com,
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
	KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com,
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/6] i2c: npcm: correct the read/write operation
 procedure
Message-ID: <Zu2HGte_05AA6yky@smile.fi.intel.com>
References: <20240920101820.44850-1-kfting@nuvoton.com>
 <20240920101820.44850-2-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240920101820.44850-2-kfting@nuvoton.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Sep 20, 2024 at 06:18:15PM +0800, warp5tw@gmail.com wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> From: Tyrone Ting <kfting@nuvoton.com>

Something wrong with your email setup. This patch may not be applied in this form.

But before (re-)sending, wait for others to comment (up to 1 week).

-- 
With Best Regards,
Andy Shevchenko




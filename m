Return-Path: <linux-i2c+bounces-10218-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B9DA80EB3
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 16:46:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4F094E19A0
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 14:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E4C01E1A3F;
	Tue,  8 Apr 2025 14:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NOdCzUK+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15361D63C4;
	Tue,  8 Apr 2025 14:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744123396; cv=none; b=sEp4z2VQTipKTpEerQQt+ee6rAn4O4dUTHaGwdajiWNUnkPTImb2gB1ZYmv0bvProdrtunVeeEr9B9iJU65v3PlnyZtA3ROoY23VY2MVrIU9sPmPHctSSVtmt7F2Cr1f2O2+1TniPqnqdKLhTcQJ1SN9x+Rcr/TbRKqDVIx9HYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744123396; c=relaxed/simple;
	bh=5M0p6kfK45Syu7bE/DVuxMvsQl6kJ9ckcSyirqg84zU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V9RmsZQcnSVutTxV2xXmnmPXTbSIl1uk0KJ6uxXP2tInWQ8S85O7yax8cBncnui+ACobrI0mpSW4DR7//TCd+jfz6QgTreLlKpV4fEBfyK8RQibO22rom3BHubGTeXgKxMUQYMu2N4Av1TaL2C/AhaseCVal2fNULHQw1/1pKVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NOdCzUK+; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744123395; x=1775659395;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5M0p6kfK45Syu7bE/DVuxMvsQl6kJ9ckcSyirqg84zU=;
  b=NOdCzUK+LL8Kxyw3huE5rZVm/FXXDKEYV7gY186/c+c6nJBJud9/9gkT
   ezA5hRWbVX0WTEl6tPujhkSv0QIQ/smiOObjhELAcdVK4fGT/esDpASzo
   A/5/1Ovypi/gDEn/oZyb6oAUJ1J7ZO64A7m/R8/gsoe/CntzpYT8LTzqf
   ChcTBw3rG7xz7KHTMjyur0xb/caqopi6m+EhCTvIHbRGr2eSFf6rFtdxk
   dstcNQtsClbZsjeZLhbtqDGtpjcBmmFwoqEfdkNlixgQ8DIENVGTUm59m
   d0DAigBjogipFH5NDWWrWuqOVkE98BbY+sumFh+ZyaJmoAv295pLY6X0B
   Q==;
X-CSE-ConnectionGUID: /gbK0gbpSq6dAAdJovsAyA==
X-CSE-MsgGUID: Q0yccF2uTgScf3+Sn6OHew==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56930339"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="56930339"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 07:43:14 -0700
X-CSE-ConnectionGUID: QZitOPVvSmuLPxSoiOn2Bg==
X-CSE-MsgGUID: 8QvLSUS1TxKhGAqmmqcPsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="128275238"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 07:43:11 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 817BA11F74E;
	Tue,  8 Apr 2025 17:43:09 +0300 (EEST)
Date: Tue, 8 Apr 2025 14:43:09 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v3 1/7] i2c: core: Drop duplicate check before calling OF
 APIs
Message-ID: <Z_U1_U_auRks60kf@kekkonen.localdomain>
References: <20250407154937.744466-1-andriy.shevchenko@linux.intel.com>
 <20250407154937.744466-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407154937.744466-2-andriy.shevchenko@linux.intel.com>

On Mon, Apr 07, 2025 at 06:44:57PM +0300, Andy Shevchenko wrote:
> OF APIs are usually NULL-aware and returns an error in case when

s/return\K/s//

-- 
Sakari Ailus


Return-Path: <linux-i2c+bounces-9565-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF33CA43C34
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 11:50:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 051AF3AD88B
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 10:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6115266B61;
	Tue, 25 Feb 2025 10:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RPUpgYZr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A2A2661BF;
	Tue, 25 Feb 2025 10:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740480527; cv=none; b=pjslda/r+ARTN4AoBriCVq/atFkuXw6JKOecu3147Z6Ecs281DvpgdyVSSy/edpxUqh01yNX0yxU7yzoiMjpYTcb7xX5QHNmQ69BH4Nf2W8AM9cRRt3dOct8C1fAW1VWnnqkrq3zpM4/Hof5ebHSCqsIdgYxHBl31pE1SF8KDRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740480527; c=relaxed/simple;
	bh=EZKl7xM2WjqoTZlxLf/CzLm4NBTsfbDvB7dPSIoct5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cSmcC+ngvE3Hw4fRUz89WsI46jJ+6UEm4DKvxduiSafMKnMp8t8sO85pw9Bzd3QKIRpPxgFQiBIUuy1Raw0YmafoHT9keIX14a+2O9azGvvgMZQe7Ra+GP3aj+9EJ4l57/2u8gUTxNjBUzj7CA87qElzuBYeF2Q5nQMn3g4p3Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RPUpgYZr; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740480526; x=1772016526;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EZKl7xM2WjqoTZlxLf/CzLm4NBTsfbDvB7dPSIoct5M=;
  b=RPUpgYZrnuOG2f8YGbJdF97ruE/GuYfUZLP0ppCsnTTfnOsHc6jQ6EGl
   j+znUi58fFGs47uiibV9RN2d4UQECx7Yz9908nxbsNfxK+qkrYnyzDQ0P
   ci5asP4zlvhUbuUBuC+/M8W/y/cx5N18KU+II24Nvn1fi4GS06fJ/yVw7
   8T9X+A6wenos7/jrDFWYQLp+rlwyFPaYptu2h3AzMbb75gGy7vntVdaCQ
   3ZKHV9X8bKPEJF4E+I9VciOv1beNgJhLwKzSJ6z+ty+lHShu5LJt/TBSq
   +GTqcm+EJUt5v0+YzppXtMwTyfc782BhZowEVsYG8t5E14GU51DXvFSE2
   g==;
X-CSE-ConnectionGUID: ZSSH63FaSJGaX7vhEbHtOA==
X-CSE-MsgGUID: g6FCnYdtStekxjDyuwIytA==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="58820754"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="58820754"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 02:48:45 -0800
X-CSE-ConnectionGUID: vwyC81D1ROOtVro34sXGOg==
X-CSE-MsgGUID: P5oBdL3NR5mjjo1tMZr/1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="116339812"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 02:48:44 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tmsUT-0000000Exjr-0jss;
	Tue, 25 Feb 2025 12:48:41 +0200
Date: Tue, 25 Feb 2025 12:48:40 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 1/1] at24: Drop of_match_ptr() and ACPI_PTR()
 protections
Message-ID: <Z72gCD7B0_jj-f2s@smile.fi.intel.com>
References: <20250225100838.362125-1-andriy.shevchenko@linux.intel.com>
 <b8a1315a-8d86-4904-92d1-179699f54e03@app.fastmail.com>
 <Z72dfxKzLLORkLl1@smile.fi.intel.com>
 <745ff032-1e71-4569-ac9f-07c44cbcb344@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <745ff032-1e71-4569-ac9f-07c44cbcb344@app.fastmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Feb 25, 2025 at 11:42:48AM +0100, Arnd Bergmann wrote:
> On Tue, Feb 25, 2025, at 11:37, Andy Shevchenko wrote:
> > On Tue, Feb 25, 2025 at 11:29:05AM +0100, Arnd Bergmann wrote:
> >> On Tue, Feb 25, 2025, at 11:08, Andy Shevchenko wrote:
> >
> >> Subject: [PATCH] [SUBMITTED 20240403] spi: remove incorrect of_match_ptr
> >>  annotations
> >
> > Was it applied (and the rest you provided here)?
> 
> It was part of a longer series. Some were applied, but the ones
> I provided here are those that for some reason did not make it.
> They should apply cleanly to today's linux-next.

I can review them and give a tag if you issue a new version.

-- 
With Best Regards,
Andy Shevchenko




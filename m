Return-Path: <linux-i2c+bounces-14469-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A29CABA76
	for <lists+linux-i2c@lfdr.de>; Sun, 07 Dec 2025 23:35:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87D5D30124D4
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Dec 2025 22:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3255028B4FD;
	Sun,  7 Dec 2025 22:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LMHD5TJw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DDD4502F;
	Sun,  7 Dec 2025 22:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765146931; cv=none; b=RQqU831BlccQkfbFQzRC3VlbHfNK1KngPmKdMtAyDifFP8rHSF5PF1Jjyky1OSXMevzINGQ0siZK5KzBjIhl24kiXmbungT+2nuU4kex+aiu/+Prpj33mBUmPm/N7aNAehfL0b561ej/zv4f6QbCdKOzLKPW8Z+uwZnGIcU7Obc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765146931; c=relaxed/simple;
	bh=QWkl0kwjBDtREVtvSh0+OJo95vV4EJjMAPJ7sMxTGV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VwTyVYb2bIaeAWo9yYX1eGJuHmnNpPIEUwmWA3K4lEFGZ5E5ZzYdGD8PTocxF9FhbVsvk6+uZFcj2XAslkgvrwBQaEcwnmwnRHLRqFpwK/522xwLz3TMpBJxOKfReN4ONwSv7Al+m0RREdik80QOhtghNPGGhHe2iYrZJYj+1J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LMHD5TJw; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765146929; x=1796682929;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=QWkl0kwjBDtREVtvSh0+OJo95vV4EJjMAPJ7sMxTGV4=;
  b=LMHD5TJwrcIH2qsoPt9M7ldQnH0yNZxc83FOdcuG2SuuFIeRsaGkNKhN
   /uhrPbm9LLwfLprzv7qnqBvi3Rz/VuBkQ2a2OY8aPOEbPdrgdqlSLVH/m
   S4T03FLn9OpqKycNTo5E00vWa72jUWf4B22Fq8v8wRuDnZFAPzxBGG3gc
   iY9DHvsjLObC+kg5mhpuw/R9e7WVBszyOXhBaCa9u30WG62UsDE42bNnB
   ILvQpCnnjS3/yZ11/loqzuNc9VdMpUBNZeq72Z9w3P+lLfkbFauCSLBID
   m6mgi5PVMebNk2Ig3qupmDljOYzC7FVl7Icd0CQtmOavoKT3RPlWiv/5n
   Q==;
X-CSE-ConnectionGUID: ylY1m3UbR56P5cx1BeYAJg==
X-CSE-MsgGUID: 4aVF4HhqTjCKs+NfNXbh/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67141829"
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; 
   d="scan'208";a="67141829"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 14:35:28 -0800
X-CSE-ConnectionGUID: ZKmQuc7iQb2yX4tlQzpABQ==
X-CSE-MsgGUID: yAVTPkqEQLivAU8Rru+AQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; 
   d="scan'208";a="200258356"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.218])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 14:35:25 -0800
Date: Mon, 8 Dec 2025 00:35:23 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Askar Safin <safinaskar@gmail.com>
Cc: Dell.Client.Kernel@dell.com, bartosz.golaszewski@linaro.org,
	benjamin.tissoires@redhat.com, dmitry.torokhov@gmail.com,
	linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, regressions@lists.linux.dev,
	rrangel@chromium.org, superm1@kernel.org, wse@tuxedocomputers.com
Subject: Re: [REGRESSION][BISECTED] Dell Precision 7780 wakes up on its own
 from suspend
Message-ID: <aTYBKzQXiCeIqaTd@smile.fi.intel.com>
References: <aTLjgEVfLCot0cSm@smile.fi.intel.com>
 <20251207040459.3581966-1-safinaskar@gmail.com>
 <aTVUakljrd-sysxP@smile.fi.intel.com>
 <CAPnZJGAxhXNOw1V5FTPK2Mrvu0YAPwm0Ph4UHd2aZv=kgx1qWg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPnZJGAxhXNOw1V5FTPK2Mrvu0YAPwm0Ph4UHd2aZv=kgx1qWg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Dec 07, 2025 at 07:45:28PM +0300, Askar Safin wrote:
> On Sun, Dec 7, 2025 at 1:18 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:

> > I think nothing. It's better to try to actually fix the non-working scenarios
> > rather than remove the feature completely.

> > P.S.
> > I'm sorry, but why are you so eager to remove something? While in many cases
> > removal of (potentially dead or unused) code is considered a good thing, it's
> > not always the case.
> 
> Removing code is easier than writing new code. :)
> 
> Speaking of initrd, I tried to understand Linux init code a long time
> ago (out of curiosity),
> and so I wanted to remove initrd (to help me understand the code).
> Also I saw initrd
> deprecation notice back in 2020, and I decided to send a patch for its
> removal back then.
> But I got time for this only now.

The initrd support is scheduled to be removed in Jan 2027 IIRC.

-- 
With Best Regards,
Andy Shevchenko




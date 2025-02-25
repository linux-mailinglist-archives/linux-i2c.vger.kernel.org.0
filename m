Return-Path: <linux-i2c+bounces-9563-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84ECBA43BF4
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 11:41:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B49BB164C41
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 10:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E779B23BD11;
	Tue, 25 Feb 2025 10:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YC/xapEf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBDE1FDE18;
	Tue, 25 Feb 2025 10:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740479878; cv=none; b=PJj7ePVSWnptzidzGsich76Jmuq0WXJsZEUl1MX7XrWT515hKoRx4v/fX62+fzw+WRnCBgZVwfokTVUxLsoSYvlVpRQYQ8InJef7p+htfvsfTTEvkPuLn6xSM9+tX9s4XX7PVGyXUJraH/TWjq2eaq4s8coZKr8qfrNkhAJShU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740479878; c=relaxed/simple;
	bh=vs/wwxt5DOMp/6xhNJ+6yjgOoU2fOm7g5unK87DJaC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oyMvHGRD7imhPF9YAPR5N4mTbHAZyDERHwSKagKhaXLQO7WH1GD/NrNrCIBKWhzNsKBGxf0uU6X7Sy883qOw385NftMTFMP+BOeQaTrrCbPLdLDW+LH27KLAzV6EsVsMtsxMVaXAF+sQ8GtvxMDlBPk2Vl/bBd+sxSH8w/QXj9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YC/xapEf; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740479877; x=1772015877;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vs/wwxt5DOMp/6xhNJ+6yjgOoU2fOm7g5unK87DJaC0=;
  b=YC/xapEfoKCzwG1PrDnWCgdhVnifhQ2fuUC3wJOXwBiWHjUo29UJF9hW
   fsI9yj62kxb3aOyedX+bIerC4SVODBAnD91FIfqWAAmDamVFi3pk4y4Jh
   elLWS/shzmI/9nlT0h7/2WqihhDBOrF+acNacRbvMv8Gwg8LMOOCRoqTM
   YJfeaN0nBD4L0kLFxyTDKUGad/2UBtJ2uaNjTX0dZnnBLGKGvMyfa3RKb
   +LzgAbCm3LK/UruA7RfDffealkymADwWv/wuoScdvlswfDg3xw9oXXooe
   fkgeMwIDUU/BIml+ergsFI/3SFsmL9BsjCJ5h1JiV46Rc9BLTw2lI8E1A
   g==;
X-CSE-ConnectionGUID: gIOttq0vS1ybJxWtST0OWg==
X-CSE-MsgGUID: FsOXRq47SQusBIDL5VoPhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="28869635"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="28869635"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 02:37:56 -0800
X-CSE-ConnectionGUID: ZB6kWAn6SkWq6/29SPCKdw==
X-CSE-MsgGUID: Rxoeeh+3QwG+6vRQoDD+Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="116362428"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 02:37:55 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tmsK0-0000000ExbG-0sh8;
	Tue, 25 Feb 2025 12:37:52 +0200
Date: Tue, 25 Feb 2025 12:37:51 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 1/1] at24: Drop of_match_ptr() and ACPI_PTR()
 protections
Message-ID: <Z72dfxKzLLORkLl1@smile.fi.intel.com>
References: <20250225100838.362125-1-andriy.shevchenko@linux.intel.com>
 <b8a1315a-8d86-4904-92d1-179699f54e03@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8a1315a-8d86-4904-92d1-179699f54e03@app.fastmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Feb 25, 2025 at 11:29:05AM +0100, Arnd Bergmann wrote:
> On Tue, Feb 25, 2025, at 11:08, Andy Shevchenko wrote:
> > These result in a very small reduction in driver size, but at the cost
> > of more complex build and slightly harder to read code. In the case of
> > of_match_ptr() it also prevents use of PRP0001 ACPI based identification.
> > In this particular case we have a valid ACPI/PNP ID that should be used
> > in preference to PRP0001 but doesn't mean we should prevent that route.
> >
> > With this done, drop unneeded of*.h inclusions and __maybe_unused markers.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Thank you!

> For reference, see below for a couple of patches in this area that
> I have sent in the past. Ideally I think we should try to fix these
> all up and enable -Wunused-const-variable, which is useful in its
> own right.

Agree.

> Your patch does not address a warning, but it's still a step
> in that direction.

Yeah, because the original code uses __maybe_unused markers.

...

> Subject: [PATCH] [SUBMITTED 20240403] spi: remove incorrect of_match_ptr
>  annotations

Was it applied (and the rest you provided here)?

To me sounds like a good cleanup that should be applier sooner than later to
move forward of getting rid of of_match_ptr()/ACPI_PTR() completely.

-- 
With Best Regards,
Andy Shevchenko




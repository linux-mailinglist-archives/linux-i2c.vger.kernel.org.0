Return-Path: <linux-i2c+bounces-9593-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA418A46252
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Feb 2025 15:20:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24B463B23D7
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Feb 2025 14:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50AF13209;
	Wed, 26 Feb 2025 14:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VjGKdP0R"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888B2215189;
	Wed, 26 Feb 2025 14:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740579516; cv=none; b=vB0XXPPNTN+XLdztdLt0HocYDnW/q2y/B2GpLH5h9LIZ41TIic5Qc8TgQZHQS8Gs7+pKe5b9L8Uz9DCj/M1NhF/Wu5yN3UosH2ha+fingTrFwoprarfQi86SxB1K+aknKCIAdFYJdJrGoWh/fy+rtkb0OEDbvD8HBJTZwCBssAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740579516; c=relaxed/simple;
	bh=ndFpRLYKEHxnJ1s8gsGlGIAitzbvs/D3TQNPbg4ow/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IIPea7E/cULtDm3GWCFDDWdTnJ13OYB+lp3ZhJDNXDxbUAjZtAwB8hBMx+Zzkwpjm4EgwK0EZpKK8aEqIjlXVspvXrBvV83VypEJO4KeLD22emY6Nv2ugyF06/JjMK5lM6EltKyW+/4CNiTzFT2TJP8APJVtDGOWy/S/e3+ciCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VjGKdP0R; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740579515; x=1772115515;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ndFpRLYKEHxnJ1s8gsGlGIAitzbvs/D3TQNPbg4ow/4=;
  b=VjGKdP0RR9OtzcPPpO+RBQOmqRLbIc6PIuW129y9wzj8HYsnoQ2a1MeV
   E/UW54QcDumKBigGkZUyGT/+/KqomHqmIS5ZsyU1VQpIiTRzZe8gvQPyW
   WNqleyuCY84Hpmq8tFQ5weqRwtI1Pl0zevsiesJI3ccZi8N2ea4R+4Oyy
   kiXmJSDbqtSJVyzfdNj46hKn4ybW0ne8AhVmxDsnv7IgjwkjJ1HoSAM8J
   zJxU7RFolpy/tRXKRMtoOMEkYCIPe34dYcQoLWOUt63bPyHD3wuliZ4eT
   FYGRaQO9Lmf2MvcFZI6bT18Xmxliu6t6mX7zuPbye/ho5NArPCFo9RZWa
   A==;
X-CSE-ConnectionGUID: XMGDdfudSTuPYfqofaqN7Q==
X-CSE-MsgGUID: /teYI7eRREm62hu5vGSFEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="45338541"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="45338541"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 06:18:34 -0800
X-CSE-ConnectionGUID: rhYYiWhVRAOX7qAfXgafIQ==
X-CSE-MsgGUID: D1fJBsABR9agnTTNax24AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="121647667"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 06:18:32 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tnIF2-0000000FLRA-45Z9;
	Wed, 26 Feb 2025 16:18:28 +0200
Date: Wed, 26 Feb 2025 16:18:28 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 1/1] at24: Drop of_match_ptr() and ACPI_PTR()
 protections
Message-ID: <Z78itKfsojtMpr_o@smile.fi.intel.com>
References: <20250225100838.362125-1-andriy.shevchenko@linux.intel.com>
 <b8a1315a-8d86-4904-92d1-179699f54e03@app.fastmail.com>
 <88ad89bc-9261-4af0-a7ab-28dd760af567@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88ad89bc-9261-4af0-a7ab-28dd760af567@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Feb 25, 2025 at 06:21:29PM +0100, Krzysztof Kozlowski wrote:
> On 25/02/2025 11:29, Arnd Bergmann wrote:
> > On Tue, Feb 25, 2025, at 11:08, Andy Shevchenko wrote:
> >> These result in a very small reduction in driver size, but at the cost
> >> of more complex build and slightly harder to read code. In the case of
> >> of_match_ptr() it also prevents use of PRP0001 ACPI based identification.
> >> In this particular case we have a valid ACPI/PNP ID that should be used
> >> in preference to PRP0001 but doesn't mean we should prevent that route.
> >>
> >> With this done, drop unneeded of*.h inclusions and __maybe_unused markers.
> >>
> >> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > 
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> > 
> > For reference, see below for a couple of patches in this area that
> > I have sent in the past. Ideally I think we should try to fix these
> > all up and enable -Wunused-const-variable, which is useful in its
> > own right.
> 
> I tried to fix this in SPI, regulator and ASoC 2 years ago and Mark
> rejected such approach of dropping ACPI/of_match_ptr. AFAIU, Mark wants
> this to be fixed in more generic way, on the OF and ACPI common code,
> not per driver.
> 
> SPI:
> https://lore.kernel.org/all/7a65d775-cf07-4393-8b10-2cef4d5266ab@sirena.org.uk/
> 
> regulator:
> https://lore.kernel.org/all/20230310214553.275450-1-krzysztof.kozlowski@linaro.org/
> 
> ASoC:
> https://lore.kernel.org/all/20230310214333.274903-1-krzysztof.kozlowski@linaro.org/

It was almost two years ago. Things may be changed :-)
At least I have no impediments so far with converting drivers I'm supporting in
the SPI. For ASoC there might be a new attempt by Cezary Rojewski in the future
(he does some cleanups in that area, and we discussed cleaning up ACPI_PTR() at
 minimum).

Also note

$ git grep -lw ACPI_PTR | wc -l
238

$ git grep -lw of_match_ptr | wc -l
841

So, at least dropping ACPI_PTR() seems on the track to getting rid of.
And I checked, they are spread all over the kernel with top subsystems as

  ...
  10 drivers/hwtracing/coresight
  11 drivers/input/touchscreen
  15 drivers/media/i2c
  53 sound/soc/codecs

-- 
With Best Regards,
Andy Shevchenko




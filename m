Return-Path: <linux-i2c+bounces-6907-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF91797D853
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 18:28:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 259DA1C2142F
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 16:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0380117E008;
	Fri, 20 Sep 2024 16:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H8Vkviwe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D1317DFF2
	for <linux-i2c@vger.kernel.org>; Fri, 20 Sep 2024 16:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726849684; cv=none; b=uVH5Has2jJvLtlbS9P5GqjQxIcYtkXlowlTHIGcWDQ2D/JbYx3t1oyRjWCSNXvmjr82NH1e+Pgmztet4qVr3NjYKJSw253OkjP8zj4OSlOndTjPGuOVCVCTL8YRjfYIsJXAaL8A/8XEUlkNCxuMV6RgcmTJ3xnp5EdLXojkWQyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726849684; c=relaxed/simple;
	bh=VWoDIsuVtGKNpvHeUqPOM/Qg5i8IhjdQ1jczD8oKsfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cWfFDlQCbUlHZZgrL5RNvtZsNwc5vtLMEafjUo2Scbyn/q8Ub2uzKNr7OIIiYGsKB6CGO61uuEQ/Si1J3xZ8B0L2bPTytXsHERNmfidw3IuD5NZiSVbb9NK34AZ/319UwFeV84LofFS6YpNeYH/e2YsGPyQIbRe771aogBKLq9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H8Vkviwe; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726849683; x=1758385683;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VWoDIsuVtGKNpvHeUqPOM/Qg5i8IhjdQ1jczD8oKsfg=;
  b=H8Vkviwe2ocFqOCpcvY89CmfyVxdRTgdC56RySlU+GlUHgNIm9gu29qR
   7y8h1QRPKCiNb7i5cKaiok34Cl/hK1Gh1KYkTRit4p9647HIaEec5c6Qd
   XGHefXjA7ErxQLmDVXAlKHFhd0oEh6bryiHFrMHm9k7JiwHxLNf7cL6fD
   d5gYZD/tF/uQO2A4ySYlMFc0zoeKGJpfKJH5XjaRdPIQkgo3Q3TgXJHUd
   qrl8F2PEHUfl6xWXk/s1M59CsY1BIfZBMyjcTjNGtFbaqqD1MNZv+ssJY
   Ul7G5uAoBJNzfDL2X+3cIJH8t3JzyqxCA96XpisSChuLXL7njsTRuvp5a
   w==;
X-CSE-ConnectionGUID: DPRKyOiSTwSYS414vIGrrw==
X-CSE-MsgGUID: q6OAhLoZR6GptVoOpwH8zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="25983292"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="25983292"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 09:28:02 -0700
X-CSE-ConnectionGUID: rrtE9CTqRiijccK6N5F6kA==
X-CSE-MsgGUID: 6vCEixA1SbmWC/CJzxURHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="70669646"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 09:28:01 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1srgUA-0000000AyTe-1VYq;
	Fri, 20 Sep 2024 19:27:58 +0300
Date: Fri, 20 Sep 2024 19:27:58 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com,
	Patil.Reddy@amd.com
Subject: Re: [PATCH v6 4/8] i2c: amd-asf: Add ACPI support for AMD ASF
 Controller
Message-ID: <Zu2ijgbG-qfehYwM@smile.fi.intel.com>
References: <20240919175913.1895670-1-Shyam-sundar.S-k@amd.com>
 <20240919175913.1895670-5-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240919175913.1895670-5-Shyam-sundar.S-k@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Sep 19, 2024 at 11:29:09PM +0530, Shyam Sundar S K wrote:
> The AMD ASF controller is presented to the operating system as an ACPI
> device. The AMD ASF driver can use ACPI to obtain information about the
> ASF controller's attributes, such as the ASF address space and interrupt
> number, and to handle ASF interrupts.
> 
> Currently, the piix4 driver assumes that a specific port address is
> designated for AUX operations. However, with the introduction of ASF, the
> same port address may also be used by the ASF controller. Therefore, a
> check needs to be added to ensure that if ASF is advertised and enabled in
> ACPI, the AUX port should not be configured.

Okay,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko




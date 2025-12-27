Return-Path: <linux-i2c+bounces-14791-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 45367CDFDB4
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Dec 2025 15:31:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0938D300EE6D
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Dec 2025 14:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2963224B1E;
	Sat, 27 Dec 2025 14:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SnPHK+ly"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436DB7263B;
	Sat, 27 Dec 2025 14:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766845896; cv=none; b=S/GZryqo7Q4lGWELngqP3t/YtMJOU/7Z586AIqyzbfDWsK2KSAShzajwBIldeXUkDmmayihKCBo3/EalKB6FGgp8bBiQ81x2ymKGDVxaf+hEdRp59OaVBArtMceJ97k04TlIhvx+CAE761UO9jUX5M8w/3heB1XK7LCM1hFV5SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766845896; c=relaxed/simple;
	bh=I53vQC5TQ6csqeyM+InkssGCA5qf1USuYwDCc9UYwCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FM3OvImZVKDFia0rKlZtXHqv9EwzuiVEAhmFNT/VixG++PT5IbfG/N/IFLW2YK0OKMiAI9bj0yqeTgMGgkcoEOjq5AkzQ+j6LX0ACtS8q6oFxrJ2sGzmkQmRK30MinYgR+2zELfGalt0kM8auS/5o3KvrVA67Vtyp4B7hrET1dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SnPHK+ly; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766845895; x=1798381895;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I53vQC5TQ6csqeyM+InkssGCA5qf1USuYwDCc9UYwCI=;
  b=SnPHK+lyZ5SwGEAFShOdi3JC4BfWpCOlkGV96vYb4oCGYpeRAZqgR2v2
   Fb+0+44IjPlVf8QRCdld19+xtuHuXRiKW2r4gkXBxiA7oBNRmVkp1MiTw
   2YuJwcosz8vmeLK5QS/VGMkRnzI3xYAw7b2kIfHwbu4bX2mtNPNmsNNgZ
   /+4uqv1f6hzD7sUd0z8tCKKHYHXPPhZqqcD8WGIdm3Rh+ODZgU21x/PP/
   JpACAZkdgt0yna7JGwQWEY/EeYGjdLoK9okSqSrbX3fxofGXlb8+eztB0
   mD3uvvKeu8riHRi5eRxXUhFqL/C2F5PM2QRvK+P8LFdlkcLEHKdEWgyUV
   Q==;
X-CSE-ConnectionGUID: tKGfLnpiSIGKUvlIT8yc7Q==
X-CSE-MsgGUID: ofgVFOc7S9a7KzeSZezpMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="79268686"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="79268686"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 06:31:35 -0800
X-CSE-ConnectionGUID: Ec0POrjkTsOuC0iJtXbNYQ==
X-CSE-MsgGUID: 89FhSsioSDSqX8BKnKxK2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="205045989"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.211])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 06:31:31 -0800
Date: Sat, 27 Dec 2025 16:31:29 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
	Nirujogi Pratap <pratap.nirujogi@amd.com>, Bin Du <bin.du@amd.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Hans Hu <hanshu@zhaoxin.com>, Bartosz Golaszewski <brgl@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] i2c: viai2c-zhaoxin: use i2c_adapter_dev()
Message-ID: <aU_twcFq6RFte9_f@smile.fi.intel.com>
References: <20251223-i2c-adapter-dev-wrapper-v1-0-bcf960a48fa9@oss.qualcomm.com>
 <20251223-i2c-adapter-dev-wrapper-v1-6-bcf960a48fa9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223-i2c-adapter-dev-wrapper-v1-6-bcf960a48fa9@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Dec 23, 2025 at 11:08:23AM +0100, Bartosz Golaszewski wrote:
> Use i2c_adapter_dev() where applicable in order to avoid direct
> dereferencing of struct device embedded within struct i2c_adapter.

...

> -	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
> +	ACPI_COMPANION_SET(i2c_adapter_dev(adap), ACPI_COMPANION(&pdev->dev));

Same comment, use i2c_adapter_set_node().

-- 
With Best Regards,
Andy Shevchenko




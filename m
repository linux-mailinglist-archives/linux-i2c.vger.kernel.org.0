Return-Path: <linux-i2c+bounces-13628-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE6ABED5BC
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Oct 2025 19:36:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8990734D6ED
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Oct 2025 17:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC3225F784;
	Sat, 18 Oct 2025 17:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z21M+O6b"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE0326E146;
	Sat, 18 Oct 2025 17:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760808918; cv=none; b=npNwKvbSOoKiegIkRBug9JVVInuTslAVOLI6YaIB0ZzBzIVE30vjmGGMJq4ewCk2IJNTO8Y0BB1R8rl2JPB1xw3moYx1EHcg4OFwpTkKbfCvhmDlOwABU0b8ZAeraK7is7ZtODoqyQ5T4cyGOZCDAs3AQBpkiLOnAit2ta+4Fak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760808918; c=relaxed/simple;
	bh=zIUhfmZlwXzPPaFyUsLhgqpb8bRK8GXoj1StTdc3sx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zi1SG2+xBJfcoJKOQ1ofyqO+ADdJiySX6CGdILRMRbOi+vTO1a0xiGh4J8fwaA54O49vKGLfGVpht3gAB2TU31bkSdnaK4bT+6s6d2AovFXXxHFNuaoCz6tOXjgf7gQuVV5wXkuC8HPDKjv7PJXOKEf43j6iC/zPuKODVTVSK1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z21M+O6b; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760808918; x=1792344918;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zIUhfmZlwXzPPaFyUsLhgqpb8bRK8GXoj1StTdc3sx0=;
  b=Z21M+O6bJIV2KLcPa04e21UEJRisA9GTz41ARHTN3DVMSeEeFYH3xxDA
   tzaW3WjVSG/71iMl6TN8ae/uJDf3JMiQDF7ygGv+mdP5vZtriUy4P3Mwn
   Iijg4HASlQWWrZeFRMWozco3nxlBmoOxOfi7ObLrHjRqNqQvWY9wrhw7W
   B/UAFw7Qj+919dJnWjDoPdSDq7e//U8WZCy6KCo/SbHzMd7764jncUPTK
   4SwywUH3wLQUYvSTsSfJjt4OCEKCj6D3Oy5SE21vMjJPDsR8vVlOOVlSH
   qUtiHlibpy3jiuN22skGYqPgr2D/YzgmeYpyQH8y5PhYPyLF4kjevwfpm
   g==;
X-CSE-ConnectionGUID: OPp14IsETAOy8exn/RztUg==
X-CSE-MsgGUID: MTOL0Y5gSjSFsZdd+GrorQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80433968"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="80433968"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 10:35:17 -0700
X-CSE-ConnectionGUID: 2m6XZY2MRxaI0FQBR0dhRQ==
X-CSE-MsgGUID: A9h40lVFRFq7Pjg+7a+xAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="182117496"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.194])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 10:35:15 -0700
Received: from andy by ashevche-desk with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1v8ZFs-000000005zA-2Gof;
	Tue, 14 Oct 2025 10:15:32 +0300
Date: Tue, 14 Oct 2025 10:15:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jinhui Guo <guojinhui.liam@bytedance.com>
Cc: mika.westerberg@linux.intel.com, jsd@semihalf.com,
	andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] i2c: designware: Disable SMBus interrupts to prevent
 storms from mis-configured firmware
Message-ID: <aO34lJ6ZPu0fNu91@smile.fi.intel.com>
References: <20251011073057.2959-1-guojinhui.liam@bytedance.com>
 <20251011073057.2959-2-guojinhui.liam@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011073057.2959-2-guojinhui.liam@bytedance.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Oct 11, 2025 at 03:30:57PM +0800, Jinhui Guo wrote:
> When probing the I2C master, disable SMBus interrupts to prevent
> storms caused by broken firmware mis-configuring IC_SMBUS=1; the
> handler never services them and a mis-configured SMBUS Master
> extend-clock timeout can flood the CPU.

...

>  #define DW_IC_TX_ABRT_SOURCE			0x80
>  #define DW_IC_ENABLE_STATUS			0x9c
>  #define DW_IC_CLR_RESTART_DET			0xa8
> +#define DW_IC_SMBUS_INTR_MASK		0xcc

It seems one TAB too little.

>  #define DW_IC_COMP_PARAM_1			0xf4
>  #define DW_IC_COMP_VERSION			0xf8
>  #define DW_IC_SDA_HOLD_MIN_VERS			0x3131312A /* "111*" == v1.11* */

...

The rest LGTM, but let Mika to review.
FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko




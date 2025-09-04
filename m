Return-Path: <linux-i2c+bounces-12647-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF16B43FEA
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 17:03:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED5CBA04F69
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 15:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9029305E1D;
	Thu,  4 Sep 2025 15:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FEA2393k"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EDE308F07;
	Thu,  4 Sep 2025 15:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756998161; cv=none; b=COpwmKyy2ahoc3MLCxYEV2yooOLgJMQGuE6eGWojNGJ5Xkx+DYNZ8qXMj2r+7ryvLAEordhAFvaH+ViQyzykHOiRxBg+moHV2XSdtwXDdvzGXT1Nn/V0CXz84koZOLkZeQzSWJEKaxF0vu0xBFGPNAA647RD+dYAxDeunYJwj0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756998161; c=relaxed/simple;
	bh=aqQvO7BVnd+izTVQTL73R0RC4hkApjsrvY3xuqx8H0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RMnNVLWMyq5TnScH0Vc8ermVwLo/zY/EFkHNAaf2EWXmcIOHWmvn5POVBmiT0RIgo/QngHclmmDfzbv0pcDJRxoDPwzr3MgyO0sjjr8km4orZ2I3unHPmSy362kfTidXdRXqpqUWl3znYO60eq4IiAbySE/kGELoho9Bs6EHbcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FEA2393k; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756998160; x=1788534160;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=aqQvO7BVnd+izTVQTL73R0RC4hkApjsrvY3xuqx8H0s=;
  b=FEA2393kTGV6dUReOgYE74MyQbqd76xTDGOwOA1vlmeXm8DUwWCgkg+O
   ukYacFf8SMCM5cRwRCZ3K8Iz6UTW/Ms/SArUfYWL2RvZ9ElZv0y7grjvT
   Nlrz2w33lo6ixm44y6JQ72UL0iwVJI+ZJ8bobSCLZPw0HANV4v3FzJ2uP
   gw5IW5pK5mnwEMyFQy5TEGFSRmIx0OxNTyKF/qzEuu3mKB0X487x/HfcE
   Py/mMBvhs9pLIgXPghixX1TUpqGVjH1DbXszUptCBHGXFLwJFYP58SIOr
   BfSC0d4pk7KF2+29mMGBV32jIyzZj0wJtScCYCdVW0rjdOCpQXYeXRKti
   g==;
X-CSE-ConnectionGUID: o4nF+ZExRk+mdYh0D5hVqQ==
X-CSE-MsgGUID: kmXTROQnTRGvieALOrBURg==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="69956075"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="69956075"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 08:02:39 -0700
X-CSE-ConnectionGUID: uPNZYhKAQhGIN4bP8kYMmw==
X-CSE-MsgGUID: wk66vjM0RraQly+h2Sq2MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="202842457"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 08:02:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uuBTt-0000000BInE-3d6n;
	Thu, 04 Sep 2025 18:02:33 +0300
Date: Thu, 4 Sep 2025 18:02:33 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] i2c: designware: convert to dev_err_probe() on
 request IRQ error
Message-ID: <aLmqCW1YwrhZkNSG@smile.fi.intel.com>
References: <20250904-i2c-dw-dev-err-probe-v2-0-e59da34815fa@bootlin.com>
 <20250904-i2c-dw-dev-err-probe-v2-1-e59da34815fa@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250904-i2c-dw-dev-err-probe-v2-1-e59da34815fa@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Sep 04, 2025 at 04:31:06PM +0200, Benoît Monin wrote:
> Simplify the error handling of devm_request_irq() in
> i2c_dw_probe_master() and i2c_dw_probe_slave() by converting to:
> 
>     return dev_err_probe();
> 
> instead of calling:
> 
>     dev_err();
>     return ret;
> 
> This also handle deferred probe error without spamming the log.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko




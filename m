Return-Path: <linux-i2c+bounces-12648-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A5CB43FF1
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 17:04:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 800FC1C832A7
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 15:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 338D3305043;
	Thu,  4 Sep 2025 15:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ViJ8659i"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B17A2FC02F;
	Thu,  4 Sep 2025 15:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756998277; cv=none; b=jxWMxwxcJ8jWnmBvjRGa1KejNy9fvwOu1g98Xd2GEcWx4SQoPCWvn8Wg0DiFecg+a2bf6z2FuMGJOi8gqiwQwdmxoBI4JKjnmYy54893cY1oaE2ikQKDlAP9k/huAZv9g4qW4b2V2Dpc93+EBPmIGdZfedV31CPUKXLexoQzBT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756998277; c=relaxed/simple;
	bh=I60lvMaA2fy/7Bwto+aKufKK5YR4Y6CMkO0b6UF3Kpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UVE5rYeJFyz/95lUFaoCjdmLeHb2bp+0tHtOAYUksAysVrwRgvHqEGztNMQKTFWeoC5bjPu7rvoVOiAS1IZxk1ex+tXFzeH8yRQf0sAZjfkPv1NkjXagCLFHqsmMvL5WUiKshJlxfa7bC3Tg4SJFb9yw/GpJj7xe0PEjwBYT+q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ViJ8659i; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756998276; x=1788534276;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=I60lvMaA2fy/7Bwto+aKufKK5YR4Y6CMkO0b6UF3Kpo=;
  b=ViJ8659iqGQwznlnaBHSjcqaZmIISXaYs48AdPO7qn+DUkiUQ/x7fxOR
   HkvpLQfn3yXXoim6LxuVF8e3DPFx0yLW9dcjpX7FvzMbZcj7l1nZyEnvX
   ni1zwCKi+BcRtW//otk1PFUYMlhYtxt2nXa9gShM/twBU3HpHJMhY3E8d
   2vyp0O/wBEkxgcfd8VvFF4YTz7cIE1DKVJSu18fYvuHjAnJVRJ9XCCvu2
   EPN1xG5h4xY8DhJHrLGUk0oirNFZ86QLrxjgqezxxMD7CJCS8vKi3CUBo
   qoC2gxjNrfgKpCV7tqgKDheuAWwXnrXYfq8ut5cJ5sLSh91jZcgetuCGj
   w==;
X-CSE-ConnectionGUID: VdqUBzhCRCWK8ErdEYQBrw==
X-CSE-MsgGUID: Pcd2ekoqQYKgJpgY4mv7VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="70716113"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="70716113"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 08:04:35 -0700
X-CSE-ConnectionGUID: 4TSUZqpdSAWYg155vGUb7w==
X-CSE-MsgGUID: E5HNrEcjROGgprxU/fnauA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="176262860"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 08:04:32 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uuBVl-0000000BIoM-3pOK;
	Thu, 04 Sep 2025 18:04:29 +0300
Date: Thu, 4 Sep 2025 18:04:29 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] i2c: designware: use dev_err_probe() when probing
 platform device
Message-ID: <aLmqfQm2w3y1MM_2@smile.fi.intel.com>
References: <20250904-i2c-dw-dev-err-probe-v2-0-e59da34815fa@bootlin.com>
 <20250904-i2c-dw-dev-err-probe-v2-2-e59da34815fa@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250904-i2c-dw-dev-err-probe-v2-2-e59da34815fa@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Sep 04, 2025 at 04:31:07PM +0200, Benoît Monin wrote:
> Add calls to dev_err_probe() on error paths that can return
> -EPROBE_DEFER when probing platform device. Namely when requesting the
> reset controller, when probing for lock support and when requesting the
> clocks.
> 
> PCI device probing already use dev_err_probe().

Makes sense by at least two aspects:
1) less log spamming for deferred probes;
2) easier to debug an issue (I assume it's your case).

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko




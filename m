Return-Path: <linux-i2c+bounces-12614-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6ABB4378C
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 11:49:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A1E354553C
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 09:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFAA02F83C0;
	Thu,  4 Sep 2025 09:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BnQGCtsO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1920E2E88A6;
	Thu,  4 Sep 2025 09:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756979384; cv=none; b=FPlx+q00hOqgWgZmV0cv82gcOsLX4ZBa0C/LmYucjlqp98wo4QkkXkSsI0yvAIbAhVPscMIumzQLjiLnPxy4onrObDlkK0/w2um64fLmFs8BLn5C3fV5VbDzRnhCrTyMowlcj4HUhYwsLhQ6oWVMOb0LH6jeQEIW4F9aLhwmfEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756979384; c=relaxed/simple;
	bh=LTd9DO5iC+rsaQHJ8nmu4yfR1TBtklbVQoOL9sBZ8W4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DOEIsRqkM34m5gY785Y2gW2T4ymQPHMAoUcW8OJFQgUI32xf2LoHfJItbHKvpyMJqoJ3j5lQVsMiSgn3WCdB84zeXJlcCtfGXBM4lrSHFcHI0tUtjL+3ZtpIukg+Nh8hegEDxXJpXuXIsRBFIbq1+DAwPtEo4SIOcWwaZdTXy8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BnQGCtsO; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756979383; x=1788515383;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=LTd9DO5iC+rsaQHJ8nmu4yfR1TBtklbVQoOL9sBZ8W4=;
  b=BnQGCtsOtFqgRddNttKO15qrDW36OdxsEOqLN7bd33V7xmFfz74s9doZ
   ovE5Rc8q2ZPFNUAYtV/ZaDT9sf9lU8haxkmw8xgtLk62VkBhzCcl3Tqf6
   Jq5fDDo1jiWQog8sfnfaGfyOfhsnGTqPpc6NfE8SSQ2LLHhZuWe30X1i0
   ICCEZbsT19B23fQ4vz2RO1cXBcRnWux2HJBp3sH3/AtrE+FSXnMW0PO2a
   JlIHIvz2uIr2s5wQUjx40JR94U5sFGgtprYB1tjikqbwnVuSekG4yZSNN
   ZakK+TtLA1VZGJn8tMh3X8p85t2sVsKE8ijsOy+KASde0tQr4nv+CpXC6
   A==;
X-CSE-ConnectionGUID: pchJcaZsQ1aa50pnp4rn6A==
X-CSE-MsgGUID: Tgvd9UFHTS+neAufB9Eo1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="62953476"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="62953476"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 02:49:42 -0700
X-CSE-ConnectionGUID: 760uCKLlQriNhzKI2gxazg==
X-CSE-MsgGUID: AwXql6ATTpafFERblQI85Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="195504677"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 02:49:39 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uu6b3-0000000BEWA-0pfE;
	Thu, 04 Sep 2025 12:49:37 +0300
Date: Thu, 4 Sep 2025 12:49:36 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: use dev_err_probe when probing platform
 device
Message-ID: <aLlgsLDFvBGA7OZA@smile.fi.intel.com>
References: <20250904-i2c-dw-dev-err-probe-v1-1-acca6ffd122e@bootlin.com>
 <aLlgRorNlvF1k2h9@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aLlgRorNlvF1k2h9@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Sep 04, 2025 at 12:47:51PM +0300, Andy Shevchenko wrote:
> On Thu, Sep 04, 2025 at 10:59:24AM +0200, Benoît Monin wrote:
> > Add calls to dev_err_probe on error paths that can return -EPROBE_DEFER

Also add () to the function names or macros with parameters, i.e.
dev_err_probe()

> > when probing platform device. Namely when requesting the reset controller,
> > when probing for lock support and when requesting the clocks.
> > 
> > In i2c_dw_probe_master and i2c_dw_probe_slave, called by the platform

i2c_dw_probe_master() and i2c_dw_probe_slave()

> > probe from i2c_dw_probe, replace the call to dev_err by dev_err_probe

i2c_dw_probe()
dev_err() by dev_err_probe()

> > when failing to acquire the IRQ.
> > 
> > PCI device probing already use dev_err_probe.

dev_err_probe()

> What I see here is two patches:
> 1) conversion existing dev_err() to dev_err_probe();
> 2) adding messages to some of the plain return $ERR.
> 
> Can you split with respective justification for each of them?

-- 
With Best Regards,
Andy Shevchenko




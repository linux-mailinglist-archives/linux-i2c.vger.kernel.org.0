Return-Path: <linux-i2c+bounces-13633-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 216ADBEDB0A
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Oct 2025 21:49:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB98A19A6795
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Oct 2025 19:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E210E26D4F8;
	Sat, 18 Oct 2025 19:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OdedKo8S"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B622417E6;
	Sat, 18 Oct 2025 19:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760816978; cv=none; b=Qk+JEblsyN7ISO80MS+UqbdXgOW7YS4vEzMBIGr2YVOUt9uyoorgiRkJAeCG8U3FjdbgaXoGqANb4FDN8E/h6yLI/F/r+hNomNk6NsYRv+IoHHUb913B4LLO8WlIBUtOXexzOlnL5GKBmq6epvDbFsfONhdERuwMsNyFDQWjZzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760816978; c=relaxed/simple;
	bh=mF146nvxhIPhZlhIovDy9Wf7Gzq7ShDPT997Xmh7MGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wf90Y4AdygZuF8M4b2vDdJwCdGc50lDfmSFqUi+s/GuIu0cIxRUY1fefDXTdIVgkzHdFydFmF4Y36Si9cEYKGv+k0A8ccZeqZpIje8OFchEvhLaJFgpo/cd49VqttA1CrVkkZlEpwjt75zT65jBB2V7o9pzqXcQqIX6jArU8Au8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OdedKo8S; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760816978; x=1792352978;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=mF146nvxhIPhZlhIovDy9Wf7Gzq7ShDPT997Xmh7MGY=;
  b=OdedKo8SmXSKFEqPqw6xCTRpzo4bPwqN8klcbB8XmAk40o6kYfKDkCPq
   SzQiWCnIUzACQ5e8QII52CVRLKRYQ6LyDms/ssbXLHVmPbWHRtzqvCjQV
   QYBpPlkGmWywKpjrxF0ats7+7AkmEIPPENIvpJf8F2OJx/E1HZ58KnD1Z
   WMNJU4eTzb/nbvevts7zpO/zVnhS0n+kmT72sTfd88x9KEpYQspRxfMuP
   vDJKWzEUCJk0u/4OMDQhXAnECY8f6aiIeUdr36kRl3g/4iiKSvT2WIJo2
   dFydvbuvgJY6rLFLeqfhO2BKmD7SIHV28gJ0Puub29eCRtJ4ObkKNTGgp
   A==;
X-CSE-ConnectionGUID: hUCED5QJQD2oa0SepbQIUA==
X-CSE-MsgGUID: tOVamD6FTG2hu6pY68bchQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74114801"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="74114801"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 12:49:37 -0700
X-CSE-ConnectionGUID: e70Wc68JSnC6KsFO4anpnQ==
X-CSE-MsgGUID: 3mTcsYCaTQqUgbfFTUrMBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="183487714"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.194])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 12:49:32 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vACvh-00000000xoA-0lv2;
	Sat, 18 Oct 2025 22:49:29 +0300
Date: Sat, 18 Oct 2025 22:49:28 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Dmitry Guzman <dmitry.guzman@mobileye.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH 0/3] i2c: designware: Improve support of multi-messages
 transfer
Message-ID: <aPPvSCNnkzfH-2X7@ashevche-desk.local>
References: <20251017-i2c-dw-v1-0-7b85b71c7a87@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251017-i2c-dw-v1-0-7b85b71c7a87@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

+Cc: Hans. Hans, isn't it what you wanted to have for your use-case?

On Fri, Oct 17, 2025 at 04:59:31PM +0200, Benoît Monin wrote:
> Extend what can be done when transferring multiple messages in a single
> call to .xfer().
> 
> Allow changing the target address by waiting for a STOP then looping
> in i2c_dw_xfer() instead of erroring out when a change of address is
> detected. The loop then re-run i2c_dw_xfer_init() which changes the
> target address and restart the transfer for the rest of the messages.
> 
> Handle controllers that lack the ability to emit a RESTART when two
> consecutive messages have the same address and direction, by waiting
> for a STOP and restarting the rest of the transfer.
> 
> The i2c controllers found in the EyeQ6Lplus and EyeQ7H SoC from
> Mobileye lack such capability, so compatible strings are added because
> this cannot be detected at runtime.

-- 
With Best Regards,
Andy Shevchenko




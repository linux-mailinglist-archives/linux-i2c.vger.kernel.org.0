Return-Path: <linux-i2c+bounces-14332-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BB8C9105C
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Nov 2025 08:19:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4DC544E3EBA
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Nov 2025 07:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CB552D77E3;
	Fri, 28 Nov 2025 07:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eubeh8xN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770B82D6608;
	Fri, 28 Nov 2025 07:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764314369; cv=none; b=FaFE7+SlIi998ggbHE7TK2hYakskQwrMugkS7bLYYd6rY1Vnx/S9dtvmfLVzJXKDN7mi40xaXSrZyJyjif9hG1gfpJY4siJOVMLz5tRBQRJWqB0UBwboEjTsepo6h/Uc/6NqObLnrh4Tilo24Ekzuyk7z8vl+liibynRlYvLqjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764314369; c=relaxed/simple;
	bh=46/udGBccKTCWu2bDFQe4uYCsNXACon1T2esAT+O8rQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RFdfsGADZORNS0RdpdAyus2090rdKdD3irQ576NFvNCGGrGFOXHt2NFv2z8uJHZHNwG0GfU6CaW0C6cnpCqErJ3f3Q03emp6USOa6FtKnw2So165OU8AZ1rMsc8w7Zc8l+AVrdefkMgrNywMtWi7NwyOc+1rOPsAVOaOpZImJTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eubeh8xN; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764314366; x=1795850366;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=46/udGBccKTCWu2bDFQe4uYCsNXACon1T2esAT+O8rQ=;
  b=Eubeh8xNgQi0K4C0mygpSarbQ9kffR63J8RzTDZAIpky7U7K0C7TmZA1
   ckgsDj+RJ+SfDSwp0sfc/Q7O6k6W+UWkTHFUBw94xyt1pdOMD37OGSOoR
   LU0xjCPtVoZdYJAn4NYS6PDKy1tr8fk9htLhl8dg8IXvv4+doAd3t1aV+
   tVxCNka+GbKd2rSC03aacPdTPrRUG5WhekvW7/cN9Ek/HbKB1wNJgE/xP
   U3HODJA+pPqK4o9cKVm/cDKbOMUVksXyuvS07jDA6330GBo9R2bCWrVJK
   zlm+3eI8MDQZYcDmUpCKen3YLj4a8pCtuqvTwXBeghXYugdq3HS8X5yxC
   g==;
X-CSE-ConnectionGUID: CeyBtmoES9655RP8NQhMww==
X-CSE-MsgGUID: 2+tXysmVSAmMTmMGTZygmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="77707380"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="77707380"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 23:19:24 -0800
X-CSE-ConnectionGUID: bYzWvcD+SHK3vhpLBErs8Q==
X-CSE-MsgGUID: je9/Vqt8TOyDit1rPPBh7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="198353882"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 27 Nov 2025 23:19:14 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 8B3F3A0; Fri, 28 Nov 2025 08:19:08 +0100 (CET)
Date: Fri, 28 Nov 2025 08:19:08 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: =?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Dmitry Guzman <dmitry.guzman@mobileye.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v4 0/7] i2c: designware: Improve support of
 multi-messages transfer
Message-ID: <20251128071908.GA2580184@black.igk.intel.com>
References: <20251126-i2c-dw-v4-0-b0654598e7c5@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251126-i2c-dw-v4-0-b0654598e7c5@bootlin.com>

Hi,

On Wed, Nov 26, 2025 at 11:46:23AM +0100, Benoît Monin wrote:
> Add support for the I2C_M_STOP flag to the .xfer() function of the
> designware driver. This allows grouping multiple accesses in a single
> call and changing the target address after a STOP flag. This is achieved
> by splitting i2c_dw_xfer() in two functions. The core logic handling
> the transaction is now in __i2c_dw_xfer_one_part(), while i2c_dw_xfer()
> loops over the messages to search for the I2C_M_STOP flag and calls
> __i2c_dw_xfer_one_part().
> 
> Handle controllers that lack the ability to emit a RESTART when two
> consecutive messages have the same address and direction by aborting
> transfers that contain such a sequence of messages. For those controllers,
> we also check that we do not get any unwanted STOP caused by a Tx FIFO
> underrun, as they lack the ability to hold the clock during a transaction.
> And we set the irq as non-threaded to prevent underrun on PREEMPT-RT
> kernel when filling the FIFO.
> 
> The I2C controllers found in the EyeQ6Lplus and EyeQ7H SoCs from Mobileye
> lack such capability, so a compatible string is added because this cannot
> be detected at runtime.
> 
> This patch series also brings four cleanups:
> * Optimize the read of the message flags in i2c_dw_read().
> * Sort the compatible strings alphabetically in dw_i2c_of_match[].
> * Simplify runtime PM handling in i2c_dw_xfer() with guard.
> * Add a dedicated i2c_algorithm for AMD NAVI controller.
> 
> Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>

All look good to me now, thanks! I also checked that this did not break
anything -> my laptop I2C connected touchscreen & touchpad still works.

For the series,

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>


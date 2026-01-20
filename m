Return-Path: <linux-i2c+bounces-15294-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CD42ED3C4E5
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 11:18:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ED3D5723BB8
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 10:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF9863D7D7F;
	Tue, 20 Jan 2026 10:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mqrHbvay"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FB63D412E;
	Tue, 20 Jan 2026 10:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768903297; cv=none; b=fAF2Jeuf0/6pSccIq8hM182kl3tZj8Ch3+w5cCmRpqEn0j572pAJklI/f2MZVQVmP2u02+/7hgbYQE1sBYj1PfQ1Arw86C7heyv03/9YAHLBk/E9LLYohM2zJgRypwwpAUx/DIr6mfv3lgVCPT+lixrL2zmRLnh17Am/mU8KsVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768903297; c=relaxed/simple;
	bh=+X0h56XU5/azG0M2KzUqf8MzqY88HsxxWWxtsaGmng4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jq0hPYoSxZ14PLCWghS1eznxC1OnNhfsRBGZ7SuE8D9bMbOO2+XpY7CusOGf99IbQLQ4h5Y2K8GIjYm0aYwZHOvdi4GvpIdk51cs6oY16v9ahIcV6qQYr1Dg06xXYpAhbSPAWKkXLds+Hsl2rry5F8lkFapPhob+pWAyP6FeGqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mqrHbvay; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768903295; x=1800439295;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=+X0h56XU5/azG0M2KzUqf8MzqY88HsxxWWxtsaGmng4=;
  b=mqrHbvay6NHwJ+oWZtv1vqcicIEc8US4zTu+mIvSEkxerZVsbB8Hihzw
   G+/CJTghq+mohjTKI6duBq24OH+Jh5WzgnGF7m/0GhcAV/XMYAfqVgOlm
   yjrHybegI3BcY68MlLnvsPV/zhXKtOVBhvADjndHnaydWd14igO5X5f7G
   Pb+Abvm9nMJUOvF24XCwadeKSFyPzvxS7au74OK4O6MDq07wwQljAVnvy
   /31CR20DvnRO/fzp+pE+7oH5BLjBNd/DHr3EH3O8oTYmGN0jRXovWa821
   kh2rJw+U9cxyH8vRyWCvj6RVsEE5fr0SRToBZOMM7LPFkIG9SKzjqVcuf
   w==;
X-CSE-ConnectionGUID: vND9XrpBSz67fPaVnZGq8Q==
X-CSE-MsgGUID: 9dh574mqRZeV6u9Rjd90pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="95581541"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="95581541"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 02:01:34 -0800
X-CSE-ConnectionGUID: 5KGSluaQTvOJ45fav1N4vA==
X-CSE-MsgGUID: eGeswcwiSt6zAGFBlzgMHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="205330026"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 20 Jan 2026 02:01:30 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id B86DC99; Tue, 20 Jan 2026 11:01:29 +0100 (CET)
Date: Tue, 20 Jan 2026 11:01:29 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: =?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
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
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v5 0/6] i2c: designware: Improve support of
 multi-messages transfer
Message-ID: <20260120100129.GH2275908@black.igk.intel.com>
References: <20260120-i2c-dw-v5-0-0e34d6d9455c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260120-i2c-dw-v5-0-0e34d6d9455c@bootlin.com>

On Tue, Jan 20, 2026 at 10:28:00AM +0100, Benoît Monin wrote:
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
> ---
> Changes in v5:
> - Rebased on v6.19-rc6 and fully retested on EyeQ6Lplus.
> - Drop dt-binding patch: already merged upstream in v6.19-rc2.
> - From Andi Shyti's review:
>   - __i2c_dw_xfer_one_part() now returns 0 on success instead
>     of the number of messages transferred.
>   - Drop inline keyword from i2c_dw_msg_is_valid() declaration.
> - Link to v4: https://lore.kernel.org/r/20251126-i2c-dw-v4-0-b0654598e7c5@bootlin.com

Why you dropped my ack?


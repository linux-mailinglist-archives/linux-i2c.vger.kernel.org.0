Return-Path: <linux-i2c+bounces-11018-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F88ABBC27
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 13:19:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61DCC3B98E8
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 11:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13A0E26982B;
	Mon, 19 May 2025 11:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JrtfPTun"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD2C1E5B7B
	for <linux-i2c@vger.kernel.org>; Mon, 19 May 2025 11:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747653548; cv=none; b=MDwCkzLTKdYynV2zJJxiiTK413Mv0T1lVffAd9DKaPla1Lh0ooUKBUXluAVoEQEWR3QFoL3066kQ9W8si5P0FYGVYKKwiSrjQyXtKe1AqStdi2ua3x9tnGpBNkxQOHrc/nyyBKXwJGGeDPDSKtgVlGOzGwM6j/9z9QMT/iswZpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747653548; c=relaxed/simple;
	bh=kOWXMSfFvP8AU8Pmm5Qesbcxs1DttqSoV+HoRYnp66o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DyWsdg37xrdx14qpvSGGWjTW0sEZdKVKfWO8/afC33MEz5BtzfeGdQFaMo/Ijc6GKSAZIw4wAbXIQlkjaMWTeo2mfRrSwzFlbCDjpcalXa6ZEOdFcmREkW2Y1u2pE7AJkvIarbD8EemrcHp5nPKHSgRU4k/H6DiREOKPmPknaQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JrtfPTun; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747653547; x=1779189547;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kOWXMSfFvP8AU8Pmm5Qesbcxs1DttqSoV+HoRYnp66o=;
  b=JrtfPTunrBFfUBFSbhgOP9EM7VA4tR1hF6sVZDCeHF9WYuAY4dc2nz8/
   vHl6oaflIbY/h60910rA51AjFWYDOLQ1qTTg/vv6PTcMU74vUdRGg9cyT
   LFD2O4qnVhEwQ7WMR+ePBp3P3zH94ZDRv/xiekpNsvA12/bae1FQVXKg6
   WkQgYcOr85CyX4Q3POEvEB+8Xo1jxLD6z4UKlOEugkuhLVi37SVYVXer5
   pareHPXOgqQa1UwDTRQR84jlX+DmPMEFdaKmqVANjg37woaJYtJ/Pn4lf
   2Z1nFyF218w90R+WagoofCs1AQq78kmIhIKI8V3Oibz8kpgZ49Lw7mqhu
   g==;
X-CSE-ConnectionGUID: 77wRKKrfRXCgL+ZNivCWzg==
X-CSE-MsgGUID: 6b4/io0vQ4qvIvS6Sk8oiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="53346136"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="53346136"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 04:19:06 -0700
X-CSE-ConnectionGUID: NNfcGKStTNy9rROuAKZG7Q==
X-CSE-MsgGUID: seqsBHIJTnSKDoCSteDTLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="139381866"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 04:19:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uGyWL-0000000311M-3PbE;
	Mon, 19 May 2025 14:19:01 +0300
Date: Mon, 19 May 2025 14:19:01 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 0/3] i2c: remove 'of_node' from i2c_board_info
Message-ID: <aCsTpUfjNwFl2GyI@smile.fi.intel.com>
References: <20250519111311.2390-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519111311.2390-5-wsa+renesas@sang-engineering.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, May 19, 2025 at 01:13:11PM +0200, Wolfram Sang wrote:
> I promised Andy to support him in his cleanup efforts, and here is the
> outcome for tidying up i2c_board_info. It seems it was easier than
> anticipated. But my scanning scripts (awk, coccinelle) didn't find any
> more occurences and the build bots are happy, too. It really seems this
> is all that is left to do. No complaint, though.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko




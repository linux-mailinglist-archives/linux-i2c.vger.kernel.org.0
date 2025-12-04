Return-Path: <linux-i2c+bounces-14398-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 989B0CA3846
	for <lists+linux-i2c@lfdr.de>; Thu, 04 Dec 2025 13:00:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 22FE83037407
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Dec 2025 12:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B72A933D6E8;
	Thu,  4 Dec 2025 12:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gfKxaELp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4932F12AE;
	Thu,  4 Dec 2025 12:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764849641; cv=none; b=LjPTWE/sFvz5x5gllWQVk2REslgwY0sya3EXHQpIiNiBvomIGK4STgJomKn44zKWPCzy3DtxHhWLxDq5tbY/pczNP4+WlMXM8vJKLLwv0EcMm+EM1TSGRIg1e4RW5gA23Rl39QPxo0DHly70w64TJsbop2oZXAJ/7rnqQ0DefoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764849641; c=relaxed/simple;
	bh=t4520j2h3f8RljhYUC1p8VIFGbsUOYUXpXQb9utK58Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UO4ik2/E2tXHOhqNFqG0oMEBBcBTH417NC2tQpYDR5Chhnr/0T8TcmBHnsf8fCk+9skXhcBziv2yDJHZNg0SnsxuSGtUAO3TseGlz/azyMMKCYCXvjQKYfNY/FDZ6IL2l0VMa5zFmLRQXCBJhCZ0NwjUGYUc2qTUtJHfCTwwVys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gfKxaELp; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764849640; x=1796385640;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t4520j2h3f8RljhYUC1p8VIFGbsUOYUXpXQb9utK58Q=;
  b=gfKxaELpv/xb2AiyFSdFYrbIGns71+znRSC+vbV2lbWC4KF3xYkp/Ttf
   gnuNHx7uBf/S6efCD/nMgAziaIL65HQhjBy7IKTb68LqehsNZXNUp47fa
   qUbIWG4gKAB58EcHNi8ymfRCTXUS+ukdt+5e7qfjSXqEoiZbEvHHDiTYp
   QGRcsZmbuHrv9HzWDPQl2uEydvtZLeq+2lC6hPX6ZQg+KTxoJ5Kssjm3U
   Tg4F8LLBwQqYTOsiHMCoYfsazT4F5HvirpfWzEJSmSeqZc/mjN6uG2AJX
   3HIK6NAz2nhoT+2L87HARyqJbejIWBN67RJlTHPEcjAOQozNPqI7AnF6Z
   Q==;
X-CSE-ConnectionGUID: osJdhXJ8RdW1nzcGmBicQQ==
X-CSE-MsgGUID: Jr8H9WedQXaFF+3Bkt8bnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="69461419"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="69461419"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 04:00:39 -0800
X-CSE-ConnectionGUID: /Pom/kBqTjmV2TzpPfdZjg==
X-CSE-MsgGUID: +PWlpbCQTF+Pav8/Bz/epA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="195378732"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 04 Dec 2025 04:00:37 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 3FCBBA9; Thu, 04 Dec 2025 13:00:36 +0100 (CET)
Date: Thu, 4 Dec 2025 13:00:36 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Artem Shimko <a.shimko.dev@gmail.com>
Cc: andi.shyti@kernel.org, andriy.shevchenko@linux.intel.com,
	jsd@semihalf.com, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: designware: Replace magic numbers with named
 constants
Message-ID: <20251204120036.GC1613537@black.igk.intel.com>
References: <20251106110935.2563071-1-a.shimko.dev@gmail.com>
 <20251204114129.607200-1-a.shimko.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251204114129.607200-1-a.shimko.dev@gmail.com>

On Thu, Dec 04, 2025 at 02:41:29PM +0300, Artem Shimko wrote:
> Replace various magic numbers with properly named constants to improve
> code readability and maintainability. This includes constants for
> register access, timing adjustments, timeouts, FIFO parameters,
> and default values.
> 
> The change makes the code more self-documenting without altering any
> functionality.
> 
> Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
> ---
> 
> Hello maintainers and reviewers,
> 
> Fix replaces magic numbers throughout the DesignWare I2C driver with named 
> constants to improve code readability and maintainability.
> 
> The change introduces constants for register access, timing adjustments, 
> timeouts, FIFO parameters, and default values, all properly documented 
> with comments.
> 
> No functional changes.

There is already v3 at least of this patch. What changed?

Also can you please send new versions on a new thread instead of replying
on the existing one? It is really hard to follow.


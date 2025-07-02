Return-Path: <linux-i2c+bounces-11768-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 041EBAF5CD7
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 17:25:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A5B41668CA
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 15:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C4DC2E03FE;
	Wed,  2 Jul 2025 15:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jZ9gUgQy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907712E03E5;
	Wed,  2 Jul 2025 15:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751469876; cv=none; b=XMunB8fgClNW2a9oSQUkjxt4SVxB9dER7t1eeRVRjJ0Uq1LxYDS5mieTFM7w7iXo7ADs1M4O1SS3aVkvF2u15IzssiXzmrRscgb/OCrAcdiDYeB4mmiPRPEqK9NlqEKkcS0IytDJ4s8Znn5zBwq+uZ7f+5fdDOPzpthKt8hqyCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751469876; c=relaxed/simple;
	bh=n2uds1SGDuST3HJtFNerzTi5t0rAhdLCpAKX+VAYgIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oDx3bDXVPDpHGjhCtkz2ezGghJ8sqF3uY3sUpxcXo3nHZ+zuZWYfWhwnIQfNOR0cnVH/Q44KS6VXK7Ws21a+ywVxsB2rhX1fyykWD1M8oB6omIppOzA6l8ozVMpGhqXJNfoPxNNVi1Ia0pfd9p2qMtJVDHsjv+qsXG1ImCzRNKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jZ9gUgQy; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751469874; x=1783005874;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n2uds1SGDuST3HJtFNerzTi5t0rAhdLCpAKX+VAYgIQ=;
  b=jZ9gUgQydStQy6MM27pW3yw9cUyf6XJ7xhmfdIOvwq54TyVQqvxS3dDG
   sO5tX1DD0xDbU/gIH66W4zOJvDiPLU3qm3aFIED7FEWOIZxYadDwK9ChF
   mXsUEO3BhtYt1LOzflQ45tEbRnDTFrTLSZqlSu4kNav3wtDTzWTSguhTC
   Q0o0ftiAF7M76jVY6WYKepuQkfTJsbc1AQN1xn4JXnJqeJ1QGOoIx7/WD
   elhsuPPrrYl82or4tqlC7WFqiOB94VGRFlHu20L7WO0K0vN9Uuun0GJkw
   a5sV3mbqX15ffazHErr2aOkCGoLYkuiVqYJZKUGiovn6OJoi5RlQ4HOB7
   w==;
X-CSE-ConnectionGUID: QPN5L4UUReaHKbx6UpDJJg==
X-CSE-MsgGUID: z0N9AkF7TFW8kcFNs+v65A==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="57583760"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="57583760"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 08:24:33 -0700
X-CSE-ConnectionGUID: 0znNlbShRteCN4lWUwrA6Q==
X-CSE-MsgGUID: 2dXvRZeTTeWlCnNtgKD8qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="154184982"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 08:24:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uWzJy-0000000BxDT-2Pk7;
	Wed, 02 Jul 2025 18:24:26 +0300
Date: Wed, 2 Jul 2025 18:24:26 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, digetx@gmail.com, jonathanh@nvidia.com,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, p.zabel@pengutronix.de,
	thierry.reding@gmail.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzk+dt@kernel.org,
	ldewangan@nvidia.com, robh@kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v5 3/3] i2c: tegra: Remove dma_sync_*() calls
Message-ID: <aGVPKi1PZfnvv1s7@smile.fi.intel.com>
References: <20250702133450.64257-1-akhilrajeev@nvidia.com>
 <20250702133450.64257-3-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702133450.64257-3-akhilrajeev@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jul 02, 2025 at 07:04:49PM +0530, Akhil R wrote:
> Calling dma_sync_*() on a buffer from dma_alloc_coherent() is pointless.
> The driver should not be doing its own bounce-buffering if the buffer is
> allocated through dma_alloc_coherent()

Missing period at the end of the sentence.

Code wise LGTM,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko




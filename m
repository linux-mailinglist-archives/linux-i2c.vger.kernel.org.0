Return-Path: <linux-i2c+bounces-11557-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D381AE5D8C
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jun 2025 09:19:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD0077AC80A
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jun 2025 07:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 175FB248F64;
	Tue, 24 Jun 2025 07:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T5L+VVsL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0D822A4EF;
	Tue, 24 Jun 2025 07:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750749565; cv=none; b=je2XKsN/4eCt7xitI+2012+M8xQxpdOQU6liqm75qohY/eihRnzx7Do1MoAJ9ZULvnz3gFswLLtJO7+nLqXVw57M0B08iKFtcHy2o/o2Pu/+3nC59cN0NwnjK/Y/SWRBY+iAOdPD+4YGbG01g9vjGt4V1oThCRR0AV7VGxVnd/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750749565; c=relaxed/simple;
	bh=K1pza8wcd6ilcyWPSR5wnoIiTOuK5uooehzR9sLMBr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cBoJkarccCtyt+aUWm8qII84LVV8OdjZvoumErXJBRfh/xJ6c0PWaQAaxdOeqQIujD92hLbB9pl2bqf/CNvbm8NHGLow4qxtW8BwDJ5mP+SllgSH55T2xRfdkZq9O2OSbDm0vUF2AaU0wNVih/WepjajEK6yCVk4tlY0a/qxL6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T5L+VVsL; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750749563; x=1782285563;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K1pza8wcd6ilcyWPSR5wnoIiTOuK5uooehzR9sLMBr8=;
  b=T5L+VVsLsv98Q46ZJH+URhuenpmwvw3GgOw0YtgME2HZn/vETebADmJ/
   IK6Z0Mz0wKSUQGW64IS93Z/EQ9xBV8A6aZ7bj6bQEWmybvJVdHaSEAM6U
   i+GkFEGZdj/8HOiwFsj/oZ7Re/cImjWOi+0gP1IRcrH1UFkzcopQOllIv
   Vt+jJuAd6aH6zDZfHrwLb8M9KwaWCpg+e5IpFD/aVaYigj+XFCjC1ga1y
   030rGYTx7j5X9hTiRVcqYbF+YjVW45Zg9pgt2UEiFzcEuRThIx03Pb2mT
   09g7d/JmHdmu+yp8GvXogsdSTMFP8Ijur2XMtEmDNSWNQ+/MhanFqOuhC
   Q==;
X-CSE-ConnectionGUID: lKEjFY9DSHi9gjf8SO+nIQ==
X-CSE-MsgGUID: ebuSk7AzSo26V5+qtTKiig==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52096025"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="52096025"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 00:19:07 -0700
X-CSE-ConnectionGUID: aqaRBGo7ShezLMYbyeUxIg==
X-CSE-MsgGUID: l8F543O/R6+8PmweofFkGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="155849135"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 00:19:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uTxvq-00000009P3Y-1txg;
	Tue, 24 Jun 2025 10:19:02 +0300
Date: Tue, 24 Jun 2025 10:19:02 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Randolph Ha <rha051117@gmail.com>, linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mika Westerberg <westeri@kernel.org>
Subject: Re: [PATCH v1 1/1] i2c: acpi: Replace custom code with
 device_match_acpi_handle()
Message-ID: <aFpRZoIkQod6g2Dm@smile.fi.intel.com>
References: <20250623134521.158447-1-andriy.shevchenko@linux.intel.com>
 <20250624054508.GA2824380@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624054508.GA2824380@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jun 24, 2025 at 08:45:08AM +0300, Mika Westerberg wrote:
> On Mon, Jun 23, 2025 at 04:45:21PM +0300, Andy Shevchenko wrote:
> > Since driver core provides a generic device_match_acpi_handle()
> > we may replace the custom code with it.
> 
> Well okay but now you replace a simple comparison with a function call. I'm
> fine with the patch but I also don't think this is an improvement ;-)

The improvement is in using standard API for such cases.
You may argue on many things that may be open coded in
the kernel while we have helpers (in some cases exported)
functions that are one-liners or so. Note, the helper also
performs an additional check and having an open coded copy
may miss such a change. To me it's an improvement.

-- 
With Best Regards,
Andy Shevchenko




Return-Path: <linux-i2c+bounces-6695-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC53977D4F
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 12:27:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33D551C24796
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 10:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 790131D7E2D;
	Fri, 13 Sep 2024 10:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jkX/KnuP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37E01D6C7F;
	Fri, 13 Sep 2024 10:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726223240; cv=none; b=p+rtEm/7RZL+G15A8+eqJBWDaqrqgNPyXq5D07JgMJufAx/L2Eo+GAnc0hJb5Sq+UUmtPLBZxwVsZZe8O8wIl8CCvjJMgMF2yteLUFDfaxBly6DT6XCDXBXSx9nJ2UUTR4dLS4xn+ySewMjuCCr6xkhEj9bcgPnY5B6uXBFGzbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726223240; c=relaxed/simple;
	bh=TrwaSnGSZr2bfjo3SWe2U7AL25TlCBVEkrZRf6lgy8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EMwM9RFuUOYqXhH7i7IFrg0R0Y5dptALNVujJnBZodCpkKI32T/pO/Q4szh9oyz+Jt5MnI8TEV9Rbb0Lr20bc3PZXNB2kLPBu1b9v3RSxcBfZfKMirtqaWXaZD1bwhIJ0E12e5zUzItoSR8FsB3cMsRDdBo3/S21KrNE3rp15oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jkX/KnuP; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726223239; x=1757759239;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TrwaSnGSZr2bfjo3SWe2U7AL25TlCBVEkrZRf6lgy8A=;
  b=jkX/KnuPS3XVL6cosXBU1o7hhosIcsJS8t+AP3EOVn+CCEnXFjUE0aRL
   WPrdGXiyApCfGTRMCrrdtRYTHgh7z/Jpl3r26PLQ6BfofyI8HTiVotT5F
   1WQQae8ZDz82c8SWkltolwtm5wYc0ZP5vpR0lQnJ5eOeMB/DQlL2nVQlm
   7YA5azEvrjA6ibwT8/MsrVxRheG4ZE5kEJ0DoCzo3oSE+KOefuJvI4ky7
   xw5xkUyNoYYSggYW9ac+geW3npehQPf6HmK3+7hNuvZ1O/2pRX/T6I55Z
   xEg4KAVJH/vsYvaOE2rwXjrro4+9gEI3EWGdTgUhPpx4RLrbYU4k6jwqw
   A==;
X-CSE-ConnectionGUID: 9kRDiTeeSQGNYwvQlzQlcw==
X-CSE-MsgGUID: K/GBQ5wWT5ahAyV9F7Do3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="28863699"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="28863699"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 03:27:18 -0700
X-CSE-ConnectionGUID: oXOdqqt7RNywTmc/BAEEVQ==
X-CSE-MsgGUID: wq3nQX7HT92g5GEvSvGEoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="72813103"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 03:27:14 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sp3WB-00000008GC9-1PTf;
	Fri, 13 Sep 2024 13:27:11 +0300
Date: Fri, 13 Sep 2024 13:27:11 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v7 03/10] regulator: Split up _regulator_get()
Message-ID: <ZuQTf0MiktCGAELP@smile.fi.intel.com>
References: <20240911072751.365361-1-wenst@chromium.org>
 <20240911072751.365361-4-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911072751.365361-4-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Sep 11, 2024 at 03:27:41PM +0800, Chen-Yu Tsai wrote:
> _regulator_get() contains a lot of common code doing checks prior to the
> regulator lookup and housekeeping work after the lookup. Almost all the
> code could be shared with a OF-specific variant of _regulator_get().
> 
> Split out the common parts so that they can be reused. The OF-specific
> version of _regulator_get() will be added in a subsequent patch.
> No functional changes were made.

I think this patch makes sense on its own, but it of course up to Mark.
FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko




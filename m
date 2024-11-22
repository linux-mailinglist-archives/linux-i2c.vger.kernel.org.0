Return-Path: <linux-i2c+bounces-8154-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4F39D6025
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 15:07:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 733F61F21CE0
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 14:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97F42381AA;
	Fri, 22 Nov 2024 14:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lnHUPaLY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E540B79C0;
	Fri, 22 Nov 2024 14:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732284460; cv=none; b=Z6OoR3EDIrA3HhjtZUDWfASP4E7Q8u6wnOfuEoFMxQz/SoL150TELaolgp7vKKK17jLwjrC0cZFJY2x5rmkyLLJF0datDSvBwJpwWjC96YC2gnsbHB879AiZQev76496QMyVCf0kS4rqxCdepImJCWCP6dABY9WSPV7y6wdTI4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732284460; c=relaxed/simple;
	bh=6LxAtSZRApbfNLLb3X+tepUeBQCxISWpMEY+0sqzII4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nnsDfWZSlbqXBQCvRdxEZVNtd0pnas78tXu7k4ylI3botyXWT5rg6dFxUREP40wA3NoeUiCywD/Z7sdQN5kDjHlwBOX3AxyD9JSvKUTkLzSACOSbPRzLz5KKzzRfpIL7TaMo6lw2eBq8XCSt5xdggsGrKFuCdSlBORGLN2U5n0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lnHUPaLY; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732284459; x=1763820459;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6LxAtSZRApbfNLLb3X+tepUeBQCxISWpMEY+0sqzII4=;
  b=lnHUPaLYayMvsBtRTWaqBn8AzK2oyy9d0q+H9AD6zpTGZyQHryzbH+ge
   4lGko0VBEgMoH/to71nULxxUHSAYntvg9fzDB/RVraBwwGfGY0gzcqxO4
   SZxV03qAbJOqbALCttp3MEicmeu2hT+cuQ7Hyk6eSe/h74aIfnUWS9Ecz
   trjV2iLgkXRkkSJZSMXyhYF9JVOtQ5Twum8wQBQ34v/2LzpT654/qEFvJ
   AjhsuEbNhJNEqT/6qqjvWqOK3wdpCCkkDABXP32Gp8Jk0AdqFF1NHpxcI
   0Vwljcuk4+ymBqEc0R8+xWySVNjNo51NyceH9uoMRcOzQvN5jLV0F68ko
   Q==;
X-CSE-ConnectionGUID: y9VsbfElSHG3bOsq+a1lSA==
X-CSE-MsgGUID: +yc6K4UeQE2EA7xujPNzzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="20029913"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="20029913"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 06:07:38 -0800
X-CSE-ConnectionGUID: b3EMS874Q5io+xtMTRFWyg==
X-CSE-MsgGUID: pUXn745UQnWtTc8a2YNH5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="90395444"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 06:07:35 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tEUJo-0000000HR0C-42ua;
	Fri, 22 Nov 2024 16:07:32 +0200
Date: Fri, 22 Nov 2024 16:07:32 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] i2c: atr: Fix client detach
Message-ID: <Z0CQJOpRPGqM2uE_@smile.fi.intel.com>
References: <20241122-i2c-atr-fixes-v2-0-0acd325b6916@ideasonboard.com>
 <20241122-i2c-atr-fixes-v2-1-0acd325b6916@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122-i2c-atr-fixes-v2-1-0acd325b6916@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Nov 22, 2024 at 02:26:18PM +0200, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

We (used to?) have a check in Linux Next against missing SoB of the committer,
wouldn't this trap into it?

-- 
With Best Regards,
Andy Shevchenko




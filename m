Return-Path: <linux-i2c+bounces-8140-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4955C9D5BDD
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 10:24:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01BAC1F23647
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 09:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73396188588;
	Fri, 22 Nov 2024 09:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nuQTa+Tr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD901176AB6;
	Fri, 22 Nov 2024 09:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732267457; cv=none; b=dPja+C6dnkfTdXGIFH/n+O641U8/WsakEM+L67X1aQ/Pnt0Il70Ei4FTh1f2bKS6t5dwLsFMm/zvQNTxBvESjxk1KxC4dHhH0mj3WBANsANL7yfH0Emikx4yjt0w9CwbVW9bx3mm+mblzJjtZO0l8W+anytJ8zCNgbyAzQbio2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732267457; c=relaxed/simple;
	bh=GrhN2N+VS0zLdTr+L42oFMs3hix9wDSeBorbKU0YHyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TeTKoUQcay/qkI4QCmYJ/9p81fVWD5DvisoJ5b7gTm1vArF1WElCtNrh/s2bqjjDz1nyAnyoPbrNH4S90AHlUyyf3eRbJrn+/qaYrM3wA9V8cKrKBlxOWp6PiwDwWb+7MVa4gUpOgdIzXHUKLvhYW8UOhQTYqCqvnnyson+uVSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nuQTa+Tr; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732267455; x=1763803455;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GrhN2N+VS0zLdTr+L42oFMs3hix9wDSeBorbKU0YHyo=;
  b=nuQTa+TrJ7LfW2XFIkd3bywFMmUzr39qLHw4aRR2BA9RUzc/PYrG/Zwr
   Z8V645wTeFX4xPpXB5WEAjK7w/ShMmjpnWfPHht8Mlo4oWDlBCcB8Rox/
   ZWLmBxjpzNb3xc5Si3OmhEBabDP2Ks0Hm6BJXVZpqAtogbGix/cyfU7KD
   3rpRlmN045AAX3XxNCogpPVraan2upf5vENxN/geHfIGV5FD/iqtZKPP/
   VbnkVDdQFlZXGobUPzv0NOYLoWAL2mgV0zqz37OT14dSnuHJiU80aHQal
   9om9on4TSBB4Eh/nbwbZ0evO09OuAh7xGOncbvxz7Ef+GpP91uTADgj3q
   Q==;
X-CSE-ConnectionGUID: j1GDBAoKSdeWMNYWcK2qLw==
X-CSE-MsgGUID: A2ynviqjT1arqcJIW/5/Sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32659232"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="32659232"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 01:24:15 -0800
X-CSE-ConnectionGUID: Jg+5ArcCQ/Ok6Ig2eIXLMw==
X-CSE-MsgGUID: ZcNjBvGnSma6Ce2nhKCTFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="90891419"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 01:24:13 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tEPta-0000000HMbv-1ftL;
	Fri, 22 Nov 2024 11:24:10 +0200
Date: Fri, 22 Nov 2024 11:24:10 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH 2/3] i2c: atr: Fix lockdep for nested ATRs
Message-ID: <Z0BNug5KZp74t4MA@smile.fi.intel.com>
References: <20241122-i2c-atr-fixes-v1-0-62c51ce790be@ideasonboard.com>
 <20241122-i2c-atr-fixes-v1-2-62c51ce790be@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122-i2c-atr-fixes-v1-2-62c51ce790be@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Nov 22, 2024 at 09:51:39AM +0200, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> When we have an ATR, and another ATR as a subdevice of the first ATR,
> we get lockdep warnings for the i2c_atr.lock and
> i2c_atr_chan.orig_addrs_lock. This is because lockdep uses a static key
> for the locks, and doesn't see the locks of the separate ATR instances
> as separate.

...

> +	lockdep_register_key(&atr->lock_key);
>  	mutex_init(&atr->lock);
> +	lockdep_set_class(&atr->lock, &atr->lock_key);

mutext_init_with_key()

...

> +	lockdep_register_key(&chan->orig_addrs_lock_key);
>  	mutex_init(&chan->orig_addrs_lock);
> +	lockdep_set_class(&chan->orig_addrs_lock, &chan->orig_addrs_lock_key);

Ditto.

-- 
With Best Regards,
Andy Shevchenko




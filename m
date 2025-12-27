Return-Path: <linux-i2c+bounces-14792-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D62C3CDFDC6
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Dec 2025 15:33:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9597830115F5
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Dec 2025 14:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 816BA23A98E;
	Sat, 27 Dec 2025 14:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MCGvBdKU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CB552F88;
	Sat, 27 Dec 2025 14:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766846032; cv=none; b=lEXLd31hX7c46wYxkrHLz0HMhH/5ziDaJCcOsTW2viybNrLK9JUYZU52LoJj2DpkemFJSI2vTCbMAslDBnezMJAso0So4s4jcXdnVE5YESQfhLYHyP6WJX5WtrEz4erjoelKMx0FIR+66bHwkLngJUnSezr+BHdiGENVZkUFj00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766846032; c=relaxed/simple;
	bh=+bvJo7ncpkVK4XxVWbhVzMP6KucoZCvkfRNahIYloO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tOg4HZ1gjcL1bMJPpbb5mq7JF5CAV5ZPzZO+ZUUz0ORJx/HK1GaST0kHrJNwOk/StuY6KoxxT/4HgZ4DCa+ldHPoyHCt3oa51hFqQlXswe3g66a1AdCBvVO/QIHEuVEAStsWwp7R5q/fJYsp+bw5lqTkxx5Fj8ACSNZV5KF5UMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MCGvBdKU; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766846031; x=1798382031;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+bvJo7ncpkVK4XxVWbhVzMP6KucoZCvkfRNahIYloO4=;
  b=MCGvBdKUr2n/g5P60kNWytyBsIzDPaC+i8x/nKtREsr/pbbP3Z84VUw3
   1MSCGoKK5NMZXUCg62e/aKV5BCZp2qo99N+0stQEBn3i1h7C++1Zj2x92
   5N1tpXOz97KQ84BMyQA2JB6VofJDyyGHjgsjv9Mt9KJt2QslTj6ELb4lp
   quz+/EO4UpjIZS/G8OY/CEmAIx5atMQGAzEe5ppK9U3FeotbE9pQqddci
   bCFR9bCXp9IKZqpIArVTaORMEuipTHJ8z9YWHnzVBKtRFYC/5tZGbWDar
   dWsww4sg6003J/rtJbJ3Ti2Jc3vztIAW7i97MaynmZgNn6RsSI7l8oL30
   w==;
X-CSE-ConnectionGUID: +RGMFnLzRnehwlYJFE/fZw==
X-CSE-MsgGUID: dTd/QvRNSdWTaIpf2bmlAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="79663492"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="79663492"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 06:33:50 -0800
X-CSE-ConnectionGUID: Yb48tmHbS7WtWwytDwX3sQ==
X-CSE-MsgGUID: bLZli9XOSJGpZXNYbd6zQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="200477718"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.211])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 06:33:47 -0800
Date: Sat, 27 Dec 2025 16:33:44 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/7] i2c: provide and use i2c_adapter_set_node()
Message-ID: <aU_uSLpDh2FCvAFo@smile.fi.intel.com>
References: <20251223-i2c-ada-dev-set-node-v1-0-2e36e0e785b4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223-i2c-ada-dev-set-node-v1-0-2e36e0e785b4@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Dec 23, 2025 at 11:06:47AM +0100, Bartosz Golaszewski wrote:
> It's been another year of discussing the object life-time problems at
> conferences. I2C is one of the offenders and its problems are more
> complex than those of some other subsystems. It seems the revocable[1]
> API may make its way into the kernel this year but even with it in
> place, I2C won't be able to use it as there's currently nothing to
> *revoke*. The struct device is embedded within the i2c_adapter struct
> whose lifetime is tied to the provider device being bound to its driver.
> 
> Fixing this won't be fast and easy but nothing's going to happen if we
> don't start chipping away at it. The ultimate goal in order to be able
> to use an SRCU-based solution (revocable or otherwise) is to convert the
> embedded struct device in struct i2c_adapter into an __rcu pointer that
> can be *revoked*. To that end we need to hide all dereferences of
> adap->dev in drivers.
> 
> I2C drivers use device_set_node() to assign a firmware node directly to
> the struct device embedded in i2c_adapter. In order to hide the direct
> dereferencing: provide a dedicated interface that wraps the call to
> device_set_node() but takes the adapter as argument instead.

> [1] https://lore.kernel.org/all/20251106152330.11733-1-tzungbi@kernel.org/

Can be also made as a Link tag and some people use `b4 shazam`, that uses the
above test as a merge commit message where other tags are also being
recognized.

Have no objection and code looks good,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko




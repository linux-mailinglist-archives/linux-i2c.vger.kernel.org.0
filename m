Return-Path: <linux-i2c+bounces-14873-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3D4CE9641
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Dec 2025 11:29:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4F6CC30049F2
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Dec 2025 10:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 277332E22BD;
	Tue, 30 Dec 2025 10:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IMfUE6AQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E002E22BA;
	Tue, 30 Dec 2025 10:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767090580; cv=none; b=kCm71ivS169WWbSZH2N26VEJHGiMgh9R2MaesAQfcCB8hpJsdb0GUh9Lt0cAkeUhCgONh9IY1XkLMOcP41sqH3ejaUI+6OcAifadXL74SUFJngifXvuAcacFZyy9W0nOimwQ1bgiOZgD/Dk8uXcGnzgzJ2huqxuoX4fIS8fGiT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767090580; c=relaxed/simple;
	bh=/8IML2unYLKEmTRuAlxwth+4P9YnhJojXIORl32SlDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IsKujWJVJrRtnkxaCNMXdEd5OsuclO80O4rJtsEgk8fdgKQJJsx8Ntn/FxEhNOHXRtnTIlO7KH1xPhTj8GRDOH3De3ht56k1a+7t1dRHbUOPgsVI9j8WCEmJR7Vz3x/NMxyPzbkcJOvGD146v4E1MOz7mMolo1aj43NUeFPv5Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IMfUE6AQ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767090580; x=1798626580;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/8IML2unYLKEmTRuAlxwth+4P9YnhJojXIORl32SlDY=;
  b=IMfUE6AQqMDGtp7mGqt0HrHd2XWj6ZG+uRz7iy7NpNFyxUCso12h/E5F
   5ndtnj9XWECJWkUp6Jln8AsUlPOLVWAW6fVP0aqLK82Z47VbgZuz2CBJ9
   33PqKHvlq6qIOGUSESiajXUsqFIjRQZSBqxdCExfPXykIdKLt914rAWT8
   h373CHD0M5Q2wu7GDawWszIpXDMxONnB1OXZ9MjYvbrYzeKE40QVtWaQS
   X2Cg6HQk97dpAsKwl06ryEXcWBCmI0RUDWErCL+4Duw4oR1tbBegix2mg
   fjVuLTT7gnyFyTiaeEUWmchf1yj1OrbS2HppupqPjNpN3NRnQs40CjvgC
   A==;
X-CSE-ConnectionGUID: dBG4Ss1HQ0euIwIeHL3OOA==
X-CSE-MsgGUID: ASNYS/42Tk2dxGyXsDrFqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="68845177"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="68845177"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 02:29:39 -0800
X-CSE-ConnectionGUID: VC4zUvSPT662Hx/Ri30y2A==
X-CSE-MsgGUID: i2xopRvoQQ6th86mWmfcqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="200402869"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 30 Dec 2025 02:29:35 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 3932F8E; Tue, 30 Dec 2025 11:29:34 +0100 (CET)
Date: Tue, 30 Dec 2025 11:29:34 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/7] i2c: designware-common: use i2c_adapter_set_node()
Message-ID: <20251230102934.GF2275908@black.igk.intel.com>
References: <20251223-i2c-ada-dev-set-node-v1-0-2e36e0e785b4@oss.qualcomm.com>
 <20251223-i2c-ada-dev-set-node-v1-2-2e36e0e785b4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251223-i2c-ada-dev-set-node-v1-2-2e36e0e785b4@oss.qualcomm.com>

On Tue, Dec 23, 2025 at 11:06:49AM +0100, Bartosz Golaszewski wrote:
> Use the dedicated wrapper for setting the fwnode of the i2c_adapter.
> This allows us to hide the dereferencing of the embedded struct device.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>


Return-Path: <linux-i2c+bounces-13698-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B8206BF4FF2
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Oct 2025 09:36:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F08D04F2C95
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Oct 2025 07:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31FCF280CFC;
	Tue, 21 Oct 2025 07:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fQGDnCcU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221F6280025;
	Tue, 21 Oct 2025 07:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761032183; cv=none; b=XKP/r485eLWHi0loNtGfXoprEWwDV+guienA01AWn/Mb26R9SRHhascs0qVbTMolhDRzJzR6qc27qrUNuHMQeiQTKt+RJfJiDRox24tlhT6FePONCpU1qgmA4c3lTlyLbsm42MhKofQHy9wRANdTG2KPceOaR37HXSA49higdvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761032183; c=relaxed/simple;
	bh=lvztYyEYyRwSK53rDIAgy0tpVstr29Ir4aQY/x8lfSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bs5gfG8MN0PkN2EtjQE/08fpyO5AcaKUrJL7h57exHH6w/VJYqxfOWjAYQc2oproF1KnYiNL8sjXZ9BjAcG2Z8TC2e1K8NKKkzCUa3tk1M1TnuIYAdQknOb32Jp5k/AzPPlokGdFtExunwY3tR+iXE9LxCpdYRfKr2nTFa+z0gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fQGDnCcU; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761032181; x=1792568181;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lvztYyEYyRwSK53rDIAgy0tpVstr29Ir4aQY/x8lfSU=;
  b=fQGDnCcU6G6QddbmYwhf6TwE7TlpHoiZ1cJ2buuIYr29s2Wgl5+tvgmJ
   hDbGTRZeDCdO2QN7CJNaq5vtaPrq1KQdEHag2bvTLOSRSVitQo86FpaMc
   hbkj9/x2ZJbjeFERVTY5ORPmFIgO6x1VyiPBYLHuWZ5Neve5Y3axFDVa1
   LxC+C+yA5U1Pg1aaCptbZy3+/CJtZlz5T+MHrxgf8YsF0Whpti/IMxPN6
   ZfiWWXoGxOdfUB53k9GfRvkQac4NY9YbVZKpwbpXWwH051wW1641lptpO
   dbYE409YlNtalr3iKJjXWFVsc6Ycs7xi3d+UOc/FbV8JoWHVcHqpO5wJ6
   A==;
X-CSE-ConnectionGUID: Z2lNBUTLQwadwplloNJ9jw==
X-CSE-MsgGUID: 6J2QDdQBTGeD+YxwfKxaOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66987745"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="66987745"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 00:36:20 -0700
X-CSE-ConnectionGUID: yZQbxzPTR+Sn8MGXppYsMA==
X-CSE-MsgGUID: cAq+BR4nThWZd3iWS1TN6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="182675558"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 21 Oct 2025 00:36:19 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 44B1595; Tue, 21 Oct 2025 09:36:18 +0200 (CEST)
Date: Tue, 21 Oct 2025 09:36:18 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Jinhui Guo <guojinhui.liam@bytedance.com>
Cc: andriy.shevchenko@linux.intel.com, jsd@semihalf.com,
	andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] i2c: designware: Disable SMBus interrupts to
 prevent storms from mis-configured firmware
Message-ID: <20251021073618.GQ2912318@black.igk.intel.com>
References: <20251021072431.3427-1-guojinhui.liam@bytedance.com>
 <20251021072431.3427-2-guojinhui.liam@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251021072431.3427-2-guojinhui.liam@bytedance.com>

On Tue, Oct 21, 2025 at 03:24:31PM +0800, Jinhui Guo wrote:
> When probing the I2C master, disable SMBus interrupts to prevent
> storms caused by broken firmware mis-configuring IC_SMBUS=1; the
> handler never services them and a mis-configured SMBUS Master
> extend-clock timeout or SMBUS Slave extend-clock timeout can
> flood the CPU.
> 
> Signed-off-by: Jinhui Guo <guojinhui.liam@bytedance.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>


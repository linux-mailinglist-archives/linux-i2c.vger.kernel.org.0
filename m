Return-Path: <linux-i2c+bounces-5380-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D32951B43
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 14:56:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F82CB24718
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 12:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9F331B1401;
	Wed, 14 Aug 2024 12:56:49 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5941AC42B;
	Wed, 14 Aug 2024 12:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723640209; cv=none; b=dNY/whOCV/zQt9xAWnqj+i6FWwRE7sFkEGPAFwHYZOV5h/wWSnv8nQvIB3jo2hIWANwawyNZB4fp9tJskR375ZSOuzgxW4ayt4PQTLJjxx2Pa5GMJ7SEviJrbWWNK/FXa8mWeayxKYlfKxt25aHDwJg9zconUT66JVmBMaf4Qp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723640209; c=relaxed/simple;
	bh=eRpfdhaG6QEPoF+V5ZDBN6K80IgJhfENEwx5AylKrXQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TFNiPjbXTHACDkWTUEso20eIJH7YDHtj6I/+xSpp+rMpSWe55yzlhfZyn85C4aYxJd0I2i2PWGYCO+ea9dxw70Hp/X8+iKe6xoQbZ7Ut1GKjQMVLFDtgYtXKiCAZYNmBvhsHDUNZcNEeVqXucbfFGXcBKg6AQKl5mRuky1g5Kf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
X-CSE-ConnectionGUID: F5f5FUkJR+aCxxRULLfh7g==
X-CSE-MsgGUID: E4bj1UsfSoWsucrSgg+KLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="39305443"
X-IronPort-AV: E=Sophos;i="6.10,145,1719903600"; 
   d="scan'208";a="39305443"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 05:56:47 -0700
X-CSE-ConnectionGUID: zInlDfUxTLO/48mrJr1Vzg==
X-CSE-MsgGUID: otyy+w8qR6yY+muYXeAdQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,145,1719903600"; 
   d="scan'208";a="89703794"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 05:56:45 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1seDYP-0000000FBQu-2Ohr;
	Wed, 14 Aug 2024 15:56:41 +0300
Date: Wed, 14 Aug 2024 15:56:41 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Breno Leitao <leitao@debian.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, leit@meta.com,
	Michael van der Westhuizen <rmikey@meta.com>,
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] Do not mark ACPI devices as irq safe
Message-ID: <ZrypiZfNRlYE1y2X@smile.fi.intel.com>
References: <20240813161254.3509409-1-leitao@debian.org>
 <CAHp75VcLR5ehrCyVsY0TKWSogRt-_ETqkZ1VE=ATVqRc8Y_9vg@mail.gmail.com>
 <Zru4NpfJZCzE6uoa@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zru4NpfJZCzE6uoa@shikoro>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Aug 13, 2024 at 09:47:02PM +0200, Wolfram Sang wrote:
> 
> > end it will be ~5-6 lines only. Other than that, LGTM.
> 
> What about a proper prefix in the subject?

Indeed, but seems Andi is kind to amend this whilst applying.

-- 
With Best Regards,
Andy Shevchenko




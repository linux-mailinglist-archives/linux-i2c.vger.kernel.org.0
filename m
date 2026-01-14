Return-Path: <linux-i2c+bounces-15146-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E14D1D176
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 09:25:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78EC230102A6
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 08:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA14E37C0F8;
	Wed, 14 Jan 2026 08:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g+LDosqM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937912C1780;
	Wed, 14 Jan 2026 08:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768379041; cv=none; b=nxeQg6ktCa+iO/2KYEyjbY547siTUKaDCbWV0kh/JDqmBG8V8Bg3+6KdRRAdqcU/5NEMYCK8Y3w/ALOyzyKC25PNlihY2vpaQv/4mNVXV4czJMzhRvcXW2cW5yC4PcoyIr2+YIcbkGR0lR9pqJm72FJdmPMAP2kfyGUrybBS6QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768379041; c=relaxed/simple;
	bh=TpSIK25RbvWDNg7QiWIOtxQKPzkkGQzeiPPfyvIi0gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Su4FYWHuZaJoFrUZBh7YlVN+27PyiFL6a5i43RP9PYkvvrxYhsGWx2aqi1fbSawkDuNMfMZs0mGQCQ6Zp/OuI/6f3gSIOYwfP5FhBFxerWmuI7g13jLQjzSTaDbSw/t6pH1LYp0VFYoXcaoT+AfRIVT6Nr7UYSUt7YblTheTJoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g+LDosqM; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768379040; x=1799915040;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TpSIK25RbvWDNg7QiWIOtxQKPzkkGQzeiPPfyvIi0gk=;
  b=g+LDosqMgXqI7uaIaZhjqLhXC4FdDirifXXYbS2+8Y4qxZ9duevkPIdt
   e0VZXly5X2MAul2toIDmhIimwd9EGyqV0GTG58UiIkBL6umOzNvIA0BYZ
   j8qU6X73nvHRYqnyLJZQC4v8KIzzzONHuisMB4CaexiTnH4XWu/AvghY+
   M7tyV1Kip3u49sH4AHwyZ31se1lEXYh+9iMA3L5tdwUMOrkRKWAOmwCcH
   3IiWfc/3ughwMJsGfZoO5A9AxZAS/efh7ZLLs97RVBpgtBxjz4kKmIPkH
   8Rx5nod5a3pqO+xFenUwzb8oNCnl6H5Uqiba5D9Fqnp9po+RvWaHKRcQH
   A==;
X-CSE-ConnectionGUID: J15U9hKpRY+rX7MMA5Qmkg==
X-CSE-MsgGUID: Oo0yEA7BQXC9iVGRHn3WMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="73309094"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="73309094"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 00:23:58 -0800
X-CSE-ConnectionGUID: g2NXVMXRT7+6Jm3R7rO9aA==
X-CSE-MsgGUID: pmU4TLcgSYmvaqOcW2kQ5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="235333811"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.83])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 00:23:54 -0800
Date: Wed, 14 Jan 2026 10:23:51 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Andi Shyti <andi@smida.it>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Qianfeng Rong <rongqianfeng@vivo.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, Qii Wang <qii.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v1 0/7] i2c: busses: Introduce and use HZ_PER_GHZ
Message-ID: <aWdSlzLuU_psG_EV@smile.fi.intel.com>
References: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com>
 <aWdHRszwPfcniL1q@zenone.zhora.eu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWdHRszwPfcniL1q@zenone.zhora.eu>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jan 14, 2026 at 08:36:09AM +0100, Andi Shyti wrote:
> > Andy Shevchenko (7):
> >   units: Add HZ_PER_GHZ
> >   i2c: mlxbf: Use HZ_PER_GHZ constant instead of custom one
> >   i2c: mt65xx: Use HZ_PER_GHZ constant instead of plain number
> >   i2c: nomadik: Use HZ_PER_GHZ constant instead of plain number
> >   i2c: rk3x: Use HZ_PER_GHZ constant instead of plain number
> >   i2c: st: Use HZ_PER_GHZ constant instead of plain number
> >   i2c: synquacer: Use HZ_PER_GHZ constant instead of plain number
> 
> merged to i2c/i2c-host.

Thank you!

-- 
With Best Regards,
Andy Shevchenko




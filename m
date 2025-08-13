Return-Path: <linux-i2c+bounces-12265-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0C5B24A13
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 15:02:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C51D16D9A0
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 13:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D28FB1DDA09;
	Wed, 13 Aug 2025 13:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VZYtFpfY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CCE14F70;
	Wed, 13 Aug 2025 13:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755090149; cv=none; b=nAdPLQxwtPETSCSNoMopbisJF5M+s401N8UJOvNoxtJwFu5fICW77Yd+bYzTWa3RZSY95y+6K0Kxwjh8ib3ly+v2BO39DdUeDMiZSWq28/2RZnYdFnH3/YIZwanwmvHZ2fSPXEXt1is7c+RRQC+5PAaM35rgSyRByXBr954+S4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755090149; c=relaxed/simple;
	bh=UrNfwORQz/pjonuLGQ/m/+0Y7ZK7KSJP6xwUgBaSYEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BXnyQ06q2EzAB0W/vfuB2uG+DilSClZ26Htl3rLD3RTt/RuHVTNYl3inyCvfa95OIqvlyiDFnIVpVY1wVJVIjyD6NwqX6Ph4rlveJS/KGfjG//RD8L3sxUQca9/DDcsE8FiD65Mc6oe0FFKibiVtGDdwofw1uXXAoJEduVDlYZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VZYtFpfY; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755090148; x=1786626148;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=UrNfwORQz/pjonuLGQ/m/+0Y7ZK7KSJP6xwUgBaSYEU=;
  b=VZYtFpfYmO7ECO8HxhHTO/jVjc519CADScqaAa9c1Y0Z5rUFWMOfZEB1
   EArIIX8oYvRZER7pzzDjErOsqlbC/VZaCxeAFqlTO+cZmlReIq+ydj7Ts
   8caJOsPYpzKj1/hPdo7OqsYoC2JoAOWd/5cmmIrLx4khLT4WChFu1wNdq
   BW/7BnVVKrOty3mhRWQleethM6EfIOe8a7pfvDBhSgFpgh7nK1JU6t4rh
   Dm8CHxieX+nUa4hzmZdZtIyY7mipGtANcsTyt2YIbgGs/EeFr/BYfzSpp
   sFQneF2raGgrrSbkXe0uJ/kH0z+DEuBcBEx8ld0yq6t01X4DAeWnxWip8
   g==;
X-CSE-ConnectionGUID: r4/6YiSDQmibDa88v7FWyw==
X-CSE-MsgGUID: fMnynmmnRqmcG1aiTRLdtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68757654"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="68757654"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 06:02:27 -0700
X-CSE-ConnectionGUID: P26DlPJmSKSnJKimNPvhcg==
X-CSE-MsgGUID: eE8ENaBWROa8sRBaVXMLjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="203643671"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 06:02:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1umB7U-00000005RKR-2yW7;
	Wed, 13 Aug 2025 16:02:20 +0300
Date: Wed, 13 Aug 2025 16:02:20 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>, Hanna Hawa <hhhawa@amazon.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Imre Kaloz <kaloz@openwrt.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2 0/3] i2c: pxa: fix I2C communication on Armada 3700
Message-ID: <aJyM3N9T4xI4Xo1G@smile.fi.intel.com>
References: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
 <aJpOyWKzBt-tDWUF@smile.fi.intel.com>
 <4cd3efbd-4798-4f25-9440-879ee289d8ed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4cd3efbd-4798-4f25-9440-879ee289d8ed@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Aug 13, 2025 at 12:13:26PM +0200, Gabor Juhos wrote:
> 2025. 08. 11. 22:12 keltezéssel, Andy Shevchenko írta:
> > On Mon, Aug 11, 2025 at 09:49:54PM +0200, Gabor Juhos wrote:

...

> >> Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
> >> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> > 
> > I didn't get this SoB chain. Who is Imre here and what is his role in all this?
> 
> Imre reviewed the patches before publishing those, but we were unsure about that
> the Reviewed-by tag can be used when it is offered privately before the
> publicaton, so we decided to use the SoB tag instead.

It's exactly what should have been done. As a such the SoB chain is confusing
(taking into account the authorship of the patches).

> It can be changed to the Rewieved-by tag if that is applicable in this case.

Please do so.

-- 
With Best Regards,
Andy Shevchenko




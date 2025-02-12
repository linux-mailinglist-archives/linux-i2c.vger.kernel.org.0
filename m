Return-Path: <linux-i2c+bounces-9410-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FB5A32F30
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 20:04:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 983CA1883226
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 19:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0C6F25E44A;
	Wed, 12 Feb 2025 19:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CxO6A8hC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B491FC0FD;
	Wed, 12 Feb 2025 19:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739387059; cv=none; b=f2R3HcD4WrUDEdesLoUSKMcuJtGvYQm8A1ybILDH8wKOmu0ZIS0WJRKdzkpm9GwdfARwg0XOEoStlYHiURZ2eO86kl+GRCNqZWzDs9bORZYe1tkc4MWX5fGr3PDdOmhfiii/P14BwQymhpIQtXwmDf4VWnf8c41o+HmzPcGuCmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739387059; c=relaxed/simple;
	bh=BxoXSqBhEvRgMwVZ/Lsu4gBKNSrjVQ6Vg0s/Z8jm2bw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MJxvkHLYIiGDvxi8vUzNikZMZBdjf6aRYsbPSfHnbvCm0EadJLujXf8SIO6Uabard/Io1NBMZh0BqdDuBiDZztdW32A7dkAMFRAiDZdvsvYEii9aLGNL9XHrS7tLoISqhQlTCx1S1/LtmcnV8KWfy7bRv0sj1aUzMEjZ8K2zX18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CxO6A8hC; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739387058; x=1770923058;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BxoXSqBhEvRgMwVZ/Lsu4gBKNSrjVQ6Vg0s/Z8jm2bw=;
  b=CxO6A8hCMTmkhSJ3aM9SdEJ8LWAXcUY0qB8do8LRpH/ikX6Gy4C0VEcz
   RmqTeGo1C8ZJeeQAPvuvUlazNmXQxUFAtIq29iAjoYNRmqbTlYIuENwxd
   TmDsEkSU3gV6pTycoAOQUan/doRdl8EFEcd7ipdjl7KGooo7S0SE7J9kq
   2OvyIiKuFlSiqsCA/UGEvDRCJKeNP0pP3wBhmVH1Hc/ngPDTR9NgP+Y8s
   Iu8LiwJJ2ZAYSnv4oS09emJ7H3OJMZMbQxkteHdI+viU2rDQ3xkvK1RLK
   RWWf8dPoDDkx5rks3aY7zA0aXU939CXKbPoxWBJ/dIBzCYiW2Eyvw4wra
   w==;
X-CSE-ConnectionGUID: p8MfJOqtQ5um4A6er36/Uw==
X-CSE-MsgGUID: OyUx1EqySwWo7RiNi6m/8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="50692888"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="50692888"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 11:04:18 -0800
X-CSE-ConnectionGUID: 9fa88icUR72valktVDhKhw==
X-CSE-MsgGUID: Di7M1Du7RpyTDVR3QRe60Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="117915659"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 11:04:13 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tiI1p-0000000Avre-3MI0;
	Wed, 12 Feb 2025 21:04:09 +0200
Date: Wed, 12 Feb 2025 21:04:09 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Adamski <krzysztof.adamski@nokia.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Roese <sr@denx.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: Re: [PATCH v1 1/8] i2c: Introduce i2c_10bit_addr_from_msg()
Message-ID: <Z6zwqbzd5evG0H2z@smile.fi.intel.com>
References: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
 <20250212163359.2407327-2-andriy.shevchenko@linux.intel.com>
 <CAMuHMdW1wxQ0cddeE72D+Sii4HkT4bJfeTWX4-8FfHiFr+=3DA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW1wxQ0cddeE72D+Sii4HkT4bJfeTWX4-8FfHiFr+=3DA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Feb 12, 2025 at 07:36:46PM +0100, Geert Uytterhoeven wrote:
> On Wed, 12 Feb 2025 at 17:35, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > There are already a lot of drivers that have been using
> > i2c_8bit_addr_from_msg() for 7-bit addresses, now it's time
> > to have the similar for 10-bit addresses.

...

> > +static inline u8 i2c_10bit_addr_from_msg(const struct i2c_msg *msg)
> 
> Having never used 10-bit addressing myself, or even looked into it,
> it took me a while to understand what this helper really does...
> So this returns the high byte of the artificial 16-bit address that
> must be used to address a target that uses 10-bit addressing?
> Hence I think this should be renamed, to better match its purpose.

Since you are giving a constructive feedback, please, propose the name.

> > +{
> > +       /*
> > +        * 10-bit address
> > +        *   addr_1: 5'b11110 | addr[9:8] | (R/nW)
> > +        *   addr_2: addr[7:0]
> 
> I think the second comment line does not belong here, as this function
> doesn't care about that part.

I think the comment is okay to stay. It explains the full picture which is
helpful. It may be extended to say that the function returns only addr_1.

> > +        */
> > +       return 0xf0 | ((msg->addr & GENMASK(9, 8)) >> 7) | (msg->flags & I2C_M_RD);
> > +}
> 
> Probably you also want to add a similar but much simpler helper to
> return the low byte?

Wouldn't it be too much?

-- 
With Best Regards,
Andy Shevchenko




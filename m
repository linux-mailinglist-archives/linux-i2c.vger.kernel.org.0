Return-Path: <linux-i2c+bounces-9460-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5DDA35F81
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Feb 2025 14:55:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E2A83A8624
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Feb 2025 13:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D61264A71;
	Fri, 14 Feb 2025 13:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="crneWQcu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34BD263C82;
	Fri, 14 Feb 2025 13:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739541334; cv=none; b=FyA7t3hvIlyJA5SbXu3+7EwsqIL03xUkiA8wseLdyR9ORkhH1W6bZBtWonsKDi3iq7CfNzIidNUQ04wPk09z59CNLibqBfv8kMiub2M22V1zAQTGzhkjbM1gcbMKcmFE2l2ZA3A4qYDkOjkzHwYAxrMQNqI+x/PFEoKLh7rbKus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739541334; c=relaxed/simple;
	bh=wTI8w/v9e9Rb84CllROH8OzFtvROoc5l4ay396nLp7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WuhBZsqFCQu6KLAIT9JxDiFacN1Ql7iuezypD8uvicwn9Eh/3Mp1CWrZqjAoJG/hUNninQdi8LbLU84hyAK5YY1O6RqSCIBj6k5MVgPOUfLU4kgbQ9OOHmEZqH9NaujFOhrpo/vbkqg3rc9LXbk6sJsf7JxaypqE5BDdT1ZgiLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=crneWQcu; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739541333; x=1771077333;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wTI8w/v9e9Rb84CllROH8OzFtvROoc5l4ay396nLp7A=;
  b=crneWQcuAA90qcteWiQSD1ielRw+os/yl5j8eSXrgZo7mDCg/CfQg4aN
   +6EpKqYAjElqApdMlAzk2ZDE1B9coFy2d3ZWFcchoZvRMSZnixKS+CakD
   8Le328qFIsC+TKAIPMoOQW25LEvt6PxPe8FY8mhs7M+5IbrW2r31z0xcy
   e1z+bFZG+zuQqabznLFLsb8wFl0TZc20l8PnlOhpp3CyDaehyWKbtge4b
   3oBk9hFlGONga29vcpxe9pg/ovxNu/rCHLdLhLrAAS94Dq7dNwjWG/5se
   T3pYhJjz9+wrE3GDUmVISveL0jR3WH18b+hRtu24TYmGb4lLJQcTdzEfo
   w==;
X-CSE-ConnectionGUID: jiOoJiMDSIW/USgHPqOjbQ==
X-CSE-MsgGUID: M/OPItTWTJaqcypAekWGdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="39520282"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="39520282"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 05:55:32 -0800
X-CSE-ConnectionGUID: 5wI/a5w8RZG6uE1e5D2VEA==
X-CSE-MsgGUID: Wolqe3ftT++lWNrCklu2zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="144320806"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 05:55:28 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tiwA8-0000000BV4U-2nDd;
	Fri, 14 Feb 2025 15:55:24 +0200
Date: Fri, 14 Feb 2025 15:55:24 +0200
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
Message-ID: <Z69LTGY4mpiCCWY3@smile.fi.intel.com>
References: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
 <20250212163359.2407327-2-andriy.shevchenko@linux.intel.com>
 <CAMuHMdW1wxQ0cddeE72D+Sii4HkT4bJfeTWX4-8FfHiFr+=3DA@mail.gmail.com>
 <65f5eiy6kh6nhdjgpylrdjpw35jbae4s454u7qeqamh5hny7ms@ip4btvgxlaq4>
 <CAMuHMdXfj=kmaQ6OgUwyhNq+ZK2ZbpSfD2BS0B96VHoKAMonVQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXfj=kmaQ6OgUwyhNq+ZK2ZbpSfD2BS0B96VHoKAMonVQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 14, 2025 at 09:04:34AM +0100, Geert Uytterhoeven wrote:

...

> > > > +static inline u8 i2c_10bit_addr_from_msg(const struct i2c_msg *msg)
> > >
> > > Having never used 10-bit addressing myself, or even looked into it,
> > > it took me a while to understand what this helper really does...
> > > So this returns the high byte of the artificial 16-bit address that
> > > must be used to address a target that uses 10-bit addressing?
> > > Hence I think this should be renamed, to better match its purpose.
> >
> > It's coherent with i2c_8bit_addr_from_msg(), right?
> 
> Is it? Unlike i2c_8bit_addr_from_msg(), it does not return the full
> address,

Yeah, hi/lo together will be coherent, hence I sent a v2 with Geert's
suggestion being incorporated.

-- 
With Best Regards,
Andy Shevchenko




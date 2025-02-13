Return-Path: <linux-i2c+bounces-9412-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D85A33BBE
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 10:56:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10DFC7A2FBF
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 09:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F2BC20FA9B;
	Thu, 13 Feb 2025 09:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jkxiL1bY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B18420DD5C;
	Thu, 13 Feb 2025 09:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739440609; cv=none; b=KcZOHIKd4Tchx087ghLaB8wKxhruWybatTk869fIWVravZkxd66a4dgBgjuz9x88PwgCou3xw4T8SVGQ3W3/oBfeAlb1/P2dwtHbNfmKsfrcuu9tFPpYHRSPyNqzsN3/ZsgmnD8tI3mgFBiMwJt/3yT6LFiWu/J/2kymlkBNBXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739440609; c=relaxed/simple;
	bh=SJ/UzaavzQJpHfjZKxALqoOs5j5o6tpLEqhJ8NthZ1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kyXjuZ9bEQuL4Xx2LD5HnQ75V3HuZTsBuvURrfgn7w3Lx/kyDb/18Pm+wbZbpw1atezVQQ4QaShXctuyPB4V8PFvkbKlQ12gFTY4+Lvz9iF9/7FySy43gwyZekiPqjWkpO9ia8fxEIfFZQoQdr+9Sy9Eg+YG3uPc89lKFcrQEJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jkxiL1bY; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739440608; x=1770976608;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SJ/UzaavzQJpHfjZKxALqoOs5j5o6tpLEqhJ8NthZ1Y=;
  b=jkxiL1bYwYQ819+hg3L+jtjy8KhcEohWjTMt8E5lKDP5PPULYS2sv0/U
   q17SWpZZXWFigT68w4vICYQmVHRpOXHvPpvI1pVSmHsfeWhPeV+RIP15H
   ANurQPagiARLNr7XqW5MCNpzLV3zp+/20YM8SyIdfp19qsIhgVo8HoF/q
   xyaAQxoxfkcRlYYXlX+XHGgmR5egkzF+HcJhwJqzE+0Pvo3X5b/GObeHu
   L0b10D3NdJfqnET8rj0gStF325EojUP9B76afe/sQ4kguMIV1bp/74xiH
   qoD0gLN/8IbFtGL7XmN8TMPDdHai35YsHDnEDmpKIWlPNC+5HF6b2+dDr
   A==;
X-CSE-ConnectionGUID: wGzSMESGRGaI2B1wq2xG6w==
X-CSE-MsgGUID: ThK1UU/ESmukBBMlqsGWBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="43901990"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="43901990"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 01:56:47 -0800
X-CSE-ConnectionGUID: B3t23aX9QTOUleu8/qaS0Q==
X-CSE-MsgGUID: RxlP/DoHTLmLy+VbE93uSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="118103089"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 01:56:45 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tiVxZ-0000000B7w3-2Ov4;
	Thu, 13 Feb 2025 11:56:41 +0200
Date: Thu, 13 Feb 2025 11:56:41 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Bence =?iso-8859-1?B?Q3Pza+Fz?= <csokas.bence@prolan.hu>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v1 1/2] power: ip5xxx_power: Make use of
 i2c_get_match_data()
Message-ID: <Z63B2dxEd0g1ppra@smile.fi.intel.com>
References: <20250212165012.2413079-1-andriy.shevchenko@linux.intel.com>
 <20250212165012.2413079-2-andriy.shevchenko@linux.intel.com>
 <hnfdjznbvqbstcqd7rgrukqqdv7uasexojnujz63qgjnv7pja3@z4lanwhk4i6b>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hnfdjznbvqbstcqd7rgrukqqdv7uasexojnujz63qgjnv7pja3@z4lanwhk4i6b>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Feb 12, 2025 at 06:07:19PM +0100, Sebastian Reichel wrote:
> On Wed, Feb 12, 2025 at 06:46:23PM +0200, Andy Shevchenko wrote:
> > Get matching data in one step by switching to use i2c_get_match_data().

...

> Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Thank you!

...

> >  static int ip5xxx_power_probe(struct i2c_client *client)
> >  {
> > -	const struct ip5xxx_regfield_config *fields = &ip51xx_fields;
> > +	const struct ip5xxx_regfield_config *fields;
> >  	struct power_supply_config psy_cfg = {};
> >  	struct device *dev = &client->dev;

> >  	const struct of_device_id *of_id;

Seems I forgot to drop this (unused) variable.

> > @@ -843,9 +843,7 @@ static int ip5xxx_power_probe(struct i2c_client *client)
> >  	if (IS_ERR(ip5xxx->regmap))
> >  		return PTR_ERR(ip5xxx->regmap);
> >  
> > -	of_id = i2c_of_match_device(dev->driver->of_match_table, client);
> > -	if (of_id)
> > -		fields = (const struct ip5xxx_regfield_config *)of_id->data;
> > +	fields = i2c_get_match_data(client) ?: &ip51xx_fields;

-- 
With Best Regards,
Andy Shevchenko




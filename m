Return-Path: <linux-i2c+bounces-12695-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC26BB4659B
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 23:34:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A15065809B7
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 21:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5C492F2917;
	Fri,  5 Sep 2025 21:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DOhCkxow"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AAA2F069A;
	Fri,  5 Sep 2025 21:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757108063; cv=none; b=nc0Ov5Xmgvk6xPCAP5DPiSWZEEllWz+osVIktkhfvqMTb09sO2UKXO0bEWUszCZccntRGcULoSODT4K9G32ztBRYQpKw8vsEcRri5ZPYvf0Lc8TVXZJxkcdbMgPWm9U+hR0RRjQo/+/gDDjWkLzPicVRXGJkyLxfEU3JzuxD6ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757108063; c=relaxed/simple;
	bh=t1YYMqQMJrV5IH9mKdLOliDheITU/qbKvGTKMixiGNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lC9wpd070/8xtJ0jl2/EoxF7MOOBwCocBFLQ9fqP4VyvqE1lzjhcv8XuGrpxCHM/3a/7zEkFTA0G1gN5gsTdBnr0CAOmVSy4T2kRoQV4qakIBOYKCM0lZ1PN7bgm46HQ/ChsATz58yevzIJR3Z+zjCw7Oiy15gJunoTxfoTgD3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DOhCkxow; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757108062; x=1788644062;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t1YYMqQMJrV5IH9mKdLOliDheITU/qbKvGTKMixiGNo=;
  b=DOhCkxowLUdsZe5c4ioH+zAU4DXcEYR3dF5+Iy7T164EIqZem0poD7ge
   9VCB+5qYm6qL7hjYzzp+TCQjYiEEcNuV4GKDXORJvtKzGMcl4mFOl9gAa
   R+J/8tkNh4D5T7/YDq5BR6UVCOnjbJB00xH7yMsyZzkq8zM1rOTyo8aYS
   LvJeD0EALp/QY4aHxboWVOgUcNqgTLe2ZypPoDzPtouy/kDnw+FVqcqSl
   Gg+XzY4d9HZUeLk3ANncvuYfeRbSv6RGcLIaK/cOM9YqV5Hqo4sbFsOaG
   f92RAcXLD7klInSsWDP4jSOA2rTlbS0edHMuEF1ZjXv2vCcNiaXaxuJjC
   Q==;
X-CSE-ConnectionGUID: eGlNnmaMRgy7S9MkdWiRmg==
X-CSE-MsgGUID: LRYGBEC5RUmH4/wHeHyo4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="70842711"
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; 
   d="scan'208";a="70842711"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 14:34:20 -0700
X-CSE-ConnectionGUID: yyLGS8T/SeSiTsTgY9RTRQ==
X-CSE-MsgGUID: QIRrXAKuSpusSqawHhBfBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; 
   d="scan'208";a="203187511"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.91])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 14:34:17 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2A72E1201E4;
	Sat, 06 Sep 2025 00:34:14 +0300 (EEST)
Date: Sat, 6 Sep 2025 00:34:14 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Richard Hughes <rhughes@redhat.com>, linux-i2c@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 3/3] i2c: Add Intel USBIO I2C driver
Message-ID: <aLtXVvlzHs-tqBkV@kekkonen.localdomain>
References: <20250809102326.6032-1-hansg@kernel.org>
 <20250809102326.6032-4-hansg@kernel.org>
 <aJmY42ugarABq0Ew@kekkonen.localdomain>
 <3f8e5fbc-fc33-43a2-93f2-be087f8a343e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f8e5fbc-fc33-43a2-93f2-be087f8a343e@kernel.org>

Hi Hans,

On Fri, Sep 05, 2025 at 08:50:29PM +0200, Hans de Goede wrote:
> >> +static void usbio_i2c_uninit(struct i2c_adapter *adap, struct i2c_msg *msg)
> >> +{
> >> +	struct usbio_i2c *i2c = i2c_get_adapdata(adap);
> >> +	struct usbio_i2c_uninit ubuf;
> >> +
> >> +	ubuf.busid = i2c->adev->id;
> >> +	ubuf.config = msg->addr;
> > 
> > You can initialise this in declaration.
> 
> With the changes to use __le16 and _le32 for multi-byte words
> which Greg rightfully asked for this now looks like this:
> 
>         ubuf.busid = i2c->adev->id;
>         ubuf.config = cpu_to_le16(msg->addr);
> 
> having a function call in a struct initializer looks weird / wrong,
> so I'm going to keep these one as well as the other places as-is.

There's nothing wrong with initialising a struct field based on a function
return value.

> 
> Also in the usbio_i2c_read() / write() cases the struct may
> get re-initialized several times if needing to split the
> i2c-transfer into multiple bulk transfers.
> 
> Using struct initilization for the first one in that case
> feels rather inconsistent.

I'm fine with either.

> 
> ...
> 
> >> +static int usbio_i2c_probe(struct auxiliary_device *adev,
> >> +		const struct auxiliary_device_id *adev_id)
> >> +{
> >> +	struct usbio_i2c_bus_desc *i2c_desc;
> >> +	struct device *dev = &adev->dev;
> >> +	u8 dummy_read_buf;
> >> +	struct i2c_msg dummy_read = {
> >> +		.addr = 0x08,
> >> +		.flags = I2C_M_RD,
> >> +		.len = 1,
> >> +		.buf = &dummy_read_buf,
> >> +	};
> >> +	struct usbio_i2c *i2c;
> >> +	u32 max_speed;
> >> +	int ret;
> >> +
> >> +	i2c_desc = dev_get_platdata(dev);
> >> +	if (!i2c_desc)
> >> +		return -EINVAL;
> >> +
> >> +	/* Some USBIO chips have caps set to 0, but all chips can do 400KHz */
> >> +	if (!i2c_desc->caps)
> >> +		max_speed = I2C_MAX_FAST_MODE_FREQ;
> >> +	else
> >> +		max_speed = usbio_i2c_speeds[i2c_desc->caps & USBIO_I2C_BUS_MODE_CAP_MASK];
> >> +
> >> +	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
> >> +	if (!i2c)
> >> +		return -ENOMEM;
> > 
> > Same comment on devm memory allocation than on the GPIO driver: I think you
> > need to use the release callback of struct device here.
> 
> We unregister the adapter in remove() after that no callbacks into
> the driver can be made, so using devm() managed memory here is fine.

Ack.

-- 
Kind regards,

Sakari Ailus


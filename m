Return-Path: <linux-i2c+bounces-12694-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F906B46580
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 23:28:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 451B6A001E2
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 21:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7962F2F067F;
	Fri,  5 Sep 2025 21:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YJSfrzMF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9261028000F;
	Fri,  5 Sep 2025 21:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757107710; cv=none; b=JjERKgl6AV2t62ZSsGKtdPl/PJIGsV8PdUDqU68C641jfs+Ga9Y3ZwT/eNawHbti1QYVYOljCOAdyeXEcj9TAU4h1WMdeXo07imZNWl6qIMUp8FJidPW0lzC0gn394DmMZC8J5w8XG1Pg8oLEcvXY2i7RQxYI8yN1fC9EZnyzO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757107710; c=relaxed/simple;
	bh=5VN1HdLHibaUHpWBmaGIzqTIt9Taue5XTLEQJXUWDkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gL3hywI6LsF+ioTQVFgdoiC6wGuFeDwFae/dro4WyAMpOwrS0eUEXLXkQKh9FSH87yMxRs7jymTtDNRMRBVKHsiPrZkwMXwdSbKK6pPh/doZGTKX20PuUOcrMQwjZVYUExhQyQDiFQGe6JUjuIJ679jv+Lxf3E62vAyiwfcizcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YJSfrzMF; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757107709; x=1788643709;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5VN1HdLHibaUHpWBmaGIzqTIt9Taue5XTLEQJXUWDkw=;
  b=YJSfrzMF2qeMC2o3jyPBAY9qOZEAwcR1JTKyhYipUe87tJrrY6zoQzLG
   uOkr088u68p7uKZjp08g3mX7woHT6gR1enyAtFvJQZhKcYWSNkD62M6jq
   BY83eBS0MPGFjU/gUj+EzU4cgPGNO+hlpHVroMKpW4za4ZUiQa4mP5Dj8
   dQKpPM6JpUJDhq6/Ge20Wc3HdGvAWH+LM6AxiMR9koxzPdBnaRopzgIGe
   tYdlfL+R5CHlGTQ/K/x98HeUz88gSupeGiaJBIiXE94Yk5irzyzfhOMNT
   xiNHYpBkQwXHQ/IhdD4qk3aILM0xAZ9R9KnLzeokuNNlIVmWBbyqK6+6x
   Q==;
X-CSE-ConnectionGUID: 9J7WBZbERnK+8Z5ZJCre7g==
X-CSE-MsgGUID: 4/SrcosRSTWZ16Lc7ZcY2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="77075790"
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; 
   d="scan'208";a="77075790"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 14:28:28 -0700
X-CSE-ConnectionGUID: vZkAXhpMQv+h6F33oSsZIw==
X-CSE-MsgGUID: QkeVJHYmRYqxUEVBW1gUKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; 
   d="scan'208";a="209426551"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.91])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 14:28:25 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2FEDE1201E4;
	Sat, 06 Sep 2025 00:28:21 +0300 (EEST)
Date: Sat, 6 Sep 2025 00:28:21 +0300
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
Message-ID: <aLtV9THflQYXmSlK@kekkonen.localdomain>
References: <20250809102326.6032-1-hansg@kernel.org>
 <20250809102326.6032-4-hansg@kernel.org>
 <aJmY42ugarABq0Ew@kekkonen.localdomain>
 <7321f79e-6004-4bca-85bb-a10f0636deb5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7321f79e-6004-4bca-85bb-a10f0636deb5@kernel.org>

Hi Hans,

On Mon, Aug 11, 2025 at 11:49:29AM +0200, Hans de Goede wrote:
> Hi Sakari,
> 
> Thank you for your review, note this
> is not a full reply.
> 
> On 11-Aug-25 9:16 AM, Sakari Ailus wrote:
> 
> <snip>
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
> And more or less the same reply, i2c_del_adapter() ensures
> all i2c_clients on the adapters bus are unregistered so
> it guarantees that after i2c_del_adapter() none of the adapter
> functions will get called.
> 
> So freeing the struct containing the adapter after remove()
> has run is fine.
> 
> I know that the media subsystem does not handle v4l2-subdevs
> (which the i2c-clients are) going away very well.
> 
> Richard mentioned that after a fw-update the usbio chip will
> not come back until a reboot. And I've noticed that after crashing
> the usbio fw it will not come back until a full power-cycle.

Ouch. I guess this also depends on the implementation. Some presumably
behave better and with firmware upgrades the behaviour could (at least
theoretically) change as well.

> 
> So we do not need to worry about somehow slotting new i2c-clients
> into the media-controller graph after a disconnect + reconnect
> since the reconnect will never happen during the current boot.

Ack.

> 
> We do need to somehow make sure that trying to access the v4l2-subdev
> after disconnect does not cause oopses or worse.
> 
> We will likely need to somehow keep the memory for the v4l2-subdev
> around and add something like a disconnected / dead flag to it.

For this exact reason. V4L2 sub-devices can't be reliably removed for the
time being. (The same goes for the Media device.) I presume the sub-devices
will remain, but just won't actually be functional in this case?

-- 
Kind regards,

Sakari Ailus


Return-Path: <linux-i2c+bounces-12235-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2564CB20465
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 11:51:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC7DA178F5B
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 09:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2BF924166E;
	Mon, 11 Aug 2025 09:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="prAZfONv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854B21F4C8C;
	Mon, 11 Aug 2025 09:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754905773; cv=none; b=WEO8rrvvym59lQ+EwsrQuBDnAx9QQ0EOhqeky+0tEhQFyM7JFMSyKR+XWQUU/492RQ5HDdDr462AcPfHX4+7z5dbWEq1lMCkvK6FPcBBfpAtnJ4COhex7ubqxOPuVKlkeZAB+sTlM49fYbsXe6HAWzqZQZYHnZ2d5+3wvTJqrgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754905773; c=relaxed/simple;
	bh=XuvUmiHujUXpabtI4iDksy2ux5JYNkm/NLiN2Jw60/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lLaeIGxMCbfQOoUK0z89pfwUWGyVe7lAGFwsDOEHNy8Toz0E5iXoqmSH6n/nFCstWL8RSibXBeS0Mo1/lYVz213c7U5sHiQ9vbiFhSHx2+5tDIijZ+3hsPAHxItuSJB4XDjr7iC+oORc6WQMGFJOqLdcZ64cCiuPe8mZwbOI8oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=prAZfONv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD5A2C4CEED;
	Mon, 11 Aug 2025 09:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754905773;
	bh=XuvUmiHujUXpabtI4iDksy2ux5JYNkm/NLiN2Jw60/o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=prAZfONv0+wux22uiujN+WrvLsKV6MHRUVQsIuK4tSg47pURyGRD9hR0UPc8pHQQo
	 Z19QBHUcGk8kOzmT0BZDg/iPutxufscciYNccjfU05r7W+yMTxmK5iIXYkMYq0OMZM
	 EUfrbh0MSDZAAgrXwz/hbBp0TIcfYrfpH3/QlQN+/dQxxtHb/+umWPzYpPyO0mUTif
	 IG8dQID3aPKlwNVS0ia3Uqe+3doUwxnHoaPsGC5efpEje43deyyrVmVVqGj0P9YCWO
	 rY6LUC84djnKfMI+gktysGYHMHXcbhRlKqtN5Rla00SzIizIwZYEpCIqQhujpP4gaV
	 ++JQeOkC1jlrQ==
Message-ID: <7321f79e-6004-4bca-85bb-a10f0636deb5@kernel.org>
Date: Mon, 11 Aug 2025 11:49:29 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] i2c: Add Intel USBIO I2C driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
 Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
 <linus.walleij@linaro.org>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Richard Hughes <rhughes@redhat.com>, linux-i2c@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250809102326.6032-1-hansg@kernel.org>
 <20250809102326.6032-4-hansg@kernel.org>
 <aJmY42ugarABq0Ew@kekkonen.localdomain>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <aJmY42ugarABq0Ew@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

Thank you for your review, note this
is not a full reply.

On 11-Aug-25 9:16 AM, Sakari Ailus wrote:

<snip>

>> +static int usbio_i2c_probe(struct auxiliary_device *adev,
>> +		const struct auxiliary_device_id *adev_id)
>> +{
>> +	struct usbio_i2c_bus_desc *i2c_desc;
>> +	struct device *dev = &adev->dev;
>> +	u8 dummy_read_buf;
>> +	struct i2c_msg dummy_read = {
>> +		.addr = 0x08,
>> +		.flags = I2C_M_RD,
>> +		.len = 1,
>> +		.buf = &dummy_read_buf,
>> +	};
>> +	struct usbio_i2c *i2c;
>> +	u32 max_speed;
>> +	int ret;
>> +
>> +	i2c_desc = dev_get_platdata(dev);
>> +	if (!i2c_desc)
>> +		return -EINVAL;
>> +
>> +	/* Some USBIO chips have caps set to 0, but all chips can do 400KHz */
>> +	if (!i2c_desc->caps)
>> +		max_speed = I2C_MAX_FAST_MODE_FREQ;
>> +	else
>> +		max_speed = usbio_i2c_speeds[i2c_desc->caps & USBIO_I2C_BUS_MODE_CAP_MASK];
>> +
>> +	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
>> +	if (!i2c)
>> +		return -ENOMEM;
> 
> Same comment on devm memory allocation than on the GPIO driver: I think you
> need to use the release callback of struct device here.

And more or less the same reply, i2c_del_adapter() ensures
all i2c_clients on the adapters bus are unregistered so
it guarantees that after i2c_del_adapter() none of the adapter
functions will get called.

So freeing the struct containing the adapter after remove()
has run is fine.

I know that the media subsystem does not handle v4l2-subdevs
(which the i2c-clients are) going away very well.

Richard mentioned that after a fw-update the usbio chip will
not come back until a reboot. And I've noticed that after crashing
the usbio fw it will not come back until a full power-cycle.

So we do not need to worry about somehow slotting new i2c-clients
into the media-controller graph after a disconnect + reconnect
since the reconnect will never happen during the current boot.

We do need to somehow make sure that trying to access the v4l2-subdev
after disconnect does not cause oopses or worse.

We will likely need to somehow keep the memory for the v4l2-subdev
around and add something like a disconnected / dead flag to it.

Regards,

Hans




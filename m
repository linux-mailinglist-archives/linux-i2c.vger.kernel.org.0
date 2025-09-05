Return-Path: <linux-i2c+bounces-12693-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5685CB462DA
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 20:54:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 131C13B37AF
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 18:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3272D280A52;
	Fri,  5 Sep 2025 18:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VXxNLfPE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9C9315D5A;
	Fri,  5 Sep 2025 18:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757098234; cv=none; b=Y7WFrzEcd3wi6sofxeucHV01880dc+WsIj/VlgZNvTZyERf2Hq/9x3f1fuyp+XDNQClqDlH/fmytW28q5zkZNsOywxmdqkqcjYDoAPIkPCrKkgx7DJnPF9QfxGMsVzbeiM+JPWI6eCnenPw5d3zYsmHNK08TZ1rwkjDu6CjilRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757098234; c=relaxed/simple;
	bh=/+is5jxNJVPx7UiHsW2765/QY6JX77gNcTLZ+G6khaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o8eKIiejVHkWb/MAdy3XOnvryiMDElUtlxG3QGDJ4siMgi5PEIVSmI0eHFeywuhJz1ekBj7/+P/4YMYr00v7Do0CPtZx8b/WqPuhYV1Ii4T+ylvGa0iSL7O/VKvlPD+BaMZECC2jmYJOI007W8rke/cDNLLhfzIdOrp4mpc2hP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VXxNLfPE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18E2AC4CEF7;
	Fri,  5 Sep 2025 18:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757098233;
	bh=/+is5jxNJVPx7UiHsW2765/QY6JX77gNcTLZ+G6khaQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VXxNLfPEv0afBpCYlzaX/fYMiTb8MI/wrVUkGr8FVCnxLid4rw/W/8ci/h3BMQqiV
	 YsiBQGRWS39TGFcERhOBvoPoMGx3oKpQMPkVI4UPF4MeJVMFKjxE7NE7FIEmu41XXY
	 khgE0OI91T8y6Ihks5ep9rRSnhvViWmIXnlvQ0LGv6MQIcBdfQezGUez/YpgBjTBXV
	 Nee5antpqhFZeZCKB8AWQ4phN8mZ8Vci0LhgjzQsia18H/SDdi75pdQPEN+tUYMt+2
	 12XJ4mL9Pllk32RD1eXis9PbNZKQnrejoZCUo7+e6ELRaXQJkYddxgM9btYbnPihkn
	 2Qr4d4kPOBnZA==
Message-ID: <3f8e5fbc-fc33-43a2-93f2-be087f8a343e@kernel.org>
Date: Fri, 5 Sep 2025 20:50:29 +0200
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

Hi,

On 11-Aug-25 9:16 AM, Sakari Ailus wrote:
> Hi Hans, Israel,
> 
> My comments on newlines and parentheses apply to this one, too; I'm not
> making new ones in similar locations on that subject anymore for this
> patch.

Ack I've added the necessary new-line changes,
thank you for the review.

> On Sat, Aug 09, 2025 at 12:23:26PM +0200, Hans de Goede wrote:
>> From: Israel Cepeda <israel.a.cepeda.lopez@intel.com>
>>
>> Add a a driver for the I2C auxbus child device of the Intel USBIO USB
>> IO-expander used by the MIPI cameras on various new (Meteor Lake and
>> later) Intel laptops.
>>
>> Co-developed-by: Hans de Goede <hansg@kernel.org>
>> Signed-off-by: Hans de Goede <hansg@kernel.org>
>> Signed-off-by: Israel Cepeda <israel.a.cepeda.lopez@intel.com>

...

>> diff --git a/drivers/i2c/busses/i2c-usbio.c b/drivers/i2c/busses/i2c-usbio.c
>> new file mode 100644
>> index 000000000000..82c4769852f8
>> --- /dev/null
>> +++ b/drivers/i2c/busses/i2c-usbio.c
>> @@ -0,0 +1,344 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2025 Intel Corporation.
>> + * Copyright (c) 2025 Red Hat, Inc.
>> + */
>> +
>> +#include <linux/auxiliary_bus.h>
>> +#include <linux/dev_printk.h>
>> +#include <linux/device.h>
>> +#include <linux/i2c.h>
>> +#include <linux/types.h>
>> +#include <linux/usb/usbio.h>
>> +
>> +#define I2C_RW_OVERHEAD (sizeof(struct usbio_bulk_packet) + sizeof(struct usbio_i2c_rw))
>> +
>> +struct usbio_i2c {
>> +	u32 speed;
> 
> You could declare this with the smaller fields for better struct packing.

Ack, fixed for v2.

>> +	struct i2c_adapter adap;
>> +	struct auxiliary_device *adev;
>> +	struct usbio_i2c_rw *rwbuf;
>> +	bool init_supports_ack_flag;
>> +	u16 txbuf_len;
>> +	u16 rxbuf_len;
>> +};

...

>> +static void usbio_i2c_uninit(struct i2c_adapter *adap, struct i2c_msg *msg)
>> +{
>> +	struct usbio_i2c *i2c = i2c_get_adapdata(adap);
>> +	struct usbio_i2c_uninit ubuf;
>> +
>> +	ubuf.busid = i2c->adev->id;
>> +	ubuf.config = msg->addr;
> 
> You can initialise this in declaration.

With the changes to use __le16 and _le32 for multi-byte words
which Greg rightfully asked for this now looks like this:

        ubuf.busid = i2c->adev->id;
        ubuf.config = cpu_to_le16(msg->addr);

having a function call in a struct initializer looks weird / wrong,
so I'm going to keep these one as well as the other places as-is.

Also in the usbio_i2c_read() / write() cases the struct may
get re-initialized several times if needing to split the
i2c-transfer into multiple bulk transfers.

Using struct initilization for the first one in that case
feels rather inconsistent.

...

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

We unregister the adapter in remove() after that no callbacks into
the driver can be made, so using devm() managed memory here is fine.

Regards,

Hans




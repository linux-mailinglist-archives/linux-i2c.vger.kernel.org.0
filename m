Return-Path: <linux-i2c+bounces-12692-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F17B46258
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 20:36:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18036A45775
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 18:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EFEA26F46E;
	Fri,  5 Sep 2025 18:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dFSM/hip"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FB9305947;
	Fri,  5 Sep 2025 18:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757097384; cv=none; b=ICZrymLsY2w2zFhTOmbSCV5dJXNUFbn4NDHPGWkKVazhMC0epm7hoS292FvF5Cy/DyQqWnAx/LRITD16jCybhelQggsoej4UHm+qbiZIDiPj4WHArLPPkn37qLvMQsZdEqBK0f55lUoGW7/dcOVXzhB4sge7VQ9UUjZlCvWEzU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757097384; c=relaxed/simple;
	bh=Z0l0aww+0sTvmNTqaq97C4lrWO6iKtSAsranbZR2N6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sq8E4JIdSvLlXPcSUQhuu8AhQAfztt4O+3uPwTjFm0EUfeYkhROUVKnWvxWxX/CMjtvqml5USxmfIVWvBrGPzcExBf4i6DLVL/FwjqZOJtJ5wtCth3F0BXebpdsi0VymzIKtOb3GOwDBPZ0xevW4cE0uVLmgF8SjP4JpXRTOJ28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dFSM/hip; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D823C4CEF1;
	Fri,  5 Sep 2025 18:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757097383;
	bh=Z0l0aww+0sTvmNTqaq97C4lrWO6iKtSAsranbZR2N6U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dFSM/hip1IM+ZMi1IniF1JusPZmfyWStbu37GUi3tUsTTMb5yRA+0crc0aAUs6PwP
	 mRzwZwlDQbWgitgaCY+QeVcYSqO7pTU6G18+buVPNZmKIPM6h/3SBLxqqRrJLj/dLl
	 kVjqIEFEMgi47BHsCgiaCDxI1C/6WO0PGYClk0ftVvL4vrfD7PJEKaEt3PybNNc/Ox
	 3uuymTce4+GQvzBQVr9ubQxv2xOMVeqgOsBlH0EB6cyd9k+aHXMLQBWlBEjC7HQaYI
	 z1LH3FZsS1a2GJOK0a72H/vUOMRgp65hxc2nN3d1a7Uf+nQyBVf1HDCS4sOlpF+g6A
	 fiMBpaiDJ07Ug==
Message-ID: <3173a8f8-ccbb-4478-8b2f-b7770cf3815c@kernel.org>
Date: Fri, 5 Sep 2025 20:36:19 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] usb: misc: Add Intel USBIO bridge driver
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
 <20250809102326.6032-2-hansg@kernel.org>
 <aJmS15MlcHz__S0p@kekkonen.localdomain>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <aJmS15MlcHz__S0p@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 11-Aug-25 8:51 AM, Sakari Ailus wrote:
> Hi Hans,
> 
> Thanks for posting this. Some comments below...
> 
> On Sat, Aug 09, 2025 at 12:23:24PM +0200, Hans de Goede wrote:
>> From: Israel Cepeda <israel.a.cepeda.lopez@intel.com>
>>
>> Add a driver for the Intel USBIO USB IO-expander used by the MIPI cameras
>> on various new (Meteor Lake and later) Intel laptops.
>>
>> This is an USB bridge driver which adds auxbus child devices for the GPIO,
>> I2C and SPI functions of the USBIO chip and which exports IO-functions for
>> the drivers for the auxbus child devices to communicate with the USBIO
>> device's firmware.
>>
>> Co-developed-by: Hans de Goede <hansg@kernel.org>
>> Signed-off-by: Hans de Goede <hansg@kernel.org>
>> Signed-off-by: Israel Cepeda <israel.a.cepeda.lopez@intel.com>

Once more thank you for the review.

I'm replying here to correct some of my previous replies to your
review. Anything not mentioned below I've addressed as discussed
before.

...

>> diff --git a/drivers/usb/misc/usbio.c b/drivers/usb/misc/usbio.c
>> new file mode 100644
>> index 000000000000..88197092f39a
>> --- /dev/null
>> +++ b/drivers/usb/misc/usbio.c
>> @@ -0,0 +1,693 @@

...

>> +#define adev_to_client(adev) container_of(adev, struct usbio_client, adev)
> 
> Please use a different name than "adev" for the argument, which is also the
> struct field of interest.

Ignore my previous comment on this remark. I've decided to
clean this up for v2 and use a different names for the 2
container_of() arguments.

>> +
>> +static int usbio_ctrl_msg(struct usbio_device *usbio, u8 type, u8 cmd,
>> +			  const void *obuf, u16 obuf_len, void *ibuf, u16 ibuf_len)
>> +{
>> +	u8 request = USB_TYPE_VENDOR | USB_RECIP_DEVICE;
>> +	struct usbio_ctrl_packet *cpkt;
>> +	unsigned int pipe;
>> +	u16 cpkt_len;
>> +	int ret;
>> +
>> +	lockdep_assert_held(&usbio->mutex);
>> +
>> +	if ((obuf_len > (usbio->ctrlbuf_len - sizeof(*cpkt))) ||
>> +	    (ibuf_len > (usbio->ctrlbuf_len - sizeof(*cpkt))))
> 
> You can (and should) remove all parentheses except the outer ones here.

As mentioned by Greg parentheses help to keep the code readable, so
I'm going to keep these as well as those in other places where you've
asked to drop them.

...

>> +	pipe = usb_sndctrlpipe(usbio->udev, usbio->ctrl_pipe);
>> +	cpkt_len = sizeof(*cpkt) + obuf_len;
>> +	ret = usb_control_msg(usbio->udev, pipe, 0, request | USB_DIR_OUT, 0, 0,
>> +			      cpkt, cpkt_len, USBIO_CTRLXFER_TIMEOUT);
>> +	dev_dbg(usbio->dev, "control out %d hdr %*phN data %*phN\n", ret,
>> +		(int)sizeof(*cpkt), cpkt, (int)cpkt->len, cpkt->data);
> 
> Instead of casting, how about using %zu for printing a size_t?

This is not printing the size, this is filling the * field-width
parameter for the %*phN dumping of the header. Using an int when
setting field-width with * is mandatory. The same applies to
your other %zu review remarks.

...

>> +	if (ibuf_len < cpkt->len)
>> +		return -ENOSPC;
>> +
>> +	memcpy(ibuf, cpkt->data, cpkt->len);
> 
> It'd be nice to have one more newline here.

As already mentioned I've fixed for v2, as well as all the other
requests for extra newlines.

> 
>> +	return cpkt->len;
>> +}

...

Regards,

Hans




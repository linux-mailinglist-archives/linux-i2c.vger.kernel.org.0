Return-Path: <linux-i2c+bounces-14971-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3202BCFE0D7
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 14:48:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF03730E2C82
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 13:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E8F433EB01;
	Wed,  7 Jan 2026 13:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ePcN6M4J"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F5333F386;
	Wed,  7 Jan 2026 13:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767793144; cv=none; b=VcI0ehwpnVeubwZomv197vqhb0qs7JW+K/tgB6I2Ep7hTGvuYhsZP+LSAY49KwNywFMfC/QfVBEL3fLYN6JxMud1rD8wc1tVu8OBdpFivclto2lFXQ0EHE4dw92MmB6eqLlALUOjEVEPdiJbTtF2e4ltMiDU3naFPy4nGrWyi60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767793144; c=relaxed/simple;
	bh=HLwuGEv8yRp3Qlw09DQpZxoMNtEsfMzmv5GRzhVw/dE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qa8InBzlmmfovCb+UhYpIXWaHqOBxHOtmGvmJEvP1MvbsluFuN/TG9dpXQ/zzZQD9ZPjjbXKddJKw75Up0a8E0FZAEya/uedj2IHPumxLTAOU8lDA4bNp8i+g0T7757TinCf6TBq2UmdGAY+ZMkJeRJBd6v6vZPNLUmXlj9Jk34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ePcN6M4J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFED5C19421;
	Wed,  7 Jan 2026 13:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767793144;
	bh=HLwuGEv8yRp3Qlw09DQpZxoMNtEsfMzmv5GRzhVw/dE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ePcN6M4JOxXVAh3hQEg8pSJNk/T2O9s5XpSqpnalm9f5TtDuVis88RYHjHB1sOyHC
	 lg34V2A53NhA6GmxO+iIZq8rvs5KS3iO59JxnqbG/0PqMTXGLMqhApUMWgBhcJcAhp
	 CUJWRBz3e0yrC1RDbXqRwYLKmQPHfGVDqWIJ620eD3txQYUXFQAqjSwm5aa7B8Raw0
	 8npw6nhWsb2bpeYQJ7Pd6jYis9J15vTQgzkbnwBLGTbh5UHkMUWAxdkzKrBJfJuVl/
	 fH3h6tnZwQ+lE5+qk3/bqsUqBBYuGfeBA85sJTMmLXnA+o4/fGQIx07NwkGAtislTN
	 XC0eEE3z5xHrg==
Date: Wed, 7 Jan 2026 14:38:57 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Francesco Lavra <flavra@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: Add FTDI FT4222H USB I2C adapter
Message-ID: <aV5aM4OgIeJtsxlb@zenone.zhora.eu>
References: <20260106170807.3964886-1-flavra@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106170807.3964886-1-flavra@baylibre.com>

Hi Francesco,

I did just a quick initial review.

On Tue, Jan 06, 2026 at 06:08:07PM +0100, Francesco Lavra wrote:
> FT4222H exports a USB interface to operate as I2C bus master when set up
> (via the DCNF pins) in configuration mode 0 or 3.
> The USB communication protocol implemented by the FT4222 chip is not
> publicly documented, therefore the USB communication code in the driver
> contains several magic numbers that have been retrieved by sniffing USB
> traffic generated with the FTDI FT4222 userspace library.

In any case, magic numbers need to be documented and/or defined
in the code.

...

> +enum ft4222_conf_mode {
> +	ft4222_conf0,
> +	ft4222_conf12,
> +	ft4222_conf3,
> +};
> +
> +enum ft4222_sys_clk {
> +	ft4222_sys_clk_60 = 0,
> +	ft4222_sys_clk_24,
> +	ft4222_sys_clk_48,
> +	ft4222_sys_clk_80,

can we make these enums capital letters? Otherwise they will look
more like variables or structs.

> +};

...

> +static int ft4222_cmd_get(struct ft4222_i2c *ftdi, u16 cmd, u8 *val)
> +{
> +	struct usb_device *udev = ftdi->udev;
> +	int ret = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0), 0x20, 0xC0,
> +				  cmd, 0x0001, ftdi->ubuf, sizeof(*val),
> +				  FT4222_IO_TIMEOUT);

Please, avoid to call important functions in the declaration
parts.

Give them more visibility by calling these functions in it's own
line and section.

> +
> +	if (ret == sizeof(*val))
> +		*val = ftdi->ubuf[0];
> +	else if (ret >= 0)	/* unexpected number of bytes transferred */
> +		ret = -EIO;
> +	return ret;
> +}
> +
> +static int ft4222_i2c_reset(struct ft4222_i2c *ftdi)
> +{
> +	return ft4222_cmd_set(ftdi, 0x51, 1);

what is 0x51?
what is '1'?

> +}
> +
> +static int ft4222_i2c_get_status(struct ft4222_i2c *ftdi)
> +{
> +	u8 status;
> +	int retry;
> +	const int max_retries = 512;

why 512?

> +	for (retry = 0; retry < max_retries; retry++) {
> +		int ret = ft4222_cmd_get(ftdi, 0xf5b4, &status);
> +
> +		if (ret < 0)
> +			return ret;
> +		if (!(status & FT4222_I2C_CTRL_BUSY))
> +			break;
> +	}
> +	dev_dbg(&ftdi->adapter.dev, "status 0x%02x (%d retries)", status,
> +		retry);

whould this debug message be printed after the check below?

> +	if (retry == max_retries) {
> +		ft4222_i2c_reset(ftdi);
> +		return -ETIMEDOUT;
> +	}
> +	if (!(status & FT4222_I2C_ERROR))
> +		return 0;
> +	if (status & FT4222_I2C_ADDR_NACK)
> +		return -ENXIO;
> +	else if (status & FT4222_I2C_DATA_NACK)
> +		return -EIO;
> +	else
> +		return -EBUSY;
> +}

...

> +static int ft4222_i2c_setup(struct ft4222_i2c *ftdi, unsigned int freq)
> +{
> +	bool hi_freq = (freq > I2C_MAX_FAST_MODE_FREQ);
> +	const int m = hi_freq ? 6 : 8;
> +	u8 n;
> +	int ret;
> +
> +	if ((freq < I2C_MAX_STANDARD_MODE_FREQ) ||
> +	    (freq > I2C_MAX_HIGH_SPEED_MODE_FREQ))
> +		return -EINVAL;
> +	n = DIV_ROUND_UP(ftdi->sys_clk, freq * m) - 1;
> +	if (hi_freq)
> +		n |= 0xc0;

what is 0xc0?

> +	ret = ft4222_cmd_set(ftdi, 0x52, n);

what is 0x52?

> +	if (ret < 0)
> +		return ret;
> +	ret = ft4222_cmd_set(ftdi, 0x05, 1);

what is 0x05?

> +	if (ret < 0)
> +		return ret;
> +	ftdi->freq = freq;
> +	return 0;
> +}

...

> +static int ft4222_i2c_init(struct usb_interface *interface)
> +{
> +	struct device *dev = &interface->dev;
> +	struct ft4222_i2c *ftdi = devm_kmalloc(dev, sizeof(*ftdi), GFP_KERNEL);

Please, don't initialize here with kmalloc.

> +	int ret;
> +	u8 sys_clk_enum;
> +	unsigned int sys_clk;
> +	struct i2c_adapter *adapter;

super nitpick: sort variables by line length, from the longest to
the shortest, in a reverse christmas tree order.

> +

please, initialize here with kmalloc.

> +	if (!ftdi)
> +		return -ENOMEM;
> +	ftdi->udev = interface_to_usbdev(interface);
> +	ret = ft4222_cmd_get(ftdi, 0x0004, &sys_clk_enum);
> +	if (ret < 0)
> +		return ret;
> +	switch (sys_clk_enum) {
> +	case ft4222_sys_clk_60:
> +		sys_clk = 60000000;
> +		break;
> +	case ft4222_sys_clk_24:
> +		sys_clk = 24000000;
> +		break;
> +	case ft4222_sys_clk_48:
> +		sys_clk = 48000000;
> +		break;
> +	case ft4222_sys_clk_80:
> +		sys_clk = 80000000;
> +		break;
> +	default:
> +		dev_err(dev, "unknown system clock setting %d", sys_clk_enum);
> +		return -EOPNOTSUPP;
> +	}
> +	ftdi->sys_clk = sys_clk;
> +	ret = ft4222_i2c_setup(ftdi, I2C_MAX_FAST_MODE_FREQ);
> +	if (ret < 0)
> +		return ret;
> +	ret = ft4222_i2c_reset(ftdi);
> +	if (ret < 0)
> +		return ret;
> +	adapter = &ftdi->adapter;
> +	memset(adapter, 0, sizeof(*adapter));
> +	adapter->owner = THIS_MODULE;
> +	adapter->algo = &ft4222_i2c_algo;
> +	adapter->dev.parent = dev;
> +	adapter->dev.groups = ft4222_attr_groups;
> +	snprintf(adapter->name, sizeof(adapter->name),
> +		 "FT4222 USB-to-I2C %03d-%03d", ftdi->udev->bus->busnum,
> +		 ftdi->udev->devnum);
> +	ret = devm_i2c_add_adapter(dev, adapter);
> +	if (ret < 0)
> +		return ret;
> +	dev_dbg(&adapter->dev, "system clock frequency %d Hz", sys_clk);
> +	return 0;

I see that you don't like blank lines, but sometimes, in my
opinion, separating the blocks with a blank line, might improve
the readability.

> +}
> +
> +static int ft4222_get_conf(struct usb_interface *interface,
> +			   enum ft4222_conf_mode *conf_mode)
> +{
> +	struct usb_device *udev = interface_to_usbdev(interface);
> +	u16 dev_type = udev->descriptor.bcdDevice;
> +
> +	switch (dev_type >> 8) {
> +	case 0x17:
> +		*conf_mode = ft4222_conf3;
> +		break;
> +	case 0x18:
> +		*conf_mode = ft4222_conf0;
> +		break;
> +	case 0x19:

can we give a define to these dev_types?

> +		*conf_mode = ft4222_conf12;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +	return 0;
> +}
> +
> +static int ft4222_i2c_probe(struct usb_interface *interface,
> +			    const struct usb_device_id *id)
> +{
> +	enum ft4222_conf_mode conf_mode;
> +	int ret = ft4222_get_conf(interface, &conf_mode);
> +	int intf = interface->cur_altsetting->desc.bInterfaceNumber;
> +
> +	if (ret)
> +		return ret;
> +	if (((conf_mode == ft4222_conf0) || (conf_mode == ft4222_conf3)) &&

what about conf12?

> +	    (intf == 0))
> +		return ft4222_i2c_init(interface);
> +	return -ENODEV;

I'd prefer to revert the conditions and end up in success rather
than with failure:

	if (((conf_mode != ft4222_conf0) && (conf_mode == ft4222_conf3)) ||
	    (intf != 0))
		return -ENODEV;

	return ft4222_i2c_init(interface);

> +}

Thanks,
Andi


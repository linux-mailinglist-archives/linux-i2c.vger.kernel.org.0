Return-Path: <linux-i2c+bounces-5204-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7E094B45A
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 02:57:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A13F21F2336A
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 00:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E348E2107;
	Thu,  8 Aug 2024 00:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FCUnoC3a"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53B720E6
	for <linux-i2c@vger.kernel.org>; Thu,  8 Aug 2024 00:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723078627; cv=none; b=djLsKtfEZShDLiuwTTakCu4MbIiAgjBg/aiGwWXQRrrzeviyugRoaRiITx3ld/svzhFw4R3n2q0Fsusxgu5XgkgctVqrazPld/zc2+EJsqGYY5eo95PHNmnaijDRzuiZ25ZGQ5uk1I44VAep73IFd3BHsug5jN+fr4G99zpkLz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723078627; c=relaxed/simple;
	bh=2qA1qL0vij8gRcNQ9YkjPvSUjzb12G6cOgLL9+bs/uE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=srLpOhFzvhtBBqGj35ilFFRUmnhZ46XKDH4T1Z8pUYo/VMPi7A8SezCmlD0ipy14r4RxHO4taBLd/S8bQLGspUUIB1mWn2wL+Jgmi0jB+5SUD9SmqlbdCobknQNBecHfBjBxPx6J85XNdGG3Jpg+Q6fQqvicYFhqtqPEDNkymPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FCUnoC3a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1152AC32781;
	Thu,  8 Aug 2024 00:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723078627;
	bh=2qA1qL0vij8gRcNQ9YkjPvSUjzb12G6cOgLL9+bs/uE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FCUnoC3aXHQc4HA47Qc22tBcqPyKqcWxSftyQfX6bz96Y1QDKEs/+IZUWTSqplxDj
	 0ECpS3Upb6JLlCln7euZ916XL1MBVbHOK1f/ue4x1GSli3nHvTPhLWe7y/A0pyw3in
	 NTzMnHZM8uI1GDL30tggh3lhlJ/SmZJAl9x3zB0a59+btnwUR6Xz9VTpxsKJ8/B+xm
	 17Pdeh4+ZUHAohVa6YlmFi+1Kjs03rWJrkQS4SwFpWXO+gQYKnosdYp3OCZNy8StZT
	 ZNItSj7/pjkJJ8z0lArQolf/C/AMSIimu4dwa7i2trKep2w16Dbq3Ol47EsEM03f5o
	 4ZoQZ4VJNXj0Q==
Date: Thu, 8 Aug 2024 01:57:00 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Gerhard Engleder <gerhard@engleder-embedded.com>
Cc: linux-i2c@vger.kernel.org, Gerhard Engleder <eg@keba.com>
Subject: Re: [PATCH v4 1/1] i2c: keba: Add KEBA I2C controller support
Message-ID: <o2tdjhjty2rcdx37a27h6nwftqrmwcltvyuf5m7x5nixa2y3su@nry7t4h7ozi3>
References: <20240731192551.94035-1-gerhard@engleder-embedded.com>
 <20240731192551.94035-2-gerhard@engleder-embedded.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731192551.94035-2-gerhard@engleder-embedded.com>

Hi Gerhard,

...

> +	ret = readb_poll_timeout(ki2c->base + KI2C_STATUS_REG,
> +				 sts, (sts & KI2C_STATUS_IN_USE) == 0,
> +				 KI2C_INUSE_SLEEP_US, KI2C_INUSE_TIMEOUT_US);
> +	if (ret != 0)

if (ret)

> +		dev_warn(&ki2c->auxdev->auxdev.dev, "%s err!\n", __func__);

...

> +/*
> + * Resetting bus bitwise is done by checking SDA and applying clock cycles as
> + * long as SDA is low. 9 clock cycles are applied at most.
> + *
> + * Clock cycles are generated and ndelay() determines the duration of clock
> + * cycles. Generated clock rate is 100 KHz and so duration of both clock levels
> + * is: delay in ns = (10^6 / 100) / 2
> + */
> +#define KI2C_RECOVERY_CLK_CNT	9

we can have

   #define KI2C_RECOVERY_CLK_CNT	9 * 2

and...

> +#define KI2C_RECOVERY_NDELAY	5000

... use udelay()

   #define KI2C_RECOVERY_UDELAY	5

I think it's a bit easier to read later.

> +static int ki2c_reset_bus_bitwise(struct ki2c *ki2c)
> +{
> +	int count = 0;
> +	int val = 1;
> +	int ret = 0;
> +
> +	/* disable I2C controller (MEN = 0) to get direct access to SCL/SDA */
> +	iowrite8(0, ki2c->base + KI2C_CONTROL_REG);
> +
> +	/* generate clock cycles */
> +	ki2c_set_scl(ki2c, val);
> +	ndelay(KI2C_RECOVERY_NDELAY);
> +	while (count++ < KI2C_RECOVERY_CLK_CNT * 2) {

incrementing inside a while? sounds like a for :-)

for (count = 0; count++ < KI2C_RECOVERY_CLK_CNT * 2; count++)

> +		if (val) {

...

> +static int ki2c_repstart_addr(struct ki2c *ki2c, struct i2c_msg *m)
> +{
> +	int ret;
> +
> +	/* repeated start and write is not supported */
> +	if ((m->flags & I2C_M_RD) == 0) {
> +		dev_warn(&ki2c->auxdev->auxdev.dev,

you are returning an error but printing a warning. Should the
print level be aligned with the returning behaviour? Otherwise,
if this has a debugging purpose, just use dev_dbg().

> +			 "Repeated start not supported for writes\n");
> +		return -EINVAL;
> +	}
> +
> +	/* send repeated start */
> +	iowrite8(KI2C_CONTROL_MEN | KI2C_CONTROL_MSTA | KI2C_CONTROL_RSTA,
> +		 ki2c->base + KI2C_CONTROL_REG);
> +
> +	ret = ki2c_wait_for_mcf(ki2c);
> +	if (ret < 0) {
> +		dev_warn(&ki2c->auxdev->auxdev.dev,
> +			 "%s wait for MCF err at 0x%02x!\n", __func__, m->addr);
> +		return ret;
> +	}

...

> +	for (int i = 0; i < len; i++) {

please, do not declare inside the for(), it's strange that
checkpatch doesn't warn about this.

> +		ret = ki2c_wait_for_data(ki2c);
> +		if (ret < 0)
> +			return ret;
> +
> +		/* send tx-nack after transfer of last byte */
> +		if (i == len - 2)
> +			iowrite8(KI2C_CONTROL_MEN | KI2C_CONTROL_MSTA | KI2C_CONTROL_TXAK,
> +				 ki2c->base + KI2C_CONTROL_REG);
> +
> +		/*
> +		 * switch to TX on last byte, so that reading DATA-register
> +		 * does not trigger another read transfer.
> +		 */
> +		if (i == len - 1)

else if

> +			iowrite8(KI2C_CONTROL_MEN | KI2C_CONTROL_MSTA | KI2C_CONTROL_MTX,

...

> +	return (ret < 0) ? ret : num; 

no need for parenthesis here.

> +}

...

> +		unsigned short const addr_list[2] = { info[i].addr,
> +						      I2C_CLIENT_END };
> +
> +		client = i2c_new_scanned_device(&ki2c->adapter, &info[i],
> +						addr_list, NULL);

so this comes with a known client's list. Stupid question, have
you checked the address range is OK for this use?

> +		if (!IS_ERR(client)) {
> +			ki2c->client[i] = client;
> +		} else if (PTR_ERR(client) != -ENODEV) {

if you set here ki2c->client_size = i, you avoid unregistering
devices that are not registered... just a micro optimization, not
a binding comment.

> +			ki2c_unregister_devices(ki2c);

...

> +	/* reset bus before probing I2C devices */
> +	ret = ki2c_reset_bus(ki2c);
> +	if (ret)
> +		goto out;

We can still have the enabling and the reset at the end, I don't
seen any interaction with the hardware.

> +	ret = devm_i2c_add_adapter(dev, adap);
> +	if (ret) {
> +		dev_err(dev, "Failed to add adapter (%d)!\n", ret);
> +		goto out;
> +	}
> +
> +	ret = ki2c_register_devices(ki2c);
> +	if (ret) {
> +		dev_err(dev, "Failed to register devices (%d)!\n", ret);
> +		goto out;
> +	}
> +
> +	return 0;
> +
> +out:
> +	iowrite8(KI2C_CONTROL_DISABLE, ki2c->base + KI2C_CONTROL_REG);
> +	return ret;
> +}

...

> +static const struct auxiliary_device_id ki2c_devtype_aux[] = {
> +	{ .name = "keba.i2c" },
> +	{ },

Please, remove the comma here, there has been recently a patch
from Wolfram doing it on all the i2c drivers[*]

Thanks,
Andi

[*] 11bfff4913e4 ("i2c: don't use ',' after delimiters")


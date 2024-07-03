Return-Path: <linux-i2c+bounces-4617-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CF8926B43
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2024 00:09:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A6B71C20A46
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2024 22:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C00B213BADF;
	Wed,  3 Jul 2024 22:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R9L37B3v"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E9613C8EE
	for <linux-i2c@vger.kernel.org>; Wed,  3 Jul 2024 22:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720044591; cv=none; b=RxEcT25+YKzaIaIvWLZicpJnV7S+Bodaa0kEdW/tIaKbeiCDkRFAs+4vCHt1pvZs+R7lnqfN3/0KlQ4niopaglbna+OlR18JLUMRJ187PFKxqVJ7Owpze6hdy87o+UW63rasJgQMgHpG2ezfH46kdt5s+HvWFP0aWP4pMWc3idY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720044591; c=relaxed/simple;
	bh=3Y0NTNX9GIqwdcPbSysG5bU9YXDTDtqoA1ozVv0yjqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lg0QkG4ulSiJQzJoyt93C5c8uuaNIFAKe3l1ohtfvUqR1Ckw8tZ7DL8vPJz4N3wN6Sh6Em+AzgabhgjYTyVhCVdbztF1rXMQWmNgKULoqGLYuqc8MMNK93AWerLB5YNieKLq5QlhE01rz5f4Ab2FRG+Kq1SqJB5jd0x8exKsM1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R9L37B3v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0A03C2BD10;
	Wed,  3 Jul 2024 22:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720044591;
	bh=3Y0NTNX9GIqwdcPbSysG5bU9YXDTDtqoA1ozVv0yjqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R9L37B3v7NVruSnOpNl0DVigw2FtGs3qNvXyihaW9CSMw+0haPuKUkrcBq7KVSx23
	 /UMQaQQyN7/fwvG9t0WjdBhlE0JgIygCAF2O6YThPX/7W1f0Z653w34Kp7a+kdg5by
	 JxnEmLAFTRo884N+kyxjJmuPnI2AaT4j9W3GfrsKQ4PadbH2VwMq3lDVYIcreeRAEH
	 EQrmzFS1jGmexRWQxCOIFZghnhjp8XPXhpcARc0XhnGdPPMvTSV6M0EkZjWxZm/3jM
	 MTilJ252mNWTGqgdSu0+KcaXv04GIxEXexK2ft7q+3VmghVWaNoNY7fCe62WLL6O2I
	 jv3kpM82hG1gw==
Date: Thu, 4 Jul 2024 00:09:47 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Gerhard Engleder <gerhard@engleder-embedded.com>
Cc: linux-i2c@vger.kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, 
	Gerhard Engleder <eg@keba.com>
Subject: Re: [PATCH v2 2/2] i2c: keba: Add KEBA I2C controller support
Message-ID: <g3mjcdzl7fm5d2aimr5vb7ltzt6qrcepsblffmwjrgrjir7mld@n54s76dc2scz>
References: <20240630194740.7137-1-gerhard@engleder-embedded.com>
 <20240630194740.7137-3-gerhard@engleder-embedded.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240630194740.7137-3-gerhard@engleder-embedded.com>

Hi Gerhard,

...

> +static int ki2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
> +{
> +	struct ki2c *ki2c = i2c_get_adapdata(adap);
> +	int ret;
> +
> +	ret = ki2c_inuse_lock(ki2c);
> +	if (ret < 0)
> +		return ret;
> +
> +	for (int i = 0; i < num; i++) {
> +		struct i2c_msg *m = &msgs[i];
> +
> +		if (i == 0)
> +			ret = ki2c_start_addr(ki2c, m);

do we want to keep the error if we fail to receive the data ack?

> +		else
> +			ret = ki2c_repstart_addr(ki2c, m);
> +		if (ret < 0)
> +			break;
> +
> +		if (m->flags & I2C_M_RD)
> +			ret = ki2c_read(ki2c, m->buf, m->len);
> +		else
> +			ret = ki2c_write(ki2c, m->buf, m->len);
> +		if (ret < 0)
> +			break;
> +	}
> +
> +	ki2c_stop(ki2c);
> +
> +	ki2c_inuse_unlock(ki2c);
> +
> +	return (ret < 0) ? ret : num;
> +}
> +
> +static void ki2c_unregister_devices(struct ki2c *ki2c)
> +{
> +	for (int i = 0; i < ki2c->client_size; i++) {
> +		struct i2c_client *client = ki2c->client[i];
> +
> +		if (client)
> +			i2c_unregister_device(client);
> +	}
> +}
> +
> +static int ki2c_register_devices(struct ki2c *ki2c)
> +{
> +	struct i2c_board_info *info = ki2c->auxdev->info;
> +
> +	/* register all I2C devices from platform_data array */
> +	for (int i = 0; i < ki2c->client_size; i++) {

Please declare the variable at the beginning of the function.

Did you run checkpatch.pl before sending?

> +		struct i2c_client *client;
> +		unsigned short const addr_list[2] = { info[i].addr,
> +						      I2C_CLIENT_END };
> +
> +		client = i2c_new_scanned_device(&ki2c->adapter, &info[i],
> +						addr_list, NULL);
> +		if (!IS_ERR(client)) {
> +			ki2c->client[i] = client;
> +		} else if (PTR_ERR(client) != -ENODEV) {
> +			ki2c_unregister_devices(ki2c);
> +
> +			return PTR_ERR(client);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static u32 ki2c_func(struct i2c_adapter *adap)
> +{
> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> +}
> +
> +static const struct i2c_algorithm ki2c_algo = {
> +	.master_xfer   = ki2c_xfer,
> +	.functionality = ki2c_func,
> +};
> +
> +static int ki2c_probe(struct auxiliary_device *auxdev,
> +		      const struct auxiliary_device_id *id)
> +{
> +	struct device *dev = &auxdev->dev;
> +	struct i2c_adapter *adap;
> +	struct ki2c *ki2c;
> +	int ret;
> +
> +	ki2c = devm_kzalloc(dev, sizeof(*ki2c), GFP_KERNEL);
> +	if (!ki2c)
> +		return -ENOMEM;
> +	ki2c->auxdev = container_of(auxdev, struct keba_i2c_auxdev, auxdev);
> +	ki2c->client = devm_kcalloc(dev, ki2c->auxdev->info_size,
> +				    sizeof(*ki2c->client), GFP_KERNEL);
> +	if (!ki2c->client)
> +		return -ENOMEM;
> +	ki2c->client_size = ki2c->auxdev->info_size;
> +	auxiliary_set_drvdata(auxdev, ki2c);
> +
> +	ki2c->base = devm_ioremap_resource(dev, &ki2c->auxdev->io);
> +	if (IS_ERR(ki2c->base))
> +		return PTR_ERR(ki2c->base);
> +
> +	/* enable controller */
> +	iowrite8(KI2C_CONTROL_MEN, ki2c->base + KI2C_CONTROL_REG);

Can we enable at the end? What's the point for enabling the
device so early? (We also save a few goto's)

> +	adap = &ki2c->adapter;
> +	strscpy(adap->name, "KEBA I2C adapter", sizeof(adap->name));
> +	adap->owner = THIS_MODULE;
> +	adap->class = I2C_CLASS_HWMON;
> +	adap->algo = &ki2c_algo;
> +	adap->dev.parent = dev;
> +
> +	i2c_set_adapdata(adap, ki2c);
> +
> +	/* reset bus before probing I2C devices */
> +	ret = ki2c_reset_bus(ki2c);
> +	if (ret)
> +		goto out_disable;
> +
> +	ret = i2c_add_adapter(adap);

Please use devm_i2c_add_adapter()

> +	if (ret) {
> +		dev_err(dev, "Failed to add adapter (%d)!\n", ret);
> +		goto out_disable;
> +	}
> +
> +	ret = ki2c_register_devices(ki2c);
> +	if (ret) {
> +		dev_err(dev, "Failed to register devices (%d)!\n", ret);
> +		goto out_delete;
> +	}
> +
> +	return 0;
> +
> +out_delete:
> +	i2c_del_adapter(adap);
> +out_disable:
> +	iowrite8(0, ki2c->base + KI2C_CONTROL_REG);

Can we define Value '0'? KI2C_CONTROL_DISABLE, perhaps?

Andi

> +	return ret;
> +}
> +
> +static void ki2c_remove(struct auxiliary_device *auxdev)
> +{
> +	struct ki2c *ki2c = auxiliary_get_drvdata(auxdev);
> +
> +	ki2c_unregister_devices(ki2c);
> +
> +	i2c_del_adapter(&ki2c->adapter);
> +
> +	/* disable controller */
> +	iowrite8(0, ki2c->base + KI2C_CONTROL_REG);
> +
> +	auxiliary_set_drvdata(auxdev, NULL);
> +}
> +
> +static const struct auxiliary_device_id ki2c_devtype_aux[] = {
> +	{ .name = "keba.i2c" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(auxiliary, ki2c_devtype_aux);
> +
> +static struct auxiliary_driver ki2c_driver_aux = {
> +	.name = KI2C,
> +	.id_table = ki2c_devtype_aux,
> +	.probe = ki2c_probe,
> +	.remove = ki2c_remove,
> +};
> +module_auxiliary_driver(ki2c_driver_aux);
> +
> +MODULE_AUTHOR("Gerhard Engleder <eg@keba.com>");
> +MODULE_DESCRIPTION("KEBA I2C bus controller driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.39.2
> 


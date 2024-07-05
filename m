Return-Path: <linux-i2c+bounces-4665-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BB8928D36
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2024 19:58:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4820228468D
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2024 17:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D076516DEA4;
	Fri,  5 Jul 2024 17:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b="mF8iNNA9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx13lb.world4you.com (mx13lb.world4you.com [81.19.149.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D963816D9DA
	for <linux-i2c@vger.kernel.org>; Fri,  5 Jul 2024 17:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.149.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720202318; cv=none; b=aQ91i5Thua7k9f2VZ0QSPDXY5n+ITN4bUSudVwbMmciwfIhGcWrdyCHn82in3alzDSUe0ObRjgYhzmzLjB1gMG5/632zC5jGK9MBpymscOMqArh5073QcTMRaZZKhCL/dfZfNLDenVgfFormRrCecLzlsWWlqL7rMuDDaI4NrLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720202318; c=relaxed/simple;
	bh=xI6gVjCXhJ2ajCg4ZM0+Jsx5i4SAjR0yM2dkWVZ78iY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qc2cLHv76DklnNBiXlDqXa826LIZPb3Zu0MTPDhVsslT9uzzpwIWS25BqDmxs4BEXJUpt4h1pD9TEjNE+oqnfm3TEvLyF0IP7mBFsHWlCaDzdDMrlaYhrtFQ8GbRpYePLi7jIuq8auBc/Hd8aOXGwgpZFjCijMhqZX530bxGlYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com; spf=pass smtp.mailfrom=engleder-embedded.com; dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b=mF8iNNA9; arc=none smtp.client-ip=81.19.149.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=engleder-embedded.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=engleder-embedded.com; s=dkim11; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OSCtun3MQ9PCzlqjJsZ4kACB7fJa75HxsNZxgTMBPpA=; b=mF8iNNA9Z98okL7VtmFQTZpTwp
	hl6SVbYGpJkRCDdzXRzqK4wtCsnCc1OsXmMw9VzQW41+9i7Wtm4MPZOWoRZS5RM7Ij0JJejbmyJYT
	8678ZgSQojVQjJjVTvTC/X8a9lcC0mZQ9cwMFRRAZ3X8dEMaRY0Z/UCTDW5oAqysanyA=;
Received: from [88.117.61.57] (helo=[10.0.0.160])
	by mx13lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <gerhard@engleder-embedded.com>)
	id 1sPmLl-0005XB-2u;
	Fri, 05 Jul 2024 19:03:58 +0200
Message-ID: <6021ab78-4d31-42d0-a3a8-ca1e54173618@engleder-embedded.com>
Date: Fri, 5 Jul 2024 19:03:56 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] i2c: keba: Add KEBA I2C controller support
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 Gerhard Engleder <eg@keba.com>
References: <20240630194740.7137-1-gerhard@engleder-embedded.com>
 <20240630194740.7137-3-gerhard@engleder-embedded.com>
 <g3mjcdzl7fm5d2aimr5vb7ltzt6qrcepsblffmwjrgrjir7mld@n54s76dc2scz>
Content-Language: en-US
From: Gerhard Engleder <gerhard@engleder-embedded.com>
In-Reply-To: <g3mjcdzl7fm5d2aimr5vb7ltzt6qrcepsblffmwjrgrjir7mld@n54s76dc2scz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AV-Do-Run: Yes

On 04.07.24 00:09, Andi Shyti wrote:
> Hi Gerhard,

Hi Andi,

> 
> ...
> 
>> +static int ki2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
>> +{
>> +	struct ki2c *ki2c = i2c_get_adapdata(adap);
>> +	int ret;
>> +
>> +	ret = ki2c_inuse_lock(ki2c);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	for (int i = 0; i < num; i++) {
>> +		struct i2c_msg *m = &msgs[i];
>> +
>> +		if (i == 0)
>> +			ret = ki2c_start_addr(ki2c, m);
> 
> do we want to keep the error if we fail to receive the data ack?

Yes that is intended. Is there something wrong with forwarding the
error?

> 
>> +		else
>> +			ret = ki2c_repstart_addr(ki2c, m);
>> +		if (ret < 0)
>> +			break;
>> +
>> +		if (m->flags & I2C_M_RD)
>> +			ret = ki2c_read(ki2c, m->buf, m->len);
>> +		else
>> +			ret = ki2c_write(ki2c, m->buf, m->len);
>> +		if (ret < 0)
>> +			break;
>> +	}
>> +
>> +	ki2c_stop(ki2c);
>> +
>> +	ki2c_inuse_unlock(ki2c);
>> +
>> +	return (ret < 0) ? ret : num;
>> +}
>> +
>> +static void ki2c_unregister_devices(struct ki2c *ki2c)
>> +{
>> +	for (int i = 0; i < ki2c->client_size; i++) {
>> +		struct i2c_client *client = ki2c->client[i];
>> +
>> +		if (client)
>> +			i2c_unregister_device(client);
>> +	}
>> +}
>> +
>> +static int ki2c_register_devices(struct ki2c *ki2c)
>> +{
>> +	struct i2c_board_info *info = ki2c->auxdev->info;
>> +
>> +	/* register all I2C devices from platform_data array */
>> +	for (int i = 0; i < ki2c->client_size; i++) {
> 
> Please declare the variable at the beginning of the function.
> 
> Did you run checkpatch.pl before sending?

Yes, multiple times, but it did not trigger. I will fix that
declaration.

>> +		struct i2c_client *client;
>> +		unsigned short const addr_list[2] = { info[i].addr,
>> +						      I2C_CLIENT_END };
>> +
>> +		client = i2c_new_scanned_device(&ki2c->adapter, &info[i],
>> +						addr_list, NULL);
>> +		if (!IS_ERR(client)) {
>> +			ki2c->client[i] = client;
>> +		} else if (PTR_ERR(client) != -ENODEV) {
>> +			ki2c_unregister_devices(ki2c);
>> +
>> +			return PTR_ERR(client);
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static u32 ki2c_func(struct i2c_adapter *adap)
>> +{
>> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
>> +}
>> +
>> +static const struct i2c_algorithm ki2c_algo = {
>> +	.master_xfer   = ki2c_xfer,
>> +	.functionality = ki2c_func,
>> +};
>> +
>> +static int ki2c_probe(struct auxiliary_device *auxdev,
>> +		      const struct auxiliary_device_id *id)
>> +{
>> +	struct device *dev = &auxdev->dev;
>> +	struct i2c_adapter *adap;
>> +	struct ki2c *ki2c;
>> +	int ret;
>> +
>> +	ki2c = devm_kzalloc(dev, sizeof(*ki2c), GFP_KERNEL);
>> +	if (!ki2c)
>> +		return -ENOMEM;
>> +	ki2c->auxdev = container_of(auxdev, struct keba_i2c_auxdev, auxdev);
>> +	ki2c->client = devm_kcalloc(dev, ki2c->auxdev->info_size,
>> +				    sizeof(*ki2c->client), GFP_KERNEL);
>> +	if (!ki2c->client)
>> +		return -ENOMEM;
>> +	ki2c->client_size = ki2c->auxdev->info_size;
>> +	auxiliary_set_drvdata(auxdev, ki2c);
>> +
>> +	ki2c->base = devm_ioremap_resource(dev, &ki2c->auxdev->io);
>> +	if (IS_ERR(ki2c->base))
>> +		return PTR_ERR(ki2c->base);
>> +
>> +	/* enable controller */
>> +	iowrite8(KI2C_CONTROL_MEN, ki2c->base + KI2C_CONTROL_REG);
> 
> Can we enable at the end? What's the point for enabling the
> device so early? (We also save a few goto's)

You are right, I will enable it as late as possible.

>> +	adap = &ki2c->adapter;
>> +	strscpy(adap->name, "KEBA I2C adapter", sizeof(adap->name));
>> +	adap->owner = THIS_MODULE;
>> +	adap->class = I2C_CLASS_HWMON;
>> +	adap->algo = &ki2c_algo;
>> +	adap->dev.parent = dev;
>> +
>> +	i2c_set_adapdata(adap, ki2c);
>> +
>> +	/* reset bus before probing I2C devices */
>> +	ret = ki2c_reset_bus(ki2c);
>> +	if (ret)
>> +		goto out_disable;
>> +
>> +	ret = i2c_add_adapter(adap);
> 
> Please use devm_i2c_add_adapter()

Another devm_ function I was not aware of. I will use it. Thanks
for the advice!

>> +	if (ret) {
>> +		dev_err(dev, "Failed to add adapter (%d)!\n", ret);
>> +		goto out_disable;
>> +	}
>> +
>> +	ret = ki2c_register_devices(ki2c);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to register devices (%d)!\n", ret);
>> +		goto out_delete;
>> +	}
>> +
>> +	return 0;
>> +
>> +out_delete:
>> +	i2c_del_adapter(adap);
>> +out_disable:
>> +	iowrite8(0, ki2c->base + KI2C_CONTROL_REG);
> 
> Can we define Value '0'? KI2C_CONTROL_DISABLE, perhaps?

Will be done.

Shall both patches go over i2c-host-next or over char-misc?

Thank you for the review!

Gerhard

>> +	return ret;
>> +}
>> +
>> +static void ki2c_remove(struct auxiliary_device *auxdev)
>> +{
>> +	struct ki2c *ki2c = auxiliary_get_drvdata(auxdev);
>> +
>> +	ki2c_unregister_devices(ki2c);
>> +
>> +	i2c_del_adapter(&ki2c->adapter);
>> +
>> +	/* disable controller */
>> +	iowrite8(0, ki2c->base + KI2C_CONTROL_REG);
>> +
>> +	auxiliary_set_drvdata(auxdev, NULL);
>> +}
>> +
>> +static const struct auxiliary_device_id ki2c_devtype_aux[] = {
>> +	{ .name = "keba.i2c" },
>> +	{ },
>> +};
>> +MODULE_DEVICE_TABLE(auxiliary, ki2c_devtype_aux);
>> +
>> +static struct auxiliary_driver ki2c_driver_aux = {
>> +	.name = KI2C,
>> +	.id_table = ki2c_devtype_aux,
>> +	.probe = ki2c_probe,
>> +	.remove = ki2c_remove,
>> +};
>> +module_auxiliary_driver(ki2c_driver_aux);
>> +
>> +MODULE_AUTHOR("Gerhard Engleder <eg@keba.com>");
>> +MODULE_DESCRIPTION("KEBA I2C bus controller driver");
>> +MODULE_LICENSE("GPL");
>> -- 
>> 2.39.2
>>


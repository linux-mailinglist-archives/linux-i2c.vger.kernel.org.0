Return-Path: <linux-i2c+bounces-5229-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DD694C5F9
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 22:51:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3810DB2125E
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 20:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 880C415A842;
	Thu,  8 Aug 2024 20:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b="B9M3psLV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx15lb.world4you.com (mx15lb.world4you.com [81.19.149.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74949157466
	for <linux-i2c@vger.kernel.org>; Thu,  8 Aug 2024 20:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.149.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723150306; cv=none; b=rCaEH1Mr+lVYBX6MMn+vpBbzSp7QqaYNgtCVtrYy2sZRgywA5LvmSnWbf0VSZcGnxSOWaRGXZMBQoSoodE1OWnj85nd3gO/zRX0f8o8SMIEhMWUNW29jZG9KJ2hQ0xAc/ROa6SCYonrpGICIC/VN8JuVaN9E3CtKhXry1TTGkl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723150306; c=relaxed/simple;
	bh=eQHjO1eszNZWum7MQIECl7uY1tB+xlVUy7g8ZeYyTnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bphzj0o08X/znJSoGVsPRTF99oWdPvTzu/wk/NHxpndSore3vznr6vjj2C7IzKPshxTf5WEPszbKPGXCLEaip9JszschMG+4p33JAhFcOqmXghuvpd2ZrrjOv119X9geeiKXmu2+pl23F4QnDo1AV4uByUNkDvEOdVI0QSebNJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com; spf=pass smtp.mailfrom=engleder-embedded.com; dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b=B9M3psLV; arc=none smtp.client-ip=81.19.149.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=engleder-embedded.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=engleder-embedded.com; s=dkim11; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ACYVR+NnKZASeuwhco4cpQA/Kl1vYk4ssanwCRtjxmM=; b=B9M3psLVJtLgYI221mIkmSfptL
	AUxx1TUvozW9Ewdy0ZiJd3AalSo+2vFFvqcj9cY++WDP6NQXHEqdjp4Q/TJ7R4d3OzutzMhMpeM/l
	lPvYgd1n/DC2Coq9QkBlOERIS/U+xfFna4kv0aN+KHLraNdrQx2b4Xq5H0xTCFvwbI1Q=;
Received: from [88.117.63.232] (helo=[10.0.0.160])
	by mx15lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <gerhard@engleder-embedded.com>)
	id 1sc9UL-0001r1-28;
	Thu, 08 Aug 2024 22:11:57 +0200
Message-ID: <41887048-b534-4ad7-91fd-5e8afb76e554@engleder-embedded.com>
Date: Thu, 8 Aug 2024 22:11:56 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] i2c: keba: Add KEBA I2C controller support
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, Gerhard Engleder <eg@keba.com>
References: <20240731192551.94035-1-gerhard@engleder-embedded.com>
 <20240731192551.94035-2-gerhard@engleder-embedded.com>
 <o2tdjhjty2rcdx37a27h6nwftqrmwcltvyuf5m7x5nixa2y3su@nry7t4h7ozi3>
Content-Language: en-US
From: Gerhard Engleder <gerhard@engleder-embedded.com>
In-Reply-To: <o2tdjhjty2rcdx37a27h6nwftqrmwcltvyuf5m7x5nixa2y3su@nry7t4h7ozi3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AV-Do-Run: Yes

On 08.08.24 02:57, Andi Shyti wrote:
> Hi Gerhard,

Hi Andi,

> 
> ...
> 
>> +	ret = readb_poll_timeout(ki2c->base + KI2C_STATUS_REG,
>> +				 sts, (sts & KI2C_STATUS_IN_USE) == 0,
>> +				 KI2C_INUSE_SLEEP_US, KI2C_INUSE_TIMEOUT_US);
>> +	if (ret != 0)
> 
> if (ret)

Done.

> 
>> +		dev_warn(&ki2c->auxdev->auxdev.dev, "%s err!\n", __func__);
> 
> ...
> 
>> +/*
>> + * Resetting bus bitwise is done by checking SDA and applying clock cycles as
>> + * long as SDA is low. 9 clock cycles are applied at most.
>> + *
>> + * Clock cycles are generated and ndelay() determines the duration of clock
>> + * cycles. Generated clock rate is 100 KHz and so duration of both clock levels
>> + * is: delay in ns = (10^6 / 100) / 2
>> + */
>> +#define KI2C_RECOVERY_CLK_CNT	9
> 
> we can have
> 
>     #define KI2C_RECOVERY_CLK_CNT	9 * 2

Done.

> 
> and...
> 
>> +#define KI2C_RECOVERY_NDELAY	5000
> 
> ... use udelay()
> 
>     #define KI2C_RECOVERY_UDELAY	5
> 
> I think it's a bit easier to read later.

Done.

> 
>> +static int ki2c_reset_bus_bitwise(struct ki2c *ki2c)
>> +{
>> +	int count = 0;
>> +	int val = 1;
>> +	int ret = 0;
>> +
>> +	/* disable I2C controller (MEN = 0) to get direct access to SCL/SDA */
>> +	iowrite8(0, ki2c->base + KI2C_CONTROL_REG);
>> +
>> +	/* generate clock cycles */
>> +	ki2c_set_scl(ki2c, val);
>> +	ndelay(KI2C_RECOVERY_NDELAY);
>> +	while (count++ < KI2C_RECOVERY_CLK_CNT * 2) {
> 
> incrementing inside a while? sounds like a for :-)
> 
> for (count = 0; count++ < KI2C_RECOVERY_CLK_CNT * 2; count++)

Done.

> 
>> +		if (val) {
> 
> ...
> 
>> +static int ki2c_repstart_addr(struct ki2c *ki2c, struct i2c_msg *m)
>> +{
>> +	int ret;
>> +
>> +	/* repeated start and write is not supported */
>> +	if ((m->flags & I2C_M_RD) == 0) {
>> +		dev_warn(&ki2c->auxdev->auxdev.dev,
> 
> you are returning an error but printing a warning. Should the
> print level be aligned with the returning behaviour? Otherwise,
> if this has a debugging purpose, just use dev_dbg().

You are right, changed all dev_warn() to dev_err().

> 
>> +			 "Repeated start not supported for writes\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	/* send repeated start */
>> +	iowrite8(KI2C_CONTROL_MEN | KI2C_CONTROL_MSTA | KI2C_CONTROL_RSTA,
>> +		 ki2c->base + KI2C_CONTROL_REG);
>> +
>> +	ret = ki2c_wait_for_mcf(ki2c);
>> +	if (ret < 0) {
>> +		dev_warn(&ki2c->auxdev->auxdev.dev,
>> +			 "%s wait for MCF err at 0x%02x!\n", __func__, m->addr);
>> +		return ret;
>> +	}
> 
> ...
> 
>> +	for (int i = 0; i < len; i++) {
> 
> please, do not declare inside the for(), it's strange that
> checkpatch doesn't warn about this.

Done for all for loops.

> 
>> +		ret = ki2c_wait_for_data(ki2c);
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		/* send tx-nack after transfer of last byte */
>> +		if (i == len - 2)
>> +			iowrite8(KI2C_CONTROL_MEN | KI2C_CONTROL_MSTA | KI2C_CONTROL_TXAK,
>> +				 ki2c->base + KI2C_CONTROL_REG);
>> +
>> +		/*
>> +		 * switch to TX on last byte, so that reading DATA-register
>> +		 * does not trigger another read transfer.
>> +		 */
>> +		if (i == len - 1)
> 
> else if

Done.

> 
>> +			iowrite8(KI2C_CONTROL_MEN | KI2C_CONTROL_MSTA | KI2C_CONTROL_MTX,
> 
> ...
> 
>> +	return (ret < 0) ? ret : num;
> 
> no need for parenthesis here.

Done.

> 
>> +}
> 
> ...
> 
>> +		unsigned short const addr_list[2] = { info[i].addr,
>> +						      I2C_CLIENT_END };
>> +
>> +		client = i2c_new_scanned_device(&ki2c->adapter, &info[i],
>> +						addr_list, NULL);
> 
> so this comes with a known client's list. Stupid question, have
> you checked the address range is OK for this use?

Yes, the addresses are 0x4c (EMC1403) and 0x50 to 0x56 (EEPROMs).
All between 0x08 and 0x77. All devices are working/found.

> 
>> +		if (!IS_ERR(client)) {
>> +			ki2c->client[i] = client;
>> +		} else if (PTR_ERR(client) != -ENODEV) {
> 
> if you set here ki2c->client_size = i, you avoid unregistering
> devices that are not registered... just a micro optimization, not
> a binding comment.

Done.

> 
>> +			ki2c_unregister_devices(ki2c);
> 
> ...
> 
>> +	/* reset bus before probing I2C devices */
>> +	ret = ki2c_reset_bus(ki2c);
>> +	if (ret)
>> +		goto out;
> 
> We can still have the enabling and the reset at the end, I don't
> seen any interaction with the hardware.

At least ki2c_register_device() does interact with the hardware. It uses
i2c_new_scanned_device() which probes the devices.

IMHO the device shall be ready to operate when devm_i2c_add_adapter()
is called. Because the user space can trigger I2C action as soon as
devm_i2c_add_adapter() is done. So enabling and reset after
devm_i2c_add_adapter() would be a potential race against user space I2C
actions. Is that correct?

> 
>> +	ret = devm_i2c_add_adapter(dev, adap);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to add adapter (%d)!\n", ret);
>> +		goto out;
>> +	}
>> +
>> +	ret = ki2c_register_devices(ki2c);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to register devices (%d)!\n", ret);
>> +		goto out;
>> +	}
>> +
>> +	return 0;
>> +
>> +out:
>> +	iowrite8(KI2C_CONTROL_DISABLE, ki2c->base + KI2C_CONTROL_REG);
>> +	return ret;
>> +}
> 
> ...
> 
>> +static const struct auxiliary_device_id ki2c_devtype_aux[] = {
>> +	{ .name = "keba.i2c" },
>> +	{ },
> 
> Please, remove the comma here, there has been recently a patch
> from Wolfram doing it on all the i2c drivers[*]

Done.

> 
> Thanks,
> Andi
> 
> [*] 11bfff4913e4 ("i2c: don't use ',' after delimiters")

Thank you for your detailed review!

Gerhard


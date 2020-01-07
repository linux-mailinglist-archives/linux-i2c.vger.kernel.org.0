Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A26DF13231C
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 10:59:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbgAGJ7T (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 04:59:19 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40876 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbgAGJ7T (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jan 2020 04:59:19 -0500
Received: by mail-wr1-f67.google.com with SMTP id c14so53170411wrn.7
        for <linux-i2c@vger.kernel.org>; Tue, 07 Jan 2020 01:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bingham-xyz.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5dN5j1s+O74jbclZ918U/f2zpMTLkf//0uNcuYQoj74=;
        b=05EXc/D2H6xzU53xCDBw1UanXVI1fpQ7YHDlLV5hLop2jiNxsv6GhSUTdB/tusbPvT
         ozZS0qy0WlTBhvZk6nZU2dUTNN2WvNGKBgpwdP1Jn0bk6TsMIOk9/YhObd5j0obqmLCt
         l0ksfSleoxVfBEWcUfhnUAvJikROzlx7cf41EX5ya4osGJ3zsDhf4XhvhxQCWZArVs09
         5wfF2oFYf9nPr8kvmyE/MCujaCrRtVKYK41OMfhSk6WFbJoN2bEuUCoRClp0y7gJfQwD
         Gvv3KBMYzTXOuRGQTqx9r5lU/DH9clSboa9krGTqaHXZ56PX1vYS3kRl4t5SB08Erxh7
         37sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=5dN5j1s+O74jbclZ918U/f2zpMTLkf//0uNcuYQoj74=;
        b=t7ocxANdiByx7ENx5MNrvIQSGvD/H/wx+oUWQyOwWILnb69eD99TRGoUsDQYOoywMB
         ji58F2ynpNpOqRd7xWn49LuoSqbnT/E7+c1lIUhQMEZkg6wW2MFMRIxR5fUE4XowN8GF
         L/zrz5tabyKlA5XdNk7DuUc01BlOSpyBQf5iy/8PRGUP3nZE1GyAkWh5VQDSlJbk7ZgB
         otpFWYD57ZCfxN6WEupck0pABp8RAvcKJcUA6r1pQ8ae27RDMKiu5CdWlJ8vyM+Y/L9Z
         Cs1TPtIMCo5P92Ck5SjtTGVkILSaoXHYT2z4Euau+sZrOIr6Iw1fqdJnoDkiuEwVz/uE
         lIJg==
X-Gm-Message-State: APjAAAWPji371+LqFErLINZ6MHWtT3lNWLtgwEscBpxCZTTm78u6uIkK
        ZVd+umiV74cwPJr7B/Nsohw2Mw==
X-Google-Smtp-Source: APXvYqxha9W9MYwzmIfRm/tRlXlT+jfFdnlfbsZvj3BHQ/x80M75dTHBNCVDDSm4ct2QHtWqzp/90Q==
X-Received: by 2002:a5d:65cf:: with SMTP id e15mr110426976wrw.126.1578391156747;
        Tue, 07 Jan 2020 01:59:16 -0800 (PST)
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net. [86.31.129.233])
        by smtp.gmail.com with ESMTPSA id d16sm81343362wrg.27.2020.01.07.01.59.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Jan 2020 01:59:16 -0800 (PST)
Subject: Re: [RFC PATCH 4/5] i2c: core: add simple caching to the 'alias'
 scanning
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>
References: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
 <20191231161400.1688-5-wsa+renesas@sang-engineering.com>
From:   Kieran Bingham <kieran@ksquared.org.uk>
Openpgp: preference=signencrypt
Autocrypt: addr=kieran@bingham.xyz; keydata=
 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
 QglrIkyNWSZm4Hhw98VxYDwOwmYhoXmAFg==
Message-ID: <3308e0c2-34be-0675-1c9a-3fcf6620ed91@bingham.xyz>
Date:   Tue, 7 Jan 2020 09:59:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191231161400.1688-5-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 31/12/2019 16:13, Wolfram Sang wrote:
> Add some simple caching of the last used alias to skip some unneeded
> scanning of the I2C bus. When freeing the device, the cache will be set
> back.

Seems simplistic enough and would do the job, given the current
implementation...

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/i2c-core-base.c | 15 ++++++++++++++-
>  include/linux/i2c.h         |  2 ++
>  2 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 5a010e7e698f..0cc4a5c49a15 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -830,6 +830,8 @@ EXPORT_SYMBOL_GPL(i2c_new_device);
>   */
>  void i2c_unregister_device(struct i2c_client *client)
>  {
> +	struct i2c_adapter *adap = client->adapter;
> +
>  	if (IS_ERR_OR_NULL(client))
>  		return;
>  
> @@ -840,6 +842,14 @@ void i2c_unregister_device(struct i2c_client *client)
>  
>  	if (ACPI_COMPANION(&client->dev))
>  		acpi_device_clear_enumerated(ACPI_COMPANION(&client->dev));
> +
> +	i2c_lock_bus(adap, I2C_LOCK_SEGMENT);
> +
> +	if (client->flags & I2C_CLIENT_ALIAS && client->addr < adap->alias_idx)

Phew, I thought on the first read we were going to end up shrinking the
available alias pool when we unregister devices with high addresses, (I
missed the client->addr < adap->alias_idx statement first)


> +		adap->alias_idx = client->addr;
> +
> +	i2c_unlock_bus(adap, I2C_LOCK_SEGMENT);
> +
>  	device_unregister(&client->dev);
>  }
>  EXPORT_SYMBOL_GPL(i2c_unregister_device);
> @@ -1297,6 +1307,7 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
>  		adap->lock_ops = &i2c_adapter_lock_ops;
>  
>  	adap->locked_flags = 0;
> +	adap->alias_idx = 0x08;	/* first valid I2C address */
>  	rt_mutex_init(&adap->bus_lock);
>  	rt_mutex_init(&adap->mux_lock);
>  	mutex_init(&adap->userspace_clients_lock);
> @@ -2249,10 +2260,12 @@ struct i2c_client *i2c_new_alias_device(struct i2c_adapter *adap)
>  
>  	i2c_lock_bus(adap, I2C_LOCK_SEGMENT);
>  
> -	for (addr = 0x08; addr < 0x78; addr++) {
> +	for (addr = adap->alias_idx; addr < 0x78; addr++) {
>  		ret = i2c_scan_for_client(adap, addr, i2c_unlocked_read_byte_probe);
>  		if (ret == -ENODEV) {
>  			alias = i2c_new_dummy_device(adap, addr);
> +			alias->flags |= I2C_CLIENT_ALIAS;

Potential here for a comment to clarify the alias_idx, but it's not
required:

			/* Prevent re-scanning occupied addresses */
> +			adap->alias_idx = addr + 1;
>  			dev_dbg(&adap->dev, "Found alias: 0x%x\n", addr);
>  			break;
>  		}
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 583ca2aec022..6427c2db5ee0 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -309,6 +309,7 @@ struct i2c_driver {
>  struct i2c_client {
>  	unsigned short flags;		/* div., see below		*/
>  #define I2C_CLIENT_PEC		0x04	/* Use Packet Error Checking */
> +#define I2C_CLIENT_ALIAS	0x08	/* client is an alias */
>  #define I2C_CLIENT_TEN		0x10	/* we have a ten bit chip address */

Unrelated to this patch, but I love that the flag for CLIENT_TEN is 0x10 :-D

>  					/* Must equal I2C_M_TEN below */
>  #define I2C_CLIENT_SLAVE	0x20	/* we are the slave */
> @@ -715,6 +716,7 @@ struct i2c_adapter {
>  	const struct i2c_adapter_quirks *quirks;
>  
>  	struct irq_domain *host_notify_domain;
> +	u16 alias_idx;
>  };
>  #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
>  
> 


Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8151A9777
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 10:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895081AbgDOIuU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 04:50:20 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39244 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2895079AbgDOIuS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Apr 2020 04:50:18 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 79A4E2D1;
        Wed, 15 Apr 2020 10:50:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586940616;
        bh=gou09fnjFJvhR1x9fvB0QuYMTNpfnFWwyMLgGzqgFXc=;
        h=Subject:From:To:Cc:References:Reply-To:Date:In-Reply-To:From;
        b=mciyrlifwnsfZbPwmMECsp60Sa5GaH5OEbXqLC3v7CwL3kuwpWl5iLGhLhSPZPkGu
         8LTMN31DTnFJSHR3aPAjRJRoRap9fhmjaYqBr7gszmO+WsJTZoeax/RW3rwll5hgPe
         33v+ipaQY6FkcyNH4WXrrqE9fW3o5Iu2Mstd/LyM=
Subject: Re: [RFC PATCH v2 4/6] i2c: of: error message unification
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, linux-i3c@lists.infradead.org,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20200318150059.21714-1-wsa+renesas@sang-engineering.com>
 <20200318150059.21714-5-wsa+renesas@sang-engineering.com>
 <7014c94a-bb89-b282-52ee-49b42ab5aac1@bingham.xyz>
Reply-To: kieran.bingham+renesas@ideasonboard.com
Organization: Ideas on Board
Message-ID: <4a63e7f5-8a0c-a9f1-640b-2f33c0076160@ideasonboard.com>
Date:   Wed, 15 Apr 2020 09:50:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <7014c94a-bb89-b282-52ee-49b42ab5aac1@bingham.xyz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 15/04/2020 09:17, Kieran Bingham wrote:
> Hi Wolfram,
> 
> On 18/03/2020 15:00, Wolfram Sang wrote:
>> - don't prefix the device if %pOF is provided. That information is
>>   enough.
>> - move the prefix to pr_fmt
>> - change prefix from "of_i2c" to "i2c_of" because the code was moved
>>   out of the of-domain long ago
>> - drop error string for callers of of_i2c_register_device because it
>>   already reports enough (thanks to Tang Bin for the report!)
>>
>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
>> ---
>>  drivers/i2c/i2c-core-of.c | 18 +++++++-----------
>>  1 file changed, 7 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
>> index 710704cd583e..f2d09ea0d336 100644
>> --- a/drivers/i2c/i2c-core-of.c
>> +++ b/drivers/i2c/i2c-core-of.c
>> @@ -8,6 +8,8 @@
>>   * Copyright (C) 2013, 2018 Wolfram Sang <wsa@the-dreams.de>
>>   */
>>  
>> +#define pr_fmt(fmt) "i2c_of: " fmt
>> +
>>  #include <dt-bindings/i2c/i2c.h>
>>  #include <linux/device.h>
>>  #include <linux/err.h>
>> @@ -28,7 +30,7 @@ int of_i2c_get_board_info(struct device_node *node, struct i2c_board_info *info)


Perhaps not directly needed by this patch but,

at some point will you rename of_i2c_* to i2c_of_* ?


>>  
>>  	ret = of_property_read_u32(node, "reg", &addr);
>>  	if (ret) {
>> -		pr_err("of_i2c: invalid reg on %pOF\n", node);
>> +		pr_err("invalid reg on %pOF\n", node);
>>  		return ret;
>>  	}
>>  
>> @@ -66,7 +68,7 @@ static struct i2c_client *of_i2c_register_device(struct i2c_adapter *adap,
>>  	struct i2c_board_info info;
>>  	int ret;
>>  
>> -	dev_dbg(&adap->dev, "of_i2c: register %pOF\n", node);
>> +	pr_debug("register %pOF\n", node);
>>  
>>  	ret = of_i2c_get_board_info(node, &info);
>>  	if (ret)
>> @@ -74,7 +76,7 @@ static struct i2c_client *of_i2c_register_device(struct i2c_adapter *adap,
>>  
>>  	client = i2c_new_client_device(adap, &info);
>>  	if (IS_ERR(client))
>> -		dev_err(&adap->dev, "of_i2c: Failure registering %pOF\n", node);
>> +		pr_err("failure registering %pOF (%ld)\n", node, PTR_ERR(client));
>>  
>>  	return client;
>>  }
>> @@ -88,7 +90,7 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
>>  	if (!adap->dev.of_node)
>>  		return;
>>  
>> -	dev_dbg(&adap->dev, "of_i2c: walking child nodes\n");
>> +	dev_dbg(&adap->dev, "walking child nodes\n");
>>  
>>  	bus = of_get_child_by_name(adap->dev.of_node, "i2c-bus");
>>  	if (!bus)
>> @@ -99,12 +101,8 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
>>  			continue;
>>  
>>  		client = of_i2c_register_device(adap, node);
>> -		if (IS_ERR(client)) {
>> -			dev_err(&adap->dev,
>> -				 "Failed to create I2C device for %pOF\n",
>> -				 node);
>> +		if (IS_ERR(client))
>>  			of_node_clear_flag(node, OF_POPULATED);
>> -		}
>>  	}
>>  
>>  	of_node_put(bus);
>> @@ -243,8 +241,6 @@ static int of_i2c_notify(struct notifier_block *nb, unsigned long action,
>>  
>>  		client = of_i2c_register_device(adap, rd->dn);
>>  		if (IS_ERR(client)) {
>> -			dev_err(&adap->dev, "failed to create client for '%pOF'\n",
>> -				 rd->dn);
>>  			put_device(&adap->dev);
>>  			of_node_clear_flag(rd->dn, OF_POPULATED);
>>  			return notifier_from_errno(PTR_ERR(client));
>>
> 


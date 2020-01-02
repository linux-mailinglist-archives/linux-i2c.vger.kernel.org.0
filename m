Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9252612EA1E
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jan 2020 19:58:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728099AbgABS6x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Jan 2020 13:58:53 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:37182 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727951AbgABS6x (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Jan 2020 13:58:53 -0500
Received: from [88.147.81.4] (port=37292 helo=[192.168.77.51])
        by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1in5gH-003XTs-Fv; Thu, 02 Jan 2020 19:58:49 +0100
Subject: Re: [RFC PATCH 3/5] i2c: core: add function to request an alias
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>
References: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
 <20191231161400.1688-4-wsa+renesas@sang-engineering.com>
 <20200101165515.GC6226@pendragon.ideasonboard.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <e008939f-531d-f7dc-4c3c-937476213030@lucaceresoli.net>
Date:   Thu, 2 Jan 2020 19:58:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200101165515.GC6226@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

thanks for having started working on this!

On 01/01/20 17:55, Laurent Pinchart wrote:
> Hi Wolfram,
> 
> Thank you for the patch.
> 
> On Tue, Dec 31, 2019 at 05:13:58PM +0100, Wolfram Sang wrote:
>> Some devices are able to reprogram their I2C address at runtime. This
>> can prevent address collisions when one is able to activate and
>> reprogram these devices one by one. For that to work, they need to be
>> assigned an unused address. This new functions allows drivers to request
>> for such an address. It assumes all non-occupied addresses are free. It
>> will then send a message to such a free address to make sure there is
>> really nothing listening there.
>>
>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> ---
>>  drivers/i2c/i2c-core-base.c | 22 ++++++++++++++++++++++
>>  include/linux/i2c.h         |  2 ++
>>  2 files changed, 24 insertions(+)
>>
>> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
>> index 51bd953ddfb2..5a010e7e698f 100644
>> --- a/drivers/i2c/i2c-core-base.c
>> +++ b/drivers/i2c/i2c-core-base.c
>> @@ -2241,6 +2241,28 @@ static int i2c_detect(struct i2c_adapter *adapter, struct i2c_driver *driver)
>>  	return err;
>>  }
>>  
> 
> Missing kerneldoc, but you already know about this.
> 
>> +struct i2c_client *i2c_new_alias_device(struct i2c_adapter *adap)
>> +{
>> +	struct i2c_client *alias = ERR_PTR(-EBUSY);
>> +	int ret;
>> +	u16 addr;
>> +
>> +	i2c_lock_bus(adap, I2C_LOCK_SEGMENT);
>> +
>> +	for (addr = 0x08; addr < 0x78; addr++) {
>> +		ret = i2c_scan_for_client(adap, addr, i2c_unlocked_read_byte_probe);
>> +		if (ret == -ENODEV) {
>> +			alias = i2c_new_dummy_device(adap, addr);
>> +			dev_dbg(&adap->dev, "Found alias: 0x%x\n", addr);
>> +			break;
>> +		}
>> +	}
> 
> This looks quite inefficient, especially if the beginning of the range
> is populated with devices. Furthermore, I think there's a high risk of
> false negatives, as acquiring a free address and reprogramming the
> client to make use of it are separate operations.

Right. Applying the alias could raise other errors, thus one would need
i2c_new_alias_device() to keep the alias locked until programming it has
either failed or has been successfully programmed.

> Another call to
> i2c_new_alias_device() could occur in-between. There's also the issue
> that I2C hasn't been designed for scanning, so some devices may not
> appreciate this.
> 
> What happened to the idea of reporting busy address ranges in the
> firmware (DT, ACPI, ...) ?

Indeed that's how I remember it as well, and I'm a bit suspicious about
sending out probe messages that might have side effects (even if the
false negative issue mentioned by Laurent were solved). You know, I've
been taught to "expect the worse" :) so I'd like to better understand
what are the strong reasons in favor of probing, as well as the
potential side effects.

-- 
Luca

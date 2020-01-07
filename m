Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A391132CC7
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 18:15:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728266AbgAGRPC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 12:15:02 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37374 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728262AbgAGRPC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jan 2020 12:15:02 -0500
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3CCAE52F;
        Tue,  7 Jan 2020 18:14:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1578417298;
        bh=WS4w2zjKY3/i2X7sFyQmKb9OW8eSTvK2BxJYjda8rk8=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=Zs441usvSr7KJ5+t7XK2oegKhfBlARYfoVHm6QBaMQmWP0Er/1D024mU9WItnnJoa
         mjj5pWvFy5flov2B54uGzx2MIMJ4C/4FKQLNuXbFZkSDmf/xgZWRNIlNSB67qV8bIn
         XkxvkQp0eGHUc+XTnkwDe4lqQArkHcF/wf917TMs=
Subject: Re: [RFC PATCH 3/5] i2c: core: add function to request an alias
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>
References: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
 <20191231161400.1688-4-wsa+renesas@sang-engineering.com>
 <6760a242-ff0f-c981-68d4-7b9665124e21@bingham.xyz>
 <20200107171119.GN4871@pendragon.ideasonboard.com>
Reply-To: kieran.bingham@ideasonboard.com
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Openpgp: preference=signencrypt
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <61344235-9e66-0d89-89cd-1adef2e0bce1@ideasonboard.com>
Date:   Tue, 7 Jan 2020 17:14:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200107171119.GN4871@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Laurent,

On 07/01/2020 17:11, Laurent Pinchart wrote:
> Hi Kieran,
> 
> On Tue, Jan 07, 2020 at 09:40:35AM +0000, Kieran Bingham wrote:
>> On 31/12/2019 16:13, Wolfram Sang wrote:
>>> Some devices are able to reprogram their I2C address at runtime. This
>>> can prevent address collisions when one is able to activate and
>>> reprogram these devices one by one. For that to work, they need to be
>>> assigned an unused address. This new functions allows drivers to request
>>> for such an address. It assumes all non-occupied addresses are free. It
>>> will then send a message to such a free address to make sure there is
>>> really nothing listening there.
>>>
>>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>> ---
>>>  drivers/i2c/i2c-core-base.c | 22 ++++++++++++++++++++++
>>>  include/linux/i2c.h         |  2 ++
>>>  2 files changed, 24 insertions(+)
>>>
>>> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
>>> index 51bd953ddfb2..5a010e7e698f 100644
>>> --- a/drivers/i2c/i2c-core-base.c
>>> +++ b/drivers/i2c/i2c-core-base.c
>>> @@ -2241,6 +2241,28 @@ static int i2c_detect(struct i2c_adapter *adapter, struct i2c_driver *driver)
>>>  	return err;
>>>  }
>>>  
>>> +struct i2c_client *i2c_new_alias_device(struct i2c_adapter *adap)
>>> +{
>>> +	struct i2c_client *alias = ERR_PTR(-EBUSY);
>>> +	int ret;
>>> +	u16 addr;
>>> +
>>> +	i2c_lock_bus(adap, I2C_LOCK_SEGMENT);
>>> +
>>> +	for (addr = 0x08; addr < 0x78; addr++) {
>>> +		ret = i2c_scan_for_client(adap, addr, i2c_unlocked_read_byte_probe);
>>
>> Are all 'known' devices on a bus (all the ones declared in DT etc)
>> marked as 'busy' or taken by the time this call is made? (edit, I don't
>> think they are)
>>
>> Perhaps this is a constructed corner case, but I'm just trying to follow
>> it through:
>>
>> I.e. if say the adv748x had in DT defined aliases at 0x08, 0x09,
>> 0x0A..., but not yet probed (thus no device is listening at these
>> addresses) ... and then a max9286 came along and asked for 'any' spare
>> address with this call, would it be given 0x08 first?
>>
>> If so (which I think is what the case would be currently, until I'm
>> pointed otherwise) do we need to mark all addresses on the bus as
>> reserved against this some how?
>>
>> I'm not sure how that would occur, as it would be up to the adv748x in
>> that instance to parse it's extended register list to identify the extra
>> aliases it will create, *and* that would only happen if the device
>> driver was enabled in the first place.
>>
>> So this seems a bit 'racy' in a different context; not the i2c_lock_bus,
>> but rather the probe order of devices on the bus could affect the
>> allocations.
>>
>> Perhaps that is unavoidable though...
> 
> But it's a real problem... Could the I2C core parse all the addresses on
> the bus before probing drivers ?

That's my point :-D

The core 'could' parse all reg entries, and conclude that any extended
entries within a device node are aliases as well, which should be
reserved, but I don't think it could know if the device is actually
going to be enabled by a driver (well, it could look it up).

I think if core-i2c parses all device tree nodes for register addresses
first, it would have to consider all addresses it came across as
potentially in use.

But it would also have to traverse any i2c-muxes too!

--
Kieran


> 
>>> +		if (ret == -ENODEV) {
>>> +			alias = i2c_new_dummy_device(adap, addr);
>>> +			dev_dbg(&adap->dev, "Found alias: 0x%x\n", addr);
>>> +			break;
>>> +		}
>>> +	}
>>> +
>>> +	i2c_unlock_bus(adap, I2C_LOCK_SEGMENT);
>>> +	return alias;
>>> +}
>>> +EXPORT_SYMBOL_GPL(i2c_new_alias_device);
>>> +
>>>  int i2c_probe_func_quick_read(struct i2c_adapter *adap, unsigned short addr)
>>>  {
>>>  	return i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, 0,
>>> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
>>> index f834687989f7..583ca2aec022 100644
>>> --- a/include/linux/i2c.h
>>> +++ b/include/linux/i2c.h
>>> @@ -441,6 +441,8 @@ i2c_new_device(struct i2c_adapter *adap, struct i2c_board_info const *info);
>>>  struct i2c_client *
>>>  i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *info);
>>>  
>>> +struct i2c_client *i2c_new_alias_device(struct i2c_adapter *adap);
>>> +
>>>  /* If you don't know the exact address of an I2C device, use this variant
>>>   * instead, which can probe for device presence in a list of possible
>>>   * addresses. The "probe" callback function is optional. If it is provided,
> 


-- 
Regards
--
Kieran

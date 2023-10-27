Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 829C07D97FF
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Oct 2023 14:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345539AbjJ0M1Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Oct 2023 08:27:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbjJ0M1Y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Oct 2023 08:27:24 -0400
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3392F121
        for <linux-i2c@vger.kernel.org>; Fri, 27 Oct 2023 05:27:21 -0700 (PDT)
Received: from [172.24.14.91] (unknown [62.214.9.170])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 3FDF62800EE;
        Fri, 27 Oct 2023 12:27:18 +0000 (UTC)
Message-ID: <117fc55f-05b8-41f9-8e46-e7c1d5202cdc@zonque.org>
Date:   Fri, 27 Oct 2023 14:27:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: core: fix lockdep warning for sparsely nested
 adapter chain
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
References: <20231018094613.849007-1-daniel@zonque.org>
 <ZTqcB/JOZ8+GXq4b@shikoro>
From:   Daniel Mack <daniel@zonque.org>
In-Reply-To: <ZTqcB/JOZ8+GXq4b@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 10/26/23 19:04, Wolfram Sang wrote:
> On Wed, Oct 18, 2023 at 11:46:13AM +0200, Daniel Mack wrote:
>> When adapters are chained in a sparse manner (with intermediate MFD devices,
> 
> So, you have an MFD including an i2c-mux or something?

Yes exactly. I have an I2C device that creates MFD devices, and one of
them creates a child device which is an I2C host. So the hosts are not
directly linked to one another but in a spare manner.

>> for instance) the code currently fails to use the correct subclass for
>> the adapter's bus_lock which leads to false-positive lockdep warnings.
>>
>> Fix this by walking the entire pedigree of the device and count all
>> adapters along the way instead of just checking the immediate parent.
> 
> Sounds reasonable to me.
> 
>>
>> Signed-off-by: Daniel Mack <daniel@zonque.org>
>> ---
>> This hit me when during the development of a driver stack that isn't
>> submitted mainline yet. This patch could however be discussed
>> independently I think.
> 
> Yes, it can :)
> 
>>
>>  drivers/i2c/i2c-core-base.c | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
>> index 60746652fd52..4692a1e5ea0a 100644
>> --- a/drivers/i2c/i2c-core-base.c
>> +++ b/drivers/i2c/i2c-core-base.c
>> @@ -1189,9 +1189,11 @@ static void i2c_adapter_dev_release(struct device *dev)
>>  unsigned int i2c_adapter_depth(struct i2c_adapter *adapter)
>>  {
>>  	unsigned int depth = 0;
>> +	struct device *parent;
>>  
>> -	while ((adapter = i2c_parent_is_i2c_adapter(adapter)))
> 
> I never noticed we overwrite the 'adapter' function argument. Much
> better with your version and the local variable.
> 
>> -		depth++;
>> +	for (parent = adapter->dev.parent; parent; parent = parent->parent)
>> +		if (parent->type == &i2c_adapter_type)
>> +			depth++;
> 
> I am not sure myself. Is the code explaining itself or should we add a
> short comment why we use a for-loop? I tend to leave it as is.

It's pretty obvious what it does I would say.


Thanks,
Daniel


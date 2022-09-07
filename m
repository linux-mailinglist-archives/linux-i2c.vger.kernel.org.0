Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CBC75B09B5
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Sep 2022 18:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbiIGQGh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Sep 2022 12:06:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230371AbiIGQGU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Sep 2022 12:06:20 -0400
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 915E484EDA;
        Wed,  7 Sep 2022 09:05:12 -0700 (PDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 287FNghf019953;
        Wed, 7 Sep 2022 16:04:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=/cuYHHEw8duJwETT/mu7L8157OT/ccfTmJHWKc+1Y2c=;
 b=bWq7Xi6DeIrY9qVa+eLMB0kmt3LzvR0JrvIAzzpNgdElUJ8+034QL2wzYoFKMGISeWDV
 3bQOR668xPRst1T5v48n5ldvTmG5WjCs39/hPXepRsHRlC65DiCRAP+E56Joy/rVlCqJ
 hOZVEWTztNC3w47zf7+uWrqW/MzNPlh0JvTO9NueS1BgvQHaUdsk+on5E/++ni8tZq03
 W5NT4VXHIiFB1TpQB8RhkMTyZ2AcRr2NkGpsRJnf9n/5zjebGVIYU9CDrEiEY273WtqN
 q6TdVXDmJcqArsR/AshKDoyKYIvIiMh/W1lbw3usmLpg3QOtWOJufWP9S0LhnSaOCQ/Y 2g== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jewwes8jr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 07 Sep 2022 16:04:49 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
        by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 287FoXjl001479;
        Wed, 7 Sep 2022 16:02:58 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
        by ppma03dal.us.ibm.com with ESMTP id 3jbxja9ej4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 07 Sep 2022 16:02:58 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
        by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 287G2wfV16646694
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 7 Sep 2022 16:02:58 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 8FDBE7805F;
        Wed,  7 Sep 2022 16:13:16 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9EA1B7805E;
        Wed,  7 Sep 2022 16:13:15 +0000 (GMT)
Received: from [9.65.226.72] (unknown [9.65.226.72])
        by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
        Wed,  7 Sep 2022 16:13:15 +0000 (GMT)
Message-ID: <9374c411-c8c5-41ff-5c66-ff997c502426@linux.ibm.com>
Date:   Wed, 7 Sep 2022 11:02:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 2/2] iio: si7020: Lock root adapter to wait for reset
Content-Language: en-US
To:     Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org
Cc:     linux-iio@vger.kernel.org, wsa@kernel.org, jic23@kernel.org,
        lars@metafoo.de, miltonm@us.ibm.com, joel@jms.id.au,
        linux-kernel@vger.kernel.org
References: <20220906202829.1921114-1-eajames@linux.ibm.com>
 <20220906202829.1921114-3-eajames@linux.ibm.com>
 <31b44b63-4cf3-6fdd-b2b8-6f00070af89a@axentia.se>
 <c7f6baa3-8181-a612-72cc-23f570f31ab3@linux.ibm.com>
 <1ba9cf9d-2980-974f-e9a5-ea53e1915d45@axentia.se>
From:   Eddie James <eajames@linux.ibm.com>
In-Reply-To: <1ba9cf9d-2980-974f-e9a5-ea53e1915d45@axentia.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lTsSkNhf00wv8pXT9PzzNnzKOA9Y2QqC
X-Proofpoint-ORIG-GUID: lTsSkNhf00wv8pXT9PzzNnzKOA9Y2QqC
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-07_08,2022-09-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2209070063
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 9/7/22 09:17, Peter Rosin wrote:
> Hi!
>
> 2022-09-07 at 15:53, Eddie James wrote:
>> On 9/7/22 02:10, Peter Rosin wrote:
>>> Hi!
>>>
>>> First off, I'm very sorry for being too busy and too unresponsive.
>>>
>>> 2022-09-06 at 22:28, Eddie James wrote:
>>>> Use the new mux root operations to lock the root adapter while waiting for
>>>> the reset to complete. I2C commands issued after the SI7020 is starting up
>>>> or after reset can potentially upset the startup sequence. Therefore, the
>>>> host needs to wait for the startup sequence to finish before issuing
>>>> further I2C commands.
>>>>
>>>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>>>> ---
>>>>    drivers/iio/humidity/si7020.c | 16 ++++++++++++++--
>>>>    1 file changed, 14 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/iio/humidity/si7020.c b/drivers/iio/humidity/si7020.c
>>>> index ab6537f136ba..76ca7863f35b 100644
>>>> --- a/drivers/iio/humidity/si7020.c
>>>> +++ b/drivers/iio/humidity/si7020.c
>>>> @@ -106,6 +106,7 @@ static const struct iio_info si7020_info = {
>>>>    static int si7020_probe(struct i2c_client *client,
>>>>                const struct i2c_device_id *id)
>>>>    {
>>>> +    struct i2c_adapter *root;
>>>>        struct iio_dev *indio_dev;
>>>>        struct i2c_client **data;
>>>>        int ret;
>>>> @@ -115,13 +116,24 @@ static int si7020_probe(struct i2c_client *client,
>>>>                         I2C_FUNC_SMBUS_READ_WORD_DATA))
>>>>            return -EOPNOTSUPP;
>>>>    +    root = i2c_lock_select_bus(client->adapter);
>>>> +    if (IS_ERR(root))
>>>> +        return PTR_ERR(root);
>>>> +
>>>>        /* Reset device, loads default settings. */
>>>> -    ret = i2c_smbus_write_byte(client, SI7020CMD_RESET);
>>>> -    if (ret < 0)
>>>> +    ret = __i2c_smbus_xfer(root, client->addr, client->flags,
>>>> +                   I2C_SMBUS_WRITE, SI7020CMD_RESET,
>>>> +                   I2C_SMBUS_BYTE, NULL);
>>> I'd say that this is too ugly. We should not add stuff that basically
>>> hides the actual xfer from the mux like this. That is too much of a
>>> break in the abstraction.
>>
>> Hm, I guess I'm not sure I follow - I see several drivers that use the raw __i2c_smbus_xfer or __i2c_transfer, some without a lock in sight. If it's not acceptable to use the unlocked versions in some cases, why are they exported in the header file?
> Doing unlocked xfers w/o manually doing the locking is a bug. If you are
> aware of code doing this, please point them out!


Ah, I just meant the lock wasn't right next to the transfer call, since 
I didn't fully understand you. I'm sure everything is being locked 
correctly.


>
> Issuing an unlocked xfer on the same adapter that has been manually locked
> has been a thing since forever. But issuing that xfer on the root adapter
> "behind the back" of e.g. an address translator is simply not going to work
> at all if it never sees the xfer and thus never gets a chance to modify it.
> A mux might also in theory add quirks or adjust xfers for whatever reason,
> and that possibility will be made impossible by hiding the xfer from the
> mux.


OK, I see what you're saying. But that's what lock_select does, it locks 
the bus and goes through the mux channel selection function. With the 
way muxes work right now, they can't modify the xfer at all, they just 
deselect/select channels. So this code should work fine, unless I'm 
still misunderstanding something.

I do see your point about a possible enhancement of the mux interface... 
I guess I'd argue that whoever wants to do that should have to worry 
about it! But if you're firm on this, I'll try the other way. I'll also 
mention we (IBM/OpenBMC) has been running this series on lab systems for 
a couple of months now, so it has some testing, though admittedly with 
just one configuration of device/mux/adapter.


Thanks!

Eddie


>>
>>> Looking back, expanding on the previous series [1] so that it installs
>>> the hook on the root adapter, handles smbus xfers and clears out the
>>> callback afterwards is much more sensible. No?
>>
>> Maybe so, though adding the callback is a more intrusive change, in my opinion, since every transfer has to check if the pointer is null.
> The runtime cost will be negligible. The bigger cost is IMO the maintenance
> overhead.
>
> Cheers,
> Peter
>
>>
>> Thanks for your feedback!
>>
>> Eddie
>>
>>
>>
>>> Maybe the callback in that series should also include a reference to
>>> the xfer that has just been done, so that the hook can potentially
>>> discriminate and only do the delay for the key xfer. But maybe that's
>>> overkill?
>>>
>>> Cheers,
>>> Peter
>>>
>>> [1] https://lore.kernel.org/lkml/20220518204119.38943-1-eajames@linux.ibm.com/
>>>
>>>> +    if (ret < 0) {
>>>> +        i2c_unlock_deselect_bus(client->adapter);
>>>>            return ret;
>>>> +    }
>>>> +
>>>>        /* Wait the maximum power-up time after software reset. */
>>>>        msleep(15);
>>>>    +    i2c_unlock_deselect_bus(client->adapter);
>>>> +
>>>>        indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
>>>>        if (!indio_dev)
>>>>            return -ENOMEM;

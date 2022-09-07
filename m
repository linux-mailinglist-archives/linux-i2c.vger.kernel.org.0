Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36AD25B05BE
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Sep 2022 15:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbiIGNx4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Sep 2022 09:53:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229673AbiIGNxs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Sep 2022 09:53:48 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14DDDA220A;
        Wed,  7 Sep 2022 06:53:47 -0700 (PDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 287DgB8n020297;
        Wed, 7 Sep 2022 13:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Yyrc9saJQYLT5TPC1+9QpzBLh2OKqdf5lWreXjgpJus=;
 b=buECoyK/d5S/taJ0Fud/O917MQmdI4xxzK5nMce9iT/blhItkELeAlhSLwp8lPZDrJTa
 KoRH3qaHSiIK0t6Dj/5ZyEF7i2CfYwcszSpJPgSqZ6Y6w6zvKiGcXIoJrnwi+8D7qLco
 n+6EhmNZOnPk24dBp26LTEItqxRbnu26WQjhB120c2iE1oKEkzHtx/VqPo15XrwdGgPo
 BbuP1zWgkXpWfPr8fGIuMmU/lYPsC3TNrtJNKod14KHh8q/3P6Baa+yVLvFZQ3xP9D/p
 2eNkfQa6KezOudsrQ0W9H9nXbH/LvgUsrD6XDA3j1Z5nLul+zE4YcI9LCiZoHB2emydE Wg== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jevdrghqw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 07 Sep 2022 13:53:23 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
        by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 287DpVgn012030;
        Wed, 7 Sep 2022 13:53:22 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
        by ppma01wdc.us.ibm.com with ESMTP id 3jbxj9j4sj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 07 Sep 2022 13:53:22 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
        by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 287DrLpg15139558
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 7 Sep 2022 13:53:21 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id DEA8D7805F;
        Wed,  7 Sep 2022 14:03:36 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id EB53A7805C;
        Wed,  7 Sep 2022 14:03:35 +0000 (GMT)
Received: from [9.65.226.72] (unknown [9.65.226.72])
        by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
        Wed,  7 Sep 2022 14:03:35 +0000 (GMT)
Message-ID: <c7f6baa3-8181-a612-72cc-23f570f31ab3@linux.ibm.com>
Date:   Wed, 7 Sep 2022 08:53:20 -0500
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
From:   Eddie James <eajames@linux.ibm.com>
In-Reply-To: <31b44b63-4cf3-6fdd-b2b8-6f00070af89a@axentia.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Ep4vgc5fXUvuSZaTcdXfT71WQ6UXbzmU
X-Proofpoint-ORIG-GUID: Ep4vgc5fXUvuSZaTcdXfT71WQ6UXbzmU
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-07_08,2022-09-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209070053
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 9/7/22 02:10, Peter Rosin wrote:
> Hi!
>
> First off, I'm very sorry for being too busy and too unresponsive.
>
> 2022-09-06 at 22:28, Eddie James wrote:
>> Use the new mux root operations to lock the root adapter while waiting for
>> the reset to complete. I2C commands issued after the SI7020 is starting up
>> or after reset can potentially upset the startup sequence. Therefore, the
>> host needs to wait for the startup sequence to finish before issuing
>> further I2C commands.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   drivers/iio/humidity/si7020.c | 16 ++++++++++++++--
>>   1 file changed, 14 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/iio/humidity/si7020.c b/drivers/iio/humidity/si7020.c
>> index ab6537f136ba..76ca7863f35b 100644
>> --- a/drivers/iio/humidity/si7020.c
>> +++ b/drivers/iio/humidity/si7020.c
>> @@ -106,6 +106,7 @@ static const struct iio_info si7020_info = {
>>   static int si7020_probe(struct i2c_client *client,
>>   			const struct i2c_device_id *id)
>>   {
>> +	struct i2c_adapter *root;
>>   	struct iio_dev *indio_dev;
>>   	struct i2c_client **data;
>>   	int ret;
>> @@ -115,13 +116,24 @@ static int si7020_probe(struct i2c_client *client,
>>   				     I2C_FUNC_SMBUS_READ_WORD_DATA))
>>   		return -EOPNOTSUPP;
>>   
>> +	root = i2c_lock_select_bus(client->adapter);
>> +	if (IS_ERR(root))
>> +		return PTR_ERR(root);
>> +
>>   	/* Reset device, loads default settings. */
>> -	ret = i2c_smbus_write_byte(client, SI7020CMD_RESET);
>> -	if (ret < 0)
>> +	ret = __i2c_smbus_xfer(root, client->addr, client->flags,
>> +			       I2C_SMBUS_WRITE, SI7020CMD_RESET,
>> +			       I2C_SMBUS_BYTE, NULL);
> I'd say that this is too ugly. We should not add stuff that basically
> hides the actual xfer from the mux like this. That is too much of a
> break in the abstraction.


Hm, I guess I'm not sure I follow - I see several drivers that use the 
raw __i2c_smbus_xfer or __i2c_transfer, some without a lock in sight. If 
it's not acceptable to use the unlocked versions in some cases, why are 
they exported in the header file?


>
> Looking back, expanding on the previous series [1] so that it installs
> the hook on the root adapter, handles smbus xfers and clears out the
> callback afterwards is much more sensible. No?


Maybe so, though adding the callback is a more intrusive change, in my 
opinion, since every transfer has to check if the pointer is null.


Thanks for your feedback!

Eddie



>
> Maybe the callback in that series should also include a reference to
> the xfer that has just been done, so that the hook can potentially
> discriminate and only do the delay for the key xfer. But maybe that's
> overkill?
>
> Cheers,
> Peter
>
> [1] https://lore.kernel.org/lkml/20220518204119.38943-1-eajames@linux.ibm.com/
>
>> +	if (ret < 0) {
>> +		i2c_unlock_deselect_bus(client->adapter);
>>   		return ret;
>> +	}
>> +
>>   	/* Wait the maximum power-up time after software reset. */
>>   	msleep(15);
>>   
>> +	i2c_unlock_deselect_bus(client->adapter);
>> +
>>   	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
>>   	if (!indio_dev)
>>   		return -ENOMEM;

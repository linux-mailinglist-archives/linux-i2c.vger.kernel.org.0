Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D056FA4F8D
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2019 09:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729393AbfIBHLe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Sep 2019 03:11:34 -0400
Received: from bastet.se.axis.com ([195.60.68.11]:43475 "EHLO
        bastet.se.axis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729262AbfIBHLd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Sep 2019 03:11:33 -0400
Received: from localhost (localhost [127.0.0.1])
        by bastet.se.axis.com (Postfix) with ESMTP id EBEC118305;
        Mon,  2 Sep 2019 09:11:27 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
        by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id 6JJzoMmu5Zqt; Mon,  2 Sep 2019 09:11:24 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
        by bastet.se.axis.com (Postfix) with ESMTPS id 6CD18182F9;
        Mon,  2 Sep 2019 09:11:24 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E4BDE1E093;
        Mon,  2 Sep 2019 09:11:23 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D891E1E08F;
        Mon,  2 Sep 2019 09:11:23 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
        by boulder03.se.axis.com (Postfix) with ESMTP;
        Mon,  2 Sep 2019 09:11:23 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
        by thoth.se.axis.com (Postfix) with ESMTP id CBA0828F3;
        Mon,  2 Sep 2019 09:11:23 +0200 (CEST)
Received: from [10.88.24.4] (10.0.5.60) by XBOX02.axis.com (10.0.5.16) with
 Microsoft SMTP Server (TLS) id 15.0.1365.1; Mon, 2 Sep 2019 09:11:23 +0200
Subject: Re: [PATCH] i2c-eeprom_slave: Add support for more eeprom models
To:     Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?QmrDtnJuIEFyZMO2?= <bjornar@axis.com>
CC:     <linux-i2c@vger.kernel.org>
References: <1565675708-15434-1-git-send-email-bjorn.ardo@axis.com>
 <20190831132256.GG1032@ninjato>
From:   Bjorn Ardo <bjorn.ardo@axis.com>
Message-ID: <6b5554ce-1d43-5f03-d030-adc234ffc56d@axis.com>
Date:   Mon, 2 Sep 2019 09:11:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190831132256.GG1032@ninjato>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX02.axis.com (10.0.5.16) To XBOX02.axis.com (10.0.5.16)
X-TM-AS-GCONF: 00
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,


On 8/31/19 3:22 PM, Wolfram Sang wrote:
>
> May I ask which Linux I2C driver you use to act as a slave?



This is the i2c-controller in the ARTPEC-6 system. The driver itself is 
not yet upstreamed.


>> Signed-off-by: Björn Ardö <bjorn.ardo@axis.com>
>> ---
>>   drivers/i2c/i2c-slave-eeprom.c | 36 +++++++++++++++++++++++++-----------
>>   1 file changed, 25 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/i2c/i2c-slave-eeprom.c b/drivers/i2c/i2c-slave-eeprom.c
>> index be65d38..35bff28 100644
>> --- a/drivers/i2c/i2c-slave-eeprom.c
>> +++ b/drivers/i2c/i2c-slave-eeprom.c
>> @@ -18,15 +18,22 @@
>>   #include <linux/slab.h>
>>   #include <linux/spinlock.h>
>>   #include <linux/sysfs.h>
>> +#include <linux/bitfield.h>
> Please keep it sorted.


Will fix!


>
>>   
>>   struct eeprom_data {
>>   	struct bin_attribute bin;
>> -	bool first_write;
>> +	int write_nbr;
> What does 'nbr' stand for? My gut feeling is that this variable could
> have a more speaking name. Also, at least unsigned, maybe just u8?


My line of though here was that the previous code used a flag called 
"first_write" to keep track of which part of the write is the address. 
With 16 bit addresses we need to keep track of both the first and the 
second write, thus a variable that keeps track of which write it is 
(first, second, third, etc..), thus the name "write_nbr". What would be 
a better name, "write_cnt", "initial_write_cnt"?

u8 should be sufficient, will fix!


>>   	spinlock_t buffer_lock;
>> -	u8 buffer_idx;
>> +	u16 buffer_idx;
>> +	u16 address_mask;
>> +	u8 address_bytes;
> num_address_bytes makes the code easier to read IMO.
will fix!
>
>>   	u8 buffer[];
>>   };
> Code itself looks good to me. I'd like to test it, though, hopefully
> until Tuesday. What kind of tests did you perform?
>
The use case we have is to have this code running on one system and load the virtual eeprom with a static file. Then another system will read this data over i2c. This scenario is the one we tested the most. During development I also tested to connect this device to another i2c port on the same system and cat files to the entries in /sys in both directions and verify that they are the same. I have not run any extensive test-suit that tested every possible combinations of read and write commands.


Best Regards,

Björn


Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55D6B26504B
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Sep 2020 22:10:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgIJUKf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Sep 2020 16:10:35 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:57032 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731029AbgIJPAm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Sep 2020 11:00:42 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08ADVwbj156061;
        Thu, 10 Sep 2020 09:55:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=uAJ358VnHFKZvUebteG+ZwkjrTg7lzgNh1aBoFkoHpk=;
 b=GZ2G1BNy+s9Zu39AdCM8v721KGKk26Vt/6LGxwvE4CfsTkJyANcLma4ZKsQYFkae9NfG
 s25+sWBk3wJF9/nJBeFH27CoQh17AO4byjDzUHqfe0nWMrHgtM5hyfk41xyirKwL3mBG
 w4/6kQRbpkG+sqS1w2BP0ihz2ZqUIRDt+tJ0mMDXCjV1MIxNKnkcZQg7fnG1RoBFNICY
 9QsdVhNGSbMnZqU6YstDD1xlgdiajDyFjNSNubeglI6AtVJlasZvMrQe7vBhJCEtwz66
 9XHHW8ONZZO0BNMIsODWT42eV6X/yMj4x5I27JO++Zb6W1s/FCaUB8xku+jURKNhwWHT QA== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 33fn1x0xd2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 10 Sep 2020 09:55:42 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08ADWGVT157762;
        Thu, 10 Sep 2020 09:55:42 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
        by mx0a-001b2d01.pphosted.com with ESMTP id 33fn1x0xcm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 10 Sep 2020 09:55:42 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
        by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08ADqBZ1008486;
        Thu, 10 Sep 2020 13:55:41 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
        by ppma04dal.us.ibm.com with ESMTP id 33c2a9snn8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 10 Sep 2020 13:55:41 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
        by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 08ADtaZ823200424
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 10 Sep 2020 13:55:36 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D4943C6062;
        Thu, 10 Sep 2020 13:55:39 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 470DDC605D;
        Thu, 10 Sep 2020 13:55:39 +0000 (GMT)
Received: from [9.211.140.115] (unknown [9.211.140.115])
        by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
        Thu, 10 Sep 2020 13:55:39 +0000 (GMT)
Subject: Re: [PATCH v3 3/5] i2c: aspeed: Mask IRQ status to relevant bits
To:     Brendan Higgins <brendanhiggins@google.com>
Cc:     linux-input@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        linux-i2c@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        wsa@kernel.org, rentao.bupt@gmail.com,
        Ryan Chen <ryan_chen@aspeedtech.com>
References: <20200909203059.23427-1-eajames@linux.ibm.com>
 <20200909203059.23427-4-eajames@linux.ibm.com>
 <CAFd5g46ghV7ArmM8LnMkGa-Nip_fT934+3cPOkVxS-b5odZXYw@mail.gmail.com>
From:   Eddie James <eajames@linux.ibm.com>
Message-ID: <b092f884-9aa9-5d0b-1a90-36af558e43a8@linux.ibm.com>
Date:   Thu, 10 Sep 2020 08:55:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAFd5g46ghV7ArmM8LnMkGa-Nip_fT934+3cPOkVxS-b5odZXYw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-10_03:2020-09-10,2020-09-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009100120
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 9/10/20 4:00 AM, Brendan Higgins wrote:
> On Wed, Sep 9, 2020 at 1:31 PM Eddie James <eajames@linux.ibm.com> wrote:
>> Mask the IRQ status to only the bits that the driver checks. This
>> prevents excessive driver warnings when operating in slave mode
>> when additional bits are set that the driver doesn't handle.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> Reviewed-by: Tao Ren <rentao.bupt@gmail.com>
> Sorry, looks like I didn't get my comment in in time.
>
> Looks good in principle. One minor comment below:
>
>> ---
>>   drivers/i2c/busses/i2c-aspeed.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
>> index 31268074c422..724bf30600d6 100644
>> --- a/drivers/i2c/busses/i2c-aspeed.c
>> +++ b/drivers/i2c/busses/i2c-aspeed.c
>> @@ -69,6 +69,7 @@
>>    * These share bit definitions, so use the same values for the enable &
>>    * status bits.
>>    */
>> +#define ASPEED_I2CD_INTR_RECV_MASK                     0xf000ffff
> Could we define ASPEED_I2CD_INTR_RECV_MASK to be ASPEED_I2CD_INTR_ALL ?


That was my original thought... there is another define for that already 
a few lines down though.


Thanks,

Eddie


>
>>   #define ASPEED_I2CD_INTR_SDA_DL_TIMEOUT                        BIT(14)
>>   #define ASPEED_I2CD_INTR_BUS_RECOVER_DONE              BIT(13)
>>   #define ASPEED_I2CD_INTR_SLAVE_MATCH                   BIT(7)
>> @@ -604,6 +605,7 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>>          writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
>>                 bus->base + ASPEED_I2C_INTR_STS_REG);
>>          readl(bus->base + ASPEED_I2C_INTR_STS_REG);
>> +       irq_received &= ASPEED_I2CD_INTR_RECV_MASK;
>>          irq_remaining = irq_received;
>>
>>   #if IS_ENABLED(CONFIG_I2C_SLAVE)
>> --
>> 2.26.2
>>

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A03BF36454
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2019 21:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbfFETOg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jun 2019 15:14:36 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:52338 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726280AbfFETOf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jun 2019 15:14:35 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x55J6scn136456
        for <linux-i2c@vger.kernel.org>; Wed, 5 Jun 2019 15:14:34 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2sxh2mexnw-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-i2c@vger.kernel.org>; Wed, 05 Jun 2019 15:14:34 -0400
Received: from localhost
        by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-i2c@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Wed, 5 Jun 2019 20:14:33 +0100
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
        by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Wed, 5 Jun 2019 20:14:31 +0100
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
        by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x55JEUUd19595770
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 5 Jun 2019 19:14:30 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B9AA3C63D4;
        Wed,  5 Jun 2019 19:14:30 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 6D604C63CE;
        Wed,  5 Jun 2019 19:14:30 +0000 (GMT)
Received: from [9.41.179.222] (unknown [9.41.179.222])
        by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
        Wed,  5 Jun 2019 19:14:30 +0000 (GMT)
Subject: Re: [PATCH] i2c: fsi: Create busses for all ports
To:     Oliver <oohall@gmail.com>, Eddie James <eajames@linux.ibm.com>
Cc:     OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        linux-i2c@vger.kernel.org
References: <20190603055714.7203-1-oohall@gmail.com>
 <e546c15f-07a9-656a-ce11-4f9a24795d9a@linux.ibm.com>
 <CAOSf1CE5J93rai-VcZJJWkU=N=1=STtV2XqKQh_yLvQpXBKkHw@mail.gmail.com>
 <e578ae92-baf0-f55a-1cb4-82c992851483@linux.ibm.com>
 <CAOSf1CEA-S8ond9Bwk+CGQ9=OGwV9EevJRn7LB075615rbz65A@mail.gmail.com>
From:   Eddie James <eajames@linux.vnet.ibm.com>
Date:   Wed, 5 Jun 2019 14:14:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAOSf1CEA-S8ond9Bwk+CGQ9=OGwV9EevJRn7LB075615rbz65A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19060519-0004-0000-0000-00001518AA29
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011220; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01213711; UDB=6.00637935; IPR=6.00994785;
 MB=3.00027198; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-05 19:14:32
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060519-0005-0000-0000-00008BF3FBF8
Message-Id: <73d9cbde-3aa6-5e32-e7ab-5d7650aed5dd@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-06-05_11:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906050119
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 6/4/19 10:17 PM, Oliver wrote:
> On Wed, Jun 5, 2019 at 8:57 AM Eddie James <eajames@linux.ibm.com> wrote:
>>
>> On 6/4/19 1:14 AM, Oliver wrote:
>>> On Tue, Jun 4, 2019 at 12:15 AM Eddie James <eajames@linux.ibm.com> wrote:
>>>> On 6/3/19 12:57 AM, Oliver O'Halloran wrote:
>>>>> Currently we only create an I2C bus for the ports listed in the
>>>>> device-tree for that master. There's no real reason for this since
>>>>> we can discover the number of ports the master supports by looking
>>>>> at the port_max field of the status register.
>>>>>
>>>>> This patch re-works the bus add logic so that we always create buses
>>>>> for each port, unless the bus is marked as unavailable in the DT. This
>>>>> is useful since it ensures that all the buses provided by the CFAM I2C
>>>>> master are accessible to debug tools.
>>>>>
>>>>> Cc: Eddie James <eajames@linux.vnet.ibm.com>
>>>>> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
>>>>> ---
>>>>>     drivers/i2c/busses/i2c-fsi.c | 30 +++++++++++++++++++++++++-----
>>>>>     1 file changed, 25 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
>>>>> index 1e2be2219a60..59a76c6e31ad 100644
>>>>> --- a/drivers/i2c/busses/i2c-fsi.c
>>>>> +++ b/drivers/i2c/busses/i2c-fsi.c
>>>>> @@ -658,13 +658,27 @@ static const struct i2c_algorithm fsi_i2c_algorithm = {
>>>>>         .functionality = fsi_i2c_functionality,
>>>>>     };
>>>>>
>>>>> +static device_node *fsi_i2c_find_port_of_node(struct device_node *master,
>>>>> +                                           int port)
>>> Turns out I had a pile of compile fixes staged but not committed so
>>> this patch is totally broken. Oops.
>>>
>>>>> +{
>>>>> +     struct device_node *np;
>>>>> +
>>>>> +     for_each_child_of_node(fsi, np) {
>>>>> +             rc = of_property_read_u32(np, "reg", &port_no);
>>>>> +             if (!rc && port_no == port)
>>>>> +                     return np;
>>>>> +     }
>>>>> +
>>>>> +     return NULL;
>>>>> +}
>>>>> +
>>>>>     static int fsi_i2c_probe(struct device *dev)
>>>>>     {
>>>>>         struct fsi_i2c_master *i2c;
>>>>>         struct fsi_i2c_port *port;
>>>>>         struct device_node *np;
>>>>> +     u32 port_no, ports, stat;
>>>>>         int rc;
>>>>> -     u32 port_no;
>>>>>
>>>>>         i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
>>>>>         if (!i2c)
>>>>> @@ -678,10 +692,16 @@ static int fsi_i2c_probe(struct device *dev)
>>>>>         if (rc)
>>>>>                 return rc;
>>>>>
>>>>> -     /* Add adapter for each i2c port of the master. */
>>>>> -     for_each_available_child_of_node(dev->of_node, np) {
>>>>> -             rc = of_property_read_u32(np, "reg", &port_no);
>>>>> -             if (rc || port_no > USHRT_MAX)
>>>>> +     rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &state);
>>>>> +     if (rc)
>>>>> +             return rc;
>>>>> +
>>>>> +     ports = FIELD_GET(I2C_STAT_MAX_PORT, stat);
>>>>> +     dev_dbg(dev, "I2C master has %d ports\n", ports);
>>>> Thanks for the patch Oliver. This looks great except some older CFAM
>>>> types don't report the max port number, in which case this would not
>>>> probe up any ports. So we probably need a fallback to dts if the max
>>>> ports is 0.
>>> Hmm, The oldest CFAM spec I could find was v1.2 which is from the p6
>>> era and it includes the MAX_PORT field. When I was checking the spec I
>>> noticed that I mis-interpreted the meaning of MAX_PORT. It's actually
>>> the largest value you can write into the port field of the mode
>>> register rather than the number of ports the master supports. So zero
>>> is a valid value for MAX_PORT that you would see if the master only
>>> has one port.
>>
>> Yep, now that I look at the specs too, that is correct.
>>
>>
>>> Do you know if the old masters only had one port? If not, do you know
>>> what version (from the ext status reg) of the master doesn't support
>>> the max_port field?
>>
>> I used to have some more up-to-date specs but I can't seem to find
>> them... I think I see what's going on. Some versions of the CFAM have
>> the max port, or "upper threshold for ports" at bits 16-19, while others
>> have that information at 9-15 or 12-15... I'm not sure we can reliably
>> determine where/what that number will be. I'm open to suggestions!
> I had a look at the various docs I've got and they say:
>
> CFAM 1.2:      9 - 11 b ‘000’
>                12 - 15 Upper threshold for I2C ports (Port number - 1)
> p7 pervasive:  9 - 11 b ‘000’
>                12 - 15 Upper threshold for I2C ports (Port number - 1)
> p8 pervasive:  9 - 15 Upper threshold for I2C ports (Port number - 1)
> p9 pervasive:  9 - 15 Upper threshold for I2C ports (Port number - 1)
>
> Keep in mind these docs use IBM bit numbering. Translating to normal bits:
>
>    binary: 01111111 00000000 00000000
> bits set: 22, 21, 20, 19, 18, 17, 16 (7)
>   IBM 32b:  9, 10, 11, 12, 13, 14, 15
>
> And dropping the upper 3 bits gives you 16 - 19. Are you sure it's
> actually different or is this IBM bit ordering just screwing us again?


Ah, good point, I forgot it was backwards, I was puzzling over where I 
had originally gotten the 16-19. So it should be good to check 9-15 
(real 16-22) as the upper bits will be 0 in the older case.


>
> Anyway, while I was looking I noticed that between p7 and p8 they did
> change the layout of the mode register. The baud rate divider was
> extended from 8 to 16 bits and the port select field was moved from
> IBM(8,15) to IBM(16,21) to make room. If we need to support the older
> masters we'll need to fix that too.


Probably not worth it, I don't think anyone will try older processors 
with this driver now.

Thanks,

Eddie


>
> Oliver
>


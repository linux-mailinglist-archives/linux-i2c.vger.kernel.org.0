Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 448CF352E5
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2019 00:57:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726649AbfFDW5m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Jun 2019 18:57:42 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:34586 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726269AbfFDW5l (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 Jun 2019 18:57:41 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x54Mv0jH063398
        for <linux-i2c@vger.kernel.org>; Tue, 4 Jun 2019 18:57:40 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2sx0vhsxg6-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-i2c@vger.kernel.org>; Tue, 04 Jun 2019 18:57:40 -0400
Received: from localhost
        by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-i2c@vger.kernel.org> from <eajames@linux.ibm.com>;
        Tue, 4 Jun 2019 23:57:39 +0100
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
        by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Tue, 4 Jun 2019 23:57:36 +0100
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com [9.57.199.109])
        by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x54MvZhZ43909164
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 4 Jun 2019 22:57:35 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 88365112062;
        Tue,  4 Jun 2019 22:57:35 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 36877112066;
        Tue,  4 Jun 2019 22:57:35 +0000 (GMT)
Received: from [9.80.207.240] (unknown [9.80.207.240])
        by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
        Tue,  4 Jun 2019 22:57:35 +0000 (GMT)
Subject: Re: [PATCH] i2c: fsi: Create busses for all ports
To:     Oliver <oohall@gmail.com>
Cc:     OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        linux-i2c@vger.kernel.org, Eddie James <eajames@linux.vnet.ibm.com>
References: <20190603055714.7203-1-oohall@gmail.com>
 <e546c15f-07a9-656a-ce11-4f9a24795d9a@linux.ibm.com>
 <CAOSf1CE5J93rai-VcZJJWkU=N=1=STtV2XqKQh_yLvQpXBKkHw@mail.gmail.com>
From:   Eddie James <eajames@linux.ibm.com>
Date:   Tue, 4 Jun 2019 17:57:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAOSf1CE5J93rai-VcZJJWkU=N=1=STtV2XqKQh_yLvQpXBKkHw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19060422-2213-0000-0000-0000039A2072
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011216; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01213312; UDB=6.00637692; IPR=6.00994378;
 MB=3.00027185; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-04 22:57:37
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060422-2214-0000-0000-00005EB5FF43
Message-Id: <e578ae92-baf0-f55a-1cb4-82c992851483@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-06-04_15:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906040145
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 6/4/19 1:14 AM, Oliver wrote:
> On Tue, Jun 4, 2019 at 12:15 AM Eddie James <eajames@linux.ibm.com> wrote:
>>
>> On 6/3/19 12:57 AM, Oliver O'Halloran wrote:
>>> Currently we only create an I2C bus for the ports listed in the
>>> device-tree for that master. There's no real reason for this since
>>> we can discover the number of ports the master supports by looking
>>> at the port_max field of the status register.
>>>
>>> This patch re-works the bus add logic so that we always create buses
>>> for each port, unless the bus is marked as unavailable in the DT. This
>>> is useful since it ensures that all the buses provided by the CFAM I2C
>>> master are accessible to debug tools.
>>>
>>> Cc: Eddie James <eajames@linux.vnet.ibm.com>
>>> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
>>> ---
>>>    drivers/i2c/busses/i2c-fsi.c | 30 +++++++++++++++++++++++++-----
>>>    1 file changed, 25 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
>>> index 1e2be2219a60..59a76c6e31ad 100644
>>> --- a/drivers/i2c/busses/i2c-fsi.c
>>> +++ b/drivers/i2c/busses/i2c-fsi.c
>>> @@ -658,13 +658,27 @@ static const struct i2c_algorithm fsi_i2c_algorithm = {
>>>        .functionality = fsi_i2c_functionality,
>>>    };
>>>
>>> +static device_node *fsi_i2c_find_port_of_node(struct device_node *master,
>>> +                                           int port)
> Turns out I had a pile of compile fixes staged but not committed so
> this patch is totally broken. Oops.
>
>>> +{
>>> +     struct device_node *np;
>>> +
>>> +     for_each_child_of_node(fsi, np) {
>>> +             rc = of_property_read_u32(np, "reg", &port_no);
>>> +             if (!rc && port_no == port)
>>> +                     return np;
>>> +     }
>>> +
>>> +     return NULL;
>>> +}
>>> +
>>>    static int fsi_i2c_probe(struct device *dev)
>>>    {
>>>        struct fsi_i2c_master *i2c;
>>>        struct fsi_i2c_port *port;
>>>        struct device_node *np;
>>> +     u32 port_no, ports, stat;
>>>        int rc;
>>> -     u32 port_no;
>>>
>>>        i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
>>>        if (!i2c)
>>> @@ -678,10 +692,16 @@ static int fsi_i2c_probe(struct device *dev)
>>>        if (rc)
>>>                return rc;
>>>
>>> -     /* Add adapter for each i2c port of the master. */
>>> -     for_each_available_child_of_node(dev->of_node, np) {
>>> -             rc = of_property_read_u32(np, "reg", &port_no);
>>> -             if (rc || port_no > USHRT_MAX)
>>> +     rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &state);
>>> +     if (rc)
>>> +             return rc;
>>> +
>>> +     ports = FIELD_GET(I2C_STAT_MAX_PORT, stat);
>>> +     dev_dbg(dev, "I2C master has %d ports\n", ports);
>>
>> Thanks for the patch Oliver. This looks great except some older CFAM
>> types don't report the max port number, in which case this would not
>> probe up any ports. So we probably need a fallback to dts if the max
>> ports is 0.
> Hmm, The oldest CFAM spec I could find was v1.2 which is from the p6
> era and it includes the MAX_PORT field. When I was checking the spec I
> noticed that I mis-interpreted the meaning of MAX_PORT. It's actually
> the largest value you can write into the port field of the mode
> register rather than the number of ports the master supports. So zero
> is a valid value for MAX_PORT that you would see if the master only
> has one port.


Yep, now that I look at the specs too, that is correct.


>
> Do you know if the old masters only had one port? If not, do you know
> what version (from the ext status reg) of the master doesn't support
> the max_port field?


I used to have some more up-to-date specs but I can't seem to find 
them... I think I see what's going on. Some versions of the CFAM have 
the max port, or "upper threshold for ports" at bits 16-19, while others 
have that information at 9-15 or 12-15... I'm not sure we can reliably 
determine where/what that number will be. I'm open to suggestions!


Thanks,

Eddie



>
>
>> Thanks,
>>
>> Eddie
>>
>>
>>> +
>>> +     for (port_no = 0; port_no < ports; port_no++) {
>>> +             np = fsi_i2c_find_port_of_node(dev.of_node, port_no);
>>> +             if (np && !of_device_is_available(np))
>>>                        continue;
>>>
>>>                port = kzalloc(sizeof(*port), GFP_KERNEL);


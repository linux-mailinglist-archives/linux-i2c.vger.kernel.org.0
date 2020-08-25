Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A084C2520EB
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Aug 2020 21:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbgHYTsH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Aug 2020 15:48:07 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:18846 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726149AbgHYTsH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Aug 2020 15:48:07 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07PJVxDs006515;
        Tue, 25 Aug 2020 15:47:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=7Rl2UklbYVkVJfBrMuiwtrmhml+iZDfjKAcAFsLmd3w=;
 b=IJO6wug5RqiSOpBic/JM2E7zcG24hhtuSpdf7fsjlf13Y0352A1nu+kKrvvp2FSFh/Zr
 YYT3cViGFZF4kSEiAwTfvT8w9RSHuv0swMNpR7FYX36wrzELn3nUa1fTCsdtMI7SaZDs
 cVFE9Fbp3ubrpuKKMAMRPXK3xmkPiaScjEAUncQbEIOfDnIu5r/gw2PIa/PqboRwdtEg
 +ZpaJXgWP5JC2D998EK/gnlk6HFPJfuhcrgMR709RgDnOV07PwcMjERlCpHThLI39aFf
 FmssUYM3Vrfw3tJ7hk1NnO9OUHHn5Rs+yCBgWX2oQtc4TGkP6GJgeUtSxHSZh8wpngY3 +Q== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3358kn0tpu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 25 Aug 2020 15:47:55 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07PJWGuu007381;
        Tue, 25 Aug 2020 15:47:55 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3358kn0tpd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 25 Aug 2020 15:47:55 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
        by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07PJl7xm014803;
        Tue, 25 Aug 2020 19:47:54 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com [9.57.198.26])
        by ppma01dal.us.ibm.com with ESMTP id 332uttb3mf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 25 Aug 2020 19:47:54 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
        by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07PJlrQs16253940
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 25 Aug 2020 19:47:53 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 688C7AC05E;
        Tue, 25 Aug 2020 19:47:53 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 5A8F2AC059;
        Tue, 25 Aug 2020 19:47:52 +0000 (GMT)
Received: from [9.211.52.131] (unknown [9.211.52.131])
        by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
        Tue, 25 Aug 2020 19:47:52 +0000 (GMT)
Subject: Re: [PATCH 3/5] i2c: aspeed: Mask IRQ status to relevant bits
To:     Joel Stanley <joel@jms.id.au>
Cc:     linux-input@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        linux-i2c@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        dmitry.torokhov@gmail.com, Rob Herring <robh+dt@kernel.org>
References: <20200820161152.22751-1-eajames@linux.ibm.com>
 <20200820161152.22751-4-eajames@linux.ibm.com>
 <CACPK8XdG1+3eQPQ71fZYZdHwcn8WNLQKF=5iKrOvGhLwispSQA@mail.gmail.com>
From:   Eddie James <eajames@linux.ibm.com>
Message-ID: <8fc365dd-8a89-9e5c-ed70-093ef2bf7265@linux.ibm.com>
Date:   Tue, 25 Aug 2020 14:47:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XdG1+3eQPQ71fZYZdHwcn8WNLQKF=5iKrOvGhLwispSQA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-25_08:2020-08-25,2020-08-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0
 mlxlogscore=861 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008250143
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 8/25/20 1:38 AM, Joel Stanley wrote:
> On Thu, 20 Aug 2020 at 16:12, Eddie James <eajames@linux.ibm.com> wrote:
>> Mask the IRQ status to only the bits that the driver checks. This
>> prevents excessive driver warnings when operating in slave mode
>> when additional bits are set that the driver doesn't handle.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   drivers/i2c/busses/i2c-aspeed.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
>> index 31268074c422..abf40f2af8b4 100644
>> --- a/drivers/i2c/busses/i2c-aspeed.c
>> +++ b/drivers/i2c/busses/i2c-aspeed.c
>> @@ -604,6 +604,7 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>>          writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
>>                 bus->base + ASPEED_I2C_INTR_STS_REG);
>>          readl(bus->base + ASPEED_I2C_INTR_STS_REG);
>> +       irq_received &= 0xf000ffff;
>>          irq_remaining = irq_received;
> This would defeat the check for irq_remaining. I don't think we want to do this.
>
> Can you explain why these bits are being set in slave mode?


No, I don't have any documentation for the bits that are masked off 
here, so I don't know why they would get set.

The check for irq_remaining is still useful for detecting that the 
driver state machine might be out of sync with what the master is doing.


Thanks,

Eddie



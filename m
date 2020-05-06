Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A20F1C718F
	for <lists+linux-i2c@lfdr.de>; Wed,  6 May 2020 15:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728082AbgEFNTg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 May 2020 09:19:36 -0400
Received: from mail-eopbgr140103.outbound.protection.outlook.com ([40.107.14.103]:24295
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728317AbgEFNTf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 May 2020 09:19:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fRYdB7ajn8poyS/vgzsTXkrNTzZ/d6MtDxx4w0PsYWDG/j+O+Pzkma/Q58GPkEK5+bmJ0zuy1QLvw2Yi/Pj2jVH5pylxnMV/8AWOTFJsNVngwa88U/hXLpwajVarVCZrr8Ccr3UPSUclaNUgiJVG/RjRAnNM8EFDDV+kTkX3PMOdjzo+CSF+F63t4J2gVjft/+HNk26saNMKRIMoxFkGXOkk62UveOrthi6jmb9CfAIAP4R1/Zk6ELVj7yw9kro7zhxdsVwjriTKoAjjj+I7XR6fDQH8RrFyaK8rppvN9zCqpTQAXd3r3Q7d9krlveG8K7+xxkGnHaoGiBt5KoTYWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkKxW7H7X1S0Vdjf6U3y5CLocMN2EGhJZogDfgj6Z3w=;
 b=VDyd/s7H9+QglYcRBBTTvbv1DZcRIxOhBgsyy74M3erkKvJWHw2OW/VMgi4AjXKQx+cdFSYA4fmbv2BxglCLywGuYZ0bS7Shdi8FG63mI9LqcFPYuM98JIe9qS91ElVG0EpHg4Kw1ByQ7CDVesCSiibImmII1x+SnFVzLaB6QCDZdSFEx/xmMbR2tdkQbANT3uuFzwlLB1Fi9D0Qzr5xMclI30Uxa9k53SOZL6MkmF6OYGmUE6cv6LKS9laCNC9MXh4Fn3c+o84FHNJM9xdzfFkWUapsbfxuA6UIDWr2yDTFtrm0R9zMVQ7EMbE/7V5G6ZInB46tm9CFnIrmmHytiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkKxW7H7X1S0Vdjf6U3y5CLocMN2EGhJZogDfgj6Z3w=;
 b=TdXwhhEzUdWCYhfKXoS65F+70Esk+vAiWxkl55QtCv+/Ay3Uw00XRV7Ogpia8U9eTz1G5F60H5ZNng+g/uJBHiUQjwBPEw9353tXY1IdmCaKnNqFIAxpdNixyeqWAxVmHxALN/57lMZOT7XWKu/Go2drSP7oXhXtEr4clU0D36M=
Authentication-Results: the-dreams.de; dkim=none (message not signed)
 header.d=none;the-dreams.de; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB8PR02MB5962.eurprd02.prod.outlook.com (2603:10a6:10:f8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Wed, 6 May
 2020 13:19:32 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::38:8a98:465a:1a0a]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::38:8a98:465a:1a0a%7]) with mapi id 15.20.2958.030; Wed, 6 May 2020
 13:19:32 +0000
Subject: Re: [PATCH v3 1/4] i2c: mux: pca954x: Refactor pca954x_irq_handler()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
References: <20200425115152.29475-1-andriy.shevchenko@linux.intel.com>
 <20200506124242.GH185537@smile.fi.intel.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <5f4f3714-e37c-d2ec-51eb-8cc3c9dd57de@axentia.se>
Date:   Wed, 6 May 2020 15:19:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <20200506124242.GH185537@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: sv-SE
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR0902CA0009.eurprd09.prod.outlook.com
 (2603:10a6:3:e5::19) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (213.112.138.116) by HE1PR0902CA0009.eurprd09.prod.outlook.com (2603:10a6:3:e5::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28 via Frontend Transport; Wed, 6 May 2020 13:19:31 +0000
X-Originating-IP: [213.112.138.116]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb3190e2-b9a9-45a5-4433-08d7f1c01d26
X-MS-TrafficTypeDiagnostic: DB8PR02MB5962:
X-Microsoft-Antispam-PRVS: <DB8PR02MB596203539E3E79AD8FF9A88EBCA40@DB8PR02MB5962.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 03950F25EC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wq1/keprQLw+WWmY/u6gaUCvq/8BuSQidTlcQ+4cHvvX08OUn9is+LkMueW2m3dnikDAdrYe6Ilgd9FAQESgbsSVDVaOJ1uP/EB9Ff27DOQ9L9dMa3nPU0y8y+0B1FHwVjBGnVKRhGn+HdN6YBvVGcMIWYHRBK5Us7zG14PX+4vTtg9DJOItSd3bN62MmIxebq9n3tVfNtYfTTV9bNW9asPzZ7/xqdBOmCUM5bAGLLFBfxO1ElZ0WfHrZlQpJTm8z37mcA91SpjAczvNptCrCJiBmxj7sqWk8pjHCCmtBwz/bXimns+WexAWpBlj1xF694jW4I/Rk3I+GA78V/srGlXMGF6BIbRyPftZrSOlpIBM2sRo2okl2IAohky2UzFaTL4l+7x3sjwfl8/h4svCq2AwIsOLl+bCD+8D/dc3lj8zs6dl4EVekie8kpnMDQ66YETSrrABiy0gzSRMVALetmwucbaFgwLyL5sB0Dd6fcuEJ7z6mqmVjWej8jrMVJQspOfrhLW2kyQ1XVVQ8L63SQbwd5Fyfh1S+yviHjCf8Gt63sU4jlZdhYby4iXd8n4f
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(346002)(396003)(366004)(376002)(39830400003)(33430700001)(31686004)(956004)(2616005)(8936002)(5660300002)(316002)(2906002)(508600001)(53546011)(16526019)(26005)(110136005)(186003)(36756003)(66556008)(66476007)(6486002)(52116002)(31696002)(16576012)(36916002)(66946007)(86362001)(8676002)(33440700001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: pk71guIgii74CmvypfxcRw83VTK017mcg1SKehUO3bF8iNfCzRHOpJXzmUdWBXBSLa2+kMmKW/QG0N/+m09Aj1JbwKNkM6YMMrohqsUg2rTU1Npg2sxO55nJ3hW8d+sCKV0jD1lwuk/Vn4gYpBhUjWHRuS76BI7Dqg02Z0oU0eWzCdK9auwDPKL3uNnJOZ7nXImEKBp5lD45SJljyftWCngUYDiVNJHLsj9SrLzb70vv9+IZ4nAQIo3reRh42oho+YkLOy29JBwGCW4U7KI8V3K2EnXxaw9rrvxr9VHNiS1K9pX7/mSkziGswFpf26kR4JswsIewRSijr1JZcPgVS3AK4jQrMt1zTm9DfcFUE4Sz0AWU2Mq2JxaUXZFbjaTlAFXUp2x7ZmkEOiKYk/4SAiTcJGRkdYX2S/m9qup4lGYjyBQLUe/7zBq1zNTfeQLzlFd6Rn9bSrUcf9a9dqlqMwKBnUNRfngejK057PTi0f/mkxvxrQLsjt4EQeUGbaNHHPv9lIegP/1aZI6HgeVhUNPk2Pz/Tt4cDrWU6On8Jdrt2A+/pNDsCo/fuNL0jWP0KvxjpsYV9usgvIXmtZx8p45U366FzhghHN5rvmlY0Sq861GfFT0xrUeYSGiy6UQqO+TPGO7TZC/hd/wLXU9KS0i4+88Wkm1ZJfHo75f2RfY2mQKmAE9anHWy/s/Xkgs3Nzruv7uqLi3xVi2Cv/2y63Al3k3xDqh5MwEcMXcb8E7oRH1ufutAkRsWbVXy4raWluziD9OpYG23VSI4MxpcSAemN3vc7P8jcJB062AHHoDOgv811eS6GV0y1OjWbqwP
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: cb3190e2-b9a9-45a5-4433-08d7f1c01d26
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2020 13:19:32.3994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IK86952Z4NE4zCz9cbliB2xI0Ye2Mq2aWeC3EMhhQCUuvCMIvCFZn38XjNOPiVkW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5962
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2020-05-06 14:42, Andy Shevchenko wrote:
> On Sat, Apr 25, 2020 at 02:51:49PM +0300, Andy Shevchenko wrote:
>> Refactor pca954x_irq_handler() to:
>>   - use for_each_set_bit() macro
>>   - use IRQ_RETVAL() macro
>>
>> Above change makes code easy to read and understand.
> 
> If there is no comments, Wolfram, can you apply this?

Perhaps that's best, I have had the intention to get to this for a very long
time and I'm very sorry for delaying. The number of patches for i2c-mux is so
low that I have not bothered to automate the process, but that also means that
I have to sort of rediscover how to do it a few times a year. It's simply not
effective...

Wolfram, I think it would be better if I just quit my i2c-mux tree and I
instead review/ack patches that you then take. Would that be ok with you?

Again, sorry for being a road-block.

Reviewed-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter

>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> ---
>> v3: rebase on top of latest rc
>>  drivers/i2c/muxes/i2c-mux-pca954x.c | 17 +++++++----------
>>  1 file changed, 7 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
>> index a0d926ae3f864..b764c7c746e96 100644
>> --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
>> +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
>> @@ -327,21 +327,18 @@ static DEVICE_ATTR_RW(idle_state);
>>  static irqreturn_t pca954x_irq_handler(int irq, void *dev_id)
>>  {
>>  	struct pca954x *data = dev_id;
>> -	unsigned int child_irq;
>> -	int ret, i, handled = 0;
>> +	unsigned long pending;
>> +	int ret, i;
>>  
>>  	ret = i2c_smbus_read_byte(data->client);
>>  	if (ret < 0)
>>  		return IRQ_NONE;
>>  
>> -	for (i = 0; i < data->chip->nchans; i++) {
>> -		if (ret & BIT(PCA954X_IRQ_OFFSET + i)) {
>> -			child_irq = irq_linear_revmap(data->irq, i);
>> -			handle_nested_irq(child_irq);
>> -			handled++;
>> -		}
>> -	}
>> -	return handled ? IRQ_HANDLED : IRQ_NONE;
>> +	pending = (ret >> PCA954X_IRQ_OFFSET) & (BIT(data->chip->nchans) - 1);
>> +	for_each_set_bit(i, &pending, data->chip->nchans)
>> +		handle_nested_irq(irq_linear_revmap(data->irq, i));
>> +
>> +	return IRQ_RETVAL(pending);
>>  }
>>  
>>  static int pca954x_irq_set_type(struct irq_data *idata, unsigned int type)
>> -- 
>> 2.26.2
>>
> 

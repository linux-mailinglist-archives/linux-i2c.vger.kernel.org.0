Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0486717C10C
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Mar 2020 15:58:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbgCFO6D (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Mar 2020 09:58:03 -0500
Received: from mail-eopbgr10122.outbound.protection.outlook.com ([40.107.1.122]:60494
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726565AbgCFO6C (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 6 Mar 2020 09:58:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KjNS7hBhGd1za2XM79Fqsei4OkIDYKYdElx9xSH2+Z4eqF4D5/9RlqA0JtyZ1A1w2343FobyYIahEZefxuNeSsIecoUVsQ/Zs2RMBZ9GCSvfsoU2155A7/xJHo6of4SrslgrUH/vtjXN5Ztgs9pFsYzQip0gYZw71PHlsovV6fedm0qUvDO22sPxeESybEOBu2Ka9IpjtUkeF5YacpUzS91LNGPtKRyTWgPFfJ0SqJwmbzc75LlWepifs8j/iqlSIewKL7ZozjIFQFTC8JoGmW2aY4GFl1CMlMnfujL+hhIFJhvnWgPxGoLt3ca6i946y/XGblK8zOdHP/yTq+7PCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wA9Wr019kkmt0cxJyAQVn0dNa/JGHweoYxcFeoqrXHo=;
 b=TgQomt81M/s9yEukn4aaJ4YnXEHPNzsY5YTBZkuT/hu3guyDaHF7WFXnsTbh0ifkXQ2HE5h6vRFTe8leHiy3ojKH4aEp+Dr3HtAjHTRauva5bbOJQvdNVgEmosEdlMXHQ5vVwUJx0d+tYhkJP+8Fm6QZWDImyfdKj8Bgtw1x5Jx8AlKNmKgK6sCP4aKJkZl5WT1YmYUssM1/n5HzGNZaPT9D1y164NmWmWGaPk/Ojz+16RpK2NlUKKsH0/7BPvgxq1GgU/jaMnSZCtgPisciD19Gu60oYgPUObDL1uZ0Dhhy1sSVc8qd8kykIXD8Z0WF94AZUebm0FBez0T6/xyF1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wA9Wr019kkmt0cxJyAQVn0dNa/JGHweoYxcFeoqrXHo=;
 b=Ho9DT5DmMgaplpjGodT2oEiZXQtBvSTqcRYWgU1CBWlur0ir09A8Bz8NblWRoY5ap1rOxj++EnsTxIEkoWQNKl+wF7N3Yh0tKb3VwWDVEudobUJi0Z+UQET5LCZtIzQOXXXtb8MqFPV/nDNWlRZWgycOafLus6d7P0W2GfQEtuY=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3467.eurprd02.prod.outlook.com (52.134.67.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.14; Fri, 6 Mar 2020 14:57:55 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::105:b8bf:3b3:5e17]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::105:b8bf:3b3:5e17%7]) with mapi id 15.20.2793.013; Fri, 6 Mar 2020
 14:57:55 +0000
Subject: Re: [PATCH v1 2/5] i2c: mux: pca954x: Make use of device properties
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Javier Martinez Canillas <javierm@redhat.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>
References: <20200305155352.39095-1-andriy.shevchenko@linux.intel.com>
 <20200305155352.39095-2-andriy.shevchenko@linux.intel.com>
 <cf0cf14f-4e43-2a9c-63ed-f5f03ea7b114@axentia.se>
 <20200306095413.GQ1224808@smile.fi.intel.com>
 <b19fb2ed-054a-3fc5-41d4-6ecf3ae1597b@axentia.se>
 <20200306135850.GF1748204@smile.fi.intel.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <db6c657b-6b9c-77f9-f990-90e47f48688e@axentia.se>
Date:   Fri, 6 Mar 2020 15:57:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
In-Reply-To: <20200306135850.GF1748204@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1PR0101CA0019.eurprd01.prod.exchangelabs.com
 (2603:10a6:3:77::29) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (213.112.137.122) by HE1PR0101CA0019.eurprd01.prod.exchangelabs.com (2603:10a6:3:77::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.15 via Frontend Transport; Fri, 6 Mar 2020 14:57:54 +0000
X-Originating-IP: [213.112.137.122]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9072f59c-dfe6-4e1e-13da-08d7c1dec06d
X-MS-TrafficTypeDiagnostic: DB3PR0202MB3467:
X-Microsoft-Antispam-PRVS: <DB3PR0202MB34675E698D530C42802E0581BCE30@DB3PR0202MB3467.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0334223192
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10019020)(376002)(366004)(396003)(136003)(346002)(39840400004)(199004)(189003)(2906002)(66946007)(186003)(4326008)(54906003)(5660300002)(52116002)(16526019)(53546011)(66556008)(6916009)(66476007)(8676002)(16576012)(26005)(36916002)(6666004)(31686004)(81156014)(81166006)(316002)(8936002)(508600001)(36756003)(2616005)(6486002)(86362001)(956004)(31696002);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3467;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5jChX3RRdb5MoKYEiuXuyMgfIEPBiZHzel2mDjQEe8U9IXNSX6gqqMu//hWSBUrrSKSe4aupNZgBc3XAJK+0K0Lx9zBIwQEsKF5ve7TJ4MDPu53tm8XAT8+Y8gNEpUtkK7kyOUx6JHAJ+mDxCxi7T4bN06LojI8jcmaCyp/eg8i9UAP74opMam+C3Av2hGW6BnkbL0KojWosQCZU1GSymvESOS/x+6lXqHmAwSyj5OjpKDaW9wiZhTgFDvXkiI/joEtDivASMDoMTs/Un8sHbsvE0jU/Gl8fbiICXyrOSUsb/yEuI6sMN55b+LJmlx3wGeFcmrfT9QYg6bGZ1x35k/7UhsQl7K84YA5+QMal4fvMwkoaNSMP6QPWa/9nXLgK2BRG/Zze6VvU5Vxn/NmOMwjqs57ULjAVXQKryyMT7KnN020UgHWD4/6z8SbYLfYi
X-MS-Exchange-AntiSpam-MessageData: g/BYjAFOyq1VvpAesS7w4ZcRrusa51osFbTHigsKGZ7WqXcD340pNvYo4hJ6DMtsjPgiNMF9okBlJSVNOkzAnsPXK3r2vS3HPRoLIAh2FZ5iQxd6/pJ3FOr99GGsbfZ4Fppyw1a5h8zTvUbJx+O2Xg==
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 9072f59c-dfe6-4e1e-13da-08d7c1dec06d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2020 14:57:55.2998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WPWklgY6FpjuVA+4grZciYo3esClteNGK1OcIGPbZq+qu4wfjlhHWumHpq1T9tWX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3467
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2020-03-06 14:58, Andy Shevchenko wrote:
> On Fri, Mar 06, 2020 at 12:48:14PM +0100, Peter Rosin wrote:
>> On 2020-03-06 10:54, Andy Shevchenko wrote:
>>> On Thu, Mar 05, 2020 at 09:05:56PM +0000, Peter Rosin wrote:
>>>> On 2020-03-05 16:53, Andy Shevchenko wrote:
>>>>> Device property API allows to gather device resources from different sources,
>>>>> such as ACPI. Convert the drivers to unleash the power of device property API.
>>>
>>> ...
>>>
>>>>>  static const struct i2c_device_id pca954x_id[] = {
>>>>> -	{ "pca9540", pca_9540 },
>>>>> -	{ "pca9542", pca_9542 },
>>>>> -	{ "pca9543", pca_9543 },
>>>>> -	{ "pca9544", pca_9544 },
>>>>> -	{ "pca9545", pca_9545 },
>>>>> -	{ "pca9546", pca_9546 },
>>>>> -	{ "pca9547", pca_9547 },
>>>>> -	{ "pca9548", pca_9548 },
>>>>> -	{ "pca9846", pca_9846 },
>>>>> -	{ "pca9847", pca_9847 },
>>>>> -	{ "pca9848", pca_9848 },
>>>>> -	{ "pca9849", pca_9849 },
>>>>> +	{ "pca9540", .driver_data = (kernel_ulong_t)&chips[pca_9540] },
>>>>> +	{ "pca9542", .driver_data = (kernel_ulong_t)&chips[pca_9542] },
>>>>> +	{ "pca9543", .driver_data = (kernel_ulong_t)&chips[pca_9543] },
>>>>> +	{ "pca9544", .driver_data = (kernel_ulong_t)&chips[pca_9544] },
>>>>> +	{ "pca9545", .driver_data = (kernel_ulong_t)&chips[pca_9545] },
>>>>> +	{ "pca9546", .driver_data = (kernel_ulong_t)&chips[pca_9546] },
>>>>> +	{ "pca9547", .driver_data = (kernel_ulong_t)&chips[pca_9547] },
>>>>> +	{ "pca9548", .driver_data = (kernel_ulong_t)&chips[pca_9548] },
>>>>> +	{ "pca9846", .driver_data = (kernel_ulong_t)&chips[pca_9846] },
>>>>> +	{ "pca9847", .driver_data = (kernel_ulong_t)&chips[pca_9847] },
>>>>> +	{ "pca9848", .driver_data = (kernel_ulong_t)&chips[pca_9848] },
>>>>> +	{ "pca9849", .driver_data = (kernel_ulong_t)&chips[pca_9849] },
>>>>
>>>> It feels odd/wrong to specifically name .driver_data when .name is not there.
>>>> None or both...
>>>
>>> I will add .name as well.
>>>
>>>>> +	data->chip = device_get_match_data(dev);
>>>>>  	if (!data->chip)
>>>>>  		data->chip = &chips[id->driver_data];
>>>>
>>>> These two lines no longer make any sence.
>>>
>>> Please elaborate.
>>>
>>> IIRC Javier explained once that I²C ID table is still good to have to allow
>>> enumeration from user space.
>>
>> id->driver_data is no longer an integer index into chips[]. So, for the I2C
>> ID table case, either device_get_match_data returns the .driver_data as-is
>> from the pca954x_id array, or it returns NULL (I don't know which it is).
> 
> No, you took it wrong. device_get_match_data() operates with ACPI/DT tables.

<rant-mode>

What do you mean wrong? I said that either A or B holds but did not know which
(with these definitions):

A. device_get_match_data() digs in the i2c_device_id table and returns the
   .driver_data of the matching entry.
B. device_get_match_data() behaves as of_device_get_match_data() and does not
   dig in the i2c_device_id table, and therefore returns NULL when the driver
   is probed that way.

And that in either of these cases your patch made no sense.

At least that was what I tried to say, using less words...

And then, according to you, B holds. So, I was right: either A or B holds. BTW,
I obviously meant the either/or construct to be in the exclusive sense where
both cannot hold (but my statement is also correct in the inclusive-or sense).

I would only have been wrong if the correct description had been some third
option, which I had not mentioned. But that was apparently not the case.

Cheers,
Peter

> 
>> In the first case, if (!data->chip) ...; is useless dead code. In the latter
>> case, it should be
>>
>> 	if (!data->chip)
>> 		data->chip = (whatever-type-chip-is *)id->driver_data;
>>
>> (If it's this latter case, I get the feeling that changing the .driver_data
>> of pca954x_id is an orthogonal change that has little to do with using
>> device properties instead of of-specifics.)
> 
> But this comment is good, seems I missed that and actually change is not needed
> indeed.
> 

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42FB217BC19
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Mar 2020 12:49:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbgCFLtD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Mar 2020 06:49:03 -0500
Received: from mail-eopbgr60134.outbound.protection.outlook.com ([40.107.6.134]:52045
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726171AbgCFLtD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 6 Mar 2020 06:49:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=djifnzojMfyd+RJ0Rq9mAbCOr+ZoNnPB8drPSwUpPfu57HMYX1HE29+wTVPY1O7r0A1cL8Cqubme5XQd5AITkKWuUlmKNO6fzrF/vVJoGLmmG4ifd1X7o8V9gCsnxCfdhOaw5ZVWbSuxYfPi5JLBD3JT4Mr/NJDsV6U1apuG7AI8i1oUCPUrAxnzLyYH3oXObUawqlj7t90GE65mVoFlBlHGEZ3+7eqJC7QA49qg65Dua62Xi5PuZxfWh2uqN7YYL/7jV9xE61MwEdVMO/+shvV24mD+aBWlcDb6bbDyInN9RoVCvW0okkF3e3yH3vM0ojEtdPCyb2DqwvzijXMPFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=72DIsgN7F9fgHoK5Jp8ltqzeGXZfTyaSHxgdxpLu0js=;
 b=JASK17iSh0gRzEKrAtoyOR3dbWm+e/gjVq3i51hUAwHQgEjR1z9JvODo29emW/73qmfDNwhhnMikm0H00To47Fg6qj/PRGOrtCVd97pY3Tv2sK8kTG4fIQdpKgeTxvubX2Q8XansotCmosRKdYo2VMCyVsVUJZSbdJgrxv7/87clVUALjWJC9diczuvmb3aewdg5me1PAimDGkHdATjMwpXb7ziePRuAT/N9/3HEjQ90KqQP6jwi+c0kI/LxgxKue328rMvjb/+rZ9Je+Nxyh6ftxdD1MVXcQI+gELz7qK4sD/k82TEt75t8Cys8Ibi7S58OA8aO/QhvLme/oCm2Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=72DIsgN7F9fgHoK5Jp8ltqzeGXZfTyaSHxgdxpLu0js=;
 b=WH4eGk4tHvN5vI8rnjCdbpEiQHv32j31Of+yJ09znwZ7adCuBObJpxUcYVg+TecJew29wBGzdEbcHqBy2UI+qZ1LByK0XUTp4utAZvWi8PYgYBf5yDKTSC46e0rcft3GaEejyxKpQx+mRYXfqiISyDk2QyaDeMOwNE8cDj14uOs=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3273.eurprd02.prod.outlook.com (52.134.65.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.16; Fri, 6 Mar 2020 11:48:19 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::105:b8bf:3b3:5e17]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::105:b8bf:3b3:5e17%7]) with mapi id 15.20.2793.013; Fri, 6 Mar 2020
 11:48:19 +0000
Subject: Re: [PATCH v1 2/5] i2c: mux: pca954x: Make use of device properties
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Javier Martinez Canillas <javierm@redhat.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>
References: <20200305155352.39095-1-andriy.shevchenko@linux.intel.com>
 <20200305155352.39095-2-andriy.shevchenko@linux.intel.com>
 <cf0cf14f-4e43-2a9c-63ed-f5f03ea7b114@axentia.se>
 <20200306095413.GQ1224808@smile.fi.intel.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <b19fb2ed-054a-3fc5-41d4-6ecf3ae1597b@axentia.se>
Date:   Fri, 6 Mar 2020 12:48:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
In-Reply-To: <20200306095413.GQ1224808@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1P192CA0015.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::25)
 To DB3PR0202MB3434.eurprd02.prod.outlook.com (2603:10a6:8:5::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (213.112.137.122) by HE1P192CA0015.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.16 via Frontend Transport; Fri, 6 Mar 2020 11:48:18 +0000
X-Originating-IP: [213.112.137.122]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7f486ad-f1ef-4ee4-4a06-08d7c1c443db
X-MS-TrafficTypeDiagnostic: DB3PR0202MB3273:
X-Microsoft-Antispam-PRVS: <DB3PR0202MB3273656414840C420F19AB43BCE30@DB3PR0202MB3273.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0334223192
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10019020)(376002)(396003)(346002)(366004)(136003)(39830400003)(199004)(189003)(26005)(8676002)(31696002)(4326008)(5660300002)(81156014)(81166006)(6666004)(186003)(86362001)(8936002)(53546011)(54906003)(66476007)(66556008)(36756003)(16526019)(66946007)(6486002)(508600001)(31686004)(2906002)(110136005)(956004)(316002)(16576012)(36916002)(52116002)(2616005);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3273;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EdXffZV86Qx/SdL375yiVPjCjaYgzmo4A7dkmU0jd/NUgZB4bkLYtw/QKI7pI/Jx9XRj26vjRjLhAeipbYG4Y51O4rHligEN/r92kHvlmi4Uot47bnRZ6njVFhTxh3J1PZhIOxzsFo2JYtavLGGPJhOGHr+0Q0Wvxgu963sB6dCthcwg91sDLGITHe/ldX0IrUF39SMuW79H3RXDkhUpBOcCI6iZ1Z8PvbMAsIkGKIYImkmbwXhqDMsRNo1HpOtYExqgkeM8MifmIlFpC+bHjfu52MwkuMwzj22QorW0+HD3eOzIJBU7I7Lrdr13RKumBFEom45PAm2+fqN1ZASMPZRGdnEi8ltTwupZpwkn69o9Fpm15CVbRNzy8ASNKHl1jDrukp+tLd+pFUVQUccdg/AQ/4eM5hvvdkI2vpYLvDjfHZrR0JNXNOSk1XPT6G0i
X-MS-Exchange-AntiSpam-MessageData: MaXemq95FdCUZPOv84eK0VdBU094eby8TE+hPvsoJ1SkF0W+oP1BuKGN5/p1YgjgDDDSiZlsGzufJA7IG30HEy03YcdwAz2FBEM7HH9Cmyc/pzi3nP/sxrsH36/FI2XZ8IuMW+GUwUxco4VN41R1HQ==
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: c7f486ad-f1ef-4ee4-4a06-08d7c1c443db
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2020 11:48:19.5008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k6l9Z6aWCdIt/JqqrDSs2zLijsggfXS2pu7GdIUhjWA6oFVTG5ES5SEFopSH5QZN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3273
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 2020-03-06 10:54, Andy Shevchenko wrote:
> On Thu, Mar 05, 2020 at 09:05:56PM +0000, Peter Rosin wrote:
>> On 2020-03-05 16:53, Andy Shevchenko wrote:
>>> Device property API allows to gather device resources from different sources,
>>> such as ACPI. Convert the drivers to unleash the power of device property API.
> 
> ...
> 
>>>  static const struct i2c_device_id pca954x_id[] = {
>>> -	{ "pca9540", pca_9540 },
>>> -	{ "pca9542", pca_9542 },
>>> -	{ "pca9543", pca_9543 },
>>> -	{ "pca9544", pca_9544 },
>>> -	{ "pca9545", pca_9545 },
>>> -	{ "pca9546", pca_9546 },
>>> -	{ "pca9547", pca_9547 },
>>> -	{ "pca9548", pca_9548 },
>>> -	{ "pca9846", pca_9846 },
>>> -	{ "pca9847", pca_9847 },
>>> -	{ "pca9848", pca_9848 },
>>> -	{ "pca9849", pca_9849 },
>>> +	{ "pca9540", .driver_data = (kernel_ulong_t)&chips[pca_9540] },
>>> +	{ "pca9542", .driver_data = (kernel_ulong_t)&chips[pca_9542] },
>>> +	{ "pca9543", .driver_data = (kernel_ulong_t)&chips[pca_9543] },
>>> +	{ "pca9544", .driver_data = (kernel_ulong_t)&chips[pca_9544] },
>>> +	{ "pca9545", .driver_data = (kernel_ulong_t)&chips[pca_9545] },
>>> +	{ "pca9546", .driver_data = (kernel_ulong_t)&chips[pca_9546] },
>>> +	{ "pca9547", .driver_data = (kernel_ulong_t)&chips[pca_9547] },
>>> +	{ "pca9548", .driver_data = (kernel_ulong_t)&chips[pca_9548] },
>>> +	{ "pca9846", .driver_data = (kernel_ulong_t)&chips[pca_9846] },
>>> +	{ "pca9847", .driver_data = (kernel_ulong_t)&chips[pca_9847] },
>>> +	{ "pca9848", .driver_data = (kernel_ulong_t)&chips[pca_9848] },
>>> +	{ "pca9849", .driver_data = (kernel_ulong_t)&chips[pca_9849] },
>>
>> It feels odd/wrong to specifically name .driver_data when .name is not there.
>> None or both...
> 
> I will add .name as well.
> 
>>> +	data->chip = device_get_match_data(dev);
>>>  	if (!data->chip)
>>>  		data->chip = &chips[id->driver_data];
>>
>> These two lines no longer make any sence.
> 
> Please elaborate.
> 
> IIRC Javier explained once that I²C ID table is still good to have to allow
> enumeration from user space.

id->driver_data is no longer an integer index into chips[]. So, for the I2C
ID table case, either device_get_match_data returns the .driver_data as-is
from the pca954x_id array, or it returns NULL (I don't know which it is).
In the first case, if (!data->chip) ...; is useless dead code. In the latter
case, it should be

	if (!data->chip)
		data->chip = (whatever-type-chip-is *)id->driver_data;

(If it's this latter case, I get the feeling that changing the .driver_data
of pca954x_id is an orthogonal change that has little to do with using
device properties instead of of-specifics.)

Cheers,
Peter

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 490CC43BBF9
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Oct 2021 23:02:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239355AbhJZVEn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Oct 2021 17:04:43 -0400
Received: from mail-eopbgr00100.outbound.protection.outlook.com ([40.107.0.100]:61669
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237062AbhJZVEn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 26 Oct 2021 17:04:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MypIwvsjeFY6IfQc8V2yaVfavk8GkuYLBJbWHqhTZdWSAOR0b2um+01rg8aQlEZFyy7Kj9qnWQ/dt6H2Ayq7kLpm+ltLgHoTLna1eENzXekRyvotP5vtsaMRyYf8h+1h+6TIHLEM9cVCE801AwHPFV8yF2tVuMEiKtk1AVkn9zXa5J2cUpGpCanwE4yb9I+09zuYxEzGY4yCAlaqhsFPS35bXwnPDwE8RnygrqFDO7+i7OZZZRnGqu+zo4m0vS3sG9qJRfmvjoviaBQi1MkEbIaSgCgQW0y6rH8sCoq+hEdXNqjF7KNqoWYGNq/Z1MbasScluga9m8P8FjgxTlUpOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DwFZx+IdakwOTz+U5CmZHH7rKbkHtHaFXCZLTyveIkE=;
 b=fxm6KVAtlf8GgffojuR7mmluYhizXeEOlfCCC/X78C4QGhXzdMEjLu+xD0ZSPnlQbFJeCk+6svLUFLtmKqPzmehq1uF7aAdmjYY3j20w+65aUeo2CM5gRJHZRD6g8oMjzBf8j46SK8FOUR0N1BqcP3AqbvFRNkKe7hnBaeXyWz3gm3BMVVyVEE3R9LpwxwWRwlHTzJgGFqA3LhGY2YhJNmzkAix21yTkPIjhmKHkJ97z7/q265gD5rCJtp4JaXu/h2AgEHaOiMu9/cYAa/9dSkIH7e7qKSvnNlme/KmlRkxAvOQ8uyYmdjxNGrne4PBYMXFID9TqcLjqFywQsEY56Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DwFZx+IdakwOTz+U5CmZHH7rKbkHtHaFXCZLTyveIkE=;
 b=MAYNB79e3U8ZMGAmZ/cqn+WNCzcajH3/8b90Npa+3ZiLmEt65WP6YffnFLAWLueSLxFBzIusGn3YmguYXN2k0+UHFoAfUmGbV0aSyjbSstPh1uvVYqWYrrKYxtcWTIOpfw7thaQdqbSnkbSwzSBM1S4HL1mIvap6+hAi6s5xGiM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB7PR02MB5100.eurprd02.prod.outlook.com (2603:10a6:10:75::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 21:02:16 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::b1d6:d448:8d63:5683]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::b1d6:d448:8d63:5683%6]) with mapi id 15.20.4628.020; Tue, 26 Oct 2021
 21:02:16 +0000
Message-ID: <1dad9e92-39c9-5e5f-b138-af619909417a@axentia.se>
Date:   Tue, 26 Oct 2021 23:02:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/2] dt-bindings: i2c-mux-gpio: Add optional DT property
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Horatiu Vultur <horatiu.vultur@microchip.com>
Cc:     peter.korsgaard@barco.com, lars.povlsen@microchip.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211013141003.2388495-1-horatiu.vultur@microchip.com>
 <20211013141003.2388495-2-horatiu.vultur@microchip.com>
 <YXhlEYr2zygThVsj@robh.at.kernel.org>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
In-Reply-To: <YXhlEYr2zygThVsj@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0001.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::31) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
Received: from [192.168.13.3] (185.178.140.238) by GV3P280CA0001.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:b::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend Transport; Tue, 26 Oct 2021 21:02:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e4f9091-5091-476a-3d9f-08d998c3e3cd
X-MS-TrafficTypeDiagnostic: DB7PR02MB5100:
X-Microsoft-Antispam-PRVS: <DB7PR02MB510027FB30441B6203CF2F43BC849@DB7PR02MB5100.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4dgo+VqllcrxbBHFXz1sE4ycjgCzu1+W7lUuR0UrMf9DF3xn50jEmx+/M5hgFx66/Ma0w7vlodMrNZ2iglO/4Sd4nEK+0SIvgEyVEIRBWeG8qQ2bf58w8Rb6/d8GIszZyzDnIjpObUJhObr8WKG3VVsxtw1GTu299m6sHrD8ga/ogLeqZZ7B89OeDst0ebCGUgZ2bwyJ9x7ntgsBn7XVz/Ib3sFdabkU5NzYtCcAzZlfsadVryaU01seaQHv85r9ONYbb+DQMXe4G5QkoKQuyj91Ze23pVIAK5TQjItSDu4lUNAaT4S6/RzX5fQRjG0hWdhme7dHpyIaER1W9l2Kei6EvfYYCl7zaICrTn8u8gmEeyG3IZjoo2y69v9nVP6GgTTtJawIKsjBwztMtbK5DjgYM2iPOGmnFOM0ZfQxk8jLr6pKSXC21yvmlq8+AalI5sUZjB4/FjxYqg/uZKZYcu7KiSKZz3UOYyxbTaPItpYmV2l55zxIR9Yf1qYjfLqq4C2H/vdPK3bzxk5GqYlHMbsAAR8B2CPJjGFeWxWzNjbUaSosuicW160hxksUfu0beeqYzFBQzQoziMq1Dm7IIYY8EF60zjHfYslcWUYPnUSIORcGOFAjR1koLWmqvdZmLrp2pSM+xMcwuUaEBTvZPIewjYzhXN4bX7FpuG41dw4PXTeeTHdle800rlWBqrLbw7vMaz/4B9D7T4kj0iZ9uSPYVTHsB2G1sxRyxMS8869ThOm5FMXunk5R0YR9dtZwIQ0zkKyaGuxEWJada0gtWyDw7FaHU0SR+wDIWqaWPRUMn6aJpi9oK2SSOR0WxOD/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(376002)(136003)(39830400003)(346002)(66946007)(956004)(26005)(6486002)(186003)(8676002)(66556008)(38100700002)(508600001)(86362001)(5660300002)(4326008)(966005)(36916002)(2906002)(53546011)(66476007)(8936002)(83380400001)(316002)(31686004)(36756003)(16576012)(31696002)(4001150100001)(2616005)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUpjR3ZXZmZ6enV0bGIyYW5MQjgvTjJYem1JVEtQZEJKZjdGbnEyZGJhZjdG?=
 =?utf-8?B?ZmRLVVN0dGFYbTBuYy96NjNuRlg5OWRjZ2FLdGVxOFppR0k4WUhlcklYTGlh?=
 =?utf-8?B?OExNb0l3R0tmT045T1BCWnVqMk1FQjU0WFg3eWRTcFNFQWgvMGN3SVNKTEJJ?=
 =?utf-8?B?VUphOHhhdFV2MnR2QTJXVFZPSm9seHZkMUlIYXVWUGZRSUZVTmRSaUI2OG04?=
 =?utf-8?B?aEM4MElVckxKTW14eVYwWllUUThtb09NS05VaVQ4bWs0YXVabXF3RGZXRTlo?=
 =?utf-8?B?NGNWQlJLbUl1YVdtOTJWV1lMZGlRV3ZENCtZOWs5RDZxcU1IZ3FDREx5QXFu?=
 =?utf-8?B?U0ZLeVFqbTQ5ZzMrVW9vcm9Lb3F0ZkZvSzFUaThuaUdFUlRQL0pFbXdiekRL?=
 =?utf-8?B?ejFmQXF4RVVVZG1oU3RPRHhlb0FhWDJDK01sSW9jdGNyNHQ2aUYrR3VKMldx?=
 =?utf-8?B?OGErVkszZHF3TWZMSmVXMjc0N2lQWUxtQzMranRMTmVrUyt1ZFMzb0FTdm93?=
 =?utf-8?B?aTM0VEJIdnh0OWkzT1BCTWlmUkROVnpqeWxXTFRKMGVVY3p5MjNTSlhsM2Zi?=
 =?utf-8?B?a3dVRU5vUmZwMFF4TWtyNENjWVBvNVFxU0FSRGwvZ0c2eThsRVJnR3dnRjVZ?=
 =?utf-8?B?dk81ZkNRVnFMbytPbmloYnV6a0E3bXI4dGEzdVhlc1pKTmkzVlluaFZOajRP?=
 =?utf-8?B?d2dPajBCWU1oV3pvQnBJNXZlRCtvdkhUdUFlcE91OWJSOTltclU3MFNrcHph?=
 =?utf-8?B?TEUyYURpb0tVZDg3b3VhYnBtSXY0NUdWSE1PMHFpa1E1QXJTUGNQNDVhRWlZ?=
 =?utf-8?B?a2tHRFZKblFlaTBzQTEvSi9xYm9mT3pEQ05TdXVYdmptMkkrMmRhYVNvaGhK?=
 =?utf-8?B?M0oxa0tGOWJDQUhESkNZMHREM0lyVVpici9Ka2J0K0hESjdsU3Y1Yk4xZkVM?=
 =?utf-8?B?bG9nSi9uMVVEZ1cwWWZhdVQxSzJlMjRMc3JDcEdtclYxV2Z4UC9zTmNNZDJT?=
 =?utf-8?B?MGZXMjFOS0lZZUtaSDdtUGtNSytRYXJrVXZLQU1OMkdJZXZMcVlTdzU1U3Rl?=
 =?utf-8?B?cTVZMTcrUzB0eXVGTnBWK0R6d29hNEdMY3NhZHlIQnpWTlRMWHRoWWJvTnNH?=
 =?utf-8?B?bFg3UkJTNXFrR0o2ekRKZnk2RE4zdDR3bmErSHdiYVd3dHJOYm5TZytlblQ1?=
 =?utf-8?B?SXU3bzVReGNPbTZ4K2tidjJWZTRFQzhUZU16MyswdDJCck9BTUVMaDVqT2Fo?=
 =?utf-8?B?RzBEQ2k4ZjcyUFBaQ3F0MkhUWU56dzIwT0dlS0QvcTFCbExZSmkwUlNwdFdE?=
 =?utf-8?B?bVZ5dGFGaGthazlvL3JJZmpMUlB5YjFuRVdxbjJhY2tkZFBSYjVaVm9LQUJh?=
 =?utf-8?B?UTk0Y3Y5ZW1jb1dqQkhVL0pPT1U4SG9heHhNaVNkZGVyZEpDenR4YjNTWjhR?=
 =?utf-8?B?VUJvNEZhQm0xMVREblozamxCT0lsMy9mcHpwbUl5endIOTJsTkUrb1ZBRU41?=
 =?utf-8?B?WVNtZnJvVWRMR0xHQmEwc1lUaEJabmhPUnllLzJHMnBqdXRrV3F3WlpkNlVs?=
 =?utf-8?B?QzVZcVA0cml5dkFKWjJsTnFPU21vODlFVE9PWVBCTnJENXNZTDEwWkRkV0Rq?=
 =?utf-8?B?MW9DR2NFZDBUL1cxUGZIMGhOSzZiVE1jS2pXOGNDU1Y0T0FndTZUM3puS2th?=
 =?utf-8?B?MTE3cmRMUnJwYWlYYVJRaFY0clA0WWdjMFJoUk5vWkJLS0RWVm4vU2ZWSDhP?=
 =?utf-8?B?RXpyUThieUdPWUZCc3AvL1RGL3hTSkFiQmdNbnJuck8rZEREVVY2WmYzNXZn?=
 =?utf-8?B?aitFbmViZWRrYU8rOE81Rnhlc1M0L1JqUE5RTldkVCs3QVNORlJUWk11czFu?=
 =?utf-8?B?cnNsS3RkbC9lS21NVUVCeDRWK1hRVDZOT0tLZUozeUNsaDNScTNydWdFUVBL?=
 =?utf-8?B?dzhRTlBkVWlndEJHNEJaeUFvUDRjWWF5UlRsQ3lnQzZ6dlg4US9aZHFvZG9M?=
 =?utf-8?B?enZXNXhQQ1NoTWwrb2RMeEgwZE5kVnZ0R3lUYW9FUXVSaDlkNy9CU0ZqWURo?=
 =?utf-8?B?dTNUSW1hL2xWOFk2WVFralN3Sm15ZE80cGJSNFhZRkhuajJKUUZlN2NYaTJs?=
 =?utf-8?Q?dSHk=3D?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e4f9091-5091-476a-3d9f-08d998c3e3cd
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 21:02:15.9707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wDKwGS7w78DtA9EQ2JYtBSiPSX2LlN7Ma+eb3EKoiPJvdisPQAK1TYzMGOcCKK7Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR02MB5100
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 2021-10-26 22:29, Rob Herring wrote:
> On Wed, Oct 13, 2021 at 04:10:02PM +0200, Horatiu Vultur wrote:
>> Add optional property 'select-delay' DT property. In case this is set
>> then a delay is added when changing mux state. The value is specified in
>> usec.
>>
>> Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
>> ---
>>  Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt b/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt
>> index d4cf10582a26..d0dacbad491a 100644
>> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt
>> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt
>> @@ -28,6 +28,7 @@ Required properties:
>>  Optional properties:
>>  - idle-state: value to set the muxer to when idle. When no value is
>>    given, it defaults to the last value used.
>> +- select-delay: GPIO settle delay when changing mux state. In usec.
> 
> Seems generally useful. Can we add this first to the mux control 
> binding, then use it here (or better yet, use the mux binding if you 
> can instead).

It is actually not very useful here, nor in the mux-control binding. The
same gpio lines (or mux-control) could be used to control several muxes,
all with vastly different needs as to how long the settle time needs to
be. I.e. it is not the gpio lines (or mux-control) that need to settle,
it is the signal(s) that travel through the controlled mux(es) that need
to settle.

In this case, a settle time property was added to the io-channel-mux
binding, which makes much more sense.

https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git/commit/Documentation/devicetree/bindings/iio/multiplexer/io-channel-mux.yaml?h=char-misc-next&id=b9221f71c285

Cheers,
Peter

> Also, properties with units need a standard unit suffix.
> 
>>  
>>  For each i2c child node, an I2C child bus will be created. They will
>>  be numbered based on their order in the device tree.
>> -- 
>> 2.33.0
>>
>>

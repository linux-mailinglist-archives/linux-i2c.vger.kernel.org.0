Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A30EA43BC29
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Oct 2021 23:16:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231666AbhJZVSk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Oct 2021 17:18:40 -0400
Received: from mail-eopbgr150111.outbound.protection.outlook.com ([40.107.15.111]:59872
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235727AbhJZVSj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 26 Oct 2021 17:18:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1eh7t4a+MBMMlszXHWMXzTjFuonyFNjQ68GUwn9THedDZqSTZRcJQ+x+vX1GcFqY/t6Pr7Spag4GQBqWlRhdOcu0n64Xt38iiTniom77/e03XuP7v4DGTn+PTK2oGQY1Qg7dh/uSXNzUW6WOzcWcQR2usHzCNlgGQ5Q2EPctpVAps0EyNudaflGlGHD+GWYDgzfYo7VoT2641gXv04ovH0DzhUrhlsRU4J0eT1ZSgSWyrC8Ktan7oxtfe4lMS6+1cv4HWKx2cVAlg1n0dxXYIhNykwqGi+hyfPWJpvoBAPjsSMgJR8ZnkATI+6xD9aGGbght9Y1ZPbX8//L1HRJ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T74N1XltAdipaulQRShTSqoK0Hh73j77vFp7V4oMxOM=;
 b=I77gqppd5O9hI/8fTvV6wfJKRcxOPxJAkF3GmyKYhZoIwIyzmDczuPE7inan+fthuXBbr6nSPbB1aOueH7ibc3zc3kvEnfRbtI8r8H9M9gp7psmgvXtuIquO5Wd9NMMKzHH1qnyzwBoT5ufQqgKSqI85hzliMzVM5bwIJ5NBDQJX78o1TS39Jxr/0w31ABB/nQRgqjEfyXi3mrECBLg95q2XyLOykGZee5Pn0Oo1VJG6IRgOTWdWL7C83gycJlZZYElvC+yqZW1X7f81neNU9V61shmPGkAYapVi8SpJK/3+O3euwHwV0n3TtrfT0PvtZPw3x4YJz6UKWFoEIKutOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T74N1XltAdipaulQRShTSqoK0Hh73j77vFp7V4oMxOM=;
 b=YLoR8BUb1oX5Cpu/kEa8Byy1cR7VHuO4kT3XVKphGpVXmL7Lek7OxJq9+8iQ5eSx5BollC1hwXD3oykdmyPhm2RYIof4C86mvjGs4g7QRkct/JzFClFlWyYI1KnP0Yb8YjuQXGb8DocSyxfzrwT1Bz4WOICx094NkV9JEa6JzRY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB6PR0201MB2295.eurprd02.prod.outlook.com (2603:10a6:4:2f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 21:16:13 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::b1d6:d448:8d63:5683]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::b1d6:d448:8d63:5683%6]) with mapi id 15.20.4628.020; Tue, 26 Oct 2021
 21:16:13 +0000
Message-ID: <dd4856ac-c706-e855-d460-c6addf7b96a8@axentia.se>
Date:   Tue, 26 Oct 2021 23:16:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/2] dt-bindings: i2c-mux-gpio: Add optional DT property
Content-Language: en-US
From:   Peter Rosin <peda@axentia.se>
To:     Rob Herring <robh@kernel.org>,
        Horatiu Vultur <horatiu.vultur@microchip.com>
Cc:     peter.korsgaard@barco.com, lars.povlsen@microchip.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211013141003.2388495-1-horatiu.vultur@microchip.com>
 <20211013141003.2388495-2-horatiu.vultur@microchip.com>
 <YXhlEYr2zygThVsj@robh.at.kernel.org>
 <1dad9e92-39c9-5e5f-b138-af619909417a@axentia.se>
Organization: Axentia Technologies AB
In-Reply-To: <1dad9e92-39c9-5e5f-b138-af619909417a@axentia.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0100.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::15) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
Received: from [192.168.13.3] (185.178.140.238) by AS8PR04CA0100.eurprd04.prod.outlook.com (2603:10a6:20b:31e::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend Transport; Tue, 26 Oct 2021 21:16:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a58fc5f4-ba4c-4747-7219-08d998c5d6cd
X-MS-TrafficTypeDiagnostic: DB6PR0201MB2295:
X-Microsoft-Antispam-PRVS: <DB6PR0201MB22954AEE1081D7CB297F5955BC849@DB6PR0201MB2295.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9WpHDUtoiTWiXm08hMcdcWEiIouCTxGiLAfwQQBDIWhiMm0if3sR5clj6iGlvGMrM3G+jpFZHwuGxOWh/Qt3ChVzcZ8IVc1UYYOxqVIy1SSjsGDu45IgtHStRmB9oWhUape5q7lfBvjdEjJJQKlWex45j3crK9Vc0D17h3sXVW9kE81ip3eThGIfliJRa9l8iq+oLtPK9k/giQ8Wr/TbQThRjNH9dEVeAJbKho3/HYKg/v3lhcArHYqBPQpOsOmVpLfp4Kw5m2z9Gt/DIJ93/E8vk1/gxafYFkwvFY8+7TPoHJT0ES1DywT3sZJvn2bvHTAFm0Wl4kEhsb2DXWiz97ibBSF4DhVeAuCE7NYHSOIU3vGeNZPoTGYQph0QnQUW8XEJ0/zODv9qzDU+lMbmN/Io+zUcWIRzuzJpzCk8alCIp5xg0NktvKCpZmfRGPbm9g/W7mFqcHRJbDSq93+WCwwkO5sXyGkngJ/A8Vs6PPIb2xoTcFfqaMLVfAWuKFGLgWbEDbkyb3TpSAVdhPeDMJeteUD/hgm0CDxOCIvhMRl3P0LcUMy807s/H5GGZ1Cxl/jK7ZE53KMe/4CgLPRlzZYTlhzaKPhaXHU9Or54cD/jBhWwCDeOhUfBfOH+vxtRg3zIG/4otox3Cq+o5C7VEo4l2mTYUKYE2KqTiqgpZIn7umRNHP7e9dBEU0025s2Vw+xnhXkFNET72D9uz3wRZh7O5qnGw7otWWL+oHvpr4EhdYAlcvgulY4tyo/EyFdjWWJyOvxxpF0sXAaGlMT4WKSaouJSUY+GixpOamplOthcVmMo77tfFEmdPUH96/4G
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(39840400004)(346002)(136003)(396003)(366004)(376002)(53546011)(31686004)(4326008)(86362001)(83380400001)(6486002)(956004)(31696002)(26005)(4001150100001)(110136005)(38100700002)(66556008)(966005)(8676002)(66946007)(2616005)(16576012)(8936002)(66476007)(2906002)(316002)(36916002)(36756003)(508600001)(5660300002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3RSdWh1ZSs3eWhlZGtxMG1Xdi91MnU5dVd5R085WU5zNEZ4T0VLa0VSQkc0?=
 =?utf-8?B?NEJaRldVK25PRkwzZU9KZnc0aWlqTmlZVTR4S1JSbWFHalliQUpxNlF1ZVJR?=
 =?utf-8?B?dHQ4cVlFNjZSODgvYmtINUZoTHZwVG9mWEhhR2xhc3Q2NHEzd2tqdklqWEZP?=
 =?utf-8?B?b1UvaVJjYmx1bmxHWG4ydDczaDc3aXMyaWdrNVAxSXNkSjdhekc0Y1lucVNR?=
 =?utf-8?B?T3N6M2RuZGxKZUVzL1o1TnB5ejljWUM0Y1dIejUzK2dma293b0hyWHZJL2o5?=
 =?utf-8?B?TjJKRnUvR2Y1UVdEdFlOZjU3a2xBZThUNnRNTFpkQy9tbm8zWXhpYlRBRlpE?=
 =?utf-8?B?dVpDNmFORnVmY3FubGtFRitCWjBEUnluNytMQkpLM3gySzBFRFFkMVJ4UnVq?=
 =?utf-8?B?MzloT3RsM1dKdWdpUUgrSk92Y0Y5YTB6Rmd5bCt2ekk5TlRJZDQyTW12Z1Ur?=
 =?utf-8?B?Z21kMDlNNk1Cb0M2emVCTCtZRUpjWUoyS2FkdFFSMHM3WU9uTUpPNGplODlV?=
 =?utf-8?B?TUh5ZkFRdEl1UUhJSEI2ODlMUnF5Q0J2VWdsQmhWbDg4RVVsbE5TUGczcFda?=
 =?utf-8?B?d2c2TXFON0lweE5NTGJaUThPR2RST1ZnUldhM29tR2dETkJ2dnBaaTQxcG4r?=
 =?utf-8?B?YXBCZHYzTGJqYTdnUnVHKzc1bmhvcmo1bFJwejdJOUpObFljRXpMaVBYdm5m?=
 =?utf-8?B?QUVuWXlMbzlEeXh3dWVwT1VXV2toS1Y5YnVPMzJZZU1EVHhSVzJsbVc2UnFw?=
 =?utf-8?B?ajRBc3lXVGxQd1JwZHZpdUZwcXF4cGJNcWhvNEJMSGYyM1lNbi9FUnFON0hu?=
 =?utf-8?B?dWJoTitrQW1xVEF0dWMyM010ek96OXBZVThUZFRsTHZmbGMybnY5Q3RnUXY2?=
 =?utf-8?B?eVN4RGl4aUJyOXZzRVkzT0xjV1VjUUx6Z1RIdVRTWVN1TkxYd2grMFEwRlhw?=
 =?utf-8?B?WUlhdWFpQlFXK3hwTTgrU1RaTnR5YXpwUSs4MkQ1ZjFVYXRtS3c1bFBYSE5D?=
 =?utf-8?B?dGlHbzNiVDNOcW1MaVV5TDlKSnMreXF3QTlWeCtsbUNyYUQxVllsQnd0b0dP?=
 =?utf-8?B?UzRReU1VVnJUaW9zSHRjSHA3K2ViYUlCUE03TnpNbkFicVhMNDB6U1Q1Q3FT?=
 =?utf-8?B?MHZabmJsSlhpOC9qU3MwanZETldtRG1YYUlNTzIvRWdXUFdWSk9aei9qZUVt?=
 =?utf-8?B?c1BWZDI3ckt0U2ZGUDFJemVCWmkvTS9SMlA0Q1ByRTdJUEhWYTZZVWk0OGw2?=
 =?utf-8?B?aWs4b0hmSTdMOTNrQllrSlFOR3RUQjhIWmt5UFRFZTNpOXdwMi95Um1icmFL?=
 =?utf-8?B?TWJZUFFCSmdWQXFmNFRNSEY0VS9KdVFtSzJ5U3ppVC9KdjZjVTBPaEhKanJT?=
 =?utf-8?B?Q3BPRjJkZHUxWnU2K1hZTGZHNTRuc1h6RS9MSm1qeHlEQnRzU0RYVXdvTitJ?=
 =?utf-8?B?Z1l4V2VzS1VhRVRwMndPNTZOdUphTjJGTUNldnNFbXF5ZFc4dVI2RFk3Z1Zi?=
 =?utf-8?B?NGtuUkVIb2lUWkZ0OE0xMXV4cGRkNTFzckJzb1NVc3RMYlZmd2VFQ2FDUERw?=
 =?utf-8?B?bURudVYrakVJV3poc0JLUkFzRXpxL3A5L2hzaUEvUTFzcWJ1QlByYzFnT0ZM?=
 =?utf-8?B?dUNaaFkrazVJWGhZYUpTaUZiZ3JVbWhLck9WTFlEWml1L2FCZmNxWHBOYVVO?=
 =?utf-8?B?eDBuQWxhNFRpNmtkS2ZmRlBSQzAyRXNnWlF2V013QU5VekRBeGlmN0crdU1i?=
 =?utf-8?B?Mk9UNzFGakh5aHZtbkpnb2lLV2ZuZVZDSit4SS9lNnpwMjBzNWhaaVYwVWVv?=
 =?utf-8?B?N0NnUVlvS3gwYXRmd1Myc1RDQm5XN1lzRW5McUR4MW5OZ2dWZ2dQUkRNVkhH?=
 =?utf-8?B?ekMyN0F3ZmxITjBoY3U5bWJjZ2d6RXdEYjlKY0F6R3lRSWpJVHVOOG42VmZl?=
 =?utf-8?B?K29KVThXTTZmcVdSYmpUaWhSWUt0NzBLZ1g2OEhuK2psbW9WOXRTT0taSGhk?=
 =?utf-8?B?Q2J1Z3kwVWNaYno3Um1LK0hCa0QydTM5N2liY2V1d3k5WlY5S3dIbmN6NTR5?=
 =?utf-8?B?S082R2E2cHZsV1hFRFBJOWxibkJDNGtya3dHUWtIQ0M4b1BHTXhTMEtmRmxv?=
 =?utf-8?Q?QLkk=3D?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: a58fc5f4-ba4c-4747-7219-08d998c5d6cd
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 21:16:13.2711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NhbX+PRpSDs5JwBuF4xaBB+Y8mg5AWW2AI3gZxnDvtftfxRM1Nk55u6rrQtoruQz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0201MB2295
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 2021-10-26 23:02, Peter Rosin wrote:
> 
> 
> On 2021-10-26 22:29, Rob Herring wrote:
>> On Wed, Oct 13, 2021 at 04:10:02PM +0200, Horatiu Vultur wrote:
>>> Add optional property 'select-delay' DT property. In case this is set
>>> then a delay is added when changing mux state. The value is specified in
>>> usec.
>>>
>>> Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
>>> ---
>>>  Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt b/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt
>>> index d4cf10582a26..d0dacbad491a 100644
>>> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt
>>> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt
>>> @@ -28,6 +28,7 @@ Required properties:
>>>  Optional properties:
>>>  - idle-state: value to set the muxer to when idle. When no value is
>>>    given, it defaults to the last value used.
>>> +- select-delay: GPIO settle delay when changing mux state. In usec.
>>
>> Seems generally useful. Can we add this first to the mux control 
>> binding, then use it here (or better yet, use the mux binding if you 
>> can instead).
> 
> It is actually not very useful here, nor in the mux-control binding. The
> same gpio lines (or mux-control) could be used to control several muxes,
> all with vastly different needs as to how long the settle time needs to
> be. I.e. it is not the gpio lines (or mux-control) that need to settle,
> it is the signal(s) that travel through the controlled mux(es) that need
> to settle.
> 
> In this case, a settle time property was added to the io-channel-mux
> binding, which makes much more sense.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git/commit/Documentation/devicetree/bindings/iio/multiplexer/io-channel-mux.yaml?h=char-misc-next&id=b9221f71c285

Oh crap, sorry. This series went right past me since it somehow didn't get
flagged in my inbox. But Robs answer did, and then I assumed it was a late
answer to this series:

https://lore.kernel.org/lkml/20211004153640.20650-1-vincent.whitchurch@axis.com/

Which it of course isn't. But in my mind it was. Result: my above response
does not make any sense. I'll have to go to bed now, but I promise to write
a proper answer tomorrow.

Cheers,
Peter

> Cheers,
> Peter
> 
>> Also, properties with units need a standard unit suffix.
>>
>>>  
>>>  For each i2c child node, an I2C child bus will be created. They will
>>>  be numbered based on their order in the device tree.
>>> -- 
>>> 2.33.0
>>>
>>>

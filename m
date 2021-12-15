Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE1884758FD
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Dec 2021 13:42:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237296AbhLOMmU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Dec 2021 07:42:20 -0500
Received: from mail-vi1eur05on2138.outbound.protection.outlook.com ([40.107.21.138]:33408
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234378AbhLOMmU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Dec 2021 07:42:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lQ28IuJNCdmsdc7tAt3co7aAlDVbKYPZLZk6OFdROCQnzAXHoXPMxUdXUhpq5Z1xF2rp56noYvk6QJVEGZGZBqhiYcYKL43164lc86ZOYj/MbKEWUHJ2xjubWaLp/UHfUQaXGie3YDsfrtJlt1+9r3bA0Yt+Re/4G0OJtYsJr4XxAMjCZ/pPSNBouEScX3MzzkPdfMq5BRWpRIHtusxY0S5grrYh+Jw4v2pFh6sysobdUM7k9JZsAhOhGDLSrl9SqdgFW0qD2WWp2ldSpr1wgd3T3oKioeaEThHZzEh25n5PgYHxs1acFhifpakI7Q3WLqlxLiqfneCKvH2QFKUI2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qBeNucITdkOIdY1Q4iWTWzcDI+exXvjxKu8q1pHnkIc=;
 b=ZKCrYAvRwFoatDHXJcovpOchSgzU+udqR9wYBqY4O4PRTkxEgHaFeBwF9Tx8O23a9fVBlB+BwNp7Kl/RxyzWoJltGyw2BhWZCJpF7rEXQaFBEy5WRYWePoEhogOhBaP+l5mMsthENLc2KA5R4Gb79bt+xnKNw+jA0fmmm545HbheT1gQAGEhpYLZr7KUvkyogMz0i29z71qwFwp2LAAtxYcKUGd3rV5fLxXXz1XEcjD/BKWPpSNP+rEXaSBu2EJsywkYhu+MhkCSZEpG6UZwS4o8epRrDJYdSlvx6E01N1lPaV2HSJL+RxL7vYV2SpYwzXbpCSWcHxcBzr+YfobxJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBeNucITdkOIdY1Q4iWTWzcDI+exXvjxKu8q1pHnkIc=;
 b=CUMPEdIj+pMGtgVt3sTUu/94gOlcmVLom7xS4ISHVcwhHCu7+iNfDbXUPpANcb7OuNkGLP0RnwBqQ0Opoi82X2jZiJ9wehnkS3P0YZ7SR/rW+/v9h7GlxSMKeEImwRZ8Of5T5mU+MECOpqxA6CZTpgyIi2BYD81YNqYLYBRixsY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB7PR02MB4220.eurprd02.prod.outlook.com (2603:10a6:10:4d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.18; Wed, 15 Dec
 2021 12:42:17 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7519:c72c:98b1:a39]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7519:c72c:98b1:a39%4]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 12:42:17 +0000
Message-ID: <a78b52ec-81bf-9ee1-9e12-135079d19b7a@axentia.se>
Date:   Wed, 15 Dec 2021 13:42:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/4] dt-bindings: i2c Update PCA954x
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211214095021.572799-1-patrick.rudolph@9elements.com>
 <Ybh8cCU/zbfXkXYO@pendragon.ideasonboard.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
In-Reply-To: <Ybh8cCU/zbfXkXYO@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0011.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:b::7)
 To DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79eddb59-80ec-4605-1073-08d9bfc853c1
X-MS-TrafficTypeDiagnostic: DB7PR02MB4220:EE_
X-Microsoft-Antispam-PRVS: <DB7PR02MB4220EEBCEB46FEDD5584E0A1BC769@DB7PR02MB4220.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qyWzTABJbab2telkg3ykrvtiqsnZP/FEMMtDdVbk6ZfnvPjlPpkye5o8F+yx2YYNrmkZafPwEFAGuCPZvpKUtfcSpGpYWmS8SwFIG0/0XNOB9uRJtDOcPCQbl/xEPQu/rW4ruRgTqd9svnQ4tCXSxAsSAay/LepxT5TnL5T1g0wo+0E4+Mqm3/8C1LZlq2SpDCLQnXTWljLRrt7BSeTMNA5Bvg/4Ptv43GHEIYcuR78KKpOIBtrXIFegGqYXP8dFjuBV+cBGSx60qwUcphtuKQiF8tabV7WdToh4fzt2EaKBrWZQcOner5uOHZaJQtTvpsu9Ww6shtHark+XyOfpYu1cb9RbcpqTzjUEExKPfBdY9oL84aMvUyCV0Y49pnc+18TixxVohg3yT5TAWjH8/Lc8vTW1zpzhnhp3aukstfEDuczNl2fCMR7m90tq8yGNWqDWsgWnSPQeKISf5tP1J1jPZt+gDRqA3wCATg2IUQ1LoXlgknYPOjJ+RSvh6LpWTpk3k6MoVwCHokjhmllM/qSRooIpBkfkpnd+botL3peQUUcGdOOGtjmHYeUeA6JIUgXqcQVe+BVtOES+hb2ZR9mp7yj1C0hz9hFuKKevrmflTBpNi+W4cYsbNL+oNwXvIklRldeIykqsT19qFNHgVQB5VIt6/G4ztmUyTY4SU//nGktGhXJYLaKvBbqAKmO8ZgtPxNnIa9LnCRBIsIXVagFe1SpJ/hOOyPS0fWrpwSk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(39830400003)(366004)(136003)(396003)(376002)(346002)(5660300002)(2616005)(36916002)(6512007)(86362001)(2906002)(6486002)(31696002)(4326008)(26005)(36756003)(66476007)(186003)(53546011)(4001150100001)(6666004)(66556008)(38100700002)(8676002)(66946007)(110136005)(316002)(508600001)(6506007)(31686004)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnBNN1pzMnRMN0xaUTlhWjRTV1dweGFhZytoMTkzTWNseGQ1ampPMFZkeVBj?=
 =?utf-8?B?SjBaMmMrOFhDNmVHRjdicnVLVzcvUU9tS3pNYTB0NTJtK1llaGVlbXhsT3Bq?=
 =?utf-8?B?WXFGT0VCSVBIZFFYT0tETHoyb3hURFpTNm9NL3dFV29FaExwa0I0R2VjcE9k?=
 =?utf-8?B?Y0lILzVXRFRjdS9oSTgyQlNvRFdJWWZpVEV1TU1QMHZVV041dSt5Mi9QK3dw?=
 =?utf-8?B?blBMaTY2V2t3MTlGaGM3TStnRGx6Z08zWllGblkzRUZXMk9ZYWxCTVp4MDJh?=
 =?utf-8?B?WVlUblU2UTNNV0UzQklOelNRNU9rU1dtenhDcTFmZDM5NlFtYkFVQU52T3p2?=
 =?utf-8?B?UEd0MHhqYTRrVkZNZVRkRWVDMng2WnE2TXBSc2tYR25adG5JOXVKVVFYU2Vh?=
 =?utf-8?B?VlJYWEJIeWhqSU9xVHdEdXNqMlRpa3lqTWl1V3BTK2x6U2hBNmhtQTZaUFYx?=
 =?utf-8?B?bHpYNElCMTUzOG80UUVQZDJlMTJGR01hMTczRHhHTmRsQlVwNGdzeWRZM29H?=
 =?utf-8?B?empocUFvWThzZ0FacWgxaFhIdEtxYW16YUZEdWErSHJHZ1V0eVFFY3h4TVBW?=
 =?utf-8?B?Rk4wVU5GQlU5RmJWWjZMTWpFK2UybVVmVVZVa0dZRVJ6ZzJWTGM3SGhicnlW?=
 =?utf-8?B?U2pUWHg4Z09UYzFIWlRUUHhYWGIvZFdOVldDVGdqREdabWlNdndRVW5udWo3?=
 =?utf-8?B?UHZjNDBNQzU5S3F3R2NtMTJFV29CNGpPdXFLVS85Szl1c3JPYXVORmxEV2li?=
 =?utf-8?B?WGdTU2FMOXRhSVdPaGFwWEZ1b0djRUNpV0tTVExMYWJiN2FmVDRlTTR5alc5?=
 =?utf-8?B?TjlxNlkxcUFtbktkNlJIQnlPb0lGT21NRmV2OXRXcldZNW9sbzdsV1B6OExE?=
 =?utf-8?B?WmdHS2xRMVpINTNFd3VSa2FvOTNKNzdZMXBpNFIxeWZ0cCtrZXcxM096OGR1?=
 =?utf-8?B?Y2dxYk5GTzZhV3VjREtZUUpWM0d4SnBCNnRndHNHU2lyN0xDS2l2cFAzZ0VI?=
 =?utf-8?B?QVErQWUybUR1ZFdwKzZHVXllcG9GZzh6ZXhCTUk4TDhoT09CQjZIVlljcmpx?=
 =?utf-8?B?a3gwazNLRDlVaW5wVFZya0xvWDJWZjNaT2dVWXh6Nm9zMG9tWDgwUk9kQ2dw?=
 =?utf-8?B?NFJ4MkJvWXhNL1pYaCs5enYySVk5Q0NDODhiTnMyS3JHY1FjZkkrMFo0ZG9C?=
 =?utf-8?B?NEtTV0VyZ1NuS1VyQnAyeHZneG5RSkJOZDhmWWRFSjhWSHpadUcyVzk2dDBi?=
 =?utf-8?B?bHdtRFpxVkF1bTVMelJUUTdreXBHVzFNMXNYMzVPdnA4NUZLUGRpaFBDbVUr?=
 =?utf-8?B?czZ2aGZBellqUXRqbFdWdGRRa3hsU3ZDSU9IZjlpTExmZytVT1dmZjdSanVL?=
 =?utf-8?B?UHB1UXV3UFBCUlUvUnNlYjJST0ZxMkNOMVJtcytJa3hqSW16OE8ySmtyV2xG?=
 =?utf-8?B?MC9aSDZvUlo0UmRIS0IyOFFoRzU2OXpCUjFPZEFjMWFnbDVLazBCcytNY2N1?=
 =?utf-8?B?VFlvZFlrYkxaaU9lUytXZU4zMElzWTVaaTNNdXVLQVJqTlAzLzhjTTZ2eDVy?=
 =?utf-8?B?ZHNma1UvT2Z6by9RWkxSQWRySlg2amtILzhTWlRNUk5kbDYvVjRBalFOcjky?=
 =?utf-8?B?Mk90S3Zkem5ZbEV1aUxzdkk4Zm9uWkFmRS9uQXdvN0ovRnpOU2xEZ1lkKzkz?=
 =?utf-8?B?cjBGTkxGZVE0c3N3TUFZMGZwcFphZzd5YitjcW5BT2UyWDMyenpraGlMd0NN?=
 =?utf-8?B?U3B2K0IzSjBpUnhuTU8rR0pGeW5JS09uQjVWaVNDcTlJQTJMMWluY3FKcGtT?=
 =?utf-8?B?cFVRenZCZ2UyZ3JIT0hZd0lGcHdiR24yNEhFKzZRRFBpK25ncDlIcEgxbVhs?=
 =?utf-8?B?V2NWRko3TnlYWk4wSGo2QXRab3BmcTlhdFBEM3NJblA0SklCYUNzWVE3eThC?=
 =?utf-8?B?bERpbzNEN0pLd24ybmhSejYyU3RUWEd3RzhOWVFCV0EvU3ZMSkJsR1YvNUZP?=
 =?utf-8?B?bmlGOHFST2Z5YTNaNXdySzlnTFo3c3VaaW16T1c2a3VZY2NCRkFHRGpJQWd5?=
 =?utf-8?B?UkRybkJQVWcyQlN5Qll6a0RPaXR5K3EwQWR5WWl1MEVvVmxYSHo3QWZpS05I?=
 =?utf-8?Q?Baeo=3D?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 79eddb59-80ec-4605-1073-08d9bfc853c1
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 12:42:17.0780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gyBWqjpWHve2nEreAPnih7FsW++pDibt6T6En/OtBgqK8Fd9auWpedZqjI1raXKE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR02MB4220
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

On 2021-12-14 12:13, Laurent Pinchart wrote:
> Hi Patrick,
> 
> Thank you for the patch.
> 
> On Tue, Dec 14, 2021 at 10:50:18AM +0100, Patrick Rudolph wrote:
>> Add the Maxim MAX735x as supported chip to PCA954x and add an
>> example how to use it.
>>
>> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
>> ---
>>  .../bindings/i2c/i2c-mux-pca954x.yaml         | 40 +++++++++++++++++++
>>  1 file changed, 40 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
>> index 9f1726d0356b..bd794cb80c11 100644
>> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
>> @@ -11,6 +11,7 @@ maintainers:
>>  
>>  description:
>>    The binding supports NXP PCA954x and PCA984x I2C mux/switch devices.
>> +  Compatible with Maxim MAX7356 - MAX7358 I2C mux/switch devices.
>>  
>>  allOf:
>>    - $ref: /schemas/i2c/i2c-mux.yaml#
>> @@ -19,6 +20,9 @@ properties:
>>    compatible:
>>      oneOf:
>>        - enum:
>> +          - maxim,max7356
>> +          - maxim,max7357
>> +          - maxim,max7358
>>            - nxp,pca9540
>>            - nxp,pca9542
>>            - nxp,pca9543
>> @@ -40,6 +44,7 @@ properties:
>>  
>>    interrupts:
>>      maxItems: 1
>> +    description: Only supported on NXP devices. Unsupported on Maxim MAX735x.
> 
> Could this be modelled by a YAML schema instead ? Something like
> 
> allOf:
>   - if:
>       properties:
>         compatible:
> 	  contains:
> 	    enum:
>               - maxim,max7356
>               - maxim,max7357
>               - maxim,max7358
>     then:
>       properties:
>         interrupts: false
> 
> (untested, it would be nice to use a pattern check for the compatible
> property if possible)

Some of the existing NXP chips do not support interrupts; we should
probably treat these new chips the same as the older ones. Either by
disallowing interrupts on both kinds or by continuing to ignore the
situation.

That said, I'm slightly in favor of the latter, since these new chips
do have interrupts, just not the same flavor as the NXP chips. What
the Maxim chips do not have is support for being an
	interrupt-controller;
At least that's how I read it...

I don't know how this situation is supposed to be described? Maybe this
new kind of interrupt should be indicated with a bus-error-interrupts
property (or bikeshed along those lines)? Maybe there should be two
entries in the existing interrupts property? Maybe these new chips
should be described in a new binding specific to maxim,max7356-7358
(could still be handled by the pca954x driver of course) to keep the
yaml simpler to read?

However, there is also maxim,max7367-7369 to consider. They seem to
have interrupts of the style described by the NXP binding (haven't
checked if the registers work the same, but since they reuse the
0x70 address-range the are in all likelihood also compatible).

Cheers,
Peter

>>  
>>    "#interrupt-cells":
>>      const: 2
>> @@ -100,6 +105,41 @@ examples:
>>                  #size-cells = <0>;
>>                  reg = <4>;
>>  
>> +                rtc@51 {
>> +                    compatible = "nxp,pcf8563";
>> +                    reg = <0x51>;
>> +                };
>> +            };
>> +        };
>> +    };
>> +
>> +  - |
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        i2c-mux@74 {
>> +            compatible = "maxim,max7357";
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +            reg = <0x74>;
>> +
>> +            i2c@1 {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +                reg = <1>;
>> +
>> +                eeprom@54 {
>> +                    compatible = "atmel,24c08";
>> +                    reg = <0x54>;
>> +                };
>> +            };
>> +
>> +            i2c@7 {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +                reg = <7>;
>> +
>>                  rtc@51 {
>>                      compatible = "nxp,pcf8563";
>>                      reg = <0x51>;
> 

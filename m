Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A38DE4440BB
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Nov 2021 12:45:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230304AbhKCLrk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Nov 2021 07:47:40 -0400
Received: from mail-eopbgr70130.outbound.protection.outlook.com ([40.107.7.130]:35598
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230250AbhKCLrj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 3 Nov 2021 07:47:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KaHtPzoP2Fg8eBh6iWqd028MsDGRU29qxTgW3xmDCRZ+SWz0nkLFJhtA1PO5Tqk/ncwgjK7igcpNKdz9CLb7XYbmWsUVd/OypTtLaTkn2vLKQ2qRoiL9OhAfJbBBTi5Ryu2Hkrs60now1o/H6kstaPKaFIJN9V3xWF0Z/Zqul2UFfAK+RgrCZ5UcJwc5kPUpBN8/1GcKTxEHTlGk0gKlbSgJtUiRBHeoxa5PJBLU/zD9/ptQSZztwWj+Qaa38gCvTAJZUUj2Nqs6fkYG/Xv4eH8oRSClo1mFNM7Z1Zl7/LugpP7SCl1vnN2ad+KmfP6kO6dRC5pZcYAsLDFOw49tcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RpnShX6L49rWhG3fB70Aq9SGpyMZUTrSkj3RZl2DvC0=;
 b=RBmQPbucbuA7eo2FJRTNL4Twa+PUE9wWO6tpjHeAjovYHvbChmiUk6sN/DVuhhl0Z1Skeao7KDIx5bci1fB9dV/khWohCFcz8Kov4lTMMfI1cGpD2/0W63Hy9XJSHpDvHVRNqgE9mn/UcxEf+j3kwhBwDdIs+2uUeoL5BnFzLEBGdwxwcZLIRXYI1OiOSsM3XmMpfxiimMKDHrPQIUOdANbj24BXfbyDIPrp14DpSHjfcer1SxhURduM2MkawLpqM5eug01dikOxF5cGCu1wYGkGmFLOMcDqEjgwpk+dicDZH4Et2thlcisW/HnWej35XCNpTUxoB9JyuAN1kyhnTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RpnShX6L49rWhG3fB70Aq9SGpyMZUTrSkj3RZl2DvC0=;
 b=H5YTAe/9HfaBq5tksuGJMxzd83VskfEWUAfDdRtdilauV8lwqJF6iV2XNOUn1PKelsR+p97Dve7YEvM5e9s/r/mRFwbI1hDyp4OVggWGXEXG7Ii0LETyH3cXliGVI5Lcg17CXxl5F2o5c6ZZdznYKbnm5aMmAUrNXwhPsebK3lg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB6PR0201MB2166.eurprd02.prod.outlook.com (2603:10a6:4:43::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.18; Wed, 3 Nov
 2021 11:45:00 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::b1d6:d448:8d63:5683]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::b1d6:d448:8d63:5683%6]) with mapi id 15.20.4649.019; Wed, 3 Nov 2021
 11:44:59 +0000
Message-ID: <087a49e0-30fe-7b09-b246-6d50e96299d1@axentia.se>
Date:   Wed, 3 Nov 2021 12:44:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c-mux: Add property for settle time
Content-Language: sv-SE
To:     Horatiu Vultur <horatiu.vultur@microchip.com>,
        Rob Herring <robh@kernel.org>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211101122545.3417624-1-horatiu.vultur@microchip.com>
 <20211101122545.3417624-2-horatiu.vultur@microchip.com>
 <fb0ca91d-f5fa-5977-7574-8926d8d0e3bb@axentia.se>
 <20211101213201.wdjsuexuuinepu3m@soft-dev3-1.localhost>
 <YYGFYLtehnDOgA9d@robh.at.kernel.org>
 <20211102222757.ny4c7gdnyxm3gorw@soft-dev3-1.localhost>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
In-Reply-To: <20211102222757.ny4c7gdnyxm3gorw@soft-dev3-1.localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR07CA0044.eurprd07.prod.outlook.com
 (2603:10a6:7:66::30) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
Received: from [192.168.13.3] (185.178.140.238) by HE1PR07CA0044.eurprd07.prod.outlook.com (2603:10a6:7:66::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.5 via Frontend Transport; Wed, 3 Nov 2021 11:44:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8d291e9-67ec-4e89-5ed7-08d99ebf5a56
X-MS-TrafficTypeDiagnostic: DB6PR0201MB2166:
X-Microsoft-Antispam-PRVS: <DB6PR0201MB2166899F83AF67AF4938F7F3BC8C9@DB6PR0201MB2166.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MWJjUS21pQQChteVYnOh5LzpqKXgYjq8TLFW2+LZvHC5yluo0y5wSxk+QEodjpcN8aSpY/OIqXK1V4yLmhvb2N70gke8dVLU9tKnJrb0Ny+HPmkLgzyKy+ixhaFfYO28ts0Ztd1l6edE9i5hcYC08cSkHpBNjFt+lCo8PzxFUac7gmCii9ymSIIP+Wo7C6YJ6BVdwPLvrfwP+S3gcB5eZAb0PGDndtY+7QyiaGPLU3sDqsr0iq7lOAbK0QDEAzLIg5a4XZXk3yi/dEdmzNcW1IKJqrJ3BTnw+bEeS1x71CCHlSAavTDu261cv+b/DYTaTMxvXUaNWJCAF7dcjKOmXZBJN7x3i6nBGs0tBecmSzFoC5TqDdt+tLdhOlBKhCmSH4cs5L2fdYtciESi5Sewp2cUHrpI638JGkH61vJ6j1t5r/e9PxGQlWIG1CqLY5pf0q8E0wwSwf+fEUbCNgSRLv4Q3xClyZPwPryRy/hXTW2HCmQuSyVhsmE6cnjwC2WV2+SLmNXBy+WIkzQy0C7xzxa+lXGGKFe9gtvurpebTOn1YZd9R/u+69arkJodnq6jLSnHpKcEA9LukbhAmyj5M6l0vuqxOpQlk2cCxQuhlRPa6TYsJLL0QUuKaLe2tvMkkhUTs3nRoLvRTv9J+WEvDMQg0wCF6W9UsXi3FlDLrOakuFBn1gvUxJsxlX+4xRGXB1SeHvOE2NhSLZvB5YluWIJ3AauPFK0BMsSXKT4vhehoDsFEcJVm3DTF3EGGxtO9PR82SQzGV2H0GVElyqPiYgBIlbALpSXeFEl9SFqR5FGleSgD3wgEPHHbf0Brx9Lb
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(376002)(39840400004)(346002)(396003)(4326008)(2616005)(6486002)(66946007)(83380400001)(38100700002)(66556008)(31686004)(66476007)(8936002)(8676002)(186003)(956004)(36916002)(966005)(316002)(86362001)(5660300002)(110136005)(31696002)(53546011)(6666004)(36756003)(508600001)(26005)(16576012)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1BlUjhncmszK1VaeU5nVXMxMGI0ajg1cHUyUWl3eTFZdmYxUDFOTXZrblNN?=
 =?utf-8?B?eHdoVzFHZXVqR0JDbHBCYXd1VjgzQmNUMFBHbEI4d3pCeDRrZUJsampuT0tY?=
 =?utf-8?B?TlFIOXdPQWpFWFkxU01LRnRPNVBHWjRLZnhqYWhSZmRFbHRUWHkzSDF4aitU?=
 =?utf-8?B?a2dMYzUyWi85ZU96MEp0N3U4UVZYdHdmSWVHTE0vUUpBam9NRE4reGFiRG9R?=
 =?utf-8?B?a2VJQWtzRktjd0h6aWZEbUxkTDE4OUhBdWhZUVhwUmFYRjFXTkxyYlhMUUpF?=
 =?utf-8?B?LzJqWkZlQ1ZTOHk4MnJEUG9Uc0lpaFFoVHhlWWpEa0VmWklMNmwrVE14Wm5K?=
 =?utf-8?B?cmlnVit3aHVhdlIwaHlPWUdKWUtnaGRHOTR6TE1adkZTdm0raFlXallKUkV5?=
 =?utf-8?B?T1ZqcjhYYkNTdUFVKzR1ZFl0dGtybm0vL2k1cy80K09PT1ZvMkpkZW5IZHJr?=
 =?utf-8?B?bm9UaWtmRk91WTdhNFpzN2MzdjZPN2FNWVZYZEdxbllVMDlDVW9ZbStuZzJ4?=
 =?utf-8?B?UERJQ0dJYmN2TXUzTEJ6WjJFTGNwS3kvYUZ6L1RxQ1BTNmFldEVZd1JNRFF2?=
 =?utf-8?B?RjkzdmQvTitTbHBnL242d1ZvcVl0b2M5VWJMZDZkR1lxclc1RUtQeTZITWtC?=
 =?utf-8?B?U3A1bHRxL1JoQnRCN3dVUVRma0Y5WitCMG5yR09sTzJmVVJZazFid1cyTkk4?=
 =?utf-8?B?U05QU2dOdkUzQmhLUE9UT0lISVRBRFNEdGNKbHRVVDhLdGJ1c0dkYXFEMUp4?=
 =?utf-8?B?d2kvYStZUVpzQXNSajVHUnZkWWlPdTUzMXh4SHV5eWJMcDdLOWZ5QlN3TXBJ?=
 =?utf-8?B?U09Kc05TeDZ2N2h0MzcrNmYvK1BFMFg3a2tBcnF6RUNwQlNNOStXMURXWE55?=
 =?utf-8?B?aFlxUGFPK1hFUW9hY3VsbWh1SEQ2TENydjU5bVdJQkU3Ymh2V2JNdjBIZmJ5?=
 =?utf-8?B?QW45dmNCZkhQS3dkRm0zT3NwbHFtS0VXZnNYeXNHQkhRblk4U0hFS3BhNm5i?=
 =?utf-8?B?MFNPZ2lSK0VEaWk2L2d6NHVZOXlCWEFrbU1YYnhTQ1NxQmZrM3VucUpnU3Y3?=
 =?utf-8?B?dFZqRGJmb0VNekFoSHBSazRtK3RXMDg5TDJwVTdjb0hQUWVpQkw2Y3Q5cGFZ?=
 =?utf-8?B?R3V1cE5yYXJTbUViczlVVm5QcGxzZENMRG5wTVdYS3ZweGZySDlSSCt1RVVo?=
 =?utf-8?B?VitjelUydDJ6QU0zRVliM3M1WGRMZnpkMWFZMW5DOXMzMTZvVzJwZVhWWXFX?=
 =?utf-8?B?UkZVeDYrTzJiZ1pUcVFDeC9kQzJMSmZ6QmJBRjlEd203T0JOdXZBT1pNWlZi?=
 =?utf-8?B?TS9KWGU5WTF3OUpUMVB6ODB2VDdlRHBOTEhTNTd6SWdIN3VsS2tuQTN0blRk?=
 =?utf-8?B?Y0kzTjNzVkdMNGxHNVhxaHIrVjN6MVY4SWNNc0tUL2owWHZNdnRQN1YrQXhD?=
 =?utf-8?B?OWwxOWZLaHRPcmFNYmthMHF1cUFHVE1UMFBCZlR0clJnVjQrTktaRVpHeTB0?=
 =?utf-8?B?K2ZnUzJYRXRhc1cvRHJtSkJLdE82U3UwMi85bThXbHpkMEE1Q2JBTGN4eEtX?=
 =?utf-8?B?SVlVMS9ldnF3RzhmZk9OMDljS1hKSWVmTDd4U3d3YnhnTGlNZUVwRVJ6V3Ar?=
 =?utf-8?B?ZlZ4eFdPaXJyeVNweElySndYb1gyTm5TeVZPNWpYWVVFeUkvaHhqRVlkWGxG?=
 =?utf-8?B?YWRqUlJYWlBUS3RWYUZOcTFvWVpSNFJQMU54REVmR3JPYkdZY0kyblZPWTlI?=
 =?utf-8?B?Z20yaUYzc0V2SnpDR25wWEZBNkYrV1NOd01XQ2dPeWtva2ZhTHlCdGZWTVAx?=
 =?utf-8?B?K2VxUm0yZWlHWjBSR2NVU0M1eVN2OURtbThUTzZPbnVkaGN2SGFDaVQrU2dY?=
 =?utf-8?B?YWxveS92R3c5QkpaWDBTS1JFK0MveWF5YjkwUDJUdTdwZ3llVGs5QlA0TVJy?=
 =?utf-8?B?dlhhNHdXbmErZ0NRT2JuaDJya2twMDRxenhseldpMlplN20zNGNWcW8zQndz?=
 =?utf-8?B?RnR2VTVTcmtDUGR4b0J6KzN3Wi9WdEZIZXYzUW1QM2Vrb254L3lScUJnb0pT?=
 =?utf-8?B?NHk1NVh6RjJiZDVFaHBpemdrZDdaQnkrbElPOHg4elI3d3NqNlJYL1cyaVVh?=
 =?utf-8?Q?keFQ=3D?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: d8d291e9-67ec-4e89-5ed7-08d99ebf5a56
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 11:44:54.5495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tSNhIaAX0EJrlrM3G0SbGZm2bAY0fwAC3tTi5sf3BJntKU6r890LgVCkbIT/gptp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0201MB2166
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021-11-02 23:27, Horatiu Vultur wrote:
> The 11/02/2021 13:37, Rob Herring wrote:
>> On Mon, Nov 01, 2021 at 10:32:01PM +0100, Horatiu Vultur wrote:
>>> The 11/01/2021 15:32, Peter Rosin wrote:

*snip*

>>>
>>> +required:
>>> +  - compatible
>>
>> compatible should not be required here.
>>
>>> +  - '#address-cells'
>>> +  - '#size-cells'
>>> +
>>>  examples:
>>>    - |
>>>      /*
>>> ---
>>>
>>> If I have this then my problem is with the required properties because then I
>>> start to get new warnings once I run:
>>>
>>> make ARCH=arm CROSS_COMPILE=arm-linux- dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/i2c/i2c-mux.yaml
>>>
>>> For example, one of new the warnings is this:
>>>
>>> /home/hvultur/linux/arch/arm/boot/dts/am335x-icev2.dt.yaml: mux-mii-hog: 'compatible' is a required property
>>>       From schema: /home/hvultur/linux/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
>>> /home/hvultur/linux/arch/arm/boot/dts/am335x-icev2.dt.yaml: mux-mii-hog: '#address-cells' is a required property
>>>       From schema: /home/hvultur/linux/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
>>> /home/hvultur/linux/arch/arm/boot/dts/am335x-icev2.dt.yaml: mux-mii-hog: '#size-cells' is a required property
>>>       From schema: /home/hvultur/linux/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
>>
>> This is because of the $nodename pattern being pretty lax and matches
>> on mux-mii-hog by mistake. We have 2 options. Change the nodename
>> pattern to '^(i2c-?)?mux(@.*)?$' or add 'select: false'. The former
>> would still match on 'mux' or 'mux@.*' which might still have problems.
>> For the latter, we just need to make sure all the i2c-mux schemas have a
>> $ref to this schema. Also, with that change we'd stop checking 'i2c-mux'
>> nodes that don't yet have a specific schema. That said, I do lean toward
>> the latter option.
> 
> From what I can see there are only two i2c-mux schemas and both of them
> have a $ref to this schema [1][2]
> 
> [1] https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.yaml#L33
> [2] https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml#L16

I'm a relative yaml bindings newbie, but I assume adding "select: false" will
have the side effect of not enforcing this i2c-mux schema on i2c-muxes that
have not yet been converted to yaml? E.g. i2c-mux-gpio.txt, i2c-mux-pinctrl.txt
etc etc. But there are not too many of those. Is it a prerequisite to update
those bindings to yaml before doing "select: false"? Looking further I think
there's a total of about 15-20 drivers doing i2c-muxing (or arbing/gating),
and some of those exist outside the "i2c umbrella".

I wonder if e.g. this one [1] should really reference i2c-controller.yaml as
it is currently doing, or if i2c-mux.yaml is correct?

[1] Documentation/devicetree/bindings/power/supply/sbs,sbs-manager.yaml

Maybe i2c-mux.yaml didn't work in that case because the node names were
"wrong" and did not match the pattern and then someone stuck
i2c-controller.yaml in there simply because that was close enough, and
also happened to work?

Cheers,
Peter

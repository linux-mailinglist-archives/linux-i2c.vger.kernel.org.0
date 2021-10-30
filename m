Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91591440C22
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Oct 2021 00:31:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231278AbhJ3WeA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 30 Oct 2021 18:34:00 -0400
Received: from mail-eopbgr50107.outbound.protection.outlook.com ([40.107.5.107]:21809
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230338AbhJ3Wd7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 30 Oct 2021 18:33:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vc7/uiD2IFB7vYiFdNmJ4NiuX25kjG2/EbVJY5hkxj2kSz+21rcDwOsgwwxx2bm2v8G3oIGjvpb8cdz+o/w6AitQPlZk8qdM7wXJch9YGWSkWt18f37300tP/Uh0TthWUvN84OjUVVsCsMx1bq32IZ/3OMZM59qDRedpF9HsUHdBuZVm8bgABF2ngxf17l9slZWF4xy5B7athfPG5fvhhPcqzSG0WAtvc6ft5MQ9HO8Xfqkq6UCwiikXVDQOxKj2jjfpkbjOfTXWh0Aau5mhpYzXuQHdsDDq7WC4tB41bH/huspxsnCT+4qLlF0k/A+uJCMlfX/OZR0xpafab+dMqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i43ZeHLJbtG3Yu3nLdtpjFK144mUfwtM7bODndLAJd0=;
 b=S+0F5y8/H9rPRNQd1+/WWcua2fKzD9ZUckYRIwr3Buu+EZ8LY3ki1oNWDiPUgs37KXIlcia9oh/2+Vv1WsfJc9lX2vV1/WQ6MFgs69M9kh//45kfqkG7L6774boYL+lb7GQeUEJNP/jG5sNxJPJE/DILiAdX++aaRl5Lx0Mizclm8fQ9FuV1/kMqlhWPoqM8IWrJMLCC94tBHwYdjAeYvH+7kOKF8PJYAwChBT1T9M/ee+iDp85skzDaGD5j+FLxlhVTWJ7stnWnoSFxl24iJeYxhx5WUUsyHv93JTBSio7+eoGAmQEzfnRaZ+1KXLqFQ6szwsx2mHXUFuwJkMQIWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i43ZeHLJbtG3Yu3nLdtpjFK144mUfwtM7bODndLAJd0=;
 b=mRYAWkR/X4EWzIfnKmE+Y/w4ckwk050+1gnn5yeBTBBy5kZeS88AL3zjSxiyfOnAmQnJw3geFtXkoorqBaFmCO3gVs/8I8vc86smyUoIvYlnMCDnRHc2sBm7XPUwyyqpJOz1o7k+MLzUA5V5Y2ZRIL/THVCYkHItzyhHUfKX2mw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB7PR02MB4474.eurprd02.prod.outlook.com (2603:10a6:10:67::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Sat, 30 Oct
 2021 22:31:25 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::b1d6:d448:8d63:5683]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::b1d6:d448:8d63:5683%6]) with mapi id 15.20.4649.018; Sat, 30 Oct 2021
 22:31:25 +0000
Message-ID: <ad8b061c-7a0c-6486-5b06-c6a30f6575d2@axentia.se>
Date:   Sun, 31 Oct 2021 00:31:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c-mux-gpmux: Add property for
 settle time
Content-Language: en-US
To:     Horatiu Vultur <horatiu.vultur@microchip.com>, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211028125341.2457171-1-horatiu.vultur@microchip.com>
 <20211028125341.2457171-2-horatiu.vultur@microchip.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
In-Reply-To: <20211028125341.2457171-2-horatiu.vultur@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: OL1P279CA0006.NORP279.PROD.OUTLOOK.COM
 (2603:10a6:e10:12::11) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
Received: from [192.168.13.3] (185.178.140.238) by OL1P279CA0006.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:12::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend Transport; Sat, 30 Oct 2021 22:31:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86241056-48d9-46c2-b5b3-08d99bf501f3
X-MS-TrafficTypeDiagnostic: DB7PR02MB4474:
X-Microsoft-Antispam-PRVS: <DB7PR02MB44741C7BFF1AFF32116CF24FBC889@DB7PR02MB4474.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2A45MJs7PheHJY3CXOOBD1pfDTwFpfHrNWw17VdRyIJbJs9BpsES2v/JhJqj/wfjiGV+phaai26XINEjNhlsaHBNrC9AS5cuwFgikEPicTBDp5F260FLaUTFcXJPdPtfqQoGUz4hqtxoqL9QIJFia23HEMGSfpzpsKFU+PCWrzGAR8QSVb3zmcKshGWvuut9ERHohEEnB8j18SSiWsMvH3FesL5ITWk2t9G4AZF1axttjMqA+rQpVIMk5tX2Z3hUOcB8Dp1YV9esZk3eqrQ4nBpbPzcP09oRJPAqb3uqGI/VBkhzYDR3qv0GXZIawSR8HnAX8NA8c9+YOuhMCWEHMq+2Xse3QmpwBzXK6EUs5E25cFDKY3tvliClx1VsNChuMimj2gYonRZyOHY+hiTu57Ge+CokTs/4zilELCXlZt5Mhkuuslc3tNObHJIPH0OYbaaEfCk65GzQyvbDatX/HIrUWcipb/UHWZr0u1rAZyzs8Qnt/nWDARNtzX3nQVnmyLRTUSErmeprqKlJnV29afbf6fc35JrhF/9pHsl3x9C3BLKsRtIQKQv5Xg7fBkD8r82cqj+Rv3ookCdAdn/NzQ5uJ0YvIA+XrBxuH/3fNQC3CjlTXxH8biAeFFKwajqnqm/bNhkudqJdvPiHDZp6fdh4lQVFjQhxZJAA2l+Hr4oNMJhp3tgsf2WS8KPx33Mq3JkxEsfh3/fFhBibyhVmLz/Ds/soHo3jpDWTB1HiNAQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(39830400003)(376002)(396003)(136003)(36916002)(66476007)(38100700002)(66946007)(2906002)(186003)(956004)(508600001)(6486002)(2616005)(4744005)(53546011)(16576012)(5660300002)(66556008)(316002)(31686004)(86362001)(4001150100001)(8936002)(31696002)(26005)(8676002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aS9iMDF1UUw1bStGaFI2cGNtem1PRHBNLzJZcy9nQjJKOFRxcWl5Q2k3bnkv?=
 =?utf-8?B?eDZqTmx2ZlM0ZWRERSt6TFVmUWVVc1JLY2hQVllWQVR4Q2xFVExRbzlhZlhW?=
 =?utf-8?B?QXNLMUxoZncwT3BHbGYxL0hzdGJuQkt4dURjVUsxOE9vQWdkOTRqSXF5MEFi?=
 =?utf-8?B?enBoMFQ5bWpFYVpscDBJYUpXcmc2ODRvb3FQdVh5R3ZPY09mbThYUWlFZ0NK?=
 =?utf-8?B?SytuWEdaVWZkSG1jNGRrNjRub1ZON2tESWd0YWI0eVRYTHB4OS8vbmZ2UHkw?=
 =?utf-8?B?QjdUdlhpK1ZHTXlQZjVvSEhRdVE4eFV5bjl1NGcwYnQyVForSFRaTGVnK3JG?=
 =?utf-8?B?S21YZDdmSysycWRGSVF4d1dPcWZMR1VIUEZEczVuaTBSRnBGRG5UdzJPQ1V6?=
 =?utf-8?B?UjRPNWtUbWo2N0Y2NWsrVlp4eExCbmVtbFZGTUdwVXI4YWVSKytDNjdDMElC?=
 =?utf-8?B?VlF3MElEamdLQjdOT2lSM0FRaS9sU3JEMmdTRFR3Wlk1NHFKNTh6UEZiTjg2?=
 =?utf-8?B?TENhNjFyeC9uRnBqSzZiN1NqS0JKVmkzOUI4M0hlblNjUDhHdVo0d2owS3Zh?=
 =?utf-8?B?OE1hRFFmZDZIQUgvUGtEZ1BtOE5Sc1dYQnNuOHRIcmtvUnpKN1N4WE9TUzJ3?=
 =?utf-8?B?Ykg1ZHAyVytadHh5ZWo4enFFRlNMQVJidWEvcnBHVVJ3TmxMSmk5d0RZZDRK?=
 =?utf-8?B?Zzh0VEFROGNlaGhNbld4VzZTRXNtUFZ1YmNnL0JYQ1NpVGJKSllocEFuZ0Nz?=
 =?utf-8?B?UlBPNnA0V2FGQnVJd0FmYURHK3Q3YkI0ZXVzekRobTBBV2JBbGllTEdxNXpE?=
 =?utf-8?B?a1AvN2xoL1R1VnpTWUsvdGo0QVIxYjUwamdzN1M2K3RoYmtldnB4R01KTjlp?=
 =?utf-8?B?MzhPS0FTS2RpVUpKazhmZW9YSWpCMHQ1T3RQT1dYWjA4OTAzNXFzelpLK25Y?=
 =?utf-8?B?UWJoR3p3RTdlTVZjYWlvUkxFUHRUTGRlMCswdzl5QnJKNGZYSkJ5dytjTUYv?=
 =?utf-8?B?MVZtT3JVMWNSRTZxV3hscUhIUU1pc0RYQzhncjVjR0d1cndxaG8xUFY5VlRk?=
 =?utf-8?B?YXFJNEZZbTd2NHQvckR3ZUhqV3M5aC9rb3RremdudEU3MjZQaGhuTXRpb0J0?=
 =?utf-8?B?Vk1FYXFTNmNGU1FBTUdwL3FYalJ1OGRqM0E4REZhMEg5Zi9vc1FRbjRCVWRG?=
 =?utf-8?B?TGd2b2RiUjNVMXEwZ3kvUkdyMzlybVJrcGhYdlE5UGU4clZPOUlzeTczWjdK?=
 =?utf-8?B?d1lNMWRmblptOW05UWV3TkhXaE1hRW1FTHozU3g5Q2xDYjRDWFVQVEtzbG5y?=
 =?utf-8?B?djJUYVVtbDdGOXhYb1cwd1djdEc2ZlVQc3YvQ0NqMEErSlVvNFQ3YnFieGNY?=
 =?utf-8?B?RzcrM3N1eGJOaDkvbEFWVklpbk11VExBTXZWK0JLckdIVmhNZUxlK1FmRUpU?=
 =?utf-8?B?ZEVBWGFMdFRUQTRkZjNBcldOTmNSb1liUEtxZmp2dTVNM0hRY2s3RjJKSEpD?=
 =?utf-8?B?NUROSndWMmpYeU1OL2RMS3lSQ0R6b05nNStnTHJKVUFVMUo0S2ZhbFMrenh4?=
 =?utf-8?B?T2ZUSmFWMXJLSHB2aEN0b1dtUHpaaFl1UktxUHVndUZtZ0tDQ0JCajMyaUZQ?=
 =?utf-8?B?emlDRVdudjc2RUhpZG5CN3R4MllneXBjR1VzQTV3UHA0VHVmQlMxQVZZdFN5?=
 =?utf-8?B?TnFxZjFGSWFCWjFhVVdHR2lsanBLS29UcW1MNEJoL0tlT2ZCVk1XUEdQbmhV?=
 =?utf-8?B?YVQ1VDB3RTRraW02UzZzRXNWYndudW1Rejk0SnFxZWNaU011S1d1dnBpVkIx?=
 =?utf-8?B?a2pVWlpDUzliQjU2bFN2NnZmQ1JMc3lQS3ZtTEdqdVI4cTIzVk54b0tjSE5U?=
 =?utf-8?B?Z2hJVFNieWFsTmJmMjRJZEdCZ3g1WnJTeVhSTHRYcTFqblpjRTIwalA5ZThN?=
 =?utf-8?B?akx1QjlpdDEzUDErb2I2WEZxbWdhUlh2NWdiengyZUhiMFlJVzlPUzFsbVZT?=
 =?utf-8?B?SzkyUStXbTlvcDdicTZNZGV1bzJ4Y01hdVJaZUVyUCtxQU9WTHlTVHlvOWxT?=
 =?utf-8?B?alMveTJSZ1k0Y3ZMWGFvd1lGbW53M1V1SHllV25pYWJaVC9ESUdOOU81Skx1?=
 =?utf-8?Q?wO28=3D?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 86241056-48d9-46c2-b5b3-08d99bf501f3
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2021 22:31:25.3976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 751/EjmsF/HFBoppQK+o4y5D0NLlc1KYSq9LgYSh7pGfJgwPQfsHbrnBDTEQgJd3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR02MB4474
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021-10-28 14:53, Horatiu Vultur wrote:
> Some HW requires some time for the signals to settle after the muxing is
> changed. Allow this time to be specified in device tree.
> 
> Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>

Maybe this belongs in the i2c-mux binding? Because next week it's someone
with some other i2c-mux that needs the signals so settle. Please include
some language that maybe not all driver support this optional binding etc.
For reference, compare with the optional properties in the i2c binding.

Cheers,
Peter

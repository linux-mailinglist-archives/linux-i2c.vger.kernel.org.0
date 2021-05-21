Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E818E38BF67
	for <lists+linux-i2c@lfdr.de>; Fri, 21 May 2021 08:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232623AbhEUGdz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 May 2021 02:33:55 -0400
Received: from mail-vi1eur05on2137.outbound.protection.outlook.com ([40.107.21.137]:61921
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232491AbhEUGdy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 21 May 2021 02:33:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V3dTlDOICvnbu+mpi2AJn6F19/rGlvHuqXdNmJL6YJqEGm4YDYvzMrImzoCHNniYJzttiL4VxddjWd4wQLsR0vWHjlGHLfG4fnYA+AbY66ilGGYzeiUsBZzvUrjDTocRn5acrRGs0gDq2OVKPeWpiktATMyx3hJJahnJOD0rOL2R2g9GybUJnJpTwifXX8C8aNPJKtjjgq2i5/I5+y1Bhwnk2yFrHmDecEETteWSJml+gui/moI+LPJYoTpqh32UHncWrBz7obAxTm7RjhirnVWXnXHcLTONFvhKR7WQMAe5+GPtNmAig/qXLWwjpen4vggAI1RkyePQ/6+f5uu+lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8TO1iZcmFaQaXjOPHEdEeDdpTPsCM11p/1PNTe1qoBo=;
 b=nwHjPdPbHavEvD+T+AGvDflCkDeBWuoxcGlbYvIAd7fS4aFA/yFq6AghlifUCbP48YhMGj4PvJPtq3Kr0p80f7eGbHaIeS2hPUSbpK59uWfFrbhMJA/Tv8Dtz7f/TPTT5w6QxT24nF10eYWO2VzPXL3jGCl2avvx4jsU0qM+MHk2mDymczpZ5npHkBTSkmkQgRNy2iH88aKIIVMT7DSb5aUI4J2MxuZcVk5bhYaeU4mAvGCqR+GCc78J/9M9oUmdHpaapihOSb+D9E5ZMeXE0k+DQeOSW/Oi06DBdtqpXUN1z7mstDTX/NoBJ3oMM2Nj4II/erRDOyTCJXQx8CrhdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8TO1iZcmFaQaXjOPHEdEeDdpTPsCM11p/1PNTe1qoBo=;
 b=CHDZ6FoRM20/NPYOcC3Js5aSwBQ/3gS99B6E97G1SlAu/T2xab5KVH6/NRxFu2MD3hbNBGKAr92r8TSO/uqVlaewfBASs53VN5xYZAUM4AZOCraCJjgz/1O9v0C6vNc0/bPkEZioSMRmLOEMzSTAvQobrBFgaS3/eCLF2+NBc+E=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DBAPR02MB6245.eurprd02.prod.outlook.com (2603:10a6:10:19a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Fri, 21 May
 2021 06:32:30 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::d47d:ca8c:4fe6:3908]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::d47d:ca8c:4fe6:3908%3]) with mapi id 15.20.4150.023; Fri, 21 May 2021
 06:32:29 +0000
Subject: Re: [PATCH 02/16] i2c: muxes: i2c-arb-gpio-challenge: Demote
 non-conformant kernel-doc headers
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>,
        linux-i2c@vger.kernel.org
References: <20210520190105.3772683-1-lee.jones@linaro.org>
 <20210520190105.3772683-3-lee.jones@linaro.org>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <81aee109-2095-9df8-04c2-349a44f62d24@axentia.se>
Date:   Fri, 21 May 2021 08:32:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <20210520190105.3772683-3-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: sv-SE
Content-Transfer-Encoding: 7bit
X-Originating-IP: [85.229.94.233]
X-ClientProxiedBy: HE1PR0901CA0062.eurprd09.prod.outlook.com
 (2603:10a6:3:45::30) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.229.94.233) by HE1PR0901CA0062.eurprd09.prod.outlook.com (2603:10a6:3:45::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend Transport; Fri, 21 May 2021 06:32:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d57a12d-ec3d-4518-7be4-08d91c223534
X-MS-TrafficTypeDiagnostic: DBAPR02MB6245:
X-Microsoft-Antispam-PRVS: <DBAPR02MB62458445FE2E226AE274AC9EBC299@DBAPR02MB6245.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vq9IWRZOItm76SZXu69QDCdSOQedjZNp7OOTNdKqby/HxXpGODAbyfOzlGnAyMjetV25Tb/1gvBBeVSMtCiWasXN2NhppMei0AkNLuRFmlvUTW9ymTNBjcE7l/731c98dFfqVzEhbbgjRNembnATdoLIRjOXHW3O3okQBzOqfjFh0MJ4sQKRPYzPSb01OqTsP6dvDOkTWW/gVSEYxVi46QyXNu2pFc4n4HCTfit/IK6SIehUYFVeSd8R1b1q7GRz4e7bHzpYtbwXirqRKJFB676BvUVP7/q9jZsNHsdkSdYFMz8QtCWLMi+nFh3Bk6Yh5HhD1ZaQyYBng6Hg5sT34oZstWlLp+ReXyaotXf5tsptk4mkCUsPr2JPxLUIL7zZQUgna+MHPtoG30jfVjCJsB0c8rWjJ25Yt4/PjIpSEsE3OodSwbuDuLPaSmkn4l0dPuwNpT79MRh74qLlWOTKG00BOlwi6NuM4HRJSGsUiq7Wr7pyjWWQ2UEXMw97EBQZCP3T2P3ewEfCF3JYSqwNqflTTrLJsSiT7tdCjfe+6CppgLeVOR+LlhxUfUmQfdsP4/wU8JZRAjB3ixLwQGj5i99Sz8LIeCKmADjxqx8igdOOPbC6ujHYR5h4mEnKLwRDEbH843gbziNioQIdi0SbnvOx+OBI9m1P0qQFuNHJCLJUZqRwJcEWylawCLNfI0I3
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39830400003)(346002)(396003)(136003)(376002)(38100700002)(86362001)(26005)(8936002)(478600001)(31686004)(8676002)(6916009)(956004)(2616005)(4744005)(53546011)(36916002)(31696002)(36756003)(5660300002)(2906002)(83380400001)(316002)(16576012)(6486002)(66476007)(66946007)(186003)(4326008)(16526019)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjlEU3BmbXA4R0QzakNoYUM0eHV3Mzlrcmk2bFJONkl4aFYzczl3WmJ3UWtv?=
 =?utf-8?B?bVRzTUNlSWtwMVNhdHozYlFUSlppcVNCUGdoL3dGeVRiU1NHQjZLZWhTbkI5?=
 =?utf-8?B?N1VDRGR1cExjNUVCcGpiaG9VS2FRSnBML0ZJOUJXMTg0VnBBcWhhcTJGWnpR?=
 =?utf-8?B?V0lYZzNsWjhQU0theTRRTTM4aE53YSsvei9DODkwVktpa0doeGZkNkNINVFE?=
 =?utf-8?B?V1JrdFc3MmhEQmRwNzM2UWpDaE5uYXFVWXZ1bzFzSGhHOGUwVkQ4U0JJTURY?=
 =?utf-8?B?VkhBMklmNlA0SUgzdVhFQjlnM2RMSzdmSWNVc1lubnVLZEtDL1VkcFZZZUN3?=
 =?utf-8?B?Y3IvNEc4Q2ZLT0t3c3Z2NzhnZW1xTWpmSHZRRDlGSW1xTzBFZ1dZdlZtbmxk?=
 =?utf-8?B?a0xWdHZNb3VOZzdHTHl3cmZ0eWFBNEx3Vm1tdnFwMkk4a21xNXJ3c2ZVZ2pu?=
 =?utf-8?B?QkFDNFd6UkxrZS9NbHpmcnh0REg1UHJCRHc3ZnhIOFJZcHdxWFArTEdWRWNB?=
 =?utf-8?B?TTZ4M2UxVWd4RDQ5SjJwdUtIYXRROU1UeWVGNU5FLzN3KzdaK2tNb1pMcXF4?=
 =?utf-8?B?TEZxbEZqZmtrL1gxb1ZFRkRZdFgzZ0tHR3RsOE9TWGkra0hLLy9RbkJNMXUz?=
 =?utf-8?B?Mk5IeFZpUjhCSkp3UDVQUnd3eTFyUGJhMGlLS0pvTWFzbW8xcFVFeUpRV1VW?=
 =?utf-8?B?UHlWaFBwRFhBZTEyZ29uUDdJaytIWXhYSXJZVVZ2QW16M0FCOElmd2pEaGU5?=
 =?utf-8?B?K3FHdFN0V2REdU82RGFNTnhXNVJaNDFhWWdSTWJ0YUlmdUtWNXBiNnk0RC83?=
 =?utf-8?B?ZSsrVmxhRUFmTTNocXVLVkorS3Z1bXdQWUJMSzBqQmVFV1BRbjBCZGd5T29W?=
 =?utf-8?B?MU5JeFdJdnhSRVpHalBpbU9Wby9QT3AwS0xFSEFyV3E2RzdKaHZXTmFyVjFN?=
 =?utf-8?B?NzVqWE56bEowa0JWL1NnT29aMmxZQVNNQzRYQS9YR0RRL2tScm1iUWtLaFdt?=
 =?utf-8?B?ekFlc3FJekZmOGtDT2JXcTQ0WW0xSTROcnUvTlh4Z05iM3B3VTk0dCtuYld3?=
 =?utf-8?B?bGVaMy9jQ2tUa2JqK3NaMzdNQ2crNGtGZWRzZmNXODA4UGN0TE1PeEh0V0NT?=
 =?utf-8?B?V0t3U3VncVgra1pxVjBIakx3YmsxOVBDb3BWSTJNdU9VR3RjakFEY09WSzg4?=
 =?utf-8?B?eHhZUWRHeDJSWHZhK1ZlYWpkZHN1dHdZNktBNmdGYVo3SzNjdDZYTzBWTHVq?=
 =?utf-8?B?TGs4d0luY3JhRldHYWtTanJYUk5rMVdQUTZJcVl0anNtUHpHR1U2RHV1cmty?=
 =?utf-8?B?ZnY2UkVjSDdscWk1TFZHV3h5ckJ1YWNrUi84Y3paMjlBYUM5WmgySUlmZkhs?=
 =?utf-8?B?OTBHWXBOWUc4dWFWcEJNM0dhREhDa09jeHNXRnljd3NEdlhNN0E5c3hLWFNy?=
 =?utf-8?B?bWMwNm1ObGdWd3VHNW9KTWpmZlJVR2w3OVVWMWxOMWZ6OEQrZmYrZnlSSnU1?=
 =?utf-8?B?WUY2eHN4MC8rYyszeTdOV1lsV0Y3bGdyZkk1NmJtaHU0bFh1cEVvZWJoZ3Qy?=
 =?utf-8?B?UjYzZGljazBmaGZBTEs5L1ArSmtRTmZQZ1VZRVA3NWdTMUkrRWtTbSs4V1Nv?=
 =?utf-8?B?NjVKeHJqT0RkNXc2NjVKVzY2WjNxV1hGSjRNNDVJbGUzb09DS3RRRW9mK1RO?=
 =?utf-8?B?cjB0VGF4NytOTHJGNFRERG8vRXBnQUdoNENuMlZaOHVKc0g0K2RnSDF5a1ZG?=
 =?utf-8?Q?F2fOXlD0are1gOiC5ik7g9Eys3QuY/Y79L8YQiI?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d57a12d-ec3d-4518-7be4-08d91c223534
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 06:32:29.8562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pQqI62Y+EBrS7caIWajCgPf3KiF5wrNU7ii84TIK/pRf0cVtu5b9Ip0Id6hlrGWi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6245
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

On 2021-05-20 21:00, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/i2c/muxes/i2c-arb-gpio-challenge.c:43: warning: Function parameter or member 'muxc' not described in 'i2c_arbitrator_select'
>  drivers/i2c/muxes/i2c-arb-gpio-challenge.c:43: warning: Function parameter or member 'chan' not described in 'i2c_arbitrator_select'
>  drivers/i2c/muxes/i2c-arb-gpio-challenge.c:86: warning: Function parameter or member 'muxc' not described in 'i2c_arbitrator_deselect'
>  drivers/i2c/muxes/i2c-arb-gpio-challenge.c:86: warning: Function parameter or member 'chan' not described in 'i2c_arbitrator_deselect'
> 
> Cc: Peter Rosin <peda@axentia.se>
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: linux-i2c@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Looks good, thanks!

Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter

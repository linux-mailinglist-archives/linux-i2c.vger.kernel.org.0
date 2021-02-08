Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A866C3141B2
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Feb 2021 22:28:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236366AbhBHV1f (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Feb 2021 16:27:35 -0500
Received: from mail-eopbgr60107.outbound.protection.outlook.com ([40.107.6.107]:28875
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236289AbhBHV1E (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 8 Feb 2021 16:27:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kYS3cRkBQ2oLLffYUk9NHxnRgFoQn9AmCbSfmn+23wvl4VQeBAvcBgeNd1XTE2jZOHo9x5Y3mcRqtaXOgp7R//nzEKXI7FN/jmqmhr3sSPMzzFWCvPK6riCeqGChZViLDwn22HebmmHSj732//wVDKz8cKJCz4dZMpptE3ekeaiE2c1857cDfPY+oGsWqKqrpPHzqqM5Dwy/h8eRrpgbBW4UMhNGfgwPtuIugidIhhX5UJD/OvCE73bYkXuiTPPcH8LN8parj/hbeF5FatyDNDpda1eR3n+d8mq2TCP1AMan03tudnKe4w8eKZ0b1TDzueFgF0iAlzTOUrb5ll8H7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EEbk4jmtELKibKrbpiNBNpz1ZR/6OvH8opx4UaW6JzM=;
 b=gGx9ne69psFjFxHLsMSH8hgUUbylPbsCIK72bVey+QG+GrfwtBKyvpAiIq4KtaG5foCJknde6C0ip+NWJy9prp/XrcdfmWhSiiBxCr4WG5JCurMyB3TVr5n8m+FBBlgis965WHdI6bsTG/Q0SWAmbCOalIPFyuoZUmpHriaSFGTQxs1LTF5HhCnMr91U9pZzvE8SJKsGq78P5IWypT6Yu2C/qh/ibCQP2MCp4L3rRN8zVC0ni3bMapsHpWwaA2kk1Lcq4l3msJUuCwi6wRLC0+4oYzRNN1mNYWbiSuEzmVOumFuGYRU9sBCICJP652vVZt1uWXIpF0o64wbuINCiMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EEbk4jmtELKibKrbpiNBNpz1ZR/6OvH8opx4UaW6JzM=;
 b=EJaFDhUSkUsF9zucRYOd39pv9BQlM7RREsLwezMuUcd5EPTcIkYNZWMmZCmqtWk3no4hJa94pbHsdVBRZxMvAvotPO1qI9LfxhPFHtcI2p2xnDW5mJFaQJtn0MnHNSy+Ugp3vXxdOlP4axaqBRWiER0FfuECWfx6YMm++Bx2Pfg=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DBAPR02MB6245.eurprd02.prod.outlook.com (2603:10a6:10:19a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.30; Mon, 8 Feb
 2021 21:26:12 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f%6]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 21:26:12 +0000
Subject: Re: [PATCH i2c-next v5 0/6] mux: mlxcpld: Extend driver functionality
To:     Vadim Pasternak <vadimp@nvidia.com>, wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org
References: <20210208201606.10620-1-vadimp@nvidia.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <e86e396b-b099-5174-ae0a-393401b1e767@axentia.se>
Date:   Mon, 8 Feb 2021 22:26:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210208201606.10620-1-vadimp@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [85.229.94.233]
X-ClientProxiedBy: HE1PR05CA0274.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::26) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.229.94.233) by HE1PR05CA0274.eurprd05.prod.outlook.com (2603:10a6:3:fc::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend Transport; Mon, 8 Feb 2021 21:26:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8fa1411-6193-4f3b-5790-08d8cc782834
X-MS-TrafficTypeDiagnostic: DBAPR02MB6245:
X-Microsoft-Antispam-PRVS: <DBAPR02MB6245EF98581903251F5AB407BC8F9@DBAPR02MB6245.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yGof8657eyT4wJVLkDLMdApHm6E8TTW6uTedvcCvdjKVGPDhqyanuw7AyQVjCQaLph+1Cw7Zod0CIM21HrX38+hx5bdwfBzjnKgw6raVUJwfQnx7AtzHzejGBGTAyzqfgwRhHBWXfW7Tu0QuaqUzIIVyFWE+TBkKHRJDyu4Q0fEhnrKle3j7PapnPD0E9do9ULBEXvKgn+p3xSQhyWb0NP0RNKEvbF2MH6/cd0wz5T8TnLaudjtmX+0xQmZhHUdc470ZU1RAavg0h/qckWSbr9EQS4O9e4n3s/GgZja8Mpoqxy7sU4t+zsWnm8XyLPWM/TWzZYRX1yL5VYUCai74C7btHdlEFz8Sv8hzIfccK+DJFGdqVXr4s9qHm24gU4nOUnqIatnYdyMN93Gwg1WVoo3NKkFWEovvooRLBzBkAXVbE3nZlNcoXOyzz4sZnc78GyxLdt+N5SUIznEOJFEnUeedBqWyUH+84SL7DNKj90qzt1KugenxtYQ+nSmROIzWEDYYw0lNiuWgg55TESE9EasDEJqvV368mRW+VV+cCBpi4WLYYWB/afFkYpTaCoCKKhlkm4iUoAwZgMPYNwEd/ihgh+HLBk0mVeYdCeM1STz2r/FJ877ggnW1VMlpDR9N
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(346002)(366004)(136003)(39830400003)(36756003)(5660300002)(8936002)(16526019)(31696002)(83380400001)(6486002)(2906002)(31686004)(86362001)(316002)(16576012)(26005)(6666004)(4326008)(2616005)(956004)(478600001)(186003)(53546011)(66946007)(66476007)(66556008)(8676002)(36916002)(133343001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RlZzQzRRQnljSTdHa1Arc1R5UktoQ0VyY0kxNzlWazhVY2dOZXA4eWZ3ek4v?=
 =?utf-8?B?dG1ESDcwNUdUOHpna1djVGs5SFpWMTFxQnRmT2VqVmxzak9KeDNBdHZIS1NR?=
 =?utf-8?B?ZUFkYWR3Si8yeFA1clhWWnFuZDhnNDVTTkdvRmUwZXBFS1BOMGpPWjZxSUti?=
 =?utf-8?B?NGRGU2crbmV1SGZOWTVBb0xMNUhBYnQreitlbWJ0RUpjMFlKMGQvcTI1MWc5?=
 =?utf-8?B?RkZMb3BkK3BwYzVJeXVxeXRsd012Wk04cXpXSGdrRXh5RUJTSUUvMnpnd3lw?=
 =?utf-8?B?eDZHajV4a3lCY2ZGbVdkYmMvUFZ3YkxQZ2ZKK3BlcFFCd1hTTnBmTCs0bU4w?=
 =?utf-8?B?ZXBteGphZmJTZUlSRHAwVDdGais4Nmptdm9oSXFseDJiRm5UNTZXSWRFM3Zl?=
 =?utf-8?B?NUJkangwL3pFbWVhUVhJbytWRWdqSzQ5WEhJWThKdlhITGZQYlFBKzRoTFZH?=
 =?utf-8?B?UVVvQWhHZStEd1MzWG9vb2R4VTBXR3dNYkNhSURDRWEzcUU5YzMzMlhzM0hl?=
 =?utf-8?B?UEt6L2NvY0VRbThZVWN4Nkt5QUtES1djbUM3QkVYU2pQcHZ2QjNDOGJPRmJv?=
 =?utf-8?B?MmI1Vk1LV1NzeGNaZmRMM083NTQ4R1EzT1VPaXpIVFYvOTg4OHlmRnFRUGxy?=
 =?utf-8?B?MnFyTW1qVTUrTEVnQ1ZWN0llNi9CUXFPTGlsWUpnbUZxc1Vtd2ZGbk9xL2ho?=
 =?utf-8?B?SGx2YTNqRjZJVDNGQWQxWTFmRjJQcUFQZFhSajdpb2Q0UTI5ZURZNXJKdkRP?=
 =?utf-8?B?WHU0ZXREajNJVlo4SVlBWHg5K1pTam1ZOTNQMXFBWVNrVm56NlNTSS9tWWdX?=
 =?utf-8?B?bXgwMjhhWFV3VzBBVWVBaXRrbVBmR0pRRVFXOFRDTDJRYUw3eGVjNW55NlB2?=
 =?utf-8?B?bjU2MXBueGllMFcwNEtFZmdUdVBOYWVOOGhsUVI3T3pHNXF1NVB5MFhMOGVx?=
 =?utf-8?B?N1NYYVJqZ2hGMkdUTFcxTFlTTzFKajZIZ1FYMmNMUDczd011bExieERLRm4y?=
 =?utf-8?B?VlB4NnprS3loeWc3MDErKzRTUHRzRFdBRGVVTkhwN1pWbXlsd2loM2pHc1lC?=
 =?utf-8?B?a2FBbTZIMWZZZGZsRzFMcEJxYnEwWWMvTUEyRDhma1d0U1lBTWI5d2hxRURs?=
 =?utf-8?B?Q3NzQU9tZVdpUHluTlJOc3pnNXVLSHBMb1ZsKzRzZVRXVGo5dG5qdjJ4ZUVS?=
 =?utf-8?B?OWlMSkdDSy9yV1JYak5RMGdITDMvUFdYcXFXcURaS3JrMG9BUWtQUUh0R2Yy?=
 =?utf-8?B?VDZja29HQW1aZ1doZGFadCt0WkpzQXNDM25ObVBPRmk5SHNvMGR6M0RycnFr?=
 =?utf-8?B?dUJ4cFpQbEc5eHduZVZzZTZ2ZEp5RUpJVnpLUGdVOHpaL2I0YTFrN1FYMzV0?=
 =?utf-8?B?RE9yUHNNU0RjUU1wMGxERlA1R01LSGxwVmJJZHlLdzNpNy96M3FYU3RBcyts?=
 =?utf-8?B?Zk5sOVo5N3R4Slg0Wm9hWnFtb0g5UUFndzRIZDdQb05ab0dTMzRXWlVKbE5z?=
 =?utf-8?B?L1hjR2dmZ0QzK0x6TWdoTnNKdThVVjBLRnFDUHlQNC9CUmxYUlY3SXBPeXdN?=
 =?utf-8?B?bDdBRDNNV2xobHhMU2N2NnRXR1RXeG9Yb3oxeTZFWnRTUU9KYzRxWVdNMnhi?=
 =?utf-8?B?U2VQRUpUUllHNmJZYy81bG9VWXc0WlU2SjNxbXdrV3AwY1FINkxyeEtPcmRU?=
 =?utf-8?B?cVozRWFybUI0MURoTlRGZWJqNzZrZ0J2Q08venRVTlIrb3FmYktoT1MrU0Fs?=
 =?utf-8?Q?EVTRGX3fZ6RPEVAGN/uIdJiE6JR9Qx0aT2ZyIq1?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: f8fa1411-6193-4f3b-5790-08d8cc782834
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 21:26:12.3151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4hY8fqpNN5lEdt5H0hcgMcXlXwxy09gzhhKCg3gW5OXAzAo3W2vFcEtFMLlBH2FR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6245
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

On 2021-02-08 21:16, Vadim Pasternak wrote:
> The patchset adds new features for the existing Mellanox systems.
> 
> Patch #1 converts driver to platform driver.
> Patch #2 prepare driver for word addressing support.
> Patch #3 removes adapter numbers enforcement.
> Patch #4 adds support for word address space devices.
> Patch #5 extends mux number supported by driver.
> Patch #6 adds callback notification about mux creation.
> 
> Vadim Pasternak (6):
>   i2c: mux: mlxcpld: Convert driver to platform driver
>   i2c: mux: mlxcpld: Prepare mux selection infrastructure for two-byte
>     support
>   i2c: mux: mlxcpld: Get rid of adapter numbers enforcement
>   i2c: mux: mlxcpld: Extend driver to support word address space devices
>   i2c: mux: mlxcpld: Extend supported mux number
>   i2c: mux: mlxcpld: Add callback to notify mux creation completion
> 
>  drivers/i2c/muxes/i2c-mux-mlxcpld.c   | 128 ++++++++++++++++++++--------------
>  include/linux/platform_data/mlxcpld.h |  11 ++-
>  2 files changed, 83 insertions(+), 56 deletions(-)
> 

I am now happy with this series. All looks good and every patch makes sense
on its own. Thank you for putting in the effort!

Cheers,
Peter

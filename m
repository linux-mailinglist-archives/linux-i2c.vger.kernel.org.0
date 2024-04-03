Return-Path: <linux-i2c+bounces-2752-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9FD897495
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Apr 2024 17:55:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5066D294FAA
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Apr 2024 15:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B97514A60B;
	Wed,  3 Apr 2024 15:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cornelisnetworks.com header.i=@cornelisnetworks.com header.b="Sb+CZJW6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2128.outbound.protection.outlook.com [40.107.102.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E817D14A0A0;
	Wed,  3 Apr 2024 15:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712159708; cv=fail; b=kwhAkV6KVaoORT/EYAU5ZP3PEwhq7qLLGTQCECYqqlVG2pdp/4ki2nzHXwqd2EE8uZ4NdCCWAj8FPSveXQNYVbqsd4v9y2Gw6RFlMExplmEX9WNSp2/fwfkHaf8KJveNY8+Iy8u8JvaoB5zboEB1naRRki9a3t1si3wQgl8NWEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712159708; c=relaxed/simple;
	bh=2iA+vARU3t7kcohOsiUYj0OPBEY5o+vA1UaRxGai5Ao=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jqM1o3Kl6QQneDZv50WOo12JWmrUADJBbq2UqMjmihLlHnJFUnJoMvVT4YPRhbYnkJUM5tJrjKz172os9XdDAfR1mey5fL7PV/SkkgcuUaYy89ccGIh+KP/SvQgn8UiLfqbPjkeJZ9/V4NhuHJjtrg4Wljwk8KMQepiC+qwdVew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cornelisnetworks.com; spf=pass smtp.mailfrom=cornelisnetworks.com; dkim=pass (2048-bit key) header.d=cornelisnetworks.com header.i=@cornelisnetworks.com header.b=Sb+CZJW6; arc=fail smtp.client-ip=40.107.102.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cornelisnetworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cornelisnetworks.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GI70qISv8E3rMsJv0Vd0A9aa150TLboXyly6dXuu8PYOLmbm4aw2BaRyu2KYU1RhG3PCDUqpHr4MmfwjkeG7aq2WmnT20NhCGMrUJhXPDXefLa5bgX3tjLo9EG153DpQt1uIJxCGeZgIN/Zd9D3gj53wQfjsNalRY3L2zuDLUVFTIMQ8rZ9fjn4TiRgGcIinlePYzY2NGWCDgW07OcV05knRQb+H28zxvshrDdNvHLDNlGf9rDYmGCQr7ulRL85OyOcJg07aN8G088jJWpSeqbQcZXFs1rQfvTcPReU3DqcMrHBa9x5C9Hv6lmI84uas0qB8640EqO0f06EeacY+Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/McWCkIj2q23R1TEabqo+jJ4neecfJxIYkwE0wlj6s=;
 b=Isjzqhz9h3TkhOPW0o5LMEb8X2A4cBKxjZCknw3O6TwvjOJUzEKH7zdVyTkuO5QanC389cmxzbrWGhN4Ta68G3SxB3g9JVVbH12I9ty3tojb46ctlh2KE1Bt2moaiNtonpEDaFBQnYP1ka/Pbu1dVe6q1YOdHu2DJfikHDiFoI/tAL0JPSfOJiM87yKY/C65LJEdikul7eH58g/gnBgaXSRdARq0fY6WYoaHNmR+8oXTFFvGR93N+F5Rm9NuaRhOCvkW9h54Qvyr60Ioa1EJ4SUbRT8DWT6E6MVhxn++YE0jOqrhk7nG2wmBonlv1+R4STpQ1VTLOgPunP7dNyxSMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cornelisnetworks.com; dmarc=pass action=none
 header.from=cornelisnetworks.com; dkim=pass header.d=cornelisnetworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cornelisnetworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/McWCkIj2q23R1TEabqo+jJ4neecfJxIYkwE0wlj6s=;
 b=Sb+CZJW6LaIpobeZyY3P+NlxCD6RW1UlRkk7AmvBdhIYpFn6DSVYEkjmSRqBcJy/ztZTMkK95BTfAPb6FmwkY5qNk/gREKiuLD2FOfyCTmYQrEXGzRt359o7kGEMqHbhZMttSltywmXlfOYUT4Ab+EvRzSPdX1s9fmQ5F+SDXKHeJxGB3raY1xqzSaZFw6b8dJNiGIka/zitSYrD1FRLWUqsLLtsQT1jSoucjDifCARGt5FLwz+jRbmZ3teEBwocQiCX0hhrN4Ct7/AAXNdf1GS8Fkl6ibDMZbxhETX9mKZx2h2xVwUWsfvZts8N7HBxl2JJxAwxJrVTFLD7zcXZZg==
Received: from SJ0PR01MB6158.prod.exchangelabs.com (2603:10b6:a03:2a0::15) by
 PH0PR01MB6603.prod.exchangelabs.com (2603:10b6:510:75::9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.46; Wed, 3 Apr 2024 15:55:01 +0000
Received: from SJ0PR01MB6158.prod.exchangelabs.com
 ([fe80::82ae:ed8b:de46:cff2]) by SJ0PR01MB6158.prod.exchangelabs.com
 ([fe80::82ae:ed8b:de46:cff2%4]) with mapi id 15.20.7409.042; Wed, 3 Apr 2024
 15:55:00 +0000
Message-ID: <0214214a-73c4-46b4-a099-189036954aa1@cornelisnetworks.com>
Date: Wed, 3 Apr 2024 11:54:52 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v0 01/14] IB/hfi1, IB/qib: Make I2C terminology more
 inclusive
To: Leon Romanovsky <leon@kernel.org>,
 Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
 "open list:HFI1 DRIVER" <linux-rdma@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 "open list:BTTV VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
References: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
 <20240329170038.3863998-2-eahariha@linux.microsoft.com>
 <20240403083025.GT11187@unreal>
Content-Language: en-US
From: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
In-Reply-To: <20240403083025.GT11187@unreal>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1P223CA0025.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::30) To SJ0PR01MB6158.prod.exchangelabs.com
 (2603:10b6:a03:2a0::15)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR01MB6158:EE_|PH0PR01MB6603:EE_
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nrIf/wbLLYHLjaANcEhOVs3emIi2sLx6VK4s8K1UUgBzWAbBwenMECQ7FqLUR4c7H4f9D8NibV4wk87xtMwBAnZkkcBKX5xlUjal4inBVRnKmgsmtaVn1RzuDDUs5QNKtfUDQK5TwCicmyJvnGnHfFT2c8dv9rdmdh9saVvZ6zbqd2dvONg5MNzlSerEzDREDfMI0kq7nCqQpihF6yownjXF5paaDizASDunA+UmF5enmxQ3ckiQsvyTLpXQ/ufEGZyIXYv6Sr/HSw/EIKUeVcoao8CV8dv1ft1vhP8SZu3I7Qc0G/+KfYXSXPlnvSpm4cz+cie93dMNZktDlD125WSxxZATDbX5YfpDu/FOKNhGPn7bRMOPxf7XTUUumch8L8yWbKpRQuVKevc6T2qRS+sMfuYkjRqIBfV+XkMkaEObgkn1yKhuqZQcJ9cQAwJc67r2TrGG42CXl2V4RImktqYqEjs2uaD4JLgPKcGzePGnQEY6rZYEnMjuNzmA6wuFSQldFTwtjWBKwSX6dRA7EMEvHrIMyW3wlNq/c/ZIPVuCCOLt4XfWuFFnL/KbhO3QT4vkeONaNIUCXldv1zPBAeYnmw9yVx1vG3tZ1QCTo2BR00qRGSzrT7Yf/FbtpiwMj8olBaVtJbx7TLeqkzjozeTSyxoCCx/YNV8YhJ7BFSk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB6158.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(52116005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1ZxcVpScWJjb2RsY3lNeEszSU9lbyt5UWh6VXpjeTdURzhxOEhvQUwyUXQ2?=
 =?utf-8?B?eWJ0OUtaUHJjYkVtYzBpVjg5dFpUNUhsa2FEUDViTEVVS2NFcHZ0eWxtdjNH?=
 =?utf-8?B?bzI5a2psb0YwcWFxVWwvTmdQUDFhVFFQWFM3TGtGNkVhZG1kOFNTMEhJMEw1?=
 =?utf-8?B?OXNYb0Y1SUlnbDhJVGFIWGVkdXZYZFUwWUxtN0YzOGMzc0JSK0Iwb1RTWEl6?=
 =?utf-8?B?RE12NjlTdEFybjNuOFNaTldSSzYrTSswaUNBcU9adXdlbnp5NW10TE1sb2gw?=
 =?utf-8?B?bEJmNFRwekhWM1RXZU1OWHQxWEhMc1h6NHhtZEZJcTExa0prNlVCT2VobEd4?=
 =?utf-8?B?ZGlQUnZnVWw4RUk4MDNlVmVyMC9WRFZHZ1pkN1o5ME9qZXZRVzlHZzhKSkpP?=
 =?utf-8?B?aklESmljei9JYzFjSGExL1laZUZjME5YeVBhcDhQbFJPOFFydnh4bmxOcUkz?=
 =?utf-8?B?NzhBVnhoTzZiRE93Yk5YbVFtbmdhMXk0bFJRdmJVT0RwTkRMMUtnQW5UWGQ2?=
 =?utf-8?B?ZGx4SE9QSEozWnhhOXM4MW51ZEZwRG5ONHhPZDB4TWVPM2xCekRDRVJGK3R0?=
 =?utf-8?B?b2lVajdXZ0MzRGxaWS8xVFR6L0lPYkhMVjJya0hubEp2VFlVMmRtS0t0U0Z5?=
 =?utf-8?B?VWtnS1Z0SmphYWtlNi9abjEyLzZ2ZWVKL0d1ZU1kNWt6NHRkbmZYcy9uREhW?=
 =?utf-8?B?a0xreGxoMXJoV1RPUWJva3NaSG9QWlVMRHBXbEJsM0lzZ2pwRlRuc3BxWCtu?=
 =?utf-8?B?VjVKN05ONnNhanFnbzA2MVEwZU9PVjByMlM1RFNYNm5QbVNGS29oKzhJNWh3?=
 =?utf-8?B?TnVTN0FYNERqMzZLMVBVaHVJWFRqamVYdlN0bzdmVWt2d0VFd3Q5ZitLM2ZV?=
 =?utf-8?B?NnkwR1ZPNUFWdEdXYzZqUWVabWc3TmVBOXZ3RjJZeUNtOWh2YmxUOWM0ZFYv?=
 =?utf-8?B?TEpJbWNSMFNaeWZudVpUWElIQngwempTVnQzbFRScjlTQkF4SWt5OFZkNytS?=
 =?utf-8?B?K2w2Vy9xak13WUxKR2ZiVTYrVG9yWlM5dThpVzdVWXNIOHN3VHl2cjZhRCtp?=
 =?utf-8?B?TUxnVDJiQjNhMGpqRmRobGlmMExISml0blMwQXlXWnYydGM0V1VuSFRrbjV5?=
 =?utf-8?B?N21paW95WmRLdFYyTk5YNDlTaUlSUWg1bS9qblVpbjdYcms0eW1SN3dhcllM?=
 =?utf-8?B?cnpXQk0wLzVzWFJqNTdWVnF1SEVLMklIYmw4dnAvaVU2S3I2QlVXcWUwWFZD?=
 =?utf-8?B?N21tVytYZDgrbUI1SXpQbVNvQnpRU09GemtKR24vMEZqNjJXVUJIQ3p3S3ZN?=
 =?utf-8?B?YjdveVJrRFRzbm5LQ3BiZkErTkl0MXdNd29xMVkzdkpxbktvNmlqbDlFbEhC?=
 =?utf-8?B?V3Urc3JuR1BuQXlvd0UwMzlqSk40NjF2ZWlEVHhSRE9aUk80ZW5UUjhJbkhW?=
 =?utf-8?B?NGhQMHppZm9uTDEzc0FCQ0dFVFUzWGRrNXBMdGhNUHlEU21YQm8xQXpURlJN?=
 =?utf-8?B?ZHN3UVBjeVJPWElkaDBRLzdPUDRzYVk2ZmVncVE1TTlUMTB3d2UyZHlXRHZk?=
 =?utf-8?B?S3ZJOVZ5RXhjYkgwYTRuVzNFcm91dmtxZjZyWVF6OHNCQ0tqVVBHaHhuTnJa?=
 =?utf-8?B?REIrKzFvdE1mc3UyRHhsZFpacmxwYjNvNlpCc3RKZTVIVkQxY3FEekYxK3ZQ?=
 =?utf-8?B?amRuTy9OMXU2L2VQS25KRDEvdHg0bS94ajB2SDdOUWQ3TjZqaFZTQndxdzdB?=
 =?utf-8?B?QytMbUVIK1dzT2xJRTA5UENZYnRnRzdvWEFTQlREUmtMM0lpcnpOTEJxbkky?=
 =?utf-8?B?V0NvVlpveWtRWUJvc2hsZDN3QUZneEE1MUJkaWEvcndMMkdSUEh6NWU5dTEx?=
 =?utf-8?B?a2M5V3RrMmpjS0g0WkFzd1Q1N0oxcUM3azFjYUJCajZsN1M4cllnQ0wwK1dL?=
 =?utf-8?B?Uk1TWlRUSWl3TDFNdFAwNlVnZE00REhVSVB1UlR1SHBDQU1GQ2laU0l0aTN4?=
 =?utf-8?B?TFJ0eDhwMWZSYzVpU01ScVovVE1DQ3Z3ZmZiTjgva0tWa29jU1puNzBEQ1ls?=
 =?utf-8?B?N1lsTVlOTnZYYWJXUU02K1pDcXh3RFFQSDdTMExTMkRaNFdXRmVCWmY2UzN1?=
 =?utf-8?B?cWVUdjJLeWFWZGtwenFzNmp6eFpXamg0WXFnYWFXUHVKUzNLUU56WXdGckpQ?=
 =?utf-8?Q?HBnu6TdOM8KTUzV2ADxO0sc=3D?=
X-OriginatorOrg: cornelisnetworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52238616-eb3f-4744-034c-08dc53f66b1a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB6158.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 15:55:00.6323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4dbdb7da-74ee-4b45-8747-ef5ce5ebe68a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /8lVdPrIYGpjpJ7zVHlhIgtO5fHdjrEYdcgLp3d/P/2yZRzBetv72+urNfNc7PJ+Nsq6FicmOPTKil+GN8mKQjY1wmStmxxhDq6SyEB2eyOYWaVm8WopdgjdtSgfjZEV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB6603


On 4/3/24 4:30 AM, Leon Romanovsky wrote:
> On Fri, Mar 29, 2024 at 05:00:25PM +0000, Easwar Hariharan wrote:
>> I2C v7, SMBus 3.2, and I3C specifications have replaced "master/slave"
>> with more appropriate terms. Inspired by and following on to Wolfram's series
>> to fix drivers/i2c[1], fix the terminology where I had a role to play, now that
>> the approved verbiage exists in the specification.
>>
>> Compile tested, no functionality changes intended
>>
>> [1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/
>>
>> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
>> ---
>>  drivers/infiniband/hw/hfi1/chip.c           |  6 ++--
>>  drivers/infiniband/hw/hfi1/chip.h           |  2 +-
>>  drivers/infiniband/hw/hfi1/chip_registers.h |  2 +-
>>  drivers/infiniband/hw/hfi1/file_ops.c       |  2 +-
>>  drivers/infiniband/hw/hfi1/firmware.c       | 22 ++++++-------
>>  drivers/infiniband/hw/hfi1/pcie.c           |  2 +-
>>  drivers/infiniband/hw/hfi1/qsfp.c           | 36 ++++++++++-----------
>>  drivers/infiniband/hw/hfi1/user_exp_rcv.c   |  2 +-
>>  drivers/infiniband/hw/qib/qib_twsi.c        |  6 ++--
>>  9 files changed, 40 insertions(+), 40 deletions(-)
> 
> hfi1 and qib work perfectly fine with the current terminology. There is
> no need to change old code just for the sake of change.
> 
> Let's drop this patch.

Agreed.


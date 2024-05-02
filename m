Return-Path: <linux-i2c+bounces-3372-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCE78B9A8B
	for <lists+linux-i2c@lfdr.de>; Thu,  2 May 2024 14:14:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40C2C1F22BEB
	for <lists+linux-i2c@lfdr.de>; Thu,  2 May 2024 12:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C27677F13;
	Thu,  2 May 2024 12:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=theobroma-systems.com header.i=@theobroma-systems.com header.b="GF/Z+nGW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2101.outbound.protection.outlook.com [40.107.8.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1106341B;
	Thu,  2 May 2024 12:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.8.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714652059; cv=fail; b=ne3Hn63XKtRYai82BjR0vyxmNHtME9kbQR+utys/RYJP7QbtpFSsihDf86DUfpyq2xAzSA2QhoK3QSNJvffoQyIlk3ajtlLu+o/bh3g4QIRih5xZTAr9e0TFm0y8/nGwtw7Tot9A/Lgvw0m3L4LiDopyzuJPo6/CfqHMOnBaDmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714652059; c=relaxed/simple;
	bh=LqpXefInW1026pVVLKSbuMNhNjdQcjzGC5FCS13VyyI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=psU2p8Frui9DXYsHy9U18RtnFr5JxbKdcYgLXroczjwWFyjQvyIdog9Jf+4X51UfDVoSX10yuqJaEzMS0sXzd39vTAo6EFewhrDgzL4ec2bVP0b19nMr2v0BoGp9JzZDPF/2gLF7z7ezYeouo7lsoG4O7VdVjcXwFMOhlDcG8iQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=theobroma-systems.com; spf=pass smtp.mailfrom=cherry.de; dkim=pass (2048-bit key) header.d=theobroma-systems.com header.i=@theobroma-systems.com header.b=GF/Z+nGW; arc=fail smtp.client-ip=40.107.8.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=theobroma-systems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aDaQqeQOXar9L0OC7PjnwC0qSblEEGOssuHZFCTGlR9PlntEPgMEHGoFSCzFB+FRodiRAsq5zkU374RsgRo+JN0KRFoQ0vour1Xhc6US1jvkXFrhOuiJK9I8dMQ8hnL/ftepffYvYkt3YwGfMOBR7+IkdFFM8v+kTzE5MsUtdZSYi9NQ7RpU5jfOEEEarBe5Vi5uzfe2c6mXC3/Fotue4/7bKCmfBSDcMaNo8COP/85iq/iGuNHTb8I599kupAdRnBLAoqxm1kakWA3SrjcviL0cnclpTYz/NCkzMp3Oyggh4gW8wrTqTe1/+4BsbKKMBNefhLHicONydTsaCPShGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qY607RuOjkthsJeGb+4yrZg/ts/is+MS55ycucs5TYM=;
 b=PjpIWaX50HXWtWKI/1JxYkzmwzZk6OVnCx006Ovr/HLxz+il+cT1A+ErCylS5R9RbESw6wVn5zqI8ECiaJRJnqiZ0fRKpwdcOBrgPEmgdWh9QUMZkJsYil+zIXF4VjfiL5gQWLOSY3ze/ETr+V9dwbP3uHpFpkWRY/u3FbzlLtasy4XhenB1qQnamuoKLpeoHEFCL3NsodSl9xvguyWA6cecXzx7FTJV5AvCTpw2yVTuOJ2WjnSVdmicmfGgS/0lpp5DLktLS9yhtsCRMxHoRO7+u8RHmuJTKi+cdQPqHrHZXrY6raZoexDSObJdRONFA0M+6PGp+a+WupkQgadXzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qY607RuOjkthsJeGb+4yrZg/ts/is+MS55ycucs5TYM=;
 b=GF/Z+nGWFRI0mrS26Dla7jydcCvj0PrPoLtdd1CCTZVj2QKXDmShz6usFBFJ3sbYYA/VSRIbnWE6lC/xFkfsBVWBP2aT66ELiZ+InMp+p7xNXgqBMqh7UjhqHms/bU7q4DdendfBFE4TVaeCuVqCO+UlgWHpGBNewpDXBFz7nItEtZxgbY8gE/zhDqZ+2OUR/UHoi4I3uoRWv9VmAFy83YrXgHK/OGSbg9xRIaM8WhmNm+0A85RND3WZ5stfZvAEUEUQRUnvlh7ChRF4CLF/J23LOtfjqSPzhmA3l7XwnWJkcEsh8JyvfTxBtwOg0ihiVMfjaYXWvKz1rkJKYnd46A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 by AM9PR04MB8305.eurprd04.prod.outlook.com (2603:10a6:20b:3ee::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.36; Thu, 2 May
 2024 12:14:11 +0000
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::59d9:878d:65f0:3936]) by VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::59d9:878d:65f0:3936%4]) with mapi id 15.20.7544.029; Thu, 2 May 2024
 12:14:11 +0000
Message-ID: <875763a8-fd58-4759-818c-b36f181ddc44@theobroma-systems.com>
Date: Thu, 2 May 2024 14:14:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] dt-bindings: i2c: mux: mule: add dt-bindings for mule
 i2c multiplexer
To: Rob Herring <robh@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Heiko Stuebner <heiko@sntech.de>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20240426-dev-mule-i2c-mux-v1-0-045a482f6ffb@theobroma-systems.com>
 <20240426-dev-mule-i2c-mux-v1-2-045a482f6ffb@theobroma-systems.com>
 <CAL_JsqJH-wD1BbSK=DmBtftpWT7YDbabmvgy1+PPii-8ziHTiQ@mail.gmail.com>
Content-Language: en-US
From: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
In-Reply-To: <CAL_JsqJH-wD1BbSK=DmBtftpWT7YDbabmvgy1+PPii-8ziHTiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0031.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::12) To VE1PR04MB6382.eurprd04.prod.outlook.com
 (2603:10a6:803:122::31)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6382:EE_|AM9PR04MB8305:EE_
X-MS-Office365-Filtering-Correlation-Id: 42b2ce7e-b729-4004-2e17-08dc6aa15fce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|7416005|1800799015|366007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VW0wVTFBQmw2WjhLK2Q2UWErdm82OU5KUHF2VGJMYzJwT1ZmUEVGRjhGY2Jt?=
 =?utf-8?B?dm9xSU5nNnR4cVYzWnV4WElydXRkbGRjaW5DY1EvQXdIVDlUSUlUVkZMa2xn?=
 =?utf-8?B?REk4S2tzY2NWUEkzenNKNmt6dXFjWlp0Qi81cEp5MlRHbUlSbTVEdXI1TlFH?=
 =?utf-8?B?Qk1NWERUZlZtNXA2Mmc5VnBNRVZGOVdyc3pTdWVyUDBray9UYWlFUG1JUXVo?=
 =?utf-8?B?NXQya09lWmplZTh1Nm1rQ2FaWmpQMGh6eDgwKzFFLzhGbmZWOXRnOXA5VTNU?=
 =?utf-8?B?TWljZ1JsVjNvVExheGNRSEpvdldtNnpTTEtXbS9uN3ZJOUtQTjllQ0htUHY0?=
 =?utf-8?B?bEl0REY2c1ZkSnFjRE1EaC9NVzFxQkM0WVhKbUZtbTdxeUY3MWFBZms5c1B0?=
 =?utf-8?B?RHp4VnBiUU1IVFhOb1h5alFQSWVweWdoYWRlZUV1c1ZXdGVvVXJ0ZkRmeG1i?=
 =?utf-8?B?Q2huQVc3RUdxUnczRzBwRUlrUXN6M0crWThFeWk4NG5QTENUV3dSWWpWR0RF?=
 =?utf-8?B?R0VFc0U4ZG5CY0dFZW5TL3BxbHpuL2M3cXRwMlBwT2kyeGg1dEhaUHhZYjlU?=
 =?utf-8?B?d3JQQzBERkVQdGErbHM2T0FVYjh1UndwZmc2Qzd1aS9oTnJodS90QmttcEtG?=
 =?utf-8?B?bmFRYUhMSERHTFlNQVJjTDV3SnBGZUs0S1FPYlJTb200cmorVEdROFdSWUtv?=
 =?utf-8?B?REdzVEYvbytGdXlJMVhvdlhzbkt1ZnJLT3YzVnBUdTNTTktvZUFxMHZvMldp?=
 =?utf-8?B?dlRPTG1PckQ1LzIwMHJVOWNHRFo5NWUwci8zTTJLZjdNclViMVBoRXF1TkIv?=
 =?utf-8?B?VDEvVGkrTDVZaVY2U0R0blRwd3c5eDVxNFc5UW16TG9VeElGUitOdXpudDhL?=
 =?utf-8?B?eUgyMXo0bFlTZDlLcnpHUFU1b2tRaEZvQnFwWlJpYjdhTnYvYXB5dVR0WnJJ?=
 =?utf-8?B?OXYwTXZrdVBubDdGTDY5MzFKZ0ZqWkZzbEdOOFg3RmY4NGIvRUdtOUcwVnB5?=
 =?utf-8?B?Q0dDU2lvUHF1K0d2QnpBUWdOSldXVDAwV3VMSVU2N2xEQzliQ1E0VWpYVjNj?=
 =?utf-8?B?Wjl2ZldVSUsxdGRuTmlKZHZxdW5xZE43Zi9jUVJZNTI3aVVjZnRDNVV0b3hP?=
 =?utf-8?B?QkZNUkN6aEhkWWdtNnFIc1pRZ0JJTjlCR3hxUG04MUdtUk8xazhDbzBzVkVs?=
 =?utf-8?B?aHliQmhLQ000UlRBaVZhd2NwSGRaRysrNHF4a3M0Q1VuWmFUa1J3NVgzanNx?=
 =?utf-8?B?TjRaV3pjc1FXUm01VkNRNE12cmVUMzhyeEJMSDZ6Y2hLZmNjS3JvYnhOdXFQ?=
 =?utf-8?B?RmVzeTZlNGs4b0xQK05VQkkrdFpNMFgwMVR5TXFxQUo2aktzZ1hDSWZQZlR2?=
 =?utf-8?B?REc5aVNNUWt3NXhDTE0vQzJxejRPR24yYjhUc3JCQU1vd1hKN1NnUU1yQW1T?=
 =?utf-8?B?c2N2QzRVVm0wWklmdkxHanhkVU0xMlRzMHAxV0VhS3Nka042Sm9HckhkQ2Zn?=
 =?utf-8?B?MndvTVVkU21yWS9oeXg0alJleUVMT0xrdVB2T1FVWnFuZTk2VVl4ZDR6NDF3?=
 =?utf-8?B?RlFremhCMFZZOGxVcCtkQnZUZlNGbzlJdUpGZ21qYWFtOHRoTGFPK1RyN3RG?=
 =?utf-8?B?elpjR0xIbWJMRmJ0MjNPWkFjNXlZMkNXYTlHZFphY25BcGcxQWtBbGNGTlY3?=
 =?utf-8?B?aVAxa1lTa29SS2l0LzNjRjlGaTRCeXR3Vkk2YVQvSStKSitWY0xiMjFRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6382.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUEyNjUvR1dRRkZMS3ZOOWlJZUlzTUl1cHI2Z1gwMWREUWtIUVBnTU5xMGlI?=
 =?utf-8?B?c3I4d2pCcXpIekU1WldqTDRVNlRhYmxUQzJxckx2NHpZUWZ5RFlRQW8vMGw5?=
 =?utf-8?B?eDBhNWdrSjdNUjZaejRQUVYwL0VvU3RLNkhPSWNTWVI5cVg5TzM1bkFQeVZh?=
 =?utf-8?B?QjR5TVpNOEJhSktlbWFURGliRVlFNFBZNzdBQWN5ZXNBMURtVmxPNnJTdDBl?=
 =?utf-8?B?bVZPbVp3Qkt4K3VwcFJDWjh3TFhSOTB0Z2pTNXZZVm95eC9NSHQyOEtiamNJ?=
 =?utf-8?B?a0lGanl3Q3JlNWN2ZklTTCtPcFlkMnhzV3NLS0VNdlpmODVOU1RIK2RGVEM1?=
 =?utf-8?B?TDZ6NjYxN2FkcHBONjJyRkhrU1ZGRVRwNnBoUkpFQTRDMUtScEVlcEtUSG9T?=
 =?utf-8?B?R3NkWnJnZVVsVC90NkFEWU1pZ3IzWUZYWUlXeFJCTWpjaGRBSEJuM25YaVJ6?=
 =?utf-8?B?ZDdNNy9ZNnMwbGpIdGxhLzhiYS92V2VaR0E4bjJJYjBMenlNR3pOd1IxQjdM?=
 =?utf-8?B?L2JSU01KcFdXOGEwZ3h2WEI1dHFPN2lyOFNiL0NIQUdGWmhTTGx2SE93ZWdy?=
 =?utf-8?B?Z01aMzVoL1hYL2Z1ZXh1RU1RTjlPZEJSR3plbGV0L1BrdXUwY0ExSXZUZWtB?=
 =?utf-8?B?M2wzTmdlNWJidUhZcFhtRE1sLzl4MFU3TXhvSi9jWTkyNXA5WnduQWlqWkVs?=
 =?utf-8?B?VjduRkZiS0FZdVc4eXg1ZElLeUY5RWEzSTZFTGxoUTNablVPNSswSUNsOCtD?=
 =?utf-8?B?QkVnOE0xTDBHdllMMEpOTEZIOVpWK0xGVGs4eWp6eFBtR0hTZkRsdGlka3FO?=
 =?utf-8?B?MG1rZ3JRSTE1QXV5REdIc3hQYU1MTnZvT2E2T0JIRXBSZUtTRUV2c24wanNn?=
 =?utf-8?B?b0NSdWtqNGVMS1JvdFdsSS9Cb3FGVjRIN1VySGs2WW9LYXVUejQxSVM0d1l1?=
 =?utf-8?B?SDd4WVRzNzkwWitJYzBDUDRubzdUWjdFU3BvM3NiV2pYdG81ZklJZ09XK2Zw?=
 =?utf-8?B?Z3AzZWFuRkNQcVB4Z0lPYTFiSTIwYXNEY1pxTmhwMWh4V0F2OFN4TVdRU2U4?=
 =?utf-8?B?MmFnS3R5THRJeEZ1MmJ2Yk1rdFhsZTJLQ25yL3hDdkVVcSthUUpqdXpaVlQ0?=
 =?utf-8?B?bUcyZ09ZbnpqcEFVMkg3TitjNVBRQTFjY2dHOW1pQXRWTkozWnJVRTJ6R29O?=
 =?utf-8?B?V1NCNEJBZHV4LytRMzVDMjNYQm15WjRIbVlPVjNmQVAwTllpMnRiaXBDQ2dR?=
 =?utf-8?B?MXIyaW9wVEdaYXhWdUFmOXJoUUJqY3g2VWNJbjFjQ1FJOXBGQkg3cUpvOFpt?=
 =?utf-8?B?NmNscHM1MmVTMHFaWnFkM3NIQTVvQlU1b1lXeGZoRk5taTVxV2ZweDZ6bU94?=
 =?utf-8?B?djhtUDg0N1Z1OFE0bFQ4ei9QSG9scEwxdFNKanBvMjBNYTZuQ2JrTHFFdXM3?=
 =?utf-8?B?eHp0ZnRhMHFLYnFsTVl4Qk9UcTVDdFV5dTV0RVN6Vm1QV2s0YWE4MlpDY3A2?=
 =?utf-8?B?TVk4WWsxamcwUGdrbDJxaEh1UmMwQXZCZ0I1TTJzeENpV0RvQWpEMDB0aDk3?=
 =?utf-8?B?OXprSEpuTkNOaEMrYUpYRDdLVW95QnNSNTUxVW1DS2drSVBYRDJwWVA1ZURP?=
 =?utf-8?B?c2FMNk5lZUdZRHlXSExmWlBFb1hWaVZJcGx5K2V0eWhxbzVRdUlyNXZTNUZa?=
 =?utf-8?B?RjdwcEk5UmRQa2VrWFRhTlhyS0RJZnpkdWpQeWFyK3ZJdHowTDFERlFxN20r?=
 =?utf-8?B?OFRXQUxZcmhpL3JVaWdBaGNwajhaUjMvakZyYWJBRUErTThPb2NudmYraDQ3?=
 =?utf-8?B?bGJhdlJvSnBuTEZXOVFRYWE4b0ZQbExacEg0UHY3cXhIclNaNnlUMmJ6VDMw?=
 =?utf-8?B?VXQwWGhiTHM5eDRLeFdwbUlCdjlDV2RiSHBMZVBGU0tzRmM0eXZTc3pxWGp5?=
 =?utf-8?B?eXdHdEQ2TmhTdXVPTWx1TFFXR1RFTkdlaG45WXE4Mnc3cGx2TTRJUEdPZDFE?=
 =?utf-8?B?UGR4aEgwQTNUWDNYeUJ5RWdicEtreGUyYTVESTJBL0lGbERFZjRRV25Uc1Br?=
 =?utf-8?B?STQ3cCtHdmhsd2J4TWZVVFordnZNY0RxVVV1YnVnZlhIcWl6c1JrQWdKUzdR?=
 =?utf-8?B?WlhUVklnZEkxcmx6aFA0U2k1emo3VzA4M3ZieTVKRTRXZzY5MVRSbEVxZlBM?=
 =?utf-8?B?MVE9PQ==?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42b2ce7e-b729-4004-2e17-08dc6aa15fce
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2024 12:14:11.1516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YGLzTKIAOTDAPxftheJu7QdoRT8WLG2rzcCwB9fsmKsCpss5ICc2jd/eIYvBCvLbiCItlUsOBkIETj1bJHDGj32keuJ0Q6SKz1X98TnpSzQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8305

Hi Rob,

On 29.04.24 15:56, Rob Herring wrote:
> On Fri, Apr 26, 2024 at 11:50 AM Farouk Bouabid
> <farouk.bouabid@theobroma-systems.com> wrote:
>> This patch adds support for the Mule I2C multiplexer.
>>
>> Mule is an mcu that emulates a set of i2c devices which are reacheable
> MCU
>
> reachable
>
>> through an i2c-mux.
>>
>> The emulated devices share a single i2c address with the mux itself where
>> the requested register is what determines which logic is executed (mux or
>> device).
> Just to be sure, we need a complete binding for the MCU. Is this the
> only thing the MCU does?


Currently that is all the MCU does. We plan to add more features to the 
MCU firmware: Buzzer over i2c, watchdog over i2c ...


Best regards

Farouk



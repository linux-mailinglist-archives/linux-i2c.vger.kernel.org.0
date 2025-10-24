Return-Path: <linux-i2c+bounces-13796-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5084EC06F8C
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 17:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A75C64EC2F5
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 15:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DA6F326D68;
	Fri, 24 Oct 2025 15:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y7Uou/PI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012010.outbound.protection.outlook.com [52.101.43.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6584531D382;
	Fri, 24 Oct 2025 15:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761319745; cv=fail; b=PatDyR/FQg+vl2b9SRf6gnDSTvDbWCxS3Llw+ujQMdV9K5mmC8KcoaZiGeosheSJE8eGwNED6g2IGfEpzUn6IYZZQ8G/oodXBiA2wxRJr1mkWawJgoPMtQw0sDN4M5az3/EQTTvNd4b2bQlIvGzVf6gzz+UhJ/bk24U/Cui/7bw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761319745; c=relaxed/simple;
	bh=kFPuk7CbVgUaNbwm1IoIXsWapWhTnQZE99ODFIVCGaE=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aroIFt1G/qPs7QhMUb8WVjOEw89W0mWnjnMei02ClOoVeg/9XEmmYiXNnHXAqV75dE3+posWAO9nRBB5AqeQLu7hWQa1o8wZRqwDy4TM9rtDKgyAkwMObKQwiE4KjgdTxdEQRtOcS90psDTRKBYNaKlm5gQYK4nq8IoodSh84bQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Y7Uou/PI; arc=fail smtp.client-ip=52.101.43.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bXIIZczwGtjuwXby8CE4Na+Ev2nu5/3/gW5roW1+Yk+Mz7VsTaOSope5XjknptlhZtinrMC2JdhxCSMP6YeQaVpPGdrO5PQ/RJZQMvvvIqLVjbjRNldJvCNkwLiNF8PXO6/ngmSACqtkvfhrmZdHCvG9cL0hm/nf9qvq8xxwgvUiRd6lY5p9ZdXGXDKJ/Zc9Md5hqr+cJlD+bFBrGin9wM/OKLDZpkIK58uktnnQz5HjQ3m/53R7J193AYeUKI6Lh/IkpaBZWu9q1bA2syDNDvMFsnwUsKaRg9gT6W1+8dh/qkBpq+0JEwvE6GxAhnpmIwdo0GeHglaYeY8ZCEhzFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WRwBQKKn5SjHs1joavEtpfT/rJQz1p8b5R/VN2MXBHY=;
 b=QxJdE9Yq3W1nUANsPHyr7LvZrpWZ08MRdvLwOoDC84iLwpuW9iqJny++MMobr9QDyrsQ9VblXUzHS6Wq3jjNcIsw5105qwuytjRI1p9uSV3HEWyfkA6VRCELdstYKQtRZcyYc+rloLcavqZqOh+ki6nPfO4e9qkY+4+QK31EWiyUWo6sFIfT9HTTIVm3NyKqKt8Ze1zcvCOud4xn+FsvGo6swA8lcxz3XfkC+zIVynx/tJnPj2LMBZnZ2s1Ixhzg3Mrx3FPNdQ60FxqS8TI4caUaT8AlndSLOeVfDXHN6dhYFssIgZZQk9z9JrV+EO3WN9gYmf2ciFAwqVVRDzlYbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRwBQKKn5SjHs1joavEtpfT/rJQz1p8b5R/VN2MXBHY=;
 b=Y7Uou/PIZJXt0WPAoMOSUYAbSGYbuVjd+PLznvAQw3Y6u6HsD8Qfx9YeOAw50KaAjkV/s7S/L0uC9dBnrdv2vKphPM0cSqoF03o6XHP520V1yQ4hxPlbmhnaJrXi6EHAVH3uias4Tf5KSN+rB6Sm7kUJ9pQTpacOxP+RSBxLxwQsMS/wp6eJunyjf2wohzkrxUgMyfHEQclyivd9cfFXj4281Tpg0iipjy4wUqN+LMGCUQp2kk4z2b7qnm4zhfrkebncq3vn+Ye4ZwjklSNcClwuNUmi1fpPMxDSQxket7+QGa6btLiZWUy0bG41Da0xFyi/cJEC+QUqd2AepmdJPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by PH7PR12MB6860.namprd12.prod.outlook.com (2603:10b6:510:1b6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 15:28:57 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 15:28:57 +0000
Message-ID: <84f7f5d4-bb6a-4e2a-9579-0d957b692de2@nvidia.com>
Date: Fri, 24 Oct 2025 16:28:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/4] i2c: tegra: Add HS mode support
To: Kartik Rajput <kkartik@nvidia.com>, akhilrajeev@nvidia.com,
 andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, thierry.reding@gmail.com, ldewangan@nvidia.com,
 digetx@gmail.com, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251001064759.664630-1-kkartik@nvidia.com>
 <20251001064759.664630-3-kkartik@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251001064759.664630-3-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0056.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::20) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|PH7PR12MB6860:EE_
X-MS-Office365-Filtering-Correlation-Id: 2025cb10-ff99-4413-4506-08de13120c39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MmEwQTlMSmVjZHd5eVoveEdMY1ZkbzJ0dTdnclJVQkR1a0RtQ3RGdi9ub1VD?=
 =?utf-8?B?dDU2aXRadCtETWZ1QlJLSjBzKyt6Mm1pbTR6WU0yRUxNeW5YR1M5N0dvRml0?=
 =?utf-8?B?M2dGcVYrQVJzOUZ6OFdHNlI0Vk92R0pYSDlEc2R6MVJBdi83NFcxbHJRbVdp?=
 =?utf-8?B?ckJjUGV2bGFyaVlCalVlK3JmYktOUjBwZTZod0hwNFZsa1Q1clRScFhHYzQx?=
 =?utf-8?B?OElGRUViT1VNNERnc01GcXFrK01yQUUzOVNIWWpEQS82SWVyWDlhc1RVUWVL?=
 =?utf-8?B?QVZVMkpLaXJvWHZTUTFjNHJtd0FIaWZycXJFWjZzWlJKejNuRlQ1b2V6UkEw?=
 =?utf-8?B?UjRNZ1ZqY2N6bzNHUDU5cm5lNjhBWVU5dnUvZTJiODluMGk1Vi9pN2VTeDhO?=
 =?utf-8?B?ZmRTTzM2UktISFZDWmpBQW5ScHNjNVlkTUg2RjcyM25BNzVibUFCWUh3aTM4?=
 =?utf-8?B?aU5zYVpNZnFEVDVYaWtRalRJUDU4KzdpWC9IY2wzVWZLNE9ITFpPZkJtT0dU?=
 =?utf-8?B?L2ZNTWJjeVJsU2g2aEhHTE14MHExRHFqTlpJYVJsRXI1SVkrNHdhbzV6NVQr?=
 =?utf-8?B?Nm9YWG5jNE1XZXRsc2NXQTFXMitpazFEKzErVE1yMnF1TVh6MTlnV3FYOWVO?=
 =?utf-8?B?NllGWnpVMEpleTZIQ0VnNEVENUpVa21CYjhQSGlHOFJncEk2ZmtPanY5UE1F?=
 =?utf-8?B?TWQycDNxS0k1WjBZT3ZLSkM4WE1aL2Q2VzRSZHdnWFRzVElWTWZLUXF2d2JU?=
 =?utf-8?B?WjRob0k4T1ZnZjBUK2FYYmpSa2kxQmJYQVJkcDVaY05VUGs0SkRmNFJqTUZQ?=
 =?utf-8?B?dm1BWHczd2drbnZma01tYm1NVHRpbjgwSU5SdzhoK1ZoRHRkMGlVcEZpL2hD?=
 =?utf-8?B?YWxLbXoyNXNRVjhFMWJZdzZHa3RYNVUyMy92WXY4ZHRCbVN6cFlEYlJBOTJ6?=
 =?utf-8?B?WE1yTndjYU4vSlZ3MURwdVFMOUpPcHNjQVA2bkc0Nm1RU3loTXNEZkVmcHg1?=
 =?utf-8?B?L29rSW94ai9PRFI1L3hsUGhkbFJaUHlwY0pjcHNNL1VJVU5xQWFBMko3b2ts?=
 =?utf-8?B?ZGVhbXhrQ1ZJQUY4ZHRqL0ZQMlZCNitEYlViMElSLzZSTU4yNXg1ZTR4MFdl?=
 =?utf-8?B?Uk5HVFNLdkcwMmh0cEg5VWx3NjE0TVhETVdtZkI1VFVrK2srdkFRc05XSUlI?=
 =?utf-8?B?bW5GUDhOMUE0QWNKT1hvQm14ZGhzR3A1UEVZMkhVbEJjSmJlMnE5OXk4eWtK?=
 =?utf-8?B?eUN2WG1PZS94YXJ2NFB1Y2I1aXZvVUFrTnB2ZmxLaG5xZ0IyQkozN2hIcnox?=
 =?utf-8?B?WWNHaGxiVURxZ2xpK2MrTFNJU1hjQVhib2NqNktSeE1ud1FoSzh4L2htRWdB?=
 =?utf-8?B?NFFMYzg3US9PUU4xK1pyZW9Obm1tRlExOXZzeHpJUUF2SWpHT2JGMFNibzR5?=
 =?utf-8?B?eTU1M1hPSWliT0o2Q1l4RG1Qd2xSTzdzd3NHL2N5U3dCeHhkOHUrYm1INU9C?=
 =?utf-8?B?ZjVpRnMvdjM0eUp3Y25yd2pETko3K3IrL2dVUGVWR0VRemZobURKVkVBdXlq?=
 =?utf-8?B?WXQ0bDdVYitzRDBuMnhucWh0ZmNKcVY5WElTaE1IaGkreDhHYkFmdTJ3eUNt?=
 =?utf-8?B?UUJ6aGViN1A1eEgzTDUwMVE2TE5hQXBWWXN6cDE2SEpQd0J0dmFxWGhCMVNZ?=
 =?utf-8?B?c0IyVjBLQXRNb1RMRS9WZnFQOHFIcXNxVnJPWStpS1ZnZ1JaR25ZbXRTQXdy?=
 =?utf-8?B?QlB6KzdCbnlCb2pKUEhnWThOMFFmZlQ1Q1ZQZllBZVR4blRSUnBtZmZDNHpp?=
 =?utf-8?B?SXc4cE1PMHRCNkNzUUhjNEZwelNVUFg0ZHUzSzllU2FUSkhWWjAzNGlHd2lF?=
 =?utf-8?B?M3QreU83ZGVPWHBQcnlwOWFYN2IyVElLcnpPdWJyaHFLWnVESzVGK08rZXJC?=
 =?utf-8?B?SnJTdHlrYjBkWWlNTlhFRmZTU2h6K29HSndnQ25vSWs4dHNwWXJRZFNCcXdJ?=
 =?utf-8?Q?x06ZJhfrLv1nzNNo2Vx2oDFBOz4k60=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3YxdWZnRHcxQ3NSaGc5NWZXMlphaGwycUp3NHhBVDErdjhxZ2VDb2RIaGRl?=
 =?utf-8?B?RTR4UDJHY3U1cnFsYmt5T1loeForTDljVWNPYng2WGdpSXpIRmVzdTNSVXJY?=
 =?utf-8?B?bVdpdGZIcGlTcjdXODdKVHYzTWgvby9XdDNrcVpmRnlUdVlGT1dXUHNsNEty?=
 =?utf-8?B?V09JbFBoNm5DaU1qRStpMmFQbVh1V3RVSHVQck55K29ZdUxOZVVZRmx4NThB?=
 =?utf-8?B?S05RWHk4MTlGTHN0aUE0RWQ3Vm5iV3pRVlpxZCtUUVB2b1FDUEFORk1McGh4?=
 =?utf-8?B?Q2hFSGVkUkhHaVN4OU0zcGEyOHpwVElNYUJDakVvZnB4cEk0NnNLWlEyZVR2?=
 =?utf-8?B?QmJMQ2x2ZDVLVVpXdG94bW1YWkIxOTR0TnVZV3RXanI3NEx5dzlnSWZMVTdG?=
 =?utf-8?B?Tm1Jbkd2cWhBYzByVVpCUUhvcHZzMjJoZVlFalVnZ3IxUk9uRUNPajFmNHpN?=
 =?utf-8?B?emo4M1lPcUQ0aGZ2cmQ4MjF2eHkvMXNJZVVxalJlK1gxTXVFVVFRRFBvSXJL?=
 =?utf-8?B?WEFxTjJJa1Q0WG43ZFp6bEprMDExUlYyVXM0dW5YVzV1ZnZUQTk2RFRpcXRj?=
 =?utf-8?B?VjdiQXZtSlN5cDVZY2c3SVFocXN2L1ZmN1hkK1h1ci90V3V1MkR6K0FsWVBH?=
 =?utf-8?B?VG9QbFRWa3RFeDZlK0I2c3pFMFNCNTJOQ1IxTDd4UWhZNSt3eThLQjk0Z0Z3?=
 =?utf-8?B?U3I3dU84TXFSNXFNSHdUdVA1Zk5mNUhlYU9EMEdnbGMyZDZrT1h1Unp1cWhq?=
 =?utf-8?B?djN3UEY3RTlzc05PeGVOT2hscXpacGJMSzJRL3JEZnFLRkp4eXBjMFFMeWlz?=
 =?utf-8?B?Zm1BaUNaVGl4Qk5wa2JUVXFGWTFBeStoUGovaGJZdEpoa3QyV2V5ckh1T3RV?=
 =?utf-8?B?aTJnd2tFNFVEMDRMVG1QSkZ4SHp0ZjV3OTRUVmlnQzdBR1N3dWtkNHBGb01T?=
 =?utf-8?B?SVZ1MVI4NzcrTTJlYVJ3UmVNQXNnVGZCSCtkU2tONUhPYmoySlNCZmJ6TzQ3?=
 =?utf-8?B?Ym9aVjUzWGhIZEdVbVkyMjQ2TndPTzFjeHFkV0lsbGZrZzdhSWVrS1JNRXBZ?=
 =?utf-8?B?VWdUNUpxUjdReEx5WGNka0tkeVQwalRjQkJEMUs3YzhxK3U5SmVmR04vRGJn?=
 =?utf-8?B?TFZsb29pVDh6TWw0eUZlZUtaMWRVcWpYbWxIUk9SZ3pYM2MwZTN0alA5ella?=
 =?utf-8?B?NVM2QWtSdWRyT0xPWGpjNXVRMlQxNkFxMXRNWGkxQzhqK1BCbTUrNmRrQ1dw?=
 =?utf-8?B?b21PVE81dVF5TEh5cUhmVmVyaWRVUHpnemZtenBKY1pleGtod3RBNWxONVJY?=
 =?utf-8?B?cUplMGU5ekgwOVdrOXJTbWV5Z0FyL0ZGQkdwTlp2NXlrRzZVZGxnVHR1U0dO?=
 =?utf-8?B?R1FCa3d4MzhKT0tJYWo3dnpMeHBzSHQ1bUo0QnVxaFN6ZWFJbTMvUzBnN25U?=
 =?utf-8?B?TEdrUUhjS3UxanYxOXZrd0J1TUo2enJrdTlTZmRYYjRKOU95UGhEc1dZMlZx?=
 =?utf-8?B?NUQxME5GelVCSWYzdHA4ZUpqMHl2dnhpU052R3JPa2lqcHQvUXRzV21nbFJl?=
 =?utf-8?B?Znk2YS9UZmtHVEFmVWtUbDBIQTVOSzVXZmc5YmVINzdkaW9ha0t5b2F1SVB3?=
 =?utf-8?B?dFh4UWEyZHN4T3ZTUkFpRFh4UWVRc1pLQkNkeUhVc0JYOVhKdzJ5eWZjWndC?=
 =?utf-8?B?RmRVbkRydm9KR0NZcVJRMWVSNFNyY0lZb3c5M0dac3Z1aVhMamx0NklZKytC?=
 =?utf-8?B?d0FzcXVoRWRxN3NhSmJReDZ2MFRhNmlzNmxFYzZNK2RWbHR4T0VjREVoakRU?=
 =?utf-8?B?b3p4WkxSL21MbHZVejVnMTEwV3FwRGVXU09qWEVvbjM4V2w1Um13UElDYWlj?=
 =?utf-8?B?eXVRazU1anJib3BFb0NkYkN4WWxVdjhrQzMxOUxZYnZjcUdnaGVNYzZ0N1NH?=
 =?utf-8?B?bjV1Sit5a3p4M2hVamhON0RrSnUzUGxOeHNvOUpESHpTOGNreDZ6K1l0Rnpy?=
 =?utf-8?B?NHhUME5lT2xZMFZqVG9ENFBibW9NSWhPMkFkd0RhZGtLZnFEMVkvcDZuTSt1?=
 =?utf-8?B?bWlNLzRSM2lUblFxanZKelJwN0RacVJ4RTFySVlpY1doVkg3WGIyWmc0UHYv?=
 =?utf-8?B?bS9LbHJUZWo0U1ZrbWJvcXFhNXNmaUJ4SFQxWkhiWW1GU05STnFOYzVVNTlM?=
 =?utf-8?B?aittM2VnUk1LWVVWK21PREErWVNlMnQ1aTRUd0dVSjNuRW5JQ1U4MnVsNTFZ?=
 =?utf-8?B?VDZxSElqbTNRRzF1SXl3L0hvdEJnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2025cb10-ff99-4413-4506-08de13120c39
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 15:28:57.1649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6cr238Se8u51s3uHk9AfJyZz/Em/hfM0Mlm/PBqfqRiDhsuNbeJa4/IRrabv9xZLn1iRSZ6vzGtWfLL1J470vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6860



On 01/10/2025 07:47, Kartik Rajput wrote:
> From: Akhil R <akhilrajeev@nvidia.com>
> 
> Add support for HS (High Speed) mode transfers, which is supported by
> Tegra194 onwards. Also adjust the bus frequency such that it uses the
> fast plus mode when HS mode is not supported.
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
> v5 -> v9:
> 	* In the switch block, handle the case when hs mode is not
> 	  supported. Also update it to use Fast mode for master code
> 	  byte as per the I2C spec for HS mode.
> v3 -> v5:
>          * Set has_hs_mode_support to false for unsupported SoCs.
> v2 -> v3:
>          * Document tlow_hs_mode and thigh_hs_mode.
> v1 -> v2:
>          * Document has_hs_mode_support.
>          * Add a check to set the frequency to fastmode+ if the device
>            does not support HS mode but the requested frequency is more
>            than fastmode+.
> ---
>   drivers/i2c/busses/i2c-tegra.c | 49 +++++++++++++++++++++++++++++++---
>   1 file changed, 46 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index aa7c0d8c0941..cc75340f6cb5 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -91,6 +91,7 @@
>   #define I2C_HEADER_IE_ENABLE			BIT(17)
>   #define I2C_HEADER_REPEAT_START			BIT(16)
>   #define I2C_HEADER_CONTINUE_XFER		BIT(15)
> +#define I2C_HEADER_HS_MODE			BIT(22)
>   #define I2C_HEADER_SLAVE_ADDR_SHIFT		1
>   
>   #define I2C_BUS_CLEAR_CNFG			0x084
> @@ -198,6 +199,8 @@ enum msg_end_type {
>    * @thigh_std_mode: High period of the clock in standard mode.
>    * @tlow_fast_fastplus_mode: Low period of the clock in fast/fast-plus modes.
>    * @thigh_fast_fastplus_mode: High period of the clock in fast/fast-plus modes.
> + * @tlow_hs_mode: Low period of the clock in HS mode.
> + * @thigh_hs_mode: High period of the clock in HS mode.
>    * @setup_hold_time_std_mode: Setup and hold time for start and stop conditions
>    *		in standard mode.
>    * @setup_hold_time_fast_fast_plus_mode: Setup and hold time for start and stop
> @@ -206,6 +209,7 @@ enum msg_end_type {
>    *		in HS mode.
>    * @has_interface_timing_reg: Has interface timing register to program the tuned
>    *		timing settings.
> + * @has_hs_mode_support: Has support for high speed (HS) mode transfers.
>    */
>   struct tegra_i2c_hw_feature {
>   	bool has_continue_xfer_support;
> @@ -226,10 +230,13 @@ struct tegra_i2c_hw_feature {
>   	u32 thigh_std_mode;
>   	u32 tlow_fast_fastplus_mode;
>   	u32 thigh_fast_fastplus_mode;
> +	u32 tlow_hs_mode;
> +	u32 thigh_hs_mode;
>   	u32 setup_hold_time_std_mode;
>   	u32 setup_hold_time_fast_fast_plus_mode;
>   	u32 setup_hold_time_hs_mode;
>   	bool has_interface_timing_reg;
> +	bool has_hs_mode_support;
>   };
>   
>   /**
> @@ -678,16 +685,28 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>   		tegra_i2c_vi_init(i2c_dev);
>   
>   	switch (t->bus_freq_hz) {
> -	case I2C_MAX_STANDARD_MODE_FREQ + 1 ... I2C_MAX_FAST_MODE_PLUS_FREQ:
>   	default:
> +		if (!i2c_dev->hw->has_hs_mode_support)
> +			t->bus_freq_hz = I2C_MAX_FAST_MODE_PLUS_FREQ;
> +		fallthrough;
> +

This looks odd. I guess this is carry over from the previous code, but 
now it looks very odd to someone reviewing the code after this change 
has been made. We need to make the code here more logical so that the 
reader stands a chance of understanding the new logic.

> +	case I2C_MAX_STANDARD_MODE_FREQ + 1 ... I2C_MAX_FAST_MODE_PLUS_FREQ:
>   		tlow = i2c_dev->hw->tlow_fast_fastplus_mode;
>   		thigh = i2c_dev->hw->thigh_fast_fastplus_mode;
>   		tsu_thd = i2c_dev->hw->setup_hold_time_fast_fast_plus_mode;
>   
> -		if (t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ)
> +		/*
> +		 * When HS mode is supported, the non-hs timing registers will be used for the
> +		 * master code byte for transition to HS mode. As per the spec, the 8 bit master
> +		 * code should be sent at max 400kHz. Therefore, limit the bus speed to fast mode.
> +		 * Whereas when HS mode is not supported, allow the highest speed mode capable.
> +		 */
> +		if (t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ && !i2c_dev->hw->has_hs_mode_support) {
>   			non_hs_mode = i2c_dev->hw->clk_divisor_fast_plus_mode;
> -		else
> +			t->bus_freq_hz = I2C_MAX_FAST_MODE_PLUS_FREQ;
> +		} else {
>   			non_hs_mode = i2c_dev->hw->clk_divisor_fast_mode;
> +		}
>   		break;
>   
>   	case 0 ... I2C_MAX_STANDARD_MODE_FREQ:
> @@ -717,6 +736,18 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>   	if (i2c_dev->hw->has_interface_timing_reg && tsu_thd)
>   		i2c_writel(i2c_dev, tsu_thd, I2C_INTERFACE_TIMING_1);
>   
> +	/* Write HS mode registers. These will get used only for HS mode*/
> +	if (i2c_dev->hw->has_hs_mode_support) {
> +		tlow = i2c_dev->hw->tlow_hs_mode;
> +		thigh = i2c_dev->hw->thigh_hs_mode;
> +		tsu_thd = i2c_dev->hw->setup_hold_time_hs_mode;
> +
> +		val = FIELD_PREP(I2C_HS_INTERFACE_TIMING_THIGH, thigh) |
> +			FIELD_PREP(I2C_HS_INTERFACE_TIMING_TLOW, tlow);
> +		i2c_writel(i2c_dev, val, I2C_HS_INTERFACE_TIMING_0);
> +		i2c_writel(i2c_dev, tsu_thd, I2C_HS_INTERFACE_TIMING_1);
> +	}
> +

I still think all of the above needs a bit of work.

Jon

-- 
nvpublic



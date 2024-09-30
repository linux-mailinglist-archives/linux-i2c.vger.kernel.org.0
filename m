Return-Path: <linux-i2c+bounces-7087-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F9B9899C1
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2024 06:33:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9494B21ED2
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2024 04:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 765504D9FE;
	Mon, 30 Sep 2024 04:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DSpNhQMw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2057.outbound.protection.outlook.com [40.107.243.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C2633080;
	Mon, 30 Sep 2024 04:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727670821; cv=fail; b=Hkq66aNsWTa6zlf+jJqhRTYsw4SUlFsvGgFsp0ghTEz/oqp0eZ1L+HK9J+GS3F8rfMzZb1lUspDkxo4+jzLfhuxfg2zjMX7pSaXWltm3r9SWO6Slzui/ScTFDjr/jtVZpuFzJr42XJXrVIl3IRXeAeOwfoY2wkN9UMRYqfaK3gI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727670821; c=relaxed/simple;
	bh=uzDSSl1/4WGTj/YHca5ArURHuTNT7O0abfNGoEW0YNA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KhL6/1mMMMe61PY1p2/QFeW0aboi70TRJLpBHWgLaiPzQ3d7QnZk72HPDZ7A8HNoH8jM4Taty06V1SX72r0lnxYOc3QnB/IB0n5TKHQW3DIUnpPiBxbSxwZ1Gh3YW9TDyvG9g/QHm+hJCO1wyEZ/UK6A5ZC8gZoInqNDZ8i5stY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DSpNhQMw; arc=fail smtp.client-ip=40.107.243.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H0m10djv1oCCyHkyyQ5VBWXVRaOvODdx3RjlWpPLOvHmz+MSEaLod611/ZKGEO9OxpH6Fj57lJWCiYj8hrTdRV7r75jUKlnACTRKffMRWU7+M7HWhYjXyKOi8oY76/UGmYh6FICGSU3javo2wjYin7dQPXVY8cUgq7myBsYJezNN/cy9R7O3Wh9HNt6X/NYpYC5ieuvEPdvgoXtYDtjDwgHK04EhlkkjNRx7WzMMql3c1OOvJe1Ne5FWYRc7JQ8p71YVrx5PKd3QJIw+0ZzGJ91HPSbrZA1BCv0OY32VKMPgdB4rP/rwz7xaQPQx1wVMZA+Jf/UIYsjIa6Qp9NU/Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UklNt+68lvJIQjvzPs1MJvl87Z8SK8vGKcWM9b9KIf8=;
 b=TAV1WB8zcqXWgJX51tekWm1PKbE2JRs9tOQCX9jY7oklGxjtbF3YUJwN/QITvLcViyi+cavbBeYo70iKPbDpEhSO7cFts5tnTFT2UTLWTCQOVEE2d9v65tY9CRkWM4WcQMxGJAG0jYbOUWSDlQpiTcNZ8oRN6b0OR70QBIeI2bjChv3VcPDduqboeGutHI4xvkeyFRf6poebMW0kjIUciNQQbVTu6WoYB+TG/hqepnhVGrAH2hCWXBrqh/pPUQQiu1jgfzWoIMx4XFcLhqtQAaxJ5WAfrRVtPR6l6MmtWL5L08+wXsHEy8ePRPlRarxz5QIqLlhWXPlb7hIVOuBw1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UklNt+68lvJIQjvzPs1MJvl87Z8SK8vGKcWM9b9KIf8=;
 b=DSpNhQMw7tEOFy3TEIRIgjeWheRSCCeLZD6CucTU0SjezHb/KZRWg3xM/udlsevuW2vjIICuGfW9uEkOHubJOCbcTfrBLrz2fZzuEcEftD2464Tcd99IHGPfBuk/JjQ24j8pXAG4xlcYG1GbRlDYJ4kDM7X4JoPww6XMfa8vVfY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SJ1PR12MB6148.namprd12.prod.outlook.com (2603:10b6:a03:459::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 04:33:31 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%3]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 04:33:31 +0000
Message-ID: <a69cd7b2-b74b-4ea2-9235-8f0958777c27@amd.com>
Date: Mon, 30 Sep 2024 10:03:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: amd-asf: Fix uninitialized variables issue in
 amd_asf_process_target
To: Qianqiang Liu <qianqiang.liu@163.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240926151348.71206-1-qianqiang.liu@163.com>
 <cc527d62-7d0b-42f8-b14c-6448d3665989@stanley.mountain>
 <Zva0dBAZWpd1e4as@iZbp1asjb3cy8ks0srf007Z>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <Zva0dBAZWpd1e4as@iZbp1asjb3cy8ks0srf007Z>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::16) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SJ1PR12MB6148:EE_
X-MS-Office365-Filtering-Correlation-Id: 141d4386-b80c-4b4d-5dd8-08dce1090967
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?blBvaU5LZk0xTTd5VnlSMzZNMTVqUWRwZTNGOUtsbTNVOWVDRnZQeDFIRW9m?=
 =?utf-8?B?Z2szdzZHbU5waUhvSktwWXEwdmdzem9FZkFkODFTTXpXMng2ZTRGU0o5aGp0?=
 =?utf-8?B?Zk9mc1R5SmFlWUNPM3A4dmFRN2FGUlZDaWkwUVZCUytPYXJ5MDFEbmdPOWFj?=
 =?utf-8?B?WFY0YXdYRmxDN09ReGo0MlBpTGZJL3kzUjBrVWRNSmJtUWVhOUtVYjBKYm5H?=
 =?utf-8?B?cWNzbXBSV1JhMUtLdzM4WEJjYUJpQlh1b0ZEdnd4VlNwTXRFSHprM0Y2OFZ2?=
 =?utf-8?B?UzZJc084dEtNaW9FeUloK3JZKzdvTGMvcEhDclZwQmV0djBQS2NSQy8zek5N?=
 =?utf-8?B?bEg4cHAvdGJQVE9iY1QrWHk2MUQrTC9KeXRTaXV0Sk1yVllmd2N1TGttK0dp?=
 =?utf-8?B?QWswS3gycFdOTkJ1Q0FaNmVMbGxOeEx3elFIK0M5djMyL1ZINlVCUmJCazE4?=
 =?utf-8?B?ZHhrRWtyVzV2SHdieS85cks0R2pmdzR0QUR6TFZiUitqeEpqbmFFQmRHaWtO?=
 =?utf-8?B?M1pWbzFyRWVMbS96QkoyL3NxcTJrZEFJNVdmOWd3b2NXclJDYlRxSllkSlFS?=
 =?utf-8?B?ZG5MQW4yQk1keXJ6QmZ2WDhpZjdDWUg5SlJxYTVYd3FTVjc4QldXdVpiR1VX?=
 =?utf-8?B?NVNaR21PM21XdWNVQVQ5d2xNaDFHejN3ZnZ3a21yYVdhczYrZ1cxWGNIdnhH?=
 =?utf-8?B?ZEFlWTBueUxZaDZIeUljTUk2aC9PcXlHK0MvYW4xVk8rYW9qT29pdEgrZFJQ?=
 =?utf-8?B?YjErU2VkeWR4ZVlJaGhTR1hMZ0d2SjYreStnY05EV3Vnd21JTEdTSkh2bHRF?=
 =?utf-8?B?MEtvSkUwNHZ4NmVOSFZmdkxYS0FQb2w2a3dYdjloMHRHUm5lanlWeGxLUHlF?=
 =?utf-8?B?ZWNFR3hicHY2N3VJWE1RQVNISkNvVTY1eGRZRkNOenIwdFBKVGFWRUVDRlY4?=
 =?utf-8?B?Ti9EYUhwelVxc1BEM2o3ZVh0VFNsTlBld2VYVHBTanV0RG81Vitsa05WZUda?=
 =?utf-8?B?TEZiVk1KNGo4WmhpM3VmSkVYUlA2MUozTXhLeEp5TFhaV3ZXVGplVXNXd2kx?=
 =?utf-8?B?ditMZW5OMDFYZnhWRThQeTVJSndTWFJ5Y3RIcWhDUlZUU3ZkSHJhNjIzanEz?=
 =?utf-8?B?TllPVHhySlBoczVzOS81Y2Z0T3g1K1lHNVhpamI5alorby82QU5YT3RZSUR2?=
 =?utf-8?B?ZmpMQXZBQVVVNCsrSmRGU2ZxWTZvSlNtVXcySmFzUWdOM1lTNk5Pem9zSFBu?=
 =?utf-8?B?WGVjT3dFcmROUEpOci9lOFhmaEkzWWJ3VzNiK2w4YTY0QlcrWlFBNGgzRWdK?=
 =?utf-8?B?bGhGQmlFTmRlcW4xQlI4L3c2aDRWelk0bmUza0I2M0VQcUpVclZuWWNtTUxT?=
 =?utf-8?B?ck9rT3c4QXNUR2xUWGEwYXFKNnBtTWhqMW1Fa0J0SWxkRXZhOS9BUU9sanZI?=
 =?utf-8?B?Q3BnMHI5dHlWam9kamVReUtzbTdMQzNleE5GT0hxcVFEVDBqaFFrc1dubjQz?=
 =?utf-8?B?RkpnL1h5NFF2WktROUN0dnQvTXEzb0ZQTkdQdWRjRDJOZCs5YlloZHZiUWZZ?=
 =?utf-8?B?aXgyLy9Jc2Z2eUZhN3p3dWJBTUtUQkh1RFVHVERHVEVHYndsWTBTZEFpVDR2?=
 =?utf-8?B?NWVOZ1pDb1k2Y1ozV0RGVDFwSkE4VHlhaHcxd2RmWGxKcXZkTU1EaG5pZnRo?=
 =?utf-8?B?N2ZFcEY5WjJYcVZmYWJxSmppdkhKUDNub2dNbXU2U0laTVo3aDNWc2x3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDB1NEtndDN3QnZnbm5kSEZLMW9Ka1FuVTRFK3B3a2RTWjd6T29WR080cm1R?=
 =?utf-8?B?Z2xEVFNyeGJ2aWJJb3ErbEFBSm1hM0RkaUZCbzBNRml4S0ZkS1Bpd0gvTVZW?=
 =?utf-8?B?a0VWL2VzekxzY0tZc2JQcUppSXZxWEdzWlFNUGpBQy9xMjJYK1pra1VhcndL?=
 =?utf-8?B?VEFreDkzTkdyR09TZFJvRGJ3NDFOeTVJMFZEbWh6YlI1SW1POHdPc3lBbFE5?=
 =?utf-8?B?YUJqQWZveS9iU2Nlam9KVVh1QzRMbGV5K3NaRjVmTGFqNnlvNEFwSGIvMlQx?=
 =?utf-8?B?Q0FaZWxXOWl6SjZlRGduVnFTclRURzh1YklySlY2eG1sb1U0dE9uWGc2b2JQ?=
 =?utf-8?B?ZFJBWUlERXFWSWRzSDMvODcyQktVNzIrZjRKU3VsWkVhNmVuWTc1ajBOUmJS?=
 =?utf-8?B?cC94bC9XYWVwbGVYRVpVZzEzRHc0K3VldW56QXVZa2ErelhUakdKYVRxcGlQ?=
 =?utf-8?B?WG9RYllqcXdrU250U3lhOHVOQUVxL2lDM093SWo1b0hLc1BHOXJtMG50OXVk?=
 =?utf-8?B?Z0xWMmZpZk5PelltWDZKRDBvc0toQTJaZzZpZXZGcXVOQWVwQzZSczhSVWF4?=
 =?utf-8?B?VDRXVkpIMm9KMnlpZENhaTRZMGJJNThidlZrbUozaytaQXBZVHlLZ3o3b3Ft?=
 =?utf-8?B?ZUtpSHJkVkZ3WkQzRTkxK1YzenV4WUhBYWs5YXBVLy9mVmNxOVRjbmd3SFZz?=
 =?utf-8?B?MnczUzNBa25Ra3NIY2JrVDlmdHowRzU0emZjSlliS2RGdlp1YXdETVRwTHAr?=
 =?utf-8?B?QUFoVFNDTmNST0hIVWFHSWFJa25SU3V5MUxhS1IxblBkbmZYYUJXUHlMdXJO?=
 =?utf-8?B?djl3VVduU0dZMk8veE0zNTRYS1dqMlQvU3hsckVsbmc1UzVyOVhSWER4ZnJu?=
 =?utf-8?B?ak1lRmExMHNOaGZNak1lQkZaSmhxK1ExOWY5dkRkQ1VibktJZ1prMTJUVGpY?=
 =?utf-8?B?MDl4aDQyWGJuaGsrQ3dPMFhPOEl0Uis3aWE3QWpkTTg0Y2doNE03eEVwcFNB?=
 =?utf-8?B?MkpzNDdFMXVDS3VtSlZXT0JwMnUzRFlNeTdtRXd3cWNvVzh1eHVmOWdUMStl?=
 =?utf-8?B?TnlIRCthNE1ucURERVVoVzNyMzBrNVMydnhteDNxVm54cDhhNlVzOFVlSDZk?=
 =?utf-8?B?dUR1dlJ2MDFNZjY2dldoaE9LMGlUSDc3c095Vk8wYVZMd0FFWUozRVF4WWRW?=
 =?utf-8?B?Qkwzczd1ZHZHMThxQU9oQ1RpdHFJSW1GWHlBQ1VGU0dCMUQ5TnNCdVVrekkx?=
 =?utf-8?B?VTdHWlNiY3l6cTlCWiswa0p4SmxWQlV5cHM2VDIxeXJOdXJicFZTaUl2c2ZG?=
 =?utf-8?B?YmRxMzFEU1k2anZhejhFS214blp2a0ZTenJtYmJjeVA0cmFQMkpncnZTTlpx?=
 =?utf-8?B?cGNOUFNUSi9OdzNlUkdKa2NoMlVYeDhhdnFZRnQvU0U2UkgyUEMxK1k0eXIw?=
 =?utf-8?B?Z1FxdThrS1BHUWI1REJIbUdiZzNUeVJQR1QxUG5CSmZBSE5ZN2lrM1VKaFVF?=
 =?utf-8?B?aEtuQkE5OWJncktGNUcxSFhjMUs0T0lKSUYzc3FiSjg4TlZCeld5VXVnazZD?=
 =?utf-8?B?aFBhVCtjZ1JZcXZoeU5FeVVLWHlkemVGK282WnBTdVZTSWxYZENZeXd0ZXRR?=
 =?utf-8?B?TVZGOVhrTVFqRTJGK2dEME5yS0dCWDJMRUduN2NxeW82VUdQYnM4R1JaL0tr?=
 =?utf-8?B?Z2d0Z1lxVjI3My9uRDF0YzhBc1l4UE92d1FZYWZNQlQxSHNKaVFueUlLSlRu?=
 =?utf-8?B?dk11T0pxMUJpTUNjN1F1bTMwRGtwRUhvSEJjdEhsWjVQTEE1UmRvcjRFbXRz?=
 =?utf-8?B?MU9reWN4ZGNZQjljdlBqRzFEVGJISTdmTEVFTG5iZ3lMTE9VRWlRZ3JhODZo?=
 =?utf-8?B?alFBSkRhNmNUa3JyTzM0eFRtdWhaSDNSVzFSYUZzTUx0ZHladjlqU1AzQzd3?=
 =?utf-8?B?YSt0ZTNJUGRyWGVELzRxRUZLbGhpMldiOHRHRzNQdmZEWW5rNG9NaEVLUHJJ?=
 =?utf-8?B?cEErYjNFTXd1emJiMU9HczRQcFhqSitzbndpUUdSYnZ3cHZEeEJvQU9SeVdn?=
 =?utf-8?B?bjV6bzRTOXI3c0JJdzdpMjF0ZkpNcVo4ZERMS3I2WFlGNmNvaVowek05YlI1?=
 =?utf-8?Q?gGw5S51PeDX+X9pyBlMw9tN6S?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 141d4386-b80c-4b4d-5dd8-08dce1090967
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 04:33:31.1801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cXNf8/mkp2Oo2fnECdv0w94+caEvRjpBXaJF/al7la6y3BPeKlZXqH9gQwcOGEmOKYYIHjxizWPvov3nHoWKZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6148

Hi,

On 9/27/2024 19:04, Qianqiang Liu wrote:
> The len variable is not initialized, which may cause the for loop to
> behave unexpectedly.
> 
> Fixes: 20c3cc299218 ("i2c: amd-asf: Add routine to handle the ASF slave process")
> Signed-off-by: Qianqiang Liu <qianqiang.liu@163.com>

Thank you for the fix.

Acked-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thanks,
Shyam

> ---
>  drivers/i2c/busses/i2c-amd-asf-plat.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-amd-asf-plat.c b/drivers/i2c/busses/i2c-amd-asf-plat.c
> index 47e0c90341aed..ba47df5370c72 100644
> --- a/drivers/i2c/busses/i2c-amd-asf-plat.c
> +++ b/drivers/i2c/busses/i2c-amd-asf-plat.c
> @@ -61,7 +61,7 @@ static void amd_asf_process_target(struct work_struct *work)
>  	unsigned short piix4_smba = dev->port_addr->start;
>  	u8 data[ASF_BLOCK_MAX_BYTES];
>  	u8 bank, reg, cmd;
> -	u8 len, idx, val;
> +	u8 len = 0, idx, val;
>  
>  	/* Read target status register */
>  	reg = inb_p(ASFSLVSTA);


Return-Path: <linux-i2c+bounces-12680-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66494B454DA
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 12:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 148EA563E73
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 10:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6CA22D7391;
	Fri,  5 Sep 2025 10:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="l3n3tTYN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2083.outbound.protection.outlook.com [40.107.236.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC3E25C81B;
	Fri,  5 Sep 2025 10:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757068622; cv=fail; b=LXGc1zEDWNrzibgTRJdfLjgPjgqXWQFucLRq3uUPBF6jSeCBp7HFQHQF+NDuqsl/Bi+CI7tXq5HGVNRgA0rw3Rs2chILYTg3V/gIZVoH1BECW4LFARsy1G3l8qcDLPHgKLo16tZnq5Nlqn5FyDLVTLJ4s3lwzvdjsSrSTtGrass=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757068622; c=relaxed/simple;
	bh=QE5wRd6B1C9Dr3kaGDpcJgQANCm4WP2GXRM2/Ki/Er4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BVKnl4DSca6of3vCTXacUUqsRgPJJwfLde9ud0DLdWVt1JlwYvwwgsW89teMB4KAU4m2LymXZPgEPj9ePEu03bKTwHOh/ldVzmxXV0HPgb2mYMSpix1W2HLPpkyInq18nvtWYSum2h/ER1WY8WmTSYF7RITz1/8mJCaXt1fIUFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=l3n3tTYN; arc=fail smtp.client-ip=40.107.236.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P+VAt9IWbmlCeZOhvtZUNomzL53nXAZhJVSvBv5U1MhBMvJFbY1LacdGBn+ApF6i8HUHGMJfsVjLt14wScH00YM1N68jJwg0irzIxbql6VQFkMJzz3tCUJ1uGedFSBAv+C44tht6dpNUFVAv8lQock/doDWrYzmJDAhiF5JrmaGZphWkZALWpE7BEpbRPtQT8sGMnzsikKwV0FEQ4duAyCQOduLYNn0G92NpyaaDBTkAO9tPSrIwHa0FNqpd2mY2U6xfsyG3FqNd5cXhDYj3LbCCbW2cP6vRBqZFilG6FGCs5pvrlKYD7w4PCRiCKVnOtSnwyi6dpshuByePUaTCHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dLfeNNjuvCa+xCmgLvkx20GKBljAHkyIHBnF82I8Pqk=;
 b=Y6oFY4N9SPY9+BaTHJcjkbNG5m7ALR7f4vZ/v20d8VlZ0biewb4DEJZsL7Tw3h8brQduwdpw7H75CuZQyLm7m0qsBtbPB8jSVwz+QCx1T6LUZvt3wTt00jlJd8+1kkpLvoJnk9FEiAehceoA2YMBXRr6lAV5M4ogNSmgVPlqHPFMjklS02hcSa+o+ZgILJwWsgRRbUW+yfz4hG6ARX5goNv8o0GJZoSZD0aEzWSp/40F/QgL4UcFIo5fnuq6IvfObsNmuTRPgFz+MxZGucx8foGn0vCj4gtW+lVymKJq4rlih8h2vc9uilWWVusUwwdvfTzb4gehrDymFnmXo4XWDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dLfeNNjuvCa+xCmgLvkx20GKBljAHkyIHBnF82I8Pqk=;
 b=l3n3tTYNjTfC88ZgAjWLIYA4shgkDbYjcbA7mIMC0hVpgX2NHp4dWKoaV4VQWcseWNWDXKF8zyIV7A184voj4fl3oyKkTrtvoRAIjtUE7oazUADYUAnN5qzUXfD8Tusfnim0oe2WUkgr30YqArendr3lHG7dikH8RxcUqZK2Yxlb8clMCxf3gD2d6pwdTohmccAEY6cjjYwofHLU9vLK5QGJc75ShGIFPtUtGuorLLWML9ur2ixGt4sEuZ9pjOdHf/z2YerQ+pBrTtPW5ODHdwNM9wvRA/CXL+NtKaFbPVhb9odkv45lqJ3+8mHimJxxVKE4fdmpfNQOJk4ryysiHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DS7PR12MB5935.namprd12.prod.outlook.com (2603:10b6:8:7e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Fri, 5 Sep
 2025 10:36:57 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.9094.018; Fri, 5 Sep 2025
 10:36:56 +0000
Message-ID: <7e42044b-6e61-4f5e-a0d6-54c7e4e21a40@nvidia.com>
Date: Fri, 5 Sep 2025 11:36:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/3] dt-binding: Add register-settings binding
To: Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rajesh Gumasta <rgumasta@nvidia.com>, krzk+dt@kernel.org,
 robh@kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org,
 ulf.hansson@linaro.org, kyarlagadda@nvidia.com, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-mmc@vger.kernel.org, andersson@kernel.org, sjg@chromium.org, nm@ti.com
References: <20250725052225.23510-1-rgumasta@nvidia.com>
 <20250725052225.23510-2-rgumasta@nvidia.com>
 <1a6f4194-de77-4dca-b2e8-2b51a106d770@kernel.org>
 <dc4ed9fd-2da1-4d9b-b8f1-446ea0697385@nvidia.com>
 <a6268cd4-4a7e-498e-9787-bec959bb1475@kernel.org>
 <33wpprxurmuorivfp4crcyzjgkrnpb6t5oewhg6adw7uhyib32@7foqh5v6ujdv>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <33wpprxurmuorivfp4crcyzjgkrnpb6t5oewhg6adw7uhyib32@7foqh5v6ujdv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0043.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::12) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|DS7PR12MB5935:EE_
X-MS-Office365-Filtering-Correlation-Id: c66a1a14-2290-4612-a143-08ddec682317
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dHpYZm1xbnZBV0xDa2tCc0V3VjRZQmE0TE1iTzdvNkJ1Q25qejB3RkFkSWdy?=
 =?utf-8?B?OG84bTIveEU0RmVVVnpHMWJ3dUdDOTVMSVdueEMwVk14SGMxbUZSaHZ6eDEz?=
 =?utf-8?B?Z1kzbG1XTmFRWnVHd3RpSlE4d2dVaHQwQ2gzZlQ1QUtJN3BmOWU1OWxNaUw3?=
 =?utf-8?B?YzVMV1dCTFo3WVNMVlN1YzdLS1NPN3pJN21RRlRVVG1KRThJRW4wbzVsRlJm?=
 =?utf-8?B?YzNxTHN2dEpJNXB5RERiOS9MUXFxalZlUllXZTg1Q0xzTGVjTGE2RW1UeThh?=
 =?utf-8?B?T0c2L2lETVJPY3RETnhlYzFuSVlMeTh6UnVtbUQzbVcvWjBqL29XTlFiYVow?=
 =?utf-8?B?MzVmUEMzc25ZeVJhSVRsZ21MaWdLbnd5all0cWo4SW8yNlpjZEp1eUp0NXQ3?=
 =?utf-8?B?Wm5rWnlOVFpST08vWjNacnpIQnlwb0FBVldvaDZZazYzZG5GQXdDeks1b3Iv?=
 =?utf-8?B?OEFmanUyc3lxS2RJZVJSZkJsZDZHQmsvT04rMTFsQXAzWUNXbzlqYXpadnhj?=
 =?utf-8?B?dlp3RkVVUFdWd2c2Y0g2enNmZXdoY3pkMUpsQS8xUklaUVZidGh0UVFqWFJC?=
 =?utf-8?B?NHlReW1QeTJvNHpWVWdkbWVFQU5BLzdIczQ0bWVtMXZRZytvQ01IYndnYXdM?=
 =?utf-8?B?R1MyY01zVFhPeW5FYU1VSDNLYWNjUUNocGFTaWtHVWlqdWJBRG1RUkk0NnpT?=
 =?utf-8?B?YTVXd1d1VE5RVnhhdGVzTkhFTmh4aWg2TmZjZVpOUEtPRFgrbllJd3BEM3hh?=
 =?utf-8?B?dWVxaWQyc202NHFrY1JDSkY4Vys2RXpHMGlBSzB3OUtyZUJlZnArNStNdGVp?=
 =?utf-8?B?KzI5NkQ2a2s2d1dSVmFIN1FsQ0xGaGVTR1VWdkNnQ3h0cWJuUVBDOUt1djJy?=
 =?utf-8?B?MENNVUl1SUJLRGVqRVhlRTRsNDZDZUkxa2VPTVdzWjNkVDVXNzZJVGh2b0V4?=
 =?utf-8?B?YTdsUFpsMDhSanBneWRjT0FZMG15U2N1eElDWHF5TDVRdTB1UEJxS3ZjN1Uv?=
 =?utf-8?B?bzA0VHBzVWpyaGNFS0xyV1hnMnNNam5GazNmdjlGc051RXdIVkZPZVJTT0RO?=
 =?utf-8?B?eGUwVHc0MllsU0JlVldVWG9FbUFOVVZKTE5ZUHYzNTFEeGF2b0kweEU5RnNu?=
 =?utf-8?B?THJzOUpSMDZoUEdGTzhIYXRMaXFPejRic3I1RkNLWWUyYUdlaDZTSTl1S3dH?=
 =?utf-8?B?WEE2aDdyVHR1MkNxcCtsRmVRV3pMNFh6UkxUWG1oRkdxM1dtbTBHcnluZmxq?=
 =?utf-8?B?enllUEpuYWc0WVZtOUZoQU1tOCtSSlVPVDZ0aW01UXRZaks4ZXVENUxQdE1R?=
 =?utf-8?B?UG5CNmtkZWp1bEFGL2xXb1ltd1VyRVFETE9UZGFiWHZ3bFVocXppQmVZWjBJ?=
 =?utf-8?B?YlZxVDlxNmJSbSt5aHlCQ1JZVmc5S3VWaldRZ3RyTmtvRnFzazBZekJSN2NQ?=
 =?utf-8?B?bmQ2YkU5MHpUMjdqVkZOdUVsYlFBT3d3NkE4enNKMDZWbjNHZGI0cUFMQVlT?=
 =?utf-8?B?RXNuRUpkR1plS2Q0MUpNaDJDbVBvUlIrRVRSS0lqSzUxMTFiekJRbUhBTUdp?=
 =?utf-8?B?VmN0NHBzMFMxYVNaQUlKb2NXQkIxWDIyVWVIczRjSmNoT0VXRzlLN0RPVWFX?=
 =?utf-8?B?QXU2MEYvK2l2WFE5TE42ajduZC9IdWRBUmFHWjJGQTYrVFFKcDRWK1BUUnk5?=
 =?utf-8?B?a3I0dit4b0QySllUVmd4clF3STZqOFQyREtrenZ2bUFQZHFuUjZ5eGNjdENp?=
 =?utf-8?B?SGVQN2wxWHdPaVlOcEFOcExGUGFqaU40cjEzQVVNVk8rMEZ2NmhoYXZhNVI5?=
 =?utf-8?B?V2R2cXJCMkdwb1VJbDhEYmdrUGYyRHc4SG1aY0RNQzU2QWdQVVg2Tk5vQmFk?=
 =?utf-8?B?OE5wNkJhREdjU2lFOFFpNzBEWWVsYmZkaUdpL3NjUFU0ME9DYnVnR0lsbXlS?=
 =?utf-8?Q?x9mbKmSmIM4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2lldFpteHhBb0lKOTlRWWtpdi9DWXd3c1pHOVA4Q3dZdHB3NkdMWkNZV0lL?=
 =?utf-8?B?RGF2WDM1aGh1alFXSUtBRXFyR1J2RUxQdVlYb0EwditKbzJpbFUyMTlGNHFJ?=
 =?utf-8?B?ekNhL2hFWnZ0SEFMWFFhZ2p5dlNZMEVQUUkvM2VBQkpPTnAyVnp5b0U1b1A1?=
 =?utf-8?B?NS9zWGZkMnFDb1VFb0JOQldOTUpHVGxtY01yYkJFb05zQUUyNUEzRWNJSDdV?=
 =?utf-8?B?NHVrZW5wcWRORHpZRkI1RVpUWWowK2oxL2ZjRU1VNDR6empUNi9udnl0emZ2?=
 =?utf-8?B?RitJeTl1UnNVbldBMlY0djFZa2pMa2Y0NERGUndwb3hOdXJxd3NzNWp6WWZx?=
 =?utf-8?B?U2dQM0JxTEM0RGo4Tjltb3NsZlZDTWVuTk1id2xpRGtDTjVBenBGWTJJMy9j?=
 =?utf-8?B?YnJEdEtZeStWSFpKaUVIbW9wZm1TSXZQOUZMNEdqa3IyZEpkNXJXZTNHYmEy?=
 =?utf-8?B?UHlHUC9TT0dmVnBaVytuc21SeTNKckRKZlhYdE4vdjlSdGV3aVpuZGp4d215?=
 =?utf-8?B?MmZQSVhEbThFVmUzcCswbFdJQ0xNcjU3amp2R0FvRVA1NmRQK0cvYUlrdFVl?=
 =?utf-8?B?THNKaWpvNzc1LytNRVlFdDF1NXh5VnRJMXd6bE4rS3hIa3hzd1RMK2drSk05?=
 =?utf-8?B?SkxUU01TUWdiMGk2SnVzU21DT2gwUCtYSkNuQ0xHamFGdWtnOXdHWUNYQ3dY?=
 =?utf-8?B?YVI2NWM5WXpiUm02WWx4S24yMlJBb0FRY2ZqMU45QXhWcnphNHhSYjlWZWE0?=
 =?utf-8?B?aCtoM0Q2cWlJNjZQUGRSWG13SDJzV3NoWFFWTDdVelJROVFaZmM5ZlVnbzIy?=
 =?utf-8?B?Ukp4cDB0NEdVYW1hZXR5TjNheEo0d0lsYzRjSkxJWjNzVDJNemRqQmFvT2pC?=
 =?utf-8?B?RTBRUEZvcHRCdSt1UDVNK1ZUTlYxVGw2MDMxVUZCdlkra0V3UGU4cEpPdTlF?=
 =?utf-8?B?aTRid1ZPV1RXWXZSbjRLckkyWlVmRDN0R1ZscEx6L01zV2hZbnB0MjlLT1Uv?=
 =?utf-8?B?VkttNVRJUzBjd2YzUkpJWVRvR3c2K2gySUYrTXFndE1WRVYwdFBHVFpvUXBv?=
 =?utf-8?B?SmZTSkpmZ3U3QXVIRUxEelZibk5jYURaSVRaY1I3K1NvVXJyT2Rqcno2SFV2?=
 =?utf-8?B?azBIcmFGOURHeU9qTjI5KzZPd21vN1VUUWZSQnhRclNxY2lYWWFRdW9Uc3Zi?=
 =?utf-8?B?S2hpUHpwY2piU3FvbFd2aHNPWUwzVnZLa3FKV3VOY0lSc1BuRnFQRmwyUXRU?=
 =?utf-8?B?MzIyZkxjek5HSVh5bWxXYnIzK2ZDUGQySEhsWFdmaE1HaFBqQzJpNkhnd25D?=
 =?utf-8?B?VStvcGJ2Q2dWR2w3b0I3L3F2Rzd6eG1ncmxkaXUwaGV1Y0RROHpjSFdtNUdG?=
 =?utf-8?B?Qjlpa2ozeEF5bDJSUTh5Vm42TmRrR1JmYmZXRmVlQkp2NEZDcjlSL1FTZis3?=
 =?utf-8?B?S1RQNHBwb3hHOUhqOUdyUUp6cVJEbGNJcXVtTjRoV3lXSXpaQ2JFUU1nNFZY?=
 =?utf-8?B?MnFFVWNQK1FXcmNLVjdMMTZOaDBpdVZTTEFpalBOdFc2NDlLS0JFSzZBbUd4?=
 =?utf-8?B?NnlON3BLeVl4RHhaWlR2QjRMOFAwNWtvUjFaQkYzWHFTeU1hQXVKelBxVjNC?=
 =?utf-8?B?TGVBLzdEanEwZzNEMVZWSWM0NzN6TFhqcHVZdFo4eHNNS2hFNDBaSHNSdU1P?=
 =?utf-8?B?Q3lNWmVWNlFRMVFyK2g5eTYwcDA3YkQ3TTF6RVNLekpHUEwzOERCVGw3NXJm?=
 =?utf-8?B?KzBMTlYrdTVZT1JOQlRxYlR4MkM1RVVNRFN0eEJ6alBUYUJFQ1Z6emkwTEN0?=
 =?utf-8?B?eW94NkNXWHgxYXFQalM4NFIvYjRXRnpMZ3p3V0pwQXpROE00SEt0Vm10L29s?=
 =?utf-8?B?VmZ2QzF6Vjc1d2FGSTZ3SU96bmxzUnQvZ3hRbVl4N2tjWE94d0RXdlVjZ0dN?=
 =?utf-8?B?M2tkMGRvQ2VJTUtnakhQTGpyOWlQektiT0F2VmRqeGpJSVV4Ky9RcGl1bGFh?=
 =?utf-8?B?YWxoNk45MDdWTFhTU2dFVjdpYXRqa2ZmbzRkdWpUOENvdHk2dTQ1RGFXWi9E?=
 =?utf-8?B?WHAwLzd6enVLbmlxbkZCYmpzTmdDTjdVWU04eFQwemVPL2xRbFo1QnoyVkRy?=
 =?utf-8?B?V0xiOFVyQzRHRWhXU0NHZVdWcVlGcFZzK3NML1lqV0ZsQSszQXhIQXZkM3BF?=
 =?utf-8?Q?ulPFe1Hgdt8FZvEnnzOlqym/VCRF6j8yNAibDXzlBYj2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c66a1a14-2290-4612-a143-08ddec682317
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 10:36:56.8792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n2nAhyG8NSI+GMu5/aFhCkCwIqFL+l9kJ6/dC2I8i4sK8v/VVaUQVHB3o1/xgAfFt6QqJoqmwBMA5Lyj151wHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5935

Hi Krzysztof,

On 29/07/2025 15:05, Thierry Reding wrote:
> On Tue, Jul 29, 2025 at 11:28:43AM +0200, Krzysztof Kozlowski wrote:
>> On 29/07/2025 11:15, Jon Hunter wrote:
>>>
>>> On 25/07/2025 07:47, Krzysztof Kozlowski wrote:
>>>> On 25/07/2025 07:22, Rajesh Gumasta wrote:
>>>>> +description: |
>>>>> +  Register Settings provides a generic way to specify register configurations
>>>>> +  for any hardware controllers. Settings are specified under a "reg-settings"
>>>>> +  sub-node under the controller device tree node. It allows defining both
>>>>> +  default and operating mode specific register settings in the device tree.
>>>>> +
>>>>> +properties:
>>>>> +  reg-settings:
>>>>> +    type: object
>>>>> +    description: |
>>>>> +      Container node for register settings configurations. Each child node
>>>>> +      represents a specific configuration mode or operating condition.
>>>>> +
>>>>> +    additionalProperties:
>>>>> +      type: object
>>>>
>>>> I don't understand what does this binding bring. It is empty.
>>>
>>>
>>> Yes this is very much similar to the pinctrl.yaml that defines a
>>> top-level object that can then be used by different devices and those
>>
>> No, it is not similar. pinctrl.yaml defines common properties and common
>> schema for class of devices - pin controllers.
>>
>> There is nothing common here, nothing defined except that you have
>> unspecified children nodes.
> 
> This is supposed to be very generic and it needs to be by its nature.

To add, we want the ability to use the 'reg-settings' child node for any 
device, but because the settings for a given class of device will vary, 
for now we opted to create this empty top-level node. The alternative is 
to define this 'reg-settings' node for every device using it, which is 
fine, if that is preferred. Please let me know what your preference is here?

>>> devices can then define the properties they need. So the examples for
>>> I2C and MMC really demonstrate how this would be used in the subsequent
>>> patches. Obviously we are open to any ideas on how if there are better
>>> or preferred ways to do this.
>>
>> I don't see this part addressing comments from Rob - you need more users
>> of this. Adding fake (empty, no-op) common schema is not solving it.
> 
> Bjorn, Simon and Nishanth are Cc'ed on this series since they expressed
> interest in this kind of functionality, so I expect that we'll see other
> users of this eventually.
> 
> However, we do have to get the ball rolling and propose something that
> we think can work for a number of cases, so that's what this is.

We certainly have more drivers that will use this. However, we want to 
flesh out the device-tree schema for this with just a couple examples to 
keep the review simple and focused.

In the short-term I would like to understand if you agree that we can 
use device-tree to store such hardware register settings? If so, then we 
are happy to re-work the proposal in anyway that you would prefer so 
that we can agree on how such hardware register setting values can be 
stored in device-tree.

Thanks!
Jon

-- 
nvpublic



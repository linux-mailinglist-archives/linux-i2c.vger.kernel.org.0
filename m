Return-Path: <linux-i2c+bounces-6822-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FEE97AF2A
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 12:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A251B2BF7B
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 10:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9648415B54F;
	Tue, 17 Sep 2024 10:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=phabrix.com header.i=@phabrix.com header.b="co8D4vJz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020143.outbound.protection.outlook.com [52.101.195.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690CD15A853
	for <linux-i2c@vger.kernel.org>; Tue, 17 Sep 2024 10:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726569893; cv=fail; b=MEe/zVK/PNQZdKjMlRQWsuyNcMdjBt3OTazqrAf7BVc28DNp47aAC9ZkIBiiG8leAUxDCfi32yM9r1dPZPTkZZtxWmYJ4s8kSNYWFqO7hSqEDJhHn4FOHkgpJGVN0EYsKrSaTQE3k33d+lQmwMs48OlgaP7h0rUVsliERNPhsG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726569893; c=relaxed/simple;
	bh=W8Kp9dvNtJyPzeNpChQmLdVTYsmnGxwYhAQTmde2dk8=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=ppE+uTydhsV7GxTmBMFfhVssoJH44NSNOKI8lui7k+5JyGJW7JNsx7IpNo87duGLjxg4+KRT9vHJoE+Rk7PQ1+WxW6msnob6cAI5n/7S93cSCMeMlH91xOiGxA9xT+9ZygjCC2MxTncUIpRRCZX3bDLvsm0NiLy7fOU5b9smhlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=phabrix.com; spf=pass smtp.mailfrom=leadereurope.com; dkim=pass (1024-bit key) header.d=phabrix.com header.i=@phabrix.com header.b=co8D4vJz; arc=fail smtp.client-ip=52.101.195.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=phabrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leadereurope.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TJqQppE5/nuqXQ8QDcUVB15P15E1nBoTrdUT1zTaLqdRxxXOK4+GghaJhBe7z+xM8eOrZlH9dt8s27Mu0Vvo1wpG875UR4UiPY0aA8r2XJtTOSwYFuiYUR53RteZy+Si1/otXDyidqH2WShAq8twzgkAoPQy6HwmEj8pDN0oH16JzillGrsCWSxcwJ+0Dg1l0dUfaceuG18Gwzdwzh9mZDb6CSW6+ZFoJSU+LQaG8ZcgrV43JPi3jhsZJKzZ1owtJTRVrSmppcxp/eFD8uzagVw7Wg+6Y56ewLrE2+f4/ELjtg2nCam0kpCyJmgaEeaKgJ8GhM8Sn/fTOtEKE9fFgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ULiDcZwOFPNigv+tDLzIQlm9o96AyzvcJGig3hAzszM=;
 b=k+h++CgB4DMIlyjf7qTMdoX/x/Sisl5mK+LG5wCbIOCf2X4F4FjRMfKDnpl6PHqUmsiHhtXJFlaQGdt6RAJrbBy3ewFCzTZ0QSjyho/tyRzU5hG6RaLhBFCGRocHATZbZYqOO4bp6CkVrjsCGXHb5K/sa1rhML983r4IzJa17QB9jx/atC0Q+Io5auK4bT6NeVIDFEhkI2U92tAGHqAKt7dINDEOH+AyRN/kPsxCb53Ri804BPUFf4jS08Arf134K5Obt1ljKpU8rwMvyXiH0TFQcry4Sk3sxjip2RcIcpxVa+PZwtFpg5ySbAhkB+7n24Sevyx3V+KWOAKpENkhBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leadereurope.com; dmarc=pass action=none
 header.from=phabrix.com; dkim=pass header.d=phabrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phabrix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULiDcZwOFPNigv+tDLzIQlm9o96AyzvcJGig3hAzszM=;
 b=co8D4vJzhdgMYej8Tyi61k2ZdbXt1LJ/HfMaY6/4+UtdoYiGc4Ga14uA5N1qJYAfxl+lF0vEzc4uywhZviqiz6BaykJ6ONBrYPUkbgfRm1m7c9iunNWBJU/bUfX31zgtYxOEDSpbgG9jafLX4RZwZU+LNTefY0CVaE55bixk874=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phabrix.com;
Received: from LOYP265MB2191.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:112::13)
 by LO2P265MB3532.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1b0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Tue, 17 Sep
 2024 10:44:48 +0000
Received: from LOYP265MB2191.GBRP265.PROD.OUTLOOK.COM
 ([fe80::31b2:efc0:8355:1f39]) by LOYP265MB2191.GBRP265.PROD.OUTLOOK.COM
 ([fe80::31b2:efc0:8355:1f39%5]) with mapi id 15.20.7962.021; Tue, 17 Sep 2024
 10:44:48 +0000
Message-ID: <21b1c8e2-ba13-4181-b2de-a6441fbd00be@phabrix.com>
Date: Tue, 17 Sep 2024 11:44:47 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-i2c@vger.kernel.org
From: Andrea Costanzo <andrea.costanzo@phabrix.com>
Subject: Query regarding i2c-scmi not creating the right adapter
Organization: Leader Phabrix
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0459.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::15) To LOYP265MB2191.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:112::13)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOYP265MB2191:EE_|LO2P265MB3532:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b9a5bca-8f96-48cb-9656-08dcd705c076
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TDJDZ1draHpnSk5HN1ZtZFFlNEh5Rk01dFFJbHk3azBaRE0zR01Faks0eGRP?=
 =?utf-8?B?VjRYSkFZL0pyL05RbS9WOVpiVlhJYzQyeUZRV3FYZDlaaTdCWEttRWc1dlRR?=
 =?utf-8?B?UFlkWjJpV0wvK2M2cXpSZ1hjOTI1ZVBCWWsvU3E4VEZ4QkZreDNRUjJ1Y3R2?=
 =?utf-8?B?UTgwTk5CTnZCYnNsLzhyZEJ6S3RSbEw0UHdnOGR6TmJ2RlU0RVNrNmlIUXl2?=
 =?utf-8?B?bGdnVzhLby9HUUs1NFlwdDBZWUdyaCtqdXJQbzdVdERWdWk1elVWZy85TlJL?=
 =?utf-8?B?N0ZaRzZuelRNZndJM0VibmZTUHo2VVlEYXBnOXJoSHc1NDd6Sk8xRmVJSlZh?=
 =?utf-8?B?MDU5MkhaU0tkd051MlRIT3dEdVdvSXJ4Yi8vU3JPN21FaUVTRllZb3VDMVdE?=
 =?utf-8?B?WmpCNUs2Z2tvRGpBNGhOQm5qZG92d1dTb2ZJTjBBU1EycnB2SnZlK2VSR0ph?=
 =?utf-8?B?MVQ1UWxoM2JOQ0dkR01GeDBWTTdPM2hWVWd6d3J4czgwTDhoNkNSWlhWWkVk?=
 =?utf-8?B?R2lpYjNmaXZzM3NkN3ZJSjZVbmNLYzkwR3pvQm9ZenVUUmYyTzNiZ0ZGMkVv?=
 =?utf-8?B?d2tDRjgzbE5SL0NGYzQvWUNqbHpJbEVhNkJMUjk3ZE4xcUtzSXJKRmVhS3Jh?=
 =?utf-8?B?KzJnd1c0VnpYa2MrR0RrSzEvZ2laOTk4dmtmUEY4ZTFNRElxNVpORjBHMXBl?=
 =?utf-8?B?Zms0ZnRudlVSbnRmUjRjRTFnaHY1VHBjdyt0eURTZ3VtUGFFK3I2NXRoSUFz?=
 =?utf-8?B?TlFWeGEzZ3h6dnVUWXVWaGV6SjNVVitoUytremlQaS90RDlENmhVbnNpalJk?=
 =?utf-8?B?STJWT2RkbEJGTkFPamlBaFpKVzRxdy9OdjJ5SjhIcW1mYlNqOWFDK1Y4cFRN?=
 =?utf-8?B?T1Q5S3pKUStoTWxrcTB4NE5xai9QMWNkOFpIR3J4Tnl4SWEvNFFzNGw3cUYy?=
 =?utf-8?B?YkhwZWszZkdKWGtFdHlGMktEZ0FlUmpHV1RTYjQzSWMrT1NoSFNzakYvN3hl?=
 =?utf-8?B?d01xMVhqU0Izd09qUU81K3F5S0dEYmlpeDRncFZqdCs2UFBFSDRpcEEzajVX?=
 =?utf-8?B?NGkzRGlESldENDlOekFoYnVRaElzakdWWUI3NUpwQ3lHcXJFd2dzMnU4eTVr?=
 =?utf-8?B?UitrMktzdHhMMlorNTRabzdhUHVxL1JXaVZNV0dGYUNSdUJwSVNHd2ZNNjRV?=
 =?utf-8?B?Y0Mxb21hanl5cmpMR1FIcEdlUEtJSW4zMWE2NTZVWW05cG1tMXV0RzRoTSs0?=
 =?utf-8?B?SnlZdDlSMXNjOWVKeGF6ZVpYcUJOUUZDMUNTemRpa2EyZ1VxMGJmbmNKTnkr?=
 =?utf-8?B?WiszN3Izcjduc08xcmhRN3NXWndlUVp2dnNpWTBEK3UvcVVNY0kvMDlyelBm?=
 =?utf-8?B?ZW1leFpSYU9aSlh6bTFkbDk0NmpReXhjcXFZTnB4aGNsbEE3cGpaNWZ1eWdn?=
 =?utf-8?B?Y01HYnpDWVpKRkNPM3JPM1orcm5uNVVBTGdkc3hrY2YxZlJYRXJQb3UyVXQ5?=
 =?utf-8?B?akN0dDFUbytZdnY5WjZMV0FBcUp2VmI3dTVjYlRsVVRvWGVhUWZoWlZpZVNw?=
 =?utf-8?B?cm4xUjNJaktxcm5KcndxQlRmOWdqTEg3cDg4UmtMTUxnN21LTkxnZHZjUzkv?=
 =?utf-8?B?S0VsK0JSbVliTytiSU9HdjZaTldtblArZ0hzZTFUYVl3NG9ESkxaRUNKcGVr?=
 =?utf-8?B?am1RbzJLS0lFMDZlWUYvU2MzaS9xSVN6bVZ6WmowME9kMEdWNEdNcWJsd0dB?=
 =?utf-8?B?cFk2Wm8wc3VzbEtURk9sempqOGc1LzI1c0xGWVk2ZTcxZ2ptOE1nVWREZHFV?=
 =?utf-8?B?THRHYk8wbHJPVTlRZmJhZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOYP265MB2191.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dSs4YkVCK3RxZkNVYThHdzA1NGRUSlNlMjRwT0dQaEpGUUtURWkreFl1TGlE?=
 =?utf-8?B?Syt3NzgvOVNMbWxMS205U09WU1JFZnJPQ1FmN2RwcHQvUW5ybWZ6dElmbzlJ?=
 =?utf-8?B?TWY4MnZBcmF4bjF4bE5ueXB4S01lY0hzVFh5aXhWdzlvK1ZQVXFkS1dST3J3?=
 =?utf-8?B?YXk1bTdTdjdMY3A2a3B5U3BrK2g2dTRIdmxBaDUzay91V0EzbDFvMFpTeTFl?=
 =?utf-8?B?d1RvK1JrVG9Yc2xpQXovMDNld1poWlcva2NNbmxtaVoya1V1cGtYR3RRNC9Z?=
 =?utf-8?B?bTJpVFBRS2ExNzdPZHZVYlRMcWpZZDdnNWlLY3RDbG9Qdlg5NHM2bWh0SkxX?=
 =?utf-8?B?U2oyTmp6V1hkcWNoQW53aW9UMDNGekQ3ekdTd1FScDI5R2ZySThkNHVvSFdy?=
 =?utf-8?B?SjB5M05nWlBRTDhEWmYyZXFsSVQ5SWdSSGZXSDVqTmwyLzJqQTNwZkVXV3ZQ?=
 =?utf-8?B?QWwyZW9jcWtWNExqZkE0enpTTlFBcFF5SEJ6d1NWWFF2eHN4ZVdmM0VHSURN?=
 =?utf-8?B?OGFyVHFyLzIrRjBDNVNybG9pd2dQWHVCQWZvc1pia1R2TzNrNSt6WHVsdTN2?=
 =?utf-8?B?MkRyOG1rRXlYWUJyQ0k0SUp0T0l5OGsrdDVRbDhkV2xDYXg0VWpMZlM3TXI1?=
 =?utf-8?B?bDlYSlBEOTdBQWpZY0lsZC90aG5zN2duWEpsUk50SzRGcXl6YmJvcVFBc2JQ?=
 =?utf-8?B?QU0xNFJ0YytnRXlkMkJ2N1JyQk05UVhsZ3kwdGlFaWJHaG5zYURpeldWWFRQ?=
 =?utf-8?B?TW96VnRGSUwxd3h2N2tGc0VMNHVzQ0hyajBoZTl2S3FOcEMvMHRxeGhXSE5V?=
 =?utf-8?B?Nko5K2kwdWhXRGJVeVVIQ2M0NXBFZk1QRWxKa1dkK2kzd0djdzJxS081bDRy?=
 =?utf-8?B?YVYwNmNZdzhyUXNyQzgxazFGNXczaGxISDN4T1VIcTNhN1BQUlZudHk4YzhM?=
 =?utf-8?B?LzcvTFl5WlYzbmlpSys1RzI1SHI5eU9VVkc4WThVQ2dVMDhuMHNtNElBOENv?=
 =?utf-8?B?cFk2M2ZRTk9vTVhiM0IxdmdOMGt4amRaM1B6Ri9Hc2t3Lzk0b2w5WFRHd0Rr?=
 =?utf-8?B?QUF2bG12NTM1ODlLQWo0T0ZCZWFEb0RDOFdKcHRYcmlWSlh6ak9xZzBmQnVp?=
 =?utf-8?B?MmpuS3hKek1zRlJSSWY5SmkxYnZGYWloRWE0cDY1ZlNQZFBWVFppVGZ3VjVX?=
 =?utf-8?B?SDBoQTgvT3A0SGNRcEhZTUlYM3hkdG5BTC9SU3VVNWVjeVgwR2k5L1dpamdG?=
 =?utf-8?B?NEoraTQ5TENPWTB0dzRnQTZ2b3dXS0dXcHhyUUpyc1ZOMjliOVZDcWZjNHBr?=
 =?utf-8?B?UzloY1BncDY2Y0VTbG5sS1hYMjVXQnRrdk1ldHJrQ1VDNkt5SjRiT2hYeHNv?=
 =?utf-8?B?UU50Q3U4NjlVYTdFQzhSR0ZBTXNEZ1loTWFmVVV5Nk1TTFNwN2ZHNFVoL2ZZ?=
 =?utf-8?B?Q1JnbG1IZVk4T3lHVkFvVExxQ2hRSnpvZ1FkTHg1VlUwQXlaZjdKQmVuM2pR?=
 =?utf-8?B?QS83dU43bnlHN1A4aWY1V1RvaDZ6ZmM1K1pzTVFyVkZkb212RFNWR3owcnVv?=
 =?utf-8?B?c2hDR3NIdlN1Qm5Za0F5NDh1cVpPYjVFVDZiOWs5TWl2NnQrZ2pnRDVNeG9L?=
 =?utf-8?B?bENpcE8wSEF3S3pKakwra3g4ZTcyK0ZKTTh5RXJQSzZYWTRjcHcrekVHMjR1?=
 =?utf-8?B?TElVWTVDem1pR3pnN1pvNGdIUitoTE1iZ2xpdzlJeFp4SGRIMU10Q2t0MlJs?=
 =?utf-8?B?OG1qcStCNFlxaktrc2VaT0ZWMDBvMU5hRlNvVjZWakdJaTgxL0ltQUt2OTF0?=
 =?utf-8?B?MmNxajhLWWxNNUtkTFRmc2RyZUNKVjBha0oyNjFjdExrMllyTkN3NFY4b0tr?=
 =?utf-8?B?QTlsT1Fud3J0WUMzUVE0NVBxZDBzWDd6UkpLYVl2eWtOZStYdkxScERhRGJj?=
 =?utf-8?B?amRPNXlQUXFYaUlYUDhPQTc5S3U0NmNBNlU0K2JqTS9ob1hpQ3F0ck9WU3pa?=
 =?utf-8?B?U3V0K3NjT2p3ZGt0NGxRTk9mRVZRV20zNk92dGdObCt2dGtEQTJFakZNczdq?=
 =?utf-8?B?RDdFeW81YU9VS3AxN3NFUDF3YU5sNzRqK2k5V1kwclM1MjN6eTUzdjhZWTZG?=
 =?utf-8?B?NGRwVG5ZeSs4MFc1ZXpLWFNjREFoNjI3QTdFTXoyQjIwc0pzT1dVa0luOUZB?=
 =?utf-8?B?VlE9PQ==?=
X-OriginatorOrg: phabrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b9a5bca-8f96-48cb-9656-08dcd705c076
X-MS-Exchange-CrossTenant-AuthSource: LOYP265MB2191.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 10:44:48.4435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 20a0d659-dc6e-4307-9c1e-97f93b0e3d90
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eO5X1WEjc7+ZP2KXIebXyNSnjOgZLjlxHrCAvd8oko8MfRrnlUOw7b1vc4UyvkTbdMJpR5fspF4v6r6KsauY1L5AMyNEHpJzd9LhALSpnAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3532

Dear Linux Kernel mailing list,

I have been trying to compile and load the i2c-scmi and i2c_piix4 in my 
system.

I am using a yocto kirkstone linux distribution. The overall project is 
to be able to read some voltages and temperature from the nuvoton chip 
nct7802.

I have set to build as modules the following driver in my yocto 
distribution.

CONFIG_I2C_PIIX4=m => enable i2c_piix4 module
CONFIG_I2C_SCMI=m => enable i2c_scmi module
CONFIG_SENSORS_NCT7802=m => enable the nuvoton chip driver nct7802

When I run my system with the new modules loaded and I scan all i2c 
busses (i2cdetect -l)

I do not see the SMBUS CMI adapter loaded in any of the i2c devices. 
This means the i2c_scmi driver failed to bring up the adapter.

Instead when I run on the same product an ubuntu distribution and I scan 
all the i2c bus with the same command I can see the following output on 
the i2c0

i2c-0 unknown SMBUS CMI adapter cmi   N/A

.....

I have tried to add some printk messages on the i2c_scmi probe function 
but I do not see the printk messages on the dmesg output.

the smbus adapter is physically connected to the pci bus in my system as 
I can see it when I run the lspci command

 > lspci -v -t

-[0000:00]-+-00.0  Advanced Micro Devices, Inc. [AMD] Raven/Raven2 Root 
Complex
            +-01.0  Advanced Micro Devices, Inc. [AMD] Family 17h 
(Models 00h-1fh) PCIe Dummy Host Bridge
            +-01.1-[01]----00.0  Xilinx Corporation Device b03f
            +-01.3-[02]----00.0  Sandisk Corp Device 501a
            +-01.6-[03]----00.0  Intel Corporation I210 Gigabit Network 
Connection
            +-01.7-[04]----00.0  Intel Corporation I211 Gigabit Network 
Connection
            +-08.0  Advanced Micro Devices, Inc. [AMD] Family 17h 
(Models 00h-1fh) PCIe Dummy Host Bridge
            +-08.1-[05]--+-00.0  Advanced Micro Devices, Inc. [AMD/ATI] 
Raven Ridge [Radeon Vega Series / Radeon Vega Mobile Series]
            |            +-00.1  Advanced Micro Devices, Inc. [AMD/ATI] 
Raven/Raven2/Fenghuang HDMI/DP Audio Controller
            |            +-00.2  Advanced Micro Devices, Inc. [AMD] 
Family 17h (Models 10h-1fh) Platform Security Processor
            |            +-00.3  Advanced Micro Devices, Inc. [AMD] 
Raven USB 3.1
            |            +-00.4  Advanced Micro Devices, Inc. [AMD] 
Raven USB 3.1
            |            +-00.5  Advanced Micro Devices, Inc. [AMD] 
Raven/Raven2/FireFlight/Renoir Audio Processor
            |            +-00.6  Advanced Micro Devices, Inc. [AMD] 
Family 17h (Models 10h-1fh) HD Audio Controller
            |            \-00.7  Advanced Micro Devices, Inc. [AMD] 
Raven/Raven2/Renoir Non-Sensor Fusion Hub KMDF driver
            +-08.2-[06]----00.0  Advanced Micro Devices, Inc. [AMD] FCH 
SATA Controller [AHCI mode]
*           +-14.0  Advanced Micro Devices, Inc. [AMD] FCH SMBus 
Controller ->This is the SMBUS Controller adapter *
....

Do you have some suggestion to nail down where it can be the problem?

Many Thanks

Andrea



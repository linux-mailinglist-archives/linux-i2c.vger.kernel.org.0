Return-Path: <linux-i2c+bounces-7326-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEA4998DCC
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Oct 2024 18:49:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E3C4B2710B
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Oct 2024 16:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 451FE1CDFC2;
	Thu, 10 Oct 2024 16:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="P28AFl/Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB6B1CBEB9;
	Thu, 10 Oct 2024 16:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728577523; cv=fail; b=I/ywoHjTJ1BQOzFfJLgGDCXQfznkgJooTww8/Yz3g0Gwe49+3dgmwjkk2MYoSEyR9KSylyDmncRykbWE5GALQfbLllqi5KFRRp97pieH8SkbjBSt0bPQ4+5dE/JpNIhj+okCKpK97ErRr2CKfs7nP8DIpd0jnnT7cZ/CAONnI1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728577523; c=relaxed/simple;
	bh=S4tVmweDF5lQLlFiqwpaklKiBzDpgpPTqQcCZ9QXnO0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RwH8+y8N40XG4ta5DcB8r3XKX7LdQ82sKczYXhdfkiL4+JrbVZcap5CCQvCxjMDSFMCxIOGcw8jI0aUKNIX2kyYtPRO02wPkpC0DO7bc3cIUG32gMwVzMXj4DRuwVr8yyZhg90kQEdnsVR9dnj5v3CZQNFQUSxPO78SXzbkkXps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=P28AFl/Y; arc=fail smtp.client-ip=40.107.92.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EjrIU0zy4kfatcYdQzlbM4eS+PIgxDkZ6LzsMB5UH+V+S1BT68b2zpai21BGwBbvdRDJj70CwIufdJqx9rtCeRpa9LEWO0A2czTm8Nu1MG7qSwneqNVmpiuL0JxT0eGuu96cYDoRIpd2q5ss7fXoWq7bHeciGKMWokDbddCH4/gPsutWIh9XznYjOIPPVAqx+QE/vG1+TU7xFxdh3KcOhEbJAqW4KPncRcha/DFY6O8en5DaEhhAdL65r71OFjzaviYiNmn7d8teodzwo4EBc8VlmWAL5PGCRNGAealeXO23xRqggauVdKeeivPr+Xgjxomp/e7LXEytLOmaKtQFWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zlg4cMC8wI6mM+IBED67GFgducUrFwgohlolzCWLYLI=;
 b=zEJWVRmLiLmCg20hXEpvyibefAOP6hWH6xYtipyZZTxIaeQ/qcdczyQlO2ksJvOwFt1hnvIXuLWiw6JhiCZuQ1h/Ozq4dLjQMqMzTsVuqjUnEIEWYDPDB503/QPhM3ac0PmjWY4jwp2A61CtVf1o2csVZbZP++VYoZgcWXTcB/JgQmkQ2icjUpE8sQO8KXAZe3lDA5WRSW+n7QCJPX4ysYSXXOZdrwRYSQ+iWenIbO+VGq4wpr+LNJKmtLoEy8F/f23CUlDR1oUMhWqqrUJh6/AMo3ynbkGa/xnE2u/OOW0R8hT02+BGTQ5bkLQiKKmUxgZijvAklhpIpJ3GLJn1Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zlg4cMC8wI6mM+IBED67GFgducUrFwgohlolzCWLYLI=;
 b=P28AFl/Ys2O+zc4m2AT01Z5ojgpsEWArK5p//sWKOsJY25Jo869Xgbhl61iQct54y0fz9oPQoizZs6XFwIQgtvNtCVQ8txFlB5aNOA1mzaWreoOzKLendj1zKl/Scxo46x+gvGdKcEUT3EQKbCtaR7MsVIUaJXfik2VMcj8f9N0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by BL1PR12MB5924.namprd12.prod.outlook.com (2603:10b6:208:39b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 16:25:17 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.8048.017; Thu, 10 Oct 2024
 16:25:17 +0000
Message-ID: <3409c03e-35fb-428a-9784-0069b63a83bb@amd.com>
Date: Thu, 10 Oct 2024 11:25:14 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: Wrong piix4_smbus address / slow trackpoint on Thinkpad P14s gen
 2 (AMD)
To: =?UTF-8?Q?Miroslav_Bend=C3=ADk?= <miroslav.bendik@gmail.com>,
 linux-i2c@vger.kernel.org, linux-input@vger.kernel.org
Cc: Andrew Duggan <aduggan@synaptics.com>,
 Benjamin Tissoires <btissoir@redhat.com>, Hans de Goede
 <hdegoede@redhat.com>, Wolfram Sang <wsa@kernel.org>,
 Andrea Ippolito <andrea.ippo@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
References: <CAPoEpV0ZSidL6aMXvB6LN1uS-3CUHS4ggT8RwFgmkzzCiYJ-XQ@mail.gmail.com>
 <5105b392-dee9-85fb-eeba-75c7c951d295@gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <5105b392-dee9-85fb-eeba-75c7c951d295@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR13CA0018.namprd13.prod.outlook.com
 (2603:10b6:806:130::23) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|BL1PR12MB5924:EE_
X-MS-Office365-Filtering-Correlation-Id: dc137c7c-1b91-4908-4769-08dce94820a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c3VRL2p4ZU9iMHphNmxDaFJEOU0xZ0JRaXR4RFF3M1BkMmpTQjNOdEdETUZI?=
 =?utf-8?B?dlBHaCtvSllnRkFIdXAva3lwYzNyUnBhUFQ5YUNNRWpIYmJjTEF3ZWdIb0Nk?=
 =?utf-8?B?Wm1nM2tYbkMyRzNxaWNXN0RGM1hjQ3FvdThOMThTV3BUazhPWmJVY2gxVWhz?=
 =?utf-8?B?TkUvZlNSU2pkNmUxc3RLbzNpemFrR1gxdjlaMXR0a204SjB0VHpNckZLZGpl?=
 =?utf-8?B?TFJxNFNsbWdTVjd5L2VlaHhJbi9sNWxnYVM1ZENhUkhzNTJyYkg0N3dkTmps?=
 =?utf-8?B?V1lwUnJnWjFWZ1ZNM0pmS0FVQnRMaUhiWG1Ud1hjdFh4bTB3alBWOUhxK2ZQ?=
 =?utf-8?B?cmJZaDdFcWNuaU1jS2JhbmdXN2phaHJpaVQ3WFZTdTVUbk16R2J2bVA0ay9Q?=
 =?utf-8?B?WFZrRmI4Y3hjWXMxNGZWUVhHQmJMYU4vWHhQbmVUbFpOUU1GYUIrOStjNDNo?=
 =?utf-8?B?RnRpVU5KaU54M0FkUG1PMk5aa0RQUFphdXVwTFFMbTRvWFNwWWNZNjA1cmpw?=
 =?utf-8?B?b21rc29mVXVaVDJzbTdKMXp1NVJkaTlBL3hROWZEV3MrbVJCODdOaElzVzZh?=
 =?utf-8?B?emJmR2d2NmRJVDJLaENMeGN1VUw0SVFRWlN6ZHlvTjlzbmFoL3p2c2RqL3I4?=
 =?utf-8?B?WXNhYmI4U2duYm9JUTRQdzI1ZTQxN1p0UmY4QkZCMWYwTGNRenRZdFVCYWxj?=
 =?utf-8?B?OFUvaXF0YmtaL2lwNElNVTBsVGgxWTA5RVcwTWM2WHRsc01YTzA5NENoMGhH?=
 =?utf-8?B?YmdoZEpFd1dNU25VcVpCYldQYXdQYmVyR2NjYzNzaWhva0NaYlpDWXFwbnZh?=
 =?utf-8?B?NVc2ajJ2ZGEwamNDbk5oeVpSZTdoNWNSYTdVUmk0ZmNsWDI0MW5wQnc4aHZh?=
 =?utf-8?B?SzhJaVl5SzFveXNnTkRucGJPNGg3L2dDMC9RcjFqbkQwVkNPSlZLbThvUHhP?=
 =?utf-8?B?blVzaFdsVXBUWlc1MHNhRTZpQ0kwU2FlZXZRbEF5REljSm83ZE5CYWN5OS9a?=
 =?utf-8?B?OElDTkJTZUl6ZlN4Yndpc3pldTBkWmltc1FJVTh4NGRVVDB1Q2Y0NzJPYnc3?=
 =?utf-8?B?Z3M3bFhIcW5ueS9IalRPaXJyLzNETjFXemowSk5PTjBqWHhEOFgwTkpqSnNM?=
 =?utf-8?B?NEJrZjdHWGF4dFpqeTEwaHdRbll3ZkVmVzVkWDU3ZVdFc01lUmdrV1RDSi9H?=
 =?utf-8?B?K3o1Z0lDMWpCRVJwK0Vxb1ByTkNlZnU4MDBReXMxTkFIYit5dTBLbzdVVkRD?=
 =?utf-8?B?NXdRUzk4VC9Kbzg5UG5rS2J4Rmo4MWhGNldPS3pQWTlIOU54b3lLTzI0R015?=
 =?utf-8?B?QVNFbzM5SHhSK1ovMGdMQmd1U1J0aDRoaFRYdVlGRjlqdFpTVGVnZmVQUHdn?=
 =?utf-8?B?S0ZRMUs2bTRKR0loV2xUK3gzSTFPRTJZeXVxWVc5OGl2OTJSekErNzFMNUF4?=
 =?utf-8?B?WWpRWTRBNnNTSlFmLzdBREhMRVZmUHhucTl4c0EycGN0aWQyNFkvbFZrTTZw?=
 =?utf-8?B?NG9aWnpvcVlaRlpITkJiMzhvKzBmL3ZJV0ZjK05tUEYyelFDc21ldEg0ZkJY?=
 =?utf-8?B?WFBqdkkvbStPOXBsaXdyeFZqZVJST1JxMmlnUGhMNmFrTTJES0pFRk5Hdm53?=
 =?utf-8?Q?juW1HUBbeOkwaH2s79aMqYZufV73I13DuDW2M2IpX94A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTh2dXJrcGVjT1dRMWprOWljNUZ3Q29JcU0xTGlqNGYrejZkaDlISG9zb0FT?=
 =?utf-8?B?MERPR0VZaGp0NC9zM3B2Z25oSGFlWDZ2VG01eXhPVGVCQkJLZWNoVjZweXFV?=
 =?utf-8?B?MTNMakNmbEhSQTZEeFNSc3JGOHV2dG10ZHZaZm9BZEJHUmpqbUEvZFBPZW1i?=
 =?utf-8?B?TkdYd1phdFhrNWs2YXowd3Q5VlJTSkdXalY1UHExcDNieGpHQytOdFFiaFZn?=
 =?utf-8?B?eVQvMnJSVTVqMWZXZE1GWVFVTnJuZHpydVBXVlBobVM1dmMwNUFrWFJJVzB3?=
 =?utf-8?B?YUEzM2lLejlQdXhhcmRLd1pCWjBwN04xdmpBK214RHk4bzBjc1RTYng5UmNq?=
 =?utf-8?B?ZDZ4MC84REx5Zk9kQ09sblNITzkybTB3L2JTMWducWNzT0JaMHVsTkZ2RHgw?=
 =?utf-8?B?MFROY3lJQUNld0tQZkgwcFJMODJxK3BrbWo5ckQ2UUlWSDd0cERmNnIxZ3py?=
 =?utf-8?B?d1grb0FGL1RmRFBkcTFIdFQzY1Rjd2pWTTFhN1ozR3lWTHp2eXJhSFZJRk04?=
 =?utf-8?B?eU1ISXJsVzBRTVMvc2NmYzRGUll2VjloaVppVGRGUkVGYndjWUVoMkF3OEpl?=
 =?utf-8?B?THdDbjIzQm05cWFEUUFCbjRhamthSEhpdXgvdkFZNmZGTEVTOWludVNjYlJm?=
 =?utf-8?B?NXRIV1NNZzlkNGlYTXFmcWQ0N2V4ZFFOeDFFVWJUSmQ4K2I2dmhVaVgxbmlh?=
 =?utf-8?B?OXhVZ2diQURiTlJQTVFEMjdMczZEQ2lmMjlQVWtNY0NNQndwVzdmNDJEbUo2?=
 =?utf-8?B?ZkhnTVAvZmNyWFdGa3hwYmE4ZExNTkVyT3B6akd6ckxoNm9IK3RKdHVPekpD?=
 =?utf-8?B?Q0kySFZ6aXRKTmZkWkROdU1iUWtmR21RaFNJV3Y2QVNsU0p5aFVWQ214RW5V?=
 =?utf-8?B?WVFwMnVHUkVnbGZkVmtSeklMRWE3K1AvUU5PQmZSY3NxYzZtKzBBNm9ldDdQ?=
 =?utf-8?B?TlBpcU5hVVRURHJHcHkwQzZIVk9udXdxQ2g0cGhhNVJZazFOaUMrSFV3Mloz?=
 =?utf-8?B?bjVOWUZpbTErRlFib0t5Mm5XaUtVZGNhRThFYkZoUFh2Mjh3aGpLTUJLdXN0?=
 =?utf-8?B?b3dIZGVRUEpiUG81Mkg5RUxJbGpKaEJad3h2UjJkcUlMRUlLNmJFUEhUdDNF?=
 =?utf-8?B?UEhoY2pjZkp3ajZTQzZOaFh6aXkrOGVUU0U1d2tDZWlGa3dveXc2cFR5QXdX?=
 =?utf-8?B?UE41VVhkUHdvM0MyWHZGTk5VR3BPbVdwT295WHo3UXNMSEF1WEd3WUtiS0Zm?=
 =?utf-8?B?NmZWc0lVdkIvZUJveHZvbjBJYktZMmZhT3ppSUsvb0o0SW5tRi9TOHJtMi9N?=
 =?utf-8?B?ejBFQXZZQ0Y0STN1bXhEMmRVRGhBZXVzeDE4UWZab3JwWjlXYjQrSGd5anRB?=
 =?utf-8?B?enE1TE5EWDczR1NZS1VZZjNaaVdmVTVCZFhNZXhRUi90WUp4SnM1cWN6NkRv?=
 =?utf-8?B?cFRlMkZ5RjFQa2ozYiswRVQ4akFCd0NZcFpkSGE3enNxQTY3aDJsdkZ5cm1v?=
 =?utf-8?B?OUY4THhXNlZQWnJkbDRHVkczbkZBNlpqcXU0V3BuaytHRllUTjl5ZFR1eVVB?=
 =?utf-8?B?L0dkZHZMWGN4S3RoUmFiOGoyY0VJSmhJMjFRemFnZUE5blNudGdnTFhFYmRh?=
 =?utf-8?B?SUNmaDFXc2doN3NhcDZPakZQY0FuZVhvdERLZVJtdWpNNXlvaHlnTHFQUzRV?=
 =?utf-8?B?ZFllVEs2ZlM4d0U1UjlZWkxaQzVLTzFoOXNRWkdMTFhadFMyMzAvWTNJL2NT?=
 =?utf-8?B?VVUyQ0F1Y3FlQzlYcFRMMmxMaElabm5WODhaSFlRL1NCWWRPOVVDSmlLY2tq?=
 =?utf-8?B?MWhVM2RzekxGQ3pCa3lRN1gzeDJnWmJyQklSdWpiNFhoMmpJWTc2YWFYZ1JT?=
 =?utf-8?B?UmlRM0IrY2p2QU9CSEY4SVAzUHV2bTJNODhHdjhoNVJPRVBJWWpEYzZ0TFNP?=
 =?utf-8?B?VG4xZ3hnUklPV2paTGNmUk80Sm1iWnZyZlA0cmhGaGlKUzBwbTJWajNjWGVB?=
 =?utf-8?B?S0Rpb2hoQ0pkM0dzMHcraEpXdmhuVTNZR2laZldtbmI3TEg2ZVZGcDNubmlT?=
 =?utf-8?B?R2IxaU9OeTlIeURWNmNDMXdiK0VyRjVXYWI2WWswdjdOaFl5YmQ4U2k1TWVj?=
 =?utf-8?Q?ioPPSn//1NudFvjW19MtbufBj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc137c7c-1b91-4908-4769-08dce94820a1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 16:25:17.6446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X45e44XmWf7FeLUZmmFHQYUv56pnbGAtjow2SREz7BKV0ah25mSfuiXGKtb4HvM3Z1uaRB4TbLCPXHU7Uetf5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5924

On 2/12/2022 11:42, Miroslav Bendík wrote:
> Hello,
> i think, that SMBus works now pretty good and last problem is screaming 
> interrupt from synaptics (1000 irq/s). I need little help to solve this 
> problem.
> 
> Little summary first:
> 
> On this thinkpad is synaptics trackpoint/touchpad connected to PIIX4. To 
> enable RMI4 mode, SMBus driver should support host notify protocol. I 
> have added support of host notify and replaced active waiting 
> transaction with completer + interrupt. Driver is now pretty stable and 
> works way better, than old implementation. For example i2c-detect shows 
> real devices (previous transaction code showed all addresses from 0x1c 
> as active). Patch on following link is still hack, has hardcoded IRQ and 
> supports host notifications and interrupts only on auxiliary port. I can 
> implement other ports later.
> 
> Patch: https://lore.kernel.org/all/c9b0b147-2907- 
> ff41-4f13-464b3b891c50@wisdomtech.sk/
> This patch includes PM register access using MMIO: https:// 
> lore.kernel.org/all/20210715221828.244536-1-Terry.Bowman@amd.com/
> 
> Now i can load psmouse synaptics_intertouch=1 and everything works 
> great, but it uses 5% CPU and interrupt is called 1000/s. I have changed 
> interrupt from rising edge to active low (it's PCIE, PCIE has active 
> low) and i have many times checked if all interrupt bits are cleared in 
> interrupt request. Yes, they are always cleared. Interrupts are 
> generated only after first touch if i have compiled only F12. If i 
> compile F03, then interrupts are generated immediately after load of 
> psmouse. After unload, interrupts are not generated (i2c-piix4 still 
> loaded).
> 
> On this machine I2C is accessible using GPIO 19(SCL), 20(SDA). Using 
> kernel thread with RT priority on isolated core i have tried to record 
> pin values on GPIO pins. Latency is too high to record all transferred 
> data. Some state changes are lost (approximately 1/50 bits). Not too low 
> to read reliably all data, but good enough to see what happens at bus 
> level. Here is recorded file: https://mireq.linuxos.sk/kernel/ 
> thinkpad_p14s/i2c_scl_sda.xz.
> 
> Every byte is sample, first bit is SCL, second SDA. Sample rate is cca 
> 500 000 Hz, but often drops under 100 000 (lost bit).
> 
> On this screenshot is typical activity on bus: https://mireq.linuxos.sk/ 
> kernel/thinkpad_p14s/i2c_1.png (pulseview with imported raw file)
> 
> Zoom to two packet is here: https://mireq.linuxos.sk/kernel/ 
> thinkpad_p14s/i2c_2.png
> 
> First packet is SMBus host notify. Address 0x08 is SMBus host address 
> and 0x58 is address of synaptics (0x2c << 1). Second packet is reading 
> of interrupt status registers. Data 02 is length of interrupt status 
> register (9 bits) and last 2 bytes are zero (idle, when moving cursor, 
> then interrupt status register contains one bit set).
> 
> Zoomed out: https://mireq.linuxos.sk/kernel/thinkpad_p14s/i2c_3.png
> 
> Before transaction SMBus slave state machine is disabled and after 
> transaction enabled. If notification is received when state machine is 
> disabled, then device writes only address and don't get response. If 
> driver runs with always enabled slave state machine, then output will 
> contain only notify + read interrupt status pairs and no separate 
> addresses, but with this mode bus collisions occur more often.
> 
> Here is dmesg output: https://pastebin.com/RdDYHJn0
> 
> Cursor is moved until 2862.8, then i have not touched trackpoint.
> 
> Idle device don't produce bus collisions. Moving cursor produces 
> collisions, but sample rate is stable 100Hz, which is way better, than 
> <40 Hz with PS/2 mode. I don't know how to solve collisions. Maybe they 
> are related to not silenced host notifications.
> 
> If i were to be optimistic, then i would say that clearing interrupt 
> vector will solve all problems. According old RMI4 documentation, 
> reading from interrupt status register should clear interrupts (status 
> register is cleared), but this don't prevent device form sending host 
> notifications. Maybe exists new way to disable interrupts. I don't know, 
> i have no access to current documentation.
> 
> My device has this signature:
> Synaptics, product: TM3471-030, fw id: 3418235
> 
> Any help welcome.
> 

Sorry to bump such an old thread, but AFAIK you never came up with a 
good solution here.  I did want to point out that there was a very 
recent submission by Shyam (CC'ed) [1] that adds an ASF driver (which is 
an extension to PIIX4).  By default it's going to bind to an ACPI ID 
that isn't present on your system (present on newer systems only) but 
the hardware for ASF /should/ be present even on yours.

So I was going to suggest if you still are interested in this to play 
with that series and come up with a way to force using ASF (perhaps by a 
DMI match for your system) and see how that goes.

[1] 
https://lore.kernel.org/all/20240923080401.2167310-1-Shyam-sundar.S-k@amd.com/


Return-Path: <linux-i2c+bounces-14069-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAA8C53D1B
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Nov 2025 18:59:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 916CD3AA8E7
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Nov 2025 17:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BF4034846C;
	Wed, 12 Nov 2025 17:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b="TGZutf9W"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022107.outbound.protection.outlook.com [52.101.66.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA8E1531F9
	for <linux-i2c@vger.kernel.org>; Wed, 12 Nov 2025 17:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762969897; cv=fail; b=MopdhD80B60jOu7vGqKIfipBSCaXtVH1wpZtG3f9xUuSdbJgVf/FNx4B0UcSALX3fS5CJEBJbMLie+8HAvT3FsMwtvlCmEnePDcW7/kJH6yJ74mKtDX175Zd2oQ6DxUsKR6zvTbMGerdE9mLLnX/V+KvLv+bGj73rpSmJuttcXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762969897; c=relaxed/simple;
	bh=FR4McXgkOlSAqCJ9uvF2yk0eXCvYrzh5fQUC3uvtuZg=;
	h=To:Cc:From:Subject:Message-ID:Date:Content-Type:MIME-Version; b=lM6zKGQAuTn8waZZwN9Q65uZXX1fGMQQ/rMVT60GVVDouT2OkD5IWC17Z3s3Z42idSXnZR6S4T2NgOw5iFc0MGIsapSyRdZcSGfkGbR/dFZTiauQeynJkEpuJvZjIVzza2/AMiLqw4DX3DIJcgdEOUPJ/1NzMB/APt6yH3moIoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kontron.com; spf=pass smtp.mailfrom=kontron.com; dkim=pass (1024-bit key) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b=TGZutf9W; arc=fail smtp.client-ip=52.101.66.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kontron.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bBV3EyIxVhr79bO7O+437TJndAnvia75j6o9FZjHJ7Mj7aA4wSaQoaLhEbPDjOAh3Z/BFW3DmgOY/0wiU329alUrCLZUWflhiiWIBcrKKN60IOXK8uTNKantk0GR04FnBJXOjeL5YH/4jY3kr21d50LdWgh3gl3ew34Ic87BDsb25RCWR+Opj1Z0DY6MPIKMDfFIy/MfFucO7oeAXc0nAdqKRYM6v2IAoyT4NV+iPPbO7O9KRYio/Km/ZJwnQLhOJImMHXKGmzySxe5eMu6uIwMyUVSvMNW2kVfEEkwqKS3ohhLXvJTLl67PsCtwdCm3uorFeDX76BAiop+T7KPc6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FR4McXgkOlSAqCJ9uvF2yk0eXCvYrzh5fQUC3uvtuZg=;
 b=P3/hGtd2a7k3YJY+aK9zi7/PqvcQ2fBQ4CKvfJ2A4N2t9RjeK7+u2aQPru7x0IWMn6YLPVACf2L6BqkXo8t2ipOnMG6je2hcLONitXuQTYlFQTfH9H3xZs0CB1+lLzIL+KkJvfXGLWr94NvHp04syOz8habWqNrFgNqgFaaf9WJ/JXjHyc2b//n0aUc0yiMdorWNMHBBLV82ASVErF+pEAgzPOIEwpONhoJx7HUqnOVULRi1GWUMi3LsncK0AUTLU0moS7zp/RqsrBHcGLgB4JfRou67Uzleuu4Bz8iDAnDA86MbHkZHFzc9t6SdJhocw7Bk2XTD+Yy/ZpROG04Wrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.com; dmarc=pass action=none header.from=kontron.com;
 dkim=pass header.d=kontron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FR4McXgkOlSAqCJ9uvF2yk0eXCvYrzh5fQUC3uvtuZg=;
 b=TGZutf9WgYYVi5kuA0KLrTwcUMpDGVwe2BNCj48XrUGh8jAXScKlzHpBYbQVwMRatxmvsV91NGn+kthvdDifK6TjeHfIJEuAyebCcB6LB9jQdeGwPUij+ziRIQtuVhNUO+3O6kP5E3AboeZC+HJVu9c6gqRY9QFJalrKmcpp5mE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.com;
Received: from AMBPR10MB9319.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:6af::10)
 by GV1PR10MB6371.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:a4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 17:51:30 +0000
Received: from AMBPR10MB9319.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e931:a4ae:91cc:ea1c]) by AMBPR10MB9319.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e931:a4ae:91cc:ea1c%7]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 17:51:30 +0000
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org
From: Gilles BULOZ <gilles.buloz@kontron.com>
Subject: Question : I2C sensor instantiation by ACPI PRP0001, sysfs name, and
 "sensors" output
Organization: Kontron Modular Computers SA
Message-ID: <0a6a22c9-8aa5-68ba-7fe2-206048529e22@kontron.com>
Date: Wed, 12 Nov 2025 18:51:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: PA7P264CA0274.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:373::19) To AMBPR10MB9319.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:6af::10)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR10MB9319:EE_|GV1PR10MB6371:EE_
X-MS-Office365-Filtering-Correlation-Id: c0747359-2ed0-44ca-36ee-08de22141c22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TUU1aXdwZE5KRlVyT0xWdHJOcmRNMjlFWGFVSWErb3Nxak5kNkh4d0VNdU1H?=
 =?utf-8?B?REVqYkRlOUMxQlFjTFp6TTJiNkIweFFiYnNab1Z0SFBFdnV0SnF1TkdCZ2I3?=
 =?utf-8?B?M2sxQk9vRHlqYklWYXFNZXRUbUZ0Z0tyYW82VGZ4bDVYay9iR0hvNEZCZjF3?=
 =?utf-8?B?V1pTRFNaSHZ0ZXZ1aFBpN1FJUWtOdmJhNzlSZzZOYWRFaHNZSkRLd1NaYWhY?=
 =?utf-8?B?ckttaDdMSHptTmdrYmJwaDM5aW5sc3lQd3NmbkZlVFIxZkVVeXJTcEJ6TWxh?=
 =?utf-8?B?Z21qdjlmL040Y2tZblJSUUhCNkZLR0pHcC9TM1NOdUR5d2ErNnZUdjhJSjEr?=
 =?utf-8?B?b3NxSVlXSTQ0V1FEUVNQbmpFTFlQeVI5VlpVRmVTZDY1Mkwvby9abnhycnZX?=
 =?utf-8?B?RFdDRExieUdIMEJZTCtXN1d4S1FYVXpvejA1bVlpdHFEeVZFVFBoY0RnemZC?=
 =?utf-8?B?UGZiei9WM05zNHpsR0JQMFNwZlJZSjZ1M2J2MitqWEVYVERSNzZoQVlQNUNS?=
 =?utf-8?B?aUZ0WXhBMlVRbEk4UUxPYXZzZFIyWU1wcXpQSDhhVklQbkd2eE1WV053bjMr?=
 =?utf-8?B?UjNRejZ6TW5STE1ydG0ydWtCTSt4SXQ2b2tFL3NyU1ZxeEtBN0xiUlhHNVdZ?=
 =?utf-8?B?NU1peXRCUHpiQ3EyMnRkVkYyUlNkU3M5a2FTV0pSaExCM3VabHFZKzNDeUpJ?=
 =?utf-8?B?VmNQRmJJVDc1S3JPNGhhOTU3ZnpWeGNKT0E5cldqb292RmxSRHpKWVpuaFZG?=
 =?utf-8?B?R05kZ3JWSjBrMGp4Y2UrZWhCZFRjT1RuZkZ6L1lIM1FKanIxWkt5Q0gwUDBG?=
 =?utf-8?B?bmdXdDBWcWk5MjFxSm9zMjJ1WjVLM3FxMk1KeGZTZys1RXpqTy94S2dsOFNx?=
 =?utf-8?B?Ty9kOW43Y1ZzWXgwMjlKcXFpZDArTWlBTDRBczR0NkdraVMrb2t3OENFdmpI?=
 =?utf-8?B?NU1Ob1U1UVBPMmtxdysxQnJYdU5PdlhzdE5JMUpjd0dXTEtsbWUzbGREVjd0?=
 =?utf-8?B?SlFnMGoxTkdLTkg5YU0xYXExczhFalIzVnJUdzJaTW5JMkhib2xsRm9qYysr?=
 =?utf-8?B?citRQmovbFZ0Wk9ocXRHWlUwVVhrekkyOW9rdllnbXptRkJxZ0NVbTlpdFdr?=
 =?utf-8?B?b0Mva3p0UWtOeWJHNzNJU3lCelRaS0hXRmI3Qno0NVUyMUhTVll6bWlTTHVZ?=
 =?utf-8?B?SWI1TlpNN01BZmhjOHZxTUtZVU1TbzhPclJpSS9QdXg4dGMyRExGbkhTZWQ2?=
 =?utf-8?B?c0VhQzhlbWwyNWdQSnlrWWJONmJuOTROSTlqZ2hWaXBZWUpPcS9RS1hHMzRu?=
 =?utf-8?B?K21JSmdITXhldWREK0ZDamtJTGgyNGd6TEV0eC8vSUtnSUxLWW44UUtTTW5B?=
 =?utf-8?B?dmhvN3FyTVdTYTlYYS8wN0cvRzNTMUJ6WkRrU2szRENnM2haWUxFZFlIU1hF?=
 =?utf-8?B?OWdpT2loWktncitOM1VhR1R2TlJ1Ujh0R0hlYUJ6SFdWMzZQYVhyTEIrZkhZ?=
 =?utf-8?B?bmN3YlcyWndKeFJOOTN1T0dkUTdlbk5FcnRwclNiQVk4ck5peWV1KzI3OFMr?=
 =?utf-8?B?RE1uY0p2YUY1bnFYRmR5djZsRHlqRnBoWFg1WkNBMTJzOGNMZms4c2ZoOUdY?=
 =?utf-8?B?NmVYcDdML3p5MUNvZ2lEK2tVdzVYY0pISkhmQktLQ1RhTWpCZkpNOWxjckIv?=
 =?utf-8?B?dkV5RExWM3JGSEd5bWdpUDA5UGdIa0szRGp2bUVwV2o5TkpYUVVtVU5NM1M3?=
 =?utf-8?B?UE92WjBmdTIzYTAxQjBESmVEVmFJS1ZGM3BZUjR0aTRkdGVKUi8wL0xJWGc2?=
 =?utf-8?B?d2lHMEgxZmRjRFA3bFpQVGFibk1kajB3Y21MSWJzV0NaUlZrcFd1U21nWUxo?=
 =?utf-8?B?eUpzM2tFWC95N1V1UW1FVndFYTZ1YjRoYWlHYllyUFZBeHd6a2Q2VlRacHpn?=
 =?utf-8?Q?Zj2yN2tVAaqNeN4njg86989mzSI+IMfl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR10MB9319.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2srZEVRTDdjTm5WNU9ZV1E3OTh6V0ZFTkdtK0t5T3dveStLT3ZmVzR3cmlw?=
 =?utf-8?B?QXpvNjI5STJiaU9nT2pxdEs0MGY0d0lLcXp3ZXo3SWdrSjV2NmhBNm1qb0Uy?=
 =?utf-8?B?M0VlblNvME1QWVhOK09NdWdJOFpyYjFJbTZEcnhyOTFEeWpJVVRRY2tFTmxZ?=
 =?utf-8?B?Q2FnNDlEWUdpMlpXTDlSTVFLbFdoQlRMM3NTSzlwL0l4eHFSeVRaa0xVZ0tF?=
 =?utf-8?B?UWxuZjZGdWJpdjRRdGpsdkQ5M1cxTFNTaCtnUGsrTU5uZ1RmcU9IOTlZTndp?=
 =?utf-8?B?YW9GRDUxRlkrWkRETjdZbmNDWWNhM0dPU2JjUVVxQ3FYUlpxRUdrQUZrWnAz?=
 =?utf-8?B?NzUwTWtXakdwWEdGcHJhZFgvU215V21wUU40WUkwdDdLK3pOQnIwcGRQYUk1?=
 =?utf-8?B?aENNZUVXd25xWFNKSHVvbjM3UDY1T1EweUFmRTB1S21YbUpIWSt6SERLc1Ey?=
 =?utf-8?B?VFpTVXdQalRRcXRjQmhBL3NTbE1XcUJuajBrVG1tYmQyZUpuV0Rjdk9JMXJw?=
 =?utf-8?B?M1BubG01UnVVdEx2cm94Ujh3ZEgvU1dMWWJDSjE4S2Y1SHppYi9NQTFhdmxJ?=
 =?utf-8?B?eWZuSnNzWHZKdnB5Sjh3dUJlV2ord1oxMmtOT3JaUk1KQU9jNUxWRzhiZEVW?=
 =?utf-8?B?eDRLdTNLcHpROFRtT0JHS1h3Y2gzVnV5VHlXSElNQTRtMmNwZWVRYzNKdjR1?=
 =?utf-8?B?ZUErTGxWalQzSHIzRlF4TUY5dVJiMVdMTXprcWRhbGlXUmttNU43UEE5Q05x?=
 =?utf-8?B?Wk1FSDlqNlU2cm9UK2NlU3llNHlJMnBTZGJUVk52SlZrcHBlSnRYaithNnBQ?=
 =?utf-8?B?WVBPV2tNUTVYdGlzNG5RRWZ2ZEpucUtLNEhhODIvb0RhVlZRNHBNOFBEZkht?=
 =?utf-8?B?K0o3TGR0ellzMWpFM2VxRDlmalRmUXp4RmVzMkNPazZCUU1jZTVSQ0Y3Wmxo?=
 =?utf-8?B?TVZUazhTTUx6cXh6ZklVKzREbXpwVlc5WXVNZXRIUlBKT0ZiZmhzOTZNNkRk?=
 =?utf-8?B?L0plRXUvU2ZhV1NaaG9LeW9PQ3lzRG9lSTJ5NzVMNFdVdDdVUDBKdnJlVHQz?=
 =?utf-8?B?SzQzVEhvcE9BNVJ2OTU5aGN3WjhhdHNIRnQ5TUJwUlpqMDArVWRoZ2pHU2Nw?=
 =?utf-8?B?cklrcDNPOUk5amR6cjhuMHB6c1ZGSml5M0VsNFlEWE56M2JqRUNnc1QrdDlr?=
 =?utf-8?B?UU4vN0hSQkRKMGZEWktXRlpaa2IvU0cyR3BVU2YySlM4R1FGditYMDVWakRH?=
 =?utf-8?B?UGRrSFExSXVBaEJRb2U1RHpKc0JlRHdQdWVMWVJpbG5TVE05Z3JkSkh6VHMx?=
 =?utf-8?B?Y0VUOG1sR1hBRERybUh3Y0phYk1JekpCTnNCc3JiaXdpWEFlYXVXaGVmZjdp?=
 =?utf-8?B?V0dlRWo0UjRqV1lLelNXMGQwbFBjQUpzK1dvcTRDMjFpU0RIS2VsSnBwdXRz?=
 =?utf-8?B?OU1PaERYMzZlUkdJZDBmZ254OHF3RVpCajlnSzg2VTE0Uk9icW9TdGErV1Qy?=
 =?utf-8?B?RDMzeVJhdE9CQzhReXJzVEtHcUczR0hhVFpndUtXOEIvb2ViR2oyNFlibmx4?=
 =?utf-8?B?RmxnaXdMOWJoR2dKaUtwOXplWkhWcU54Sm9EVzVlYnZ5M051aVVYSzVxbito?=
 =?utf-8?B?bmVBYmNhZ2pIUlhYa0ptdU1vVElEZGxMODF1Q0ZyWUdPMEFWbW42NDl6WWN4?=
 =?utf-8?B?SzdpaXp0U0R2T0pZU21RQmtTNDUrNXE5bTcxZkY1Tit0T1F4dnFERGE3MUdO?=
 =?utf-8?B?dXpHRUJHR3UzdlVRRkoxNHkrVlU5cU9jS1lmWTJLOVQyN2hBbkMzTWlDNjdX?=
 =?utf-8?B?cDA2dTBkREhaeThqcXkrVXJIbDNaWHNoUERibXJUY042dzBJRlZkbmpLVDlw?=
 =?utf-8?B?US8xRkJkeDlBMFZlcEdRRXYrdVlldmllWWt0eGFFZ2VINU1McnhielN5bDBL?=
 =?utf-8?B?ZmhsUHROMUR2STI1U2pYbG91eENCZFVjU2VLdk9VREcwaWd0OTVTZ0RYRElt?=
 =?utf-8?B?SVQrdmRxclJjQUZzUWlNMlM5WDluaWsvdGwzZWsrTTdiamcvckdGM2s0L2g1?=
 =?utf-8?B?bzBLd3k2TXFTV1F0TG9GVm84eHgvMjVnZTdSZWFnMWhYRC9nSkw1RGNTZ1F0?=
 =?utf-8?B?UU5yRnEybzAvOCtORFRjRFJnd3c1YUp0RHdUSnQ2ckl0cFQ1d2JYZTJaZkQ2?=
 =?utf-8?B?a1E9PQ==?=
X-OriginatorOrg: kontron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0747359-2ed0-44ca-36ee-08de22141c22
X-MS-Exchange-CrossTenant-AuthSource: AMBPR10MB9319.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 17:51:30.0673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ZpsLiotA+AYq6xHJQp115tizA9IKrFJVNz3owGtlJzFYaIJrXkaFiSnu8EBLw4FR/d0T/OsIpqeG2DMk38f02eVKGoqtedaS1Uw3l0L2Nw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6371

Many sensor drivers have no ACPI match table but an OF match table.
The chips can be instantiated by device-tree, ACPI _HID/_CID PRP0001, or on the
fly by /sys/bus/i2c/devices/i2c-<busnum>/new_device.
In sysfs, the chip is named <busnum>-<addr> except when instantiated through
ACPI where we get i2c-<acpiname> (for example i2c-PRP0001:00).

But a name i2c-<acpiname> breaks the command "sensors" (lm_sensors) displaying
chips as <chipname>-virtual-0 instead of <chipname>-i2c-<busnum>-<addr>. Also if
we have several chips of the same type, "sensors" always displays -0 because it
assumes that only one virtual chip of this type is present.

Is it a "sensors" issue that should be fixed to at least display an instance
number other that 0 ? And maybe also not display -virtual-0 as this is not a
virtual device but a real i2c chip ?

Or would it be better to name ACPI PRP0001 instantiated I2C chips
<busnum>-<addr> the same way than with other instantiation methods ? This would
also have the benefit to keep track of the bus and address of the chip to
physically locate it if several are present.

Gilles Buloz
Kontron Modular Computers



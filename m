Return-Path: <linux-i2c+bounces-7172-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4650A98D053
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 11:36:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79B00B22D1B
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 09:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65E021E0B61;
	Wed,  2 Oct 2024 09:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b="OKPfjxQF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2105.outbound.protection.outlook.com [40.107.92.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2F61CDA08;
	Wed,  2 Oct 2024 09:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727861756; cv=fail; b=HIiKvnaMlRaNJSr9T3HTThSX3KaSQ0NOLQeeUhGVk+QCHW3jXnHF/M0XTgM5zXa4FGj/F3ualtOHGuwA/mDzudiqCiXIndms6rzIpTCqhLYje4P+pSg4PlBlOskMHopxdigtkpa/cmKCv+sEVmgWXffg4rxsDe6NsHUaV9RsRaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727861756; c=relaxed/simple;
	bh=KHCeCt0w8NUvYNSlMS3b24i+NE4CFAurbyHDB6RWh6w=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=UMmFwxnwz2zScQmgc5lvWad9XTL2tOeHBfVncYcYc+1PyaOg3PEsMvjTZVhQUcwrb3fhn7Gx6RVRyFY400f+sWx8V5XWWB10q0RuRpsQEf9aMxZhZhg1hwKEBjAnQd8727xVRhWX1W/3krFLbFuBWwxSPHV/rgiCnGM7XFTXtjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us; spf=pass smtp.mailfrom=kneron.us; dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b=OKPfjxQF; arc=fail smtp.client-ip=40.107.92.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kneron.us
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uM8ra5Nxda0NjB90IBgfYqHpXXZW5nHBid3svp08j0eOyxjV5ROiZMlOzeWu8IeokhSSOgUT09th5LsohUTA6S2DX9YXrZhn9PpifPQzEhdYlI7DUhJjFcYOSpqf0TnbvH/B0y5Y3ZXQvtTNKUHGM0bFCbd/T6r44TW443wc/wbnl8JjpeH3njjEHFtqGXE52N4MoUvZhXcREry9Okg8inQHk6yKk3x+YGhFmlOVWoPpva1sIbrXnMydT2+VGz5o45H/OpidUp2/E715Oxem3YQh054hx+/4m2bTBmPsM1TCqE8wpnLiWfqIzcRDDiAhFmgzCJ+HBolaVKXUJpdy/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KHCeCt0w8NUvYNSlMS3b24i+NE4CFAurbyHDB6RWh6w=;
 b=S4Kgmm1loWFw7vTjnE4Zi7fZcmZahm1Aq1AcwrvRVs1h0WLo8Slj/bw6TdefpUxzY2Q1iKhLHAoGhfiWdUPRRqWe7fNf+pjBqNQ9YYYh8KQK39Dfun0tLVI3i+jIvnR2+22b81UUXBBveOZD6LeWnbtbKDzryWioYv19uN9PjneJ+BWX+DpzipVvgG3lK4SYM0TAtc819e0gEqwzxMPYbdFjFKim6NFYs2QwnzxFoP0dI8XmlV2lr6H90qlqDlCRoOAsrDJvGfqVEZEsc+kYUz8D2/jhdxKos0q4oCBiQ2ajb/Tl2GUnLLL8eI5BwSYYGrC6qQf5NwLyWHw+kGKs8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kneron.us; dmarc=pass action=none header.from=kneron.us;
 dkim=pass header.d=kneron.us; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kneron.us;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHCeCt0w8NUvYNSlMS3b24i+NE4CFAurbyHDB6RWh6w=;
 b=OKPfjxQFg0lGkahIfZD8Fvz3hL2vvN58ogDwhXy3VxxdqFxBkvR9xTSYh2f07EM61VLmuTxRROqyMyjCpIWkAxSaPb0hUzlpvvog08Qu+xmu5kKh2aO9V6D8meKJtNPoAx9VKX9hLahhjCH0Sg9tDV9e4uvDxidhqT/BGl3Zs4Y=
Received: from IA1PR14MB6224.namprd14.prod.outlook.com (2603:10b6:208:42b::6)
 by CH2PR14MB3722.namprd14.prod.outlook.com (2603:10b6:610:6b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Wed, 2 Oct
 2024 09:35:52 +0000
Received: from IA1PR14MB6224.namprd14.prod.outlook.com
 ([fe80::c527:653c:698d:3d94]) by IA1PR14MB6224.namprd14.prod.outlook.com
 ([fe80::c527:653c:698d:3d94%3]) with mapi id 15.20.8026.016; Wed, 2 Oct 2024
 09:35:52 +0000
From: Michael Wu <Michael.Wu@kneron.us>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Mika Westerberg
	<mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, morgan chang
	<morgan.chang@kneron.us>, "mvp.kutali@gmail.com" <mvp.kutali@gmail.com>
Subject:
 =?iso-2022-jp?B?GyRCMnNaQBsoQjogW1BBVENIIHYzIDEvMl0gZHQtYmluZGluZ3M6IGky?=
 =?iso-2022-jp?B?Yzogc25wcyxkZXNpZ253YXJlLWkyYzogZGVjbGFyZSBidXMgY2FwYWNp?=
 =?iso-2022-jp?B?dGFuY2UgYW5kIGNsayBmcmVxIG9wdGltaXplZA==?=
Thread-Topic: [PATCH v3 1/2] dt-bindings: i2c: snps,designware-i2c: declare
 bus capacitance and clk freq optimized
Thread-Index: AQHbFK54dd6gWkT6HkueyH+2GIsdYg==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date: Wed, 2 Oct 2024 09:35:52 +0000
Message-ID:
 <IA1PR14MB622406104B94E02F5C40A3888A702@IA1PR14MB6224.namprd14.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kneron.us;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR14MB6224:EE_|CH2PR14MB3722:EE_
x-ms-office365-filtering-correlation-id: d8bc1b47-876e-4a46-1d78-08dce2c59b62
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|80162021|38070700018;
x-microsoft-antispam-message-info:
 =?iso-2022-jp?B?NVVETTREVFRJUWVFaGJHZTU0TkVVVnE2Y3M3TlljRDlSQ0RqQlFEYWpl?=
 =?iso-2022-jp?B?VWFzbDJEcEUwa2FXN2RSS3gxVXluWlQvaE1xcjMzRnVrYldtQ29sUFNP?=
 =?iso-2022-jp?B?VXAyV2hwUms0aU5GV0dOM0oxZmVpb0thaXJ0aUdiQ1dmK3lONkp2TURa?=
 =?iso-2022-jp?B?ZmhqLzlNQ3J0UWhRazBmZ01TNm81dWxxdEtreDUyVEU3di9obENVdlFi?=
 =?iso-2022-jp?B?NmlKbkJraExXaStEMExWUXdxY0NsWnVxQlBKaWFVRXM0MXhMMGNWOVVq?=
 =?iso-2022-jp?B?bmx0ZFRzYW5WRG5ETkZxYjhNRVpVYVpIRlR3ZXc3NmVYN3JOZXNweWMy?=
 =?iso-2022-jp?B?dENzc25FRS9tK1JUN2ZyYjdHcCs3T2VZd1YvZGRNWXlieFNYb3NaT29R?=
 =?iso-2022-jp?B?K2RpRFNxMjIxZDhUMnc5SWFUT214akc2MmhaMUZ6V0IrWjZ1cGltZUNZ?=
 =?iso-2022-jp?B?cnRGZU9venFzZ0NsNGhabzUwSE0wUGFudk16OVB6VXk3OHFCbTJHUVEw?=
 =?iso-2022-jp?B?a2RuZW9zZ044SDQ4eWhrc05BdWZTZE1KVXpoRUJ4bTEwM0RQWkRoZzY5?=
 =?iso-2022-jp?B?Nkg3b0NCMVJicytGbUh0V0h0K2dVMDlaVXBFMncwWXo2QUMrVUVWQ1V2?=
 =?iso-2022-jp?B?ZURTQVVVbVZrcUJFVVVuSFpBZEtVU2diWGo0djZvYUJ4M3BMbFlSb0hN?=
 =?iso-2022-jp?B?bmNySHJKWHZSMmxRQmJUcjcxMFZjeWVPUmk4RVFPTGxoaC82SEphbFpL?=
 =?iso-2022-jp?B?MzltVVhEOS9nSC8zT256MUdPT1dRU3NITEFad2FkTlFJNVlMcDVhbW9m?=
 =?iso-2022-jp?B?Z203dDkxMFNKLzUxRnc5Tll6NGVtTGxwaElmdzN0TUlwazBseWZuMmdK?=
 =?iso-2022-jp?B?RTdaZnlVU3BreGt1Q2dVL3oxTlFCeGdiSGM5dE9MS21Ub2xrWDVWQ252?=
 =?iso-2022-jp?B?Qlo4cXpZYzlFS0ZwcDFuc1VFWkhMZldOWFNhb2hYQWUzdmpjRzIwRHV5?=
 =?iso-2022-jp?B?cTI2bGE3c1JwUDZVWUFxeTVhSTlpVlMxcGtGcGpVeElJQzVOUjhOakNS?=
 =?iso-2022-jp?B?VGxDaFhNbDdFN1A2bEVtcXdQVFdTR3h2S2hyLzUveFkvN0VOSW5FeVBZ?=
 =?iso-2022-jp?B?c1QxRnp1bll1SjRYMnBhTi8xV3FqYUh4Mk5yaDFMTnV5ZGxTdDNaLzdu?=
 =?iso-2022-jp?B?R3o4ckEzT2hFSi9ZL2FDTGg5V2E0L0FYdnViZHh0Q2l1TVBBamtrUUFt?=
 =?iso-2022-jp?B?RTRaRzhpKzFjdklVQklxWUd1YUY4U1gzcXEwNjlHOXcxYVJRNkFYY2pY?=
 =?iso-2022-jp?B?Uk5VV0xsQUd3dFczMkFSZXNnMGhlNWtVZWxIcG9ONTlxRVFMd1RCb0hS?=
 =?iso-2022-jp?B?VU42RHA3eUNvOTFkOFNtUjZrNzBaUmpJNnRqa3NlcTBod0ZJTTd0UkVF?=
 =?iso-2022-jp?B?eS9aOFFnNlViWlNpeFhNb3RVa1NzUmEwVlIvS0NHUGc2YklSZ3hiMmZt?=
 =?iso-2022-jp?B?ZTFLYjBZRkxRWWU2OG1zK2dkZVE4S2hOcU9wVHpmdE9iRHJIdjFRY3pn?=
 =?iso-2022-jp?B?OWdydU1Jd2xrUFNmYzZ4M1EzWGJmLzl5bkpzSjR4T0NiRzBUM01lYktD?=
 =?iso-2022-jp?B?VHNQTVg2UXM1N0Vjb2hwR1RleDhuUGRxZ0ppZWhRcitaNHRZUW1ZeFNo?=
 =?iso-2022-jp?B?dHVKNUZmSzRPYjJkMHJFQkdlUFFmdXF5NXNEY0ZPSGN0SEV0OTBVZitL?=
 =?iso-2022-jp?B?aHpqVXF0VUN4K3pla2xleGtVZkluQWRsMkdGUnJXRnJQNFF3Q3BWV21C?=
 =?iso-2022-jp?B?MGxTSTA3NjJyZVdFNjVwc3MyR0ZEWksyRGd6OXJudjE5b3lhc1pibFI2?=
 =?iso-2022-jp?B?NUdPM2I0NTI3Z0licmtKYkFETmkzYUtFWGlYQm03R2VLNFA3VzR0VkRI?=
 =?iso-2022-jp?B?OEgrc2FTbEsvSmR2NEwzOUVmajg4RmtsWk04bGZYa0dXOXJIbmVpVFZL?=
 =?iso-2022-jp?B?Zz0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR14MB6224.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(80162021)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?MnZJU2Njc0R3K3ZvYzRyTXV0bE1VR1g3ck1xcnkyeThsSS9wN2laNENt?=
 =?iso-2022-jp?B?enVPczkyeXE5b2NPVFduKzJGUGF6ZDJEOVRxT3kwTWoxWUdjWWpkREQ5?=
 =?iso-2022-jp?B?UVdOQjQ4OERuTm5FZ3R6d01tSXEwNVVUSzZhQ0F1OGxsR1dxckZUWFFi?=
 =?iso-2022-jp?B?dWZFZ2pZOEpPcVB2UlB0aGxma2orRWUrVUxZUmdEcnZoMFNjejBLREln?=
 =?iso-2022-jp?B?OXBiOVlSZ2ZWMnhhbFBCQzl5SGFqaGZwWlFFRU1HNzV2SzBKNjc3YnE3?=
 =?iso-2022-jp?B?OGh5NkFyS0hOTC9nWXQyMEhsZkVMQlNCNHBmY0R3OUk1K3ZDQUVPVnhi?=
 =?iso-2022-jp?B?Z3hUaG5EMExnTzhDSW92UzMxeU9qYzVpUjBoWFNLMDFYV2YxRTA1MXNT?=
 =?iso-2022-jp?B?SFIwa1lHQjRmY3I2YnlxVGxJZy9FZi93UXREdTZSbVQ0UGs1d3B4aFVt?=
 =?iso-2022-jp?B?emJiYTJzTVJ6Vzc2US9sWTd3eldERHZFWitGZmt5L3N1ODN0eVVzM0dq?=
 =?iso-2022-jp?B?YmRla2JHWFhQOWcrLzBXQjNkQm0vQmZkQjVtT2JWN1FlYVpPSUwxdE1q?=
 =?iso-2022-jp?B?NEk3TzBmdTE1aWlGRFlzd2tvT1FhQ3BWWTRodzV5M3B4TVM4anRZdDBm?=
 =?iso-2022-jp?B?V3YyMXUxSjJsQmhBSU40Y3ZZV05KMGk2d3RYVDhjcEhuY3g2MUlhQXJN?=
 =?iso-2022-jp?B?emlzQjdhYlY1NC9ENmZUY3BVNERjSFd0YkNHemlzV2ZPaUJmcXRITktF?=
 =?iso-2022-jp?B?RFRtOCtuQjFlckl4YnJNNUpaeGtKSFNzenBTRkRCSzBxRWIvMXlVa1Zj?=
 =?iso-2022-jp?B?Q1FLRFNmemlYRzlCRmNpY2puZERMRzVObm9vb3FOdEtGd1VwU3BUT0py?=
 =?iso-2022-jp?B?ZkN1dGxYOFpLeFR5SHV4NVgwd1dXWVdIcTlDWHZ0ZFpKQTMrcnhFWk9i?=
 =?iso-2022-jp?B?WlZQNEdBWlIra2FEOWp2eUxrY3FjejlCb2FzckxHS2llcjdXRHNZODN1?=
 =?iso-2022-jp?B?VVBJNkkwanlXKzgvMDNWQjJ0Wnovd3FEQmlJYjc5bFJCUXFFS1UvT2VR?=
 =?iso-2022-jp?B?L200QkZPbkRHQkJRYmxzL3phcGJ1UlI2cC9iU09Ndnh4R2VnZXlTSzhH?=
 =?iso-2022-jp?B?ZDkzbFRZMVc3SDU1OUFpSXVqZUV3cVZaY01WQW5HdXRxRDRaNEMzS2lB?=
 =?iso-2022-jp?B?TE5meWlLNm5oa1g4Z2hmY21HajUzZmttdW5KbDRyei9EZ1ZmOFhyUFZy?=
 =?iso-2022-jp?B?VnFBZWVVR3l6S0U2WmdxUkwyemJaUVZNZ01qcWFVQ1l4WFBneXRPY0U2?=
 =?iso-2022-jp?B?N3ZlSHFSdGYxWXFyNUlmTE9LTStmMzM1MFJlMUwzdVBLRHBNdlpFMG0z?=
 =?iso-2022-jp?B?RDRxclRuWUNnbmljbFUwY0VjUWFHZHR3cnV5ckVMcXZCQVI4UkdxV252?=
 =?iso-2022-jp?B?emsxQXZNMUpkWVMydUlUc055UWRTaVY4K1lUSy81eVZNSUIyTVYwUjFB?=
 =?iso-2022-jp?B?ZTMxZEtuak53eURqaDJRTFUvK0JGQXBUR20vSE95WHhJTUc1NXhFbGZC?=
 =?iso-2022-jp?B?QTA3M01WeUtkYnF1MHBSU3JFQkxzaEs4R3RLMkJrRHEvN2RIRThONzdT?=
 =?iso-2022-jp?B?UDJPVWJIRUc0SWlFMUhQRElETVZyRktFa05zQlhIa212NlNnbUJkeSt4?=
 =?iso-2022-jp?B?L09pMmE4ZzJjaXB4emtZQ0dkTHFpcXJQQlNkRGx5SXNwRUxzbjljd0o5?=
 =?iso-2022-jp?B?b09GNEFhM1dKaHNMWUY0RnRsRDJORzFaS3lZUlluYzhIdmNkbkIxUS9n?=
 =?iso-2022-jp?B?NFBRMW9DUGZFakN3QjZaVllrVTJGc1M3M1lyQXRBYUdYRVJTVlpndVVG?=
 =?iso-2022-jp?B?MmQ3UjFyc0FOU0ZydnF3VlFzc09ld2gzUTExTHBhQk01SzFmU3dLMUF2?=
 =?iso-2022-jp?B?TFI2Z2UxMG0zL1BLRG43TVFNRUd1RkU3eTRIVHFScE9BSmg4ODY3WlJS?=
 =?iso-2022-jp?B?TDE5TXdiRjJrTHA5REJGckYzeXIvZHpRV3I3QzZRWktxaXFLYmFvTkhB?=
 =?iso-2022-jp?B?dFo4UHFYMGl1K01YN1E1cHVzR2IrbGQvQTF4WlZaNzFEZGFDb3U5dCtR?=
 =?iso-2022-jp?B?RjRJbmhsY1d3SEZhRjEvbmVkN1NML3dVR2RvSUJoeXVrMzJoU2xmN2Rl?=
 =?iso-2022-jp?B?ZzlIeUJLbWpsblNNUk42Mk5ncnhXMkZuektTVEgyV1hQL3FBTmkxVVZK?=
 =?iso-2022-jp?B?WXZadEVYeS9Gc1dMRnkrSFZPSDV1YS9zWT0=?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: kneron.us
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR14MB6224.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8bc1b47-876e-4a46-1d78-08dce2c59b62
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2024 09:35:52.2511
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92b0f4b-650a-4d8a-bae3-0e64697d65f2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rMrvX21DEAbzH0rhS4ch7TrJgGA3hZcNLq8zNOw4BjkvaRuW+PA99YTdjG3on5lTGhddKh/Piv+1skCZHUf9yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR14MB3722

Michael Wu =1B$B4uK>2sZ@GgIuM97o=1B(B [[PATCH v3 1/2] dt-bindings: i2c: snp=
s,designware-i2c: declare bus capacitance and clk freq optimized]=1B$B!#=1B=
(B=


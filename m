Return-Path: <linux-i2c+bounces-9110-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6485DA122E4
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2025 12:42:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 434BC3AB6EF
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2025 11:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 550AB241695;
	Wed, 15 Jan 2025 11:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sblwkLOV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B9822D4FB;
	Wed, 15 Jan 2025 11:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736941307; cv=fail; b=VrlsUqPC+ZChhcDOCORdzZLlk0rsY4IE6E+CHpNS/AGoUSib6GfmQIHkD/kU7TwfKIhax1KSyEZT/safd5dSHATpMgauFmMfHgwgiMmKBPpQQw4xbJ1LyuIHPLd7w21xpNv5k3XUXu4KPnP/GEALJ8IewnsBXAdV78n1K55Hvss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736941307; c=relaxed/simple;
	bh=OKL0Y8q7E3dZ6XPoW81VyKU3dmbpYaYSm0TTSnx9q7E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Q/Nepku+L/vXuzpyJzLHnnHsrgxYxOay+7tDoFpqZH1TiHnEBZfAstR4eSqV7vJbaQ9qkhYlE1tsYLxBNXbw87HtPJBJzPvnvO6KwMiw4FO+1ulyy/7o1JUGCYCtGPwBV2rXbqqY+f3hzePEfvtFjEEqIZmX/Vim2rfkaQ9/Cek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sblwkLOV; arc=fail smtp.client-ip=40.107.94.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VI8avjDzflFU0u0KtNCWwtDMz7Tjx5X7pJAH4wEiR/8NDiNW4ojtHiMu1dBWXufF8kVggwsD1/YLUOnDz6aeAuELWwUnjQZVldwyLEdhux1TFW8HdYn7Aqnw2MYygn2r3bhk4/o5ewbMgN9561UzDKxxQzrDReZ1PTOETRBqC/pPCHVRcSieRTxnCgQXKkRwUIk3/6NPvmB7SAYhHi/HVEx7J6Lneh3q0pXZz32Fvuo8TaDrfuNiCrzCMrr6mQ7GLlGj3Yp/OLigXdHsjy7xokr98csH1U+QZzhg2irWNXjW1PynnrPgPYsr03+9PQPP67CUp6q7hHQMDyEfnmcFSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OKL0Y8q7E3dZ6XPoW81VyKU3dmbpYaYSm0TTSnx9q7E=;
 b=ke9zoa1fIQJG6K5elGrlq8OeYi/O1MukINIx27BkSR9ZRuLVpNVr6q5tmlUFtvcCcx67xFMsxWWQqu5uM/8j9tSLbgWwlH96v7AWk4TQwidUKG2rnuZWCuFVsCNOKJoI6keQ6RmuwaSLtATHa4r0pxVNIfbdUg/jUWZP3qekkrT5kYBwAwLS5X779BS73/LSmedxivtAXZK8k6b0Ic3XSEBSqCvQHmbn6d7VbPcFKSQXkBe8phlgmGXVHIuRThE7K7d9SI9OFwMXzfBUKRCe+l0H2hibDi1xglcQesO4WgJMOtuiPFbeJebBSN9DHozLRmVfdKoO7PnXBxCW0R2FGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKL0Y8q7E3dZ6XPoW81VyKU3dmbpYaYSm0TTSnx9q7E=;
 b=sblwkLOVhuQooIAcJAgLmWNXFAlRXTXmFDLdVrT0FHBIe+bkEUi2cVSxTQ13PtqMCF9e8QBEfuTUJLnCDWP7R+z4itxPeUgLxtJZQl0hh3dvKz+ZKtRlOUcN47wmc+b5bKAKSHwL5dYEGvp8j4WRUHwNfxBkTL9EA7dImtJn6EjaXShleIeXWYdVaAjpZQ4llrFjFJQj2kjLjv9m6u5UT0QsZx5XUSIMuHh5UfTsrbDuOrETvurqzMonqcDRMa/yfBqT7KwJk69aUmjZeOzqCyfEsOUoTm9PIn2kwLlGXiuXtOk0SlCjhVMhNjn8djs0yvynw3mYRJuonxnv9pD/yQ==
Received: from MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 by DS7PR12MB8249.namprd12.prod.outlook.com (2603:10b6:8:ea::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 11:41:43 +0000
Received: from MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861]) by MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861%6]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 11:41:43 +0000
From: Kartik Rajput <kkartik@nvidia.com>
To: "thierry.reding@gmail.com" <thierry.reding@gmail.com>
CC: Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
	Akhil R <akhilrajeev@nvidia.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "andi.shyti@kernel.org"
	<andi.shyti@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "digetx@gmail.com"
	<digetx@gmail.com>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 2/5] dt-bindings: i2c: nvidia,tegra20-i2c: Document
 Tegra264 I2C
Thread-Topic: [PATCH 2/5] dt-bindings: i2c: nvidia,tegra20-i2c: Document
 Tegra264 I2C
Thread-Index: AQHbYe0CSkwmd+clk0qB4OpVv0I2lbMXwQMA
Date: Wed, 15 Jan 2025 11:41:43 +0000
Message-ID: <16f40c7c5d6417d1ae0f687b4954e26cbe36a0f4.camel@nvidia.com>
References: <20250108110620.86900-1-kkartik@nvidia.com>
	 <20250108110620.86900-3-kkartik@nvidia.com>
	 <s3jcfkbfffbvumolt7rewbxfysr6q5kcmgsywfhnfshgjumv3b@j4ft2l4ux33q>
In-Reply-To: <s3jcfkbfffbvumolt7rewbxfysr6q5kcmgsywfhnfshgjumv3b@j4ft2l4ux33q>
Reply-To: Kartik Rajput <kkartik@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB5716:EE_|DS7PR12MB8249:EE_
x-ms-office365-filtering-correlation-id: 0bdb41da-50fc-4ad3-975b-08dd35599573
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eTNROHpLNlBWbUNJVTVhc3VzVG5hZmJGZ2ZYRlExVEcyZVlSL01aK043bHI5?=
 =?utf-8?B?UmRvWHVOd21yakNEcm5KYy9CV2VkVE5oWllHSUFrYjhQVzlRMm00eHd1T0ZH?=
 =?utf-8?B?L0J4VDh5Sk9GVlpIL0dVTUJOMHRtdmNIR0hvemMyM2JrdTMzVS9zanJ4RGVW?=
 =?utf-8?B?eDJNbURtbnRabUxmaGRnVmd5c1dXME5DOGJvbFNMYzJJNGJiS3F1WnpIOFda?=
 =?utf-8?B?YXc3M1l5K2tmbEVOVGM3VEVXa0dKVEY1WnJadDdNTkl6ejdtam9nejlRaXg5?=
 =?utf-8?B?a29DWGtjMXBpUC85RzdWUFJOQUhCbGFoemQrem9uQ3o0TE5XQUViQWQ5RjU0?=
 =?utf-8?B?S1d0TnpKcGZiRmFNMHBLREJZZFVYQkE1cWhGdU5zK0FWTk5OY2NURTdseW1Q?=
 =?utf-8?B?bXUwbFg0U3NLdXcrWG5MSHJkbHB4bWIzYVNKRVZwR2dYTGNIUXRIL3ZnZE1H?=
 =?utf-8?B?Qm5CeVY2eU5hZ3hHYk1mV1RMbHgzNm1hOHNnMEMrTDZEQ3lQRUNWOTA3Q2hK?=
 =?utf-8?B?bDE3QUdwWFJPTlpoR3hsSXRjN1ZEVmtKbFBwZ2E0NXJMRjVkR0RZVTAyRWlm?=
 =?utf-8?B?bHZSM3pMK2R1dlRpamhCN1A4UWVkbzdJTGxPTGFSVkFOdi9DWmtnaGFxQllV?=
 =?utf-8?B?aHYzREJEckk5eUJ6Z2JZZ2dIWDJ2Z0tpNDFOZUZWU0hTK01nN0s4c29sMTFX?=
 =?utf-8?B?cWZNYlJTd1lNL0NjZHlBUkZvTS9wUFBtd3pqK3RqbFl6UUw3WG5nRkF4M0VO?=
 =?utf-8?B?eGN3SmladlpsQUpMZHZTTkRMMmZQM0p2aTV2cElmb2IzT2lDU1hzRXVKcTNn?=
 =?utf-8?B?RG1TYTBwb2JiRUJwSVVHSW9idW4xamtSZnBXeFFWUzJPWGkvdmVlUUI4NW1N?=
 =?utf-8?B?dFdhNXdUanJQaXJTUlo1L1RDSEFvd1AvV3ZUdkpBVXU3WGZTWWtOekR3Lzdu?=
 =?utf-8?B?UGRJMVZBRGhFSEpHYXdXT2ZCQjVFcmMyZEV3SXNGWlhTWTQ0WGtnTTdyVFY2?=
 =?utf-8?B?bmYvOC9JcW96eHBMdkk3dTBqbmxJd0NZZzI0UXZPdW1WODZiN1NRT2xDQlNK?=
 =?utf-8?B?bGlXSjd1MzI5eHRaekF2WVM1V2pTRXFreTdXYlpDSUpnenhMYnNHSjhFcVRv?=
 =?utf-8?B?dERuQkVBOGgyTkRReloxeDExKytoTEgybUVwMnlNWVNKZGpZMW5QZHEwZkZO?=
 =?utf-8?B?cWVobUhJREdIYU43QzZGaTdKZ1VISTNoN01GUTJSemh0UmwyUTlxTDVkRGR5?=
 =?utf-8?B?elZ0bTg3NTdKdGJWRWV3UGNncWY0MG4zMVVjRWMxc3hYaTFLT1pDcXlnU3hY?=
 =?utf-8?B?MzJ2UFlTc2d5bXY4SkVLVFA5bWp0clhJWCsxbGZlZHVVZTFhZmg4Ky95N3Zt?=
 =?utf-8?B?TmF3YldwMGpCa05jZ0dLNHkyZnd1QnZDQURQWCtId3ZjU1RJNGlTZHdxeWxD?=
 =?utf-8?B?UHhQb1VuR3Yza1RiNGpJOEZXM0RtWDBqcGNJSXg3ZEhXT0JwTTg4QUJXQVgr?=
 =?utf-8?B?WFIrbWVaMDVrY1hLUkN2aklJZ0ZIYzlFRy9zcXcyVVpLR29OSktUTlM1WXBY?=
 =?utf-8?B?MEdDM3VIYjVtRnkvM0MxMHJqeTc0RDcvRVZodGtGZUFJRnBSbDlJSlNDM29T?=
 =?utf-8?B?alB4Tk15WGttdFRxVEszN0U0eFlCV0ZFZDl0TytnbStpbk14bkxiK3hHZ1Zl?=
 =?utf-8?B?aExMQ1p2cVYydXNoYXppZ1V4MkZKRkZYdkRabFRkbXVCdGh4V1pFU21Ndmlo?=
 =?utf-8?B?QUhoakJaV2Z6UExKVUt3eUFZbG5kdy9MNkovQkl5b2VwVnVJTmpJMnFjMmo1?=
 =?utf-8?B?d1pZdElTby90OXNQWEFIZXJ5cWVnbjZoY1JMQlNmSTVmMXN6TGMvQWNMRE85?=
 =?utf-8?B?dE9zb2dOTHp0aENDeFE0RkdBaE4xNFJqVVR6MVpldDhNY2ord09yQ2xNK3hC?=
 =?utf-8?Q?cPgcw5SaE/YOqnhxDMW3/j01q6vPwOY+?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5716.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MFdSbElJU2N0M1NqQ3VBOGJobXBaYWVraUVZMEJpVTFZbFF4M29pTUtpbitC?=
 =?utf-8?B?VzJ5eXRtWGxjMGRwYXVYazRkRGRsQ0JteHRzamltbXFaekx5VXJJaWFJdU9Y?=
 =?utf-8?B?dkc3Q1ArTFJPN1M5Y3N5TEt2dXBuczNuaGlYTFJveHVYUWFuYzU2Zi84bGxk?=
 =?utf-8?B?TkdOdEVVNHAwaTZRdksrWGU4dVFuRXQ2WlFjVkFYbXFvMm5ha3NCQ3lYZFk4?=
 =?utf-8?B?K1IxUzE4VDAyWGhFSzd0UDNkTEVpQXNhbkdReUluVjdsMDlUeDB4SndGMWdW?=
 =?utf-8?B?RUd1ek55QzVKYWF2QS9Ua016TlhNeEJhZEZNZDZSa1RNcnFMbG1rRVZDblFR?=
 =?utf-8?B?cWo3S0FUOE00WVRldEZESDZRcWQ3dUs2Mkxrbi82MGRIS1duZmhqWFRoL294?=
 =?utf-8?B?QlRGZk1EM2xoQnU4N0xucEdMb3pZcTNxVzFrcnp1WTdtMmpBTzZvMUFjbDB0?=
 =?utf-8?B?ZXBLdHlkL0xPKzJjVm9GNkZvNVJweHpqODJRRTNCZmNBYkliMEhsNE8vOXM4?=
 =?utf-8?B?bjYzSmhMcG5CZjBvL2FtaFZ5NTlRL09COXFvdTA0N1JOdVI2QjJOMlkxQlRT?=
 =?utf-8?B?WHlCWm5QSEh4aUhJcHg4K3FVT3RYUlVXOWZmWDY1NDhVbERNT21oUEFFYU1a?=
 =?utf-8?B?VkZvY2VGbFNLcWhwbEJoU3h3QWticElUaDVJN09FUTdUYkJoZ0dlMnRUNHBl?=
 =?utf-8?B?V1lCMHhONHB4eDhoV0ZEeHJaNTZET1FEV0JXRTZMMXA3L0daN0dtdnVTS2pQ?=
 =?utf-8?B?aEFYMjdLRmlhUENiMlRmM0NpWkw4Vm5mNURWM3phNVdEK2tLVjM0VXY5Z1Zw?=
 =?utf-8?B?ZG5XRE1nd0F5NWUxaDRGWEt3aytONGZuV1A1Ung5TmpQa0Q2a1dkN2kweHli?=
 =?utf-8?B?bk5MQ2xzc2s2MEIxcGlidDJQVGtBZUo1eEF5Nzk2S2FqbWx3RWF1RnNWaVN0?=
 =?utf-8?B?S0MvUXRlRTVuRkV3ZnZpMGxaaCt4dkEzTHk1VDlwOU9OQXV4V3B6Z0p6ZXJP?=
 =?utf-8?B?QjJLZXVabWNQU1ovVWxKbGR3aGUxTnIraU1WNUM4YVFBRXZJcUhIZUtGRVk4?=
 =?utf-8?B?OGVMTmRTaVE1SW1SdngwZWpGdGlENnRvZU1EVmJXbDAzaDk2UjQxT0tsUTN3?=
 =?utf-8?B?NDByVnN5WUIycWd5MDNVUXVTTHJPNFN3dmV4NjNXQXRYYm5pY0Y3bFVlVSt3?=
 =?utf-8?B?U05RU2NDOGF1Z3R4Uk1hTjFaVm9Wa2s4NjE0cy8xVW42aEJyQmJLYXhOVEdv?=
 =?utf-8?B?dlFGL1UyQUJGOWpib0dubHZwdHQvZDFVL08yQlhDK05JWnVFeEkrWUdXRDhL?=
 =?utf-8?B?TUhNbmFrRUZiUExqbENoTE9aOVpVTnZpaHA3aFdEd2VOOXdlZ205VlJaMmF1?=
 =?utf-8?B?clVuRXlYclVwVzBPb0Q2OW1teTJ2V1A2dXpWY3lsUTllckRKYTZHczZZdWtB?=
 =?utf-8?B?a0RnMkJaZFMrOHMxQkZ5d0RMVDlpVFQzWEdHNWU0cmRTZEVESE14UkRPenNr?=
 =?utf-8?B?Ri9Qck5VM0hXS1hDUGI5Q0RzRXg1Znk2WjdzTFJNUGhCaldielJmRHZKTmJP?=
 =?utf-8?B?bUVlbWlONjN0OGxsTTRXeTZTY1p6dVBrYnNYZFBnLzZMZVN1azNqckpWNXg5?=
 =?utf-8?B?SVpjSnBJbk9oTVJjYmRwaUxOdmtyS09KNms5cFk5WFhwUkdTWlVSemY5NS81?=
 =?utf-8?B?d0FsODB4emJsQU5jN09iRnNCMlhQL1EzemZ3N1UwU2ZDWklrUU1Pc1lJbTZX?=
 =?utf-8?B?N0ZlWlE1Lyt2NmFFckhqUW1qaHR5djRtbVh4WFo5Q29oQ1ZYbFZuVnhuL0dW?=
 =?utf-8?B?VkZXTlo2YnZRYTdjckg4RzN6SUZZUW9pd3NGVmRQV0NPTFRERDNjYnR0YS82?=
 =?utf-8?B?U3FDdi85TWZ1RSt5MENGQmhoNEJiYWw1bENSVGZVVHVMT0ZidEgyaEczS1pI?=
 =?utf-8?B?OU1nUHNmejVFZlM0UElEVlEzR1JTakF2SDMwUEkyVXVkVDFFQWxEOW5SK3Uy?=
 =?utf-8?B?S0t5VjZ3Y1VJYXlpSHFCOXozNWdTQjBuZUFXaXRTUS9wT1RUL1RGaGVHaEQy?=
 =?utf-8?B?cFMxWHdwblNwczBtdDFZN3ZISU8xVzZUSGhlK1FZTzU5TWhZSzVkdUFMVmtV?=
 =?utf-8?B?R212WmxGZHZDcVd4Y0h4aFNRTmNhUGN5WWx6SHFacDcwR1hJMlA0S2Y0OFVS?=
 =?utf-8?B?akE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <44FD391D9921384D9776E8E5FF145C06@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5716.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bdb41da-50fc-4ad3-975b-08dd35599573
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 11:41:43.1940
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9meKrZGDnBqpsciM9LroNyoNoJoSzRzePpoADNy40RwDd7AO9PghWKTOsPMLaTB9KX135SAnqsxIv1vAVzajsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8249

T24gV2VkLCAyMDI1LTAxLTA4IGF0IDE3OjQ3ICswMTAwLCBUaGllcnJ5IFJlZGluZyB3cm90ZToN
Cj4gT24gV2VkLCBKYW4gMDgsIDIwMjUgYXQgMDQ6MzY6MTdQTSArMDUzMCwgS2FydGlrIFJhanB1
dCB3cm90ZToNCj4gPiBUZWdyYTI2NCBoYXMgMTcgZ2VuZXJpYyBJMkMgY29udHJvbGxlcnMsIHR3
byBvZiB3aGljaCBhcmUgaW4NCj4gPiBhbHdheXMtb24NCj4gPiBwYXJ0aXRpb24gb2YgdGhlIFNv
Qy4gSW4gYWRkaXRpb24gdG8gdGhlIGZlYXR1cmVzIHN1cHBvcnRlZCBieQ0KPiA+IFRlZ3JhMTk0
DQo+ID4gaXQgYWxzbyBzdXBwb3J0cyBhIE1VVEVYIHJlZ2lzdGVyIHRvIGFsbG93IHNoYXJpbmcg
dGhlIHNhbWUgSTJDDQo+ID4gaW5zdGFuY2UNCj4gPiBhY3Jvc3MgbXVsdGlwbGUgZmlybXdhcmUu
DQo+ID4gDQo+ID4gRG9jdW1lbnQgY29tcGF0aWJsZSBzdHJpbmcgIm52aWRpYSx0ZWdyYTI2NC1p
MmMiIGZvciBUZWdyYTI2NCBJMkMuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogS2FydGlrIFJh
anB1dCA8a2thcnRpa0BudmlkaWEuY29tPg0KPiA+IC0tLQ0KPiA+IMKgLi4uL2RldmljZXRyZWUv
YmluZGluZ3MvaTJjL252aWRpYSx0ZWdyYTIwLWkyYy55YW1swqDCoMKgwqDCoMKgwqDCoCB8IDYN
Cj4gPiArKysrKysNCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykNCj4gPiAN
Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9u
dmlkaWEsdGVncmEyMC0NCj4gPiBpMmMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9pMmMvbnZpZGlhLHRlZ3JhMjAtDQo+ID4gaTJjLnlhbWwNCj4gPiBpbmRleCBiNTdh
ZTY5NjNlNjIuLjJhMDE2MzU5MzI4ZSAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvaTJjL252aWRpYSx0ZWdyYTIwLWkyYy55YW1sDQo+ID4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9udmlkaWEsdGVncmEyMC1pMmMu
eWFtbA0KPiA+IEBAIC04MCw2ICs4MCwxMiBAQCBwcm9wZXJ0aWVzOg0KPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHN1cHBvcnQgZm9yIDY0IEtpQiB0cmFuc2FjdGlvbnMgd2hlcmVhcyBlYXJsaWVy
IGNoaXBzDQo+ID4gc3VwcG9ydGVkIG5vDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgbW9yZSB0
aGFuIDQgS2lCIHBlciB0cmFuc2FjdGlvbnMuDQo+ID4gwqDCoMKgwqDCoMKgwqDCoCBjb25zdDog
bnZpZGlhLHRlZ3JhMTk0LWkyYw0KPiA+ICvCoMKgwqDCoMKgIC0gZGVzY3JpcHRpb246IHwNCj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgIFRlZ3JhMjY0IGhhcyAxNyBnZW5lcmljIEkyQyBjb250cm9s
bGVycywgdHdvIG9mIHdoaWNoDQo+ID4gYXJlIGluIHRoZSBBT04NCj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgIChhbHdheXMtb24pIHBhcnRpdGlvbiBvZiB0aGUgU29DLiBJbiBhZGRpdGlvbiB0byB0
aGUNCj4gPiBmZWF0dXJlcyBmcm9tDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoCBUMTk0LCBhIE1V
VEVYIHJlZ2lzdGVyIGlzIGFkZGVkIHRvIHN1cHBvcnQgdXNlIG9mIHRoZQ0KPiA+IHNhbWUgSTJD
DQo+IA0KPiBNYXliZSBzcGVsbCBvdXQgVGVncmExOTQgYWJvdmUgZm9yIGNvbnNpc3RlbmN5Pw0K
PiANCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgIGluc3RhbmNlIGFjcm9zcyBtdWx0aXBsZSBmaXJt
d2FyZS4NCj4gDQo+IEkgZG9uJ3Qga25vdyBpZiB0aGlzIGxhc3Qgc2VudGVuY2UgbWFrZXMgbXVj
aCBzZW5zZSBpbiBhIERUIGJpbmRpbmdzDQo+IGRvY3VtZW50LCBidXQgZG9lc24ndCBodXJ0IGVp
dGhlci4gTWF5YmUgcy9maXJtd2FyZS9maXJtd2FyZXMvLg0KPiANCj4gVGhpZXJyeQ0KDQpBQ0su
IEkgd2lsbCB1cGRhdGUgdGhpcyBpbiB0aGUgbmV4dCBwYXRjaCBzZXQuDQoNCg==


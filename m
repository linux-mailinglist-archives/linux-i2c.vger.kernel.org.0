Return-Path: <linux-i2c+bounces-11486-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66667ADACF7
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 12:05:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A85CE1891E38
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 10:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFAD927D770;
	Mon, 16 Jun 2025 10:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rCbeUPvN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA566278771;
	Mon, 16 Jun 2025 10:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750068106; cv=fail; b=CwjomlfCthMiI+UbT7KabzU2ub5ULXoCcf/gPn7+jXDEd8ldro3vn4qn71BH1q2Xcq+MnJ/FN6z3JbvYdHtj3jpnROLCr9cfmJOwolTAMIhm/EJk3xjN5WRy0uyumOI6fW4zueRer6vXa8FKiRDf+8uPtyQJ8NROt8H/IHMyWRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750068106; c=relaxed/simple;
	bh=ZksIwWxvpB+SX0TxjLr6lv19ob77SUefLr0w+GZGOqk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=q4qUnHNoMo9r7hy91m6rvAVv1hHERL4eG/IAZS7Z+XGSZb56Baa5pvxudNhwAY6hudvsR71mulUKP078l4cTyARZKu+6zJcXQoL991bF8MobotEWOUXQGiVS5j+LStGd3OLBoU+/jn2CdHKN2saJLvqXqJawxpnDZbtxplifKBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rCbeUPvN; arc=fail smtp.client-ip=40.107.220.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ggeg0qix8tzkE8US3zPYRkVe1VD5gHNBmTCvpLRqrMFQDfUIgFY1sUE5YtQ4i2Kfa8znq2d/OQd5IqkQkTCeBOxrCdOCQWViWGiL0asEtNiQjQZ/KzGApXgF5Uj+HeXcy8Fb/fZSArW+5LSVIDyCCsWvlK4q/nd3HQdQ9sXfE2PE80P1ZDEstRm68qFKq+XViXPPKOOrPlkTNidjuEZx4n4F3gLqTePm/GXj0TVOnkH02YmdP9y+bxSgXfLOWkWqdGrPRInhVoppRI3HGHVL6W4eJHwmBDAmEOtroaKfihuXtTd0n/hztnMb3asM5caPWyx49OTMxFCfNoV8F0W8Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZksIwWxvpB+SX0TxjLr6lv19ob77SUefLr0w+GZGOqk=;
 b=DvPElpfhQjSSSkzPunhBCFvUch+F30iip13wsZMZfgiECT0EkdlsR1HVvPrqrIU5LKMNKz7h1HKoStDEKUZhPtgd1OCT/SK1NBROzitQP+fHh6IZbsQf8uhfxOCMgUiTy6M91CJV9AvPGEpRG1xj8KnscdhEFJZ7MPYfDAEw6j/1dAoLHDgbGsqgeni7JpqiINSIBcxpqeJdg5vvNEmG7CXNwrscQ+DC21xdj0uVVGqW1TOW9nivOL+PMv7h7L71OwqUlbKyPREjm0PMv35mtVaJ9ohpneRfh2MRt6wbSgrxGn73km4L4bTMW6hCuWGQSMXmmSIzVj6Mdy1v6JdzPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZksIwWxvpB+SX0TxjLr6lv19ob77SUefLr0w+GZGOqk=;
 b=rCbeUPvNCR83JnwGdEWlqL0L0/qoPSLMNUelItJjGMiFZmO1COM/PsnBs+zewDKQ37+0gZnQn1lDoZAn+fqgQZUXxwMduvAx3w7CzB4DyGvnM3CEY25kGNWtOZx+59MDc4bphWpLqWe321XSBlkgS5MJ3Qq9VVA5D7CuR3CSJX8QAe8pXrmF86/d/AW5UBlmzSFZ8C/Y5fCliPNcCj3KOitZiBOi62PA7ku+EiLqSXQwBtqJapt9Dkv5Nw/TqKjFHs9Gi2s9C3f/9yDdU22mxVhvMEmLR109yvYxJlYIDevPvP/thBqoXRCuefY/PZs1NhVrloC0wp+l61EFH83JmQ==
Received: from MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 by CY5PR12MB6479.namprd12.prod.outlook.com (2603:10b6:930:34::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Mon, 16 Jun
 2025 10:01:40 +0000
Received: from MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861]) by MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861%5]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 10:01:40 +0000
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
Subject: Re: [PATCH v3 2/5] i2c: tegra: Do not configure DMA if not supported
Thread-Topic: [PATCH v3 2/5] i2c: tegra: Do not configure DMA if not supported
Thread-Index: AQHb2eGgOlN4DVkv1UOqE4CTh0bnTbQFl28A
Date: Mon, 16 Jun 2025 10:01:39 +0000
Message-ID: <990e01e1864180247212775c2e27955a73bfea56.camel@nvidia.com>
References: <20250609093420.3050641-1-kkartik@nvidia.com>
	 <20250609093420.3050641-3-kkartik@nvidia.com>
	 <z3evk6j53hbgf426kc4ltdv4dbisoqnwkfwhapyenpadhey6v7@zvbljg5svppi>
In-Reply-To: <z3evk6j53hbgf426kc4ltdv4dbisoqnwkfwhapyenpadhey6v7@zvbljg5svppi>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB5716:EE_|CY5PR12MB6479:EE_
x-ms-office365-filtering-correlation-id: 30fec0bb-9883-4116-ffff-08ddacbcca10
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bXE4SjJOTSt2bmJZSlBKckVaQWUvNHVOYUpFRDFUQzFESGVTVjRGZ2Zsc251?=
 =?utf-8?B?cjNERzZkOEt3SHBMRjR6OUo1empPcFRvbEZMSUcyNHp3NWRkV01TYkc1OWs5?=
 =?utf-8?B?SDlkUStIakV1WVZFTjV0OVg1RWlFazV1RGFyNzZKU3ZiRGlocWZSK3VGWHM5?=
 =?utf-8?B?dHlnenlreGJ3ZzNzWjl5d1ZWS01uWXF5UDhNL0FUMmFWWWZDcDRnYkVvK24w?=
 =?utf-8?B?UG1mUVdtL1hTMU9iclFxMzQ1a21KS1c1UElZNllLemtWTGZ6Z1RlbWs2aTJx?=
 =?utf-8?B?VU5sM0RGY09vOFVGb2tDUmlUaUxDYUlIbzhYYXAyaUR1QlprV29JNnIxckVN?=
 =?utf-8?B?VnZvZXlFdlBYU1V3ODE2U05xazRGVEx2Zi8xYkUvY2VvZnFJMG9WeVZoaUZ0?=
 =?utf-8?B?Z1orZU5oMGJMa2Z6MXcvR0Q2dWk5c2tRa0N1M2JsMHRJRGJINzVuN1MyREtM?=
 =?utf-8?B?eUJQa0wvaExwL2tMWE5jbTVrZllMRWcrU2ZvWXlncnoyU3krSjlWeTZrZytP?=
 =?utf-8?B?bnJ5Z1lFaTdJc1pmK1puM0xyeXFqR1FMUTFkNE8wREEvc2xYT3dZV0paOWlS?=
 =?utf-8?B?UUp6OERXLytUQlhLV08wekcwbHZSekVuNGhZckFHaHBxczZ2dnZ1Wm9LVVE5?=
 =?utf-8?B?SFdpeXJxcHYxM1h1bEJFVzVNMndNVTlqb3FvTys0cTh3VDNwaU5uMFc5alVC?=
 =?utf-8?B?bFdJYzh0UTRoSUk5UTRjNXBXMjZDa3EwMTZCRUhjL0dra0FXb3piVCtnRUJ2?=
 =?utf-8?B?eFVXWm56Q3JWb0tKaU5HMGhnd1lVNlJpZ2I0M0xoMlZFMGpvWVJwdzVZeDY3?=
 =?utf-8?B?UFRXUENhTHBqUE9NMGxmUDJ3SGFLaVp3R3JQeFFhMG9OSUtnNlJxWUJWVm0v?=
 =?utf-8?B?cHFjOEp6Ujk4Q3VXMzk3NTB3czZFQk9tMFM1bnZkUjVWK0Y3RFVvT1YrNDdS?=
 =?utf-8?B?MU9NOWRBWXVhbklDM0UrWitxQUpheGtMcXV4eTlDcWU4cG1xR0dwdFFaRG5y?=
 =?utf-8?B?ODNkWlVnOUZQcUx6SzgvUS9YYmcvemRNK1ArRTdPb083bHBzcHNMQVFqRExX?=
 =?utf-8?B?Q29COXMyTk5YV2lndFNQNmxqWXFob2U5K3owa0dkZm0rMnlUN1JxUmk3aE5S?=
 =?utf-8?B?c0xMRHpMWUNhOTMya21VdnMrNWhMS1ovdmNMaDBpK2xWNWxsZHVSdGJCeFI5?=
 =?utf-8?B?VG9TcWhJVmx4MlFGdTJoWjZ6ekM5bW51UTlaY0luVlFHcGM0Qm8vM2lORmdl?=
 =?utf-8?B?UllEeW1UTlc5bjBRb3BsVE9DUUlDNEVhcnAxcEY4MFRXNjJiSjk0TnVTZnQ1?=
 =?utf-8?B?aWp3SlduYmRMd1JpNitoTHd0T3M2aWtqcGowSVBEMVJGdUhXV1dkMENhZHRw?=
 =?utf-8?B?WjJHSEoyZ3NocmxsaHFhOElPZVJRZmlOSzhpcnpUL1ljM2FoVm5yS3Y0dWpT?=
 =?utf-8?B?N0YybWNOd0ZyVVo4N2ZtbEFmenBIdDYyWStWeW55QjJHS3VjU0EyUU1yL2NI?=
 =?utf-8?B?U2tFS3JGN2ZBay9waVpmTEVLcWRDUkMyT1dTYmFrR0dyTE9PM3NWYVFjL0dF?=
 =?utf-8?B?VFNRMnFWSlhrWkVZOW11TUZqRVBVckVrZ0RWVmFha0tsV1prUnZoaE1wSFVn?=
 =?utf-8?B?R29neXB4NEU5MTZCOUw3YmR1QU5uY090Y2cxT0FKSXFVRGtPZ2pPbVREMms2?=
 =?utf-8?B?ZVowTXVGeW9WamQ0UkxoM2V5ZVFNZXJ2cUdjUGVWTitDUXhXb21DZzJZY3J1?=
 =?utf-8?B?R3FrUU5KVXpwV3QydXluTUhWOWRyVDQ2OUkvcU0vKzUrTHJuS3ZvcVZLUzJj?=
 =?utf-8?B?SGltVENEc2FoQkowS2NSc0RtZDQ2cXl2bUhLdlVEZ0UzU2QvSmlwRE9STGQ5?=
 =?utf-8?B?RFJtVFp3Wi9GNFJlWHI1TjI0M0VNSmxXRXRORngyYlVmQkVIRngwREEvQ0hr?=
 =?utf-8?B?cW1zZXNqYkZWdm1Nemt3SEhndGZ1eGlRTE9WNEdmZGdjRmRmVnFRY0JwOURF?=
 =?utf-8?B?VkhFNXQ3UFh3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5716.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cjJuc3ZvMnBPOVU5dFBUQzAvZkxkSkVUTFYxMWt3MW53N1JzZWw0bDQ2VGpX?=
 =?utf-8?B?dE9reGtXTHJuYXVMRmlpQXVhVVNlcTlqWjJLWkdCMUF1bkc0NTBsME50cElT?=
 =?utf-8?B?WXNZV0FXQm1FQ0Nha09FUFRJb0F0cGdDZ3hOTWJidDdVdUl5OXpjWm9VSTEy?=
 =?utf-8?B?eGZaaGNoYUxwaVk2QVV1amVKaHEyZWVjQVJUWnE1RENDd1dPKy92dzE2dUx2?=
 =?utf-8?B?ODlsZFgwWi9EaU02aW9QLzdJTHd6SkFyKzdIR2NzNTlQVCtqREpVbzlLSGpW?=
 =?utf-8?B?T3pEOFAzMmZ5b1JUV0RJOEFvV0JZdWtFVGIwOW5aS1VTVllBMFczeUJ5UlF0?=
 =?utf-8?B?M2kxVnhYbXhINS9xaEMvek9peDdVR1pOSU51aXdhWlhJZWhVb3BiNXZqYlg2?=
 =?utf-8?B?UGVNdDlqNE1rR25YNWU5UWdDalVxWmZybFUzRUxXcWVYemZoNGplQmwzai9M?=
 =?utf-8?B?cUJoZmZPbGtrVTZWbjJ6d1MvTWZqUDFQWDA4WkV3NmJHMWNVRzlEdGFRL2VB?=
 =?utf-8?B?VjkzSHRjSUFLVDVKaFhJYnVIajNLRnovUUo2UzBtcDZ5alg0OE5tVDJWUWRr?=
 =?utf-8?B?cm1mZTlUSHJtUlY4Y0I5WndhRVVBcnRQczFXdGlqWEhhd1FoWExVYWxPTzV3?=
 =?utf-8?B?b3l6dUVvM0pWQkQ2MWo0c2NMWWxtaHE4SkJReWhBQVVoQmFPZkpibjhGcDdJ?=
 =?utf-8?B?OVpHajhGb2MxZjVTWEhUMnBkc2pUK3A1ZVBvalhYRFdBRk1UWEZXMnFNZDFB?=
 =?utf-8?B?SXFZZUtQNzdBSU8vcTltMkQ0YTNlcGpsc0lGamtDdDQ4R09yZHN0amJKS0FD?=
 =?utf-8?B?dUNmR1MvZDFUMk1vTmlxcUs1ckZNUlNZQ3BZaXExKzY5a0R5SWRLLzhWZTJu?=
 =?utf-8?B?WUtqVUVkUitiNnM4cXc4VTNvWnZZOHNJQStndGkzbHQ2emEvNzdLaS96b3Va?=
 =?utf-8?B?THlDb25zVUhuTUJTN3hKakMxbThQYWJGS09hVkVMaVUxZlFFVWFqK2QvN25j?=
 =?utf-8?B?dWU3RVloYXc5SnR2SXIzeTNBOUg1d09WWlFwZkg2STNtNmZmRFltMnp2R21m?=
 =?utf-8?B?Y2RkcmFaemRqOVhyNG9XSlNnYnNPa29HZnBndGxGUTllWTdzc0xjTHJOYWha?=
 =?utf-8?B?cFVUb3VpM0MrR01Ea1VWUmVDQnp0ZW5BRnVINjFxYjhvYzhjOFZGb3hUK3hL?=
 =?utf-8?B?UWNzV0JXMEpTWW9VcEVVdElmTnJYbkUxWDlLU3k3YVI5UGp1N1Jtdk9hZE5I?=
 =?utf-8?B?ODNzdFFSNmhHN1QvYjExYmltNHVKSEVKYVhEN001Q29mL2lzNytFa3I4d1FQ?=
 =?utf-8?B?Yy81enB1QUpkMDJQcWVMSG1KRDN3blp2OGN0cWpIVkZDY0NxZ0FEOThVOFJj?=
 =?utf-8?B?S3NZSjlxVDIyVTJLdzdRUUgxeUQvdW16bnFwMUxOQWYxOUsxKzJxVkpLZVhJ?=
 =?utf-8?B?Nkd2aWp5T2FCc2l4OEd5Z2ZKQVZUSjRnaFphaGVxbFZCbHJhY1k3UU9oZTI5?=
 =?utf-8?B?aEtYN0Q2UG5VbFlVZEhXL1dNTWZzRzJGRDZlZmVqR2IvUUdROFBnaHRaTkpM?=
 =?utf-8?B?YUlKeEFoVTcrOTNRcGhtdUVlR0I4NThESWd4OEFqUnhJbHBwZTFKWGFqUDB0?=
 =?utf-8?B?QWQ4dVRNSG9ZeW0yYnNFZDJBaDQvdzNZeDd5dE5UVlVzRUxhUUh6SkExdmgr?=
 =?utf-8?B?K3JqNFI1Wm1FZ2J4SWQ2YjIwMUlOQUtIQ3dQamtIcFNKa1NwTnMxdWhSbnF1?=
 =?utf-8?B?RXI0aFVROWpTR3VtZExMdzU2Y0JnNFpUSyt1QjhFL2lwTHFPeEdSUmJ5WVJI?=
 =?utf-8?B?QlB3RHdsYzcrVXdaZGRmV29HTlhTcmVEd2xKSFVVQVJpenN6K2ZDeXNLb3Fq?=
 =?utf-8?B?REg4MlVjcGU1UlNha2JQVUwrdE5qcTdRTkpIYXh0UWQvY0gvaVgzbGkvNFFT?=
 =?utf-8?B?VS9EYXpoNjRZdzk4cDBwTDltQm5RSmhPenV4V0ViWVZ4QlFhRmYvSEVsOUZn?=
 =?utf-8?B?azRua2pmdUJmcGN5UXpKNUVXUGhQWVBRUVVHYTdMbWJhdnF6QVlGY2VxeDhh?=
 =?utf-8?B?M1dpTjI5TWd3VVk4aVB5d0VEVXRPeTdXRERMZjE0b0g1VElFdC9iMDVnN0Qx?=
 =?utf-8?Q?7aQlauRIwKiog6kMxxfSIh8QT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <52FFC521F5CF1944B1DEC602AD7C1AD6@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 30fec0bb-9883-4116-ffff-08ddacbcca10
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2025 10:01:40.0015
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LAHg3mLJ5e7nFjIMrQaj3CJQA9nIGL1k3/TloqXjMfX2rFm0FEKu7JjGlElFcfyLSTuJ4xj4wAdVr3OqT8pjTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6479

VGhhbmtzIGZvciByZXZpZXdpbmcgdGhlIHBhdGNoIFRoaWVycnkhDQoNCk9uIFR1ZSwgMjAyNS0w
Ni0xMCBhdCAxMDoyOCArMDIwMCwgVGhpZXJyeSBSZWRpbmcgd3JvdGU6DQo+IE9uIE1vbiwgSnVu
IDA5LCAyMDI1IGF0IDAzOjA0OjE3UE0gKzA1MzAsIEthcnRpayBSYWpwdXQgd3JvdGU6DQo+ID4g
T24gVGVncmEyNjQsIG5vdCBhbGwgSTJDIGNvbnRyb2xsZXJzIGhhdmUgdGhlIG5lY2Vzc2FyeSBp
bnRlcmZhY2UNCj4gPiB0bw0KPiA+IEdQQyBETUEsIHRoaXMgY2F1c2VzIGZhaWx1cmVzIHdoZW4g
ZnVuY3Rpb24gdGVncmFfaTJjX2luaXRfZG1hKCkNCj4gPiBpcyBjYWxsZWQuDQo+ID4gDQo+ID4g
RW5zdXJlIHRoYXQgImRtYXMiIGRldmljZS10cmVlIHByb3BlcnR5IGlzIHByZXNlbnQgYmVmb3Jl
DQo+ID4gaW5pdGlhbGl6aW5nDQo+ID4gRE1BIGluIGZ1bmN0aW9uIHRlZ3JhX2kyY19pbml0X2Rt
YSgpLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEthcnRpayBSYWpwdXQgPGtrYXJ0aWtAbnZp
ZGlhLmNvbT4NCj4gPiAtLS0NCj4gPiB2MSAtPiB2MjoNCj4gPiAJKiBVcGRhdGUgY29tbWl0IG1l
c3NhZ2UgdG8gY2xhcmlmeSB0aGF0IHNvbWUgSTJDDQo+ID4gY29udHJvbGxlcnMgbWF5DQo+ID4g
CcKgIG5vdCBoYXZlIHRoZSBuZWNlc3NhcnkgaW50ZXJmYWNlIHRvIEdQQyBETUEuDQo+ID4gLS0t
DQo+ID4gwqBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLXRlZ3JhLmMgfCAzICsrKw0KPiA+IMKgMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2kyYy9idXNzZXMvaTJjLXRlZ3JhLmMNCj4gPiBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMt
dGVncmEuYw0KPiA+IGluZGV4IGViZDUxMTY1YzQ2Yi4uYzcyMzdkMjZiODEzIDEwMDY0NA0KPiA+
IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtdGVncmEuYw0KPiA+ICsrKyBiL2RyaXZlcnMv
aTJjL2J1c3Nlcy9pMmMtdGVncmEuYw0KPiA+IEBAIC00NDgsNiArNDQ4LDkgQEAgc3RhdGljIGlu
dCB0ZWdyYV9pMmNfaW5pdF9kbWEoc3RydWN0DQo+ID4gdGVncmFfaTJjX2RldiAqaTJjX2RldikN
Cj4gPiDCoAlpZiAoSVNfVkkoaTJjX2RldikpDQo+ID4gwqAJCXJldHVybiAwOw0KPiA+IMKgDQo+
ID4gKwlpZiAoIWRldmljZV9wcm9wZXJ0eV9wcmVzZW50KGkyY19kZXYtPmRldiwgImRtYXMiKSkN
Cj4gPiArCQlyZXR1cm4gMDsNCj4gDQo+IEkga25vdyB0aGF0IHlvdSB1c2UgdGhlIE9GLWluZGVw
ZW5kZW50IHZhcmlhbnQgaGVyZSwgYnV0IGhhcyB0aGlzDQo+IGJlZW4NCj4gdGVzdGVkIG9uIEFD
UEk/DQoNCk5vLCBUZWdyYSBJMkMgZHJpdmVyIGRvZXMgbm90IHN1cHBvcnQgRE1BIHdpdGggQUNQ
SSBib290Lg0KDQo+IA0KPiBPcmlnaW5hbGx5IHRoZSBpbnRlbnRpb24gYmVoaW5kIHRoaXMgY29k
ZSB3YXMgdG8gZ2V0IHNvbWUgc29ydCBvZg0KPiB2YWxpZGF0aW9uIG9mIHRoZSBEVCAoaS5lLiBk
bWFzIHByb3BlcnR5IGlzIGRlc2lyZWQsIHNvIHdlIHdhbnQgdG8NCj4gZmxhZw0KPiBpZiBpdCBp
c24ndCBwcm92aWRlZCkgd2l0aCB0aGUgZmFsbGJhY2sgZXhpc3RpbmcgbW9zdGx5IGp1c3Qgc28N
Cj4gdGhpbmdzDQo+IGNhbiBvcGVyYXRlIGluIHRoZSBhYnNlbmNlIChvciBpZiBBUEIvR1BDIERN
QSBpc24ndCBhdmFpbGFibGUgZm9yDQo+IHNvbWUNCj4gcmVhc29uKS4NCj4gDQo+IElmIHdlIG5v
dyBzb2xlbHkgbWFrZSB0aGlzIGRlcGVuZCBvbiB0aGUgYXZhaWxhYmlsaXR5IG9mIHRoZSBEVCAo
b3INCj4gQUNQSSkgcHJvcGVydHksIHRoZW4gd2UgbG9vc2UgYWxsIG9mIHRoYXQgdmFsaWRhdGlv
bi4gSSBzdXBwb3NlIHdlDQo+IGhhdmUNCj4gRFQgc2NoZW1hIHRvIGNoZWNrIGZvciB0aGVzZSBr
aW5kcyBvZiB0aGluZ3Mgbm93LCBidXQgc2luY2Ugd2UncmUgbm90DQo+IG1hcmtpbmcgdGhlc2Ug
cHJvcGVydGllcyBhcyByZXF1aXJlZCwgdGhlcmUncyByZWFsbHkgbm8gdmFsaWRhdGlvbiBhdA0K
PiBhbGwgYW55bW9yZS4NCj4gDQo+IE15IGNvbmNlcm4gaXMgdGhhdCBpZiBzb21lYm9keSdzIGxl
ZnQgb3V0IHRoZSBkbWFzL2RtYS1uYW1lcw0KPiBwcm9wZXJ0aWVzDQo+IGJ5IGFjY2lkZW50LCB0
aGV5IG1heSBub3QgZ2V0IHdoYXQgdGhleSB3ZXJlIGFza2luZyBmb3IgYW5kIHdlIGhhdmUNCj4g
bm8NCj4gaGludHMgdG8gcHJvdmlkZSB3aGF0c29ldmVyLiBNYXliZSB0aGF0J3Mgb2theSBpZiB3
ZSBwcm92aWRlIHRoZSBiYXNlDQo+IERULCB3aGljaCBoYXMgYmVlbiB1bm1vZGlmaWVkIGZvciBh
IHdoaWxlLg0KDQpTaG91bGQgSSBhZGQgYW4gaW5mbyBwcmludCBoZXJlLCB0byBpbmRpY2F0ZSB0
aGF0IHdlIGFyZSBtaXNzaW5nIHRoZQ0KImRtYXMiIHByb3BlcnR5Pw0KDQo+IA0KPiBJZiB0aGF0
J3Mgd2hhdCB3ZSB3YW50IHRvIGRvLCBpdCBubyBsb25nZXIgbWFrZXMgc2Vuc2UgdG8ga2VlcCB0
aGUNCj4gSVNfVkkoKSBjaGVjayBhYm92ZSwgdGhvdWdoLCBiZWNhdXNlIHRoYXQncyBqdXN0IHJl
ZHVuZGFudCBub3cuDQoNCkFjaywgSSB3aWxsIG1vdmUgdGhpcyBjaGVjayBhYm92ZS4NCg0KPiAN
Cj4gVGhpZXJyeQ0KDQpUaGFua3MgJiBSZWdhcmRzLA0KS2FydGlrDQo=


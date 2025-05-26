Return-Path: <linux-i2c+bounces-11142-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36983AC3C50
	for <lists+linux-i2c@lfdr.de>; Mon, 26 May 2025 11:03:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E86E13AAB59
	for <lists+linux-i2c@lfdr.de>; Mon, 26 May 2025 09:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD6B1E834B;
	Mon, 26 May 2025 09:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IEp33khS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2053.outbound.protection.outlook.com [40.107.102.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE7019D88F;
	Mon, 26 May 2025 09:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748250219; cv=fail; b=NrA9ZEzeDgeyPUD6cj1A2muTcdRlcE5iW1KQYWC4MVeRlVZFGWzYrmrp2+THMUaBdBC4wRwOzAQ+BCfDEarkpftvd2qYutnmlE5PIHjX8nWHeHEHRqZZAyD0ZEAcwFieRuJQUg1clwywquNupm+vyFt2Lg+lpnalznI1YmAKnrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748250219; c=relaxed/simple;
	bh=u0hXCMqqZIprLgzqBUOjEXdT9foTjAfUR6l4o9IsBqM=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AUhieL6yUHY86cUd8OX9kkLzTUls76BLX+9+uNzrSdIwdue+ggJr06AifGEeCNTBxSmTgTmdE6wnFgSs3ePd/htnZOzJRFJn+WdFIvB2pbff7cm497c5UZA4rJgQu1ymqPGOSXaUbbFVCa6n/OrhfmPMFrvfWWHHghjy/9KEYJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IEp33khS; arc=fail smtp.client-ip=40.107.102.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=imTiik6eDze4i+DS+uGHqISyg6ZvfLXBpaCoB3GlA8k9335nWzUaD/N7miGrt7iYsVNDyAQbYqRKN/Mc6YjldpIIWWEKFM6XXdNVBF48PJIYYm4KLE5t/rlKPCCixW0WEVg6iDJ5MmmwXAyT3F41Xkub79eD9259rt+vwZaroZgUlgi48uDRKoWBeP7DsOcHmh/uOyHUvjV3gHuyg4U4vKpbUSoBvyk8hgTnwWaaWTAvgmiPrruXuEFLqb/ARPemLubG3pyzEObHTzCh0JAWdEpiBEW9fpgW5NXmdTiX+virDOCHNK3fsKIQrpaNTam26n0wGQNpSk/TBmxquQifag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u0hXCMqqZIprLgzqBUOjEXdT9foTjAfUR6l4o9IsBqM=;
 b=UvkmsHKumtYlfpw+n/ShUy28mOMmouXETuglBE/I2VGwwr1wxmTdA8KZqp7vI/bDujyg3UnT1yMKhBZnegpcRUtLIOSQ+d+ToakXGKevzUyYHMl/6qhnPV9IMUMB9fs5hpnJOkRbIsUcoAPkU3b4t8y85ATvIlQZHcPX4SQo/Y74Eqdz21F//zZ/DA8cunn3VCeup2GT8heU+IGgByJLt7JmprF/4mGc9TibusqSdfF1qjD3dtXnRe+qo0XQeRV/+qR3lQeVFlj71WgDFG+QaNTxGQ+BXgzWKauWdjd1XKkFfVTAuioVbu+NqsQ0366XC8ged7xzdSKTC6hKY9wkhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0hXCMqqZIprLgzqBUOjEXdT9foTjAfUR6l4o9IsBqM=;
 b=IEp33khS2q4CpHtsKC6q2CohxasaZLykJ9q1dS8yoMGPVyUOmtqTgtSucbd5bXKeIzLDbDIoisQtgy2Hy/qvrn9KKjQ4rJ372sXKcTO3tGffn2u2bP4Xn8wQceadJWYprOIpiFwnYCmGXn0wQ8PnpFQNXRbMmZ4bhs7ZyK1zrBjXpr2dmfKHwJTP3FqQezBRtMxtYcB+ezrIfRuN9PoudNXdDTolN9MCAxYgPryoqy5sBWPPXIVz4sSXmU+Df97uGzK1XyQm4XsP59/bal/ABbu4dFnmqy7ULyeZZ6xD61XdcmSGbbrp8HNmiZumrHq7dMtyB5Sjyew2XvJngzUEbQ==
Received: from PH7PR12MB8178.namprd12.prod.outlook.com (2603:10b6:510:2b3::19)
 by CYXPR12MB9443.namprd12.prod.outlook.com (2603:10b6:930:db::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Mon, 26 May
 2025 09:03:32 +0000
Received: from PH7PR12MB8178.namprd12.prod.outlook.com
 ([fe80::77bb:a9fb:c75b:f530]) by PH7PR12MB8178.namprd12.prod.outlook.com
 ([fe80::77bb:a9fb:c75b:f530%7]) with mapi id 15.20.8769.021; Mon, 26 May 2025
 09:03:32 +0000
From: Akhil R <akhilrajeev@nvidia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "andi.shyti@kernel.org"
	<andi.shyti@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>,
	"digetx@gmail.com" <digetx@gmail.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 1/3] dt-bindings: i2c: nvidia,tegra20-i2c: Specify the
 required properties
Thread-Topic: [PATCH v3 1/3] dt-bindings: i2c: nvidia,tegra20-i2c: Specify the
 required properties
Thread-Index: AQHbzf64Lx//UqFsKkqzG3uNPk+rhbPkZYKAgAACBACAADPeIA==
Date: Mon, 26 May 2025 09:03:32 +0000
Message-ID:
 <PH7PR12MB8178985B4D738217F7F1E358C065A@PH7PR12MB8178.namprd12.prod.outlook.com>
References: <20250526052553.42766-1-akhilrajeev@nvidia.com>
 <44b5d5f1-f45e-4d81-809f-707bd756257d@kernel.org>
 <6067561e-14d4-4512-afd7-4a4eca27ecfa@kernel.org>
In-Reply-To: <6067561e-14d4-4512-afd7-4a4eca27ecfa@kernel.org>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8178:EE_|CYXPR12MB9443:EE_
x-ms-office365-filtering-correlation-id: 4fa7388a-68ee-4826-a52c-08dd9c343082
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?V21kRlNWRW1zdHRZR05oNmRCaG82TW1PMHR5OEVuZEdxUTNyQWJCMm02VFB0?=
 =?utf-8?B?NXFDaWw2SC9ZYXFCbEdjRlZVTjNYR2RJbUtuMDA0UzBwak0zUmVLejJFRFk2?=
 =?utf-8?B?V1dEYXBCTjZLVzlwMENFanNQanp4WkE5M3VHNFZHQWJxRnFLN2M1Wk9GQWpm?=
 =?utf-8?B?ZWJMYXFrcXRoU1k5TjdJeHhDZU1nU3M0Skd5NnZBQTludExPQzJGaEJjaVlk?=
 =?utf-8?B?eCtHdTdhb2lJSXMwSG1jTTF1MGY4RHVlcXBBcGl4S3VXc3BhNjVNandLbzFt?=
 =?utf-8?B?STBmbGhZOGR2Zk1MdDh2RmZCeTZpL0l5dzdYOXJlL0VVZnFCOEZlbnpmVUhR?=
 =?utf-8?B?NnhUbnptQXV4TjZKRmhVMGp4endWQkorMW50c0o2bDNzR2x5bXpIMG5YUEpJ?=
 =?utf-8?B?WkNqMW5hQVNXSWczdFNQdGxuYXJpOE83WUlRWlEvMmppMnhET0xndkxLZjRx?=
 =?utf-8?B?b1dINmI0UVhZS0ZyT0NiNU9sN1hRZGIvbXRnMjJFczFONjYyd0dROTg1Q1U1?=
 =?utf-8?B?bXVDbytaVmc3VGRtaXJpL2hXc1NFM0xJTzU5V2NlTFRqcm5yYWl5UE8zbmdK?=
 =?utf-8?B?bkYwaTNnVFBoTE41VXZBZTZWWHpKdFhRSGgwSkdZUmgzRi9CS0h1K0NOQmtB?=
 =?utf-8?B?cGRqWGVoNlNLd3VlbS9UTUVhaDRNeTUxOEE3bFMwQVNGMzFzRTh1WXp4czVM?=
 =?utf-8?B?ajVnQWF5aTVYYVZuUjBVNW9EeXhRbVk0aTZmb1JTdXN4L2p3cDFpaUhzVGQ3?=
 =?utf-8?B?WVh2WnhQRWF4VWFCdHIzRHZOTlJqUU9NUFFUZ0RiSkFwZFRxSXk4dEt5Zk1r?=
 =?utf-8?B?bHpFMEY3aXJmRnlyTnV0Sk8zVXlxUnAwZ3h2WWx2aDc5eXlwUVJhSmFmSFdN?=
 =?utf-8?B?akdHUVFEcmdsb1pVSmpyY0g1cnVLUmZQVVN1Y0dBK2VCUWE1RDYwZGwvOU45?=
 =?utf-8?B?UkF2VExVUW5LOC9vN1ZNZ0ZVeGhhWkZHSmtFb0pqNXNZZjNKUFlaUlhHcTNk?=
 =?utf-8?B?di96WTR3RzRoaHVUMG5OQWtYaDNVYTMwcFdiRzdmYWZ2bC93bHY0OGkveHJq?=
 =?utf-8?B?bWNPZzdRdjVVaUJTZmxhek5BMllpQXhZRVh1YmxuR2xrOFdhekhleUVJbXhR?=
 =?utf-8?B?RHNJRjdCZU9KMjhSb1NUb1M5akx5OTl2WFRwVXNITUVPaDhjNlhpa3Rha3gx?=
 =?utf-8?B?ZHVFOCtiVlVWcnhrbTFMR1dxSm9JTENOdDdHc3k4bGU2cVhBQktqZnQrVmVm?=
 =?utf-8?B?TTgrZXhMRGl1RHI5OXpMOWQrdkdNalJtZ0h2ZEdIS01rTEhwbzhOK0FZM2R4?=
 =?utf-8?B?OTlkMWN6UnF3c2xyei9JaFZYdzNMRFZlQUQ0RUk1T2tDRDRaK2JqUERuTmhG?=
 =?utf-8?B?cnNiblF3ZmI4L0tGU3hMTThaeUlzcXlRZythN2M5ZFRhak1ncXQzdGxHc2F3?=
 =?utf-8?B?WFdtSk5veEJXM0NoTDZSZ0VJTU11dmtQUysyMWMwTmcrL2dDRWU0cmVaMUFI?=
 =?utf-8?B?WlVoR2FnWUl2a3d6cklsb3VWeEN3Zjh6d0p0eGg4Ny9kRjVVS1ZJcTNTb0du?=
 =?utf-8?B?Z01jRkVNcE9HS2hlaC9jb1BSK1MvVnNDMGRPck5UZGNsODY4Zk9BN0RudVNu?=
 =?utf-8?B?OWxueVZnbkJldjdTakpVOEduTFNBMUw2eFVCTUQrd0Y1b0NPcmFTTTdpUjhB?=
 =?utf-8?B?dkFwTzNQQW50OGJYS3Y4ZzhISmlRRzVtcU1zSGl4ZmJEZ0d6MGQxYVpPTHBU?=
 =?utf-8?B?OGp0MEN4YkR3bDZCemYrbHdLWUVPTUo2Rm1xdWRuQTBodkcvcXJuUjJDZkF0?=
 =?utf-8?B?YS9tNG1TTGRtUHFzWkFCUlBWcVJ4ZUkxNmNPNHhwdllLdi9XdGlzRjVzRzNH?=
 =?utf-8?B?cXVFKytrenJocXliYzBmM05mdU90V0tPWGlIWlQ4WnBlbFlvdXhIeFlYNUQ0?=
 =?utf-8?B?REMzRWRyazhwM2d1ZVkrS2hYb0VKS3NVeTl2bnorVHFuMytXcFMxQUZ5L1pW?=
 =?utf-8?Q?UPbNceciyWx2ha+5yXEU56QBEDXuLI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8178.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eUs2bnpqdzhhV2k5eC9IQURXaUxBekdiV2hWQ083ZEFFcERGaVhVZnpaQlRE?=
 =?utf-8?B?RE5XRVpPdkNaMzQ0WGxmNEk0cElZM1A4b2hvWWI3ZnkzQUg2NnVRMU5HeTl4?=
 =?utf-8?B?QzVKOEVxS09neEppZ0dUTWxHWFYxZGErdzZKbXJ6NVVveGtBSVN3WVB1L1pj?=
 =?utf-8?B?bjNaS1dPY05KZ0FweFV3eWc1RVY1cTdRSkplZVIwc1dHbEk3M2ZNaHF1ZFBv?=
 =?utf-8?B?TDYyQUp0RzRzOTVUdHlZK3I5czBranA3bHdkZnpCZFRVRjVXMHp6Q3ZuN0pV?=
 =?utf-8?B?Ymt1ODFQZmN3UCtBVk1IUFc1eFV2MjRhREZHWGUxdWNGbDVMSG5yYlRJOWdm?=
 =?utf-8?B?clBtQkFZMlpqN3pib2hBK21qdFhiK0MvcHhLdXlrQWltQmZHd3VYNG8rY2tW?=
 =?utf-8?B?L3JZUXZUaHRlNThYY0MrRnlKT1l2YWZOanZGWlc5a1dHUElmSmFyVG9zdEtP?=
 =?utf-8?B?Z1BKei9ka2FxeWh0UWlFVW9nMkgyWHN4TmozczdJNVF3UGR5YXRCOXVIcmRD?=
 =?utf-8?B?QnJUVjZrMENBeDFFM0N4SnRSejBaYW0zTkZaL2ZrL3dHS0hQeGVtK09WNFhx?=
 =?utf-8?B?WXFIYmtCT2hwd2drNFlLWHkwTy91a29kNG9talJCRjBCbmltelJid3dXNHc5?=
 =?utf-8?B?ZFpRZDJabTVLZkZFVXFOYmV2eGVlMS8wT0lES0ovN05mMUZ6Z0x4Nnlsb0JU?=
 =?utf-8?B?cEc3LzRpUGJRL09ja0U3ZVpOZUVJRCtuYzBaVVhzQjJhbEZNaXdHbVBlcUZ0?=
 =?utf-8?B?RnVGWWppWlltV3pDM0RVL0FtR0l3aktpc011UTc5aTRQcy8vbXU3Zmc5bDJu?=
 =?utf-8?B?TEFBcEc3blgzdTBUc0RDNWhOQlBYbHFoVjhXMlFSLzVpSmwzL1pWcUkrUVRK?=
 =?utf-8?B?QzEzUEJtTFkwTDBVQXFMak0xTGV3VndFVFdvMWFqRnBUUUVSblkvTzFDTnB2?=
 =?utf-8?B?d1loNlorSytidmhQREtCZHd0Z1pidjNvenRUMWNYR1VLM21DWjFwNVBJemV3?=
 =?utf-8?B?OHJvWTlUaUxVM0JqblFxREcwWXR3TGt3cG41VHkxSnpiR1dKYzR6U2VQUWc1?=
 =?utf-8?B?cG5aRzZ4cFZsd0FHcVR6T3JhWjN0cHdwYjNuQWlHYjJsNFZRWGo5czNwWGov?=
 =?utf-8?B?SUNDKzZiVEhWWjJjazhsVW14cVhmRFBCQk1jNWhZeUNrTlBOUTZOaHZGcmdJ?=
 =?utf-8?B?eHROVG9YTU9kS25pZEdCWndOT3dNcWVtQWh4aDF5N21KRWJtZkhmaHJjVkVa?=
 =?utf-8?B?V05aSktTdXg3YkVKVmVoWStzeVJzcTNVNFBJVFh1WEZiYnBrYUFyRmZxU0M0?=
 =?utf-8?B?ZXZFd0c4U0ZPUFRXN1BoVmMrMElkeVI5YnF1a285WTdodHZwVWdMWUVQY3Q0?=
 =?utf-8?B?SEdMT2xxSE5WQmI1L05wUXAwMVdxNXlwdjFXTHFGaXlyZW1WQmVMcXdoSlE2?=
 =?utf-8?B?OUdwSm90UUtBK3ZQRlcvamRhelIvYjl0THZGQXdGbURTQk1nUWhidDgzelBL?=
 =?utf-8?B?cGdjTVRyUjEyc2hJbGRVaEIzNm04WDJhU2NvT0NVbUdTdk9OcEo0VHYvS1lS?=
 =?utf-8?B?NlZwcjZLUHZFUjBvNlJTbDZndFMwS1BjbGJ3YlkwNnpqZXVwS1BpdHFSWi9x?=
 =?utf-8?B?b09teFFvMWtQNmhRbVNSTG1yK0JLbjlaSTlXdDhzTkxBUnlLY2pLNXhMNFZ4?=
 =?utf-8?B?L1N1OURJRHNSSm5JOVQrZEtQNCtSVU5hWWlwUVRaZTZiWHpqK2tTc2FGZHpM?=
 =?utf-8?B?R1RsZW05NFBmZWF4a0NXUDB6S0d3YlgzMWhWY2tMZnhiVjVzYnVJTmhIcnht?=
 =?utf-8?B?SU1ESk9nK0hnY1J1Zlk2SXEySnJEVklzd0RaZEQxUkM5MnpJTkJTcDJWbnNI?=
 =?utf-8?B?clorVXhaTEdhRDNWVEVYWmxBVjBJNEo0NHFOQUROZ0x0aVc4S3UxQVlEV1Q1?=
 =?utf-8?B?N1BtbC80L1BaZExtczRlMjFTWXNwZTFER1NFZnRVNzY5S3ZyNTZEeWJYT1ND?=
 =?utf-8?B?S1JjeVFsTTBYc0Ixb3JxQkRvd296MzhMeTlRT1lXRklOSEFsdjk4S0NEbmd6?=
 =?utf-8?B?Nk15YUVDczRPdkZYaXlzQTZmWlppZW43eDZFYmQweUVsTGZRbWJCTmQ3VXpZ?=
 =?utf-8?Q?oM85dt/UDVzvfXIupv8D6H3aZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8178.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fa7388a-68ee-4826-a52c-08dd9c343082
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2025 09:03:32.2428
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CRo6sWD6OkzIbMNMF/U0SjOBMj65NnZtEWA/YVTYXf8y08BHhm9ELEHIcN3W2GtZSDtlLP1QHgaQI6BJcwJAlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9443

PiBPbiAyNi8wNS8yMDI1IDA3OjQwLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPiA+IE9u
IDI2LzA1LzIwMjUgMDc6MjUsIEFraGlsIFIgd3JvdGU6DQo+ID4+IFNwZWNpZnkgdGhlIHByb3Bl
cnRpZXMgd2hpY2ggYXJlIGVzc2VudGlhbCBmb3IgdGhlIFRlZ3JhIEkyQyBkcml2ZXINCj4gPj4g
dG8gZnVuY3Rpb24gY29ycmVjdGx5LiBUaG91Z2ggYWxsIHRoZSBleGlzdGluZyBEVCBub2RlcyBo
YXZlIHRoZXNlDQo+ID4+IHByb3BlcnRpZXMgYWxyZWFkeSwgaXQgd2FzIG5vdCBtYW5kYXRlZCBi
eSB0aGUgRFQgYmluZGluZ3MuDQo+ID4NCj4gPiBJIHdhcyByYXRoZXIgZXhwZWN0aW5nIHRvIHNl
ZSBleHBsYW5hdGlvbiB3aHkgdGhlc2Ugd2VyZSBtaXNzaW5nLg0KPiANCj4gVG8gY2xhcmlmeTog
SSBtZWFudCwgZXhwbGFpbiB0aGUgYnVnL21pc3Rha2UuIFJlc3Qgb2YgZXhwbGFuYXRpb24gaXMg
b2suDQoNCk9oLiBPa2F5LiBJdCB3b3VsZCBoYXZlIGJlZW4ganVzdCBtaXNzZWQgd2hlbiBpdCB3
YXMgY29udmVydGVkLg0KU2hhbGwgSSBzZW5kIGEgbmV3IHZlcnNpb24gbWVudGlvbmluZyB0aGF0
IGl0IHdhcyBtaXNzZWQgaW5pdGlhbGx5Pw0KT3Igd291bGQgdGhlIGZpeGVzIHRhZyBzdWZmaWNl
IGFzIGFuIGV4cGxhbmF0aW9uPw0KDQo+IA0KPiA+DQo+ID4gRml4ZXM6IGYxMGE5YjcyMmY4MCAo
ImR0LWJpbmRpbmdzOiBpMmM6IHRlZ3JhOiBDb252ZXJ0IHRvDQo+ID4ganNvbi1zY2hlbWEiKQ0K
PiA+DQoNClJlZ2FyZHMsDQpBa2hpbA0KDQo=


Return-Path: <linux-i2c+bounces-11488-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5893AADAD46
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 12:25:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72A95188B341
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 10:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D6B527F75F;
	Mon, 16 Jun 2025 10:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pBIGd2cx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2057.outbound.protection.outlook.com [40.107.92.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F6E1EFFB8;
	Mon, 16 Jun 2025 10:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750069524; cv=fail; b=KyiiXNMLwiV7IhWyz1hZ2BFlwWoZ4bD7BUS2clUvSd1YBW3W8UHlXASDsZvtuSfjMBpMSjW4FNsMdNfA6LHAXy3PlMs/xnjn0La9ND1StZq7P0cWPfg8pKx135LGCmWtW8rcifiU7P+OPTjx2RThBOj2PQpP39j4Nkoze21SpJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750069524; c=relaxed/simple;
	bh=BzYGgGN5hQDmARHeOghdeGDAgcq2kVrQsh+smVF2rxc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AGz38+AuOZtPLTP1CrLddA3cPYp93GNaE1cpsf1X6ymfbebGpZxZo/Dv3HSoDVI80AdAxEqNnVsLEqF3gyDo2GDyczyarR8HJsnuOvmlJ2tIYu7l2GpE8qWuK7Mo+XdeeFh4H5+HynWsZWk9TTUF3NwurfyuvbQVJ2061TvF1Dc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pBIGd2cx; arc=fail smtp.client-ip=40.107.92.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wx0y6r4Y9oDkJ5Dh62MY00ERB3e06uufkGNoWWFmOX27Az45i1oNaOe85H/Y19FEEoOr66UuVTBMwWRcL+f50uUsi8VRAwlIkJ0veTwe0/v992V3wEmX/DHQWYCsqRfjsFWCx/XijY703Kk4hAV48B7E7ZVUymGs05fN6z5iHAlCyK3A9BgBOh56iGqoSaGdAf43Ehil+prvs2TCqG06jJhG5eAH7PXksj1IH+2g0fnQLtkCkXrkkAETnx9dgb3EZChbvLzdoh3FJYCGZ1JHh9oyWX3d/FRM5UqWh0XepPFuat90xEbo4DDhVm1vwPiojrTQc0w2vZ+d1FdLJ654mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BzYGgGN5hQDmARHeOghdeGDAgcq2kVrQsh+smVF2rxc=;
 b=i4QbOpVdDwSTe3TILeB3SBJUOlggA5qgmbWSfA/pM3rSOjCnDgMWBZquQExn8oipJj0dTbtcAku7DrSzWvlGb0+JeDKVO+o0HMVbqxu7I7zAmdGFEQMn5xlCM+4X/MiAF/aY6+efAL4x/JiedBAIoI1acvmDTn0kbqgEx9N0n4O9VdTVH+RE3Yr3DFBd7esaAGUzrITRnRlJpVbmvPK6stxZqBIlzp+69pDxno51Uhweeg6mnGhERxTJ2Nqbqsfo0MOkM3j9RfozboQ3PJbygZPSW8mkFd9KozVhwfejouWvggngWbe16Trxd6o2sMg4PUKZ+4UfXFmI148tvSb49g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BzYGgGN5hQDmARHeOghdeGDAgcq2kVrQsh+smVF2rxc=;
 b=pBIGd2cxTh0RUyi9lan+5ItwA25EWnr1NqF40OoOK/xrhIx1CreKXJjwrT+JCzBDOarPkuv2EV4xn3PGgVMX+858VHnTqspS9t2vYVFNsTTDXaBoOQswsxeEFUz3LveUZSq2YRHj+uL7O1puKoB+moa90kmtnj24BY0Ge0cAkrtPEHzg6xChbSEIMwLasJ0jAAfdJRx0xBBo3UCB7q5P27aoezZtu3vtY9V2wYSqOkqJC3A/X3uNYnPmWHWAMEn0sxRLhm5poRCblLD+LYGtsSHEDTsm+n0d5+4qG9x06ha/r3yvx/NpbgH4pYLKLpJRVMoTt0+xzg4LbZWcFzmzmA==
Received: from MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 by DM4PR12MB6206.namprd12.prod.outlook.com (2603:10b6:8:a7::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.29; Mon, 16 Jun 2025 10:25:19 +0000
Received: from MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861]) by MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861%5]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 10:25:18 +0000
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
Subject: Re: [PATCH v3 4/5] i2c: tegra: Add support for SW mutex register
Thread-Topic: [PATCH v3 4/5] i2c: tegra: Add support for SW mutex register
Thread-Index: AQHb2dxEiivhsHtWo0OCQRPz40s4sLQFniGA
Date: Mon, 16 Jun 2025 10:25:18 +0000
Message-ID: <c4e51677c889e74dc3d138b436af640c126ca613.camel@nvidia.com>
References: <20250609093420.3050641-1-kkartik@nvidia.com>
	 <20250609093420.3050641-5-kkartik@nvidia.com>
	 <wgpcfddybwgdt4ggllooh35iukid24urb7mrbrcd5egs4blqyv@hty6js2piqug>
In-Reply-To: <wgpcfddybwgdt4ggllooh35iukid24urb7mrbrcd5egs4blqyv@hty6js2piqug>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB5716:EE_|DM4PR12MB6206:EE_
x-ms-office365-filtering-correlation-id: fc1e69ed-cead-4b73-0e29-08ddacc017c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?N1pmYlJmWWtIdWdsMVdjSFNNc0dTeXhENkhxcldNalBqQjA3K0srNlluWW9a?=
 =?utf-8?B?TlhqVFpLZy9tYXB5a3d0Vkk0QTNFL3ZFS1BUdUVrVjVNQ3B4NVhxa0U0UUlK?=
 =?utf-8?B?dkMva3dGTzhyOENMa1hNenMzR3VkQW1kV3NCcHVhdE5mMEUzS29vLzVUMENJ?=
 =?utf-8?B?Vk1LWUZjdXh6K3RmRmprcGQwaEtBcVp6TFNpTlNEa0FsOEluazBzNkplcVpF?=
 =?utf-8?B?R254WnNUWStKVTZsN2Yzc2preEtBU09rZUhBLzIrSTJTQS9sSEs5U2wrRjA1?=
 =?utf-8?B?YWovSTFXa0tsWGRtckI1UGhSaFNyUGZzVEFRdms2RWR3MCsvRVhRamQ0VGxq?=
 =?utf-8?B?cTBzUlEzTWQ5ZnlRdisvaXhENzBqR0FZbFNCc1UrRFBwbldYWGU3ei9HOU1z?=
 =?utf-8?B?dzE4VHA2WE96UnZOK0dHUEE3SFFGWDVJMkh1MDlUN0YwWEhLc25ES2lSaDRx?=
 =?utf-8?B?VmJIWExxcVhPdGhDUEhwSGQzS2ZBaTR2LzFBRWlaRFdvRGZkQ292RHByTCt3?=
 =?utf-8?B?MnFLTExqallPMmVpVzBpVUI0V0JEZUc5NmFxTFNwMm5mOUpPMWk4N01QKzVF?=
 =?utf-8?B?My9admhwNlVJNlM1MllaZE4ycDRDTXlydHVxdGpGdlBzeXAxS2RGQXdNZVZl?=
 =?utf-8?B?TE12U0NyZE1LWDhwdDBmZkFjNjlUVmdWSzFacDloSWdGVnpJU3YzaEVKekpx?=
 =?utf-8?B?Nk5xa0VST0xESTF3RDUweWcxTE5PWDFVc1Vsd05wMFd3dk9mWlRiSTRBM0hO?=
 =?utf-8?B?SHZ0S1NRMytST2g3cGhZUjdYL3hJTlVlWGtDUmxOampSN0NoSGNCZ3lsd0ln?=
 =?utf-8?B?TWFFdWNKNGlqYjhiZjcrUjA5OGZhb2VKRnNweHdmVFEyWlN2TG9sRklJUWYr?=
 =?utf-8?B?enFuMnprK1ZHcUFweXlremRuelZpdjNiT1VzMElVQStzS0FaelV3T3BRKzll?=
 =?utf-8?B?c0JmRWo2QzFYQ0txN2VvcTNtMGJ1NlE4dDUzWnZMSVpsMXU1VEdsTVdwZ00x?=
 =?utf-8?B?VVd5RVNjL3N4Vk5EeGtHTzdlTitacXlkdlpCSWFya09aSDdKdVEra1VOTVJU?=
 =?utf-8?B?cjhEcmhXejlmZzRBRW9tMTJsRVZncGxqWE52Y0R4NWg1UjZnTUtDbzRaWHBG?=
 =?utf-8?B?dDlVdm1NV1g3b1VjRUUrU3oyZDgveXh2ZnR2bXd5SDhUckFucktiQ0piRTVk?=
 =?utf-8?B?WTZnKy9yY1hWUHhYVy9nM2JDQU1xb0w0WlBBTHV0ZXYzRStDbXJGdW1ZRVB2?=
 =?utf-8?B?UFFBZXVMU3FqWkIvUHZKVmVXWmtZRzloekJ3MU5INC9lQnpKd0ZWaUkwMVBi?=
 =?utf-8?B?UjdUR1ZPRHZDWjczbnZ0cXBqRXlDSW1PYnZSNGVLczVSRGMyU0txQm12Zm9J?=
 =?utf-8?B?b1I1Z1FGWkIrckFzUTV6UFR0RUR6NGE0RW9RTnVOc2M5WDJodFpiaFlHQjNV?=
 =?utf-8?B?QWR2M25CZkMxQkVudW9ycXlaZllaZzNsd1k2UHFpRDN6MjYvbUhBWHF0dzJF?=
 =?utf-8?B?M21aSzJhK3ZUVjlrNWNXRWdZSDg2TE5MeklDczJVdEpIUC9YV29RMVN5aWx1?=
 =?utf-8?B?R2dvVGdyQVgwa2p0U2NOc2U3dEUwYXFDOXM0SkdIdzdBTU1qL3VGbkdSMEs4?=
 =?utf-8?B?OG1pUlBQWEVFcVU5UWp4cWhkUXFJZENZWWFhczVRd21yMFRDUCtiV014TDBR?=
 =?utf-8?B?b2srQks0NDRyTlRUZ09USDZRQUhFVXdxWU5ucktWY3pSRE1paFZsSVNMMmEv?=
 =?utf-8?B?ZEhnRnJ1bVB1UGppNEEvYURwZDJwU1NiMXdIUWVXRjl5NVVPdEtBQzVjZVNn?=
 =?utf-8?B?MVFPL2NBUjFNeWMxeXEyOW9GRFBkaWszT3VUQVFsOE5rUW5lU1ZDOHlycDN0?=
 =?utf-8?B?UzlpMWoyTFRYZ3JlRkx2QVFTU0VpNGZuQTFPUlppZXV5L0pLQTBrK3BldURq?=
 =?utf-8?B?Q3lWd1VFenUrS01kUUQ0VDRGSENYUWpKTEYyYXZURnBwVWlTdDAvTnBtK28w?=
 =?utf-8?B?dHd3QjZ5OTdBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5716.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NlZ2d2tmTTkwTGRZWHdIY3Z4YXBKR3ZQY0hzVXQyL05WZnV3c1RYa0RpbUNv?=
 =?utf-8?B?OCtESXl1RW1ERjdDejQ3UWVYRFh2UG9PZFBiTWZab2ZJdHh2ZHBUV3k0aXp6?=
 =?utf-8?B?R1VCT2h6S0J5cTlmOUw0ZWVuVEJPWFp0NVkrb2xvVm4wbUxZWDRGdW9tUVFC?=
 =?utf-8?B?T0N0RnRVNjI5Ymg1ckE5NXM0YjZIYmJvTG55b3JtT1M2VU5Vc2dYTHphWlNu?=
 =?utf-8?B?Y0lZN2UwWU1ObkZCelFxSnVxaCsraGJtOWI0SmovM2hqeVVwKzJyWGp2K1VF?=
 =?utf-8?B?bHVtLzgvbnFOMFJqVFRRZEQ2b1NXQ2VlT0huWWR0bVNGMVBUZy80L1kvMC8v?=
 =?utf-8?B?R2N4azFVNkpzZCtYY01DSTB4VkpJOWxDNDhtbndnR2FraEl1YzV0R1paSmRz?=
 =?utf-8?B?UlJLdEl4ajd0Qm5VSmdlTHNFUFoxdEdDWU11QUx6cTBNK0V1SkdXUzNGNkVT?=
 =?utf-8?B?TllWR25qSTJPa0NSbndlZnhEWDJ1VXZnak1Bd0RkckgwTExFZk1wSlFUODdn?=
 =?utf-8?B?Y09jRGlQOVZPVVYyOHEzQ3MrNmE5eW5wRWpyUDF0NHZBZ3VKTDhvTG5OdHJT?=
 =?utf-8?B?Nk1ncng2eElhVURDRk5IYktKMXk0L1JieHQzYWM4Rnc4VHRtNUROQTlOekVK?=
 =?utf-8?B?d3k3STl4TjFaT2I1QmMzUVA0TndEeGxIUHNJZkRyL2todkNHU2JmS2RQck1n?=
 =?utf-8?B?aDU1YXltY2dJRmdHTlFkVWFxamZvcEwxdXB5Nlg0YzViNnVpcDJGOHhoQzYz?=
 =?utf-8?B?ZHEvdjdsYk5zR0NkTUdxbFJ0ZjdSdXR1eGwyQzNZejFpOExETVREdWhQZTBP?=
 =?utf-8?B?RGhJMDRFWWxjdU9NRHZINjVESzk5WmpCaHJIMW9sdGFVNTFtblZZSVozc1lV?=
 =?utf-8?B?bnI2UkxKc29aellDZ2ZweG10amJXWjN2VUtVNm1FQWJ3QjR2b2o2RTFlNTJr?=
 =?utf-8?B?QjM5dmJQUkxFZFRsWlV2N0V5NDFydjN0bzBwUHppcTJRZDcwSVBIelFKV2xY?=
 =?utf-8?B?Y29wZm9ZczhNbkRlSWZuajZuNXowNklpbDUzTFFZVGp1SkUyQTRtNUpwRmlP?=
 =?utf-8?B?ZkViM0dIZkpzdDByb0hXaVgreURLVXR0V0JqZ1h3OEZ3cnRKU1RGVTdOSkVM?=
 =?utf-8?B?T2h0aHAyTlR2bzI3QnRkMUszcDgvUFJBSkRtQnBLOFVYS0ZxOGw0QjBLNjBr?=
 =?utf-8?B?dE5RbnErTFJQYUw2Ukszb0h2ME1FeTFXTWVvNDNvUWdwV1ZNbU5NL2t5U1Rj?=
 =?utf-8?B?REJjL2hnNEFpQXJXSnEyd0lONkROTzNraFFxcjJxejBoRXJVYmhpL1Y5aytQ?=
 =?utf-8?B?RUQvbjZOaUlsNGZhSy9VN0NtZEQ5KzlreHRGdGo3dThNQ2pnWjBXendVU0xP?=
 =?utf-8?B?MHdKSHVVaFpobGxBbGpGdkRBZ2phRUdKbHZSWE9ON0h0T0x4TW9CdGNSMkk1?=
 =?utf-8?B?V2IrdUJKYW1WMnRkQkJad0t0ZGZxWUp6MGZ5VGhYRm85TXlxeGZVSVkycjNQ?=
 =?utf-8?B?WldPMGRaQXpyYXd6ZVJhTlIzdS9ScStxdGJzYk40WW9Da0lCdmtKMTFNOU15?=
 =?utf-8?B?T2pDNFZDeDFOQjVKdmRqdkVPbGdzVnZWZE1tK0JKNFRLMlliNDdacEVBOHgv?=
 =?utf-8?B?R3pCN2lHWnA0VWF6MU5kT01mbDhBWkRVL0pwcVFXWXpQVjQ0cHV3YnlKZUJp?=
 =?utf-8?B?a3RqNTRReVhnd0ZFajhhRWo2RWV0NmhRTjlBczJtTVZ3QVYvc2RGVGUwYTBP?=
 =?utf-8?B?NHF6TCs4NWtiRXRLR21mMEtKSkNvNWlVazNoQlUxMUd6b25jUy9WZUMwd1FL?=
 =?utf-8?B?WjVLMnZCdUxRQ2ovdm84TloxK1lkTmpmeUIwOWJHdHdsQkE3MUY2aHJLQXIx?=
 =?utf-8?B?Vlh4cmFNY2dmZ0JzOGVndFl0SitqZVRXdWM5c3REWXNwaS82Tml0OWhqcGlH?=
 =?utf-8?B?T0djUXl4VHkyekUzMlpLVktISUkxRzljcUJMNURaODN5UGoxTWlGVlZVZ0FU?=
 =?utf-8?B?UDB3bDQ4dTVzbmEwNVJKR2dJRUNmdnQ0WUQvSnV1NVhXdVFYSWxXcXRURUxH?=
 =?utf-8?B?bUEvbGhwbUMzRDJmdTByZUJxTHBzVWoxNGRoN2NTMkRKRUxwbTVEOFBUaStU?=
 =?utf-8?B?WDloYjZWMWJZcTF2WUpRMTNJeklqR0hoSFNyYkdWU3doNHVFMVh6S1pHSHhH?=
 =?utf-8?B?a1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EC72C74C3585614181CC7E3B1A4B4427@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fc1e69ed-cead-4b73-0e29-08ddacc017c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2025 10:25:18.8451
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tk4uCnktsfHxKf+kGBD4CUlAHkyUNRiNkYzu6dPDmp+UPr0kr7SkjPrheCoOqK/yXMqfDOhYyLj7yoHHR2+Ouw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6206

T24gVHVlLCAyMDI1LTA2LTEwIGF0IDA5OjQ5ICswMjAwLCBUaGllcnJ5IFJlZGluZyB3cm90ZToN
Cj4gT24gTW9uLCBKdW4gMDksIDIwMjUgYXQgMDM6MDQ6MTlQTSArMDUzMCwgS2FydGlrIFJhanB1
dCB3cm90ZToNCj4gPiBBZGQgc3VwcG9ydCBmb3IgU1cgbXV0ZXggcmVnaXN0ZXIgaW50cm9kdWNl
ZCBpbiBUZWdyYTI2NCB0byBwcm92aWRlDQo+ID4gYW4gb3B0aW9uIHRvIHNoYXJlIHRoZSBpbnRl
cmZhY2UgYmV0d2VlbiBtdWx0aXBsZSBmaXJtd2FyZXMgYW5kL29yDQo+ID4gVk1zLg0KPiA+IA0K
PiA+IEhvd2V2ZXIsIHRoZSBoYXJkd2FyZSBkb2VzIG5vdCBlbnN1cmUgYW55IHByb3RlY3Rpb24g
YmFzZWQgb24gdGhlDQo+ID4gdmFsdWVzLiBUaGUgZHJpdmVyL2Zpcm13YXJlIHNob3VsZCBob25v
ciB0aGUgcGVlciB3aG8gYWxyZWFkeSBob2xkcw0KPiA+IHRoZSBtdXRleC4NCj4gPiANCj4gPiBT
aWduZWQtb2ZmLWJ5OiBBa2hpbCBSIDxha2hpbHJhamVldkBudmlkaWEuY29tPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IEthcnRpayBSYWpwdXQgPGtrYXJ0aWtAbnZpZGlhLmNvbT4NCj4gPiAtLS0NCj4g
PiB2MiAtPiB2MzoNCj4gPiAJKiBVcGRhdGUgdGVncmFfaTJjX211dGV4X3RyeWxvY2sgYW5kDQo+
ID4gdGVncmFfaTJjX211dGV4X3VubG9jayB0bw0KPiA+IAnCoCB1c2UgcmVhZGwgYW5kIHdyaXRl
bCBBUElzIGluc3RlYWQgb2YgaTJjX3JlYWRsIGFuZA0KPiA+IGkyY193cml0ZWwNCj4gPiAJwqAg
d2hpY2ggdXNlIHJlbGF4ZWQgQVBJcy4NCj4gPiAJKiBVc2UgZGV2X3dhcm4gaW5zdGVhZCBvZiBX
QVJOX09OIGlmIG11dGV4IGxvY2svdW5sb2NrDQo+ID4gZmFpbHMuDQo+ID4gdjEgLT4gdjI6DQo+
ID4gCSogRml4ZWQgdHlwb3MuDQo+ID4gCSogRml4IHRlZ3JhX2kyY19tdXRleF9sb2NrKCkgbG9n
aWMuDQo+ID4gCSogQWRkIGEgdGltZW91dCBpbiB0ZWdyYV9pMmNfbXV0ZXhfbG9jaygpIGluc3Rl
YWQgb2YNCj4gPiBwb2xsaW5nIGZvcg0KPiA+IAnCoCBtdXRleCBpbmRlZmluaXRlbHkuDQo+ID4g
LS0tDQo+ID4gwqBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLXRlZ3JhLmMgfCAxMzcNCj4gPiArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0NCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxMjIg
aW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvaTJjL2J1c3Nlcy9pMmMtdGVncmEuYw0KPiA+IGIvZHJpdmVycy9pMmMvYnVzc2VzL2ky
Yy10ZWdyYS5jDQo+ID4gaW5kZXggZDBiNmFhMDEzYzk2Li5kYWU1OWU5ZTk5M2IgMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy10ZWdyYS5jDQo+ID4gKysrIGIvZHJpdmVy
cy9pMmMvYnVzc2VzL2kyYy10ZWdyYS5jDQo+ID4gQEAgLTEzNyw2ICsxMzcsMTQgQEANCj4gPiDC
oA0KPiA+IMKgI2RlZmluZSBJMkNfTUFTVEVSX1JFU0VUX0NOVFJMCQkJMHgwYTgNCj4gPiDCoA0K
PiA+ICsjZGVmaW5lIEkyQ19TV19NVVRFWAkJCQkweDBlYw0KPiA+ICsjZGVmaW5lIEkyQ19TV19N
VVRFWF9SRVFVRVNUCQkJR0VOTUFTSygzLCAwKQ0KPiA+ICsjZGVmaW5lIEkyQ19TV19NVVRFWF9H
UkFOVAkJCUdFTk1BU0soNywgNCkNCj4gPiArI2RlZmluZSBJMkNfU1dfTVVURVhfSUQJCQkJOQ0K
PiANCj4gTWF5YmUgdGhpcyBzaG91bGQgY29udGFpbiBzb21lIHNvcnQgb2Ygc3VmZml4IHRvIGRl
bm90ZSB3aGljaCBJRCB0aGlzDQo+IGlzPyBNYXliZSBJMkNfU1dfTVVURVhfSURfQ0NQTEVYPw0K
DQpBY2ssIEkyQ19TV19NVVRFWF9JRF9DQ1BMRVggc291bmRzIGdvb2QuIEkgd2lsbCB1cGRhdGUg
dGhpcyBpbiBuZXh0DQpyZXZpc2lvbi4NCg0KPiANCj4gPiArDQo+ID4gKy8qIFNXIG11dGV4IGFj
cXVpcmUgdGltZW91dCB2YWx1ZSBpbiBtaWxsaXNlY29uZHMuICovDQo+ID4gKyNkZWZpbmUgSTJD
X1NXX01VVEVYX1RJTUVPVVQJCQkyNQ0KPiA+ICsNCj4gPiDCoC8qIGNvbmZpZ3VyYXRpb24gbG9h
ZCB0aW1lb3V0IGluIG1pY3Jvc2Vjb25kcyAqLw0KPiA+IMKgI2RlZmluZSBJMkNfQ09ORklHX0xP
QURfVElNRU9VVAkJCTEwMDAwMDANCj4gPiDCoA0KPiA+IEBAIC0yMTAsNiArMjE4LDcgQEAgZW51
bSBtc2dfZW5kX3R5cGUgew0KPiA+IMKgICogQGhhc19pbnRlcmZhY2VfdGltaW5nX3JlZzogSGFz
IGludGVyZmFjZSB0aW1pbmcgcmVnaXN0ZXIgdG8NCj4gPiBwcm9ncmFtIHRoZSB0dW5lZA0KPiA+
IMKgICoJCXRpbWluZyBzZXR0aW5ncy4NCj4gPiDCoCAqIEBoYXNfaHNfbW9kZV9zdXBwb3J0OiBI
YXMgc3VwcG9ydCBmb3IgaGlnaCBzcGVlZCAoSFMpIG1vZGUNCj4gPiB0cmFuc2ZlcnMuDQo+ID4g
KyAqIEBoYXNfbXV0ZXg6IEhhcyBtdXRleCByZWdpc3RlciBmb3IgbXV0dWFsIGV4Y2x1c2lvbiB3
aXRoIG90aGVyDQo+ID4gZmlybXdhcmVzIG9yIFZNcy4NCj4gPiDCoCAqLw0KPiA+IMKgc3RydWN0
IHRlZ3JhX2kyY19od19mZWF0dXJlIHsNCj4gPiDCoAlib29sIGhhc19jb250aW51ZV94ZmVyX3N1
cHBvcnQ7DQo+ID4gQEAgLTIzNyw2ICsyNDYsNyBAQCBzdHJ1Y3QgdGVncmFfaTJjX2h3X2ZlYXR1
cmUgew0KPiA+IMKgCXUzMiBzZXR1cF9ob2xkX3RpbWVfaHNfbW9kZTsNCj4gPiDCoAlib29sIGhh
c19pbnRlcmZhY2VfdGltaW5nX3JlZzsNCj4gPiDCoAlib29sIGhhc19oc19tb2RlX3N1cHBvcnQ7
DQo+ID4gKwlib29sIGhhc19tdXRleDsNCj4gPiDCoH07DQo+ID4gwqANCj4gPiDCoC8qKg0KPiA+
IEBAIC0zODAsNiArMzkwLDEwOCBAQCBzdGF0aWMgdm9pZCBpMmNfcmVhZHNsKHN0cnVjdCB0ZWdy
YV9pMmNfZGV2DQo+ID4gKmkyY19kZXYsIHZvaWQgKmRhdGEsDQo+ID4gwqAJcmVhZHNsKGkyY19k
ZXYtPmJhc2UgKyB0ZWdyYV9pMmNfcmVnX2FkZHIoaTJjX2RldiwgcmVnKSwNCj4gPiBkYXRhLCBs
ZW4pOw0KPiA+IMKgfQ0KPiA+IMKgDQo+ID4gK3N0YXRpYyBpbnQgdGVncmFfaTJjX3BvbGxfcmVn
aXN0ZXIoc3RydWN0IHRlZ3JhX2kyY19kZXYgKmkyY19kZXYsDQo+ID4gKwkJCQnCoMKgIHUzMiBy
ZWcsIHUzMiBtYXNrLCB1MzINCj4gPiBkZWxheV91cywNCj4gPiArCQkJCcKgwqAgdTMyIHRpbWVv
dXRfdXMpDQo+ID4gK3sNCj4gPiArCXZvaWQgX19pb21lbSAqYWRkciA9IGkyY19kZXYtPmJhc2Ug
Kw0KPiA+IHRlZ3JhX2kyY19yZWdfYWRkcihpMmNfZGV2LCByZWcpOw0KPiA+ICsJdTMyIHZhbDsN
Cj4gPiArDQo+ID4gKwlpZiAoIWkyY19kZXYtPmF0b21pY19tb2RlKQ0KPiA+ICsJCXJldHVybiBy
ZWFkbF9yZWxheGVkX3BvbGxfdGltZW91dChhZGRyLCB2YWwsICEodmFsDQo+ID4gJiBtYXNrKSwN
Cj4gPiArCQkJCQkJwqAgZGVsYXlfdXMsDQo+ID4gdGltZW91dF91cyk7DQo+ID4gKw0KPiA+ICsJ
cmV0dXJuIHJlYWRsX3JlbGF4ZWRfcG9sbF90aW1lb3V0X2F0b21pYyhhZGRyLCB2YWwsICEodmFs
DQo+ID4gJiBtYXNrKSwNCj4gPiArCQkJCQkJIGRlbGF5X3VzLA0KPiA+IHRpbWVvdXRfdXMpOw0K
PiA+ICt9DQo+IA0KPiBUaGUgbW92ZSBvZiB0aGlzIGZ1bmN0aW9uIHNlZW1zIHVubmVjZXNzYXJ5
Lg0KDQpBY2ssIEkgd2lsbCBmaXggdGhpcyBpbiB0aGUgbmV4dCByZXZpc2lvbi4NCg0KPiANCj4g
PiArDQo+ID4gK3N0YXRpYyBpbnQgdGVncmFfaTJjX211dGV4X3RyeWxvY2soc3RydWN0IHRlZ3Jh
X2kyY19kZXYgKmkyY19kZXYpDQo+ID4gK3sNCj4gPiArCXVuc2lnbmVkIGludCByZWcgPSB0ZWdy
YV9pMmNfcmVnX2FkZHIoaTJjX2RldiwNCj4gPiBJMkNfU1dfTVVURVgpOw0KPiA+ICsJdTMyIHZh
bCwgaWQ7DQo+ID4gKw0KPiA+ICsJdmFsID0gcmVhZGwoaTJjX2Rldi0+YmFzZSArIHJlZyk7DQo+
ID4gKwlpZCA9IEZJRUxEX0dFVChJMkNfU1dfTVVURVhfR1JBTlQsIHZhbCk7DQo+ID4gKwlpZiAo
aWQgIT0gMCAmJiBpZCAhPSBJMkNfU1dfTVVURVhfSUQpDQo+ID4gKwkJcmV0dXJuIDA7DQo+ID4g
Kw0KPiA+ICsJdmFsID0gRklFTERfUFJFUChJMkNfU1dfTVVURVhfUkVRVUVTVCwgSTJDX1NXX01V
VEVYX0lEKTsNCj4gPiArCXdyaXRlbCh2YWwsIGkyY19kZXYtPmJhc2UgKyByZWcpOw0KPiA+ICsN
Cj4gPiArCXZhbCA9IHJlYWRsKGkyY19kZXYtPmJhc2UgKyByZWcpOw0KPiA+ICsJaWQgPSBGSUVM
RF9HRVQoSTJDX1NXX01VVEVYX0dSQU5ULCB2YWwpOw0KPiA+ICsNCj4gPiArCWlmIChpZCAhPSBJ
MkNfU1dfTVVURVhfSUQpDQo+ID4gKwkJcmV0dXJuIDA7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIDE7
DQo+ID4gK30NCj4gDQo+IERvIHdlIG5lZWQgc29tZSBzb3J0IG9mIGxvY2tpbmcgYXJvdW5kIHRo
ZXNlPyBPciBpcyB0aGlzIGFsd2F5cw0KPiBndWFyYW50ZWVkIHRvIGJlIGNhbGxlZCBmcm9tIGEg
bG9ja2VkIHJlZ2lvbiBhbHJlYWR5Pw0KDQpUaGlzIGlzIGN1cnJlbnRseSBjYWxsZWQgZnJvbSBs
b2NrZWQgcmVnaW9uLiBCdXQsIHNpbmNlIHdlIHBsYW4gdG8gbW92ZQ0KdGhlc2UgQVBJcyBvdXQg
b2YgYnVzIGxvY2svdW5sb2NrIG9wZXJhdGlvbnMgd2Ugc2hvdWxkIGFkZCBhIGxvY2sNCmFyb3Vu
ZCB0aGVzZS4NCg0KPiANCj4gPiArDQo+ID4gK3N0YXRpYyB2b2lkIHRlZ3JhX2kyY19tdXRleF9s
b2NrKHN0cnVjdCB0ZWdyYV9pMmNfZGV2ICppMmNfZGV2KQ0KPiA+ICt7DQo+ID4gKwl1bnNpZ25l
ZCBpbnQgbnVtX3JldHJpZXMgPSBJMkNfU1dfTVVURVhfVElNRU9VVDsNCj4gPiArDQo+ID4gKwkv
KiBQb2xsIHVudGlsIG11dGV4IGlzIGFjcXVpcmVkIG9yIHRpbWVvdXQuICovDQo+ID4gKwl3aGls
ZSAoLS1udW1fcmV0cmllcyAmJiAhdGVncmFfaTJjX211dGV4X3RyeWxvY2soaTJjX2RldikpDQo+
ID4gKwkJdXNsZWVwX3JhbmdlKDEwMDAsIDIwMDApOw0KPiANCj4gTWF5YmUgdGhpcyBjYW4gYmUg
cmV3cml0dGVuIHRvIGJlIGVhc2llciBvbiB0aGUgZXllPyBTb21ldGhpbmcgbGlrZToNCj4gDQo+
IAl3aGlsZSAoLS1udW1fcmV0cmllcykgew0KPiAJCWlmICh0ZWdyYV9pMmNfbXV0ZXhfdHJ5bG9j
ayhpMmNfZGV2KSkNCj4gCQkJYnJlYWs7DQo+IA0KPiAJCXVzbGVlcF9yYW5nZSgxMDAwLCAyMDAw
KTsNCj4gCX0NCj4gDQo+IGxvb2tzIGEgYml0IGVhc2llciB0byBmb2xsb3cuIEl0IG1heSBhbHNv
IGJlIGJldHRlciB0byBjaGFuZ2UgdGhpcyB0bw0KPiBhDQo+IHByb3Blcmx5IHRpbWVkIGxvb3Au
IEFzIGl0IGlzLCB0aGUgdXNsZWVwX3JhbmdlKCkgY2FuIHRha2UgYW55d2hlcmUNCj4gZnJvbQ0K
PiAxIHRvIDIgbXMsIHNvIGVmZmVjdGl2ZWx5IEkyQ19TV19NVVRFWF9USU1FT1VUIDI1IGNhbiBi
ZSA1MCBtcyBsb25nLg0KPiBJJ20NCj4gc3VyZSB0aGF0IGRvZXNuJ3QgbWF0dGVyIGFsbCB0aGF0
IG11Y2gsIGJ1dCBpdCdzIGEgYml0IG9mIGFuDQo+IGFtYmlndW91cw0KPiBzcGVjaWZpY2F0aW9u
LiBTbyBJIHRoaW5rIHdlIHNob3VsZCBlaXRoZXIgYmUgcHJlY2lzZSB3aXRoIGEgdGltZWQNCj4g
bG9vcA0KPiBpZiB3ZSBzcGVjaWZ5IHRoZSB0aW1lb3V0IGluIG1pbGxpc2Vjb25kcyBvciB3ZSBz
aG91bGQgbm90IHByZXRlbmQNCj4gdGhhdA0KPiB3ZSBjYXJlIGFib3V0IHRoZSBzcGVjaWZpYyB0
aW1lIGFuZCByZW5hbWUgdGhlIHZhcmlhYmxlIHRvIHNvbWV0aGluZw0KPiBsaWtlIEkyQ19TV19N
VVRFWF9SRVRSSUVTIGluc3RlYWQuIEkgcHJlZmVyIHRoZSB0aW1lZCBsb29wIHZhcmlhbnQsDQo+
IGFuZA0KPiBJIHRoaW5rIHRoZXJlJ3Mgd2F5cyB5b3UgY2FuIHVzZSBoZWxwZXJzIGZyb20gbGlu
dXgvaW9wb2xsLmggdG8NCj4gYWNoaWV2ZQ0KPiB0aGlzIChpLmUuIHVzZSB0aGUgZ2VuZXJpYyBy
ZWFkX3BvbGxfdGltZW91dCgpIHdpdGgNCj4gdGVncmFfaTJjX211dGV4X3RyeWxvY2sgYXMgb3Ag
cGFyYW1ldGVyIGFuZCBwYXNzaW5nIGkyY19kZXYgYXMgYXJncykuDQoNCkkgd2lsbCB1cGRhdGUg
dGhlIGltcGxlbWVudGF0aW9uIHRvIHVzZSByZWFkX3BvbGxfdGltZW91dCgpIHRvIGFjaGlldmUN
CmFuIGFjY3VyYXRlIHRpbWVvdXQgaGVyZQ0KDQo+IA0KPiA+ICsNCj4gPiArCWlmICghbnVtX3Jl
dHJpZXMpDQo+ID4gKwkJZGV2X3dhcm4oaTJjX2Rldi0+ZGV2LCAidGltZW91dCB3aGlsZSBhY3F1
aXJpbmcNCj4gPiBtdXRleCwgcHJvY2VlZGluZyBhbnl3YXlcbiIpOw0KPiA+ICt9DQo+IA0KPiBJ
IHRha2UgaXQgdGhlcmUncyBubyB3YXkgdG8gcmVmdXNlIG9wZXJhdGlvbnMgc2luY2UgdGhlcmUn
cyBubyByZXR1cm4NCj4gdmFsdWUgZm9yIHRoaXMgZnVuY3Rpb24/IEkgd29uZGVyIGlmIGl0J3Mg
dGhlIHJpZ2h0IGludGVyZmFjZSBmb3INCj4gdGhpcywNCj4gdGhlbi4gSWYgdGhlcmUncyBubyBt
ZWNoYW5pc20gdG8gZW5mb3JjZSB0aGUgbG9jayBpbiBoYXJkd2FyZSwgdGhlbg0KPiB3ZQ0KPiBt
dXN0IHNvbWVob3cgcmVzcGVjdCBpdCBpbiBzb2Z0d2FyZS4gUHJvY2VlZGluZyBldmVuIGFmdGVy
IGZhaWxpbmcgdG8NCj4gYWNxdWlyZSB0aGUgbG9jayBzZWVtcyBsaWtlIGEgcmVjaXBlIGZvciBi
cmVha2luZyB0aGluZ3MuDQoNClNob3VsZCBJIG1vdmUgdGhlIGxvY2svdW5sb2NrIG9wZXJhdGlv
bnMgdG8NCnRlZ3JhX2kyY19ydW50aW1lX3Jlc3VtZS9zdXNwZW5kIGZ1bmN0aW9ucz8NCg0KVGhh
dCB3YXkgd2UgY2FuIHByb3BhZ2F0ZSB0aGUgZXJyb3IgY29ycmVjdGx5IGFuZCBmYWlsIGluIGNh
c2Ugd2UgZG8NCm5vdCBhY3F1aXJlIHRoZSBtdXRleC4NCg0KPiANCj4gQWxzbywgdGhpcyBsb29r
cyBzbGlnaHRseSB3cm9uZy4gV2hhdCBpZiB0aGUgdHJ5bG9jayBzdWNjZWVkcyBvbiB0aGUNCj4g
bGFzdCByZXRyeT8gbnVtX3JldHJpZXMgd2lsbCBoYXZlIGJlZW4gZGVjcmVtZW50ZWQgdG8gMCBh
dCB0aGF0DQo+IHBvaW50LA0KPiBzbyB3ZSdsbCBzZWUgdGhlIHdhcm5pbmcgZXZlbiBpZiBpdCBk
aWQgc3VjY2VlZC4NCg0KWW91IGFyZSBjb3JyZWN0LCBpZGVhbGx5IHdlIHNob3VsZCBjaGVjayBJ
MkNfU1dfTVVURVggcmVnaXN0ZXIgdG8ga25vdw0KaWYgdGhlIG11dGV4IGhhcyBiZWVuIGFjcXVp
cmVkIG9yIG5vdC4NCkkgd2lsbCBmaXggdGhpcyBpbiB0aGUgbmV4dCByZXZpc2lvbi4NCg0KPiAN
Cj4gVGhpZXJyeQ0KDQpUaGFua3MgJiBSZWdhcmRzLA0KS2FydGlrDQoNCg==


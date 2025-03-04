Return-Path: <linux-i2c+bounces-9713-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE1DA4D6A1
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Mar 2025 09:37:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF0423AA9B3
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Mar 2025 08:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C0561FBCA3;
	Tue,  4 Mar 2025 08:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kUdfruif";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="ouHCZ5Hf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83ED61DFD8B;
	Tue,  4 Mar 2025 08:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741077459; cv=fail; b=DZ+4TyawWRLgwT6b/lbk9vzJxQwFcRx5lGwGndFwa8YarNhoN5RkB6GR5KbN/7O8FT1/InosbeagI8qcAH3byVEQf0Ce9WGV+bXgTzUEEgqL6aevCD4UJk8pQ5kabw3zURncrtRCoA2ZPOGHD5vX6CgkMHKG2s06A2WkpbUCyEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741077459; c=relaxed/simple;
	bh=kIeRtdNKIn42i4pVgjjZwBuXmLUr/uVDd/aXavNpnjE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Z1s81GMqA+Gz1KTjfbzpszEEMFgjmRmnssjSa8K0Pd26dhfJVb+ssJvvp380tZQt0d/U3Tzx2PfxBZBJ/JvFYgFPPTUnwYkxw1tPJFZ/YkJFENSMWbod+uXmevNtcpcfRFbl5ky0HBb88DF+l12+cKteBHIj7efttgqMHKvBuB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=kUdfruif; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=ouHCZ5Hf; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: e95fb2a0f8d311efaae1fd9735fae912-20250304
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=kIeRtdNKIn42i4pVgjjZwBuXmLUr/uVDd/aXavNpnjE=;
	b=kUdfruifWXtfI4ltZgGtz0cuulVKIOs+BvCqEToLI9/dlhc1SB6lKNg8jNIPEIxMst+BQWkAtVqf0cLV+zaXnCaCe86rrTFjAZPsRNE88pB6LUx1s+wKjCNZYO9zj8UEyFc+lI0XXeNtowsp0jYn+fbKKW0+Q9M1KN9/Ecyoy/U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:153417d8-0cbf-4c48-8db3-f2e96d7b509b,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:0ef645f,CLOUDID:af5ad3b5-a2a1-4ef3-9ef9-e116773da0a7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e95fb2a0f8d311efaae1fd9735fae912-20250304
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <zoie.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1789193544; Tue, 04 Mar 2025 16:37:30 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 4 Mar 2025 16:37:29 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 4 Mar 2025 16:37:29 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yaX6rzRC6MS3i3yOUi9DgT20ebOGPEqyh5AJOWVwp9WZD+X5NQHrA5e3x7LWL7E1M6AU5+08lNx6I2YsWXC8lohF2fQT0Vr/EtHvDY1UQtyRTHhOhB5CmIQf1LoIEwt0+feeb2d1wwfWRgFRZTAtHLeJwZNiuLcbgMLN+JSaTIcmw00QzJ1SSZ0oe5fgetZOTg3egl1wUJa+JDT5gt/4b8MT9zbOxnD72dGmleigumXzaLFz2IeIjmMEXsoclicTdYRMh4Oy2wNXII2zHeJq/guQ0ce5I/iaJv7/p+VI2GEFUnY9rNOi8w6a8JH+9e9HBnV3eOF76taI+FmJQSjXNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kIeRtdNKIn42i4pVgjjZwBuXmLUr/uVDd/aXavNpnjE=;
 b=ePuREawIRdiXmPzWMClvfVOBSBp5gg+et4Fv2CgQGv3ltMjNtjs+MZpHG9k2UU/e/p9uqC5weewq9qLL/A5KyZV4ZQ1au8Y28++8MF0+2ycM/dR0DXlg9GihanaFPffK1HSs7eaK2s64A/IneFUH+kz817gcohj5Y4yoVTzI/xGgkPht2UU/eIw1VVXa5XUc15FFHD/QfD6tSL2suRZK9HLX7dVmBi/0PUba48SLfsEg/F/JPR6RFxTa4nMh/2HFECTksrYGmhY5SBpIANbtHMTqke5RtSgQq5/nGh40O6bUYtvnOVAHOLl/jR6tVvo2qv9ZhN5399rsfxB+WRbZ/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kIeRtdNKIn42i4pVgjjZwBuXmLUr/uVDd/aXavNpnjE=;
 b=ouHCZ5Hfj7RSpJA7zHtSbw0XwNtxRW9hMoFsrI2YctQnGx8QqaIDukMv3+8aj5P4SNgmXsckLC9/3vN7g/vYFFwJWeghbAEtJvDFaa6upPAqZ7y4IEA7Kn5rbvRXL75oYlg7T6nTSSWRmTcITwuSzILIdAWeQc0AnWwSiALSiNE=
Received: from TY0PR03MB6369.apcprd03.prod.outlook.com (2603:1096:400:149::5)
 by KL1PR03MB6975.apcprd03.prod.outlook.com (2603:1096:820:ba::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.29; Tue, 4 Mar
 2025 08:37:27 +0000
Received: from TY0PR03MB6369.apcprd03.prod.outlook.com
 ([fe80::5be6:4966:bde3:3508]) by TY0PR03MB6369.apcprd03.prod.outlook.com
 ([fe80::5be6:4966:bde3:3508%6]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 08:37:27 +0000
From: =?utf-8?B?Wm9pZSBMaW4gKOael+emueWmoSk=?= <Zoie.Lin@mediatek.com>
To: =?utf-8?B?UWlpIFdhbmcgKOeOi+eQqik=?= <Qii.Wang@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "andi.shyti@kernel.org"
	<andi.shyti@kernel.org>
CC: =?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?= <Teddy.Chen@mediatek.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	=?utf-8?B?U2h1bmNoYW5nIFdhbmcgKOeOi+iInOaYjCk=?=
	<ot_shunchang.wang@mediatek.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?Sm9zZXBoLUNDIENoYW5nICjlvLXmrL3mtLIp?=
	<Joseph-CC.Chang@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, =?utf-8?B?TGVpbGsgTGl1ICjliJjno4op?=
	<Leilk.Liu@mediatek.com>
Subject: Re: [PATCH v4 0/1] i2c: mediatek: add runtime PM operations and bus
 regulator control
Thread-Topic: [PATCH v4 0/1] i2c: mediatek: add runtime PM operations and bus
 regulator control
Thread-Index: AQHbfJLszj2qf0eqTEG6vEp9/t0xa7NFI78AgB2kawA=
Date: Tue, 4 Mar 2025 08:37:27 +0000
Message-ID: <ec77bb9478cd86a6737b92135170064970925b3c.camel@mediatek.com>
References: <20250211144016.488001-1-zoie.lin@mediatek.com>
	 <46621db1-6096-46af-b021-c919c1cae7ef@collabora.com>
In-Reply-To: <46621db1-6096-46af-b021-c919c1cae7ef@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB6369:EE_|KL1PR03MB6975:EE_
x-ms-office365-filtering-correlation-id: 7468be5e-df8f-40c7-6e52-08dd5af7cb71
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZlFrNUFiZitiWHBzSjgvdjJaZGFJb1FTdkJkVERtd05mMFhrUHZTOXdRMzF5?=
 =?utf-8?B?LytHMCtXOERKNmg3cEdMS003UGQrcGVuOW9DZERWTEJIeSs0Qk5hTmNLY1Ur?=
 =?utf-8?B?QnV1OTYybnRiWkpCcHIyWVY0eEZsZktwSmdldG5RY1dIbHNEQnExNy8yU1Iv?=
 =?utf-8?B?bjZpRmVyRVNQMzdLa2xKVmN0ZWsrMHhVRGpaVGxmUzQ0NWpMTUZPUm1xSC9l?=
 =?utf-8?B?VFV5azI0bkkrNmVHMEl5STZNSVNtQ2RPaXV5MklpN2tldGVDZ0NtWW03bDFV?=
 =?utf-8?B?UW9IRE5qZW1hRzZySzcrOXgwVERVNDNvanJOK3VXSi80Ukp1U1ZqcVNQamFD?=
 =?utf-8?B?YVdLWktTa2pLVmpkcVZaTVVtcUNaVGpQaWRPM1dPeXFGK2ZJelFMMUIzd2Qy?=
 =?utf-8?B?TzlabVEvaTNSeVhEVUExKzRnUm82U0FWNFlEbnZLZXM2VFFMSm9vZklTSkhE?=
 =?utf-8?B?VkFBTTJ5VERNdEM3NVBMREJkUkczMEM1blNSb2t5Sk1Yb3p4eUFRclZPTFlI?=
 =?utf-8?B?d09ITlJMSVFYRmN1L09VdjRuaHcvb1VLY2EzMGZZL2FHQitjR3V2OEtEdTJr?=
 =?utf-8?B?eVVreXpBWS9hbmg3SFNMUDNvR0JGZ3A3S3VBZnhZSE9WU1ZDUFg1eGZvS3pv?=
 =?utf-8?B?WmNFMVFuQnVRb0wrK1h0WVNzZ1M1WlRIUnQvZndEUE8xQTV0ODVid3BkUnVl?=
 =?utf-8?B?S0pUdHp3WlpYTGQxemN5OU16cFduUTJBNXlPWmIyQUFlQXBJa2hvYjI1dDdz?=
 =?utf-8?B?d1RzdXBSSzdGSFg2SWNNenlLUXF0d1NKSlhBVGJYMVVpbFpaVmZQbGFyMHla?=
 =?utf-8?B?MkM5ak8vSXM5WGhHWGhPVWhFWHlUMEpzYmlYVTFjNGR2RDdBMkhEKzVkVFMy?=
 =?utf-8?B?aE9IRG55dlNaeDNkWURCUlVnWUlCUjRJQXlkVkFkWFNwa0p2OVdvTFFrYjdS?=
 =?utf-8?B?K2tMWTV3ZmNjTWZXTVB6VDR3eVFDTzRUYjBvMDJVbGJqY2QyT282VG5haEVy?=
 =?utf-8?B?eXdyWW40TEY2YXRuNVloSmJaOEtJVTBmOW5uSm01aGo4ay92VzhOVjM0dTZa?=
 =?utf-8?B?ekpzV3Nsa2p5dUJlNVgyN2sxdU0zN3BORHZSZTR1Tms0OU80T2VCZnAvUTBj?=
 =?utf-8?B?aHhvVllWVmJOOUFZMGZVZnM0MHhySHhYSHVjMDVURm5uVkU3L05PZE5KM0M4?=
 =?utf-8?B?Q1dHWlZTaS9zTnFxc3F5OGI4YVZUMlZyRWY2bmVFZnRwRlVqb3I1YUJLWnJH?=
 =?utf-8?B?eEU4U1grbnMxQW9LSlQrVnpQMEs2VnhNa3I3a0NITHBOdG1Vc2JXMm8xNExF?=
 =?utf-8?B?MWdvVnlQUXpEZnpwL09vS0k1aUZvY3ZMSUF3OUZKZytvRlQvY2k5em5PTlNp?=
 =?utf-8?B?NmZwOEVUS0Z3T3BKNzdYdVN4a3ZFbnNBQis4KysxMWJYN2pxYlpneTA5aEFK?=
 =?utf-8?B?S2tQN1lGbnF5M2RoUXR1UFo0cG9TWFZPNlF6MDh6U3o4TjdxWmtkbW1JWHht?=
 =?utf-8?B?Kzg5cDNvdTdXZVpkdG5IUU5NV0dKaFJMRmpROTZjRTh1dlZ0enpDZzBsQUNK?=
 =?utf-8?B?TDdKZzBiMWs2QVRmWFlSNTlsb2FpTEpGMDRVM3VkMmJSYlZ0VjNLS0RwOWpX?=
 =?utf-8?B?cjhNc2JkcFlKVmozMFdsWDhubGVGSENTdmFwd1ZiaXFIMERyaEV0SzZ6OVl6?=
 =?utf-8?B?K0pnK1hHZkhVTVZLTzgwTTRtbzdBcjJnVWhUT2tZaVRIanM5RlQ2a0JPSlZ1?=
 =?utf-8?B?aHBabFF1MXpzVHVmZ1o2Y01uajJsSFUrMFlWTWRtOC9aTkZhWHFsdDJSVHVm?=
 =?utf-8?B?R1dnanNvdUNMdWR2WlZseUNqM2QyL2U2a3RSeGl5NzIxV1dZUU9hSzZ1Yy9I?=
 =?utf-8?B?Zy9ZSWNWNlJ2dzdVenkxanI2Q0hYcDlSTWZIL3RwSnhPNk9JSjBaTkZxdmpi?=
 =?utf-8?Q?FoZz/H+rlJ9rPrU4+03XrQ9BZ7SSb+oo?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR03MB6369.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ejlWOGMxVGprVVdDT0NzRGgydEw2dzREUEJPYzFqdkJ2bU0vWmphRERyL2NR?=
 =?utf-8?B?aE4vZE1yYTNMdVk4N0RFSjBwT1JPRjlnWGV3aXlWZE1JS2VwR3lYaVFmSTJU?=
 =?utf-8?B?VkVXcE1LaGJnK0hFVXR2eXRIQ0gzMVpKSEdNSnJmMmR2UVFCRGRwUXFnb3lX?=
 =?utf-8?B?VTdXdDlMOTJVU0d6Nk12WUJYV2FibkxZZWYwbTRacHUzVXlYY2JFT2czUG5a?=
 =?utf-8?B?dEwwdkVGK0syMmdSSmx4L3k4ZGRqQUN5b084dFJxRVJBMU9WNWpDU2JaeTRV?=
 =?utf-8?B?OEVvd3orVm5CdUI3SmZSa3FmMHZZdEhhT21DMmFDdmpBazdmZXpDL2dOY3lq?=
 =?utf-8?B?bmRwNzF4MndlRGhEU3hUV0VHdTF1RUsvTEV5WVZvVXMvWnF4aFZLMDBQK0hu?=
 =?utf-8?B?eStqQjA1WnZJMlhDMGg5cVB4VDVjZTJqT2xZTUJhdXdRR3E0SW8xZkhEMmE3?=
 =?utf-8?B?U2p1cnplbWxCNkZBS3FVbkRzZC9RWkp5eFliRXFYR2dHQXRRMGxmWTZDb05y?=
 =?utf-8?B?WHlOM1NGM0EvWjdlek5IcUx5UmRaTGdnbVpka0tGZW1NaXNoaHRhQjcyUTNB?=
 =?utf-8?B?cllIZTVoZkg3Qnk3MCsrZzhPWmZtZ2dVVnA3MkdLR1RDa1V0VTQwd092a3o2?=
 =?utf-8?B?Q2dyKzJHcG1NQVJsMTcreTBpcDdOMVdVMDZ4NzhGbDJWQklMT3VFZ0U5a3J5?=
 =?utf-8?B?L2JqNFUrVWsxL1YvUG5yZDhCUWlUWVgySGpPdU1VUmFEMHBjWHFqcTAvRGxD?=
 =?utf-8?B?Q09kWFg0WFpTd05vcXdReTNVVkc1OGNBOU8yZ1cyeXZucXlDSjIvUHZ2WEtB?=
 =?utf-8?B?bUJqV1Zyb2k0UVMxajc5VmRFUE54endscnowUDdGNWVBdklrZ1V6L3FvdWgy?=
 =?utf-8?B?UGRBT3BHcXB4TFpoNnozekVySUVYalhzMmNyeE81OW1EMDQwOUJKcjhhc3pY?=
 =?utf-8?B?ejFpeHJFMkxLVlN5TE9GMWFCeDhiTEN0MXk3ZjBsTGM0bHZERjVJdExNbUpa?=
 =?utf-8?B?d2hkWGdIMlF6NHlzc0t1MWZlVGp1L2FiM1JBVnc5anFxdkZQeUp0cHFHZUp6?=
 =?utf-8?B?MHU5eTAyZGNOWGRUVnZTZE4xMXpQTWxJUmVRQ1JMUnpIeW0ra2ovVjJINThR?=
 =?utf-8?B?M0NpL0s4WGVPTjJWaTZRWXNRNnBUUnBNQmozbjFCaGRteDg0OGRHRlhxOENF?=
 =?utf-8?B?N0l3TitveGRjQmpTWWlhRnoweHVBQXNYQzNQb1hMRnBCdklybjFVVVZjWGNv?=
 =?utf-8?B?b0l1TkFKcitsWEJUSktHSFBDWlhwaG52ZERISFNnVzc3Y0NsSE1vc0RKK05j?=
 =?utf-8?B?MGNHQkduMTNqYTBTeFNKWk9uQkkzMUUzb1RYV3F0NEMrRGZSa2t2TnVqWFpD?=
 =?utf-8?B?TGN0MWdCQS9lY2NTdTR1THBYY1l3STh4RHl4VmNIQnpqYVhQYXVZa1dPZUZZ?=
 =?utf-8?B?Z295VndCWk81U0Vmd2xSQkVNeE9MbUkxajF0SVVDY0cxa2ZQcG1kL2xDMXgv?=
 =?utf-8?B?ai9ocm1UUVRkNkc1TlE1emlQZ04rMjc0QjA1Z25CMkwzVTdmLzUydjkzMk92?=
 =?utf-8?B?akVReXNyWGJQcURlZG5zUjRNM3Y2Nnp3dVNSaTU4cGVDVFdoU3pnRGNuUFVk?=
 =?utf-8?B?VlZmdlBCUGsya1Y1ek1oMmQ5aXlUUHUxNEMzMW9DdXJWbXhRODk1S0lZM1BF?=
 =?utf-8?B?ZS95emxxN25MSXR3ZmpUd1AyUmdlVWI5SEVMeFBMSzQ2Mmt1QmRVS3BvTFAw?=
 =?utf-8?B?ZTQrWUdXUWdzK3VOUDhaUVU3VUJoMVZ3NU5SanZtUE9pUnppUG5JK3pxTWhp?=
 =?utf-8?B?S1BrcFdBZ3BMZFdOWGpGcVBnVzk3TEc5cVV2UUxIL3cva2ZtRTFxdC9BRnRH?=
 =?utf-8?B?WWlSVXlhRGNPR1ZNQXpJUmxHWVd2czZYR3diVFpKZTZlUGJhNG9NZVN0cmlG?=
 =?utf-8?B?dFozcVpxYUEzOHU1aFYrYjNPQ0NpRktzc3I0U1Jxd2cwZ2pIOW9CNjVPK3Zl?=
 =?utf-8?B?azErZ3JaSXJYNWlCeGV5TnU3Vkxyd1E3TmlvSHZkUE56bkxNbHFRUTJnTlg2?=
 =?utf-8?B?MmI0MEovc1U3aC9ZZ0t5MmhlVGwzZDZnWnU3ekdnNDZwNVhEdDlJWVplLzlJ?=
 =?utf-8?B?SE9kVnFTcyt5VWVZVTZsckxQeUh2dWdFS2pzVXVUdlRpSDV1Z05UMWlibDY2?=
 =?utf-8?B?QUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D5CB8BEEAEFEDD4D8BD318A169DC341D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6369.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7468be5e-df8f-40c7-6e52-08dd5af7cb71
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2025 08:37:27.2964
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ctYKuBFajS01T7gNLHWYMmtKnfmfCWq6yXTQsxiEXvUC9mLHhjfYjTOz6fnvUpN4HN4QBA15B2NLPJIG5ico2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB6975

DQpIaSBBbmdlbG8sDQoNClRoYW5rIHlvdSBmb3IgeW91ciBzdWdnZXN0aW9ucyByZWdhcmRpbmcg
dGhlIGF1dG9zdXNwZW5kIGRlbGF5Lg0KDQpXZSB1bmRlcnN0YW5kIHRoZSBpbXBvcnRhbmNlIG9m
IGJhbGFuY2luZyBwb3dlciBlZmZpY2llbmN5IGFuZA0KcmVzcG9uc2l2ZW5lc3MuIEdpdmVuIHRo
ZSBkaXZlcnNpdHkgb2YgSTJDIGRldmljZXMgY29ubmVjdGVkDQp1bmRlciBlYWNoIHBsYXRmb3Jt
LCBpdCBpcyBpbmRlZWQgY2hhbGxlbmdpbmcgdG8gZXN0aW1hdGUgYW4NCmFwcHJvcHJpYXRlIGRl
bGF5IHRpbWUgZm9yIHRlc3RpbmcuDQoNClRoZXJlZm9yZSwgd2Ugd291bGQgbGlrZSB0byBwcm9j
ZWVkIHdpdGggeW91ciBpbml0aWFsIHN1Z2dlc3Rpb24NCmFuZCBzZXQgdGhlIGF1dG9zdXNwZW5k
IGRlbGF5IHRvIDI1MG1zLiBCYXNlZCBvbiBvdXIgcHJlbGltaW5hcnkNCnRlc3RzLCB0aGlzIGFk
anVzdG1lbnQgYXBwZWFycyB0byBiZSBhIHByYWN0aWNhbCBzb2x1dGlvbiBhY3Jvc3MgDQpvdXIg
ZXhpc3RpbmcgcGxhdGZvcm1zLg0KDQpUaGFuayB5b3UuDQoNCkJlc3QgcmVnYXJkcywNClpvaWUN
Cg0KDQpPbiBUaHUsIDIwMjUtMDItMTMgYXQgMTI6NTcgKzAxMDAsIEFuZ2Vsb0dpb2FjY2hpbm8g
RGVsIFJlZ25vIHdyb3RlOg0KPiANCj4gDQo+IFR1cm5pbmcgb24gYW5kIG9mZiByZWd1bGF0b3Jz
IGF0IHN0YXJ0IG9mIHRyYW5zZmVyIGFuZCBlbmQgb2YNCj4gdHJhbnNmZXIgcmVzcGVjdGl2ZWx5
DQo+IGlzIHZlcnkgZXhwZW5zaXZlIGFuZCwgd2hpbGUgaXQgbWFrZXMgc2Vuc2UgZm9yIHBvd2Vy
IGVmZmljaWVuY3kgb2YNCj4gdGhlIGNvbnRyb2xsZXIsDQo+IGl0IGRvZXNuJ3QgbWFrZSBzZW5z
ZSBmb3I6DQo+IA0KPiDCoCAxLiBSZXNwb25zaXZlbmVzcyAobGF0ZW5jeSk7IGFuZA0KPiDCoCAy
LiBQbGF0Zm9ybSBwb3dlciBlZmZpY2llbmN5IGF0IGEgd2hvbGUuDQo+IA0KPiBBcyBhIHN0YXJ0
LCBqdXN0IHNldCB0aGUgYXV0b3N1c3BlbmQgZGVsYXkgdG8gMjUwbXM7IHRoaXMgZ2l2ZXMgeW91
DQo+IGF0IGxlYXN0IHRpbWUNCj4gdG8gYnJpbmcgdXAgY2xvY2tzIGFuZCByZWd1bGF0b3JzIGFu
ZCB1c3VhbGx5IGZpbmlzaCBhIHRyYW5zZmVyIGF0DQo+IDQwMEtIeiwgZ2l2aW5nDQo+IHlvdSB0
aGUgY2hhbmNlIHRvIGFsc28gZ2V0IHNvbWUgbW9yZSByZXF1ZXN0cyBiZWZvcmUgYXV0b3N1c3Bl
bmQNCj4gZGVjaWRlcyB0bywgd2VsbCwNCj4gYXV0by4uc3VzcGVuZCB0aGUgZGV2aWNlLg0KPiAN
Cj4gVGhlIHJpZ2h0IHdheSBvZiBjaG9vc2luZyBhbiBhdXRvc3VzcGVuZCBkZWxheSBhIGJpdCBt
b3JlIHByZWNpc2VseSwNCj4gdGhvdWdoLCBmb3INCj4gdGhpcyBkZXZpY2UsIHdvdWxkIGJlIHRv
IGNoZWNrIHRoZSBidXMgc3BlZWQgYW5kIGNhbGN1bGF0ZSB0aGUNCj4gYXV0b3N1c3BlbmQgdGlt
ZQ0KPiBhY2NvcmRpbmdseS4NCj4gDQo+IENoZWVycywNCj4gQW5nZWxvDQo+IA0KPiANCj4gDQoN
Cg==


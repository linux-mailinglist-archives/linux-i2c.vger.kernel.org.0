Return-Path: <linux-i2c+bounces-12160-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9DEB1D21C
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Aug 2025 07:42:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BBB017D289
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Aug 2025 05:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAFD01F872D;
	Thu,  7 Aug 2025 05:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ncxrpnsR";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="EFoG3QSl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CC538B;
	Thu,  7 Aug 2025 05:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754545344; cv=fail; b=b6e0tItUkVxigvvEjeDPkvAjZaZuikupPJ/O1lQv7ObLGTLjjnVumFurtjNIn1wj/rLSkBVw4zJqZcXvkleQDTZrSuAQW1TFzX2Y7/lkkj1fD7W3ce18ryE1vNLP5Ctv7QqXjxk297YfS5XKtqrfxa3ypt9UFdRJPG56dKBt2S4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754545344; c=relaxed/simple;
	bh=oovSH/a+r6aktHbikovv2ssX04zt0j2skvOBwbKEcpE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Hmmr+YQUor/5w20oFv+KMcO3h3OkXfGvrOENQ1MHBXV5VYaiDP+rf2R3BFL1qLaz/6eF6FecPef6hQk/6For4G2MCcehd6FIf0Y7tKpP6+EVyYYSFpW2btKfHIbKn6x2Jo/V8HTmoAI7NOiQuUCXDvhLV5gab9+3jraS929i2hE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ncxrpnsR; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=EFoG3QSl; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 42250956735111f08871991801538c65-20250807
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=oovSH/a+r6aktHbikovv2ssX04zt0j2skvOBwbKEcpE=;
	b=ncxrpnsRPZ02Le6gxa8AMIZ7TkBgJfY0gWXDh5jEXMacUDlkXp2kWw44c4pKqWEcazlfh3XW2kDY7AVIqw8uhhiiau6gRd4I1RE36wLG8wAd/TlprF5mfs251siY+3V82jfwlCYY7MEfCPu3xoJE3+1u1ITI+LRs7gG14xJbx6k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:ff1eceb0-c57a-4b77-8fa5-9ff66a44654e,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:844a28ce-1ac4-40cd-97d9-e8f32bab97d5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
	t:3|15|52,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 42250956735111f08871991801538c65-20250807
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <qii.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2142601004; Thu, 07 Aug 2025 13:42:08 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 7 Aug 2025 13:42:06 +0800
Received: from TYPPR03CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 7 Aug 2025 13:42:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQhyaT4T++SVcVSqP8r624X4eXVloRv2lw1HiLfo5m4CwnaCetofRmG8wBpOlR/pF0Blvfy162MHFHn77wdvZ1HRFsLrNReGQ3Bi0nY3x0lY03YXPrtoQOwm+OV4fr0qSEc2sghPhNtzM+MD+ZYrTCxCdJx3a6qPMtKm1bV5MysKJ/oobQ5vT3hF1NChHlov2wLX6ySL4HULXC0OXxp0Xd6OsyegRdnE5WrCDosbu7IqXe3CkJo3GDFvIMItSMuR6q+0lGnrA9GACf7gKRGMw7AdpBzcIsWqw9gWt1+JoC8mzo0Nkx5xvoYpK9TToGmJtUVf+eAoBykI5nTNT6HeJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oovSH/a+r6aktHbikovv2ssX04zt0j2skvOBwbKEcpE=;
 b=cDBR20TcA/dHhqSnfldd69mq27hUPgaUcm5J9dqah111DBU3uSjIa3M0/XScPC0hXmMd8Iovl0GqfZn62VVA93WxB99U2HE4BL23kVwGBRt/llBiZh7YxnbxAdvmilvtVZLrID/2CDAClEZvJ/9fzXvs3yT1gveWO2pMiIB6RtzKJHYpaY3KR3Ez199GPbWo4lz153dniOdmwpnwOh+udSN91O6XAD80S7vHAq83aNmGPvRuFFZdd7hypItGQkVrhrTu8u9YBhG7l/HE7zQseSPu98UAgJXZ24aNg049Fzn4sGjm6Ird407/X2G2E18rlzYqW0kwwm9zjnXgoUathw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oovSH/a+r6aktHbikovv2ssX04zt0j2skvOBwbKEcpE=;
 b=EFoG3QSl8smxIv6MSOGl3Op9N3FiZnRcfhp4Gsd0uxNCFZzvUQkblf3D7GTrNVGU+d0F0Xv3aeRJcf3f736o9CKWNcwIPvZ+b7edMPKK1amWSfxYiGg0QlQyyaOQTSTWkjvT/GwtLuNqZn30eU7Hth5sSVYlacfN5MhEKK+oa1U=
Received: from SEYPR03MB6723.apcprd03.prod.outlook.com (2603:1096:101:69::5)
 by PUZPR03MB6967.apcprd03.prod.outlook.com (2603:1096:301:f8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Thu, 7 Aug
 2025 05:42:04 +0000
Received: from SEYPR03MB6723.apcprd03.prod.outlook.com
 ([fe80::685a:bbbc:f10d:dafd]) by SEYPR03MB6723.apcprd03.prod.outlook.com
 ([fe80::685a:bbbc:f10d:dafd%4]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 05:42:03 +0000
From: =?utf-8?B?UWlpIFdhbmcgKOeOi+eQqik=?= <Qii.Wang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>, Andi Shyti <andi.shyti@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?S2V3ZWkgWHUgKOiuuOWFi+S8nyk=?= <Kewei.Xu@mediatek.com>,
	=?utf-8?B?U2h1bmNoYW5nIFdhbmcgKOeOi+iInOaYjCk=?=
	<ot_shunchang.wang@mediatek.com>
CC: =?utf-8?B?6YOt5bCP5qGl?= <joe@gainstrong.cn>
Subject: =?utf-8?B?5Zue5aSNOiBbUEFUQ0hdIGkyYzogbXQ2NXh4OiBhbGxvdyBvcHRpb25hbCBw?=
 =?utf-8?Q?mic_clock?=
Thread-Topic: [PATCH] i2c: mt65xx: allow optional pmic clock
Thread-Index: AQHZ2Iw6EM/s9WyxsUOqvyMEvRH5VrAY5FKAhEIl6+A=
Date: Thu, 7 Aug 2025 05:42:03 +0000
Message-ID: <SEYPR03MB672312320C179FD2B6C9AB6CEB2CA@SEYPR03MB6723.apcprd03.prod.outlook.com>
References: <3bf827929a44c17bfb1bf1000b143c02ce26a929.1693102324.git.daniel@makrotopia.org>
 <0fd097fd-9fdb-9001-cddb-7a396fde28bb@collabora.com>
In-Reply-To: <0fd097fd-9fdb-9001-cddb-7a396fde28bb@collabora.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6723:EE_|PUZPR03MB6967:EE_
x-ms-office365-filtering-correlation-id: 3decf0b3-7575-4367-53e2-08ddd5752356
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?MmNCSnZjRkw5SmVMdTl4S2xheUVLRzhLQk5yZzRaNHdOOUdWVWdGcVI2OE90?=
 =?utf-8?B?dTBOV1lJaUVhY2ZDQjlaaFFXTWRoVUFKMEVVOVB6MnVkNm9oMXA4TGU4K29z?=
 =?utf-8?B?aW92Y3Z6NjVzTHpFNzJ4YnRTcTRDMVJQTkp0RllDeFRaYkQ2ZjVMUE96N2hQ?=
 =?utf-8?B?aVdNTGlsWDBJUDFqMXhYUGlRclQyM0tqallXZ0NLVGRQQUVlSzNPcnNDYVZr?=
 =?utf-8?B?ZVJ0TFhDblNXMWJ5ZWZZNGYwUThVL1pIWEM1TmtTazNCTk5pQzFKMVdENjRB?=
 =?utf-8?B?TlFnWFM2T1FtdlNVY3ZrMjFNSEgwU014eVFYR3ZiOFgzT3dKTVFoY1QxWTNo?=
 =?utf-8?B?NGxPZG5IeDNsNmRBOE5CelQ5R24zanBNZ3cxb2N0N3E3Wnp2d1lWQ1U4R29y?=
 =?utf-8?B?N0NzOVlaODFad0liYURJREhjY0ZDMXFLZ0doS3dxVGVEdDNxeFZ5TUcranBw?=
 =?utf-8?B?bHA2QlBLZEdtL29GS1ZYUDhPdVlhS2F4MnRFaHJ6cG5kYldPSUI3WTltRDFE?=
 =?utf-8?B?aHpnR0RLVkVtTUExcW1DK1RHNVJmNzJFWHZuenJjbE85Yk5RaEZrWTRoVXN4?=
 =?utf-8?B?c2hxL2xUOEFyZU1McFcrS2pabER4NlJraU9ic0VxbFIvVTRRSzFmWGxXUXVn?=
 =?utf-8?B?N2lFay95S0FkaUtCL2xKTHpvOTdMbDQzQStidE1RZDJwM2VCWlJRNGwwZTdF?=
 =?utf-8?B?MFFaczVBbm9XcitUNWVMcHNNWVlVT2VKTmp0OW5PU0Vyc20vanlmMUdJSzlP?=
 =?utf-8?B?T3VXdi9zcFYxc2FPNUx6dG5HUFBBTTVmdWNZdEhxQ0ZtQzNnVXMxYzZQNTBW?=
 =?utf-8?B?MUtEMzJlVGV3S3NIVU5XRU9OTFZ3Y1NITk04V3VlNmNtaW1Ndy82TEJOTzJp?=
 =?utf-8?B?OWZYQ3ZxczNBSGIvdmdIRTRmL0phTXVySTBYUVU5NlNrNzVtNGJrbmNubExy?=
 =?utf-8?B?dmFFQXM2OXQ1eGNhMWo3OElSUXVKZWUzRHdTK21KN3BtN2ZOakN4KyttZ1JC?=
 =?utf-8?B?NHo2RXA0QitNQ1VlZWg0UEllSEVaV1BUQnhmNEdrTDRSYlVLWWNvZXFJck9z?=
 =?utf-8?B?QkdWUE5XSWhuM2xQVWVZMFN2aXhEOUdVMUw1SGthU1lCSi84cFFvMWpWRXcx?=
 =?utf-8?B?U0ZCL3NNMHVBSWZsckpPWjBBeFVlYk9UaGhBU2VYMEVqSkV4b1YzRWlMR3kw?=
 =?utf-8?B?NlFHNUlNUlczbDVQVlZWT1RaRm54WEVJVEJVa2x3RVA5Z1hRUGhYZkJrejV5?=
 =?utf-8?B?VWRmYnNWTTU5NG0zMGRDRHpqcVVvdFlVbXF1OU5uM2JtRm5pMG1La0czS24r?=
 =?utf-8?B?YVdlTkV1RkxjamFVRVNDb3FKUFZpbTlYM0NrVk0wRldFSXB0cW0vdkZ5eXFN?=
 =?utf-8?B?RXlTZktWVTNYYkt6RExES2IzTm10QXNCN0FCelBDR09kajRXU1dOc3pneERz?=
 =?utf-8?B?YmRJeS9ObkVFMnArZzI0Nnh0b2wyRHdXdGxNdjdBd0dRRHE1UEs3THllRFg4?=
 =?utf-8?B?TG5PSklkK1pMVFQzbS9PM2RhVDNlQmFYcFJOL2pjdUdybFVmeGpnN1NzVkpZ?=
 =?utf-8?B?aFpCeDhmbDNVamYyVXJvVVNTb05KSjV1YVJyVVhiSVpORjhWSGQ2UWZLZjJ0?=
 =?utf-8?B?Q2VTSlg3aXhRc29JTFZlTUpLOEVlVkNGVGg2cEJQTDJJYWs0NEFJY0gyc2o5?=
 =?utf-8?B?WTFYd0VIRncxZ2hJb0svMDIrZXFkU2tvazNKbThwY3VnTXVLTjN3bituRm1h?=
 =?utf-8?B?SWpwdWxkQlU2dmpLa2s5Qk5oSDBMRHpMSDRjTHp3Vk93SnJvVUZ0Y0xDeEc2?=
 =?utf-8?B?Y2tONC9Rdnd5dnhCODBQM1JQZDVyZmZVY1Y4a2VUaTJHNjREVmxuelI0enJx?=
 =?utf-8?B?Y0hOUGJnWWo1RGVwZGVtM3lUTWZiSmlVSVIyRG9oQlAwVkZqcnl4cERxTDRp?=
 =?utf-8?B?R3RXeEd1QXo4TndEMW96UGwrNjhyejJZTE1rbkFKcFhmbzhFWi9rSUVGR3NL?=
 =?utf-8?Q?M/l/PTQKBNfl0Tg0YiMyvrSriXVbKE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB6723.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aEsvTFlJU0hXTmZxK0ZoU1RSK1BXbnBnTTFkYkVnNEhXTUM0SGF1N0p4Ykhm?=
 =?utf-8?B?aTkxbDBaNEZXQmhDL2FtbzFnUFdaZWZVMVVQbUpUcm9keEx6WDJRdXV6Q1Iw?=
 =?utf-8?B?LzVVSGV2VXN3Skhrd3Z4Zm9sQWhhK1FRNFRSb09Kd3N0R3d1UzczQ1pVK2k1?=
 =?utf-8?B?UDM1SS9rS1Z4bEpaYUZncXJrYnJkZ1F1UzM5OGFoM3JoT01XenlBZFkrNHdq?=
 =?utf-8?B?WmhwZjhDOWs1R2ovNmp2SEhRb3ZvMHYrZWcyU2w3OE5kb0VESlgxUVpoV3I4?=
 =?utf-8?B?R3JMS2xKK3h3Z04rRGNUN1NocklCUTNJbEo4OTUzNWlYQUp0WHpZY2NxU3U2?=
 =?utf-8?B?cDhST2QzaFNmS05tRitvV0cwSXdpTHBvMUozdVRHeXJlbm5nUEN6T0hDdkwv?=
 =?utf-8?B?aSt2M1VwWVhtREw0ZTBkV2pVU0syMlBnNERtcG15SjM0N0xGbG14UmIrOFk1?=
 =?utf-8?B?cjJrU0JGcmdpM21Ba0NDb1lteTNZVUt1RmtpN1h0TGQzbXc2dUh1R255TzZu?=
 =?utf-8?B?aStJbDMzdUlMdjVvb1VCa2pYM1lEenA2N3NSS0t2VGJhVU9ONkVLWEZYY1Ew?=
 =?utf-8?B?R2MwOEZrT21tTmZGMC8xYkpNOWFzRnVxL3JXcUloNFlXdVlWZG1rS01hbm9L?=
 =?utf-8?B?ek4rVXRGVkF2RTZJdlZEaFNHZDlUMTVlblZOOHRacUJTSUk4akpxUWtDRmtr?=
 =?utf-8?B?aGtKMDJkcnRVU1pMWTJnQWNTazFKbEs2a00ycHpGdU5aMExoUEFqeTc2Z3Vp?=
 =?utf-8?B?M2h0ZkU3TXhsY3FqVkhESHZELzdNdVNPT2JwQ1krQnJBRXdCTG03V3NUckJh?=
 =?utf-8?B?ZlBFSUZrVit4Ujk4ckVSeTdTbmh4a1EybjVNUy9PYUdZR3NWZmthMU1YUC9m?=
 =?utf-8?B?SXlDU0VQeStncW9scXRDZTUyaTJXSVdFM3YzVjU2RmYxcDA5Yk9JMDhEZTJB?=
 =?utf-8?B?Z1B1T1c1WjR5UXROeDJZZFg2Vkk3bCtOaHhuWjdtM1N2ZDg5b1J4STJlWWFz?=
 =?utf-8?B?WndQZEI0M29oL0pMdlJZYmZNNXpBMVBuY09qZzVvZmVIYzFCMjhmZjIvaE1G?=
 =?utf-8?B?NE81cnJWQkdRMGtmL0xuS0NKWDZ6WEdTc0ttNWtxSVdUYUI5c0lFRGRLNUo2?=
 =?utf-8?B?YWljYmlRYXhWWUNVaDlGR3RKbjlKaWZVQU9icCtMWXl1TUdkbmVHUUpNNGVQ?=
 =?utf-8?B?UjZ1T2c4NzNycVZJdmJDQjRBODdYWUZaV3JzdXVzVmVSbGhOVlBDK2hyUTlo?=
 =?utf-8?B?Zk5NVmNuNWoxSVZFQUUwSGgwWVJLb01IOU42QVd3N0k4WXFBcFlzSmM0akkw?=
 =?utf-8?B?eGJvTk5OZm1Hd0JPckVMNERqNGxTRXo5M3ZJYUFHRjlGNFlhdVpuTG15L0JH?=
 =?utf-8?B?REhkWWpYaWVmQmlHVW1pM1VTV0ZTRWd4c1FTdDMrdlczMWlyUXhVTWYzNTNP?=
 =?utf-8?B?UFpocFZSeUJ2V3daQUQ3R2tYcmt5VWRkY1IvNGFkcWhOcXA3dDE1VC9VRFJG?=
 =?utf-8?B?cjU3U3Vub004cDFZSFh0Z3lmYzdYbkV5UFpSZGlnaXk3eE1JMGhmeGFoVWRo?=
 =?utf-8?B?RDdObTI3WUxpV2NXSVhDdXJPTDFZSWxVYkZ0aWI0N1RjWWZkajZZWmFvaitF?=
 =?utf-8?B?am9sSzFMOEt0blVGRFBKdWNnTDE0OFhNM1FaZHZmZmNCeUJaMUsxZHNxVTlN?=
 =?utf-8?B?dDducWl0YkhQMG1raTdmVWdrSENReHJ0V2JQc09ScnNrNmUxWG5ZNUp2bFk5?=
 =?utf-8?B?cDRiZFFNekRveUMxWnYxZitWcjlEd3lhdmNzYXp4VHBtNDhwY3dTWVNpZEFz?=
 =?utf-8?B?WU5DeEx3L2E3dkRyMjFaTXprUG1RWEc5MkY1UDBjU2ZEaEtPTHRMekwxdVFN?=
 =?utf-8?B?VmY0Y2x1dTYrdGhJQkptRmRZTHNHa2hnMlB4TS9MWkUxUHVZL3VaNXg5Smtl?=
 =?utf-8?B?VnZxUmttRU02M1VBQ0tTd2ZzZnlFVTFhRjl1azBweEpmZVZXYTVZSDZ0TUVS?=
 =?utf-8?B?QytjNzFBbmZ0cFFONjRHaWtSOURUazlnbURRNU5tOG5IeVd4L2EzUHlPRFRj?=
 =?utf-8?B?a0owMExHQyswVjI5ODhrZTBiS1FwY2o1OWRJMmxNb2tNbVM3RDVrWDYyNzJm?=
 =?utf-8?Q?maK0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6723.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3decf0b3-7575-4367-53e2-08ddd5752356
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 05:42:03.7179
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VbKwEXGF/dyIi5OnsXoglbk+MhcBs42OX43HHCcBmyFAeXRp0bpvdz8UE6v3A/K1Dppea0pKm2fWlwPxVsfTIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB6967

QWRkIGtld2VpIGFuZCBzaHVuY2hhbmcuDQoNCi0tLS0t6YKu5Lu25Y6f5Lu2LS0tLS0NCuWPkeS7
tuS6ujogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVn
bm9AY29sbGFib3JhLmNvbT4gDQrlj5HpgIHml7bpl7Q6IDIwMjPlubQ55pyIMTPml6UgMjI6MDEN
CuaUtuS7tuS6ujogRGFuaWVsIEdvbGxlIDxkYW5pZWxAbWFrcm90b3BpYS5vcmc+OyBRaWkgV2Fu
ZyAo546L55CqKSA8UWlpLldhbmdAbWVkaWF0ZWsuY29tPjsgQW5kaSBTaHl0aSA8YW5kaS5zaHl0
aUBrZXJuZWwub3JnPjsgTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT47
IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7
IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZw0K5oqE6YCBOiDpg63lsI/moaUgPGpvZUBnYWluc3Ryb25nLmNuPg0K
5Li76aKYOiBSZTogW1BBVENIXSBpMmM6IG10NjV4eDogYWxsb3cgb3B0aW9uYWwgcG1pYyBjbG9j
aw0KDQpJbCAyNy8wOC8yMyAwNDoxMywgRGFuaWVsIEdvbGxlIGhhIHNjcml0dG86DQo+IFVzaW5n
IHRoZSBJMkMgaG9zdCBjb250cm9sbGVyIG9uIHRoZSBNVDc5ODEgU29DIHJlcXVpcmVzIDQgY2xv
Y2tzIHRvIA0KPiBiZSBlbmFibGVkLiBPbmUgb2YgdGhlbSwgdGhlIHBtaWMgY2xrLCBpcyBvbmx5
IGVuYWJsZWQgaW4gY2FzZSANCj4gJ21lZGlhdGVrLGhhdmUtcG1pYycgaXMgYWxzbyBzZXQgd2hp
Y2ggaGFzIG90aGVyIGNvbnNlcXVlbmNlcyB3aGljaCANCj4gYXJlIG5vdCBkZXNpcmVkIGluIHRo
aXMgY2FzZS4NCj4gDQo+IEFsbG93IGRlZmluaW5nIGEgcG1pYyBjbGsgZXZlbiBpbiBjYXNlIHRo
ZSAnbWVkaWF0ZWssaGF2ZS1wbWljJyANCj4gcHJvcHRlcnR5IGlzIG5vdCBwcmVzZW50IGFuZCB0
aGUgYnVzIGlzIG5vdCB1c2VkIHRvIGNvbm5lY3QgdG8gYSBwbWljLCANCj4gYnV0IG1heSBzdGls
bCByZXF1aXJlIHRvIGVuYWJsZSB0aGUgcG1pYyBjbG9jay4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IERhbmllbCBHb2xsZSA8ZGFuaWVsQG1ha3JvdG9waWEub3JnPg0KPiAtLS0NCj4gICBkcml2ZXJz
L2kyYy9idXNzZXMvaTJjLW10NjV4eC5jIHwgMTIgKysrKysrKystLS0tDQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jIA0KPiBiL2RyaXZlcnMvaTJjL2J1c3Nl
cy9pMmMtbXQ2NXh4LmMgaW5kZXggMWE5YjVhMDY4ZWYxYi4uYThiNTcxOWMzMzcyOSANCj4gMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ2NXh4LmMNCj4gKysrIGIvZHJp
dmVycy9pMmMvYnVzc2VzL2kyYy1tdDY1eHguYw0KPiBAQCAtMTQ0MiwxNSArMTQ0MiwxOSBAQCBz
dGF0aWMgaW50IG10a19pMmNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4g
ICAJaWYgKElTX0VSUihpMmMtPmNsb2Nrc1tJMkNfTVQ2NVhYX0NMS19BUkJdLmNsaykpDQo+ICAg
CQlyZXR1cm4gUFRSX0VSUihpMmMtPmNsb2Nrc1tJMkNfTVQ2NVhYX0NMS19BUkJdLmNsayk7DQo+
ICAgDQo+ICsJaTJjLT5jbG9ja3NbSTJDX01UNjVYWF9DTEtfUE1JQ10uY2xrID0gZGV2bV9jbGtf
Z2V0X29wdGlvbmFsKCZwZGV2LT5kZXYsICJwbWljIik7DQo+ICsJaWYgKElTX0VSUihpMmMtPmNs
b2Nrc1tJMkNfTVQ2NVhYX0NMS19QTUlDXS5jbGspKSB7DQo+ICsJCWRldl9lcnIoJnBkZXYtPmRl
diwgImNhbm5vdCBnZXQgcG1pYyBjbG9ja1xuIik7DQo+ICsJCXJldHVybiBQVFJfRVJSKGkyYy0+
Y2xvY2tzW0kyQ19NVDY1WFhfQ0xLX1BNSUNdLmNsayk7DQo+ICsJfQ0KPiArDQo+ICAgCWlmIChp
MmMtPmhhdmVfcG1pYykgew0KDQouLi5idXQgeW91J3JlIG5vdCBjaGFuZ2luZyBzcGVlZF9jbGsg
aWYgIWkyYy0+aGF2ZV9wbWljLCBJJ20gbm90IHN1cmUgdGhhdCB0aGlzIHdpbGwgd29yayBjb3Jy
ZWN0bHkuIFBlcmhhcHMgeW91IHdhbnRlZCB0byBhbHNvIHNldCBzcGVlZF9jbGsgaWYgdGhlIGNs
b2NrIGlzIHByZXNlbnQ/DQoNCmlmIChJU19FUlIuLi4pIHsNCgllcnJvciBoYW5kbGluZw0KfSBl
bHNlIGlmIChjbGsgaXMgcHJlc2VudCkNCglzcGVlZF9jbGsgPSBJMkNfTVQ2NVhYX0NMS19QTUlD
Ow0KDQppZiAoaGF2ZV9wbWljICYmICFjbGtfaXNfcHJlc2VudCkNCgllcnJvcg0KDQpSZWdhcmRz
LA0KQW5nZWxvDQoNCj4gLQkJaTJjLT5jbG9ja3NbSTJDX01UNjVYWF9DTEtfUE1JQ10uY2xrID0g
ZGV2bV9jbGtfZ2V0KCZwZGV2LT5kZXYsICJwbWljIik7DQo+IC0JCWlmIChJU19FUlIoaTJjLT5j
bG9ja3NbSTJDX01UNjVYWF9DTEtfUE1JQ10uY2xrKSkgew0KPiArCQlpZiAoIWkyYy0+Y2xvY2tz
W0kyQ19NVDY1WFhfQ0xLX1BNSUNdLmNsaykgew0KPiAgIAkJCWRldl9lcnIoJnBkZXYtPmRldiwg
ImNhbm5vdCBnZXQgcG1pYyBjbG9ja1xuIik7DQo+IC0JCQlyZXR1cm4gUFRSX0VSUihpMmMtPmNs
b2Nrc1tJMkNfTVQ2NVhYX0NMS19QTUlDXS5jbGspOw0KPiArCQkJcmV0dXJuIC1FTk9ERVY7DQo+
ICAgCQl9DQo+ICAgCQlzcGVlZF9jbGsgPSBJMkNfTVQ2NVhYX0NMS19QTUlDOw0KPiAgIAl9IGVs
c2Ugew0KPiAtCQlpMmMtPmNsb2Nrc1tJMkNfTVQ2NVhYX0NMS19QTUlDXS5jbGsgPSBOVUxMOw0K
PiAgIAkJc3BlZWRfY2xrID0gSTJDX01UNjVYWF9DTEtfTUFJTjsNCj4gICAJfQ0KPiAgIA0KDQoN
Cg==


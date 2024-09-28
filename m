Return-Path: <linux-i2c+bounces-7068-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C67988E12
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Sep 2024 09:07:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EFA4DB20ADD
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Sep 2024 07:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2501C19DF52;
	Sat, 28 Sep 2024 07:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b="H6MJKyMm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2103.outbound.protection.outlook.com [40.107.223.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E2AC156;
	Sat, 28 Sep 2024 07:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727507266; cv=fail; b=FFnjITRaWMe2W4tw7UZQUXY3HQuEX9ew/391H9Qx0PAzHMjvkjYtgZ78UXggshxDL8SKPO5uB5ILl7auqBcLxgw5dBPS6fTtKimRixg4cjIBCr/o2VsGaD8CECpNDId7FCeTsSoquSek2gN8uAQY2hX9Bas98++HYRPBIWqJ99Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727507266; c=relaxed/simple;
	bh=VTIubiSwVSLLdtA/FkbWXvYddOMG/y+FeN8Pxlwnksk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CNvNgaUFpMFbjFo2MDAsNyBubIqjPhHzpkpYOZMjeVQywrU9l1llHoERKNEkowtviqsjKGctWTlC2QxOLMe0R13+CfC6Mac49oZ1//0l90pEWiLbUrixLQyiUk9pfciUQ+UO44waVxjJSTqaBZViejrfx+ZgzgKj8W6RBGC3KCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us; spf=pass smtp.mailfrom=kneron.us; dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b=H6MJKyMm; arc=fail smtp.client-ip=40.107.223.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kneron.us
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YnUjsBuzmuKLzdnPmh8sYyvesAgmG+bYib+Q7mJGr3dF/a1mVVW6vM3idgPs5ywNgzuRGOCfI/B0cmv+Ew/hox6s678PyxV2Zgr3J1Bo9kt+EsWBp5K4c30AiE2bPy+sOwKjz/GfQuK6w0Ae3PdA91fQEz71E8vYn/sB8lb9d5YNggS/9FsBXeXOSjA7Mz0e84SkFC3WD+i/IdVVHwwh3i2qaWVKlBKK/AVX5UUqeGZJOZtYdYjG8mh/l6T2B2ZSJPFEHgoN/GP1DT+vCrTJsVCn2bdD3ykfEAEhIJYeUJRHXCiwoo5lTLK8Yf4+yHxFej08N9JvM2DQaEG5BvFdLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTIubiSwVSLLdtA/FkbWXvYddOMG/y+FeN8Pxlwnksk=;
 b=xLS9iVobP4Sk7YsEhsK76bCBJT21kt8hvNz+H8vyWOTWNV4+OQYnnFvZoijsm75rJan4+LZalonI72oCGgL5M1UPqW9qcHxl++4MfkxIIjE27uU5FPwm9huznUKkqn18836kXJe0bsQF1jzbkV/UDcIJcJFGupEnkVl56B9hDd8pD6lFZJakMqANHtjHYnORiCI1audBx/K8U+HDKFYeCovVFXTpeYHNm5sYQZk2QLnPVLG00c7NY8qWPeOIIhqWb3/qFFb9Lh8ZBipQnllwgiOe5Q5FaMT3ZkPnHUAIVSBq2aF7hQK/10zngVDHzCOVRpcdO3nK6uH1cuDudKJ9ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kneron.us; dmarc=pass action=none header.from=kneron.us;
 dkim=pass header.d=kneron.us; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kneron.us;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VTIubiSwVSLLdtA/FkbWXvYddOMG/y+FeN8Pxlwnksk=;
 b=H6MJKyMmzXUHuzISBM0mloRcZK+Fw9mnQKgfQJ8hGRa+JtbseM8x3YNBAJX7lnnX6RNwRFWExRl0+BCvyScf67/5VZC2WXCIxzhbboKH+2uyGsO0g8Wsiai5x2oxYtLX2IQoDyVO9jdKVBsWI6zWZM6K/Mn1sa85HsFnjArvXkc=
Received: from IA1PR14MB6224.namprd14.prod.outlook.com (2603:10b6:208:42b::6)
 by MW5PR14MB5362.namprd14.prod.outlook.com (2603:10b6:303:19e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Sat, 28 Sep
 2024 07:07:36 +0000
Received: from IA1PR14MB6224.namprd14.prod.outlook.com
 ([fe80::c527:653c:698d:3d94]) by IA1PR14MB6224.namprd14.prod.outlook.com
 ([fe80::c527:653c:698d:3d94%3]) with mapi id 15.20.8005.021; Sat, 28 Sep 2024
 07:07:35 +0000
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
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: snps,designware-i2c: add
 bus-capacitance-pf and clk-freq-optimized
Thread-Topic: [PATCH v2 1/2] dt-bindings: i2c: snps,designware-i2c: add
 bus-capacitance-pf and clk-freq-optimized
Thread-Index: AQHbEJ2oa785oDCJyk61SI38zqyK6bJrTxeAgAFk3QA=
Date: Sat, 28 Sep 2024 07:07:34 +0000
Message-ID:
 <IA1PR14MB622419FD28CA5E7679A040B98A742@IA1PR14MB6224.namprd14.prod.outlook.com>
References: <20240927042230.277144-1-michael.wu@kneron.us>
 <20240927042230.277144-2-michael.wu@kneron.us>
 <kr7z3qru7pfevn23pe2xwfo6vkg5m6gike6xdbi6cgy5vshtch@5nxuodh5xzuw>
In-Reply-To: <kr7z3qru7pfevn23pe2xwfo6vkg5m6gike6xdbi6cgy5vshtch@5nxuodh5xzuw>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kneron.us;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR14MB6224:EE_|MW5PR14MB5362:EE_
x-ms-office365-filtering-correlation-id: c5895e06-fab1-4663-2226-08dcdf8c3a7f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|80162021|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UkNUZTNuQlJSREluS1RwcStybFhuU3RzRVpTR29yajF4UE5aSENzM0U2L01x?=
 =?utf-8?B?R2MyMzNJTDJ0bU1RSFpOMFNZUjZKc01nSUNCYmQvQ29kcFgxa2xocDR3OGdC?=
 =?utf-8?B?YzhhQkx4c1k2Q2xJQUcyVHlrTUlHc0lIY0p1YmZ4Wm9GYUNoRk9kWkNsOU1N?=
 =?utf-8?B?T0RTVWhLTFVXN1ZWVmdReVFEY3FGaWd4bzNaRXhoS3BlYk9Jc2VWUFRYVC80?=
 =?utf-8?B?TlNlMVo5dExVQUJ5alZETUY2OHpOdjNrM1pEanRFS2ZuK2xVT05aZFpnOXQv?=
 =?utf-8?B?TGhobnlmY0NmSnZ2aFV5NG5SMkhNRnlVdGk2QlhjUXEwVlN3ZkZkcGg0cTk2?=
 =?utf-8?B?d3RIbjhJeFZBMDBFK2tDQnZPOUdWRUhZS3ptVG5uT0phWUtaemhnVzIycHFt?=
 =?utf-8?B?aStkck5DY1ZPQ2MyRFlFbURaUkl1ZUVjeWVIZVNXWU9MQ0V2cSt1TzJWdUR5?=
 =?utf-8?B?NkVraVFXNk1pOUIyTFgycWh0L0U2b0JCZnJEWG5nN2ZvaEZFL0JtZit5VjJT?=
 =?utf-8?B?aTY0dUNiT1oxMzREalo1SFVycUJSS01sNzZZa3JWQU1JT0ljcFJ5amdNZWVn?=
 =?utf-8?B?Vm41Zy9hK29GQytBVWJoRGpDVW9kaDE2bUxVUDIvTEU3MlpCTU5Uby9HSUQ3?=
 =?utf-8?B?VmN3Z1dDcU5vYXowdW1DRjd3SThpaTFDOW9Db0dOQ1FqTFNkZkxLUENxODJm?=
 =?utf-8?B?cWhqN1J3aVdnVzlFRytoM2RYOHl1MDNLSGE0dWhFTEdObm5CRUtSNDROZzd0?=
 =?utf-8?B?QUh5dXFNd3N6Qlp3UHorUmFnZ1R0MEFMcGV4T085cHVPVmlDOVhSTkZTMmFw?=
 =?utf-8?B?VlJ0bjJzRVhKemlUVmUyVlk4cm8yd0xYOElmdDZIcWZ2MlZTb3pmY2h1clN5?=
 =?utf-8?B?UUtnYTJRZzZiRTB5V1FvRlBmY2RucE1aaFVzTXFzMkhPWmp1bVl1cUNzcU9q?=
 =?utf-8?B?QjhFNlNwaUpvbmVnMXRiNDY1ajY3L0kyUmpacTJVbDJIbmRNUjRWK2pxcXdH?=
 =?utf-8?B?c3JLRUkzclp5ZHJidzE0WlhmU0Z5V1hBdWN0TUREQTlkMkw1TGRDcTFPWEVr?=
 =?utf-8?B?ZG1KdGdxcW81Wjc3Qlg2dUx1UFc4cDUzMENJRzB5dWVRNlhQaHpJUHdCWnpj?=
 =?utf-8?B?eDN5UlJCZnlpZlNTYkZXMXZxbjdFM1U2b2xVWXJQUkJqRTRVcFlVN1pIN0VF?=
 =?utf-8?B?cVBYaGZyVjFXOUxYVHpTS214R2NtZ1M4eklFcVdPK2N1bHdqcEwrNjNhazFj?=
 =?utf-8?B?VnBQdGwvZHYyZitiSkZHNTV3OWJkUk5QcDI0SkE5UDVBWHZMYVVUaVZ3bkZO?=
 =?utf-8?B?TUZOdWdkZE5qM3JSSXBQOGZNSkVZb29QL0tyRGFyK3o1UzZmM0tvZ0JqRm0v?=
 =?utf-8?B?NEVzSzMvVnlKVjlaQXpqb2F5bGRrMjR1cnVxcno5UlFDVUJHaktuY0wrdUZS?=
 =?utf-8?B?bldrWEdINlZXTHgvRlUxb0c5TXBqWk9kaTk1Tk1zV1I4M2krY2FDVElBdWFD?=
 =?utf-8?B?QjFKek5lWiswaVUvVmErbTE0K09rd0xZQmdFYTcrZDhpQkppOUlnMnZkU1hz?=
 =?utf-8?B?Qm9nY3lMYmxmWTBWODRvZU9SL0l6VW9xTTk5ak0vWFJEeHJqeWZtdlFXTjZa?=
 =?utf-8?B?RHpKQndTR0FMQVJIUnpzWDNNNmkwamhmaWQ3L0dxUTJvbVR6eVZhZ1JUUlZP?=
 =?utf-8?B?WExydUcycCtzeXFTTFRMRWFQZWF0dU1HRmxLakRsK1FFcXBSYnJ5UWx5bmJE?=
 =?utf-8?B?TEFDdVVmMW1EcVl1OEhlR3NCQ0lQblVkcm1hR3B0SlRhUFVJZ0FPeVpkSWlK?=
 =?utf-8?Q?e7GYKObti0d/1lnDTu6d4+fczuA1b3MAKYnDA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR14MB6224.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(80162021)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YkVsRFFMaFY1NVhUZFJyYnZ5Q0pKQSt6VUNFRlJ1VEY2alV2dWdVZ3JVZFJD?=
 =?utf-8?B?ZXJYVDNBa0taZ1puaWtLQTFNMnV0ckdJc0VGcmJwMVkySkx1aVhZQjBDT0JV?=
 =?utf-8?B?OG14cXFmSnRsbGI5alE4bzFteUJXWVUwV0dET2JMU2hpTGtMRDFzYUZ3VTFO?=
 =?utf-8?B?dHRQL3BUSVAyQ1dSaXphWXlXNHhmazA3aGNMTXVVYkd3bGNlbEVlS1ZlbjdB?=
 =?utf-8?B?NmVJR2lNdE1HWWtlNkRZVFg2VDQrQlQ0UWpNVmovUmFMQzhYWWhoaDhmbHlk?=
 =?utf-8?B?b1N0c3RCTlUxVGdveWc2ZmdoaHlEb3dmN0V5TDBRU2VTZFhKZTFVdzQ4U1Mv?=
 =?utf-8?B?TUdHVW1FNGp4MVRVcFVVdURqV1dmaUdzVXZuWFVFM3JRQk1QMEd1SFZVcExP?=
 =?utf-8?B?dERGVlJ5aEExaHUreVV6YTBDK2VhUXVZMnZrb1laN3hFUjdpRk9FcTdkWGFU?=
 =?utf-8?B?ZzZ6ZzdlK1YwQVBITVltRWQzNTFZa2lMdmZ1czc5YzhpdVAxNWdQYkhZUnV2?=
 =?utf-8?B?ZnV0Qk5aUUdyV2JwVEUyMXZ6M0hYWnJzYm9iUFZ1ZDB4NEthVWs1V0tDYnNl?=
 =?utf-8?B?RnlpeWVqRVRHbkRrWWE3L1VWd3ZERWx3TE5JdGlCNVFvamc5ZllIZitoSHp6?=
 =?utf-8?B?NTA2bVAxSnd2ZFpKL0NHWXRadzh5MmxoTmthcG9WZTVhMFB6TVI0R2FIM3Bp?=
 =?utf-8?B?ZC9DMWVpdUpoeDNlZlc0bFArbVJETE90c1N3VkhBL0tKeGlJS0RWMTZ6S1po?=
 =?utf-8?B?T1FRZUppdS9ILzM0dmd6VUhORU9GNFBsQ2ovZGFkWlVTQVFpSkRBdTVhdCs2?=
 =?utf-8?B?bkJ2ODBNYWNwREtsN2R1b21Ua3ZNVnNBSUFsdU1IbWNCZFR0U3dENUh5L0dm?=
 =?utf-8?B?ZEdUQjd6ZmFLNFNuTWlFK3JpM0ZzYTczdDRKYkJOV29uc1FmbGRZZXIvOFpC?=
 =?utf-8?B?SkliUXlFSWo3S1NtME9yQWVuMVhHNEE0Tmd5ZW5COHpBMnhleVBSM3o5QXFL?=
 =?utf-8?B?TkY4QU5aQ1d2WW1tQjRkMkRvVkFsMk92dlRIVjdvQkdFcFo1RmUvck8wb3Zo?=
 =?utf-8?B?MDdUWjlVQlJDTytjTHdyR3k3L0F2SVFpMzlFWnZQdDlkdjE3c05HT0Z0anBK?=
 =?utf-8?B?eVhmaUVobmsrWS8ybjZtSjRWSVk1NTNoNVZJeVBNdDIrUStQWVMxMFpTbmpo?=
 =?utf-8?B?ZVE5NmR2T1JZK0cxUkNPWTVQenVIbXVZemN4VFRoRjVPM2JXUFR3VDQrODh4?=
 =?utf-8?B?dk9hb1Y5bEVZb2JkaXc2ZjJ3ZFlJRzZGZ0NjTU9QZnFxSS9IZGdYUFVWc3dX?=
 =?utf-8?B?NFRjampFUmdzeTJKdVRzMytqNVRZbytIbFZ3NkowakdJUU1mdG5naDNjMHd3?=
 =?utf-8?B?TFVUb0xKTEpVTW1nYktTZXFYZmE3RmxkRHVSYTh0alN2RnJ6OEIyUWdjM1FZ?=
 =?utf-8?B?ZXduRkVqbStnZG1JeHNxNWdmam5zTUZEV3o2SE9QRnRxb1J5dnZramd1UU9k?=
 =?utf-8?B?cFRCS0hNV3B1a1lEZW9YYXF6Tm01TXV4QlNHMG5SL3NzcHhnSG9KYVJHVUJh?=
 =?utf-8?B?S2hGVDJTbzUrUGNTTDB1Uk1WTEpLMk1SenJyWHdScExZNmttM1oyZlFuVUlw?=
 =?utf-8?B?OEtCSGU5MUMrOHUvZ1lzTnVlQTdzazMyK0Q0M3JSVlNmOGRhcmNOd2NZaysw?=
 =?utf-8?B?SjBUbnBPNDIxNmsyNFV2TGNsOWJzOU05VHp5VGhZT2VOZkRMeHdPcmtMK1ly?=
 =?utf-8?B?cGM3MW5CUmZyeUlHKzdQL1BnWE5rczlBYzZpNi93THJaaHRnbFdUU3dJc1B1?=
 =?utf-8?B?S3NaVHpUTFhSSWM5amxJb2RqNW1lV2JUVFV6Zy9BNXJhdFZBaDZza29hZWVK?=
 =?utf-8?B?aUxuaTE0NGlpUTFLZEM1WEVjZ3ZxdTN4ekkreDRWazB5VHZBZ016aFBFejJQ?=
 =?utf-8?B?VVNtZ0lJdU9nalFraTBQT0JXa2FUOG5jZ0tiN00rVFB2OXgyT2RydDhBZEta?=
 =?utf-8?B?K2VkcFZGbVM4azM3dkRTS0NPRkcyc3ppRUFOVXNScDdYZ29zaXovUE41TmVL?=
 =?utf-8?B?KzJzMDBMa1JtUEo2cGhiYVFKUmNNUEs2WFROUHBTeTd2WGczaWh0Tkd6Q0pZ?=
 =?utf-8?Q?6DQI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: kneron.us
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR14MB6224.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5895e06-fab1-4663-2226-08dcdf8c3a7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2024 07:07:34.9434
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92b0f4b-650a-4d8a-bae3-0e64697d65f2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6sa6CLptwTaFX8ygSy3AbUlhqlHlwVOPZsTDTDokITuCbL9A08vsKnDEodtm/2SOdAlvb/yK6mcRt3R3fuZaYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR14MB5362

T24gRnJpLCBTZXAgMjcgMjAyNCBhdCAxMDozNTowOUFNICswMjAwLCBLcnp5c3p0b2YgS296bG93
c2tpIHdyb3RlOg0KPiBPbiBGcmksIFNlcCAyNywgMjAyNCBhdCAxMjoyMjoxNlBNICswODAwLCBN
aWNoYWVsIFd1IHdyb3RlOg0KLi4uDQo+ID4gaW5kZXggNjAwMzVhNzg3ZTVjLi5mYzE5ZTZhOGIz
MDYgMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ky
Yy9zbnBzLGRlc2lnbndhcmUtaTJjLnlhbWwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvaTJjL3NucHMsZGVzaWdud2FyZS1pMmMueWFtbA0KPiA+IEBAIC04Nyw2
ICs4NywyMCBAQCBwcm9wZXJ0aWVzOg0KPiA+ICAgICAgICBUaGlzIHZhbHVlIGlzIHVzZWQgdG8g
Y29tcHV0ZSB0aGUgdEhJR0ggcGVyaW9kLg0KPiA+ICAgICAgZGVmYXVsdDogMzAwDQo+ID4NCj4g
PiArICBidXMtY2FwYWNpdGFuY2UtcGY6DQo+IA0KPiBXaHkgaXMgdGhpcyBnZW5lcmljIHByb3Bl
cnR5PyBJcyB0aGlzIGdvaW5nIHRvIGJlIGFwcGxpZWQgdG8gYWxsIEkyQw0KPiBjb250cm9sbGVy
cz8gSWYgbm90LCB5b3UgbWlzcyB2ZW5kb3JzIHByZWZpeC4NCj4NCj4gPiArICAgIGRlc2NyaXB0
aW9uOiB8DQo+ID4gKyAgICAgIFRoaXMgcHJvcGVydHkgcmVwcmVzZW50cyB0aGUgYnVzIGNhcGFj
aXRhbmNlIGluIHBpY29mYXJhZCAocEYpLiBJdA0KPiA+ICsgICAgICBhZmZlY3RzIHRoZSBoaWdo
IGFuZCBsb3cgcHVsc2Ugd2lkdGggb2YgU0NMIGxpbmUgaW4gaGlnaCBzcGVlZCBtb2RlLg0KPiA+
ICsgICAgICBUaGUgb25seSBsZWdhbCB2YWx1ZXMgZm9yIHRoaXMgcHJvcGVydHkgYXJlIDEwMCBh
bmQgNDAwLCB3aGljaCBhcmUNCj4gdXNlZA0KPiA+ICsgICAgICB0byBjYWxjdWxhdGUgdGhlIHRI
SUdIIGFuZCB0TE9XIHBlcmlvZHMgZm9yIGhpZ2ggc3BlZWQgbW9kZS4NCj4gPiArICAgIGRlZmF1
bHQ6IDEwMA0KPiA+ICsNCj4gPiArICBjbGstZnJlcS1vcHRpbWl6ZWQ6DQo+IA0KPiBUaGlzIHdh
cyBuZXZlciB0ZXN0ZWQuDQo+IA0KPiBZb3UgZ290IHRoaXMgY29tbWVudCBhbHJlYWR5IGFuZCBu
b3QgbXVjaCBpbXByb3ZlZC4NCj4gDQo+IEl0IGRvZXMgbm90IGxvb2sgbGlrZSB5b3UgdGVzdGVk
IHRoZSBiaW5kaW5ncywgYXQgbGVhc3QgYWZ0ZXIgcXVpY2sNCj4gbG9vay4gUGxlYXNlIHJ1biAg
KHNlZQ0KPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd3JpdGluZy1zY2hlbWEu
cnN0IGZvciBpbnN0cnVjdGlvbnMpLg0KPiBNYXliZSB5b3UgbmVlZCB0byB1cGRhdGUgeW91ciBk
dHNjaGVtYSBhbmQgeWFtbGxpbnQuDQo+IA0KPiA+ICsgICAgZGVzY3JpcHRpb246IHwNCj4gDQo+
IERvIG5vdCBuZWVkICd8JyB1bmxlc3MgeW91IG5lZWQgdG8gcHJlc2VydmUgZm9ybWF0dGluZy4N
Cj4gDQo+IE1pc3NpbmcgdmVuZG9yIHByZWZpeC4gTWlzc2luZyB0ZXN0cy4NCj4gDQo+IEFsc28s
IGV4dGVuZCB0aGUgZXhhbXBsZSB3aXRoIHRoaXMuDQo+IA0KDQpCb3RoIGFyZSBzbnBzLGRlc2ln
bndhcmUtaTJjIHByb3BlcnRpZXMsIGFuZCBzaG91bGQgYmUgcmVuYW1lZCB0bw0Kc25wcyxidXMt
Y2FwYWNpdGFuY2UtcGYgYW5kIHNucHMsY2xrLWZyZXEtb3B0aW1pemVkLg0KDQpJIGFwb2xvZ2l6
ZSBmb3IgbXkgbGFjayBvZiB1bmRlcnN0YW5kaW5nIG9mIGJpbmRpbmcuDQoNCj4gDQo+ID4gKyAg
ICAgIElmIHRoZSBoYXJkd2FyZSBpbnB1dCBjbG9jayBmcmVxdWVuY3kgaXMgcmVkdWNlZCBieSBy
ZWR1Y2luZyB0aGUNCj4gPiArICAgICAgaW50ZXJuYWwgbGF0ZW5jeSwgdGhpcyBwcm9wZXJ0eSBt
dXN0IGJlIGRlY2xhcmVkIGluIHRoZSBkZXZpY2UgdHJlZS4gSXQNCj4gPiArICAgICAgYWZmZWN0
cyB0aGUgaGlnaCBwZXJpb2QgYW5kIGxvdyBwZXJpb2Qgb2YgU0NMIGxpbmUuDQo+IA0KPiBJIGFz
c3VtZSB0aGlzIGlzIGhhcmR3YXJlIGNob2ljZSwgbm90IGRyaXZlcj8NCg0KWWVzLCB0aGV5IGFy
ZSBoYXJkd2FyZSBwcm9wZXJ0aWVzLiBUaGUgZHJpdmVyIG11c3QgdXNlIHRoaXMgaW5mb3JtYXRp
b24NCmZyb20gdGhlIGRldmljZSB0cmVlIHRvIGNhbGN1bGF0ZSBTQ0wgaGlnaCBhbmQgbG93IHBl
cmlvZHMgYXBwcm9wcmlhdGUNCmZvciB0aGUgaGFyZHdhcmUuDQoNClRoYW5rcyAmIFJlZ2FyZHMs
DQpNaWNoYWVsDQoNCg==


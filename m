Return-Path: <linux-i2c+bounces-8660-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 582EB9F90A2
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 11:48:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DED7216EEAF
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 10:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55D191C3316;
	Fri, 20 Dec 2024 10:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fagzBFJU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2079.outbound.protection.outlook.com [40.107.103.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EE01BD9C5;
	Fri, 20 Dec 2024 10:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734691585; cv=fail; b=dg7WJ+Bj18qLDw9mGcS4BoyE2/1vZBIKb6twLoT5piJDnnVee5uWdtpjz1YeNq+Yl/3tL6BCdJBxeMcYq1yLXix4I2m4IFx7aRekUk1qlUZfqCkOsX1IZZXlK3KTXsDyPEgOcf9d2w5GRzC/QIM2mZiIMazrYCidMtDtaa+nYgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734691585; c=relaxed/simple;
	bh=uGgNCULGT/n64p+sbNnAzVraTfjjydrxlSbigYC4JPQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PhNKMecvhf0IqgAlu2rcJFoYDpsCl6JLaknsX1o6z+DstQw/KJ9petMp4/l9GyunCj0yWdI7UWH52ZXvUu6TXZsvALmY1wNH8llROpsVx6uvXw36IbDhCN0v5YlJuFCoKOjYU4bmoPlRjw4PG0HKAm2iRedRVqZxiv5Gw1CQKDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fagzBFJU; arc=fail smtp.client-ip=40.107.103.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A2/I/bqVWK2MtGnk9OBfIKGCNXXO+HiDxktHcgP1U8SBZE4NvZO7a67h+Q83CyK6eEwdpkB5U3TLvrBYsMjzgyijBSJhYo5nkghqO+bRguCGbJQR9HOdVV+b3NcwXFOKr9ygDZwp/cH8FXWlvQ8f7V1GJxJU24ywet0iYHPTmGmZVhm9w9ADQ76HT0aMsICksUIzIfrsnnOcqBaPPUYTpynwOOP2cKoWFmj98DRKFakAxgEZVV5B7qCSQe+AhOlmsSDgCgUIZ7syxpU/0MiUOWeut/s0ZIZDTCYntMa22Y9qlO3lVGMFvYAWStf0e6//0EwR04As/z6v7DVGKBFDAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGgNCULGT/n64p+sbNnAzVraTfjjydrxlSbigYC4JPQ=;
 b=RfUtOwd0DZFToGTVbndNtLl8ySusqcr4zQC0hyvW1xsWdIhpXfD1+bv+TF4wuE/gcksleBLOoCgXLasGCCCNeIgrBTf+4Hrk5H9OXzERS0KBPtuBVqTj6vvQ2RJdZoWOrkyaZ+xExp6+SpwxXDXT6eCdObFxsL/o6lRE9IL0lsvttx8JSFpizZdNEh6Rt5XwoJolOSjMv2736rFJehF22d12zGCgdYfEOhglTy5gBTBILht6cEfJRI/7dEHUuZBmgmLv2NW8oETS4WzZo3WoE1SAl3lkBkZXYQmQOeS42/5c6oL24h9uVI1U/Wq16n+nWlcko3b0ZBU4Yz+3klhckw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGgNCULGT/n64p+sbNnAzVraTfjjydrxlSbigYC4JPQ=;
 b=fagzBFJUMT1tgPtdF4Tf/Rxfxvb9TtELGOoud6CJw2lFBiNk7rjEKY1nRP3cPKqWyHOHRW5h5JL1nJMn1H3FtZprSBdLPmb0rW8q+IObU2n271A92TnxAb+oakH8fC0bRlSkd3768G1Fll1h3L64Djg+tnXwErFeBYAD3xGEheuQ+wcXPD8EjI4ZSwc1fmEImDgXh1g9eWDOuyIb/xLB6R/d8wL6l7pNrqsdab9Y+gWwAJBtZof4Mu4vNU2OMWK+c6Vl9wWlSCZ/n8zBvcjQ4VYgoM68dV+8pR5KOUABtq1DbPshSEJPUJYYw50rS4qQUZKB5fiZUeqQbDWUgx+YSg==
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by PAXPR04MB9375.eurprd04.prod.outlook.com (2603:10a6:102:2b3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 10:46:17 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%5]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 10:46:17 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Oleksij Rempel
	<o.rempel@pengutronix.de>
CC: Andi Shyti <andi.shyti@kernel.org>, Frank Li <frank.li@nxp.com>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Clark Wang <xiaoning.wang@nxp.com>
Subject: Re: [PATCH v5] i2c: imx: support DMA defer probing
Thread-Topic: [PATCH v5] i2c: imx: support DMA defer probing
Thread-Index: AQHbUsxlU5GOLiZkO0OSdObwWi6h0Q==
Date: Fri, 20 Dec 2024 10:46:17 +0000
Message-ID:
 <AM0PR0402MB3937E87BBDC5CEA1C51E4E3AE8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
References: <dhn3f2xpdpu757pizdhcksqiqo53szeh65gtmddfxfhotimh2z@dfxfpl3int53>
 <Z2QQI2gJNLjI-fam@pengutronix.de>
 <AM0PR0402MB3937C9A79C55BF4C279F8099E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <Z2UBfcq6pE-JMUrb@pengutronix.de>
 <AM0PR0402MB3937347200BF1967EB677123E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <Z2UK4rMxrtNsPw5V@pengutronix.de>
 <AM0PR0402MB393781D3109B1B3FF3C2529FE8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <b919e252-6ff4-4e55-9bd6-4d610dda5348@pengutronix.de>
 <Z2UeKZcpeRUt2OQ4@pengutronix.de>
 <AM0PR0402MB393739E1D91ED2A539B5A2C7E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <Z2Ugt8NVued0_4c4@pengutronix.de>
 <AM0PR0402MB3937419BBB58B75FB8F8DE2DE8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <89a3b1c9-2be2-4e7f-a0c6-abbf8b88957b@pengutronix.de>
 <AM0PR0402MB39374CFFA66D8121DB218334E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <451e8c12-7b45-4b12-af10-63f60ba6e92e@pengutronix.de>
In-Reply-To: <451e8c12-7b45-4b12-af10-63f60ba6e92e@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR0402MB3937:EE_|PAXPR04MB9375:EE_
x-ms-office365-filtering-correlation-id: 8aa1ef22-0097-4269-287d-08dd20e38873
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MGhvNDc2RjlMeHlzSGlRWFVjUFh6YWFZQk1oSHVlY2FhbERjQUgwNDREUkU0?=
 =?utf-8?B?blF6WkdOcnptY2ltMDNJQ29sZE1BZVZScGYyKzlUOCthbG1KZWg0ZXBkeVFG?=
 =?utf-8?B?SG5HZUpKZzJ3S3hzQUIwNUtOaXBaa1h0U1NaTXNUZlV3Y2VBRjlnZ1hlQ2xx?=
 =?utf-8?B?Q25Sd1pveXV0WnRMQXd6VWFxYzZVS1lxNG1KWWFQNStDVUVyVDlkR3ZmdlBQ?=
 =?utf-8?B?TUIwcUwxVUNwRlRLQ2lRWDV2UFJ6bkFkZXQ3RkJ0S1dnUVdTNGRRQmpLa1FI?=
 =?utf-8?B?QVE4MlYzbERFcUxKYTRzcTBtcTg5U0ZnYy9SV0FBUi8rcDFQWXpkUkMrZzlx?=
 =?utf-8?B?SVhrUjVFUTNVbFhDV01NLzlZSitsaDM3OXN4d1ZvNHN1MTU3VnRtNm0zWDc4?=
 =?utf-8?B?WCtybjBMSXU1NytqT1dMdnh5M0tZYitsSk04WFRpQ1ZFK0R2ekFmN0hXcTRu?=
 =?utf-8?B?dlAwMm5IbTltRFRyUEt0d0NmajhhYkFaVDZONGp2d3JYSngwdDJlSTF3bU9l?=
 =?utf-8?B?WEdqTmJiSXZTdmxsWjdUUEZENnl3VkZDVDN1YWFIR2wxZndLS0F2bmtLbU9r?=
 =?utf-8?B?ejZXZXdiUUg0bFl1OFg0OEJhYnF1K2ljQnNFZ0JLVW05bGlSUC82K2IwaU1k?=
 =?utf-8?B?VjN3RU83dnVNRzkrSGgzZEZ3SUhyZHNjcDhHYzVuak5JTk9nVmMyRWsrbFBJ?=
 =?utf-8?B?TjVQYU84NUJYOVJacHhqb211WjNUNFJKaTNyR1N0SWRiaks4VFdtYzk1QUU3?=
 =?utf-8?B?Q1N4d2srN3dhNFJyVTcxVmlHQUdvY3FqSXJnaXZJajB6cEZ6bjBnRnJDMWx1?=
 =?utf-8?B?SHh6QnpZNG1NWHJHMFJodTNVV3pSbzdBU0dIUHl6N3JLT1VmVlZLbUNqNzdq?=
 =?utf-8?B?L1VtaEU1Ry9rejhKZkQzNEEwRmsvNVN3dVgrQmpVRDE3WUc1Nno3em5Tc2c0?=
 =?utf-8?B?Vkx5dEtZbXpETlVrTDhFUFQySUZEeUdLTHZDQ0JWZVp2VndaSHlXbkR3czd1?=
 =?utf-8?B?SjUyU2NZQWRHUUdhSTZFTkJESmNVeFZ0UVRobTVTM0JYYmtabGJSRFNjZVJi?=
 =?utf-8?B?SGM1Z1pENVNmenFMTU9yaEFnbWV5bnBCTVRXTUlzQlErakhoaExaUVVtZ0l1?=
 =?utf-8?B?OVZqNjRpSHFQN050cFJ4UzhpQVJHREhDVVhkZld5dTNaMmEzSm84NjlwZ2w5?=
 =?utf-8?B?c0tWVUZJZzFmSkprcEJrcGQ1cnBoWmVVM2VCL3VjK1BQUzEwakZEKzlBTndS?=
 =?utf-8?B?YVZIcDNDUjVvTGxCaDVDcXhub2VSSGpzQjlDK0VlejJWWVRvczdDNGwxcWlj?=
 =?utf-8?B?VUdmKzJIcTBvaHB1bS9UL2RBaTBQNWtZVFJzMHJZREp2MTR0K0ZhZll6OTZm?=
 =?utf-8?B?YmV6NzNRZ3J1SllxYWhxYW44SGl6Um1CVDhLYUo4MC9UZFFmdy9sV2Y3QWlQ?=
 =?utf-8?B?UmNGeUNpMFc5RFZBZ1pNbHBvTFZwSFRmZS82NVArV1FtdzB1T0hUTlYrQjhU?=
 =?utf-8?B?akZSY3p6U1J4SUhHclV5K1l1WXhxYjdHbnlQTkRML0tDekFqSjRtNTdXRkVV?=
 =?utf-8?B?MUt1NmhJd1pHZTRDb1lOSEJNSWl1eFNMUkZac3R5OUdrK0hrYnNwTHAxcFI1?=
 =?utf-8?B?amZnTmRJQTZ4aWpTVndNS1FFaDZkNDB4TTQzOWx6ejVESmRyWGp4dHlCSkZq?=
 =?utf-8?B?cldFcU5scEFQSlM2T3FvT2pSWU1UWHlWN0c2dFlpNlJhL0lOeUtYZ2dySGY5?=
 =?utf-8?B?UzNLMWF3b0llZzd0ZUhQK1J3WDE0ZkpwaWlpdXhTcGRDMGlPcnFROEJJaCt0?=
 =?utf-8?B?Sis4UndhaGl6OHNLSEIzYkk0RUVmYjFENEdMTWtZN09qMkdTeU1KRndnUSto?=
 =?utf-8?Q?utR1aNpTeIahZ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VVAxbzYvUG80NWFhRnFid1R6a08xd1JOUCtqNWxoRnhLcUd3TjExTG9OUWRt?=
 =?utf-8?B?OUtESVJZak1XOFNwVldNajF6S1B4dFBGZVhuTVI2NVJ2V1owQ2Q0OFlCWVdl?=
 =?utf-8?B?Q2ZMSE83anNpQ3NQRVV5TUk5NjQ3T2lHeWNNVWI1ZVQzZERXbFliN0toMzB5?=
 =?utf-8?B?M2lEOW9lVGJiUDFBcjZ6OWwxWFVwMVllZEJ3UlNDNmxxb1F6ektldFR5WExO?=
 =?utf-8?B?V0hLLzlqc1N5RXorNHUxQ3hpVkVQV2VRUlJsa0xTZEE1c2lHUnZMZ0JodG5X?=
 =?utf-8?B?YVV0VW52RmlRanZDd0FpcTBQeTFSdHg2VXQrTWR2RFdxcDY0akRLRzZocHZn?=
 =?utf-8?B?Y3dNSldONkErc2xRS1ZNWVpwT3c3cjBxNGdWdmNudjlZNkdDeVRxeFpNZGQx?=
 =?utf-8?B?eHZMYUlsMitxSmxza3JtbEFzT2JCYzcxclA4cHNwdUp6dktWTVR2TzIwUlBm?=
 =?utf-8?B?VlIxZktkWm9DRXE2UWhBVS9SMDJIY3ZYQm5DTDdmVTIvbnh1TWNlT21jY0dz?=
 =?utf-8?B?MDRuK0RNSVJIa3dQdU8yT01Od3FOcTMwMXhtZjRBQlk0NFl6ZzFESElWbGxk?=
 =?utf-8?B?ZVdYUURhem02QkY3ZFFHWEQzTE9BWHptTjVjNzlZRERpTThUWnRlZ2E5MExr?=
 =?utf-8?B?a3BtVlZ3WXBpMkNkaGY3RlNhNkd2bFhObjd4M3RhMDZOcGJ6TGNqcGRxLy9M?=
 =?utf-8?B?NUpKQ24vdXBkai9wVUw0MzN6ZDdVMkk3RUpkdml2N3BlcjdEQTB5MFgxMFlx?=
 =?utf-8?B?Wjh4RUsveWhTNTU2RXlpUVEwOHZybGlnTnJPSUlXRWhPSzlvRWFHc0hRMmNV?=
 =?utf-8?B?cWxZZmFDZG9tZWtqM2Y0NFNhdXF4ckx2eGI4ejlFZ3ZtU3JrNTNQV251Qzcz?=
 =?utf-8?B?OHRWaEJiRThGVkduUm5vYU1KeUUxbVpKK0Vld2pIV1ozMlpheFNjZk8rUlla?=
 =?utf-8?B?Qnh6aE5JTStYazcvT0h2eENBSWVGLzA4M2hPN1QwTm5oeXl4c1Q0RnJxMjEv?=
 =?utf-8?B?QlRaSUxqTThOQjJxbUFXZS9lUEgvQWsrZ3M2YWxKQ3lNTUFDcU05ZFNQVFNp?=
 =?utf-8?B?OXVYbXMzOVdPQ1BVN2kwTEYrNVdnNVVuSFg2clBwVS9sZnY3ZWNIVURleGZR?=
 =?utf-8?B?OWNnbk0vY08rcTllYVN5YitIU01hZTgveU8rd1NjSUVHSEdaazdONUsxM2c4?=
 =?utf-8?B?bG52QmpXUHY5VnovWFliTHNCem9FWWhZbml6V1A2Ym1lcHl3bmJRTUZ4SHhE?=
 =?utf-8?B?SVpmTElha0dqWE1PbWNxYk9HbHdFb205Q001YXVyR28wellrdzNXYmFQTHhn?=
 =?utf-8?B?dkd4bUY0SzAzL1M1aDZEVjd4UzJaMFY2dWJZK0Jwb1p3WFVMMFhEdHAzK2xh?=
 =?utf-8?B?RXNIQUQ3M2tjVXJBT2l4L1I1aDJ0OFY1bElUaEUxM2JvTElXQVhqZzExa2hr?=
 =?utf-8?B?RXZnY1ZRVG93eHNmRXZ2VktHNDBidWlBV0xsajFTaUNrbG1rR0NYRWJZYytm?=
 =?utf-8?B?MEhnWHJiVEVNMm5xeEx0emZsbFdaQnZDNmwzSHBHeWdjWVNYdVZqakpJSjJx?=
 =?utf-8?B?RHJRTzVBekp5QktXRXBCZDFUM2hZSWhTYlNkUDA0MGRQM3lneWhyeFkrRDZO?=
 =?utf-8?B?VlNYOEE3L3RMTjduMDh0ZTdrNVc4SFdyUU8vUUNlMy9VOExvK2FtdVdTczAy?=
 =?utf-8?B?aVhJcnhtT1RsSXlyVGtUSWhhb2ZFdTUySy9UMHdVMW81VW9FUVB6OEJwMXlB?=
 =?utf-8?B?RnVHMVdtUE14Vk81WGF2SEFIc0ptT3ZBekNHK0JvNGRtMG5XR0s5SWUxcS90?=
 =?utf-8?B?cUtOWVdZcGt0NU1oOHhmUUpMU3JKN2s0RGYvVjNCVTFHOGw1bEQ2NWoxa2Ew?=
 =?utf-8?B?VDRsZVVoalBEWDcrbEczLzhGL1dIZ2IxZzdZelFremN2NEp3OUtRWlEyS3JJ?=
 =?utf-8?B?TTJLWVNKdGFrY3VMOWYzckRoVHphcHNBbGozdENiR3VPanJicnlmZHYvOVVF?=
 =?utf-8?B?UVBTbWxwZXZKVU13Vko3NHppMGtNdm5mRENSSU04SGpRZFQwVFR0cEtsNmU1?=
 =?utf-8?B?emxlK2FTRm1DbzRmcFBpM0RLZVVGeGZpWGZvRWE3YlhMYVNnbmltaDh2WTRV?=
 =?utf-8?Q?REPRnDsgPlpR60wMys3399y2B?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3937.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aa1ef22-0097-4269-287d-08dd20e38873
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 10:46:17.4979
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dOU+i01s6JFuLRHnOPOwvJxUDLJvXjbi4DtmDkqOBO24E0mdOT22bpsQQ1HzxMZi3/XGknJ+I97Fh5Mf4p5G2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9375

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWhtYWQgRmF0b3VtIDxh
LmZhdG91bUBwZW5ndXRyb25peC5kZT4NCj4gU2VudDogRnJpZGF5LCBEZWNlbWJlciAyMCwgMjAy
NCA1OjMyIFBNDQo+IFRvOiBDYXJsb3MgU29uZyA8Y2FybG9zLnNvbmdAbnhwLmNvbT47IE9sZWtz
aWogUmVtcGVsDQo+IDxvLnJlbXBlbEBwZW5ndXRyb25peC5kZT4NCj4gQ2M6IEFuZGkgU2h5dGkg
PGFuZGkuc2h5dGlAa2VybmVsLm9yZz47IEZyYW5rIExpIDxmcmFuay5saUBueHAuY29tPjsNCj4g
a2VybmVsQHBlbmd1dHJvbml4LmRlOyBzaGF3bmd1b0BrZXJuZWwub3JnOyBzLmhhdWVyQHBlbmd1
dHJvbml4LmRlOw0KPiBmZXN0ZXZhbUBnbWFpbC5jb207IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5v
cmc7IGlteEBsaXN0cy5saW51eC5kZXY7DQo+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgQ2xhcmsgV2FuZw0KPiA8eGlh
b25pbmcud2FuZ0BueHAuY29tPg0KPiBTdWJqZWN0OiBbRVhUXSBSZTogW1BBVENIIHY1XSBpMmM6
IGlteDogc3VwcG9ydCBETUEgZGVmZXIgcHJvYmluZw0KPg0KPiBDYXV0aW9uOiBUaGlzIGlzIGFu
IGV4dGVybmFsIGVtYWlsLiBQbGVhc2UgdGFrZSBjYXJlIHdoZW4gY2xpY2tpbmcgbGlua3Mgb3IN
Cj4gb3BlbmluZyBhdHRhY2htZW50cy4gV2hlbiBpbiBkb3VidCwgcmVwb3J0IHRoZSBtZXNzYWdl
IHVzaW5nIHRoZSAnUmVwb3J0IHRoaXMNCj4gZW1haWwnIGJ1dHRvbg0KPg0KPg0KPiBIaSBDYXJs
b3MsDQo+DQo+IE9uIDIwLjEyLjI0IDEwOjIzLCBDYXJsb3MgU29uZyB3cm90ZToNCj4gPj4+IEhp
LCB0aGUgcmV0IGlzIGZyb20gaTJjX2lteF9kbWFfcmVxdWVzdCgpIGFuZCBsb29rIGxpa2UgdGhh
dCByZXQgaGFzDQo+ID4+PiBiZWVuIGNvbnZlcnRlZCBieSBQVFJfRVJSLCBTbyB0aGUgcmV0IGVy
cm9yIGhhcyBiZWVuIGh1bWFuIHJlYWRhYmxlDQo+ID4+IHZlcnNpb24/DQo+ID4+DQo+ID4+IEkg
YW0gbm90IHN1cmUgSSB1bmRlcnN0YW5kIHRoZSBxdWVzdGlvbi4gRVJSX1BUUigpIG1ha2VzIGFu
IGVycm9yDQo+ID4+IHBvaW50ZXIgYW5kICVwZSBmb3JtYXRzIHRoYXQgcG9pbnRlciBhcyBlcnJv
ciBtZXNzYWdlLiBTbyB5b3UgZG9uJ3QNCj4gPj4gbmVlZCB0byBjaGFuZ2UgYW55IGZ1bmN0aW9u
IHJldHVybiB0eXBlcyB1bmxlc3MgbmVlZGVkLCBqdXN0IGF0IHRoZQ0KPiA+PiBlbmQgcHJpbnQg
aXQgd2l0aCAlcGUgaW5zdGVhZCBvZiAlZCAoYW5kIGFmdGVyIGVycm9yIHBvaW50ZXIgY29udmVy
c2lvbiBpZg0KPiBuZWVkZWQpLg0KPiA+DQo+ID4gU29ycnksIEkgZG9uJ3Qga25vdyBpZiBJIHVu
ZGVyc3RhbmQgaXQgaW5jb3JyZWN0bHkuDQo+ID4gSSByZXZpZXcgb3RoZXIgZHJpdmVyIGNvZGUs
IG1vc3QgY2hvb3NlIHRvIHJldHVybiBlcnJvciB2YWx1ZSBidXQgbm90IGFuIGVycm9yDQo+IHBv
aW50ZXIuDQo+ID4gU2hvdWxkbid0IGVycm9yIHZhbHVlIOKAi2JlIG1vcmUgcmVhZGFibGUgdGhh
biBlcnJvciBwb2ludGVycz8NCj4gPiBXaGVuIHdlIHNlZSAtMTEwIHdlIGtub3cgVElNRU9VVCBh
bmQgd2Ugc2VlIC0xMiB3ZSBrbm93IE5PIE1FTS4NCj4NCj4gSSBrbm93IC0xMTAsIGJ1dCAtMTIg
SSBuZWVkIHRvIGxvb2sgdXAgOikgQm90aCBhcmUgY3J5cHRpYyB0byBlbmQgdXNlcnMsIHdoaWNo
IGlzDQo+IHdoeSAlcGUgd2FzIGFkZGVkIG9uIHRvcCBvZiB0aGUgZXhpc3RpbmcgJXA6DQo+DQo+
IElmIENPTkZJR19TWU1CT0xJQ19FUlJOQU1FIGlzIGVuYWJsZWQgJXBlIGV4cGFuZHMgdG8gYW4g
ZXJyb3Igc3RyaW5nLCBlLmcuDQo+ICJFTk9NRU0iIG9yICJFVElNRURPVVQiLiBJZiBpdCdzIGRp
c2FibGVkLCB5b3UgZ2V0IHRoZSBzYW1lIGVycm9yIG51bWJlcg0KPiB0aGF0IHdhcyBwcmludGVk
IHJhdyBiZWZvcmUuDQo+DQo+IENoZWVycywNCj4gQWhtYWQNCj4NCg0KV293ISBMb29rcyBzbyBj
b29sLg0KVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgeW91ciBwYXRpZW50IGV4cGxhbmF0aW9uISBJ
IGFncmVlIGl0Lg0KDQpBbHNvIEkgd2lsbCBjaGFuZ2UgdGhlIGNvbW1lbnQgZnJvbSB5b3VyIHN1
Z2dlc3Rpb25bMV06DQoNCiINCiAgLyoNCiAgICogQXMgd2UgY2FuIGFsd2F5cyBmYWxsIGJhY2sg
dG8gUElPLCBsZXQncyBpZ25vcmUgdGhlIGVycm9yIHNldHRpbmcgdXANCiAgICogRE1BIGFuZCBz
ZWUgaWYgd2UgcnVuIGludG8gZXJyb3JzIHdoaWxlIHNldHRpbmcgdXAgUElPIG1vZGUuDQogICAq
Lw0KIg0KSW4gZmFjdCwgb3RoZXIgZXJyb3JzIGFyZSBhbHNvIGZyb20gRE1BIHNldHRpbmcgbm90
IGZyb20gc2V0dGluZyBQSU8gbW9kZS4NClNvIGNhbiBJIGNvbW1lbnQgc2ltcGx5IGxpa2UgdGhp
cz8NCg0KICAgICAgICAvKiBBcyB3ZSBjYW4gYWx3YXlzIGZhbGwgYmFjayB0byBQSU8sIGxldCdz
IGlnbm9yZSB0aGUgZXJyb3Igc2V0dGluZyB1cCBETUEuICovDQogICAgICAgIHJldCA9IGkyY19p
bXhfZG1hX3JlcXVlc3QoaTJjX2lteCwgcGh5X2FkZHIpOw0KICAgICAgICBpZiAocmV0KSB7DQog
ICAgICAgICAgICAgICAgaWYgKHJldCA9PSAtRVBST0JFX0RFRkVSKQ0KICAgICAgICAgICAgICAg
ICAgICAgICAgZ290byBjbGtfbm90aWZpZXJfdW5yZWdpc3RlcjsNCiAgICAgICAgICAgICAgICBl
bHNlIGlmIChyZXQgPT0gLUVOT0RFVikNCiAgICAgICAgICAgICAgICAgICAgICAgIGRldl9kYmco
JnBkZXYtPmRldiwgIk9ubHkgdXNlIFBJTyBtb2RlXG4iKTsNCiAgICAgICAgICAgICAgICBlbHNl
DQogICAgICAgICAgICAgICAgICAgICAgICBkZXZfZXJyKCZwZGV2LT5kZXYsICJGYWlsZWQgdG8g
c2V0dXAgRE1BICglcGUpLCBvbmx5IHVzZSBQSU8gbW9kZVxuIiwgRVJSX1BUUihyZXQpKTsNCiAg
ICAgICAgfQ0KDQpbMV1odHRwczovL2xvcmUua2VybmVsLm9yZy9pbXgvODlhM2IxYzktMmJlMi00
ZTdmLWEwYzYtYWJiZjhiODg5NTdiQHBlbmd1dHJvbml4LmRlLw0KDQpCUg0KQ2FybG9zDQo+ID4N
Cj4gPiBpMmNfaW14X2RtYV9yZXF1ZXN0IGlzIHVzaW5nIFBUUl9FUlIgdG8gY29udmVydCBwb2lu
dGVyIHRvIGVycm9yIHZhbHVlWzFdLg0KPiA+IEkgZG9uJ3Qga25vdyB3aHkgbmVlZCB0byB1c2Ug
RVJSX1BUUiB0byByZWNvbnZlcnQgdGhlIHZhbHVlIHRvIHBvaW50ZXI6DQo+ID4NCj4gPiBkZXZf
ZXJyKCZwZGV2LT5kZXYsICJGYWlsZWQgdG8gc2V0dXAgRE1BICglcGUpLCBvbmx5IHVzZSBQSU8g
bW9kZVxuIiwNCj4gPiBFUlJfUFRSKHJldCkpOw0KPiA+DQo+ID4gSXMgdGhlcmUgc29tZSBzdHJv
bmcgcmVhc29uPw0KPiA+DQo+ID4gWzFdDQo+ID4gaHR0cHM6Ly9sb3JlLw0KPiA+IC5rZXJuZWwu
b3JnJTJGaW14JTJGQU0wUFIwNDAyTUIzOTM3NDE5QkJCNThCNzVGQjhGOERFMkRFODA3MiUNCj4g
NDBBTTBQUjA0DQo+ID4NCj4gMDJNQjM5MzcuZXVycHJkMDQucHJvZC5vdXRsb29rLmNvbSUyRiZk
YXRhPTA1JTdDMDIlN0NjYXJsb3Muc29uZyU0DQo+IDBueHANCj4gPiAuY29tJTdDMTNhOGU2NTMy
ZGQ3NDM1YzMwMjAwOGRkMjBkOTI4MTklN0M2ODZlYTFkM2JjMmI0YzZmYTkyYw0KPiBkOTljNWMz
MA0KPiA+DQo+IDE2MzUlN0MwJTdDMCU3QzYzODcwMjgzOTIyNzYxODc1NCU3Q1Vua25vd24lN0NU
V0ZwYkdac2IzZDhleUoNCj4gRmJYQjBlVTFoDQo+ID4NCj4gY0draU9uUnlkV1VzSWxZaU9pSXdM
akF1TURBd01DSXNJbEFpT2lKWGFXNHpNaUlzSWtGT0lqb2lUV0ZwYkNJc0lsZFVJag0KPiA+DQo+
IG95ZlElM0QlM0QlN0MwJTdDJTdDJTdDJnNkYXRhPTJBNnFQbEZFdVcxU21sdk9aN09odGZPN1Z3
cXlzTQ0KPiBjR2hGTDJHJTJGDQo+ID4gRUNOZWslM0QmcmVzZXJ2ZWQ9MA0KPiA+Pg0KPiA+PiAt
LQ0KPiA+PiBQZW5ndXRyb25peCBlLksuICAgICAgICAgICAgICAgICAgICAgICAgICAgfA0KPiA+
PiB8DQo+ID4+IFN0ZXVlcndhbGRlciBTdHIuIDIxICAgICAgICAgICAgICAgICAgICAgICB8DQo+
ID4+IGh0dHA6Ly93d3cvLg0KPiA+Pg0KPiBwZW4lMkYmZGF0YT0wNSU3QzAyJTdDY2FybG9zLnNv
bmclNDBueHAuY29tJTdDMTNhOGU2NTMyZGQ3NDM1YzMwDQo+IDIwMDhkDQo+ID4+DQo+IGQyMGQ5
MjgxOSU3QzY4NmVhMWQzYmMyYjRjNmZhOTJjZDk5YzVjMzAxNjM1JTdDMCU3QzAlN0M2Mzg3MDI4
Mw0KPiA5MjI3NjMNCj4gPj4NCj4gODA3NyU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpGYlhC
MGVVMWhjR2tpT25SeWRXVXNJbFlpT2lJd0xqQQ0KPiB1TURBdw0KPiA+Pg0KPiBNQ0lzSWxBaU9p
SlhhVzR6TWlJc0lrRk9Jam9pVFdGcGJDSXNJbGRVSWpveWZRJTNEJTNEJTdDMCU3QyU3QyU3QyZz
DQo+IGRhDQo+ID4+DQo+IHRhPUxhc0x0cGU3R2pzRzVxVlVLRyUyRk9tVnJvMkp1ZUdMZndVUEFM
dzclMkZCMmZnJTNEJnJlc2VydmVkPQ0KPiAwDQo+ID4+DQo+IGd1dHJvbml4LmRlJTJGJmRhdGE9
MDUlN0MwMiU3Q2Nhcmxvcy5zb25nJTQwbnhwLmNvbSU3QzU5NDQ5N2RiMWI1DQo+ID4+DQo+IDQ0
ZTQ3OWE4ZjA4ZGQyMGQxZTg4ZSU3QzY4NmVhMWQzYmMyYjRjNmZhOTJjZDk5YzVjMzAxNjM1JTdD
MCU3QzANCj4gPj4gJTdDNjM4NzAyODA4MTA0OTAzMTMxJTdDVW5rbm93biU3Q1RXRnBiR1pzYjNk
OGV5SkZiWEIwZVUxaGMNCj4gR2tpDQo+ID4+DQo+IE9uUnlkV1VzSWxZaU9pSXdMakF1TURBd01D
SXNJbEFpT2lKWGFXNHpNaUlzSWtGT0lqb2lUV0ZwYkNJc0lsZFVJam95Zg0KPiA+Pg0KPiBRICUz
RCUzRCU3QzAlN0MlN0MlN0Mmc2RhdGE9RW5oc0lGbEJvb3FqQiUyRlNSV0Y3dUFxUkhFM3lONnJi
ZA0KPiBEDQo+ID4+IDF5UXVlVHJSdXMlM0QmcmVzZXJ2ZWQ9MCAgfA0KPiA+PiAzMTEzNyBIaWxk
ZXNoZWltLCBHZXJtYW55ICAgICAgICAgICAgICAgICAgfCBQaG9uZToNCj4gKzQ5LTUxMjEtMjA2
OTE3LTANCj4gPj4gfA0KPiA+PiBBbXRzZ2VyaWNodCBIaWxkZXNoZWltLCBIUkEgMjY4NiAgICAg
ICAgICAgfCBGYXg6DQo+ID4+ICs0OS01MTIxLTIwNjkxNy01NTU1IHwNCj4NCj4NCj4gLS0NCj4g
UGVuZ3V0cm9uaXggZS5LLiAgICAgICAgICAgICAgICAgICAgICAgICAgIHwNCj4gfA0KPiBTdGV1
ZXJ3YWxkZXIgU3RyLiAyMSAgICAgICAgICAgICAgICAgICAgICAgfA0KPiBodHRwOi8vd3d3LnBl
bi8NCj4gZ3V0cm9uaXguZGUlMkYmZGF0YT0wNSU3QzAyJTdDY2FybG9zLnNvbmclNDBueHAuY29t
JTdDMTNhOGU2NTMyZGQNCj4gNzQzNWMzMDIwMDhkZDIwZDkyODE5JTdDNjg2ZWExZDNiYzJiNGM2
ZmE5MmNkOTljNWMzMDE2MzUlN0MwJTdDMA0KPiAlN0M2Mzg3MDI4MzkyMjc2NTI3MjUlN0NVbmtu
b3duJTdDVFdGcGJHWnNiM2Q4ZXlKRmJYQjBlVTFoY0draQ0KPiBPblJ5ZFdVc0lsWWlPaUl3TGpB
dU1EQXdNQ0lzSWxBaU9pSlhhVzR6TWlJc0lrRk9Jam9pVFdGcGJDSXNJbGRVSWpveWZRDQo+ICUz
RCUzRCU3QzAlN0MlN0MlN0Mmc2RhdGE9SG02MFFMNWRKMmgzT0Nlc09YSzg3MUFTbks3czBMNFNQ
aVkNCj4gYkswanRTT28lM0QmcmVzZXJ2ZWQ9MCAgfA0KPiAzMTEzNyBIaWxkZXNoZWltLCBHZXJt
YW55ICAgICAgICAgICAgICAgICAgfCBQaG9uZTogKzQ5LTUxMjEtMjA2OTE3LTANCj4gfA0KPiBB
bXRzZ2VyaWNodCBIaWxkZXNoZWltLCBIUkEgMjY4NiAgICAgICAgICAgfCBGYXg6DQo+ICs0OS01
MTIxLTIwNjkxNy01NTU1IHwNCg==


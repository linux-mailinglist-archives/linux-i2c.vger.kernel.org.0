Return-Path: <linux-i2c+bounces-8236-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 505049DA359
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Nov 2024 08:48:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B72F3B22031
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Nov 2024 07:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C051F153565;
	Wed, 27 Nov 2024 07:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IiGhkQ1c"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012021.outbound.protection.outlook.com [52.101.66.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBF818E0E;
	Wed, 27 Nov 2024 07:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732693698; cv=fail; b=d7MzBh5wD/MZ/veFe0tlixT9SLxc6MzQzJwSD87kM+1HDhGCi/e14LaJAFKtuNHq509yLNTIgm3QByqqnuvZlGq6wiwEcH4YA4Wfex1zUkIBuCfFMocGzfbH7CQB9sCg3H4Ahmg6c2TY7ii91aaZqMAMmXbhyNoG8r3YGEeJnHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732693698; c=relaxed/simple;
	bh=J2A/B0VGxRlDqKA9LvNsURYgOu6G0cdVFmepCXkLMwA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ic0VD882HabDolXKpL1bwKM2ze9DaUPptWhXQG9vbujHMuuSjME6WJywXrp7fDgg8qr+o0cZGSKEF7Fom4CGsfITiJhRbqe8ka0ytkq/5afsaIUcLfeddpPaM1nxviI2RB9maQLnb8qJjmP6tWWY2dPV4Gow2r2rt4u1KAeErmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IiGhkQ1c; arc=fail smtp.client-ip=52.101.66.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RszLC8q3xNoiaMCh5XOtqLUOpQiaOe1BXcfVkWvk70R4waerw+lLfRXQQC0V7bqUy9voVAHxClk/yIdsYxu8GaMsjZg7XOUrBEd7efsnSeI6UQDsZtqY7yftQSoKTfYVTkmBJGXRvvSY3uWVmmdDId8BIFJDnKLJzbXfpyRdAU5kfPMvFLed1rsk9hcc7dNsb5hnNM3/G2mgjhZ90sBf6EnL86VzZegUQ4CoRUWud4tA2V6OGODkrIcSd+hbGrq9MnaZRjaGT2Y6lV252jIqPRrSEsJPo+hKLCSHYpcesoUEuBbxBRZewcyBBJ22a+OeerGH/0uAi2zLlfzNSJ7eyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2A/B0VGxRlDqKA9LvNsURYgOu6G0cdVFmepCXkLMwA=;
 b=jHWcD4XjGBd+InTi8k7/t15f5pg02C6FlfPNg9GZPI+bWk4P3C3u3I/R1VW9/iTMCKT9c1A5CuP0jExgbK9cTtCdhECGoKv0x2Tw6CnUg38FGS0xgvaNwVxDmMy73tyZnEe/PVN+jrZCyoW1WryIRlKkPOy0ZjUCN5TOv0zu1lsPz7srbCEw2gJTrjQEiBuLVmEE9LqM7I4lVxTuwO1E58cyiGHJi1v/+T3eehSNsMMes9IJ+pjHsUa7zAArZEcrLPGkxItTCcFSCzlsyeCjD4MP2NeMcQMzq9iBgVjfwT8yKFIRm3gW4OZLSFjHb8c8Ff2Nm3mVHOqkVX8Mn8ejcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2A/B0VGxRlDqKA9LvNsURYgOu6G0cdVFmepCXkLMwA=;
 b=IiGhkQ1cPCIYYqEfOhvTpyu5ZesnNC2aFV2daqAQNd9d6S9nGy5//BvaSrqwMoB2F6Zu8mATgcutIcVuC7ciSDGQvA5nRrWWFLpQQZotICAGVpGsWyJH+Sr4H9E5MPSRyqg6oN2Kkihoo+qSwvpGx3GSdWvOsiR5MdA34sewwQKPXJEk3P+F/tqP2FD+Vo90RdOzmzxisQ1AciFuS+x4quNV2jE+ymOLyUgECuhZfzRKu8XD0fYKKyREVcpj+apAMRrmIxqSSuMgWG0U+h3irQD6leXQfx1JOHKf00aLPBc4wjpgvwVAahVGCCwMwL6ktpeg97BiQRNHR2B5VY2+KA==
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by DBBPR04MB7883.eurprd04.prod.outlook.com (2603:10a6:10:1e9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.12; Wed, 27 Nov
 2024 07:48:13 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%4]) with mapi id 15.20.8048.020; Wed, 27 Nov 2024
 07:48:13 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
CC: Frank Li <frank.li@nxp.com>, "o.rempel@pengutronix.de"
	<o.rempel@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH v3] i2c: imx: support DMA defer probing
Thread-Topic: [EXT] Re: [PATCH v3] i2c: imx: support DMA defer probing
Thread-Index: AQHbQJ8J8oaex7XlfkCmdO+XVwVKZrLKvokAgAABAEA=
Date: Wed, 27 Nov 2024 07:48:13 +0000
Message-ID:
 <AM0PR0402MB3937614F4866F4F15D2FDA21E8282@AM0PR0402MB3937.eurprd04.prod.outlook.com>
References: <20241127074458.2102112-1-carlos.song@nxp.com>
 <20241127-ninja-dormouse-of-bloom-8ee494-mkl@pengutronix.de>
In-Reply-To: <20241127-ninja-dormouse-of-bloom-8ee494-mkl@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR0402MB3937:EE_|DBBPR04MB7883:EE_
x-ms-office365-filtering-correlation-id: aad75dbd-3440-41dd-7132-08dd0eb7d8be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aU01YTFkWktwejgrejJtN1IzZ3RNVDQ4SktVSjhHeWVlMVljSTlMcXJ6WUtH?=
 =?utf-8?B?b2R6bjR5Y3FWUEVUdUdFb1ZSMXVCVkdNTHNsV2F4MUZBQjI1cWlNckZGWGdR?=
 =?utf-8?B?L0lqMFdoYlJNZUl0T0U2eXVBUE00OFFIVlhWSUZZd2dCd3JJb0hCTFlQOGMv?=
 =?utf-8?B?WW40VWIvQ1FKM0s0ZTZhdFlheStxTzIxRjdjTE9oZElqSWlPYjhmQTlnTXRV?=
 =?utf-8?B?ZnNCRjV1S0JHRkc2bmpISkt4WkkxWmZ5RmVsdWtPUyt5UXdDbjI1UTQ5N09S?=
 =?utf-8?B?eFVMaGNENHZDM202MHA5QVR6Z3hRZm9tKzBRcUZ4alMybVJZNWRDV29VcnJZ?=
 =?utf-8?B?RHdRcjFRTlNlLzRGRjE2TStpWWRlUnlCamlmSk8zaTJTclRjZUI4NHVZVUg1?=
 =?utf-8?B?aFVEZUtzSEZBZno0L3Y1VlM5cVNSR1BUWW04YVFpK2hrUTI3aFMreSthYUhU?=
 =?utf-8?B?SCtoM2l3ejB5VDJEVlpjTFJtSnA3MVhyclFHUHV5blg4WUVvbUFRMWFxNEpY?=
 =?utf-8?B?aEdZQjlHWHJhaWxoTmc4aG8yejJ1QUlyeGcwYlpBdEVzaCtoTzJRbGRTLytn?=
 =?utf-8?B?S3pTdGcrS2oxYTlMbHczN3pENGgraWp6ZDQrOUtQVER2V3pFRHJHajZKTVlK?=
 =?utf-8?B?dndvYm02Z3NHU3NaUS9pU2xobmNuYXRNK1BLekhVcG1Ec1JoUG94c0JjdGNF?=
 =?utf-8?B?TkRMME9BSjVodFpaR0NqWklkKzE0QkpOZlNsN3I3VWVEZUtOQmcrQWtMZmZG?=
 =?utf-8?B?SXhiemVKVkpqSDJ1VVFYYyt0MnhncWtvSEE1QW9KQkhLT05CN1lNaEZlZ1Q3?=
 =?utf-8?B?OE9seHRLODZPdWIrUm43bnM4OWROcWJ2bkdaLzlORFI3ZHBQb3lnRmQycFBJ?=
 =?utf-8?B?YXIvaWYwQ3FxeTd2aG0zS281cjEwbkE3RDl0N2hQeFJkRXNxd082L1BLaGNv?=
 =?utf-8?B?TEhXV3AybElEd1EwMStkK3JqbmlrbmQ2d1grQXRCd3VyMTJIdDNaaVFuamdl?=
 =?utf-8?B?b291Y1pmMjN3UHRzcnlNY2pXU2l0TzFUc1NCZGZ3dmdrODZuNlRiZ0ZFdE8v?=
 =?utf-8?B?ZEZLL3lqWTY3bWlpMFR1M20vWk1iamdvN3M5cW9uRkJjMnZSOUNocGFYbjJO?=
 =?utf-8?B?TVJYY1VLLzJCZ0pJTU9tN0lqbkl1Y0ZLbjFtTS81dmNUZjVMek9XTXhwb0hT?=
 =?utf-8?B?UGtweGQ2MFFzQ2I4bTh5UktmWEZlTjJNUHBiYjMzU3VyVXRVZjVZOC9nV3gy?=
 =?utf-8?B?UFFaUEwwclBCazFTOTAyRlFaVk5FUXRSK3dXYzhMNUhTdUFDVnF4cFo0aE1a?=
 =?utf-8?B?KzM4Nm1qV20vZ0JjeEdNWE9IY2xFVDE2UllMcGhJZFJydmxJNWxHWU1acWpD?=
 =?utf-8?B?OFhCdjR4VUREN1h3T25NaFdmZHBZdUFiem4wbXhXM0dHanZ3MFpzWkJENUpk?=
 =?utf-8?B?K3ZaRjdodDZOaWNXZ1R0c3pSSDh4ZktrNFZwRU9vNkM5RlhMNjgwY2wwcnFx?=
 =?utf-8?B?YjRWNFl5SVBMNGt1Ym1Jc3duSHRwNWVEcDFVS3Jvb2RTWnMzNE9Vbm9aeWg2?=
 =?utf-8?B?NW9HcW9oK2gza0E1RmtLWjBSMW9WSEUwMXZ4MkEzNHpNc1hxK05TNVptZ09y?=
 =?utf-8?B?dEtiRGJPTzU2UWRPN2JuS2RuRGlqVHNPWmZpcXl6ZkR2NVJDWENTWUFDMk5t?=
 =?utf-8?B?aVhySU1YQWpaQ2x5cGlMbXgxZ2VkalZNSEtkZGxPVjBWYUV5Nkg5RWVuNmNa?=
 =?utf-8?B?WmVuK0o1ZFdJU2l5ZDBDVTFjay9Lamw1aGhrOUdZNWxlSHd3VGZMc0ljYVhs?=
 =?utf-8?B?S2tWbU8xNnNZT0l1eVVQdz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WjQ5bE9ESmVQaU1rZUVpQ0pFTnYzZy9aWkZRdXFqUGZrcXhGT1phS3NXVG8z?=
 =?utf-8?B?TEdaSEU1QUV3WGtrQjBORHY1K1hQczYvdm94VmZOVTJJRW9ad0VSMDFtWE9y?=
 =?utf-8?B?V3kyWlZ4UnBva0g0dUwyM09GdWVUaUt2YS9UR2pnN3V2YnFCQ3BibTQzUmlx?=
 =?utf-8?B?WXJIZG9oVS8vMWU1Qkw0RFZCWVRHNFZ4YkFMTjhuZ0ZuOTRGZ0paQkNsTG8x?=
 =?utf-8?B?UHpjdXRIRjUvaXgvTmttOGxXQlFaaUpZa1JqNXIybEh5dzdMZWt0Mk9iREZY?=
 =?utf-8?B?R0RiVUk0ZlVIQ2pVUEVSd3QyZ2FuWlVHckhSVENOZGRCOXcrZ1M3b3FtL2Rp?=
 =?utf-8?B?Nm1pWk9SY0IvMzREbzhkWUgrd3hESnpTODNBL2I4cmZ2UHp6L05La1BESDZH?=
 =?utf-8?B?MjMrL3BBYkFPZDAzcGpvZG02T2lmUXFEcC93aUNnQ2tBUkFaaUlNSGErVHk3?=
 =?utf-8?B?K2JTaUFPMktVU3lmbFB1WVo1NDlmVEhiT0Mwci85N3U5OTVva2Qvd1htTzlP?=
 =?utf-8?B?akxkM0JSZDJ4ZkR0REtFOExzcXNkQkZ5YlRjODh2ZjVpQS90UURKSk4wYnpr?=
 =?utf-8?B?WUVDNkhaVCs0d2RmR0cyTjVSOU1wVm9UVy9XVFFjaGxad2hxV3FPem5vdXk1?=
 =?utf-8?B?WGNTRzlFdStmbXpPMW9RWVAvd0lScHZGTGFJaW9hTlFzQld3dGE2cUphRzBu?=
 =?utf-8?B?VzhKSWFjMnNKeDNVWDlvRDFzZ0J2N3d0QnlYcE9WZGJWM09zTFFPSElOZG5E?=
 =?utf-8?B?QVdDMEpkMW1hc3UrTlpPYlkzTWVEbHRFOEpsKzBaRnFteEFMOXlCRytZRDRy?=
 =?utf-8?B?RmEyODhSVnJnS2ZXM2t2VVBLcHhOY3VlOXZ1K0wxWDRjN1dhbXpWL0RUUER1?=
 =?utf-8?B?YWJURElWc09BVEJYVFl6eEljZmJISGtiWFZjOXp1MnRNNi9VY3E4UkRXRCtP?=
 =?utf-8?B?YjJOWGxvWXIwa2tQcXZpdXd2bUlEcmZOR21JSDRhaDAybmtaWXFNVEsrTFoz?=
 =?utf-8?B?QXFiVGJ6bnBwa3FlZmtEbW5YSTVYdGJPWHhvNTloK3BCMzJNaldnYk9zQTNx?=
 =?utf-8?B?NzdOY1YzK2gwdkpPNGdteld3UWhwQVREdDVodndZZEwwdmhGRllYRVoxeGEv?=
 =?utf-8?B?cVZ3U0xaQW02M0MwRk93eDFkZkNiYlBLOWNIMTY0VHBzTEw4dWI3ckxzUWVx?=
 =?utf-8?B?SjRxN2F6U1JmZ0htYjkwNWJSRFFiVklncXpJSWtzZzdtMHFEQmJMcFd2eXNr?=
 =?utf-8?B?Rk5iNmwvZEhWR0dGamxrMGlwVUt0R0ZaTWMyOG9MZ2dvdmJrRnkyRHNRSFFy?=
 =?utf-8?B?RDV2Z3BhdVVyRW1oM1lNZ2ZmZ2NSNVpibkgxTUFITXBlM2FuWEhMbldDYTZW?=
 =?utf-8?B?S1E3eFlDdFVtRnh5bGQweHZkOUthQjFhdGd3Uk5yeHZWWC8yN1kvTG5nZDZr?=
 =?utf-8?B?MlU2WHBDL01tSXRpcCtTa0s5RGtvUDQyTGh2UUdjNFl5WmdFbDFpNDQzUCt6?=
 =?utf-8?B?SGx5RmZjTVJtTTZvdWN0QzFmWXhBM3ZpaER3UFhsL0xnQW0wdXJCMHdlcDRn?=
 =?utf-8?B?b3RyV3Qwc0pSK1NISWNEa1VyQ0U0b1lOb012S2R4YWFIUmJESTR3YURydlRG?=
 =?utf-8?B?UEtqNVRJdktneVl1ZmtrZnZLSmVyaWFxSzhwcnVnVjZHN01MWGNPL25tMXVK?=
 =?utf-8?B?NlduOUxvS1Mwa1dWRjRhbzdyNXgvZnphTEoxMDROaE5hY0M2dlltZXJ5MmFH?=
 =?utf-8?B?NkpOYnAwdzg4MWdVbWxmTFBpbmRveDNnSjJCclczMk9EbjBPTXkxS2hMbU9J?=
 =?utf-8?B?bEdLUUcwUU5CRG1QeUN6S1E1WkJzeTNVL0pRTU1SSUcwTlJJWnB1dTRsckNl?=
 =?utf-8?B?amVhd0owRk5GMGdnc3l5TVZrT3ArQ1VBMVBta3AzcEdRcDVBMXZNNTJ1M1ZM?=
 =?utf-8?B?aTNDL01YNWxMd3Y2ZWIxaEhCakxrbi93KzJJYXJtbHZDOFpkcFRqREhwcy9D?=
 =?utf-8?B?bnFVOWtwL0g0NHNUL1I1RVFFclA1c0VOL3k3QjFJemk5eFNnM1plZzNsR05U?=
 =?utf-8?B?YS9tcy9uNDZuQ01wc092dlh2dmRJa3lGNWFJY3NsWmdtSXJrOE83NGM5eFZz?=
 =?utf-8?Q?kHRjdiLQ1uzDydAbwAcQEKxiL?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: aad75dbd-3440-41dd-7132-08dd0eb7d8be
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2024 07:48:13.4261
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eOsIJq5kDRh+H4LwMp/t2tPjt3sbt+95fq+6/OXXO8T4A8qAJW61u4yuyvXpKMlZaNk4AfAELPtAvz3UHnGULQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7883

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFyYyBLbGVpbmUtQnVk
ZGUgPG1rbEBwZW5ndXRyb25peC5kZT4NCj4gU2VudDogV2VkbmVzZGF5LCBOb3ZlbWJlciAyNywg
MjAyNCAzOjQyIFBNDQo+IFRvOiBDYXJsb3MgU29uZyA8Y2FybG9zLnNvbmdAbnhwLmNvbT4NCj4g
Q2M6IEZyYW5rIExpIDxmcmFuay5saUBueHAuY29tPjsgby5yZW1wZWxAcGVuZ3V0cm9uaXguZGU7
DQo+IGtlcm5lbEBwZW5ndXRyb25peC5kZTsgYW5kaS5zaHl0aUBrZXJuZWwub3JnOyBzaGF3bmd1
b0BrZXJuZWwub3JnOw0KPiBzLmhhdWVyQHBlbmd1dHJvbml4LmRlOyBmZXN0ZXZhbUBnbWFpbC5j
b207IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmc7DQo+IGlteEBsaXN0cy5saW51eC5kZXY7IGxp
bnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZw0KPiBTdWJqZWN0OiBbRVhUXSBSZTogW1BBVENIIHYzXSBpMmM6IGlteDogc3Vw
cG9ydCBETUEgZGVmZXIgcHJvYmluZw0KPiANCj4gT24gMjcuMTEuMjAyNCAxNTo0NDo1OCwgY2Fy
bG9zLnNvbmdAbnhwLmNvbSB3cm90ZToNCj4gPiBGcm9tOiBDYXJsb3MgU29uZyA8Y2FybG9zLnNv
bmdAbnhwLmNvbT4NCj4gPg0KPiA+IFJldHVybiAtRVBST0JFX0RFRkVSIHdoZW4gZG1hX3JlcXVl
c3Rfc2xhdmVfY2hhbm5lbCgpIGJlY2F1c2UgRE1BDQo+ID4gZHJpdmVyIGhhdmUgbm90IHJlYWR5
IHlldC4NCj4gPg0KPiA+IE1vdmUgaTJjX2lteF9kbWFfcmVxdWVzdCgpIGJlZm9yZSByZWdpc3Rl
cmluZyBJMkMgYWRhcHRlciB0byBhdm9pZA0KPiA+IGluZmluaXRlIGxvb3Agb2YgLnByb2JlKCkg
Y2FsbHMgdG8gdGhlIHNhbWUgZHJpdmVyLCBzZWUgImU4YzIyMGZhYzQxNQ0KPiA+IFJldmVydCAi
aTJjOiBpbXg6IGltcHJvdmUgdGhlIGVycm9yIGhhbmRsaW5nIGluIGkyY19pbXhfZG1hX3JlcXVl
c3QoKSIiDQo+ID4gYW5kICJEb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvZHJpdmVyLW1vZGVsL2Ry
aXZlci5yc3QiLg0KPiA+DQo+ID4gVXNlIENQVSBtb2RlIHRvIGF2b2lkIHN0dWNrIHJlZ2lzdGVy
aW5nIGkyYyBhZGFwdGVyIHdoZW4gRE1BIHJlc291cmNlcw0KPiA+IGFyZSB1bmF2YWlsYWJsZS4N
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IENhcmxvcyBTb25nIDxjYXJsb3Muc29uZ0BueHAuY29t
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IENsYXJrIFdhbmcgPHhpYW9uaW5nLndhbmdAbnhwLmNvbT4N
Cj4gPiAtLS0NCj4gPiBDaGFuZ2UgZm9yIFYzOg0KPiA+IC0gQWNjb3JkaW5nIHRvIE1hcmMncyBj
b21tZW50LCByZW1vdmUgZXJyb3IgcHJpbnQgd2hlbiBkZWZlciBwcm9iZS4NCj4gPiAgIEFkZCBp
bmZvIGxvZyB3aGVuIERNQSBoYXMgbm90IGJlZW4gZW5hYmxlZCBhbmQgYWRkIGVycm9yIGxvZyB3
aGVuDQo+ID4gICBETUEgZXJyb3IsIGJvdGggd29uJ3Qgc3R1Y2sgdGhlIGkyYyBhZGFwdGVyIHJl
Z2lzdGVyLCBqdXN0IGZvciByZW1pbmRpbmcsDQo+ID4gICBpMmMgYWRhcHRlciBpcyB3b3JraW5n
IG9ubHkgaW4gUElPIG1vZGUuDQo+ID4gQ2hhbmdlIGZvciBWMjoNCj4gPiAtIEFjY29yZGluZyB0
byBGcmFuaydzIGNvbW1lbnRzLCB3cmFwIGF0IDc1IGNoYXIgYW5kIFNpbXBsaWZ5IGZpeCBjb2Rl
DQo+ID4gICBhdCBpMmNfaW14X2RtYV9yZXF1ZXN0KCkuDQo+ID4gLSBVc2Ugc3RyaWN0IHBhdGNo
IGNoZWNrLCBmaXggYWxpZ25tZW50IHdhcm5pbmcgYXQNCj4gPiBpMmNfaW14X2RtYV9yZXF1ZXN0
KCkNCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbXguYyB8IDMxICsrKysr
KysrKysrKysrKysrKysrKysrLS0tLS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIzIGluc2Vy
dGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9p
MmMvYnVzc2VzL2kyYy1pbXguYw0KPiA+IGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbXguYyBp
bmRleCA1ZWQ0Y2I2MWUyNjIuLjQ3MTEyYTM4ZDAzNCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJz
L2kyYy9idXNzZXMvaTJjLWlteC5jDQo+ID4gKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1p
bXguYw0KPiA+IEBAIC0zOTcsMTcgKzM5NywxNiBAQCBzdGF0aWMgdm9pZCBpMmNfaW14X3Jlc2V0
X3JlZ3Moc3RydWN0DQo+ID4gaW14X2kyY19zdHJ1Y3QgKmkyY19pbXgpICB9DQo+ID4NCj4gPiAg
LyogRnVuY3Rpb25zIGZvciBETUEgc3VwcG9ydCAqLw0KPiA+IC1zdGF0aWMgdm9pZCBpMmNfaW14
X2RtYV9yZXF1ZXN0KHN0cnVjdCBpbXhfaTJjX3N0cnVjdCAqaTJjX2lteCwNCj4gPiAtCQkJCQkJ
ZG1hX2FkZHJfdCBwaHlfYWRkcikNCj4gPiArc3RhdGljIGludCBpMmNfaW14X2RtYV9yZXF1ZXN0
KHN0cnVjdCBpbXhfaTJjX3N0cnVjdCAqaTJjX2lteCwNCj4gPiArZG1hX2FkZHJfdCBwaHlfYWRk
cikNCj4gPiAgew0KPiA+ICAJc3RydWN0IGlteF9pMmNfZG1hICpkbWE7DQo+ID4gIAlzdHJ1Y3Qg
ZG1hX3NsYXZlX2NvbmZpZyBkbWFfc2NvbmZpZzsNCj4gPiAtCXN0cnVjdCBkZXZpY2UgKmRldiA9
ICZpMmNfaW14LT5hZGFwdGVyLmRldjsNCj4gPiArCXN0cnVjdCBkZXZpY2UgKmRldiA9IGkyY19p
bXgtPmFkYXB0ZXIuZGV2LnBhcmVudDsNCj4gPiAgCWludCByZXQ7DQo+ID4NCj4gPiAgCWRtYSA9
IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigqZG1hKSwgR0ZQX0tFUk5FTCk7DQo+ID4gIAlpZiAo
IWRtYSkNCj4gPiAtCQlyZXR1cm47DQo+ID4gKwkJcmV0dXJuIC1FTk9NRU07DQo+ID4NCj4gPiAg
CWRtYS0+Y2hhbl90eCA9IGRtYV9yZXF1ZXN0X2NoYW4oZGV2LCAidHgiKTsNCj4gPiAgCWlmIChJ
U19FUlIoZG1hLT5jaGFuX3R4KSkgew0KPiA+IEBAIC00NTIsNyArNDUxLDcgQEAgc3RhdGljIHZv
aWQgaTJjX2lteF9kbWFfcmVxdWVzdChzdHJ1Y3QNCj4gaW14X2kyY19zdHJ1Y3QgKmkyY19pbXgs
DQo+ID4gIAlkZXZfaW5mbyhkZXYsICJ1c2luZyAlcyAodHgpIGFuZCAlcyAocngpIGZvciBETUEg
dHJhbnNmZXJzXG4iLA0KPiA+ICAJCWRtYV9jaGFuX25hbWUoZG1hLT5jaGFuX3R4KSwgZG1hX2No
YW5fbmFtZShkbWEtPmNoYW5fcngpKTsNCj4gPg0KPiA+IC0JcmV0dXJuOw0KPiA+ICsJcmV0dXJu
IDA7DQo+ID4NCj4gPiAgZmFpbF9yeDoNCj4gPiAgCWRtYV9yZWxlYXNlX2NoYW5uZWwoZG1hLT5j
aGFuX3J4KTsNCj4gPiBAQCAtNDYwLDYgKzQ1OSw4IEBAIHN0YXRpYyB2b2lkIGkyY19pbXhfZG1h
X3JlcXVlc3Qoc3RydWN0DQo+IGlteF9pMmNfc3RydWN0ICppMmNfaW14LA0KPiA+ICAJZG1hX3Jl
bGVhc2VfY2hhbm5lbChkbWEtPmNoYW5fdHgpOw0KPiA+ICBmYWlsX2FsOg0KPiA+ICAJZGV2bV9r
ZnJlZShkZXYsIGRtYSk7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIHJldDsNCj4gPiAgfQ0KPiA+DQo+
ID4gIHN0YXRpYyB2b2lkIGkyY19pbXhfZG1hX2NhbGxiYWNrKHZvaWQgKmFyZykgQEAgLTE4MDMs
NiArMTgwNCwyMyBAQA0KPiA+IHN0YXRpYyBpbnQgaTJjX2lteF9wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQ0KPiA+ICAJaWYgKHJldCA9PSAtRVBST0JFX0RFRkVSKQ0KPiA+ICAJ
CWdvdG8gY2xrX25vdGlmaWVyX3VucmVnaXN0ZXI7DQo+ID4NCj4gPiArCS8qDQo+ID4gKwkgKiBJ
bml0IERNQSBjb25maWcgaWYgc3VwcG9ydGVkLCAtRU5PREVWIG1lYW5zIERNQSBub3QgZW5hYmxl
ZCBhdA0KPiA+ICsJICogdGhpcyBwbGF0Zm9ybSwgdGhhdCBpcyBub3QgYSByZWFsIGVycm9yLCBz
byBqdXN0IHJlbWluZCAib25seQ0KPiA+ICsJICogUElPIG1vZGUgaXMgdXNlZCIuIElmIERNQSBp
cyBlbmFibGVkLCBidXQgbWVldCBlcnJvciB3aGVuIHJlcXVlc3QNCj4gPiArCSAqIERNQSBjaGFu
bmVsLCBlcnJvciBzaG91bGQgYmUgc2hvd2VkIGluIHByb2JlIGVycm9yIGxvZy4gUElPIG1vZGUN
Cj4gPiArCSAqIHNob3VsZCBiZSBhdmFpbGFibGUgcmVnYXJkbGVzcyBvZiBETUEuDQo+ID4gKwkg
Ki8NCj4gPiArCXJldCA9IGkyY19pbXhfZG1hX3JlcXVlc3QoaTJjX2lteCwgcGh5X2FkZHIpOw0K
PiA+ICsJaWYgKHJldCkgew0KPiA+ICsJCWlmIChyZXQgPT0gLUVQUk9CRV9ERUZFUikNCj4gPiAr
CQkJZ290byBjbGtfbm90aWZpZXJfdW5yZWdpc3RlcjsNCj4gPiArCQllbHNlIGlmIChyZXQgPT0g
LUVOT0RFVikNCj4gPiArCQkJZGV2X2luZm8oJnBkZXYtPmRldiwgIk9ubHkgdXNlIFBJTyBtb2Rl
XG4iKTsNCj4gDQo+IE9uIGEgc3lzdGVtIHdpdGhvdXQgRE1BIGNvbmZpZ3VyZWQsIHdpdGggdGhp
cyBwYXRjaCB3ZSBub3cgZ2V0IHRoaXMgaW5mbw0KPiBtZXNzYWdlIHRoYXQgd2Fzbid0IHRoZXJl
IGJlZm9yZS4gSSB0aGluayB0aGlzIG1pZ2h0IGFubm95IHNvbWUgcGVvcGxlLCBzbyB5b3UNCj4g
c2hvdWxkIHJlbW92ZSBpdC4NCj4gDQoNCjotKSBoaGgsIGdldCBpdC4NCg0KSG93IGFib3V0IGNo
YW5nZSB0byBkZXZfZGJnPw0KPiByZWdhcmRzLA0KPiBNYXJjDQo+IA0KPiA+ICsJCWVsc2UNCj4g
PiArCQkJZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCByZXQsICJGYWlsZWQgdG8gc2V0dXAgRE1B
LCBvbmx5IHVzZQ0KPiBQSU8gbW9kZVxuIik7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICAJLyogQWRk
IEkyQyBhZGFwdGVyICovDQo+ID4gIAlyZXQgPSBpMmNfYWRkX251bWJlcmVkX2FkYXB0ZXIoJmky
Y19pbXgtPmFkYXB0ZXIpOw0KPiA+ICAJaWYgKHJldCA8IDApDQo+ID4gQEAgLTE4MTcsOSArMTgz
NSw2IEBAIHN0YXRpYyBpbnQgaTJjX2lteF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlDQo+
ICpwZGV2KQ0KPiA+ICAJCWkyY19pbXgtPmFkYXB0ZXIubmFtZSk7DQo+ID4gIAlkZXZfaW5mbygm
aTJjX2lteC0+YWRhcHRlci5kZXYsICJJTVggSTJDIGFkYXB0ZXIgcmVnaXN0ZXJlZFxuIik7DQo+
ID4NCj4gPiAtCS8qIEluaXQgRE1BIGNvbmZpZyBpZiBzdXBwb3J0ZWQgKi8NCj4gPiAtCWkyY19p
bXhfZG1hX3JlcXVlc3QoaTJjX2lteCwgcGh5X2FkZHIpOw0KPiA+IC0NCj4gPiAgCXJldHVybiAw
OyAgIC8qIFJldHVybiBPSyAqLw0KPiA+DQo+ID4gIGNsa19ub3RpZmllcl91bnJlZ2lzdGVyOg0K
PiA+IC0tDQo+ID4gMi4zNC4xDQo+ID4NCj4gPg0KPiANCj4gLS0NCj4gUGVuZ3V0cm9uaXggZS5L
LiAgICAgICAgICAgICAgICAgfCBNYXJjIEtsZWluZS1CdWRkZSAgICAgICAgICB8DQo+IEVtYmVk
ZGVkIExpbnV4ICAgICAgICAgICAgICAgICAgIHwgaHR0cHM6Ly93d3cucGVuZ3V0cm9uaXguZGUg
fA0KPiBWZXJ0cmV0dW5nIE7DvHJuYmVyZyAgICAgICAgICAgICAgfCBQaG9uZTogKzQ5LTUxMjEt
MjA2OTE3LTEyOSB8DQo+IEFtdHNnZXJpY2h0IEhpbGRlc2hlaW0sIEhSQSAyNjg2IHwgRmF4OiAg
ICs0OS01MTIxLTIwNjkxNy05ICAgfA0K


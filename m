Return-Path: <linux-i2c+bounces-14187-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 99038C71EA8
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Nov 2025 04:03:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 75DC44E34B9
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Nov 2025 03:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C98702F999F;
	Thu, 20 Nov 2025 03:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AAS0j1bU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013005.outbound.protection.outlook.com [40.107.159.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5487C277026;
	Thu, 20 Nov 2025 03:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763607776; cv=fail; b=TFWsxmdTh+5i3VDkiJP9XPnF2FC181qH65iA2IB7DmL4MCqI58yYuHiQApXqzekdguSZ0ZZkuf/zKE6c31zQ4wQlS1y4ryrdXz6U3vVnbvX2ONUuC73Vc48eJUBPF3C4HZ3uypO/lkw2Y5ePCCyUU4K11J+jtsRAJHRRexGCgaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763607776; c=relaxed/simple;
	bh=VLcDLNR8+oDdfk18Ke08Wu0AF80WV2RonQrWFRpugRg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WN5mvHw5zToRxZW+KzwmOcDPkkhcMYtX6iIxfh+xIgKA1hIOYqMnFO3e1zK/v7T3O/7rGHB8ZO7gYwK7y478eAqLU2ddeQNUnXSOn60okSL8Er9KNeVjg2VIIVo15x4cdxEEd6uQoTIE+0TrLtLVH9o52Wf9kzj/ux1q1+kQFrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AAS0j1bU; arc=fail smtp.client-ip=40.107.159.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OlCJlkC0ZC6NYM7t69zzwMsAXM0pg9ladS/N5qs+Av4bOkmsnOvdHSzIdrlRdgZR52gWXoEfFSmq1plchUhIaFnAPj9pwTUFlGxAmURGy8ljZ7rZkQIhSNrbRFs3gS33RFR/NDpV905b6Xby0medImAVVFQ6hM2Dp1QssYa0hAKV5hmAZ3c/mHeXm1HLp+fDLpkQ00DcQy07P5dl45qQiR86BF8XAQFpLevq6Pw9dPDgfx2jwqJilkYN8iMJQR7oVswt8027kglitX1S5bBaf0PRlwWOJWeccKuR44wkboalT05m98ifEvvsdwMNmgSdspnf8ZfvAyBSrgiKNGGMNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VLcDLNR8+oDdfk18Ke08Wu0AF80WV2RonQrWFRpugRg=;
 b=e6VMnbT5vtNAw9zcb7+/ibF0GutF1P5K0vqB3kY/uWk9r3DqrUDUBLGrcFFrHUTj6X+du3rNB1lzP3HJTdMAkfpjmn50G9fDuVSITBpj97FVnDjXuu078lLaKMSt7xSsCnH5CnRnUKW/+lPpf+hNTJGzo/PolA1doUHfFlAt6I0L17+q84SKtauh30tnasYQp/+7e8TLmw7Pjo+wQM7FpDFhHSzEAAsD3T7ee7cb7SFqXCHEAtEggKBA3GE4fu+HDmOG0I+55Z3/7abkQ+zs3RDA4xwiEmpi4wEpWWh76SgWQt5jZchov6qztLSIUQZqQXpTftsawjQbbCvTVUQOmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLcDLNR8+oDdfk18Ke08Wu0AF80WV2RonQrWFRpugRg=;
 b=AAS0j1bUtAgeFcHXSQNIsjsqYnjBWUIEVh+rMhsnsOMPWvxyiCXtn3h7P/lo9M4Jx2X9cW7/Loq7hECw9owYFq7Zqh42gE5029ZWhaOgrXu03kEr48rxzRhnCAVlfM9O1OC/06oNPxu47M3mf35Z5h3lCHvVplpwXlxD/pDcRk/uvFXAWFtx/kb4HNW5NwJIMjLlSfY1yR30FtgKQD6R343lp8rqDyOr0drqySd06oJ1Q7N5RiZWEJDFd5s0pDRQ7XZuohtHNAX8LRwOEzwp48WFVtEVRGPETiTttqrlntSVWPL8UE8GeXIKz+qeAUWq5nyCArH1VpCVqFHjHXV7XA==
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by PA4PR04MB9318.eurprd04.prod.outlook.com
 (2603:10a6:102:2a5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 03:02:51 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 03:02:51 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: Aisheng Dong <aisheng.dong@nxp.com>, "andi.shyti@kernel.org"
	<andi.shyti@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] i2c: imx-lpi2c: change to PIO mode in system-wide
 suspend/resume progress
Thread-Topic: [PATCH] i2c: imx-lpi2c: change to PIO mode in system-wide
 suspend/resume progress
Thread-Index: AQHcWFujTDvepCQDEkyt7wSo+0A7HrT4l4iAgAC7qCCAANjVAIAAt3kQ
Date: Thu, 20 Nov 2025 03:02:51 +0000
Message-ID:
 <VI2PR04MB1114708FCF7C75A48CC7054FAE8D4A@VI2PR04MB11147.eurprd04.prod.outlook.com>
References: <20251118071837.1419558-1-carlos.song@nxp.com>
 <aRyXjUF+x5BdK+uS@lizhi-Precision-Tower-5810>
 <VI2PR04MB11147CEB59F804078F2136107E8D7A@VI2PR04MB11147.eurprd04.prod.outlook.com>
 <aR3q3KA0j2Qn+bCU@lizhi-Precision-Tower-5810>
In-Reply-To: <aR3q3KA0j2Qn+bCU@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI2PR04MB11147:EE_|PA4PR04MB9318:EE_
x-ms-office365-filtering-correlation-id: a32fec06-a2a0-458a-dae9-08de27e14af0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|376014|366016|38070700021|7053199007;
x-microsoft-antispam-message-info:
 =?utf-8?B?K2xXOEdmeW1QL0hjejhFUzhZMFMzMVlvUGtTSTdOaGtMNnBrMnBlMnFKR2p6?=
 =?utf-8?B?V2hDZ0NyKzhZVDRIdlZMKzk2YnNJQjY0YVg0NXdDQ05nS0E3WUJrTXJ6QTRK?=
 =?utf-8?B?NkpMYmVKcmRkS25PQXJuNlo4YlEzamNJWkpDQ3cwSDlYWC9kaHo2U3RNS21L?=
 =?utf-8?B?dmxEb2dWUzBjS1NiellZUDF0Yy9LR1FRbHpJMCtDaWdXRVZHaEFKQUFsOVhz?=
 =?utf-8?B?RUlhZ29PMG5yejRjUWJXOVpOcDlrMkw5R2tZL0ZYVUZhWDV0Z1dSK3oyTGZP?=
 =?utf-8?B?NXZoeDd2dlZFWmZVNEdYbTY5YXpxaUN2ZXdpbzkxdm92RWZ1OHIvTXQzRGZs?=
 =?utf-8?B?bFZvTms3bmxLUGs2WnpGazcvQ1l1QmVTbC9NN1crZ1Z1SVU4N2JSQ2FkMW5W?=
 =?utf-8?B?eG1keXpEOEI1Z2hrVWNLQVB6SC9kTUNnazFuTFVUWk0rYzRIWXMzbXBrMTlq?=
 =?utf-8?B?YjZ6eGZJdVBaLzRscVA0bWdiaWpubTZ3V0hRVSs5V2YvVS8yUHk2a3Bld3J1?=
 =?utf-8?B?SVJQR2huc0hYWjRXZFY0SCtqRjVzcnY4UTJDN2hzejVVYUlEMXoyTldxSjRW?=
 =?utf-8?B?ZVhQVExOWnZuQ251ZTRIZStSMmlSQ1dGdkN6MnFLcHY3TWhlTmlPSUQxRHU4?=
 =?utf-8?B?VVJwM0hQcEZmdEs4MGg0cER1ZjZUQjgyY2l4QXlzMjVwd1h3cjZJTmcyWnl6?=
 =?utf-8?B?VE9DNVFCSkF1K25zUVVUblNFVGU1bk9yblFVblFrWEkzSU9ZK3NKc3dqZDh6?=
 =?utf-8?B?Q3M3NnoreHlGMEthZnM1N2M1K2hZUnZxTm1rTHBuQTlydjMvWGdzUTdlNGc4?=
 =?utf-8?B?V0daT2E4a1UyRFBLcUViRytCVWduTCtiSjFjRE9Tdld6ZVpNRm1KY0lxRG5l?=
 =?utf-8?B?eVpYVWF0SW5qZzRHNnZRK1NZMVFSdEFieXhUVjdCYSt5ZkxRQmkrWDhJNUpz?=
 =?utf-8?B?enRpWE1jWVBPZ3N6ZzdRc0lzMTVaS2hmdnIyUTY0WWtEVUUzbHVvLzQ4ZGEz?=
 =?utf-8?B?SCtMZkV5OFJQVmh4d2locFh3REtuZW5XNk5lSmg4TXEvQ3ZtYzFFWTVQS24x?=
 =?utf-8?B?VE1GS1JXS1JjZ1p3QzliNFQ5alhGUmQreEFUNURITStBd3Qxb2M3b2V1cGdH?=
 =?utf-8?B?VUh6bGQwYnphRFppMktXLytuVHZ4VHZad1p3K21yS05xWThGNmNsVlZETXBO?=
 =?utf-8?B?bVFMeG9ib2VBSm0wVDdWcTNsNVlvRTFqalBJRUYxWFZoU0hjbWRpWkc1V050?=
 =?utf-8?B?eXZTTVlPQmZzNG9oMHFOc3pDUWd3ZEdhb0tnb2JISGlWdmtpSG5hNFNGZGUy?=
 =?utf-8?B?bkM1UGhVR1h4NDY3bXNBUmVaOUlNOGlqKzBqZE1YU25UOEoyb3NEU3IyNlpL?=
 =?utf-8?B?Vk5EMzNSd3BWWUpsQzRuakR3cEhDZVQ2VHRHTjFCNW9xNG9rZzJRR001eWp3?=
 =?utf-8?B?UnU3UU4vLzNuSy90OVRuNnpndXpSU1l3SjJGWGowRGdJcVRZbVhTYWcvS0dv?=
 =?utf-8?B?UXpBdkYwRjFhdFkrZURHamIrN09Yb2Q4c3hFdzNSakN6TUt1dTY0TkhXUVo0?=
 =?utf-8?B?SlhGVm8vRjFlbmd5ekFIbXNlM0k1aFlzZDVzdmFtbFVPSEUxSWJ3K0k5dVk0?=
 =?utf-8?B?NGYzTXpIM01IYW5Fc1ExQTJSNlh6VlFuMm96YmZSSkRubHRZMzJZSng3WE84?=
 =?utf-8?B?WmhyQTRRMDB6Y09yVDdSMkxKaU9GM3NTb0JrMk1OZ0Y0NHNxY3NNQnoxaCtL?=
 =?utf-8?B?K0pqTXRiSmVqbWZNZkl4U0c0Z2tyeWZ3YkJydkg5elZQMlRVOEFpSTRCdWo5?=
 =?utf-8?B?bG91a1l3RGVvYjBYZlZWU1BmbDM1a0d0STU4RFgwdmsveXNxeWcrSmhkVUJ3?=
 =?utf-8?B?bmp2YkIyMzk2TWRGTnpmMTJ5elUvTktCQXJWbEZIMGw3dGN0RUZDZGFFQ2d0?=
 =?utf-8?B?Mlc0QzNBOGNrYzhLWkxvSlA2VE9IOU5ZMHFPSEN0R204MlpycDVUNUhqVWdj?=
 =?utf-8?B?QmszK3dpKzlIUm0rYWFUT0VLc1ZiNlNjQndQekYzTEVMZGdhWnMwVGoxVFkx?=
 =?utf-8?Q?+SGKU3?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(366016)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dE1UbXdYeGl2NHRkTU1JdVdjK1lkOVBWVGxPRmd2MDFCZkVKT2RQTzdtM2U0?=
 =?utf-8?B?VkVjRmlxdU44OGlacDMvSjljNE1LQk8wc2k5L01vd2QyN1lVbTlGWDVoVVI5?=
 =?utf-8?B?K2R2aHNXci9Dei9TeW13emIxZEFlS0F6SWVKNTB4UkZoTFBXSkZHaWppV3RO?=
 =?utf-8?B?NzJwR29wU2RuQXVLc2RvZnAvZmMxSVphRDVNMUlUVUZpcllvdUV0M3NabGxT?=
 =?utf-8?B?Q0JOOHZlK1p6VjgzcXpmUGpHKzR3M1M2TUo3UzJqYzR3UmFuYmw0UHJSR3pL?=
 =?utf-8?B?a1N5OEo3LzhIdFh5YWdQb3NHM0M4UGNKblZmNUtCUGtGUUszSkRQQkRGMnd6?=
 =?utf-8?B?ejljMlJndGYycmRydS9YS1pRcXFiaWNoS2VGZFd0d2o2VGJCLzE5TUdIMHh2?=
 =?utf-8?B?UnBiVTF0cnpoVU1iZ1FjZzZabFlKUXJVdzBHU1ZOMTZTRmJHNjZLaTdyaGg3?=
 =?utf-8?B?WlNaM08wTEJYcEdRRzIxWHlBM0hNMENPMWxZaU5aTkZ4WGFoZ0w1WkRSNUor?=
 =?utf-8?B?VzFROVdmOXJWd3p0R201dVBKblp3V2srSmpLUUlwYXVnSHVKWk5HbHVJY29v?=
 =?utf-8?B?Y1RJNVJqcWREWGFpTFB4TUxkUS9reksvam1haGc3dUlZTmVaaGJKWithYXE5?=
 =?utf-8?B?dVFyR3VoMXhOb01tMjdxdVVBaEZMSmxtUHg5b2I5VGJOZ1hJZVJlZytSU1hw?=
 =?utf-8?B?TXdGNmZ1cEw2QVNCVGxzYWR5eU5BUWhvMTJjaTJlRW5MdnlGQWFUTVMxR2FY?=
 =?utf-8?B?SFh6aU4wVkNvS0ZwN2g3bmtNdEd2Z1RKTVFRd2Vwek8vQUllUXR5RjdVUzQz?=
 =?utf-8?B?bE9qbFJjZmI4Vlc0MmRPNzA4Ri9rbE1JYWRQdnFDVDJKQXVpWURUV3RNMFdh?=
 =?utf-8?B?bU5Vb01FdXNvSEFLYXQzbnI1Nkx6eTFQclpqeTkxVXEwbEpjZEVnclNjcXdm?=
 =?utf-8?B?RDNZWk9WbkpmNjRJMEpVZFFtUFZjaGtnY3lMdnZES0Z0a2RRaS8wbEVDeHE3?=
 =?utf-8?B?Zm9kVDlNUmt5Y0RTalgyMm5WckM5dTB5NXhsL1FqNnRIR1R3cWlxeW8xbi9r?=
 =?utf-8?B?VUpDSjVxK1hpdnNIQk1BcFRoc1MvQWRYSnNCTS8vRWtLWm5acyt4V2FFVTB3?=
 =?utf-8?B?RUZJcGRNZzZqbGVlR1F0cEJTamQvZGlwKzRNa2FPOGlvSkU0eFN5ZHh5amhB?=
 =?utf-8?B?Skx6aVVWS0VURUNtUHhycTg1RUx3ZHlzYVhZQ1kvMndpdy9JNW9EZ2NyYXlN?=
 =?utf-8?B?TjVxSVR4Z0t4Y004V1lpOFV5ZEZVeVpoOFRZbVVqSXNXa0dMS21uNFllTDcy?=
 =?utf-8?B?MGd4TVIrR1V2MCswaElrVEgyNUlwNGR2cG9GOHhmbWd1Q0xuUDlPZmV3Ykw2?=
 =?utf-8?B?UlY5M1FGMnhXMElOaVEvVXBiQTRIamI2bVRZM2h0U1g2bmFaSUJ3OHlUQVI0?=
 =?utf-8?B?a1k3UjdUTURNa204Sk9yUC9XYUhXWjRjWXZWaWhoeEtYNGkzWWFHWTh6dDJl?=
 =?utf-8?B?TitWNGlTS0pNNnJtKzdOWnVLc2NUWmxYNnovOHhUVjBWcTVqTmQwS2hRd2l6?=
 =?utf-8?B?cWVENzRLbyttdWxETFY0Z2JOQzhQY1c1ZEFEZWFYaWVreW82VGZrbEd1ZzhF?=
 =?utf-8?B?S2lqZ1ZzY2FNVVRUNzZhRVQ1MDBHTDV3T3VYN2RxWGdGZERyQnZpYUwyRm42?=
 =?utf-8?B?MWtENlFicVU2WTRYSmhDQWtmTDd3aDVmbm5NZHJNRzdyam5NUXc3MHpOTmVK?=
 =?utf-8?B?OTM3ZmpQZEJQRGpwZCs3VlI1U3dsbk1FVGJHT3BEd1dEUDNZTGpsSXFlM3Iz?=
 =?utf-8?B?ZTNoblNUbUFyNmc2dXdxRERHL3NFM09FbkxvNlNvZVVLbSs2bWlrS2RFQ1Q0?=
 =?utf-8?B?QytNdXRMeEI1SnVzQ0ljcVhUNGllVjVQMVVSZXdxMm52OUF3V0lzYTFLUjBZ?=
 =?utf-8?B?c1JxRU9Ta1BqTjc4OHYvTHJQTko0RGJ0cm9jSUZsMy9UelRYZHhMSGNkbFh6?=
 =?utf-8?B?L3o0YXJNZDlURkVubkp4TVpBeGFubUJvN2N1YUpoRmVLajJrZ09ydzZHMk8w?=
 =?utf-8?B?WkJuaUpIZFRDU09XcEpsNnZQTWwyNVZuditTbDB6R1o4YzB4NjJTZ29mUEls?=
 =?utf-8?Q?WN9xda3Qkfs1V0wLwNHjy8sB+?=
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
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a32fec06-a2a0-458a-dae9-08de27e14af0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2025 03:02:51.1299
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eSPNRhvAtgFZzKsV9UqsGIHcqgmFWBc0qc01np11I+gstOthRzpQqX/LioOUEJXDwHDxC68fnjnh+AIYHZm29g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9318

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRnJhbmsgTGkgPGZyYW5r
LmxpQG54cC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciAyMCwgMjAyNSAxMjowNiBB
TQ0KPiBUbzogQ2FybG9zIFNvbmcgPGNhcmxvcy5zb25nQG54cC5jb20+DQo+IENjOiBBaXNoZW5n
IERvbmcgPGFpc2hlbmcuZG9uZ0BueHAuY29tPjsgYW5kaS5zaHl0aUBrZXJuZWwub3JnOw0KPiBz
aGF3bmd1b0BrZXJuZWwub3JnOyBzLmhhdWVyQHBlbmd1dHJvbml4LmRlOyBrZXJuZWxAcGVuZ3V0
cm9uaXguZGU7DQo+IGZlc3RldmFtQGdtYWlsLmNvbTsgbGludXgtaTJjQHZnZXIua2VybmVsLm9y
ZzsgaW14QGxpc3RzLmxpbnV4LmRldjsNCj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRl
YWQub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0hdIGkyYzogaW14LWxwaTJjOiBjaGFuZ2UgdG8gUElPIG1vZGUgaW4gc3lzdGVtLXdpZGUNCj4g
c3VzcGVuZC9yZXN1bWUgcHJvZ3Jlc3MNCj4gDQo+IE9uIFdlZCwgTm92IDE5LCAyMDI1IGF0IDA2
OjAyOjQ1QU0gKzAwMDAsIENhcmxvcyBTb25nIHdyb3RlOg0KPiA+DQo+ID4NCj4gPiA+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBGcmFuayBMaSA8ZnJhbmsubGlAbnhw
LmNvbT4NCj4gPiA+IFNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDE4LCAyMDI1IDExOjU4IFBNDQo+
ID4gPiBUbzogQ2FybG9zIFNvbmcgPGNhcmxvcy5zb25nQG54cC5jb20+DQo+ID4gPiBDYzogQWlz
aGVuZyBEb25nIDxhaXNoZW5nLmRvbmdAbnhwLmNvbT47IGFuZGkuc2h5dGlAa2VybmVsLm9yZzsN
Cj4gPiA+IHNoYXduZ3VvQGtlcm5lbC5vcmc7IHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU7IGtlcm5l
bEBwZW5ndXRyb25peC5kZTsNCj4gPiA+IGZlc3RldmFtQGdtYWlsLmNvbTsgbGludXgtaTJjQHZn
ZXIua2VybmVsLm9yZzsgaW14QGxpc3RzLmxpbnV4LmRldjsNCj4gPiA+IGxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiA+
ID4gU3ViamVjdDogUmU6IFtQQVRDSF0gaTJjOiBpbXgtbHBpMmM6IGNoYW5nZSB0byBQSU8gbW9k
ZSBpbg0KPiA+ID4gc3lzdGVtLXdpZGUgc3VzcGVuZC9yZXN1bWUgcHJvZ3Jlc3MNCj4gPiA+DQo+
ID4gPiBPbiBUdWUsIE5vdiAxOCwgMjAyNSBhdCAwMzoxODozN1BNICswODAwLCBDYXJsb3MgU29u
ZyB3cm90ZToNCj4gPiA+ID4gSWYgYSBzeXN0ZW0td2lkZSBzdXNwZW5kIG9yIHJlc3VtZSB0cmFu
c2l0aW9uIGlzIGluIHByb2dyZXNzLg0KPiA+ID4gPiBMUEkyQyBzaG91bGQgdXNlIFBJTyB0byB0
cmFuc2ZlciBkYXRhIG5vdCBETUEgdG8gYXZvaWQgaXNzdWUNCj4gPiA+ID4gY2F1c2VkIGJ5IG5v
dCByZWFkeSBETUEgSFcgcmVzb3VyY2UuDQo+ID4gPg0KPiA+ID4gQ3VycmVudGx5IHRoZXJlIGlz
IG5vIGRldmljZSBsaW5rIGJldHdlZW4gdGhlIERNQSBlbmdpbmUgYW5kIGl0cyBETUENCj4gPiA+
IGNvbnN1bWVyLCB3aGljaCBhbGxvd3MgdGhlIERNQSBlbmdpbmUgdG8gc3VzcGVuZCBiZWZvcmUg
dGhlIGNvbnN1bWVyLg0KPiA+ID4NCj4gPiA+IFRvIGF2b2lkIHRoaXMsIHN3aXRjaCB0byBQSU8g
bW9kZSBpbnN0ZWFkIG9mIERNQSBkdXJpbmcNCj4gPiA+IHN1c3BlbmQvcmVzdW1lIHNvIHRoZSB0
cmFuc2ZlciBkb2VzIG5vdCByZWx5IG9uIHRoZSBETUEgZW5naW5l4oCZcyBzdGF0ZS4NCj4gPiA+
DQo+ID4gPiBOb3RlczogSSBzdXBwb3NlIERNQSBlbmdpbmUgc3VzcGVuZCBiZWZvcmUgTFBJMkMu
IERvIHlvdSBtZWV0IHRoaXMNCj4gPiA+IG9yIG90aGVyIHJlYXNvbiBjYXVzZSBETUEgSFcgcmVz
b3VyY2UgcmVhZHkuDQo+ID4gPg0KPiA+ID4gTm90IHN1cmUgaWYgYmVsb3cNCj4gPiA+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2RtYWVuZ2luZS8yMDI1MDkxMi12Ni0xNi10b3BpYy1kbWEtZGV2
bGluay12DQo+ID4gPiAxLTAtNGRlDQo+ID4gPiBiYzJmYmY5MDFAcGVuZ3V0cm9uaXguZGUvDQo+
ID4gPiBjYW4gZml4IHlvdXIgcHJvYmxlbS4NCj4gPiA+DQo+ID4gPiBBbnl3YXksIEkgdGhpbmsg
aXQgaXMgZmluZSB0byB1c2UgUElPIGF0IHN1c3BlbmQgdG8gcmVkdWNlDQo+ID4gPiBkZXBlbmRl
bmNlLiBCdXQgd2UgbmVlZCBrbm93IHdoeSBETUEgSFcgaXMgbm90IHJlYWR5Lg0KPiA+ID4NCj4g
PiA+IEZyYW5rDQo+ID4gPg0KPiA+IEhpLCBGcmFuaw0KPiA+DQo+ID4gRURNQSByZXN1bWUgaXMg
aW4gZWFybHkgc3RhZ2UgYW5kIHN1c3BlbmQgaXMgaW4gbGF0ZSBzdGFnZSwgYnV0IExQSTJDIHJl
c3VtZQ0KPiBhbmQgc3VzcGVuZCBhcmUgaW4gTk9JUlEgc3RhZ2UuDQo+ID4gU28gTFBJMkMgcmVz
b3VyY2UgYmVjb21lIHJlYWR5IGVhcmxpZXIgdGhhbiBFRE1BLiBXaGVuIElSUSBlbmFibGVkLA0K
PiA+IGltbWVkaWF0ZWx5IHNsYXZlIHdpbGwgdHJpZ2dlciBJMkMgdG8gcmVhZCBkYXRhIGFuZCB0
aGUgbGVuZ3RoIG1lZXRzDQo+ID4gdGhlIHJlcXVpcmVtZW50cyBmb3IgRE1BIHVzYWdlLCB0aGUg
RE1BIHdpbGwgYmUgbmVlZGVkIGF0IHRoaXMgdGltZS4gV2l0aGluDQo+IGEgdmVyeSBzbWFsbCB0
aW1lIHdpbmRvdywgRURNQSBpcyBzdGlsbCBub3QgcmVzdW1lZC4gVGhlIHJvb3QgY2F1c2UgaXMg
ZnJvbQ0KPiBoZXJlLg0KPiANCj4gUHV0IHRoZXNlIGluZm9ybWF0aW9uIHRvIGNvbW1pdCBtZXNz
YWdlLg0KPiANCj4gRnJhbmsNCj4gDQpXaWxsIGRvLiBUaGFuayB5b3UuDQoNCkNhcmxvcw0KPiA+
DQo+ID4gZGV2IGxpbmsgbWF5YmUgdXNlZnVsIGluIHRoZSBzYW1lIFBNIHN0YWdlLiBCdXQgaW4g
ZGlmZmVyZW50IHN0YWdlLCBJIGRvbuKAmXQNCj4ga25vdyBpZiBpdCBjYW4gaGVscCBzb21lLg0K
PiA+IE1heWJlIGl0IGlzIGJldHRlciB0aGF0IERNQSBtb3ZlIFBNIHN0YWdlIHRvIE5PSVJRLCBi
dXQgbm93IHRoZXJlIGlzDQo+ID4gbm8gZGV2IGxpbmsgZm9yIEVETUEsIHRoZSByZXN1bWUvc3Vz
cGVuZCBzZXF1ZW5jZSBiZXR3ZWVuIExQSTJDIGFuZA0KPiBFRE1BIGluIE5PSVJRIHN0aWxsIGNh
bm5vdCBiZSBjb21wbGV0ZWx5IGd1YXJhbnRlZWQuDQo+ID4NCj4gPiBJIHRvdGFsbHkgYWdyZWUg
eW91ciBwb2ludDogdXNlIFBJTyB0byByZWR1Y2UgZGVwZW5kZW5jZS4NCj4gPg0KPiA+IElmIHNv
bWVkYXkgRURNQSBzdXBwb3J0IGRldiBsaW5rIGFuZCBtb3ZlIFBNIGNhbGxiYWNrIHRvIE5PSVJR
IHN0YWdlIGJvdGgsDQo+IHRoaXMgcGF0Y2ggY2FuIGJlIHJldmVydGVkIEkgdGhpbmsuDQo+ID4N
Cj4gPiBDYXJsb3MNCj4gPiA+ID4NCj4gPiA+ID4gRml4ZXM6IGEwOWM4YjNmOTA0NyAoImkyYzog
aW14LWxwaTJjOiBhZGQgZURNQSBtb2RlIHN1cHBvcnQgZm9yDQo+ID4gPiA+IExQSTJDIikNCj4g
PiA+ID4gU2lnbmVkLW9mZi1ieTogQ2FybG9zIFNvbmcgPGNhcmxvcy5zb25nQG54cC5jb20+DQo+
ID4gPiA+IC0tLQ0KPiA+ID4gPiAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbXgtbHBpMmMuYyB8
IDcgKysrKysrKw0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQ0KPiA+
ID4gPg0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbXgtbHBp
MmMuYw0KPiA+ID4gPiBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LWxwaTJjLmMNCj4gPiA+
ID4gaW5kZXggMmEwOTYyYTBiNDQxLi41MDUwZTE0YTk5MTkgMTAwNjQ0DQo+ID4gPiA+IC0tLSBh
L2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LWxwaTJjLmMNCj4gPiA+ID4gKysrIGIvZHJpdmVy
cy9pMmMvYnVzc2VzL2kyYy1pbXgtbHBpMmMuYw0KPiA+ID4gPiBAQCAtNTkyLDYgKzU5MiwxMyBA
QCBzdGF0aWMgYm9vbCBpc191c2VfZG1hKHN0cnVjdA0KPiA+ID4gPiBscGkyY19pbXhfc3RydWN0
DQo+ID4gPiAqbHBpMmNfaW14LCBzdHJ1Y3QgaTJjX21zZyAqbXNnKQ0KPiA+ID4gPiAgCWlmICgh
bHBpMmNfaW14LT5jYW5fdXNlX2RtYSkNCj4gPiA+ID4gIAkJcmV0dXJuIGZhbHNlOw0KPiA+ID4g
Pg0KPiA+ID4gPiArCS8qDQo+ID4gPiA+ICsJICogV2hlbiBzeXN0ZW0gaXMgaW4gc3VzcGVuZCBw
cm9jZXNzLiBMUEkyQyBzaG91bGQgdXNlIFBJTyB0bw0KPiA+ID4gPiArdHJhbnNmZXINCj4gPiA+
IGRhdGEgdG8NCj4gPiA+ID4gKwkgKiBhdm9pZCBpc3N1ZSBjYXVzZWQgYnkgbm90IHJlYWR5IERN
QSBIVyByZXNvdXJjZS4NCj4gPiA+ID4gKwkgKi8NCj4gPiA+ID4gKwlpZiAocG1fc3VzcGVuZF9p
bl9wcm9ncmVzcygpKQ0KPiA+ID4gPiArCQlyZXR1cm4gZmFsc2U7DQo+ID4gPiA+ICsNCj4gPiA+
ID4gIAkvKg0KPiA+ID4gPiAgCSAqIFdoZW4gdGhlIGxlbmd0aCBvZiBkYXRhIGlzIGxlc3MgdGhh
biBJMkNfRE1BX1RIUkVTSE9MRCwNCj4gPiA+ID4gIAkgKiBjcHUgbW9kZSBpcyB1c2VkIGRpcmVj
dGx5IHRvIGF2b2lkIGxvdyBwZXJmb3JtYW5jZS4NCj4gPiA+ID4gLS0NCj4gPiA+ID4gMi4zNC4x
DQo+ID4gPiA+DQo=


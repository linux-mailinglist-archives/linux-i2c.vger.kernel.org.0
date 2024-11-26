Return-Path: <linux-i2c+bounces-8225-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBDF9D9548
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Nov 2024 11:15:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81306284C8C
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Nov 2024 10:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 049651C4A2D;
	Tue, 26 Nov 2024 10:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EGAD9j8i"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2042.outbound.protection.outlook.com [40.107.104.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F9F1BDAAF;
	Tue, 26 Nov 2024 10:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732616135; cv=fail; b=QGS/vrn9qPAnwkM/5L6B2fNFmLbMmwhWTqrndc3/AH4ylGZdOrpjv/NYVhxb32iWBRTG9ThPo0zp7H6q5+JfAXadHA9C0Tk5dixHVtVAfi+CZh0rIcz1pYcyKrhLiMWX4f2j+3dYhvpQa7An8LdNctkl+dCbysmkSuXqFF6/L7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732616135; c=relaxed/simple;
	bh=/waZfrSGd40kNFLfu3MxRCF8tzyInm9ZNTKPpr0qvwU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=U5jFg5pkN7JH6mVfRUE2yEK+egRCB41hGlRinL7Xs7JTzFTbR70SsUuOzIZXEKQovOg1JshTI/P/VwqMrlSuR3ed4yu9NUhP8HV6S92flLGdfyLpFGAIfiFJNZGERMCH5NaT9PHpdEUzRL3M/ogMmap8ObN9PijmzSF5xDQbCzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EGAD9j8i; arc=fail smtp.client-ip=40.107.104.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vg8JuX3X1X+7WA3aEGN8SQ405BHa4Qo6BWi7uh0pPaxlrpxZII6zrKBh8iTT75SmdYVx9fbbllAEcyIFOJLg7MRIyEuJCYfmwwFfnSeWn5PHxeq5MIi7d3FG5MRMX6cyC+X1ozkd88fA2B+Rtlgs71x8WTlKA/4FdG7Saq/IDmqenLJNx97DSTfWyHgSI4rZlfh2UO74kjII6a6hZE/8DO8JV5Af6QoOOH6RptfzQSapk02J65nRHSogVG508HFqcyPWmAVpdPE8nFl1NVz5O6qhj9qz+reVthRxd84qr02q/XmghmI4kl3fqAbL5HAeFTH7AttVFHj5F1u0wzzvSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/waZfrSGd40kNFLfu3MxRCF8tzyInm9ZNTKPpr0qvwU=;
 b=fI8FMMlR6FRO4P2ixlMHe8YXoMW6l+SsUf+mCZM9H3e9XWK+vwBb4wiz8fBN4OW31j6lXVybSQHRtvtlL7zRIAjh1YiTwNQ2mFFVL6Dry8Mc47XFcr/blaVmJYdXsPcYerERcEVrOnnwC9C1/oaRLm6SZxeLsaEnSGMbH1acT5Xnpt9jcj+T0Q7ENV25Zr+pX6ea+G+/USNjeXJ0r8unuksGsHig788L4LmnZ2jEAz+OT0f81EuFCOnMd2iP3FRsHIdbHwvhUS65mB/93EFU01rS/d/VE8IC42uUQ71sLVQ7s3nNSOwix+Z0LFBtDfzqeTBs/1SyJzEjCxHkp8hlmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/waZfrSGd40kNFLfu3MxRCF8tzyInm9ZNTKPpr0qvwU=;
 b=EGAD9j8i6Su7AnwliujguMODJzBekKfdFUeaB+lRexXylVU4FlLP3Mek2QqgeBqer54KiCC7GjKv7Y8wfAxFeiRk3nJQi33HDT0uHa63puJsY5MJh9CN4WZyQxvQcF3phqrKA/ITS+Tp8g/x/VjWLwJ13gGulXe03Iejvf9On+xIpftdJCM9JUGXIDnhmRu49GDdVMXxHf5U5eYoZXXX9H2CbuMNWn5hpJSsXmDwNRJ3OACJc6gJd9XRtCngqfgET64EDzk6MBMcMum+XZqz/zD2ANLS4Wy/FGURnfeyyk+LeAqnOn/ZC09swCNNVauTIvCOKD3AfNhA0XE6LLKtEg==
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by AM9PR04MB8521.eurprd04.prod.outlook.com (2603:10a6:20b:430::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 10:15:27 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%4]) with mapi id 15.20.8048.020; Tue, 26 Nov 2024
 10:15:27 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
CC: Frank Li <frank.li@nxp.com>, "o.rempel@pengutronix.de"
	<o.rempel@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: imx: support DMA defer probing
Thread-Topic: [PATCH v2] i2c: imx: support DMA defer probing
Thread-Index: AQHbP+wdYtN28KbIA0OYSre4NbQtHA==
Date: Tue, 26 Nov 2024 10:15:27 +0000
Message-ID:
 <AM0PR0402MB39372380307BC4252BD131ACE82F2@AM0PR0402MB3937.eurprd04.prod.outlook.com>
References: <20241126082535.1878554-1-carlos.song@nxp.com>
 <20241126-economic-energetic-junglefowl-5197a9-mkl@pengutronix.de>
In-Reply-To:
 <20241126-economic-energetic-junglefowl-5197a9-mkl@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR0402MB3937:EE_|AM9PR04MB8521:EE_
x-ms-office365-filtering-correlation-id: e5c7c6f4-1be1-4ea2-d559-08dd0e033fbd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NWtKMnNKQjJpODduaVRsM3Q5WThUb2VuSlNEMFJ5ZE5YOENmbnczNW1uUjBs?=
 =?utf-8?B?L3RKYXF6QWhkT01mNEVHZ3NPNkI0Zjd4ZUhKQTZlSFEyaXdWMmVsS3ROeCsv?=
 =?utf-8?B?UExSeVIyazdJeHVzSS9IR0t5dUFKT2o4VCtFUFdzc1JaWG9Kd0lnMTFQV1l4?=
 =?utf-8?B?T0dLZHhOKzVyQmFuOTVJNHYxakltcnorK3Njc21Eei8rUmloYWhpaUZoTVBN?=
 =?utf-8?B?VTYydzFGMGZ5K0dmZTJ0SnRqZktTOEpTNCtsQTd4dHBSRis3cWdPRjllMXhX?=
 =?utf-8?B?VGJTY1FKV2hZNDYxTGYyNHdKSlRUaVZlZm4wWXozQ2VjZlZLdEFQc0NCOVdB?=
 =?utf-8?B?c2lEdmtmNHZMOUNRNzZLSExTMkg1NUxaRmpyZWlYYWVTSUtjeVJZOEt4UmZQ?=
 =?utf-8?B?YzdnYlZxb0VNK1VBNFA0VHhocUxBNVd5UWRYMW9rTlAvdjFRbXhZVlgveG5L?=
 =?utf-8?B?S2dJRUQ3R2NWajFXZFJzQm9XWjFZOU93VjFmcUlDN2w4V1JDL3YramtwaDFp?=
 =?utf-8?B?MmQxRXg1RXc3cmcvYm0vWWpQRUVZYW1iMFhnNjN1ajllNTBGVlNqMFNnbVdq?=
 =?utf-8?B?TUJ3OUsva0RIaHVYNEplQm91RU9iU0tJenFhbEEvZ0tNMmh1YmV4ZkxlMFk5?=
 =?utf-8?B?OXoycG0zWFNjUlVHZ2p1RFgyUFpOdXpUcHRybFh0MUNSMVpIamN4eGJVemx3?=
 =?utf-8?B?b1ZNMmZscDNOdXlaWlpzL3lNZlk3SWhXM0I2SDUzMDJOdjBYU3RjQXRmcTFi?=
 =?utf-8?B?NVZQSUlSTkp6MEJ5dy9sWGlWSkdGaVBmVzEvSWNoL0x0aDNJVTlvS3JrNVdP?=
 =?utf-8?B?Q3ppRFFDeGRhQjdHOVZRckcyTGdjdzZmWUZLTjk4VFV1QnA2eldpdXV4U1JH?=
 =?utf-8?B?SndlMUNVOHZaNzR6Vzh2SXYvSE9tdVNzWTIwOWdiSTVLR2N4WFZwVkFycm1s?=
 =?utf-8?B?QzVUc284akNRQWZhcVMrYVRLWEp4bjVSME5pamtwWXFSK0kxK2w5TUUycStW?=
 =?utf-8?B?MmppcHVkK1NqcmJ6R2swWkVsdmxRT1ZjUlhHRTlzVkI0OVZKOEtjY0tvMnhY?=
 =?utf-8?B?aWZPaWNsQ3NNcmUrL1lsTDBiWnFDbmJGNzRqdGxPd29lRkFaU1lSQXpBUlQ2?=
 =?utf-8?B?UytkWXVyamMralpLRUpkNGNHVzk0UUFxRjVmYndPUjFTdzAyb3VFbEQrRzVC?=
 =?utf-8?B?d1p3elBTNjZGSWdJMjZKSTZtOVZxYTRxLzJpUG1wL01ET01Ycmc1VGZTMEcr?=
 =?utf-8?B?OElIODFJd1BhYmlDc08yRGt2bE1kbXpBVDV1UXM1QlR5UWV4N0FzNUJ2OHpL?=
 =?utf-8?B?ZW9YM0M3R0RaYXpzSURZWVR0WWxsaHNPa1FqTXdlc2hZMW9JQS83L1pkYmoz?=
 =?utf-8?B?RGw0VEZjRHh1MTdRQmdDd3EwN3kwK3Z5aGFmcnRzaFJwQlF0YS9mMnBIUDNt?=
 =?utf-8?B?cEVNRUQvV0xhSWQxYzlLYU04TW9FcHJhMnl3TnhVZ21qeUNodjJKbDJmVHo4?=
 =?utf-8?B?OGk0bWlrOGFhVzB4cG1CVkVRVEFYSWl6Sk9HZ2dXeHN3ckVrSGRmdDdzR2Nj?=
 =?utf-8?B?ZjZKajNEZVB1MVhvc2ZjeW1BWEtEZXIvM2h2SEdJQWx4MnhGK0MyWHA0aENP?=
 =?utf-8?B?cFE5OVVDa3pYbmFCUkVod3F2UWo3bkNpUUpGMk5UNEtSYTFpS3dSUHFSN1VP?=
 =?utf-8?B?SFNiOWdIVC9GR1BUQXA5R21jdDkwL1RhSWtFank1eVY2bW9Qdy9MK2tVTm9j?=
 =?utf-8?B?RnlLbE5xWlRYeFBITHUyQ3RRQkNJYlVTa204K3JEVzVEWXJWUWRYWG9hWUFq?=
 =?utf-8?B?M2VQS1BocTROUmk3MWN6Zz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c2xqVmVqWDFYTWh2OUNhNlVwTE80dWpFRk1MM3JMQzJtY2piTHpsOFBJRk9h?=
 =?utf-8?B?dWZvbzVhMjlBMGxGL0hVbmNTMFFyaTRqZnNNNTF6Kys5eC92T3ZmRUc3UVht?=
 =?utf-8?B?K0ZaNVp2UmRROTlZTFJ1U1ZBQWVVS0VZK0YyNmM1VUYvbk1YOVEwVG9jdVlG?=
 =?utf-8?B?cytaVjE3eXpPclFXRGJQVGhiVTBVaHh0OGx0RDR1bTBTNUpqVkFqUCtZSVIx?=
 =?utf-8?B?Rnpra1VlVkl2SCs3aURyZnNJcHJlZktuTXdpSS93ZG9jWkVWR0tqdWRxRi83?=
 =?utf-8?B?ZGk0RHlReUQxUHVRWTFFTHQ3clZmRzQ5NDMzSHQ2VmlLVEVPZ2dxZ0tQQmls?=
 =?utf-8?B?Nzlqb3FwMlpjTUtEcGJKTkJsRUdsUmF0VGovUkwwcHRBdG1LMWpsSzZFUU5X?=
 =?utf-8?B?WGZlNlBvRjVVM1V0Q3M5elZXK2RDUDR5dTRlQ2ozQ0xneEFlS203SmxVUWlI?=
 =?utf-8?B?ZEhLMWc2Z284NFJZWVI3eXhjOGxYSUs0Z2ZtMjU4YTBxaURnQUFGY0JiSUlh?=
 =?utf-8?B?OHMvZmQyK1RCVmsrdVIzeHp3cy9HeFI0WlUxeFZ1MnNTNk0ybmRHeGg1UXRn?=
 =?utf-8?B?MzM0empWY2pMUkFzSDVtbnRuenJoYldTdU15djZqdjE3YXMxZGEzdDdlOExp?=
 =?utf-8?B?eWVrNG01a2NlV3dOTFZQY2l6ZkROTndlZmxERjNROCtZMmQ3dm56VlNCbDh0?=
 =?utf-8?B?U0Z6UzZsV1oyQlh4ekp1WGNDTUhFMmhoeC9kTlhGRXYwNlNZTkRVcENCREVT?=
 =?utf-8?B?U0FlcTkvRXlPRmF4ZmdLZnJpZVlZSXVSU3NSVVBWdTVnbFUxcXlza0svYm81?=
 =?utf-8?B?T1ptWDd3ZU84YWhTRzRaWkNsTFVyOEsxT20wVi91VVRmK3R3T0kzZjRhZitt?=
 =?utf-8?B?S2V0MzdkRUhaaFhtYVFocFREMWpSQXR3d1Rsc05aL1Y3VTlhN25xMHZiZHdS?=
 =?utf-8?B?MG9sd3RUVG1LRTB4bERqRjZGWVgyUlZBYVdjZUhINW5sbHNmKzhCc1BZcERy?=
 =?utf-8?B?UHVjMmVKZEduVTNGZkZ5MGE0QWVvY08wRTZacGJzT0xlYW1PZ3lESUZXa1dF?=
 =?utf-8?B?K2tvOEpuRjE2Skt2bUlKTlBYSU43UHpNdUZOcmhsWjh5OC9mZEdQdWRVTzFY?=
 =?utf-8?B?cVNMZUpUUlB5K2wybW9qWWVoMklPa1lNYWNXSm13YlUvc001SnRwbEJYRDNF?=
 =?utf-8?B?RnRkNEtFL0NTZGhTd1ltYVVPN0pWWGZhdG02Um5Ud0pwd2RqMU1aaFBTc1NE?=
 =?utf-8?B?cXVOV29yM2dING1uUTNzVHo0Q3dBbXRpZ1RvWG9nSFovTUMwZkY3VVduVWhs?=
 =?utf-8?B?UkI5Mldmd1k3UzR4RDI3SHdEbW5VcXRVODA3QnF0clJJdERRaGU3YXk2dXQv?=
 =?utf-8?B?T0YvRVk2Ulp0Qy9RWlo4ODFkcXVsd1NPcGtpdXRuSGJGb2hsaXZ4ck8vOTk5?=
 =?utf-8?B?MGR0dGxDZEhvbWwralcvc3VlS2RkTlpkM0lTYzlnNm9FTXNRajZoRll0Zms5?=
 =?utf-8?B?TTg4WUt4SHFWWEg0SlQzQzYyS2xBNFRQdUVSQjZLT0UzQ2RHbGVhQWRNbzlm?=
 =?utf-8?B?cHY2bzI2enY1QUZZNWR4UFRSWCthVnhjdkdHYm9pSVVyVDNUWUZxWWtuN1hW?=
 =?utf-8?B?OElaTDRoeUI3enVlZlZwL1JNSmJSMmh3TUM0NW5CU2RUaWptb2s2WmF6NWkv?=
 =?utf-8?B?c1ZhSmp6eXA0Q0JvNjJwMlpURzhjR3VGSWlld0M5MjVVWU92U1hpQWVJdWJq?=
 =?utf-8?B?K3FlSVlid1pkaytEV0JkUHZjV0sxRURIZ05EVVFmQzIwOFp0RHhUQ21vS0x2?=
 =?utf-8?B?cXlvR3cyQmRmYnBKOVFWbjEySmtvUUdVR01WNFVYN3k4NnBDbnRGcDdVZG9p?=
 =?utf-8?B?cnNZYm0rR0tzWG12SVpSaEtqUTRqNEtZVXFRbDRIMlhZT09yS2Z0djVzOFZo?=
 =?utf-8?B?amJCVlBrWDI1YU5wOWRMNWlURTYrVFJhWkhTYnlNbTVRMFBwVnhYbXc2eWFQ?=
 =?utf-8?B?VVJzMmgzSTZWanUwcUY3L21BY0JPVkFCb050d3BYOCsvOEJkSXhKZU5IbERY?=
 =?utf-8?B?ekh5TDZvM2JKY3NGMkdDYnpQa25TK1NWL3RTREQ5UlowSjR1UFZzTWJaRUNB?=
 =?utf-8?Q?GMgzjT+oako4NuFZJI6U1tf9s?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e5c7c6f4-1be1-4ea2-d559-08dd0e033fbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2024 10:15:27.2980
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FgJ/CGB6lqH4TFhDn+37bhasVYPn+LFg9CHvZ99wf+2OaT4dYUeqWv/bAu5vl6WgpsCKS8zceVgAx38fEThN4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8521

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFyYyBLbGVpbmUtQnVk
ZGUgPG1rbEBwZW5ndXRyb25peC5kZT4NCj4gU2VudDogVHVlc2RheSwgTm92ZW1iZXIgMjYsIDIw
MjQgNDo1NiBQTQ0KPiBUbzogQ2FybG9zIFNvbmcgPGNhcmxvcy5zb25nQG54cC5jb20+DQo+IENj
OiBGcmFuayBMaSA8ZnJhbmsubGlAbnhwLmNvbT47IG8ucmVtcGVsQHBlbmd1dHJvbml4LmRlOw0K
PiBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7IGFuZGkuc2h5dGlAa2VybmVsLm9yZzsgc2hhd25ndW9A
a2VybmVsLm9yZzsNCj4gcy5oYXVlckBwZW5ndXRyb25peC5kZTsgZmVzdGV2YW1AZ21haWwuY29t
OyBpbXhAbGlzdHMubGludXguZGV2Ow0KPiBsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnOyBsaW51
eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmcNCj4gU3ViamVjdDogW0VYVF0gUmU6IFtQQVRDSCB2Ml0gaTJjOiBpbXg6IHN1cHBv
cnQgRE1BIGRlZmVyIHByb2JpbmcNCj4gDQo+IE9uIDI2LjExLjIwMjQgMTY6MjU6MzUsIGNhcmxv
cy5zb25nQG54cC5jb20gd3JvdGU6DQo+ID4gRnJvbTogQ2FybG9zIFNvbmcgPGNhcmxvcy5zb25n
QG54cC5jb20+DQo+ID4NCj4gPiBSZXR1cm4gLUVQUk9CRV9ERUZFUiB3aGVuIGRtYV9yZXF1ZXN0
X3NsYXZlX2NoYW5uZWwoKSBiZWNhdXNlIERNQQ0KPiA+IGRyaXZlciBoYXZlIG5vdCByZWFkeSB5
ZXQuDQo+ID4NCj4gPiBNb3ZlIGkyY19pbXhfZG1hX3JlcXVlc3QoKSBiZWZvcmUgcmVnaXN0ZXJp
bmcgSTJDIGFkYXB0ZXIgdG8gYXZvaWQNCj4gPiBpbmZpbml0ZSBsb29wIG9mIC5wcm9iZSgpIGNh
bGxzIHRvIHRoZSBzYW1lIGRyaXZlciwgc2VlICJlOGMyMjBmYWM0MTUNCj4gPiBSZXZlcnQgImky
YzogaW14OiBpbXByb3ZlIHRoZSBlcnJvciBoYW5kbGluZyBpbiBpMmNfaW14X2RtYV9yZXF1ZXN0
KCkiIg0KPiA+IGFuZCAiRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL2RyaXZlci1tb2RlbC9kcml2
ZXIucnN0Ii4NCj4gPg0KPiA+IFVzZSBDUFUgbW9kZSB0byBhdm9pZCBzdHVjayByZWdpc3Rlcmlu
ZyBpMmMgYWRhcHRlciB3aGVuIERNQSByZXNvdXJjZXMNCj4gPiBhcmUgdW5hdmFpbGFibGUuDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBDYXJsb3MgU29uZyA8Y2FybG9zLnNvbmdAbnhwLmNvbT4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDbGFyayBXYW5nIDx4aWFvbmluZy53YW5nQG54cC5jb20+DQo+
ID4gLS0tDQo+ID4gQ2hhbmdlIGZvciBWMjoNCj4gPiAtIEFjY29yZGluZyB0byBGcmFuaydzIGNv
bW1lbnRzLCB3cmFwIGF0IDc1IGNoYXIgYW5kIFNpbXBsaWZ5IGZpeCBjb2RlDQo+ID4gICBhdCBp
MmNfaW14X2RtYV9yZXF1ZXN0KCkuDQo+ID4gLSBVc2Ugc3RyaWN0IHBhdGNoIGNoZWNrLCBmaXgg
YWxpZ25tZW50IHdhcm5pbmcgYXQNCj4gPiBpMmNfaW14X2RtYV9yZXF1ZXN0KCkNCj4gPiAtLS0N
Cj4gPiAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbXguYyB8IDIxICsrKysrKysrKysrKystLS0t
LS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMo
LSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWlteC5jDQo+
ID4gYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWlteC5jIGluZGV4IDVlZDRjYjYxZTI2Mi4uNGU1
NjMzMTY2YTFlIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LmMN
Cj4gPiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWlteC5jDQo+ID4gQEAgLTM5NywxNyAr
Mzk3LDE2IEBAIHN0YXRpYyB2b2lkIGkyY19pbXhfcmVzZXRfcmVncyhzdHJ1Y3QNCj4gPiBpbXhf
aTJjX3N0cnVjdCAqaTJjX2lteCkgIH0NCj4gPg0KPiA+ICAvKiBGdW5jdGlvbnMgZm9yIERNQSBz
dXBwb3J0ICovDQo+ID4gLXN0YXRpYyB2b2lkIGkyY19pbXhfZG1hX3JlcXVlc3Qoc3RydWN0IGlt
eF9pMmNfc3RydWN0ICppMmNfaW14LA0KPiA+IC0JCQkJCQlkbWFfYWRkcl90IHBoeV9hZGRyKQ0K
PiA+ICtzdGF0aWMgaW50IGkyY19pbXhfZG1hX3JlcXVlc3Qoc3RydWN0IGlteF9pMmNfc3RydWN0
ICppMmNfaW14LA0KPiA+ICtkbWFfYWRkcl90IHBoeV9hZGRyKQ0KPiA+ICB7DQo+ID4gIAlzdHJ1
Y3QgaW14X2kyY19kbWEgKmRtYTsNCj4gPiAgCXN0cnVjdCBkbWFfc2xhdmVfY29uZmlnIGRtYV9z
Y29uZmlnOw0KPiA+IC0Jc3RydWN0IGRldmljZSAqZGV2ID0gJmkyY19pbXgtPmFkYXB0ZXIuZGV2
Ow0KPiA+ICsJc3RydWN0IGRldmljZSAqZGV2ID0gaTJjX2lteC0+YWRhcHRlci5kZXYucGFyZW50
Ow0KPiA+ICAJaW50IHJldDsNCj4gPg0KPiA+ICAJZG1hID0gZGV2bV9remFsbG9jKGRldiwgc2l6
ZW9mKCpkbWEpLCBHRlBfS0VSTkVMKTsNCj4gPiAgCWlmICghZG1hKQ0KPiA+IC0JCXJldHVybjsN
Cj4gPiArCQlyZXR1cm4gLUVOT01FTTsNCj4gPg0KPiA+ICAJZG1hLT5jaGFuX3R4ID0gZG1hX3Jl
cXVlc3RfY2hhbihkZXYsICJ0eCIpOw0KPiA+ICAJaWYgKElTX0VSUihkbWEtPmNoYW5fdHgpKSB7
DQo+ID4gQEAgLTQ1Miw3ICs0NTEsNyBAQCBzdGF0aWMgdm9pZCBpMmNfaW14X2RtYV9yZXF1ZXN0
KHN0cnVjdA0KPiBpbXhfaTJjX3N0cnVjdCAqaTJjX2lteCwNCj4gPiAgCWRldl9pbmZvKGRldiwg
InVzaW5nICVzICh0eCkgYW5kICVzIChyeCkgZm9yIERNQSB0cmFuc2ZlcnNcbiIsDQo+ID4gIAkJ
ZG1hX2NoYW5fbmFtZShkbWEtPmNoYW5fdHgpLCBkbWFfY2hhbl9uYW1lKGRtYS0+Y2hhbl9yeCkp
Ow0KPiA+DQo+ID4gLQlyZXR1cm47DQo+ID4gKwlyZXR1cm4gMDsNCj4gPg0KPiA+ICBmYWlsX3J4
Og0KPiA+ICAJZG1hX3JlbGVhc2VfY2hhbm5lbChkbWEtPmNoYW5fcngpOw0KPiA+IEBAIC00NjAs
NiArNDU5LDggQEAgc3RhdGljIHZvaWQgaTJjX2lteF9kbWFfcmVxdWVzdChzdHJ1Y3QNCj4gaW14
X2kyY19zdHJ1Y3QgKmkyY19pbXgsDQo+ID4gIAlkbWFfcmVsZWFzZV9jaGFubmVsKGRtYS0+Y2hh
bl90eCk7DQo+ID4gIGZhaWxfYWw6DQo+ID4gIAlkZXZtX2tmcmVlKGRldiwgZG1hKTsNCj4gPiAr
DQo+ID4gKwlyZXR1cm4gcmV0Ow0KPiA+ICB9DQo+ID4NCj4gPiAgc3RhdGljIHZvaWQgaTJjX2lt
eF9kbWFfY2FsbGJhY2sodm9pZCAqYXJnKSBAQCAtMTgwMyw2ICsxODA0LDEzIEBADQo+ID4gc3Rh
dGljIGludCBpMmNfaW14X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4g
IAlpZiAocmV0ID09IC1FUFJPQkVfREVGRVIpDQo+ID4gIAkJZ290byBjbGtfbm90aWZpZXJfdW5y
ZWdpc3RlcjsNCj4gPg0KPiA+ICsJLyogSW5pdCBETUEgY29uZmlnIGlmIHN1cHBvcnRlZCAqLw0K
PiA+ICsJcmV0ID0gaTJjX2lteF9kbWFfcmVxdWVzdChpMmNfaW14LCBwaHlfYWRkcik7DQo+ID4g
KwlpZiAocmV0ID09IC1FUFJPQkVfREVGRVIpIHsNCj4gPiArCQlkZXZfZXJyKCZwZGV2LT5kZXYs
ICJETUEgbm90IHJlYWR5LCBnbyBkZWZlciBwcm9iZSFcbiIpOw0KPiA+ICsJCWdvdG8gY2xrX25v
dGlmaWVyX3VucmVnaXN0ZXI7DQo+ID4gKwl9DQo+IA0KPiBEb24ndCBzcGFtIHRoZSBsb2dzIGlm
IHRoZSBkcml2ZXIgZGVmZXJzIHByb2JpbmcsIGl0J3Mgbm90IGEgZXJyb3IuIEFuZCBpdCBsb29r
cw0KPiBzdHJhbmdlIHRvIGlnbm9yZSBhbGwgb3RoZXIgZXJyb3JzIGhlcmUuIEVpdGhlciBhZGQg
YSBjb21tZW50IGhlcmUsIHNvbWV0aGluZw0KPiBsaWtlICJjb250aW51ZSB3aXRob3V0IERNQSIs
IG9yIGxldCB0aGUgZnVuY3Rpb24gcmV0dXJuDQo+IDAgaW4gY2FzZSB0aGUgZHJpdmVyIHNob3Vs
ZCBjb250aW51ZSBhbmQgcHJvcGFnYXRlIHRoZSBlcnJvciBpZiB0aGUgY2FsbGVyIHNob3VsZA0K
PiB0YWtlIGNhcmUgb2YgaXQuDQo+IA0KDQpIaSwNClRoYW5rIHlvdSBmb3IgeW91ciBzdWdnZXN0
aW9uISBJIGFncmVlIHdpdGggeW91Lg0KSSB3aWxsIGNoYW5nZSB0byB0aGlzIGxvZ2ljOg0KCXJl
dCA9IGkyY19pbXhfZG1hX3JlcXVlc3QoaTJjX2lteCwgcGh5X2FkZHIpOw0KCWlmIChyZXQpIHsN
CgkJaWYgKHJldCA9PSAtRVBST0JFX0RFRkVSKQ0KCQkJZ290byBjbGtfbm90aWZpZXJfdW5yZWdp
c3RlcjsNCgkJZGV2X2luZm8oJnBkZXYtPmRldiwgInVzZSBwaW8gbW9kZVxuIik7DQoJfQ0KDQpS
ZXQgPSAwICAtLS0tLT4gIGVuYWJsZSBETUEgc3VjY2Vzc2Z1bGx5ICAtLS0tLS0tPiBubyBwcmlu
dA0KUmV0IT0wICAtLS0tLT4gIGRlZmVyIHByb2JlIC0tLS0tLS0tLT4gbm8gcHJpbnQgYW5kIHRy
eSBhZ2Fpbg0KUmV0IT0wICAtLS0tLT4gIGZhaWwgdG8gZW5hYmxlIERNQSAtLS0tLS0+IHJlbWlu
ZCBub3cgaXMgdXNpbmcgcGlvIG1vZGUNCg0KRG8geW91IHRoaW5rIHRoZSBsb2dpYyBpcyBhY2Nl
cHRhYmxlPw0KDQo+IE1hcmMNCj4gDQo+IC0tDQo+IFBlbmd1dHJvbml4IGUuSy4gICAgICAgICAg
ICAgICAgIHwgTWFyYyBLbGVpbmUtQnVkZGUgICAgICAgICAgfA0KPiBFbWJlZGRlZCBMaW51eCAg
ICAgICAgICAgICAgICAgICB8IGh0dHBzOi8vd3d3LnBlbmd1dHJvbml4LmRlIHwNCj4gVmVydHJl
dHVuZyBOw7xybmJlcmcgICAgICAgICAgICAgIHwgUGhvbmU6ICs0OS01MTIxLTIwNjkxNy0xMjkg
fA0KPiBBbXRzZ2VyaWNodCBIaWxkZXNoZWltLCBIUkEgMjY4NiB8IEZheDogICArNDktNTEyMS0y
MDY5MTctOSAgIHwNCg==


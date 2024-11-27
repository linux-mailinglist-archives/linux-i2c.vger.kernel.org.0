Return-Path: <linux-i2c+bounces-8231-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C079DA095
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Nov 2024 03:17:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D52F3283EC6
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Nov 2024 02:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9F9F1F92A;
	Wed, 27 Nov 2024 02:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OmTPzC85"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2040.outbound.protection.outlook.com [40.107.21.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39AE1BDE6;
	Wed, 27 Nov 2024 02:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732673859; cv=fail; b=B9ytLo1fypMs4LMJTWZmiXU9THG/Cb1feysqYYZuFNR7a0xZtinYCjvnH81y4F9vP37CKNpA9jATJ4yZFC8cAKTDJIJgWghMfjpEeFniJ/51r1DBswP/i+VwOScEFZHt3vXDyatjHvF9vDvrj42Ev+gxEGGi+qGBqAjgVJZoV6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732673859; c=relaxed/simple;
	bh=5Xa+NvD9ik7I6uUyPduNfl8SAROX7vbf5GzXzSRF5Os=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=u7SA8d3m9zbxDRHzxPX3vm/ISzseRoMhwMU3uxmaYaXxQl01DvtzUABuaTyH+xbomTWo5XJ/k1qLm6P7dsqDqeRPmlhJKKcNcuneM0NWBSiJOrIPfFt+zzVZMcBp6tPvscu1UdaDc/vIl48hVOW+L1KmzLgYmmGWnOR3ISrlG5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OmTPzC85; arc=fail smtp.client-ip=40.107.21.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W4TtCuduiJ3HDuu/O+S4dP525sHpVRz8iV5hBNqexGJrObjhuiWyGoWdDVBqMUPlbxS0jN/+az5hygYWtCdnDElrACEQYJgc13IRsXqovZUTOXlrGEVkP1o9M6xyIFzaEMyBfT1KUpHH2PXbEy5o2zbrYkk6lOstYB57pLvtqnfQ807ottZmFti0M5HN0EH7G4GhfJ7Z9l8nIPhjg7p9/FYUEdWTK74Y0SybRyomlxusAJGP3s4QmqBOzxnuhwCzS51KKdKzTVQAzFxjuz642x+ect1++heqtyLpXmPs3dyPFl+AwHTHaLiHEWjIxvHP7T+CIzxAbHZcmSu9HhSZRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Xa+NvD9ik7I6uUyPduNfl8SAROX7vbf5GzXzSRF5Os=;
 b=kSkUpth1nIscCkvmX0X6gZfwm4gVcAUh9v8GBBjF0e+7dcyq28QMIEUZDYTVvl1re0GaEi2hyXjeiuLXIth54ng0G2pKU7ghTSbJtgORI1EKWM3J8XkSffUwmnf7CMGt/z3RLdCL4NESuwUtNCNnaHxRQbmLHJ7f6redEoG1fVUXTsEX8sVKSRQQo7eT/DQWOOLS+GyRcJm3IWfYYfn5HoQl106+M8uee/w5iALqaS1Kk8i/hcADs5+ImA6Hxs9YEd0b9u/qQaB3my0Rh8VrNLdHCigyyAeb/RUWmipoiV3eOg0OZENkEaw1K/mhJr785Xpdy19VCKQb8aNeUbsMIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Xa+NvD9ik7I6uUyPduNfl8SAROX7vbf5GzXzSRF5Os=;
 b=OmTPzC85kg5L6GLyoyYPv84hidv9Bzscb9ch5cZFDN0u5Gabq3ND0Td/LUpaI6pO4cOmRCayx7aOd6c6nHQLeUKG5M8c/mCoNPjyxPE7oTXcm1RW6RaKArEi8nf4HsdjlTOVva6K90zrt8Kf1VJQDFX3r1JtddK8KIO2e3sJ5AH7UhcGIf66uLvPIX0QPkG/UhIjvotfYiw/kyw038m95k0cYfTM76sHT1tlyVznR+NCI4xL9wmGHW23bHG4ap67ARkPWILne1uOrCVsUVc/+aUXD4WkYBWGHZQIcqVbi+CujR6++sM0JdEsjnYkKiNaTRAM+ceB2Zrh7geUMvSQAQ==
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by DB8PR04MB6923.eurprd04.prod.outlook.com (2603:10a6:10:114::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Wed, 27 Nov
 2024 02:17:31 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%4]) with mapi id 15.20.8048.020; Wed, 27 Nov 2024
 02:17:31 +0000
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
Thread-Index: AQHbQHKDcTbHW+Z3GEGYd9VMbm6Bcg==
Date: Wed, 27 Nov 2024 02:17:30 +0000
Message-ID:
 <AM0PR0402MB3937C9A83292A6F20A1E8C32E8282@AM0PR0402MB3937.eurprd04.prod.outlook.com>
References: <20241126082535.1878554-1-carlos.song@nxp.com>
 <20241126-economic-energetic-junglefowl-5197a9-mkl@pengutronix.de>
 <AM0PR0402MB39372380307BC4252BD131ACE82F2@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <20241126-paper-nightingale-of-wealth-de17e7-mkl@pengutronix.de>
 <AM0PR0402MB39374E34FD6133B5E3D414D7E82F2@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <20241126-fat-orthodox-eel-5389b4-mkl@pengutronix.de>
In-Reply-To: <20241126-fat-orthodox-eel-5389b4-mkl@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR0402MB3937:EE_|DB8PR04MB6923:EE_
x-ms-office365-filtering-correlation-id: 0a2445ce-2b3c-4e54-a581-08dd0e89a5dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MTBLbDd5cHc0MVUwa0ltVUMrL3B4MnJDU2gzSUxRVVRzRllxZVVGNHoyUUEw?=
 =?utf-8?B?Zm1SaHVpanBvMDB2bUZuYi9TNHdlQ2hRdm9RN1FzMUtYSEgyM21QdmsvZ1ZV?=
 =?utf-8?B?eU1xUlE4UzBteVEzWkZFQjRzbW9KZGJic1JlK0tPMDFXRDRVYytTWFBQdk5v?=
 =?utf-8?B?SFY5TkJMUjRWRVFKTUtDTVFwc21IaHNhRXRxK3Z0TmNjbWltRW0za1FoOVpq?=
 =?utf-8?B?STJZQXpmc2NYZkl2ODcrWlR1QlVNRmQ3N2QxMmJYWXVSMzVHUmViSkIxQ0hM?=
 =?utf-8?B?UDRaM21GeG0vbnBSeSsxcjV0c1pkYUkxQk1wQVRSbTViUDFzNEhLSVRldjY0?=
 =?utf-8?B?WUV6L1JCcjU5R2s2OWRXbkEvSXY4WGp4UVUvc1ZqTnNaUW9UMXZVUzNtdk5I?=
 =?utf-8?B?UnN4RGgvMzNyT3l6VFVMMmszY2JyQWhvY2g3clI4Q0Y3eGxzOG1DT3lJQkl3?=
 =?utf-8?B?S0dtckxCcFl6TVJSSS9LbmxnejJMdis5MXpiOVd3Rk5EL3g2cDRWSmFjdGU5?=
 =?utf-8?B?YUxUZ24wbHZOWmluQVU3eTlxdy9KMEhxelNMR0ppQlBGcmo5YTRObWNVZTNO?=
 =?utf-8?B?WGFEWHF5R1Q3aEhZblhPblZJYVNMSUNENlZUVnpMZUgyRHE3WXZLTkJ0SXgz?=
 =?utf-8?B?UXpDd01rSHlMTFVCWGU1U01KYkF5ZVFCTC8weFN5dzU4T1pRY2cxQnBxZGRl?=
 =?utf-8?B?aGI1YTB3ZHZ3TWx5cmZ1eERMTlVhTWlrYk42azlJSUo3SG54TC9mUWx5WUx4?=
 =?utf-8?B?d1BIVUFkdXNKb0IxU3BrTERacDFoMm9KWVRBVDFMc2FJMEV6WTQxdnMyWElI?=
 =?utf-8?B?OFhJUzJLTHlYUk9jZVJqdFE2UDY2aFVweURmOHczaXZNUEo2ZWluS2tFMEZV?=
 =?utf-8?B?MXhoejlqQndaQzMvWldubHZyMTdIZzZ1b2JjZEFwSWt4N3EzQ3J1OE5udk9j?=
 =?utf-8?B?eThJR3hsSFN5M3dOeDhzdHdzczVRaHpLbElCbHIwbFRnUDlBMXZBc2N3SjVH?=
 =?utf-8?B?ZlhtTnpUc1JvWXdad3Y3a1VJSVcwUWZQendUZlh4QnNiQVloelNBSWRSOG0v?=
 =?utf-8?B?RS9pMmVwSnJJYVJVRFpyMThWMzdVV2RLRTNGKytiWlZMT3JaT3hNQk5FSnJ4?=
 =?utf-8?B?c1BsUFVQVmJiWlFWNHR6YmxGVkhtTzFLV1JKNGswRVFCd2FqSmlOb2E5c2hQ?=
 =?utf-8?B?RG9yNDZ5dytoSTZHVmd4Q3pzMVNTZXBacVhLZW1HNDdHblk0V2lUS2lWcW5J?=
 =?utf-8?B?T3I2VWtjNVdWclJUd0kycWk2VWo5cGhOV1JpNkNTWVgwb1NyV1laMUIwZWZ3?=
 =?utf-8?B?Y3ZwZUp6QkMxTjZXOXIvZ1BVNGk4cHlWQW5jOWdlQlZ0ZkczdURVblVyY3ZL?=
 =?utf-8?B?VlhlS3hNbDlsam9Pc3B4SVhhOXlFYkoyMy9mOTE1Z095MWowaUtpVUFjWkN1?=
 =?utf-8?B?RDBYaGpPWXhPcHdqVmNhMVFHZ05PK1R5eklOTWsxbkI2dHJmbU5JYklSQjJC?=
 =?utf-8?B?R1NmY1podXc1cDZ4OGZtNmxYbm9iNzFXZkFlcmM3aXVXeDlkRDNtWVpVN2lE?=
 =?utf-8?B?ODBWeWZaRnpmQmlRV2VCamI1ZXI1SEJBZUxGdWJYUGNTT3U5N1YwYWtuMGJh?=
 =?utf-8?B?bmJXdEJJTG00cDJHWWhwbzlFOUZqK3BGeFQ2ZW9Fcytkayt3dnJKVGVLVTRa?=
 =?utf-8?B?WTgrYXM4dmVwdFRENVFyQmNOVW8rdjVDdTZaVENYRFJ0K0g4bGpOYWxkOWQ4?=
 =?utf-8?B?WEZSM3BiNVBhNVhqTU9TYVg2RUhsUitKKy9Ca2N2bTJHZ3kxSTY1V1NwQ3dw?=
 =?utf-8?B?UGtib2ZNTXhCOHhHVjNCUT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K0VrbmV2bGlUc1h3UVJUYkMzeFJCek8xd0lpK3BsTnNTNmEzQ0xUU3hLUEhK?=
 =?utf-8?B?Tm56V0psVlJMajJJekg0dnRqbnlzTkRNdXFZUFZla1VmUWl0V1JFM1o5MVhz?=
 =?utf-8?B?Mk5BNDcvcExOaGZVeGNjOHEvTWVoOVJVMnU0R2VCSm5ETHVUQzdRc0lzbjAz?=
 =?utf-8?B?cVorVE1xQnhXb0x0bmxrSlhGMmZ1M21aTHd2T1BXeDJmSVRQZjZ3SXNSOEpO?=
 =?utf-8?B?TzJQVjRBeHpMRG14ZnBwUVhvL1pWYWNQMmtURitjcGxISTd5ZUU3bGgyanMr?=
 =?utf-8?B?eVoxeHB6Y3VvMVNlbXdNbmVZUTVBNlFsekhWV3FrZXpadFZmT1pPVFU3Nkx4?=
 =?utf-8?B?UG1GUEcrNVA2QnpGQWIwd1VpUlR0N2w0Z0s5OFZiQTZWSDhDRHpZNFRob0pF?=
 =?utf-8?B?aStYcW10MmV0S1lpSFQwbTVERmpFZ296WEpEc2docThWYjZJWWZiWDRXbXky?=
 =?utf-8?B?ZFNGVStkTWloV0RrTmQ1ZkwvMmhaWmVENGNERS96TnNWWUFiemVKN0dqTVNa?=
 =?utf-8?B?c0VUdXQxTWF1NXU4OFpaaittbFpIQXd2MGZvT3FJWUQ4dk0vYmpTSHVhTDVW?=
 =?utf-8?B?b1ZPZjZZUWF5emIvV2tFOS91QkNtNDcwSmZKQ1E4Vm9zYk9zWVBtdTdsNDZp?=
 =?utf-8?B?eHZISVJuN2FTQWpsbkVNQ21ZMGFzeTFQdGFCQXlVMDllWTgrU05oWFliY1RJ?=
 =?utf-8?B?RUk5YUVKVVVGbWszbVNpN0hLMXNHZjF5QWFEaVFhME4rZnFKUkZYQ1l4RmZp?=
 =?utf-8?B?MFVaVjlUdkxpczhIUzNGaDZBbFJwTThqM0p1ZU5OeFZQN2tnRjIxNXF0Ymp6?=
 =?utf-8?B?VllSNzlIUitGOXlFQWtOWWNIcDdMWkVjYjN0YzhiTzB0Q0NBV1hHOWZJektL?=
 =?utf-8?B?bE9ZWXdxQ3BkaUxNM0hkWFR0TnJyNHFWY3IyYUxIcEU3c2FlSVpGaU5jMS9G?=
 =?utf-8?B?blRwbEdXbEtibkVXVHlCQ0RhL1p3Z1RSd201aHg0Mlpjb1R4NU03Mml6K3VT?=
 =?utf-8?B?ZEtka29xb2JKSFF2MFBhMmhqMGE1QVA5eVY4T0I0bTFSUUJzQldrZCtwNlYx?=
 =?utf-8?B?T3VXbmtMZnFnSTFyRFl1ZTNSNUgrVUppMnlhR0gwR1paZ05uak0vL3NlTWNO?=
 =?utf-8?B?T01EdFhKOVhOeURtM0dJd3o4RkhvQ2NYbWVSOXRobmJYTFMwUDg4NDBoY3Bj?=
 =?utf-8?B?MDI5a21LdU5oNTgyS2ptbGtIUVU0a1FrVS9zWmVkOFVwT1IyZjhSV1hsUVZ6?=
 =?utf-8?B?S2ZUcEo1dWs5dGM0bkFKVXY4UXlUN0tUOXgxYk42aFVpd1RSOTlXZEFFRFVx?=
 =?utf-8?B?bTRkY244TVkySmIyNjl2bmpZazV5Sis0ejB6UXZ2MXh0SHlkYkNKdmJod3pN?=
 =?utf-8?B?YmlKRTBzMXpqUVRvVTBDaWRCbWIvZ2RCTkdmbE1EZlZPNlRzQzQySEs3NXN0?=
 =?utf-8?B?ZTFZMVA5THplU3RnTGVmZGN2MUpQalZPQU9yZ1BJbHgzUzFzU3cvZFdJSndn?=
 =?utf-8?B?SlAzbzk3aEh1cXBnbkVlcWdGclJFK2lVR0dacWtNQ0dobXgwRnVnQ3pWRzUy?=
 =?utf-8?B?RGZCS2pjRGc5ejZnNlFkcWJRMmxEeDRRWEY4WUloWCttQ2NsR2JvODhJVkg5?=
 =?utf-8?B?SUhlSElOLzBWazVmTERSZDRrNUZYK0djbGZCQVpzbHlSMWV6UzNvT3BXZ1VU?=
 =?utf-8?B?Sm5LQlFpUG1mVWo0bCtONWpLVThmd3YxZFp4MmZmc1g0U25QRUsvWGlzS2xv?=
 =?utf-8?B?RXhvSkpLK09EOU5HMnllODZJVDE1T1FPd0NQUWRiODVnTy9ZSGpFUVNkNTIr?=
 =?utf-8?B?N0o0alJuaHhlT3VqZ0xMcTA2VnZuWlNvQzRncytLL05uUnNSMDdvN3NkTVBM?=
 =?utf-8?B?VE1CbG5ERU9qNEozdWZnQXNUbzgvVlc0bG5DSUR0Sm9vUWdoL2g4WnpLbmly?=
 =?utf-8?B?WE1JdzlVamtpWk5mclo1Y2ttMEFhcFdaY2t0T0lrNytDZExrY0wyMzdZb0ZP?=
 =?utf-8?B?SSthaTNxRks3TkpCVVpDMTRvZ0xreThZenBtYkQ3eFNCSFo2bm53V1lmNlpQ?=
 =?utf-8?B?UDVTcnFjMUFiU3ZhY0l0TFlHTnMwakJvVHRUbkFzdWhxR1ZGSlRvckVnUzRo?=
 =?utf-8?Q?t4Xg=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a2445ce-2b3c-4e54-a581-08dd0e89a5dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2024 02:17:31.1942
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CbyTV1P003rT/2hAWUNeRVW9uYpr5+2asHwv9FtE5QVRrz2+USmevTy04grmCUQRwYfSi6beK7ee2FgZVUknoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6923

PiA+DQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBN
YXJjIEtsZWluZS1CdWRkZSA8bWtsQHBlbmd1dHJvbml4LmRlPg0KPiA+ID4gU2VudDogVHVlc2Rh
eSwgTm92ZW1iZXIgMjYsIDIwMjQgNjoyNCBQTQ0KPiA+ID4gVG86IENhcmxvcyBTb25nIDxjYXJs
b3Muc29uZ0BueHAuY29tPg0KPiA+ID4gQ2M6IEZyYW5rIExpIDxmcmFuay5saUBueHAuY29tPjsg
by5yZW1wZWxAcGVuZ3V0cm9uaXguZGU7DQo+ID4gPiBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7IGFu
ZGkuc2h5dGlAa2VybmVsLm9yZzsgc2hhd25ndW9Aa2VybmVsLm9yZzsNCj4gPiA+IHMuaGF1ZXJA
cGVuZ3V0cm9uaXguZGU7IGZlc3RldmFtQGdtYWlsLmNvbTsgaW14QGxpc3RzLmxpbnV4LmRldjsN
Cj4gPiA+IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMu
aW5mcmFkZWFkLm9yZzsNCj4gPiA+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gPiA+
IFN1YmplY3Q6IFtFWFRdIFJlOiBbUEFUQ0ggdjJdIGkyYzogaW14OiBzdXBwb3J0IERNQSBkZWZl
ciBwcm9iaW5nDQo+ID4gPg0KPiA+ID4gT24gMjYuMTEuMjAyNCAxMDoxNToyNywgQ2FybG9zIFNv
bmcgd3JvdGU6DQo+ID4gPiA+ID4gPiAgc3RhdGljIHZvaWQgaTJjX2lteF9kbWFfY2FsbGJhY2so
dm9pZCAqYXJnKSBAQCAtMTgwMyw2DQo+ID4gPiA+ID4gPiArMTgwNCwxMyBAQCBzdGF0aWMgaW50
IGkyY19pbXhfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiA+ID4gPiA+
ICAJaWYgKHJldCA9PSAtRVBST0JFX0RFRkVSKQ0KPiA+ID4gPiA+ID4gIAkJZ290byBjbGtfbm90
aWZpZXJfdW5yZWdpc3RlcjsNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiArCS8qIEluaXQgRE1B
IGNvbmZpZyBpZiBzdXBwb3J0ZWQgKi8NCj4gPiA+ID4gPiA+ICsJcmV0ID0gaTJjX2lteF9kbWFf
cmVxdWVzdChpMmNfaW14LCBwaHlfYWRkcik7DQo+ID4gPiA+ID4gPiArCWlmIChyZXQgPT0gLUVQ
Uk9CRV9ERUZFUikgew0KPiA+ID4gPiA+ID4gKwkJZGV2X2VycigmcGRldi0+ZGV2LCAiRE1BIG5v
dCByZWFkeSwgZ28gZGVmZXIgcHJvYmUhXG4iKTsNCj4gPiA+ID4gPiA+ICsJCWdvdG8gY2xrX25v
dGlmaWVyX3VucmVnaXN0ZXI7DQo+ID4gPiA+ID4gPiArCX0NCj4gPiA+ID4gPg0KPiA+ID4gPiA+
IERvbid0IHNwYW0gdGhlIGxvZ3MgaWYgdGhlIGRyaXZlciBkZWZlcnMgcHJvYmluZywgaXQncyBu
b3QgYSBlcnJvci4NCj4gPiA+ID4gPiBBbmQgaXQgbG9va3Mgc3RyYW5nZSB0byBpZ25vcmUgYWxs
IG90aGVyIGVycm9ycyBoZXJlLiBFaXRoZXIgYWRkDQo+ID4gPiA+ID4gYSBjb21tZW50IGhlcmUs
IHNvbWV0aGluZyBsaWtlICJjb250aW51ZSB3aXRob3V0IERNQSIsIG9yIGxldA0KPiA+ID4gPiA+
IHRoZSBmdW5jdGlvbiByZXR1cm4NCj4gPiA+ID4gPiAwIGluIGNhc2UgdGhlIGRyaXZlciBzaG91
bGQgY29udGludWUgYW5kIHByb3BhZ2F0ZSB0aGUgZXJyb3IgaWYNCj4gPiA+ID4gPiB0aGUgY2Fs
bGVyIHNob3VsZCB0YWtlIGNhcmUgb2YgaXQuDQo+ID4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4g
SGksDQo+ID4gPiA+IFRoYW5rIHlvdSBmb3IgeW91ciBzdWdnZXN0aW9uISBJIGFncmVlIHdpdGgg
eW91Lg0KPiA+ID4gPiBJIHdpbGwgY2hhbmdlIHRvIHRoaXMgbG9naWM6DQo+ID4gPiA+IAlyZXQg
PSBpMmNfaW14X2RtYV9yZXF1ZXN0KGkyY19pbXgsIHBoeV9hZGRyKTsNCj4gPiA+ID4gCWlmIChy
ZXQpIHsNCj4gPiA+ID4gCQlpZiAocmV0ID09IC1FUFJPQkVfREVGRVIpDQo+ID4gPiA+IAkJCWdv
dG8gY2xrX25vdGlmaWVyX3VucmVnaXN0ZXI7DQo+ID4gPiA+IAkJZGV2X2luZm8oJnBkZXYtPmRl
diwgInVzZSBwaW8gbW9kZVxuIik7DQo+ID4gPiA+IAl9DQo+ID4gPiA+DQo+ID4gPiA+IFJldCA9
IDAgIC0tLS0tPiAgZW5hYmxlIERNQSBzdWNjZXNzZnVsbHkgIC0tLS0tLS0+IG5vIHByaW50DQo+
ID4gPiA+IFJldCE9MCAgLS0tLS0+ICBkZWZlciBwcm9iZSAtLS0tLS0tLS0+IG5vIHByaW50IGFu
ZCB0cnkgYWdhaW4NCj4gPiA+ID4gUmV0IT0wICAtLS0tLT4gIGZhaWwgdG8gZW5hYmxlIERNQSAt
LS0tLS0+IHJlbWluZCBub3cgaXMgdXNpbmcgcGlvDQo+ID4gPiA+IG1vZGUNCj4gPiA+ID4NCj4g
PiA+ID4gRG8geW91IHRoaW5rIHRoZSBsb2dpYyBpcyBhY2NlcHRhYmxlPw0KPiA+ID4NCj4gPiA+
IFllcywgdGhlIG90aGVyIG9wdGlvbiBpcyB0byBtb3ZlIHRoZSBsb2dpYyBpbnRvDQo+ID4gPiBp
MmNfaW14X2RtYV9yZXF1ZXN0KCkgYW5kIGxldCBpdCByZXR1cm4gMCBpbiBjYXNlIG9mIERNQSBv
ciBmYWxsYmFjaw0KPiA+ID4gdG8gUElPLCBvciBhbiBlcnJvciBpbiBjYXNlIG9mIHByb2JlIGRl
ZmVyIG9yIGEgZmF0YWwgZXJyb3IuDQo+ID4gPg0KPiA+ID4gVGhpcyB3YXkgdGhlIHByb2JlIGZ1
bmN0aW9uIHdpbGwgbG9vayBsaWtlIHRoaXM6DQo+ID4gPg0KPiA+ID4gICAgICByZXQgPSBpMmNf
aW14X2RtYV9yZXF1ZXN0KGkyY19pbXgsIHBoeV9hZGRyKTsNCj4gPiA+ICAgICAgaWYgKHJldCkN
Cj4gPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCBy
ZXQsICJGYWlsZWQgdG8NCj4gPiA+IHNldHVwIERNQVxuIik7DQo+ID4gPg0KPiA+DQo+ID4gU29y
cnksIEkgaGF2ZSBzb21lIGRpZmZlcmVudCBpZGVhcy4uLg0KPiA+IDEuIERNQSBtb2RlIHNob3Vs
ZCBiZSBvcHRpb25hbCBmb3IgaTJjLWlteCwgYmVjYXVzZSBpMmMtaW14IGNhbiBhY2NlcHQgRE1B
DQo+IG1vZGUgbm90IGVuYWJsZWQsIGJlY2F1c2UgaXQgc3RpbGwgY2FuIHdvcmsgaW4gQ1BVIG1v
ZGUuDQo+IA0KPiBBQ0sNCj4gDQo+ID4gICBJZiB3ZSB1c2UgcmV0dXJuIGRldl9lcnJfcHJvYmUo
KSwgd2UgaGF2ZSB0byByZXR1cm4gZXJyb3IgYXQNCj4gaTJjX2lteF9kbWFfcmVxdWVzdCgpIGZv
ciAic29tZSBmYXRhbCBlcnJvciIsIGl0IHdpbGwgY2F1c2UgaTJjX2FkYXB0ZXIgY2FuIG5vdA0K
PiBiZSByZWdpc3RlcmVkLCB0aGVuIGtpbGwgaTJjIGFkYXB0ZXIgcmVnaXN0ZXIuDQo+IA0KPiBp
MmNfaW14X2RtYV9yZXF1ZXN0IHNob3VsZCBvbmx5IHJldHVybiBhbiBlcnJvciBpZiBQSU8gbW9k
ZSBpcyBub3QgYW4gb3B0aW9uLg0KPiANCj4gPiAgIElmIHdlIGFsd2F5cyByZXR1cm4gMCBhdCBp
MmNfaW14X2RtYV9yZXF1ZXN0KCksIGRldl9lcnJfcHJvYmUgd2lsbCBub3QNCj4gd29yayBmb3Jl
dmVyLiBTbyBmcm9tIG15IHBvaW50LCBpZiBETUEgaXMgbm90IHdvcmtpbmcgd2VsbCwganVzdCBv
dXRwdXQgYSBsb2cgdG8NCj4gcmVtaW5kIG5vdyBpMmMgaXMgYWx3YXlzDQo+ID4gICB3b3JraW5n
IGF0IENQVSBtb2RlLCB3ZSBoYXZlIG5vIERNQSwgdGhpcyBpcyBlbm91Z2guDQo+IA0KPiBBQ0sN
Cj4gDQo+ID4gMi4gd2hlbiByZWFsbHkgZGVmZXIgcHJvYmUsIHJldHVybiBkZXZfZXJyX3Byb2Jl
IHdpbGwgcmV0dXJuIGRlZmVyIHByb2JlDQo+IGRpcmVjdGx5LCBidXQgd2Ugc3RpbGwgbmVlZCB0
byBnb3RvIGNsa19ub3RpZmllcl91bnJlZ2lzdGVyIGJyYW5jaCB0byBmcmVlIGlycSwNCj4gY2xr
X25vdGlmaWVyX3VucmVnaXN0ZXIgYW5kIGRpc2FibGUgcnVudGltZSBwbS4NCj4gPiAgIFNvIHdl
IHN0aWxsIG5lZWQgbW9yZSBqdWRnZW1lbnQgYXQgcHJvYmUgZnVuY3Rpb24gdG8gaGFuZGxlIHRo
aXMuDQo+IA0KPiBOb3QgcXVpdGUgImRldl9lcnJfcHJvYmUoKSIgd2lsbCBub3QgZGVmZXIgcHJv
YmUgZGlyZWN0bHksIHRoZSByZXR1cm4gaW4gInJldHVybg0KPiBkZXZfZXJyX3Byb2JlKCk7IiBk
b2VzLiBUaGlzIHNob3VsZCB3b3JrOg0KPiANCj4gICAgICAgICByZXQgPSBpMmNfaW14X2RtYV9y
ZXF1ZXN0KGkyY19pbXgsIHBoeV9hZGRyKTsNCj4gICAgICAgICBpZiAocmV0KSB7DQo+ICAgICAg
ICAgICAgICAgICBkZXZfZXJyX3Byb2JlKCZwZGV2LT5kZXYsIHJldCwgIkZhaWxlZCB0byBzZXR1
cA0KPiBETUFcbiIpOw0KPiAgICAgICAgICAgICAgICAgZ290byBjbGtfbm90aWZpZXJfdW5yZWdp
c3RlcjsNCj4gICAgICAgICB9DQo+IA0KPiANCj4gPiBTbyBJIHByZWZlciB0aGlzIGxvZ2ljOg0K
PiANCj4gVGhpcyBhbHNvIHdvcmtzLCBMR1RNIQ0KPiANCg0KSSB3aWxsIGFwcGx5IGl0IGluIFYz
LiBUaGFuayB5b3UgZm9yIHlvdXIgYWNrIQ0KPiA+IHJldCA9IGkyY19pbXhfZG1hX3JlcXVlc3Qo
aTJjX2lteCwgcGh5X2FkZHIpOyBpZiAocmV0KSB7DQo+ID4gCWlmIChyZXQgPT0gLUVQUk9CRV9E
RUZFUikNCj4gPiAJCWdvdG8gY2xrX25vdGlmaWVyX3VucmVnaXN0ZXI7DQo+ID4gCWRldl9pbmZv
KCZwZGV2LT5kZXYsICJ1c2UgcGlvIG1vZGVcbiIpOyB9DQo+IA0KPiByZWdhcmRzLA0KPiBNYXJj
DQo+IA0KPiAtLQ0KPiBQZW5ndXRyb25peCBlLksuICAgICAgICAgICAgICAgICB8IE1hcmMgS2xl
aW5lLUJ1ZGRlICAgICAgICAgIHwNCj4gRW1iZWRkZWQgTGludXggICAgICAgICAgICAgICAgICAg
fCBodHRwczovL3d3dy5wZW5ndXRyb25peC5kZSB8DQo+IFZlcnRyZXR1bmcgTsO8cm5iZXJnICAg
ICAgICAgICAgICB8IFBob25lOiArNDktNTEyMS0yMDY5MTctMTI5IHwNCj4gQW10c2dlcmljaHQg
SGlsZGVzaGVpbSwgSFJBIDI2ODYgfCBGYXg6ICAgKzQ5LTUxMjEtMjA2OTE3LTkgICB8DQo=


Return-Path: <linux-i2c+bounces-3457-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0DA8BDEED
	for <lists+linux-i2c@lfdr.de>; Tue,  7 May 2024 11:52:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 412321C235E0
	for <lists+linux-i2c@lfdr.de>; Tue,  7 May 2024 09:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7902514F116;
	Tue,  7 May 2024 09:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="io6A/m7g"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2114.outbound.protection.outlook.com [40.107.22.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145B314D71D;
	Tue,  7 May 2024 09:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715075331; cv=fail; b=tsbeiBQ+ZeLX1ik6BV3WIxcN8tcybqANBozGRLrwiPMMekP7wfB0OZf8wQ1hdbF5DmTxdC7dT7eQhI5jj+ZFCtcF+S5HLNpH8QH73NobakcNIf/ZvNGyrSjTinw2Szfxd3/4YuS9vdFfUbX7WRI26Vgqco19vpRg4poGvKeRS8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715075331; c=relaxed/simple;
	bh=HFfZVrCfc2McAseFLQwOZ7BhHZftBzywGsmw9qxdlpI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gfbnP0YxR5wOTnTr1cP3DwRC5Nv4UbUiZ0rWuQdwDuk6tQ4Mi8sKUlRLaSwFeFha+JQxHqgHF7L6mLEUWY4BF1Nd1dhvW9SDcZ7N2PSytZxgDe5UkwFB+bKkVAF24NOtUhm2/c1v++QE2zaa4PRjDWPS2yx8jSbVyjqoW1uSbbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=io6A/m7g; arc=fail smtp.client-ip=40.107.22.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MV3P6HvRclcLmgCNPS9E323bt0k8+bsp0cGdHQ3qYyX3j5ayWOv+zPksi9aExBKeR22ZZVR3PLS/vEIKo9lYga30xu1wYLUmJ2SHLgwaqx9/BvZHFQNffbuP3ZW9fkern0+C4lVuMOxlbtc4xa9Esj/isyDI92nFm+aVbHf8K3H9ElJRiOPeKoCrW+XuLHONTZ5bMtmPwf0BM9NHJJdkpmmQqIyMGfKE9U/jKeqv1o1ovviLv7QaMGffDVPACXJsT9UDUlwJnbs83r+QTn0yKJxzxvjoCCsEiPB4EQJDsbEF5myfccvBOe7iFgiNoGs7kYDyRB20FOYRvTIyIa7fwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SFaPdzbEfsQyaZU8VsaxuVyOwQopmmOKiXFMV/tvz24=;
 b=JznJIKYn55n5P6GX1MPD9vMVwPntyUXaZGcaSLyXCt4Lf19FXa/VrO05NJkvqMO+hHZZ+P5E5Obcny4O5GQryvlbKdUpcLXcOcoqTL3A5IVfLvMdcEV2PZhH3XtiAP4cBj9oKMAj5gSWHW3OaL7haHPEWsHtgOV+MfMR+zypKRbCWKdoaU5r99i5WJjPSJEl/ujOuLcOp6B5sZnay/cvQOGzt2q2YwawRLkNjUytCUoLnusVt/vNp57Dw3eFjAww2BjemSZP6xbnuDQmqqK7mDe1MHNFJW2ypgBpK7PHJIM08gslUGq/XrZqiIhoCECD1r696mk2Zw2IExriH7wVaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SFaPdzbEfsQyaZU8VsaxuVyOwQopmmOKiXFMV/tvz24=;
 b=io6A/m7gRII11b6Wlc068SPCIdcSxJAU0u2rqvI2LY/LfTGpygRKPEzjCKQCGkJQphywJgFFy2a2YxRtLisDlJ2Wbwx22wVBbGyhWGY+WImvEXhLLQJDyKGJ+LvnqawJpY0xuCHuZ5kUzdMcuFIVI/ZxiJUOpPbYdArebrN0pbM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DB7PR04MB4842.eurprd04.prod.outlook.com (2603:10a6:10:1b::13)
 by DB9PR04MB9554.eurprd04.prod.outlook.com (2603:10a6:10:302::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Tue, 7 May
 2024 09:48:44 +0000
Received: from DB7PR04MB4842.eurprd04.prod.outlook.com
 ([fe80::ac08:df46:97bd:4ae6]) by DB7PR04MB4842.eurprd04.prod.outlook.com
 ([fe80::ac08:df46:97bd:4ae6%6]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 09:48:44 +0000
Message-ID: <34968505-f8b1-4c6f-9d9c-5938edcdba68@cherry.de>
Date: Tue, 7 May 2024 11:48:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] i2c: mux: add the ability to share mux core
 address with child nodes
To: Peter Rosin <peda@axentia.se>, Farouk Bouabid <farouk.bouabid@cherry.de>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20240506-dev-mule-i2c-mux-v2-0-a91c954f65d7@cherry.de>
 <20240506-dev-mule-i2c-mux-v2-1-a91c954f65d7@cherry.de>
 <9b12dc9f-054b-fba5-e23d-48d0fe1a00e2@axentia.se>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <9b12dc9f-054b-fba5-e23d-48d0fe1a00e2@axentia.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::15) To DB7PR04MB4842.eurprd04.prod.outlook.com
 (2603:10a6:10:1b::13)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4842:EE_|DB9PR04MB9554:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f0a89f7-7b0b-405d-8c4a-08dc6e7ae239
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005|7416005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TTRMMEZHSk95aWpKVTRKejRHOVNRaGRCRVBpVzBUZDFUdmVwTmR5MWk2bk5r?=
 =?utf-8?B?OWJuTmM4ZHh3bHFyT1czampUTi9oNEszWWMvTS9XWm42WXU2NWpYb1FkMUNK?=
 =?utf-8?B?L1o2WlJ2bDhNZVEwdEpLMjdkdVJnUW9tR1NINHZWaUd3Mm9pMHN1aExLRDJx?=
 =?utf-8?B?eGhBWUxEenB2a0ZwZG5TbjQ5V21GbzBGb0tSREs1QlR5Y2JXNFpUblA4UjFu?=
 =?utf-8?B?V2dPcCs1RHZyVVBVeHNQcit3SnoxN1Z2MzlZcGdwU1p5aExtNHBIWVZLelJY?=
 =?utf-8?B?TUdiU3Y1UUwxVjJ6UmxzajlUM1dxNFZlTnRSR0hHVHdiY0xxa2VIMnkxcnU3?=
 =?utf-8?B?KzRhRHFra2UzRVFrdFRLajFvT0NTRk1TbEd2dnRreEt4UGc5MHZkRkxuSG8v?=
 =?utf-8?B?Z1VRcHhJMERYTmlmejRJaG92QUxpR0ltb29mZ00xRXJUYTI1MnZrVXZCenlH?=
 =?utf-8?B?azlGZURtQzVPZW9LR3drcXVCQkx5RTVXSzhvcXBRM1pWb1l2bDYzYUExZWVD?=
 =?utf-8?B?ZGs5SnNsMjROTmxRczJ2U1JLVWZnVjc5OEZUak1vT25vaEpVTGhoY0I2ZDNW?=
 =?utf-8?B?YTc2cURraGtJSnZhSVVUTG55UGQxMndKck0yQStMU3FKU0FOZzhzM3o4Nitl?=
 =?utf-8?B?VDQrQnExTmcxSUhsNnlHSjZjbkhRamJpbURDNkhhTEVmdi9sbkxndXRJZXRq?=
 =?utf-8?B?OTlSZHkrd3FMUlBSWVl4OFh3RDJGbEV1cHRGWld3UkpkVHF4SWZvalpXdFJ4?=
 =?utf-8?B?Tk5HanUrYnRvaFNSSEp1RlRISitvWWI0WTdYTUZuclFxWkdUVkRQRWFXS0Z6?=
 =?utf-8?B?RGQ3T1lPZkYrODlBTk9KUThGUlpkNjBucFNHaEVQR0tXRjZOTEluTnQveVg0?=
 =?utf-8?B?a3liemQvekVMUHk1RTNsWlg4WUd6UHZwWnlsQ2dGQXY5RVpHOFZwelRuWUFH?=
 =?utf-8?B?WldnRUhXQkkzYXp4Z2FhM2NrSEF3RVpiMU1VZTFON3RNS3NSMCt5c1h5eXNo?=
 =?utf-8?B?ZXdZOTNROWlGc2ZDdmhzZ2c2bGplc3E3dDVaRFB4UkYrbmtvQ1FUQ1c2Y05L?=
 =?utf-8?B?Qk1GZXBNekQ1b05rV1V6M291Ym01ZStlZlVvcEVDa2hFVFg5ckdqSEd5aFlu?=
 =?utf-8?B?bXdyMUx5Q0lBRnY3eFZzRXdmMU4vOUZ3N2pkTTV1NnNkQWpjZjR3aG5DaHJs?=
 =?utf-8?B?Z1J5dXdNeTh4MTVYVHBsazVkcDRJNHF4N3NaMEViMFNkSjJlQWZZK1hZZ1BB?=
 =?utf-8?B?YWxLQ08vRVc1WU8wbW1zejVuYmZRdnplejMrcnJhSE12emh4M1ExYlV3Z1hk?=
 =?utf-8?B?dTZXaVZIV3IwZDB2QmRHTEFxb2RvRFZ3cytvV2J1Y3Q1dVpPWWJBR1ZJQ245?=
 =?utf-8?B?cHJMN1A4YmpqSmNkRXVzQTRzVzhSb0RFWEl5TWFFaXlWSWNPelhHeWFYa0Y3?=
 =?utf-8?B?SGl6MlRlRGdodmdESURDVU9FYzZMWnJvK0Y0VVVLTGZoT25JU282VXFnYTJt?=
 =?utf-8?B?cGdwV2NFckVmM2RLaHdSeGswbmRTVU9kKzE0dVpQd0l3Y0hndjBjbmd0VUtu?=
 =?utf-8?B?RnBzOW9Cbm1sQUpRRGlwQ2EwNlk4V2xBSGhHcXQzRm9VY3lmdGdqbFpuNkda?=
 =?utf-8?B?OU0zQTBERTRNL2o4NFBiSUw1bnIvSVE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4842.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(7416005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Znk2Vjd4cmlDcVEycEVnSlVrMUVEM1BqekU4WHFicW80U3F5OWN0T2ZFU0l3?=
 =?utf-8?B?K2pqdnZaTGJ1M00rNGVod0sreG56b0FKSzdZVzBsNllXWGJ2dW5CT0ZrZDdy?=
 =?utf-8?B?aTUzTVY2MkJuMUxVQnNiTmprZE9yN1FtZnhJMWR3MnpoK29ua01sdjhqYnNU?=
 =?utf-8?B?SlVyMnZNNWZiNlozbXRIOFZzSkJRZ1p1dVBwSURTUEZQWFBCVXlUZ2JJaW4y?=
 =?utf-8?B?a01NTGxxRHVtakpRL2I5TWxQOWkzYlZwL04vSk1KejEzelpEVXBlaWdXRFVo?=
 =?utf-8?B?Zzkvb1J2cWZ1ZzNONHBJVmZUdlFZbHhpL1RJTkJncmI3VWUzSmJKeDVWWlNl?=
 =?utf-8?B?Uk5HdHZya3lBeXpoSTVGaDBrMjl2T2dObzBjNk44VmorZ01WUG5oYWVnMWNV?=
 =?utf-8?B?RG5iemhhTjVuMnRhSTNDd1BpUFpmR0NjQzVXbnk1cEljK1FYdnEzM1FuRjFS?=
 =?utf-8?B?aUdCeWxjNytzWVZKM2hvczFFbUhjVy9SYWVBZWxNU3krWmRDcS9qVVpBRUpX?=
 =?utf-8?B?S28weFE2TVJvYS9oOGVRL3UzeU1rb2hIVkdwMEtSYnhzc2dERGZHdm9idEtn?=
 =?utf-8?B?dlN4OC9BL3FPb2FlNGhCK0RKRzl2MWY1WHJFV0x3UVlIcXkwRndqVkI4cEhE?=
 =?utf-8?B?aE5JU0djNkQxYXk5Sm5zVExuQlVvSkdzY00zWXg2cGlHOUVpSm5PUVdRQ2Vh?=
 =?utf-8?B?UE5uUXJDY3VMVGpPbTlQbUpCWW5aUEFkcEU3cDRxeis3R002aUhVcVNKL2hG?=
 =?utf-8?B?QXZUakF3Rmp1bFdCOXdjQXd3QnhDMDJaUEZiSzU1a0xlV01JMFFsREk5c01t?=
 =?utf-8?B?RDFvZklxS1ZkeTkvZlU3MEFTNWRyVm1TM2MrYWZ6QmhRbVJmb1JEb21mVU1I?=
 =?utf-8?B?U3F0eHdNR0svV00vRm1CaGhaejArc245OVBwb1F3SVN6UkFQZjloUSs5b0xP?=
 =?utf-8?B?eWRIVlkrQnMyTnJMMU1nekJSb21ock1zdGIrd3dvWXY0MGQ2Vm4zd3FISHRX?=
 =?utf-8?B?aFk1Y3FCay83b2hHR3B6UktHQlp0VGRXejM1ajU3RmZJRDJ4T2wrcEd6TnFJ?=
 =?utf-8?B?czFMMWw5UGhSZmF0eFRGS2Q4OGJUZlgrMzUvZnlRR01CT0hYVWYvSjFERWN0?=
 =?utf-8?B?em1pbjNudFIyOXRkdmZ3eHM5ZTBsRHo5ZUtvR2pkQmtLSnpEb2wwK2hYSzlM?=
 =?utf-8?B?RE5Sbk95aHNOYy9JaWlTQnpmVmhBc0M0SUlUU3cxWnB3OGVjSXJtVXNYc2po?=
 =?utf-8?B?TTE4YnpXOTZHelliVHE4b1VyTGF1QVpWMi9Cb0lraXNiRTd5M1hGNTc3WjlE?=
 =?utf-8?B?WnZrSXJEa3pPRml0VDExeEczb3ZLdGZ5OXE1Q3duSHRuMFdwbTVaMDdZUWlt?=
 =?utf-8?B?eHNpY2pDUGZRRzNtZ2FIUTYvakVvVWdsZXpZS3ZpMkowMEgzZzAzb0NGMmdj?=
 =?utf-8?B?V0xvdjZSYVFmR3hnSmFvcmxZeWZzdnV4YkNkT2NZWEZyZFliSWRjaFNPamUr?=
 =?utf-8?B?VGFrajQvRnpLUlB1TFFFK1ZPWUlSZlJmYWM5Z205NGVaS0VUM3o3WkRlQ2o1?=
 =?utf-8?B?Ymk5UEFiOTA4UXZ2d0owZGdNdHphYk5oOHkrZUozOWxOWVUxQnR5SXI2QjRF?=
 =?utf-8?B?bzlOR0NHNFh5eitYenRNWW81NVBYRmVmWGhucmtEMWU3cTNVMEtRM2dmNFhC?=
 =?utf-8?B?QVA1cWQyeGxOZEdxWVU2eE5GSXgwdXZOM2syYnJ4b0tRYytKWGJEbGpuVnNa?=
 =?utf-8?B?TlRCMjJ2OHZwbUtoSDJhVm1oR0lUOWpTdmliUFpMbXBISlZXWXJOTTBsZ1Jw?=
 =?utf-8?B?M0ZVODdRdlZIbUxydkw5MEZvTURqcEVxbUhPcWJ2VGxsbHNCSUNDb1VyWkdG?=
 =?utf-8?B?V0Z5akUzRmJld3RjVUVRc090am5GN2JVYUxVbHVWVE1wZVFpenhGWjdrVDdr?=
 =?utf-8?B?T050VVFlM2tCQmVtMWJta013MDFQWWNUK3VjeWpPaHh5Nzh1cTlEM1JhcFp0?=
 =?utf-8?B?UGhiWDQ0eXM3MkpJRzEycThMOVQ0cmxZQ2t1bnlpclpQUllqQTVnYWtyeGVN?=
 =?utf-8?B?b1pwSjlKRG04d3U3Y3I0OUlvemk4Q2lHd3RQRWoyK29lYWJzakhCeGw1ZUpT?=
 =?utf-8?B?VzlBVExwMmE3T0Z3VnlMQkpmcHJXZnV1R0VzSHd1OGtSaFhSVkM1OVJCME50?=
 =?utf-8?B?c0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f0a89f7-7b0b-405d-8c4a-08dc6e7ae239
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4842.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 09:48:44.1825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eiMTtDb2M33nHVKbg4v5s/igDa7dDANMS7ah/hWduIhvL8OlN9whmdZdKeH6SCDLf0Ye0c+2jhJ+Mq2oxGdUxVs5q4TIFmp2QVBDgcZzt0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9554

Hi Peter,

On 5/6/24 11:26 PM, Peter Rosin wrote:
> Hi!
> 
> Regarding the subject (and elsewhere) I think of "mux core" as roughly
> the code in the i2c-mux.c file. So, for me, the "mux core" does not have
> an address, it is a mux "driver instance" or "device" that sits on the
> I2C address that you need to share.
> 

I'm the one who suggested mux core here (privately) :)

The issue is that in my head a mux device is the i2c adapter/bus (from 
i2c-mux.yaml dt binding example):

"""
     i2c {
         #address-cells = <1>;
         #size-cells = <0>;

         i2c-mux@70 {
             compatible = "nxp,pca9548";
             reg = <0x70>;
             #address-cells = <1>;
             #size-cells = <0>;

             i2c@3 {
                 #address-cells = <1>;
                 #size-cells = <0>;
                 reg = <3>;

                 gpio@20 {
                     compatible = "nxp,pca9555";
                     gpio-controller;
                     #gpio-cells = <2>;
                     reg = <0x20>;
                 };
             };
             i2c@4 {
                 #address-cells = <1>;
                 #size-cells = <0>;
                 reg = <4>;

                 gpio@20 {
                     compatible = "nxp,pca9555";
                     gpio-controller;
                     #gpio-cells = <2>;
                     reg = <0x20>;
                 };
             };
         };
     };
"""

"mux core" here would refer to i2c-mux@70, "mux device"/"mux" i2c@3 or 
i2c@4. E.g. when I'm saying "in mux 3", I'm talking about i2c@3 here.

For me a driver instance is a device, so "mux driver instance" would be 
a "mux device". Ah... naming is hard. Anyway, up to you, I just wanted 
to make sure we're talking about the same thing and there's no confusion 
here.

[...]
> I also wonder if that second condition (...->type == &i2c_client_type) should
> be a WARN_ON_ONCE? I don't see how the flag can be set sanely on an adapter
> that is not itself an I2C client. Can it?
> 

Agreed, good suggestion here... Though... 
https://lwn.net/Articles/969923/ it seems new additions of WARN_ON are 
now discouraged? Not looking to start a discussion here about whether 
WARN_ON is good or bad, merely pointing at this if it was missed somehow.

>> +
>> +		if (!quirks)
>> +			return -ENOMEM;
>> +
>> +		if (parent->quirks)
>> +			memcpy(quirks, parent->quirks, sizeof(*quirks));
>> +
>> +		quirks->flags |= I2C_AQ_SKIP_ADDR_CHECK;
>> +		quirks->skip_addr_in_parent = client->addr;
>> +		priv->adap.quirks = quirks;
> 
> The I2C_AQ_SKIP_ADDR_CHECK flag should probably not be propagated?
> 

Oh... you mean if we have a mux on an i2c adapter of a mux and the 
adapters handled by the parent mux have SKIP_ADDR set and we don't want 
the adapters handled by the leaf mux to have this flag as well? Is that 
what you meant?

Cheers,
Quentin


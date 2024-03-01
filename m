Return-Path: <linux-i2c+bounces-2086-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5216586DCEF
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 09:22:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD0E528460D
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 08:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9AAA69D23;
	Fri,  1 Mar 2024 08:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="M3r49CYv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2078.outbound.protection.outlook.com [40.107.6.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D609B69D0B;
	Fri,  1 Mar 2024 08:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.6.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709281331; cv=fail; b=jTRJzYSjK9PNSDtVuiLrujjYq8IhFtJuJS4ZRb1wGpztuiah6scktIr++745tr+xXoDFifnYtRsLihtORE6ojmtXujjrwPfIxY4xlA0uwlesquIC6TScMbAzQ1ftn9lvwNxBHgR6ZuD4mrAPLG7xe7/5l7D8EO+KdIB7ea/ueq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709281331; c=relaxed/simple;
	bh=p//E2pAk2DX8OpnH5PPTvkUtNDx7EjmQAMzvelCQNAQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NT8px6kmAy1PaP42jDCTEwGlBfaCjcCsS8UcxiPgf/6sVZ+Bl0dXhjCziCbW/7t0JZvSOGAgRipvTteQ3Drg38jZLCYYsQEa1dD8PDZ1crkPjBcmY88A+vq5qb8paSlS1c1v1d/PAx8YVbaruUmkeqE9ebY4ECp8CmJ+WeorkHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=M3r49CYv; arc=fail smtp.client-ip=40.107.6.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UoP0k7Ycrrc6ter34Xunz3Vnq/5ClRlTwZ/hniThT4OnOH4MriI3aTr4vSX0k29AnebtKJ8QSsu3E6+QTdkRwCNWUp1MimEezdL5YV977AMT0M8c40gqgrnydPvRJ5/mGKRx9BP+hHHripuHFQ6Wz5uwAx6/gzgfILAHaUY+7SzQnz2eNWoDvPRgVju41XwQC3QkLXm31QmW1rzgnwwn0rRjytwRJSs3ottGehlea6dhYD2I4fKhLOds0SG7n9DkpNJB4nBmu35cbZLOIrEX5QX6PLQb5Ab6oGrnUlQhVXWfZjyi6FaI/NQy8+qlkOgZFZOkyU9mf6NND+4IEsDC5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p//E2pAk2DX8OpnH5PPTvkUtNDx7EjmQAMzvelCQNAQ=;
 b=EOrdM6zhK1vZWTJKrr3ujy08fq8zU9t/Fsd+JfBpSM3ErStKaRHsMF0GO5GXOlb5lE/U3PUAsfhSoYv9QS1lyKGr+N9/kp53u1wgHxE0NhQDHSFHdiKsMGwAxWILEV6VhzwIPEo+FHP55iMr9ZNclw1rq/MhfkUbaMFKO8/8S9aTUP/iQTOo9Bj7xsu5puEMmBAHMv6VOskER4ewyx3wGAVJruloRXibqy3UfFavIeN+tseItqqOR+NcSvQjk1lUplEOpZXigpU7MBOWNwh/SBIMoX1gwV0aklUf0m6igEqUa6pno2ZfCWlOkqzB0soTgEywDaxreMoMZUjXH1GwzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p//E2pAk2DX8OpnH5PPTvkUtNDx7EjmQAMzvelCQNAQ=;
 b=M3r49CYvSmru8W+se0IHA5uZT0jtwovo50twEOycC0ktOcThagUze77Pxh6oEAoF4/4Hp4a14sNfy3byNTNjD8E8PeEeSFYihcKwB6r7AlvY0A5eh4VtSpXkMhxJVZ7MvPFvzBHmZi5lnYvBowK2K3Lt3Rn8jATw9VHX4zTpGDk=
Received: from DU0PR04MB9299.eurprd04.prod.outlook.com (2603:10a6:10:356::7)
 by AS8PR04MB8722.eurprd04.prod.outlook.com (2603:10a6:20b:429::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.32; Fri, 1 Mar
 2024 08:22:07 +0000
Received: from DU0PR04MB9299.eurprd04.prod.outlook.com
 ([fe80::57dc:31d2:381a:df71]) by DU0PR04MB9299.eurprd04.prod.outlook.com
 ([fe80::57dc:31d2:381a:df71%4]) with mapi id 15.20.7339.031; Fri, 1 Mar 2024
 08:22:07 +0000
From: Aisheng Dong <aisheng.dong@nxp.com>
To: Carlos Song <carlos.song@nxp.com>, "andi.shyti@kernel.org"
	<andi.shyti@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>
CC: Clark Wang <xiaoning.wang@nxp.com>, Bough Chen <haibo.chen@nxp.com>,
	dl-linux-imx <linux-imx@nxp.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH] i2c: imx-lpi2c: add generic GPIO recovery for LPI2C
Thread-Topic: [PATCH] i2c: imx-lpi2c: add generic GPIO recovery for LPI2C
Thread-Index: AQHaaHhA3Q+ddE7o30Wcnju6NOftJrEihqVw
Date: Fri, 1 Mar 2024 08:22:07 +0000
Message-ID:
 <DU0PR04MB9299F31971DA6224F4C35D92805E2@DU0PR04MB9299.eurprd04.prod.outlook.com>
References: <20240226055418.3314913-1-carlos.song@nxp.com>
In-Reply-To: <20240226055418.3314913-1-carlos.song@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9299:EE_|AS8PR04MB8722:EE_
x-ms-office365-filtering-correlation-id: 9c826b5b-9b86-413a-63c5-08dc39c8aef7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 cxR++tU1JkMIQQ6s0IWdV3vOflB1LWK3VAD/gs1jptP7q5DmKI6immbBoyPFYsWUvJgKR6TWpUGXFRGk3LswZBaHgyMJb2qpg0Gn9Skrdipc+MmXLP63U+NmmMCakNLzkFtEbJfBrvM8+X8kVtO0tnkDfHNlZWMjVuWFNhMpzLki9wLZfBc/oHVALiYO98pQs8hVF5KRd148psVaGcg7TSDhO0x+wNLuZYOwZaVFu8g18rPCmT2sJhcMNHIYfBwhBVE2ZpvXHi1yQF5ifDgbx0z45yfw0Xhar1syESKWX/dUKcb0ocdnEX8qbTc7G2LOg0fnKZrot8KbhnWMvdQSH6FRdvQ/d8ieNfA4exttoSAtZvG4H/T4S44wjdhKxzbHC+1FF6fUNiCE8O0GTXjkVcJUESaErQ4pjQuEY4lVya5VfWH8xDdG6CiL0yNqkggCIvzlSUIsylQFgbPhwoQfPhMpZ1TVVTtMbmp4l1W8enGCe/thsuDtte4l+2ODR8hwnqC2tlDw+oVLor7T8aSMKqkTsiycpDVG7SbICEf7edNdHhPStLrpDMGW9YDVQsyIVM+7Vt2nFebtOntRhvC1BR/m474UDGBmLEYP9YxexJGjADda+XfAEgPQyYihAEXgX081gX5iP3RTSOftqai5f3VTcoOc/MKc4EkM+2I/gKhLDG0Y2ZWdNUl5e7q441pt0T1cwfm91yHi0IyM7B/19DydbuE8gHWaS7fSYd1+4F8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9299.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?UmNDcXNKNVloeTRBV2Jxb2x0R0trOW04TURWTWEzWVZvdXFPZ0tYRDVlT3FS?=
 =?gb2312?B?ekIrT3k1MjBPNkZXSTFNbzRlQjFmVzRwQVRaNkVkeHhvZ3dscHhMUERLd1BK?=
 =?gb2312?B?ZlZwOEw3ZlRIWHhMNXRnWWZwaEYwQldqS3ZzcmMra3BSWExsRGtxWkhKT3NC?=
 =?gb2312?B?RjJxZERoTmh0R083UXByWG1xUkMvZGg4c3JqcVZPTFN4ZUZ6b0FTMVM5aVRD?=
 =?gb2312?B?a1kwL0VFc2hrbzRnOU1Ud3o4elNSblpoOExaWHRzS3ZPWm53OVVJbDIvZ0tq?=
 =?gb2312?B?S1VsMkp6cVBSbkp6MzZpQ3RkcFhUaXBOSEZTYXdVOGpuY0xFSk5GM0c3M2dL?=
 =?gb2312?B?aVVrWjcxNmZLZHpIRFNJZ0hjaWt4R3J5QWloSTA1ZjFPWUMwcGlGZjNNKzNX?=
 =?gb2312?B?ZmdSOG1VS1huNlBodUt3VTdTWmdEczY1bmNGTklIK2x6QjlkTmxHNWFGcFVM?=
 =?gb2312?B?SS9YdUdRWmNXMWZqMGxuTWVKcVNLdFhWUWsrOHhmWHZzY3JyRXlaSTExVFRk?=
 =?gb2312?B?THJRc3dCWlF2cXFESkR0MXU3a3I4bHRmZldxRFZaVFNQMTUyMkVkN213RkpX?=
 =?gb2312?B?dTl5aTBPMGlYQjdSOGNlWWdpOTdNOXNVQmFOWGRzK3VOa3JRMWlqMUpQaDJ3?=
 =?gb2312?B?K1RJaTBxeERjYThTdkp4bENXYURWNkZSOHhtSWRBdDUwbkl4WkM3WEhnUUZt?=
 =?gb2312?B?NDBLUGNrajM2QVB1SXhFdVJFUDI3VG53bFpYMDlWZEFnaFZlTWN1TlBtTW5S?=
 =?gb2312?B?U21vOVFaaEYwNlR2dU54Y3pJR0ErMVJ4aWVnUndkOXdrdTFzN1JMOXJ5M3pl?=
 =?gb2312?B?d3JoTnpEZ2xGYUNOT3Njb3VZQ0JSaXEzejdwMDJ6OWN0S3FCNmtURkU5Mm9V?=
 =?gb2312?B?d2xSZFVxSGRNZXZGdlBmeXZRQUU4RDNKMHJzbDlhR200S21JZDcrdWRYSDRk?=
 =?gb2312?B?L2FVeHFYUnE2NFVUWFFNRVBsb2VIaXhNb1paOVJaYytQK0JuMkxpck5ESTJP?=
 =?gb2312?B?bEt3bDliYlJQMkRTZEpCb05VUmNoWDRFTDFFU01jempXV0toYWRiL0MvcGpQ?=
 =?gb2312?B?Yll2QTU0TnBXcFg5aHUwY3NEOEh3Uzh1MHU4dTFHNjF6Nm9ROG5sam9lSkps?=
 =?gb2312?B?anZ3Q29lUHFpdEZWdVhJU29vTlJYZ3Iyamp6NjhPdEI4d0R2VG1yc2lnNWxN?=
 =?gb2312?B?bHJKbStiMDVxdmhRZnE0cGU5MnZVMUlZdjBXL0toczFhdm9GOStTcGlyRk1Q?=
 =?gb2312?B?akpjbjg3MldqYiswd1B3MHd4OTJrN2J1Y0J5N1J0Wnd2Z0hxZUgwNUxsUDJ0?=
 =?gb2312?B?RGNGSWwrTTdSMVB2WStkWEYraTJKQWQybVYrQytVbUNMN2pYNnMydlZRT1VW?=
 =?gb2312?B?OERxdTMxNjErYS9PMjZBa1dqL1J2VFFxbVBJMFVnSERnZG5oVkFsWjFhblFu?=
 =?gb2312?B?bXI0Q0hqbXVVNjdJMXVUeW4vcGtOaWFJTWRWd05nQTVPYUU4YnZiSjl1T1lx?=
 =?gb2312?B?WC8rUUg0bytPR0FmKzFmQ0pCME4xcVQzUXloRG8wZ3Y0MFRUTGZDcHFsd0xi?=
 =?gb2312?B?Qmg2dm13WUsyZGFzQktkV2NxN1lubmNKM2lmYXhWYzVkRjdSQ0ltbktqaXk4?=
 =?gb2312?B?Q0lrQlhQRXZMN0w5bGg3T0Yxa0pLU0ZoVjNHK1dndkJXUDVLNnYyZXZIa3pl?=
 =?gb2312?B?Vmx1MTV2cXdmVGZNVFhVN0Urdm55YWh4Njd5UlJqNDYyTCs4Lzh3ZXg5Q0hy?=
 =?gb2312?B?ak40U3FwYTY5TUZYcGJqS3hzODd2TmFrNHpxM3YzZElVNFpoQUhDdmQvbkVm?=
 =?gb2312?B?RGpFSWJya2RVMklOZ3hyeVNzTWlXTFFJaGRoL2tpS01wdDI5OU5Jb2ZwYlQx?=
 =?gb2312?B?V05GcHNUdzRna29HOHFJYkhzaVR0SjY4Z1FxNHNiU1pNQW91Rnd5a0NTZnJ5?=
 =?gb2312?B?VE9Rc0thSkJ2aFhtb2M1UFZkdnFuaTRHWFFZWVpQNU5HbkFRWUhFN3VRZFQw?=
 =?gb2312?B?VEFPeUZFZFBHOWg2SnUyeldGemxoS2tmWXJOZGs3R1R0L0wvMElUWnlhWU5L?=
 =?gb2312?B?SzRWcVhBM3RlMzhsdEhldmRLcXg2b2o3ZVJ5b1UzNHFKSFVJYjA5dUlTNTlk?=
 =?gb2312?Q?8uY/2AYAPr9th1Hv7FG3t6FAC?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9299.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c826b5b-9b86-413a-63c5-08dc39c8aef7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2024 08:22:07.1048
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VXluioMJ0bibZLJ0Q8TqvhERAhs4b+x3vr1sOPzwkTl2uNT9GCt5VIVB7/8+IhyZtxJYZ83ykaqRvVlnIxXKog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8722

PiBGcm9tOiBDYXJsb3MgU29uZyA8Y2FybG9zLnNvbmdAbnhwLmNvbT4NCj4gU2VudDogMjAyNMTq
MtTCMjbI1SAxMzo1NA0KPiANCj4gVGhpcyBhZGRzIGkyYyBidXMgcmVjb3ZlcnkgdG8gdGhlIGxw
aTJjIGRyaXZlci4NCj4gDQo+IFVzZXMgdGhlIGdlbmVyaWMgcmVjb3ZlcnkgZnVuY3Rpb24gc2V0
dGluZyB0aGUgU0NML1NEQSBwYWRzIGFzIEdQSU8gcGlucyBhbmQNCj4gc2VuZGluZyA5IGNsb2Nr
cyB0byB0cnkgYW5kIHJlY292ZXIgdGhlIGJ1cy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IENhcmxv
cyBTb25nIDxjYXJsb3Muc29uZ0BueHAuY29tPg0KPiBSZXZpZXdlZC1ieTogQ2xhcmsgV2FuZyA8
eGlhb25pbmcud2FuZ0BueHAuY29tPg0KDQpSZXZpZXdlZC1ieTogRG9uZyBBaXNoZW5nIDxhaXNo
ZW5nLmRvbmdAbnhwLmNvbT4NCg0KUmVnYXJkcw0KQWlzaGVuZw0K


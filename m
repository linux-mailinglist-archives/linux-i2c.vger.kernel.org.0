Return-Path: <linux-i2c+bounces-8012-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B70F9D073E
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Nov 2024 01:26:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04F531F218E4
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Nov 2024 00:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C464C62;
	Mon, 18 Nov 2024 00:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="kO/RE9oh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2093.outbound.protection.outlook.com [40.107.255.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471561C27;
	Mon, 18 Nov 2024 00:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731889568; cv=fail; b=qqQBHwsDP8Un05ePFN7dhBkYvO4VwUD8oGF44bSMGPD9u1p2v7YmrxA1XSWXDym4j8I+OSJ492XBn4VJ7Jsn3AVQTJwr/CLr8xIRBri/pQovxI6eIF6WhJTk1Y8PHDLWaMjqam6eAiNXFQGkkKI3IsvhVdKiPcJblXN3WzlajgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731889568; c=relaxed/simple;
	bh=j9I4Yd2jLHbdImzx9+gl+Glpc2DGYlaaBPMhDVJakg4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cS3IYAZDSsxx3lBihHyRw9A//7wjfl4joE2IFT7rYNbOfIw8+i88wOIF522ircXk5KwbpH6htBeXx0agaQWI/szDfW1pHHFM9+AKU7EadsbqjFpuXylHKs8/tKqZOOrBsj0joogsma5LIimyS2OfU4+uSoDXBkTdjlyDMxczJks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=kO/RE9oh; arc=fail smtp.client-ip=40.107.255.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L9g4ecVeRjuxwF0U3wLfcNy2jVg/nIUz31FBZzu7ka2kStbL2B9RhLRAo4kkhL9qaBc3qhfQgIlLpcOAG9c0SIFMqyHyt8CmNL2CsU1mbBAASs8kRCtSizp2a0t8hRaHdZeXb1RJYoucS+Mk+Fc3BEOsoON6FtBlN0abvhtTSEhIiLmdAVWesjwJtx0zxx0M90wtOKPOnvSYBkgJCoc0MXfZpKFTg9HmYvdlaCsOA+AAzSBxrRQqt+o+mBvpvrl+SDf6Aqjh6mtQml2jzTBCsfdR1UveGCftjPwHcS2YG8s2/QFQac6aMORi1nGWQ+dUkq+adf4frSu0ZsjesQ8xJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9I4Yd2jLHbdImzx9+gl+Glpc2DGYlaaBPMhDVJakg4=;
 b=BmFufhAGbe/8VME7FNXLYCm2q2ZxUw9tfVl9puLy3iAODjLiJBH17O4NAQbk4++0TtI7xw/KKHG4rDOG0jk8nqzsfZJJC9qmSNwGmttkyfsGSTMo0+caGE0KrGWMG2qUVGUG1h5JQrQktWdZbRA9Qd8qVtWFRN7uSY3SzqgeUaINbzN2AzfrEINP82VOy5CIYPuFPYmvwoQ/VySR9ndnKTn2g/RndBNqrX1m+phpXlLUaIiqzDXx9+DTKhq9QE1KQ1u05hVWyYL9aomfRWFGMXPPOo+R7VHPIePSBxet7TMnqqw6i7mpRKTplOKaS12QasfjPyK0pxoxB1rNZT6Wpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9I4Yd2jLHbdImzx9+gl+Glpc2DGYlaaBPMhDVJakg4=;
 b=kO/RE9ohmqHjdVm2GdajAmCnaCdea3m2gwMMDu+PPhBR/zmDtkHszisFssoD3W9Ms9YoF5frsFeKfD0yc6oZs7qbmW44/OpAzNSG/xHoZyJhJu78r21tHJ7a87ijeuB6KSznAlqIK3+h8zPsCYQEAiVazoSWTgNCgaJTORIa7JV26uwBdoO8nJLKqt6rE9fRQH3YTE8SAwn9suUS9oDwjqxfD3BH/rZq2FCWY386T1swjJa59Phu4Ul4EfCTiCntVCrLaHW+pxYn+kYWCeOt6wX99FFhsvCEfNSay7E8UqPR1WVXwvUHQhPwHY2awXkXNeQmU2uQj4xUDFXfnwieug==
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com (2603:1096:604:2b1::11)
 by TYZPR06MB6568.apcprd06.prod.outlook.com (2603:1096:400:45f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Mon, 18 Nov
 2024 00:25:56 +0000
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11]) by OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11%6]) with mapi id 15.20.8158.017; Mon, 18 Nov 2024
 00:25:56 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Brendan Higgins
	<brendanhiggins@google.com>
CC: Tommy Huang <tommy_huang@aspeedtech.com>, "benh@kernel.crashing.org"
	<benh@kernel.crashing.org>, "joel@jms.id.au" <joel@jms.id.au>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>, "wsa@kernel.org"
	<wsa@kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, BMC-SW
	<BMC-SW@aspeedtech.com>, "brendan.higgins@linux.dev"
	<brendan.higgins@linux.dev>
Subject: RE: [RFC v1] MAINTAINERS: transfer i2c-aspeed maintainership from
 Brendan to Ryan
Thread-Topic: [RFC v1] MAINTAINERS: transfer i2c-aspeed maintainership from
 Brendan to Ryan
Thread-Index: AQHbNxjuAA4NcQwuWk6L3G8oF+autbK4DTOAgAQlLkA=
Date: Mon, 18 Nov 2024 00:25:56 +0000
Message-ID:
 <OS8PR06MB75413EC87F76AD0B1BBA0FEFF2272@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20241115044303.50877-1-brendanhiggins@google.com>
 <ZzcPJ9sweqxLZOGf@ninjato>
In-Reply-To: <ZzcPJ9sweqxLZOGf@ninjato>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS8PR06MB7541:EE_|TYZPR06MB6568:EE_
x-ms-office365-filtering-correlation-id: 4a2cf2ce-f2dc-43eb-6ca3-08dd076791d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?gEImqF9sxfFsk59FVJNxaZ8bEP899YPzO/LaYbd23D3jqt9402od3B9ccJCo?=
 =?us-ascii?Q?+hwvk3+nwKu3SFBP37C6gBH95bI9niPu9epZDPo4bhqNUuwybkMs9PtaZxkl?=
 =?us-ascii?Q?vus/psgdJC+1/4TCYyDv/y/eoBTyueVj8OQaet+8XHuv9PDbCgdh1qUExT91?=
 =?us-ascii?Q?d/1d0n0LXuHpv3VM936B5ngi5GasRXRsyZNIwFfxakgJCOxe5hYTB25AlcRb?=
 =?us-ascii?Q?L6DjgvU7ShHHgWPZwmqvhDUF/Nbb3eyJTyIDXCUdU0QezObMhbSH/RfxkZ2+?=
 =?us-ascii?Q?IQ7dvHPDvbj9FtsfiP4BNqF3wGm02N7/flfTFPFD63IbJh545hMw3N3sdMnu?=
 =?us-ascii?Q?LYYB3Tu5MCgjm/v4ueRbqTMCHXxDoMMA74qyBOcqRVKlZNyV7IFbnNy/g07v?=
 =?us-ascii?Q?7qo46H2922ZpyIeuPIBYBRH4Dwx60O+U7VgPGEhaZZXWBK/SlG8dBLYSyNrl?=
 =?us-ascii?Q?WEIdPLrRgq8gUXJ1qVG0+3EhsBBEjFs17wat0ftKPmK/mjdcTaDBttiIrr0S?=
 =?us-ascii?Q?bWFC+oBTmK7IabXYlFYWgyTaJ7/1rGWnqyvdTHkaJl0fZYbqumEXWBXGy+4w?=
 =?us-ascii?Q?VYXn1JLy4miMgeAglsRrpTM2Il30EgJrzs/d+Us3NBllty+d6VPvVcc7c1O1?=
 =?us-ascii?Q?QYzhfNUNQ4HIB106zd12aWpHFGUgsIhgJ8xGAJAD7nJRNsqQ42LbwVzcStDg?=
 =?us-ascii?Q?jd496NSsGZnJrJvSEbufb0cVRrxnDDklapoKbMF2nYFBXtNWn4vdobeGGM7D?=
 =?us-ascii?Q?S5voG5AUAhP8F6vIOs5gVNnZkMpzcNeaWF0aHf3OoYSGsPiQ7PaCD2JLpdu9?=
 =?us-ascii?Q?FZEb1qh23rXLgia8cd0vOoKOs8noscFdwyY76fNPBxoU8qQu27343YT+pi6k?=
 =?us-ascii?Q?sX/HYuejJLLv5jvILZqpJYOAQCCE80FQaY4r2IdmgSTVf3lfcBogMqn/MqrK?=
 =?us-ascii?Q?M2hLoltJdYd3X1G7ok0zC42Y/gip59XZ6cYsXJO6C2fkXvKTGBKP8PqRNKI4?=
 =?us-ascii?Q?g773HC93qFRMpOkBImaZXkIC7bIieOYNl+O4V16ZKW0qkEIBF+ayfBWCXdl2?=
 =?us-ascii?Q?PVtpIkvz7mOXnlIgOG/tDugDBsB/2SsZlwrbDpBRJjdV7kv9bd/N/PhHSZr+?=
 =?us-ascii?Q?pOwVRsH/h5ouL7xtk85teQjYDS70ONQnbujk7GXSKJRaO9G9RDYEHWsdVDCN?=
 =?us-ascii?Q?wFgFK7sXI5dilkko93BwnfaRZFSeme5pcEM6Iv/1zitiFTlvXrPoLM7puRqz?=
 =?us-ascii?Q?u4d5snvD5WUa/Xp9CMLQClRnhEsNLlKhFnPwym3oGIfxggBFKLuyH1yIL7Qr?=
 =?us-ascii?Q?6LsMeRtEEB3sSLXF1dO2oobQNkwNhZ3eK+WeJ5wUaVYhsDDUTwVc/uXuU9YJ?=
 =?us-ascii?Q?I89lI+E=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7541.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?vdbp+/KY9Z6X8Q1Cq/SZ0woPbUoHBoxG9ORV6Z2lBcrWEGHkdJvyQ6b34EC6?=
 =?us-ascii?Q?3FfNYL1ffLFxQ+DlkhSGP0N6ezEAC1Y47JsWNuuX6AmUc79ucjYNOuG1ZM9r?=
 =?us-ascii?Q?rqrxdw40qoTevbACkgw5Nwvt5OjJev9L+og/smOmC6AGllneNSzqCL2DxJT7?=
 =?us-ascii?Q?qY9oifg0cuhZj1DaeS6voqMcCQn+K+HOcsRdMQdjUfPqUPcwwqsSRyA24NtQ?=
 =?us-ascii?Q?3SZo4pPvhwby1BHj1m7ru3R3D9a4gyooWO6P3khJIK/fwR3MHnqckDQQyhtf?=
 =?us-ascii?Q?m8/NP85OucVnUMDJA07Ng6++zAUQiTi+OIN06lJFthcvWUHs0nzMgmrSF6lu?=
 =?us-ascii?Q?y2ognzH4fEdbnOtSY3pLNxE9N2kt8JY/0AhSAazzQT2DiL6sTI4fc4qHdjYU?=
 =?us-ascii?Q?8zt2dah7N8VpZD5Hr3sgOWjf0CvE/5VE4JTGjX4be0YCmNaJEwxu3UbWV0tp?=
 =?us-ascii?Q?ZJu9ni+Y10PYl8QifPHZMV2a9agYUWNCn/cHnx7mO89nWlLA8Zrsrlt3GrT4?=
 =?us-ascii?Q?KDuEsThVwvh46eKvnHGvUZWuvqIiX7KbNOQuetuOHP83lVq0a6ONmyCEPOty?=
 =?us-ascii?Q?hkYNpkkFzNpQQ3QsiZlrFarUvKs1Ra1YO23bKm1AiQx+/SCimL889fAKE5Oc?=
 =?us-ascii?Q?kXY9DhWsSxwC06df88Z5nycAe5c/2Kja+oLkM7aoaDW6AERDQAdQdDKqlVZi?=
 =?us-ascii?Q?0QfLWq6E0ze2yjcibjiW4SZqpWpF1ELLz8Pwd3UZpVlh4ZHDGKk47U6Vuv00?=
 =?us-ascii?Q?ozOCodOuISJ523Mnvg/GEB0qipjGsjrFqInD69QCuKVex0KdmTP8UMV11Tr1?=
 =?us-ascii?Q?uF1cpufo5Fu5P680dHW4/S+bscuSfknAT1tRYQ+6V5Sr7sCTQC97QoQS2mYk?=
 =?us-ascii?Q?1wW9F15ZhVH+svrOKg1/aRgutnIp3XfWllobX/KdJucEa4Ayas2En4BosHAk?=
 =?us-ascii?Q?QiUp69YVahjOaOjkTJhAHWO5ZoCkucNxOhjgcqNCYQJBdQYKgJTcKKkIV7TP?=
 =?us-ascii?Q?DD32mQQbhUI02nPGU/kQxKXxYxjY0izmwkVME04PWlWUfVDv26pNdnApukR8?=
 =?us-ascii?Q?GePw6/hsB8iMGY0ku65nXt1qflaDkl0I4oGFfRqelW5ngVNYaOt49k7hUpZw?=
 =?us-ascii?Q?gdvDlUYTQQ2y/Ef7L2hOG5sFJdnO5SHQ5UZfRgbRaTDrRU3FoVzESflkYbZv?=
 =?us-ascii?Q?dd0fzYKQdFQu26PrgcdmTJ/4UP1lbNzwu9Zuau61YJdljSVQU0UsQ84gp4i1?=
 =?us-ascii?Q?5NW0wyI59Nuou7a68EVk7krn+jBfhotybPW2/wyBMdeklXckMvkMmMIlog1v?=
 =?us-ascii?Q?jKTN2FD/Z4+aiwHC6qUR+R+esuv49vpjfIG3Gv1ufeLrtkK5MgUQChsf76p3?=
 =?us-ascii?Q?2oFPJTEXyffhjO2lBekwKNbjk3F2pbgl1zZhg4faP9azYlx2jWGOyfwiU/2A?=
 =?us-ascii?Q?+zQYGZpiQrqKMpfBXWa2QKhKELlsCUBC5txo+NMKuq4OT70X8JCve9Md5Bjk?=
 =?us-ascii?Q?splphXW2qQMFuysuhFjWLe8Jb6T94dKWlNvXK8I7t3R5qxzrFMGOkIclbR0q?=
 =?us-ascii?Q?4R1BH5zC10c4MtrvhVIOxdyj870JRyejCO6JZyNH?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7541.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a2cf2ce-f2dc-43eb-6ca3-08dd076791d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2024 00:25:56.5827
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iIfu94YBbIgn71Xh3dJppwmzdyXTTPB7K+734nZqthW7iSerrrfW8tpDlZqiQ2bvGHe8gaLkdMC3vfbXbGO8GPAz8A5sYFigmJiU72zcDmw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6568

> Subject: Re: [RFC v1] MAINTAINERS: transfer i2c-aspeed maintainership fro=
m
> Brendan to Ryan
>=20
> On Fri, Nov 15, 2024 at 04:43:03AM +0000, Brendan Higgins wrote:
> > Remove Brendan Higgins <brendanhiggins@google.com> from i2c-aspeed
> > entry and replace with Ryan Chen <ryan_chen@aspeedtech.com>.
> >
> > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> > ---
> > I am leaving Google and am going through and cleaning up my
> > @google.com
>=20
> Thanks for your work on this driver.
>=20
> > address in the relevant places. I was just going to remove myself from
> > the ASPEED I2C DRIVER since I haven't been paying attention to it, but
> > then I saw Ryan is adding a file for the I2C functions on 2600, which
> > made my think: Should I replace myself with Ryan as the maintainer?
> >
> > I see that I am the only person actually listed as the maintainer at
> > the moment, and I don't want to leave this in an unmaintained state.
> > What does everyone think? Are we cool with Ryan as the new maintainer?
>=20
> I am fine, depends on Ryan as far as I am concerned.
Thanks a lot, Brendan.
I am ok to be a maintainer.


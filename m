Return-Path: <linux-i2c+bounces-448-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAED57F7209
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Nov 2023 11:49:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 096B71C20FFF
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Nov 2023 10:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DDA71774E;
	Fri, 24 Nov 2023 10:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="DTEpdxlD";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="AD1Q/7hs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51B0F12B;
	Fri, 24 Nov 2023 02:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1700822989; x=1732358989;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=th0a/IM/E3N4NpY+rw5e9YjCGD/3G14B3/UBxfBwu4k=;
  b=DTEpdxlDkMhPfuhiGOskWShhAfnaRH91v91IHNlyCt+URbCcf9eX9Ifd
   Rnw943nC3z7Z+FapNAnXXJe1mhtCIhg0Be+qlw8N83gGNdQST80r/9TWt
   kRJOISxVGemYg2Xcew7Y3m/jlwyWT799HoT9dbTsIyUyy2ntlq0zDhxvS
   ZK+896Pbzf86AItotZeFR8bjJMxPnE19swLG9bnuSHGY4hLTlBSvbLvuE
   FvwKyS7/3JQC/ilOcYvVjZowcDT7Vr6/Zi8p9P7Ako/XXOxGFWANpYRj3
   cCHZSgImJkEeduX4MJ7IDt1bmwMQ90mxdadxsxZYoHLLCgz47xhDWXPQe
   w==;
X-CSE-ConnectionGUID: DdC8MpPDTqOIZZL1Nqi2lw==
X-CSE-MsgGUID: 9bd5w8zyQVS2DFUdZwgmfQ==
X-IronPort-AV: E=Sophos;i="6.04,223,1695657600"; 
   d="scan'208";a="3189933"
Received: from mail-co1nam11lp2168.outbound.protection.outlook.com (HELO NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.168])
  by ob1.hgst.iphmx.com with ESMTP; 24 Nov 2023 18:49:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JTTWfIdQ8FllTr92H/vFQSIA7IXSyNbhDuxIIkM2sfweQPRZwZRruTwbu4RgD5Ap+n4E4P+laQVRaGh0ldMWjY+PlPlqDEw8TFB1CQiEesUV9eYauwj50wn1uzliUUKipjqkui49esuizTatKVCRl0+boWq42OZ0a0WjHJmRnpySgnIWVIBskSrpUN7qTFu2MAeLDIMJYW8hoyGuq8lyyT6if32NRt8iW1h8lRvmf9qtZiTc7MH1CpNR970h1dJ5GAB7Gwmv9Zkl+nXbBJFfCRQQt0DZYFG7NrZsBTo5oREf7BCzaHFlUxaYqgwIuEcvgH/wTmE6IolkuowUYYAdyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bqcl7CDCwGmKs7vT7jiPB2bFBLgMxAcjzVewbkr1QBA=;
 b=f+gqz/EPsGFGPVac/hbla5koHh6RAGDX9zcNPgw3mptCffvSWNPtIdxI6EJOGK0w2fvWXs9MLyQLcEgDcWyxDx0Boc+iBb2LKJRDLWHj5rH2uLCFAz+S0r/a/VrXbwpty/amVylj4tL2gNHigejrBNZBC/U8D0VlQmJ9UhqtkIdaiFjfyJ5gDwxQtSzE9ut56Xa3HlPPeJJotttfc8507IgtlxORsgwkf0g27IBzcMjF2iSexsQ0ilcPQAvZ3m4yiYz+Lm8M/gM7P4apnSiZaNuVagJlt/PJvpH3DkLnDQYGe4XqYg8UucAwOV0YGFaUbUt5BkGbPD3/agVlAXYclA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bqcl7CDCwGmKs7vT7jiPB2bFBLgMxAcjzVewbkr1QBA=;
 b=AD1Q/7hs82mLUxBjgV6PPJEQ+e7JLfmkpiqCNsdQxXgLW+C6+1AQpIM86LN84+ORq5hPV4N0GqI1v7t44t784ru1snVk5TLt07tASJhqhlZd0gc8EknKc/5ZmylVBAHaYSruB1IArlXoVIu63iKzYVGvkwTN9HUdslGfOHz0Y7s=
Received: from DM8PR04MB8037.namprd04.prod.outlook.com (2603:10b6:8:f::6) by
 DM8PR04MB7959.namprd04.prod.outlook.com (2603:10b6:8:d::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.21; Fri, 24 Nov 2023 10:49:45 +0000
Received: from DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::81a9:5f87:e955:16b4]) by DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::81a9:5f87:e955:16b4%3]) with mapi id 15.20.7025.021; Fri, 24 Nov 2023
 10:49:45 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Lukas Wunner <lukas@wunner.de>, Heiner Kallweit <hkallweit1@gmail.com>,
	Keith Busch <kbusch@kernel.org>, Wolfram Sang <wsa@kernel.org>, Jean Delvare
	<jdelvare@suse.de>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, Bjorn Helgaas
	<bhelgaas@google.com>
Subject: Re: [bug report] lockdep WARN at PCI device rescan
Thread-Topic: [bug report] lockdep WARN at PCI device rescan
Thread-Index:
 AQHaFsdpw8Adedg0CUyhPBScx+2k2LB5mcWAgAAIiICAABWaAIAAQPKAgAAEGACAAB3DgIAPP5sA
Date: Fri, 24 Nov 2023 10:49:45 +0000
Message-ID: <eaawoi5jqrwnzq3scgltqxj47faywztn4lbpkz4haugxvgu5df@koy3qciquklu>
References: <6xb24fjmptxxn5js2fjrrddjae6twex5bjaftwqsuawuqqqydx@7cl3uik5ef6j>
 <ZVNJCxh5vgj22SfQ@shikoro> <ea31480f-2887-41fe-a560-f4bb1103479e@gmail.com>
 <ZVNiUuyHaez8rwL-@smile.fi.intel.com> <20231114155701.GA27547@wunner.de>
 <ZVOcPOlkkBk3Xfm5@smile.fi.intel.com> <ZVO1M2289uvElgOi@smile.fi.intel.com>
In-Reply-To: <ZVO1M2289uvElgOi@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8037:EE_|DM8PR04MB7959:EE_
x-ms-office365-filtering-correlation-id: 606460eb-7f84-4813-318e-08dbecdb1275
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 bFi8n6JQD8EXHOtBtk0ZdLxl19X2tdpvoB0awvLScM8LNf3Vn2k4jeqaxca4wHrBfFC35/PLCscJpBf2Dzs5eAeY4Uw8NordD6AEuMpYAfOm6Yp55DxiN6+ZV1KRwOQY/kcV6Mo6GkAkouqab4uW2nDg5SJTuvZCjHkGIjK2Cu+KwN10MbSB+6+dCK20iaTXGhcjfc0rxt5p7Jbf1G7GU3ECVWBDhJsJq2n2nm2iY5T6Mi4Q+KCya3O8H+8RBb5KMdDwfOuU74+EhWEBllsBsApvjkiyVLCI5kph07MyCEIZJtvG9D0LCc/OgrafokTsmsxa26x0hR0Vud8ZS81m/NNcmvbuualsqAau7WUvxF3ZucjpO/kA14ReudvUsKMgIVolxqetd89dqRfFvFBONIDFOHPoN6ZTinzACowQJbQCl/I2aZy9it5EeyhPFLIZPQvLbxnA2FPlpKZl/l+6XcrGJPI9jl6vpwdAgF01pm5QXoWaQo5WTNYvef//U/1m5jYwGnBddL1paMRHZMc96rQPvMUpe+W4k25gecCQnmiMu8PdkTt0rWWMcu9P2EIXkh8vKRSLhhd0w0Z9YN+Ir+l00ETbLqc4tG/Z/KDPsFeRGPyExvsXQq+satctao+M
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8037.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39860400002)(376002)(396003)(346002)(136003)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(478600001)(38100700002)(5660300002)(6486002)(26005)(33716001)(64756008)(66946007)(6512007)(9686003)(66556008)(66476007)(66446008)(76116006)(91956017)(316002)(6916009)(71200400001)(6506007)(53546011)(38070700009)(54906003)(2906002)(8936002)(8676002)(4326008)(86362001)(82960400001)(44832011)(122000001)(41300700001)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?SYN3EoWrg+kb3vE1Wqq1wl91EjUnMZRbEkkptZGawSkpbIq9XJsf0pkJP2Qh?=
 =?us-ascii?Q?7Jpq2SgbRutmyqs6Uro1M3J1TIuss6rKpaWb1wnGEDXiSVV8kk3a5pfMkmFT?=
 =?us-ascii?Q?Ap0yMaJdr+hHGeL8meaQroQP/oehFunl51pwuYVR7NuHp+NTAqRT/zZ7debl?=
 =?us-ascii?Q?bccd1tX07wrnZ2sGci12fAfuehUE634qDJS6pnJr9owGH+tRjIiMHA30EXF3?=
 =?us-ascii?Q?ec/hd2BS9hYoILOyYkgf8q8HmJZ8gcG+xy2UMMuGrmBQVo4dJgq7+JqPLToN?=
 =?us-ascii?Q?BmnTrfBl7nQTiWIZWRmeWJWpZoy3t9GuXcBDXya2lOC1/XvsQjiAVJCAnpTa?=
 =?us-ascii?Q?OSVRjx6e2v78QgK7b2lb/Yby0G/vze6WPUL5oVdQ8VYmmW7adqZEqxyBoRah?=
 =?us-ascii?Q?BADam1s+1IP5QuPk3DQZQ3MYm20vwo3v0y2i7ZKtQRtO9iIYdWQQZ78m3oMZ?=
 =?us-ascii?Q?VehhNJO1cXy7wFaFl0Q/93DiMUjwnIxJP0Mfd7+TC1xtLWmPFMKp33vDxARU?=
 =?us-ascii?Q?xuTkmDjlS1shr92Mb+7Wnn+6/PIhXBv6x+RUJI9EbpYH+v5ZZybT8Dg/EoVa?=
 =?us-ascii?Q?S7Mm9MSZ1zyMseHJ+L3l5u6HVHSoK2I2+M8hp6jv8uP3wiJ1ByNoVMbSrNC9?=
 =?us-ascii?Q?ZrXV3sVNxmT7Rf+4l14QBfdYGELr+NXBMLhWW8CR00sbY8971B4bt8bGcHdk?=
 =?us-ascii?Q?CNxFGYvCjqFPxflGXpzj3sO8tE+SiG2Y4saJ/Fza0t1MMK5LUnIvRBPs3fAG?=
 =?us-ascii?Q?/qdjNRkzHcyP0xvoWAuWXKhkpAiQFuI9B7V+q17t5ygqzq1PIxrurf8uJ5pX?=
 =?us-ascii?Q?6npy+r22bH06Okhvjtj04Ki808gc7ukg0UkUeh9UUilzQKcuoxPFI669KkHA?=
 =?us-ascii?Q?qJ5Y6dLWbB6Ec9c2u5DwqQ+1YHw3n33qDWrXl3tPhr+46bgLVbfbck7+0A8a?=
 =?us-ascii?Q?0PycTSqLMK5bYobtSICL58NgAtDMYuZVR2iSWHR2T4QBDPrFn1gOB4agvFhI?=
 =?us-ascii?Q?t1FPf9+1J9+xjOJWArjiJkJErMcVchMcBBfAPGefEurqS95pZozSqfK3kjsK?=
 =?us-ascii?Q?Ssj0MIF+Fy3Gu5E9mR48+vpwGoFrs4MfqoQAFCdylTaD4r9kUyx9Hbf+1YF0?=
 =?us-ascii?Q?cTJE3Nq+7TqqyRpElrRZ4TR9igFycD/tLp8Md2OJZJMJhivAnhVVlkkhkRBD?=
 =?us-ascii?Q?5Ln4OugDP8VNN1A5gCIL38AiR8vUJ7fhsVPMm4AQosxsG68zis/mjVm2awYM?=
 =?us-ascii?Q?Rq/DbJKFzswp3DRGE3svl/hMBOw4jr40jByFjeSJrIakm120hAuGEBPnM7ah?=
 =?us-ascii?Q?xPxrmwsP/jouujdpxajbGddiRMjZFhgp+zLfnBEAr+Q/6+YOBvAZJKAwuBTA?=
 =?us-ascii?Q?LVI6NeVieMswyeYZ9y7eo37XBKYHbljyCl6OaEEGvwY3geopuSh4eBR0ORCy?=
 =?us-ascii?Q?ubAo7C1YEx2a7oWk9wOH83zPGqRulp3YKOkIsFUR2NJrnaa8NSyZfGPYWtnU?=
 =?us-ascii?Q?DyYZlJ1/StIqxumccwFoJRjZjXTpyjL8PPEW+AbGFHHlctz5cwTKckwAymqy?=
 =?us-ascii?Q?GqyK4Pr6a6eMfRMBKT+9owhBh9x+LflMDrK4KzArGlpZDZLWXshXQcwZeQW9?=
 =?us-ascii?Q?lP3XR4mVmbYc1fjLfKQdy9Y=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C8854C3CCAF5DE498CF9D3DD60C271AC@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?us-ascii?Q?KyUgdkCVWFqHWAT2MmwH3KbJdMr93lCRkBAMspz3siTY6oTom/5R170uDvJg?=
 =?us-ascii?Q?YQcxCPfKsx2ItM7yM9w4G9GCm8yEvp3nTfaY3apesKYE+eyl6ogdAvFX4VeU?=
 =?us-ascii?Q?Qo0Y5orPfTvaB0cptThcT8uK1sNK12vVM5vqE5I47CaGh5Wrx8MP89uKFjxg?=
 =?us-ascii?Q?sU5BS0XTkhcdGFdanC0WbrvGvfmkxMom/38APV7B2PFcWvUb6ZHjJFn+2zYa?=
 =?us-ascii?Q?5yGvrnhLK/x4E9CIhqYrfK+tkATmcCbMkogg4aXh3J14J/srI+4XR+eRwhpD?=
 =?us-ascii?Q?6ZZcejNvulHhnbX8ooKjQ9QS+Fvm1AT+6odMqrArQnaT0RJzYepk3ylqeHiV?=
 =?us-ascii?Q?55DHtTzNAM0E/sy44mF6nA4qT/MneljstWMjpb6C+uiPWqhkRU7BzkMn1OzJ?=
 =?us-ascii?Q?7Db80cZcCRMM7ZhILmL3zDpZ8gmLNxht1EkBOhqn+V96SORNzbMx443OmvjS?=
 =?us-ascii?Q?ZasS1iH6oxdSVFmDAl6JTH65M6wHALoirS9Y7pbECw8sNpnRzFAQLMY+e9ZB?=
 =?us-ascii?Q?gfPZ+lLNWU9wuy3XmFC0GATB43ZX98rif8DDwQ1LnvkPuL/N5ZAtg9Pdw511?=
 =?us-ascii?Q?aJVhbxOvYnjsRe6ntjFJwSNhBNJOkCZ9ZK9Xgqbrfut3Z59sSfF+70hi2icN?=
 =?us-ascii?Q?73DzBsU8H89cGm1y7iQ7uhslpQpZLj0yrbEYE3wExY3Y9Kh8wT8UYJZYAnBK?=
 =?us-ascii?Q?9jxnnNUZ1SJXSTyVgsxOKIdNa6O7ATxFJ1Zj25PaJ8Zfx+DHXYgIgsjNwoBt?=
 =?us-ascii?Q?GQydEcBQ5PeBVFDgRhARDpD19PJDyV0nsVYpUHi3DbeFq7hOz1vt5TpfSeND?=
 =?us-ascii?Q?j8n10xubPObGuiskHY8aQIA//PV3ocOGN4KkjD8yM+khSpAUp3c9nhhYORXU?=
 =?us-ascii?Q?3GxATvZG8DjVIXPTQSxXAHB2O+UIgctkFBFAIEyO99/ZKt9zn1R7q7/qf9aq?=
 =?us-ascii?Q?TckYTVubiCwuacw8we0Wwg=3D=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8037.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 606460eb-7f84-4813-318e-08dbecdb1275
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2023 10:49:45.4405
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EVbHbrYt/43dz0cCnCyJAF9fQYKIzx0HTiUtoaNKHDpdaX7o+3lXFljflwOl8OYKWAkEQcmHYd7xxRlqmTG75VuMlvnHNmfwnjH8/7w3w4k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB7959

On Nov 14, 2023 / 19:58, Andy Shevchenko wrote:
> On Tue, Nov 14, 2023 at 06:11:40PM +0200, Andy Shevchenko wrote:
> > On Tue, Nov 14, 2023 at 04:57:01PM +0100, Lukas Wunner wrote:
> > > On Tue, Nov 14, 2023 at 02:04:34PM +0200, Andy Shevchenko wrote:
> > > > On Tue, Nov 14, 2023 at 11:47:15AM +0100, Heiner Kallweit wrote:
> > > > > On 14.11.2023 11:16, Wolfram Sang wrote:
> > > > > > On Tue, Nov 14, 2023 at 06:54:29AM +0000, Shinichiro Kawasaki w=
rote:
>=20
> ...
>=20
> > > > > > > The lockdep splat indicates possible deadlock between
> > > > > > > pci_rescan_remove_lock and work_completion lock have deadlock
> > > > > > > possibility.
> > > > > > > In the call stack, I found that the workqueue thread for
> > > > > > > i801_probe() calls p2sb_bar(), which locks pci_rescan_remove_=
lock.
> > > > >=20
> > > > > i801 just uses p2sb_bar(), I don't see any issue in i801. Root ca=
use
> > > > > seems to be in the PCI subsystem. Calling p2sb_bar() from a PCI d=
river
> > > > > probe callback seems to be problematic, nevertheless it's a valid=
 API
> > > > > usage.
> > > >=20
> > > > So, currently I'm lack of (good) ideas and would like to hear other=
 (more
> > > > experienced) PCI developers on how is to address this...
> > >=20
> > > Can you add a p2sb_bar_locked() library call which is used by the
> > > i801 probe path?
> > >=20
> > > Basically rename p2sb_bar() to __p2sb_bar() and add a third parameter
> > > of type boolean which signifies whether it's invoked in locked contex=
t
> > > or not, then call that from p2sb_bar() and p2sb_bar_locked() wrappers=
.
> >=20
> > It may work, I assume. Let me cook the patch.
>=20
> Hmm... But this will open a window when probing phase happens, e.g. durin=
g
> boot time, no? If somebody somehow calls for full rescan, we may end up i=
n
> the situation when P2SB is gone before accessing it in p2sb_bar().
>=20
> Now I'm wondering why simple pci_dev_get() can't be sufficient in the
> p2sb_bar().

All, thanks for the discussion. It looks rather difficult to avoid the WARN=
.

To confirm that the deadlock is for real, I tried to remove i2c-i801 device=
 and
did /sys/bus/pci/rescan with two commands below:

  # echo 1 > /sys/bus/pci/devices/0000\:00\:1f.4/remove
  # echo 1 > /sys/bus/pci/rescan

Then I observed the second command hangs.

I came across another fix idea: assuming the guard by pci_rescan_remove_loc=
k is
required in p2sb_bar(), how about to do trylock? If the mutex can not be lo=
cked,
make the p2sb_bar() call fail. This way, we can avoid the deadlock between
pci_rescan_remove_lock and workqueue completion.

I created a patch below and confirmed it avoided the lockdep WARN. The i2c-=
i801
probe was ok at system boot. When I did the two commands above, I observed =
the
i2c-i801 device probe failed due to trylock failure. But I think it's far b=
etter
than hang.


diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index ed6b7f48736..3e784fb6cd9 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -3312,6 +3312,18 @@ void pci_lock_rescan_remove(void)
 }
 EXPORT_SYMBOL_GPL(pci_lock_rescan_remove);
=20
+/*
+ * Try to acquire pci_rescan_remove_lock. Returns 1 if the mutex
+ * has been acquired successfully, and 0 on contention. Use this
+ * to acquire the lock in workqueue context to avoid potential deadlock
+ * together with work_completion.
+ */
+int pci_trylock_rescan_remove(void)
+{
+	return mutex_trylock(&pci_rescan_remove_lock);
+}
+EXPORT_SYMBOL_GPL(pci_trylock_rescan_remove);
+
 void pci_unlock_rescan_remove(void)
 {
 	mutex_unlock(&pci_rescan_remove_lock);
diff --git a/drivers/platform/x86/p2sb.c b/drivers/platform/x86/p2sb.c
index 1cf2471d54d..7a6bee8abf9 100644
--- a/drivers/platform/x86/p2sb.c
+++ b/drivers/platform/x86/p2sb.c
@@ -113,7 +113,10 @@ int p2sb_bar(struct pci_bus *bus, unsigned int devfn, =
struct resource *mem)
 	 * Prevent concurrent PCI bus scan from seeing the P2SB device and
 	 * removing via sysfs while it is temporarily exposed.
 	 */
-	pci_lock_rescan_remove();
+	if (!pci_trylock_rescan_remove()) {
+		pr_err("P2SB device accessed during PCI rescan");
+		return -EBUSY;
+	}
=20
 	/* Unhide the P2SB device, if needed */
 	pci_bus_read_config_dword(bus, devfn_p2sb, P2SBC, &value);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 60ca768bc86..e6db5096217 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1439,6 +1439,7 @@ void set_pcie_hotplug_bridge(struct pci_dev *pdev);
 unsigned int pci_rescan_bus_bridge_resize(struct pci_dev *bridge);
 unsigned int pci_rescan_bus(struct pci_bus *bus);
 void pci_lock_rescan_remove(void);
+int pci_trylock_rescan_remove(void);
 void pci_unlock_rescan_remove(void);
=20
 /* Vital Product Data routines */
--=20
2.41.0



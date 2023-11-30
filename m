Return-Path: <linux-i2c+bounces-562-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 698A47FE9BF
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Nov 2023 08:31:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C2BA7B20E42
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Nov 2023 07:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F4541F939;
	Thu, 30 Nov 2023 07:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="gmRzovOk";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="wdmLUlhb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 618BDB9;
	Wed, 29 Nov 2023 23:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1701329459; x=1732865459;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=vEPkbqyk4vF1TaQTLYfdhkdhdcjF0rp9VqF/cibYEhc=;
  b=gmRzovOkYgl2OyswlRV3oIKp0Ek8J9KSe7Vjk8h4Hq/Ergc8enOTiQeZ
   6xXZzMaeKx/uFpA1FiGgcBwVP7XH0Fz4srf/MukBeZIu2EyN4xONjN5dh
   kC5jjyNxugrHf5sWT3nZejcq4nLOsLuHHT0pCCqZP2p51a1DQiVb+Wgs8
   N00s6qV2nQupP7Yjk4S3Tycs+EB3XQBH8PGsJdoGyl5g6+K0vCBGP85u0
   0VQnwW5TnGZD/NOuy4RSBGjiXABaDjyLb3iFvZ/h++ch4B/mvQ+nJeAc/
   or9QjepyULBV29XDfVcJImV+UksdOO1rzBS6FPLOA2orPvyVG8H7ir68j
   A==;
X-CSE-ConnectionGUID: RSwiLQe8Q2Wai9C9n+OqDQ==
X-CSE-MsgGUID: 2VGY38RZSfCQBLBqnoNpPA==
X-IronPort-AV: E=Sophos;i="6.04,237,1695657600"; 
   d="scan'208";a="3793303"
Received: from mail-co1nam11lp2169.outbound.protection.outlook.com (HELO NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.169])
  by ob1.hgst.iphmx.com with ESMTP; 30 Nov 2023 15:30:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vf8JfNZiwxdEoByMtUMsBDg2Nf3u5VVKZac9E0ZOvia7ss2eQKcK2NV2lZiddICYC1DiZkIUSnrOvwUI2AA1r3MxuIj7mO/xZLtOpVz3Us0+hxmJe3qih8suTlzZXeSvNPBj7CW7v0d1OKRJPe11m9YlFrdooUlP6sqVvBNTBpMV16/OFqq/0idqcjaKSFGI5bdSUBHGC+D5Bi8RGSw6QkDEDOwO/EqxE3fc2Ex61xscnH7f7UnZfdIMbE0flvm+DqrZLhYyt6y9Wxo9wNJqMh7zZ2u9Vut6Uj34K+LeBCwnKCJbMX90y9eBBOUIHW+kQYTBPoH9lPTC1LG8WwyIEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPDA3bMvYmZoLkd2xbDpjGaOop8GMy+7lMDVFlLeZw8=;
 b=SdzySgY5IDZLknASW/RXL4HfofiGVgUCjwnXW22Ju72oLM8QRRSebrieX76b2AyrvdzraLrO0WGUnwMGAEXjouwEbbZIsjT56LVUhouvoWoZ0jTcfUV79FtGkEacp60eMc4zXFWDfvvHM+7oC2eFtRsmUJW9FFpClyIgcr66Q7uGp6nnp6CsGckk8jb2bUKV1/EB6mTarOyLzREfUbNu9LE3wrTg0eKH65fKI/LYQu37ZWGuvYWO22uvbGpUWWAsSnWYJbMvTVDiaItR+NunehlmwZ906RKQ7sTFYaQDfVzmRcc1qM8ezT7JKgb65cxSoFB0XVqrhtIvicERwKc+fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPDA3bMvYmZoLkd2xbDpjGaOop8GMy+7lMDVFlLeZw8=;
 b=wdmLUlhb8/VF2g24DIZADeNIfvT3nyxhucmIfvCJ6yu/8ykg3x0FccstHF1CNh9Q2BhSEmsXUDLb/dDTqDLM5lSmq2VLrqSSanz5CPurE6iREzxfwa2tV/APLHCIcVd4LriqaGC0jGP+JatVaUWem+TQgOhpnT3zXrzM+xwPFew=
Received: from BN0PR04MB8048.namprd04.prod.outlook.com (2603:10b6:408:15f::17)
 by MW6PR04MB8820.namprd04.prod.outlook.com (2603:10b6:303:244::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Thu, 30 Nov
 2023 07:30:56 +0000
Received: from BN0PR04MB8048.namprd04.prod.outlook.com
 ([fe80::58b4:c149:69dc:1d2d]) by BN0PR04MB8048.namprd04.prod.outlook.com
 ([fe80::58b4:c149:69dc:1d2d%4]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 07:30:56 +0000
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
 AQHaFsdpw8Adedg0CUyhPBScx+2k2LB5mcWAgAAIiICAABWaAIAAQPKAgAAEGACAAB3DgIAPP5sAgABMVoCABcllAIABzbqAgAArvHSAASc/gA==
Date: Thu, 30 Nov 2023 07:30:56 +0000
Message-ID: <rsrhixediftppmm2n7rzciirdpjnymzsn76lffnd4kzovxaf42@5hddblagaytt>
References: <ZVNiUuyHaez8rwL-@smile.fi.intel.com>
 <20231114155701.GA27547@wunner.de> <ZVOcPOlkkBk3Xfm5@smile.fi.intel.com>
 <ZVO1M2289uvElgOi@smile.fi.intel.com>
 <eaawoi5jqrwnzq3scgltqxj47faywztn4lbpkz4haugxvgu5df@koy3qciquklu>
 <ZWC_0eG2UBMKAD3C@smile.fi.intel.com>
 <2vzf5sj76j3p747dfbhnusu5daxzog25io4s7d5uvzvtghvo24@567tghzifylu>
 <20231129111739.GA14152@wunner.de> <ZWdBnMTOq9wIt9L-@smile.fi.intel.com>
 <ZWdCdMtLjZS2mDTQ@smile.fi.intel.com>
In-Reply-To: <ZWdCdMtLjZS2mDTQ@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR04MB8048:EE_|MW6PR04MB8820:EE_
x-ms-office365-filtering-correlation-id: 6bb8f52c-b149-49c8-bd38-08dbf1764a91
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 zrSiHyA4VcZEFqhgWQKn+Fj0SlBidXzDemKdPNNWl4et9VPygggIpqT8wExMYOzg9zOh7b1rsZ5Ti+FiD6FAtC9QGUzx2tllinmBxT8k7p/bYC5Qq4GbpEUQk8KjhuEaXRwTi7FEYbuHdz5bX8wKmKKIVmmhH9uy3VnTKxbietc/6frT6UbrrlQG5ibmTLsTfuEnSW3Cowi0uRO40LXu5puHkTF5v6D9uvROCepG7E7lKBjezjG4j1W0Bz8rZ9LEKGnkrgFo7sUBXUJ/hj1RaUbZ3Puf/UDoXkv1DkysscCFVgylJRk2utuQoivQRyFtahj7RxCFgynCwAiVTdOeP+Tmun95WM7Eg8l/A+71H/nCF/nPK42jMBIUe9iPtNJzkiuJvdFPoEuL4QLb1U9oAmMAX1pn/bQ5cYCG7AoH7coIcttkqw4arcI21/CBvqRJXC9Ln/GvOofiHvJ+j+Zy0FafQIEp2gOadf5EsFo/+c1/Zs3yZS6SFIWYAkCTRC4rqBRxpO6st12Gue/FU6skNKmy6XeJthVJuMx3fcP4jZYOEOZ29ohIw+r9RMPheTXsmhArk2O8GhR35k9W3bppzSrVSKFJKRK9vtLiNaPbSxLEzh7b7mjDlsa6jAFmsZ/8YZrb8pUdyFJ3sEI7vlDeH05aFsj5bMfB4L8PjkZGVvA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR04MB8048.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(376002)(136003)(346002)(39860400002)(396003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(83380400001)(6916009)(38070700009)(26005)(66556008)(66476007)(54906003)(66446008)(66946007)(64756008)(2906002)(91956017)(33716001)(5660300002)(8676002)(8936002)(4326008)(86362001)(44832011)(316002)(6506007)(41300700001)(9686003)(76116006)(6512007)(478600001)(6486002)(71200400001)(82960400001)(122000001)(38100700002)(202311291699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?UBHGepencoSnCtslovmOAHTZivQ0Pxc+C5t5Cb6JQfPvDGeSs8f99y0r00BE?=
 =?us-ascii?Q?JLWbRlheeN0dmWoHMPFyEiTo6cgLGMcRgc9DcvItjl41XfXhe0HJmJ4b1LxN?=
 =?us-ascii?Q?bAI1mF/4bcUjktytflshh/4ZCSrhKiz963u1/fMAKLBebednRnPG4lmsfZQd?=
 =?us-ascii?Q?BEQKEqEE4Wz8c7O2PxOCLb7zJzuwB5HcVWgu4riwzMfuiY8f/XVo4ITcqOE1?=
 =?us-ascii?Q?U6Sjw41rWB4ElhOZ964fHzcBaYIlg5sLCHKtvXSNOBwG1VGXhChy7hoGtR6M?=
 =?us-ascii?Q?o7eh3eIa9eQOjtc+QW38SV5kSnOIyMGVa6n5NULQWxGwlJk02u9yVYnpt9Kw?=
 =?us-ascii?Q?DvyzjwSCWBehIj68QXQcunSDmxHHvLh+IZ8soS1cc6Rfjzuf4jbbdxKgfeYx?=
 =?us-ascii?Q?UOihqLK9O7UhAfr+jsTEgVxmMi++33oKwvp5Qayokn0dkjVsSvmrQbZFEo/r?=
 =?us-ascii?Q?2f3QZVWuk19NDR6B/hWSXwJBajzTN59tmifG6Mc90RMqFSHo2HpOjkYLydHE?=
 =?us-ascii?Q?YyNNRVWaHm5suYnnQz+XukREyJAVjSk50MCwMulriV9OoHQ9EYvu5S2BhMJY?=
 =?us-ascii?Q?Df8Ew8X64ljTjUXBakHk1BmWcJG6cnQ0McBfjvwACLBGkgomvk/5wkLb0uYq?=
 =?us-ascii?Q?1DbOwFOILKb90frMslSGry5aonLusd1ZEKXDhWI4XUhxQpQaxRlwO0pNiT8d?=
 =?us-ascii?Q?ShuhqaxySQ2OJTDNmOmXux/TO+Sjz0L34DuaH/mKfc01yLpHIN8pbv7c2XIA?=
 =?us-ascii?Q?Hen0vGWEuYihROoTAt2yXpZ1H9aZK5WQTL7uWGkLM5v0ihCgXsZLufTgk5qB?=
 =?us-ascii?Q?u6Wq4WCJAA7pV5s8L50seWwE63W1NFFAn8jbeTwfj7I7ou8FxTi/mz9tuEw5?=
 =?us-ascii?Q?dEjUu3PkAMdwb3Eo9qB3g2Z5x+JesLGyxiIERI/PCJoWKkb4Mm5egfX6IBPD?=
 =?us-ascii?Q?8eTSWSUNSye5S3B2tOjNLvNSSoxYFnLw5nEwQJjWOzQSAHGqf4F1NOC5RN4e?=
 =?us-ascii?Q?LPUSb5/PIkdNmmutm78e+8Q0U+E97rdgj6MeASqVhMJvphuo1p7YupidxXp3?=
 =?us-ascii?Q?Gz/9rtor6lva5FYbZwzq9JdOZDzBomaOtGLdlpN20U7xh1LRNGxGqlGkWIpf?=
 =?us-ascii?Q?GlBpOfdXRu8H6/UjdoAY7fxgY3rlsE4CZqvYUHeJJPbJ32bXb5np6/KCZMKo?=
 =?us-ascii?Q?pnfozTrf4Dxwos4i6OJwVHU/1DEx5qGnIALm85cGcy2lm9vTPyJQILmiyc7f?=
 =?us-ascii?Q?PC8HPY57fkn627JPcoeYpFQXjPb+3leBWJ5lIhtTNkqqzYa6dmLawTBOkPKh?=
 =?us-ascii?Q?mRsWRzbbHMrrjrkxaXyj4Nta8O7Huw/au6PA1cJZj52u82bgcUoA9xFNnQEn?=
 =?us-ascii?Q?TJkkoitSAg3bjoZrzrOWYo94c14/IkvlpU+RhZWltYncCavsUOgN5aAZQiLJ?=
 =?us-ascii?Q?gZaea9YysWO6SNEN8r36UL08ItsULVOVxG0CsCYk0sVbNNh/vSCrNnQ+ojid?=
 =?us-ascii?Q?CcY1f0KD1LeYT6E2JAsC4hxPd+o4PaD0/c97XAYiIHOT+1g96KMtv3ldmHJ0?=
 =?us-ascii?Q?O5++8KiwztW1qdg0yzlbhgV5OmTDB3ZwajXCoWzeWguny8GfrqLZeQMko7ii?=
 =?us-ascii?Q?qSeMsIaF9tWJ0O854Tjegd4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E77A85A8D58E8C4D87A501D028A3FE8E@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?us-ascii?Q?H32kKK1lmk48x9kDtgY+49+cMns42D9wvAkN65CzHDJ17C6M7MkWHL0t1bEE?=
 =?us-ascii?Q?DAFHIZPWOPpYgAZ7lxLJSoOtM5uEMZQWMMqrYr8ybfa0Qm1z68q5wwLcbyTr?=
 =?us-ascii?Q?z+osx03H01hAGresOvHU87ezkIJdyGNYFtASsffhr7jugBU4HOO5MjueLpMG?=
 =?us-ascii?Q?olj2GO2J4YAHyunk2NpYlc6D/KEkB0B8oqK7x5En9Qq/67nF0ySvk/Z+YFxY?=
 =?us-ascii?Q?etjt07JuZK4WZ4YlmuGJQhgbGeBD97jmYYyd5apkEM+E3q0qzhSIZ7qgHY+k?=
 =?us-ascii?Q?5DD8YVK7AR+b78AIZslbhosKUlvk0gLYKsQWCmDjKHEqgADwEHuISgctpw9w?=
 =?us-ascii?Q?fXwBmoZOXUBa3Xh9pUhF7sZA/t3jP/OqrtpSeCOb0lzkoiRLDiLv5p1b87fu?=
 =?us-ascii?Q?iL22qxXXBCToeXDSXUVzh8XeH2fGES/OHpnqW6ZnZofG4zSR2exJr72HS5Kw?=
 =?us-ascii?Q?NT3hBCa/sBwzs7cLG82HQhh6oPbKrUBhvBBZB7BOXHxXWgKLev8Dstm8AFZB?=
 =?us-ascii?Q?VrxZZNpukcIsDcKhCHUWxms93R775WnD1Vb0XJl2L6dNkD7rx4CeqF63cXdE?=
 =?us-ascii?Q?B2JJt+rbA2u01mqo6ET2eAZWHqgQ2Cr13A68+qseUFmyUCzhso29wlTajHb6?=
 =?us-ascii?Q?HnVdGlMo2Agk+QMnDp8l/KSHeQFzGHIhnkocVk8fLxgZz150sTpVQ7Sf+sQC?=
 =?us-ascii?Q?YhaqBxmx4QaV/KRmTWHIPu0cgSiOs0dr0SDXFFOOTtt8F6nth5VWJaNZUZh3?=
 =?us-ascii?Q?jSEXGgxVtJbXywJp6nJA6R9b7X+fjf7s+XgiiNRYjXwPn7hSYQkrTWiroSvL?=
 =?us-ascii?Q?2IR3cdA5rTBnUnmgY8Jp4OGthde0BPVblB2yGiG8sT3j4k6rG5jp7qgNG7gk?=
 =?us-ascii?Q?Ert49pXcJNnIcb3x7B9Yz4goecD4uL9GGOZ/dYE+Lfkcm8AVAsje7Lesxpp9?=
 =?us-ascii?Q?bzMc3ioGKQ1g2xnih43CJg=3D=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR04MB8048.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bb8f52c-b149-49c8-bd38-08dbf1764a91
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2023 07:30:56.1994
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xTrux6+Is65HK2nvHzQ7lMmB0XOm6iZb0iS9/sWAe3DkAC+PmO29JpaUFMKN1N49nIAjeBM4WZ7h5azlBmFJAFhMZqyDv0VHiRfpnmdwmhQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR04MB8820

On Nov 29, 2023 / 15:53, Andy Shevchenko wrote:
> On Wed, Nov 29, 2023 at 03:50:21PM +0200, Andy Shevchenko wrote:
> > On Wed, Nov 29, 2023 at 12:17:39PM +0100, Lukas Wunner wrote:
> > > On Tue, Nov 28, 2023 at 07:45:06AM +0000, Shinichiro Kawasaki wrote:
> > > > On Nov 24, 2023 / 17:22, Andy Shevchenko wrote:
>=20
> ...
>=20
> > > > > Another possible solution I was thinking about is to have a local=
 cache,
> > > > > so, make p2sb.c to be called just after PCI enumeration at boot t=
ime
> > > > > to cache the P2SB device's bar, and then cache the bar based on t=
he device
> > > > > in question at the first call. Yet it may not remove all theoreti=
cal /
> > > > > possible scenarios with dead lock (taking into account hotpluggab=
le
> > > > > devices), but won't fail the i801 driver in the above use case II=
UC.
> > > >=20
> > > > Thanks for the idea. I created an experimental patch below (it does=
 not guard
> > > > list nor free the list elements, so it is incomplete). I confirmed =
that this
> > > > patch avoids the deadlock. So your idea looks working. I still obse=
rve the
> > > > deadlock WARN, but it looks better than the hang by the deadlock.
> > >=20
> > > Your patch uses a list to store a multitude of struct resource.
> > > Is that actually necessary?  I thought there can only be a single
> > > P2SB device in the system?

Yes, the list might be too much. I was not sure what is the expected number=
 of
P2SB resources to be cached. I found drivers/mfd/lpc_ich.c calls p2sb_bar()=
 at
two places for devfn=3D0 and devfn=3D(13,2), so at least two resources look
required. Not sure about the future. If two static resources are sufficient=
, the
code will be simpler.

> > >=20
> > > > Having said that, Heiner says in another mail that "A solution has =
to support
> > > > pci drivers using p2sb_bar() in probe()". This idea does not fulfil=
l it. Hmm.
> > >=20
> > > Basically what you need to do is create two initcalls:
> > >=20
> > > Add one arch_initcall to unhide the P2SB device.
> > >=20
> > > The P2SB subsequently gets enumerated by the PCI core in a subsys_ini=
tcall.
> > >=20
> > > Then add an fs_initcall which extracts and stashes the struct resourc=
e,
> > > hides the P2SB device and destroys the corresponding pci_dev.
> > >=20
> > > Then you don't need to acquire any locks at runtime, just retrieve th=
e
> > > stashed struct resource.
> > >=20
> > > This approach will result in the P2SB device briefly being enumerated
> > > and a driver could in theory bind to it.  Andy, is this a problem?
> > > I'm not seeing any drivers in the tree which bind to 8086/c5c5.
> >=20
> > At least one problem just out of my head. The P2SB on many system is PC=
I
> > function 0. Unhiding the P2SB unhides all functions on that device, and
> > we have use cases for those (that's why we have two first parameters to
> > p2sb_bar() in case we want non-default device to be looked at).
>=20
> For the clarity this is true for ATOM_GOLDMONT (see p2sb_cpu_ids array).

Lukas, thank you for the idea. If I understand the comment by Andy correctl=
y,
P2SB should not be unhidden between arch_initcall and fs_initcall. Hmm.

This made me think: how about to unhide and hide P2SB just during fs_initca=
ll
to cache the P2SB resources? To try it, I added a function below on top of =
the
previous trial patch. The added function calls p2sb_bar() for devfn=3D0 at
fs_initcall so that the resource is cached before probe of i2c-i801. This w=
orked
good on my system. It avoided the deadlock as well as the lockdep WARN :)

static int __init p2sb_fs_init(void)
{
	struct pci_bus *bus;
	struct resource mem;
	int ret =3D 0;

	bus =3D pci_find_bus(0, 0);
	if (bus) {
		ret =3D p2sb_bar(bus, 0, &mem);
		if (ret)
			pr_err("p2sb_bar failed: %d", ret);
	}
	return 0;
}
fs_initcall(p2sb_fs_init);

The result of the trial is encouraging, but I'm not yet sure if this idea i=
s
really feasible. I have three questions in my mind:

- The trial function above assumed the P2SB device is at the PCI bus number=
=3D0
  and domain=3D0. It is ok on my system, but is it valid always? I see this=
 is
  valid at least for drivers/edac/pdn2_edac.c and
  drivers/watchdog/simatic-ipc-wdt.c, but not sure for drivers/mfd/lpc_ich.=
c
  and drivers/i2c/busses/i2c-i801.

- The trial function above only caches the resource for devfn=3D0. This is =
not
  enough for drivers/mfd/lpc_ich.c. Another resource for devfn=3D(13,2) sho=
uld be
  cached. It does not look good to hardcode these devfns and cache them alw=
ays.
  It looks required to communicate devfn to cache from p2sb_bar() caller dr=
ivers
  to p2sb. How can we do it?

- Does this work when suspend-resume happens?

Comments on the questions will be appreciated.=


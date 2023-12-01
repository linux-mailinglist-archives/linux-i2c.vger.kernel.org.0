Return-Path: <linux-i2c+bounces-572-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4B38008D1
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Dec 2023 11:46:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA2001C209DE
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Dec 2023 10:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 003E0210E3;
	Fri,  1 Dec 2023 10:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="L7pGXXs7";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="lmmRGdte"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C9B319F;
	Fri,  1 Dec 2023 02:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1701427582; x=1732963582;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=1xVPfU0spdax2LSxvOSuqMiB/KZwOO78X8DmhmIeT8Y=;
  b=L7pGXXs7d3OHXwfQktaLnPupukSyrb2OLxibiYs0vCpNjuejxiZ/RUHz
   hSR6Zbs5vZn297MYSkvnSKL0osdFz0K/u0mTj56jaIdpDiNBirj5QU0+w
   DBFfCYRrf6Cg23yaYGSocSqa5B1n+np990O7bBaC3bvUOQ6qaSxwHkHnM
   E4sK/V3123IWbCibOjTjLAKkhADgPDzxLt0RB5EF5tG8ON7aLWhycll5y
   Gatexod11kk/onJVVQ8vWO0NFE1c7N6Z/a/cPYEoD4xYM0bUonhT5rb4+
   AFvcVVUSyJaxq9mcb1N6l9i2uJYggV3yhCg85f0sIex0AgnbSL/F/IAwX
   Q==;
X-CSE-ConnectionGUID: CzLIdGDLQR2zYUWTvJpr1w==
X-CSE-MsgGUID: TeNvuI9qR+qlFDAPDSRtzQ==
X-IronPort-AV: E=Sophos;i="6.04,241,1695657600"; 
   d="scan'208";a="3780164"
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
  by ob1.hgst.iphmx.com with ESMTP; 01 Dec 2023 18:46:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PqSw2bpMWXMpb4EmERt+CiJAtUGxoEil/1nnjeeTbyOZ/dBGRUOqTR1V1LU3INWvMLTZbfFyiXPtgwT8tIjYRCGUl9zZnIHdE/ixDHTSrOubBmjF+9jM+cETFJSqPR/2ik9t+L5pwrb3fLVx+8GhCchwVOs4HNu0MBHWgpwx1mKBnQzkEdVmRp3ErsDaqv3WiDPfTpRfKsj3sBuQjj8URC2xMthQMyla4IHmdz8wLyEkqCZlCRvNSsJGyz/mrs0FRflc7zfjikoDVqVGxw5jWg9v+omUVcNL1FJ6mV1/ZAvMKdWaUutA5oFtLj6SuUlYaatV5vNhyCjc7+lrNgD94w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N6069UZAkjm0ZKSWrF0jr027m64AXHlQBRzTHxMybDE=;
 b=JsBP7r2gWiIrukDI6R8p+Tb/uuNL45htU9/tB4/xTaUSh94OplZXpqvyIlDbKTY5pdqTK+AJzozy6BVUSVJAv8TKPwmqBraSRRjL1BVmIgcyrWE/0MPy4bb5MYcr4fL8Ke/VxtL1LZ3jRJDIx4/I0c/hGjJXBAWPrtSq//qrm5nQRmzXQeAzY6KToBj0i/s6fohpnbghdU1xxPgUbnuvYkoSmyHx0grQz7B8MqaigGg+hVXx0gj6Xz9ocfOoOGCJGvf1zofp+XAwKR/0C/ho6WrQ/KPKALjqZOv+n5jhf694AHDodWRLsPXVivz0yfp+8PLpqvkloGCX7C0uyS18OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N6069UZAkjm0ZKSWrF0jr027m64AXHlQBRzTHxMybDE=;
 b=lmmRGdteJA0azUcRAIhPUYZQvSD9gm3LGvPikU8SDAi4oA/blGISLkBYlwIwdF7kqNG3kbA2Hx0kgGGoZ2QzoAsF50bmAruqGBO+iLHGdKTtnTmJwi5TsLZHgNPJzGY7geJ0HkbYVT5QaHLPCzmSj1YS5oMIxZK6+o0GEgauYHU=
Received: from DM8PR04MB8037.namprd04.prod.outlook.com (2603:10b6:8:f::6) by
 SA2PR04MB7532.namprd04.prod.outlook.com (2603:10b6:806:144::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Fri, 1 Dec
 2023 10:46:19 +0000
Received: from DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::81a9:5f87:e955:16b4]) by DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::81a9:5f87:e955:16b4%3]) with mapi id 15.20.7046.027; Fri, 1 Dec 2023
 10:46:19 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Lukas Wunner <lukas@wunner.de>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Heiner Kallweit
	<hkallweit1@gmail.com>, Keith Busch <kbusch@kernel.org>, Wolfram Sang
	<wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, Bjorn Helgaas
	<bhelgaas@google.com>
Subject: Re: [bug report] lockdep WARN at PCI device rescan
Thread-Topic: [bug report] lockdep WARN at PCI device rescan
Thread-Index:
 AQHaFsdpw8Adedg0CUyhPBScx+2k2LB5mcWAgAAIiICAABWaAIAAQPKAgAAEGACAAB3DgIAPP5sAgABMVoCABcllAIABzbqAgAArvHSAASc/gIAAIvSAgAGl94A=
Date: Fri, 1 Dec 2023 10:46:19 +0000
Message-ID: <6js7lotgzq3uo2zy54rpguk3uri2qpduokcce6zrpn5za42yii@3jqcvdow6wrm>
References: <ZVOcPOlkkBk3Xfm5@smile.fi.intel.com>
 <ZVO1M2289uvElgOi@smile.fi.intel.com>
 <eaawoi5jqrwnzq3scgltqxj47faywztn4lbpkz4haugxvgu5df@koy3qciquklu>
 <ZWC_0eG2UBMKAD3C@smile.fi.intel.com>
 <2vzf5sj76j3p747dfbhnusu5daxzog25io4s7d5uvzvtghvo24@567tghzifylu>
 <20231129111739.GA14152@wunner.de> <ZWdBnMTOq9wIt9L-@smile.fi.intel.com>
 <ZWdCdMtLjZS2mDTQ@smile.fi.intel.com>
 <rsrhixediftppmm2n7rzciirdpjnymzsn76lffnd4kzovxaf42@5hddblagaytt>
 <20231130093601.GA11031@wunner.de>
In-Reply-To: <20231130093601.GA11031@wunner.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8037:EE_|SA2PR04MB7532:EE_
x-ms-office365-filtering-correlation-id: 82ed8ff1-0224-4a2a-60c6-08dbf25ac067
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 r+mP+A/84MDHEGnDfHvgF4q6PrqtHaCGJcHEq5JzDwE8uhNWrnuTgKL49kWT/kHdqbfihpG4d1AlLa5yE1tbTY9zCuwDf6MYxMQBknHHt6W53MKbOaO7JZbNXMI6eu7u9t1xfyATyjOTrttG4fRTAPGAktkogiHXYzuW3WO7FRfk4DLSI3BAeCKpM8TtU5MuhxLz+jeEAtoQiL9JvaF0rlgYm4XZKxma4Pdct8EmXO4FqTSSN8q09JxQGu5n7TEN5u+QHp3XEmgblEPkmp/6Cb9UEcMmlKJhnyzGuQbDTbOHebAr0JW+soSiVS9H00ZzZ25ZI9MJmW1BZIGGKi56/geowvRPQwAuu4IqVfgU44EHcxKQ51oVfoSVP3+oTunEDpcKTWxOVj8ugkrc1XiL9ZY29WZ3zIyGNrvo8Qp5j0/Ylxqdf1XkUI2zpcrwFLWZayrCt+4yMNvdHy0X8fov0SwxXz4AXAK2XMxYAmlAB9N1C+DlypSYvSUyDbL7XIih4P519kEd+fONsI7MmLFPjYPvWv+dOxw3e08XPmPe3I3eiBaWq5S6Af0v2PQCpjy70Xgt9zr+WUUvLJG9MPYDEdtA5kEMWxF06r3WFGahcR9l2bRb9HmWEYB2iqwRrfiD0J9VUzDl/rVr+ISNMAbmeQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8037.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(376002)(396003)(136003)(39860400002)(346002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(5660300002)(2906002)(8676002)(4326008)(64756008)(6916009)(54906003)(66476007)(66446008)(316002)(66556008)(8936002)(66946007)(76116006)(91956017)(26005)(71200400001)(41300700001)(6506007)(966005)(6486002)(478600001)(6512007)(9686003)(44832011)(83380400001)(38100700002)(122000001)(38070700009)(33716001)(82960400001)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?VT2JH19T1SAfyycD1ejPz2EyKjMpkQ8nekziviKLycuLsLlFq/DDQdXl/mra?=
 =?us-ascii?Q?wyj0/TDAuHehNNq2k1ql1NTH4nDlBkhJuuLqYf+McIX8y6QyLh9b0zwT8IHc?=
 =?us-ascii?Q?An6a7SnHiRuMueT5Lr2q5e2VzPpm7NIR14keB7ai1IyNyka7tYikovR0Th2V?=
 =?us-ascii?Q?Gilj04Z3xdZtWd9uyyh/YqpU0MfA/PeL+RTUyl9fJdIFf1PrzSoi5eq7CQCG?=
 =?us-ascii?Q?Ol5oStk1Le7iW65gf7btWVITO6xg0k2DUPfxA9KuQnG/4X0RfOZN8aahMpIm?=
 =?us-ascii?Q?EJRmUpyJuiA1vo7MA2yps7xK0LSMkiQyq5q0hxFa+7gRYQln9U8+w6oMK1Wc?=
 =?us-ascii?Q?DCMW5FpIfwgEcP0Q1QTelrwGsgelKa6YI9+BY9A8Z9k2mlhFdFjYVcaVaCP6?=
 =?us-ascii?Q?3wXVoPtKczt6xrVS1W5FozX023zBtKdIcLjhgEOWievGfkEqcFfDFIR2suq6?=
 =?us-ascii?Q?s8lb1HzE3Zny7PYz5IZKsqr0GoAyOiSDFH3YKp5ixTgg82rAIjECJXYlhaMl?=
 =?us-ascii?Q?/eyMXOLhyPOLFR85EkLjjEuP86hsoWbUXgPSN4E67giTFY90dJVuBvctKwzG?=
 =?us-ascii?Q?62BbDDOXXoGnfCuoTDTABb0KxIbe/PW4ovSQI6v0Sy105seS8kkP9+t8aNiq?=
 =?us-ascii?Q?/inFHCeYYpobBN6b36AILO/ICQJxJDgBkhoFDziisS9e/SZ3dJs42ZryQpRM?=
 =?us-ascii?Q?VavtB+VGt1owC2j9+CE0dszcYigKZBNSNoyEVNraFAhpGmYuwsIU5oi+PgG+?=
 =?us-ascii?Q?Ka+RT8UW01UbF1cFQdF6W7ie8LRXsQs+RdYLQ+1/5quNjegz7Bowb3t9HRf0?=
 =?us-ascii?Q?WevLWccCU7Q8FDclKyOCYa5WyAzYxN4cyZf408p498QzM54KdgKiAj8arydu?=
 =?us-ascii?Q?hZPeBqW2UbD9Af+mg5KhxWoLDKhYokqTRFu8Pwq+G5Qj+m5d6woc1HLIv/Yl?=
 =?us-ascii?Q?DnmoWNYJVUFnoPUyD8DL4lzjx9CSlE7OI/Y+zBsCi0Db9m1bOZovPXHYmiEd?=
 =?us-ascii?Q?r+YdCVTN87cTmb/h66cDVJvZOKj9623fstakR0lWYvW6sWyLUsT6qedj5o8C?=
 =?us-ascii?Q?LSBHCIpmGJcbU5YPu7eiJjdJs/LuK4UnwBkekG+NGZVSZst3gV/K+hre/5EB?=
 =?us-ascii?Q?ARMh+0Yd2JvxJi7f6Aowbg2sTM6Y3/SOQoDb8QbEzJm/lErY8IDHHT82YYO8?=
 =?us-ascii?Q?0NXOm9fPP5cDKiJSgYWE3BPBmzJ+e8aUwnat46p4vGxuNXhETzQfl0PZyDZo?=
 =?us-ascii?Q?A2hhRHmUarxEjIIGKF/SjlCJnm3bF/kMWGfEwrb5NtlWVQ138wJGtuGHvH8+?=
 =?us-ascii?Q?d5eGlMdQc/C0UYjkG3T5InC2lb7+70xpPzNZnJFnNcMfdrIH2VDpLAi7GR7n?=
 =?us-ascii?Q?UawFAV9Hy/WiRe4XIQsVpSV99UQR8ecWWsfCrQJoab9imIPPp5wfpi0LkAol?=
 =?us-ascii?Q?/wLaZvX/EQ/YAcPVFyUDpoc3M4GDw+Fp1Hyud2qckYyXATwrAddcNq/1Itpa?=
 =?us-ascii?Q?RgZ+8gzcXkx6qiFtqNv1/1ORIz0nSWDAfax6sF7dMlrM9P4mouje/OKemwBo?=
 =?us-ascii?Q?ckTtu5HIMN+Yo35Oddh3PxlgtNNu/gmf1HmcrIoXQmD8x+mvoCE+So4Zs9WP?=
 =?us-ascii?Q?/w3+vtwBqLUrt9t5/Bv7z64=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2FE5CD65096F0C4FA35DD2B3870BCFF0@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?us-ascii?Q?QSOxLVCo7AokARx/xZIW3PeBcVye0HA72PU2Ydp9GmvZRkdfpD3LV8m9Divl?=
 =?us-ascii?Q?i+wgJtM/mEy5g6j8kKTPnzU15uBf33QkmgrUlllnFlZf6++iAbPvyry51ef5?=
 =?us-ascii?Q?xPzw4BQpvvV7Yft/ZOkfaovf0xy5cGmTcvVBz1O63yl5nSvaSALlFpKTYDcR?=
 =?us-ascii?Q?C6KJi+TpDmPi0C5l8k21k2WeXgQu9flZTU+x0zOttcTXPRxta05U5zxvBNPA?=
 =?us-ascii?Q?i6fQWCA13rSbYkR5ZLfpZGA/GpTEFX6Ey2ZG+bOnEFo+gz1qtPHsV31J1gIG?=
 =?us-ascii?Q?VkWhwYoJ6ko4KRrAiS5a95DPTDxkJa8F+xbyvzwKieNhxj9AWHjxM7ThpmZo?=
 =?us-ascii?Q?b61cCpsk5wafY8FVEwhCnExvjTBhyMigPMr5y284gEO37vCe5ByrUW4OqX+7?=
 =?us-ascii?Q?zUyjX+5nrJcfaXTVuUArANgJK3TDkg+YM6dh0CLpQjNLJhttkohJnP6w4+Bm?=
 =?us-ascii?Q?q8G09PgLLOL7PaRuK03MmdDYVzjgsEmxCm5xIO597kyJ2cndGce/ao6bbBXu?=
 =?us-ascii?Q?/BwnJml1BNL5t2mpMdhJW4/BNE0CKj51H8R3cwR0B5z068ct0KL26xg0zPgS?=
 =?us-ascii?Q?zqrBCiZ/JBco3Gk/SLQ1sIxNgzN+JyfLBHW/MsZPxHw0pfiteFi25mSPHUbz?=
 =?us-ascii?Q?5ByNakR8hLTl5gr+nJeyxvP9TG4cXSvhooBjh9ZIf7dEQXrc5vwOiSb7DA1I?=
 =?us-ascii?Q?DSLRKQUm34CwSOPxEmcf7lynDkCgW2HQgYrsgFlH5MgToeC3NbyEBJrpNj38?=
 =?us-ascii?Q?yi0fmgSJQIZ+gPBb9irFm6zDQeQE9ym2aj9A7XeSf7a3hmwpkd+R1kevONGV?=
 =?us-ascii?Q?1X4piqadN2IdYmieACexZH39N/TywUQf6z8db8cfoZDOri/PuPdcX9PG16dX?=
 =?us-ascii?Q?YekbI1i4KbpyeMkhUHnO71rciwzbfNCNViWXwR4rcqaX62FHCkoQbgGYBCU8?=
 =?us-ascii?Q?sVA4fkhjmLh2BwAWMlE4fg=3D=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8037.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ed8ff1-0224-4a2a-60c6-08dbf25ac067
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2023 10:46:19.1506
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G0egQObgCjJfnO00FSA+r4Ln7nP/pGVMERREaxt8PG3jTw7buifQZXKCz+iXJvGR2Hgi/TEjow5fymO5EIhN7JfeHVZgUc2hNynYHJIYvk4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR04MB7532

On Nov 30, 2023 / 10:36, Lukas Wunner wrote:
> On Thu, Nov 30, 2023 at 07:30:56AM +0000, Shinichiro Kawasaki wrote:
> > On Nov 29, 2023 / 15:53, Andy Shevchenko wrote:
> > > On Wed, Nov 29, 2023 at 03:50:21PM +0200, Andy Shevchenko wrote:
> > > > On Wed, Nov 29, 2023 at 12:17:39PM +0100, Lukas Wunner wrote:
> > > > > Your patch uses a list to store a multitude of struct resource.
> > > > > Is that actually necessary?  I thought there can only be a single
> > > > > P2SB device in the system?
> >=20
> > Yes, the list might be too much. I was not sure what is the expected
> > number of P2SB resources to be cached. I found drivers/mfd/lpc_ich.c
> > calls p2sb_bar() at two places for devfn=3D0 and devfn=3D(13,2), so at
> > least two resources look required. Not sure about the future.
> > If two static resources are sufficient, the code will be simpler.
>=20
> About that p2sb_bar() call in lpc_ich.c for PCI_DEVFN(13, 2):
>=20
> It's in a switch-case statement for INTEL_SPI_BXT.  BXT means Broxton,
> which is an Atom Goldmont based architecture.
>=20
> If you look at p2sb_cpu_ids[], you'll notice the P2SB is located at
> PCI_DEVFN(13, 0) on Goldmont.
>=20
> PCI functions with function number > 0 are not enumerable unless there is
> a PCI function with function number 0.
>=20
> So p2sb_bar() first unhides the P2SB at PCI_DEVFN(13, 0), then the
> SPI function at PCI_DEVFN(13, 2) becomes enumerable and p2sb_bar()
> retrieves the BAR address of that function.
>=20
> Unfortunately this is a little byzantine.

Thanks for the explanation. This helped me to understand what Andy wrote in
antoher e-mail.

>=20
> For the caching approach I guess it means you can assume there is only
> a single P2SB device in the system but you need to cache not just the
> P2SB BAR, but also the BARs of functions 1 .. 7 of the P2SB device
> if the P2SB's function number is 0.  I don't know if each of those
> upper functions only ever has a single BAR, but probably that's the case.

I see. I think this is consistent with Andy's explanation.

>=20
>=20
> > Lukas, thank you for the idea. If I understand the comment by Andy
> > correctly, P2SB should not be unhidden between arch_initcall and
> > fs_initcall. Hmm.
> >=20
> > This made me think: how about to unhide and hide P2SB just during
> > fs_initcall to cache the P2SB resources? To try it, I added a function
> > below on top of the previous trial patch. The added function calls
> > p2sb_bar() for devfn=3D0 at fs_initcall so that the resource is cached
> > before probe of i2c-i801. This worked
> > good on my system. It avoided the deadlock as well as the lockdep WARN =
:)
>=20
> This may work if i2c-i801 is compiled as a module, but may not work
> if it's builtin:  It would try to access the cached P2SB BAR when
> it's not yet been cached.  So you'd have to return -EPROBE_DEFER
> from p2sb_bar() if it hasn't been cached yet.  And you'd have to
> make sure that all the callers can cope with that return value.

I built i2c-i801 as a built-in module, and observed that my trial patch wor=
ked
good. IIUC, i2c-i801 probe happens after fs_initcall for p2sb resource cach=
ing,
even when i2c-i801 is built-in.

>=20
> Another approach would be to cache the BARs very early at boot in
> arch/x86/kernel/early-quirks.c.  That would obviate the need to
> defer probing if the BAR hasn't been cached yet.
>=20
> Looking through past discussions archived in lore, I've found an
> important issue raised by Bjorn:
>=20
>    "Apparently this normally hidden device is consuming
>     PCI address space.  The PCI core needs to know about this.  If it
>     doesn't, the PCI core may assign this space to another device."
>    =20
>    https://lore.kernel.org/all/20210308185212.GA1790506@bjorn-Precision-5=
520/
>=20
> arch/x86/kernel/early-quirks.c already reserves "stolen" memory used
> by Intel GPUs with unified-memory architecture.  It adjusts the e820
> map to achieve that.  I guess the same method could be used to reserve
> the memory used by P2SB (as well as "upper" functions if P2SB has
> function number 0).
>=20
> An early version of p2sb_bar() (which wasn't mainlined) duplicated
> __pci_read_base().  I suggested to instead unhide and temporarily
> enumerate the device, retrieve the BAR, then destroy the pci_dev
> and hide the P2SB again:
>=20
> https://lore.kernel.org/all/20220505145503.GA25423@wunner.de/
>=20
> That resulted in a significant reduction in LoC.  But if the BAR
> caching happens in arch/x86/kernel/early-quirks.c, it may be
> necessary to duplicate at least portions of __pci_read_base() again.
> Or maybe the code can be simplified for this specific use case,
> I don't know.

Thanks. It's good to understand the past discussion (Wow, so big discussion=
 was
held for p2sb.c introduction...). As I noted above, p2sb resource cache at
fs_initcall looks working good. I hope this fs_initcall approach is good en=
ough
since it will be smaller patch than the resource cache at x86 early-quirks.=


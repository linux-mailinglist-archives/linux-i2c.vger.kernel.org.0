Return-Path: <linux-i2c+bounces-571-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C798800844
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Dec 2023 11:34:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3569B21262
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Dec 2023 10:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D06D1D53C;
	Fri,  1 Dec 2023 10:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="ZacSqpy/";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="WmJ3JKK2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDFAEDE;
	Fri,  1 Dec 2023 02:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1701426845; x=1732962845;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=nS+QHtu/qx7V/DC6k5keVqyCyX4QbTXkRnqW1ksB1yg=;
  b=ZacSqpy/oEHlXGOdHW5Wg9zLXoFs2Qc7DF8jREYJ44eunOb+hyzERfA7
   QNCynL+ZuK9urqMBSlOOVHBga1Ji1Rr/xz/lZ7xbLbR6+tvDyKGbT9lYv
   2PCgk0vQZtz6YCDXTcEhKOknmohg3y+o/r3qlFr5ohPv4KrTE9PLZ5gTd
   vyLaHtqLqoGpIFuD2jktcTwWWcbA0/GPTx9Mk8YICtMgMOl6l0e0hMi0q
   xCbecqawrRYk1R4tGJ2ExpaClubzBGEWzh250LPIBz09wqabl1TIihGxq
   QD0X1TC1BRPxKx9p+SAUfbCxjYVPyh3dbtP0I+Th7JU0OEPe5L2hQPPj9
   w==;
X-CSE-ConnectionGUID: U6y7EpduRdmfTD3nfsBG8g==
X-CSE-MsgGUID: 1+mm9CT8QF2GAXHzo0bLGA==
X-IronPort-AV: E=Sophos;i="6.04,241,1695657600"; 
   d="scan'208";a="3905591"
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
  by ob1.hgst.iphmx.com with ESMTP; 01 Dec 2023 18:34:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d12g4G4q4vX1gXidyhp2RnMcqhu795W0cRPfwzAK6jki24ZyMM1fwiTrLxSdnOX35yP3Gjcel8SsaCmwud8Meyvt9w9s0XsD7Ra5rkfQMuSHvay2WfW87dq+QYGMpjmX1yZXbPXrx/JKGRxtO4JaR6d9tloh7tYp3cSSPjRBCWs4Q7ZFeb+LM7pPRgulHoIF3iAQKkFnaQiRsoRkMo1MDt/0PZg7HKjgn+CzltKDHrehUZPfK0IcSpCf0rG0mmaWe0aMPpYsmXCDuTvdsT5sIbnu7+Dhcjft7o88LfI7p5ITZhGrQFMFKWkxfpXr7XoWJK+WBxnp6UonRJAQasNYyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZwqnUnSeZS4oOA0XxWB8Ow6xVr68W/px82V8CbMIdg=;
 b=lWq90gANYed8uMLMMVgdWNiNLmuLCE+g/llnxYw39dzAVEf2GEGXHvqOVS+H3dAXQQdTHsulhYQJWNRAaB3uNHNSEOAgwq0+qUkFcJX3lmgxrI3bCbWtQQxBg5PY2fbG2R4DA4DJzywuLFVEh6Wco+L1SuzV1WYmLHO98i8CLCD4R+T1hc5onwFwxeJkLnTxzyi9we/vG3Muzw83mvoLbEZuCz7x7gpLX8Tn5Ydt5u0OOqi05eM1wcuGnNZCGuejaK8pVkO16cVdb3IVe5PPWRmzLuZAp1MPd6kGxnMIPVEnATfJwLVsPnBOLGTOfMNJuIVflcyoJTzruVzBU0K2BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZwqnUnSeZS4oOA0XxWB8Ow6xVr68W/px82V8CbMIdg=;
 b=WmJ3JKK2d2ByRGTf+UoAR8gCPvK9vxM8SxZWI7TV//DB9hNU94JjJVJl9j5Z/y1ZHQtHk9imp9vBOetjachNrhUlqweGi0wB721Y6uetD42DUpUuoGNRqtycO12B8uGyfWTt+EXKfScEf5S44Hp3W6qY+Qp6+4nhKixo/r1V7Oc=
Received: from DM8PR04MB8037.namprd04.prod.outlook.com (2603:10b6:8:f::6) by
 BN8PR04MB6324.namprd04.prod.outlook.com (2603:10b6:408:7a::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.24; Fri, 1 Dec 2023 10:34:02 +0000
Received: from DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::81a9:5f87:e955:16b4]) by DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::81a9:5f87:e955:16b4%3]) with mapi id 15.20.7046.027; Fri, 1 Dec 2023
 10:34:02 +0000
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
 AQHaFsdpw8Adedg0CUyhPBScx+2k2LB5mcWAgAAIiICAABWaAIAAQPKAgAAEGACAAB3DgIAPP5sAgABMVoCABcllAIABzbqAgAArvHSAASc/gIAAgvgAgAFChoA=
Date: Fri, 1 Dec 2023 10:34:02 +0000
Message-ID: <dldrsokbrjjhsvjpbycky2j76drzs4ilnyrre7tyvjx5fidsk6@ut5y6gqmy454>
References: <ZVOcPOlkkBk3Xfm5@smile.fi.intel.com>
 <ZVO1M2289uvElgOi@smile.fi.intel.com>
 <eaawoi5jqrwnzq3scgltqxj47faywztn4lbpkz4haugxvgu5df@koy3qciquklu>
 <ZWC_0eG2UBMKAD3C@smile.fi.intel.com>
 <2vzf5sj76j3p747dfbhnusu5daxzog25io4s7d5uvzvtghvo24@567tghzifylu>
 <20231129111739.GA14152@wunner.de> <ZWdBnMTOq9wIt9L-@smile.fi.intel.com>
 <ZWdCdMtLjZS2mDTQ@smile.fi.intel.com>
 <rsrhixediftppmm2n7rzciirdpjnymzsn76lffnd4kzovxaf42@5hddblagaytt>
 <ZWioDBqfeFk4pPAP@smile.fi.intel.com>
In-Reply-To: <ZWioDBqfeFk4pPAP@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8037:EE_|BN8PR04MB6324:EE_
x-ms-office365-filtering-correlation-id: 56c986f0-7afc-4e56-05b2-08dbf2590948
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 vKB08Qh6xUMZ0zwNoHgwzBcAivdiIEP8X8Kk5acw+0ITazO7AlEIl0W3lgogTY8PiNI8mYYW4E3DqCRH0PyymytoJbyEpkHwNLl96NBOaMTiGC+3JDGkCrQP1+PKwI0s2KiWCAr5rhx2w4IY7VuyCqzWWdz767+kGxJSeNGU8NbONP9LAIdAUx2I7Xab1aTgbnXyzBkNuYjd9VZN8S13Hcn9KPmciGX/758QaJmGhOQ+ttN+mG6tucLhtZPRHZs7k64SuihBqSXjiXtI0qi/14c7Lqmxmwh69Kf7+/HWBSFVS4MeyQ/Kow+9oV7J/N92pZmu1Owyfr4m3QciqliUlt441Kz7omnudV0B29dfNAEu0Sd4y+cng9D76t7wmma/BM1v8y8r4A6DTsQgNnMP8ut8BcwVSbr4gQKsugBYe9g8aoC625iPNMYIBCST/pU2RJj4kDIOnqy5x6V//A8UnpMO2yNMz4Mw54lfHUVQiIgSQAyDfpnq6HCSmkWeDExRjqZ32aXLvAl8IOhirsHM/3mbSFg+vQgvucnnNufUfP1rvKeT93tbosmCb5rd6REbS0hHuRgQ6qIXQp+UA7/F/DKwivCNT18yhboKetr/VK2My+uIUA4MjqIXvMdgLMBLWuZSsgBmZRhO8F3eeNuJG9FQWnmrwdfdrmJHliRQDGU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8037.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(376002)(346002)(366004)(39860400002)(136003)(230273577357003)(230173577357003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(38070700009)(86362001)(76116006)(66446008)(91956017)(64756008)(71200400001)(66476007)(6916009)(66946007)(82960400001)(38100700002)(122000001)(83380400001)(54906003)(9686003)(26005)(6506007)(6512007)(2906002)(316002)(66556008)(33716001)(4326008)(8676002)(5660300002)(8936002)(478600001)(44832011)(6486002)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ITrV1o4+EvaQRJR3z3/W7H3ZcEm0cO4hIjq0uGvdez0CP0mpAxkC19KDwZR+?=
 =?us-ascii?Q?5dQFJzf85aJSHIE8/ry9Y9oxVWm3DPBFNxQvpkB3BsAFpaLPdnQvw9/75K01?=
 =?us-ascii?Q?P9X+FWsQjKFFAbXhCQkkpFA6c2cDpaxPQwVrrWGX1Na5et3d2EElARtHpW+p?=
 =?us-ascii?Q?CnhyjKv/F+ViEi155oc4c3RxD+4rygembK5IqfaGk0QBryaCtmqABT7gluWA?=
 =?us-ascii?Q?Gj1IlRNhzBzSHjnq+OwvS/tHM4z/lUi9pzNjNkR6v5bqvGQ9WXg7T4QO79nP?=
 =?us-ascii?Q?9jYCOK+xjkpq5/XvAXpC7hxEkG9yTTkjTLtgI5fFl1J64PqZtGJL7bNdUnqe?=
 =?us-ascii?Q?TzwXoH8XkPxIhyW2Y4yH7p/FmWoDm+rB/Usj2MDp8OTastwb0rpLl1WJ1Lbl?=
 =?us-ascii?Q?iEHAwlFgBDYs1SHK6tDpYmtUKNYKJFVW6aj8l7Rlx3HbLUONHnggSbQC1qxt?=
 =?us-ascii?Q?lAQx770ShCG7k/1tVnFDoVJa7YdPUkBd5NX0W4hEinsS4kY7VhhLS5g4tfrb?=
 =?us-ascii?Q?uuOpph/oRrGG2e7KUsms1yORpglvr1BMsGUnR6rZ755j3PF/OykD5i3I67uz?=
 =?us-ascii?Q?BG3eyUGRCoYAPM0Nof+YKe0LXRZ2tDsuz90lbLwgaQgMbrUFu2UVLSb/3PgM?=
 =?us-ascii?Q?gAOTM0RD5+p/TfvWSaxa66QP+sFVOGKtDj0pDLFBqQHgcPHyV92V8Ux8kDze?=
 =?us-ascii?Q?yh5MsRNHvSCdV6235mpeCuAey982qDhhjRLf0s4Dx9eZjeRkAXpRUqyBGLw+?=
 =?us-ascii?Q?gArTk2bmccNqd2TG86/AMPmRsHxOk3wzDNQOgXkXqwuCc8cqC/3/TezH2J/1?=
 =?us-ascii?Q?zPktQ71VZ3d2T939IkhiDBZMGIKXzFFwp+3u/iAuYqcZhIwTU1mQTYEhRzPF?=
 =?us-ascii?Q?pB5zqWROeeY30TNs5zVtc7nMPUJkorD6NPQwAXXIlRK+qT/zi0sMLFwnEbOB?=
 =?us-ascii?Q?viI/8gI0CtkKqwRLfNE1uSfD3FdZB22ZmKeUO0/4loyp8zx8vNKd4R+WA2Wg?=
 =?us-ascii?Q?sH5zWcKlFt3RDlVLF/tg1KrRQu0l9egDLAF7OXA/H27CJh/RUIgHES22EfMX?=
 =?us-ascii?Q?hNP28sXdLDZ7eXhcQDzTrUj3w2PIpVlJ6LjZPvw8jC+v3QrEtJ9Fpwq2w6GO?=
 =?us-ascii?Q?rRkmXYxmPlCVbhurVS/IjGa4wy3JxiNcgGZ231RAXxRMfO7YSTLxgeJR4PWl?=
 =?us-ascii?Q?Cv+S0g2rc6K737OqVKhNtVeNjikpQhW5Hqm0nUNZne8rkzP56SKObbo7rp1Y?=
 =?us-ascii?Q?+phigTjz/Q4RiNyuEo2XGbEZbqfNbsyll+7kdwrw4rjpghCttMxv60I2rbGQ?=
 =?us-ascii?Q?btzLwV+dBv+OtoJsACyAP8CuRSho5hGlOwVgZnm4DFGUUVbycjCpwaP5JsnU?=
 =?us-ascii?Q?wpmDRPGPSOYuXjXWdX/iW7s5WN52xEuSJm54ZqWq4VGEOF7r+N+YkGUg8XPp?=
 =?us-ascii?Q?junKksiNK1vjlZepAsfxbv8KINq3AA99GXNgi5O/tJGFmkoZYGXWbcv2iGQB?=
 =?us-ascii?Q?2tamRubfuRp5cf60mLhaRaRYM2DWLGubjy0Hz1cJ0cJ4lbAPsSrTmmdT9sG4?=
 =?us-ascii?Q?t9fHGtMdOHuAgw4/xtn12jiMt7Z2yHNaNdnBvxTmb2Gx3jmKc7qDmTrxx1wl?=
 =?us-ascii?Q?VxOE13mRRhe6i6kzDgNHp3c=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <62AAF350636D5A448F4D3E2E59B36213@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?us-ascii?Q?vkFuizguvr0GCGN2K+79DKa9PQ4NVBBhc3Yh+4vrI1J4AQBTGiCeLbYE6rhD?=
 =?us-ascii?Q?WOY+imIC8ECHahDwbK04enezuJA1khPNRS9+UyJXE/rakanWgT4od0TILIi/?=
 =?us-ascii?Q?JPPt/JV9UdM5WTMafGfapYQ/xC03cDfHGmwK70rbcuMxNVl4mugYGpCrhhYz?=
 =?us-ascii?Q?5qGyFsIzUlw+ucCwSRIRI7V8nQ/FroBobJNdG3DKxcN5ZH9Z88QOPYLLwoD0?=
 =?us-ascii?Q?UxUfOIiwCJaDG6FuDpRlAhEkX/TkHbgzm9oMbBIjH/f5PJlcX9B12vNycUyX?=
 =?us-ascii?Q?7yjyXu92SPjQS9njzP8/mc9uifMVtKFbMmzgoSuDV9PnmPPh5hGdvrXVqwEA?=
 =?us-ascii?Q?p2012mYry4U0aOle+ArPjT4JBsUahfoAdflNpEjfU1cP1bBwIoz/+d68heJt?=
 =?us-ascii?Q?XWI5IvhOFOH2nsVFwbIS8O+h99IGQGrL2GPhKx9o70YbQwYXbeJd+xPgrmwr?=
 =?us-ascii?Q?ZxIAbHwyuVdEuszpnaPhD6+bFeZJMAYukO2umXW+b6AFOuBtOAj8bGtzkJKF?=
 =?us-ascii?Q?afT6/28MrvXQedoeRY6mzJGlZGKVdCl3+Yien+b6NhEqcgtnyFd6IOFFH0fv?=
 =?us-ascii?Q?dTPsMtrRmMJg7YjPDwv4Zd3sI541qN3NPETOx1q4wcHrpkg3SRpPWzTw1WE+?=
 =?us-ascii?Q?kjyOHlt9LlrbU+jf7H+sLqIQNlKdUuumrILbEtVQ02QSPqf67pqy6KEz7gyf?=
 =?us-ascii?Q?xcRlS2P4u5LhlGh0xeJbQNFCQkYH5hl2PBPCBh6pO6nqtPOh40RI7X5fYiDz?=
 =?us-ascii?Q?UE+aR71iv3HVK68oPwV3QEWLJxQz40YgIAmHrsf1URb3QJ8b6AEJ1v5gPEGW?=
 =?us-ascii?Q?nwP158vZR5IPBGFH0/GFuD5BK49Q5KSgEdmi0cI5AgyTczOSYi7aDnBwdgW7?=
 =?us-ascii?Q?TtFZwXJ1ij+d1pS9RngOixbGtPqquwL9aWOHrhAiFeNthWbb6W5ITjjaD/gj?=
 =?us-ascii?Q?H5Vc1otQN3hrRPVh8/L+Ag=3D=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8037.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c986f0-7afc-4e56-05b2-08dbf2590948
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2023 10:34:02.4546
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bRv4eOC6vtvUcyyvQ3TZs5OEgYdT1xSUPU1PdJm1068PxpUhTW8/RCblaZ7UwHVP54C4Qsin0TD3tgRO6SbX44eb5JXGnpwTckC5ci8kkuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR04MB6324

On Nov 30, 2023 / 17:19, Andy Shevchenko wrote:
> On Thu, Nov 30, 2023 at 07:30:56AM +0000, Shinichiro Kawasaki wrote:
> > On Nov 29, 2023 / 15:53, Andy Shevchenko wrote:
> > > On Wed, Nov 29, 2023 at 03:50:21PM +0200, Andy Shevchenko wrote:
> > > > On Wed, Nov 29, 2023 at 12:17:39PM +0100, Lukas Wunner wrote:
> > > > > On Tue, Nov 28, 2023 at 07:45:06AM +0000, Shinichiro Kawasaki wro=
te:
> > > > > > On Nov 24, 2023 / 17:22, Andy Shevchenko wrote:
>=20
> ...
>=20
> > > > > > > Another possible solution I was thinking about is to have a l=
ocal cache,
> > > > > > > so, make p2sb.c to be called just after PCI enumeration at bo=
ot time
> > > > > > > to cache the P2SB device's bar, and then cache the bar based =
on the device
> > > > > > > in question at the first call. Yet it may not remove all theo=
retical /
> > > > > > > possible scenarios with dead lock (taking into account hotplu=
ggable
> > > > > > > devices), but won't fail the i801 driver in the above use cas=
e IIUC.
> > > > > >=20
> > > > > > Thanks for the idea. I created an experimental patch below (it =
does not guard
> > > > > > list nor free the list elements, so it is incomplete). I confir=
med that this
> > > > > > patch avoids the deadlock. So your idea looks working. I still =
observe the
> > > > > > deadlock WARN, but it looks better than the hang by the deadloc=
k.
> > > > >=20
> > > > > Your patch uses a list to store a multitude of struct resource.
> > > > > Is that actually necessary?  I thought there can only be a single
> > > > > P2SB device in the system?
> >=20
> > Yes, the list might be too much. I was not sure what is the expected nu=
mber of
> > P2SB resources to be cached. I found drivers/mfd/lpc_ich.c calls p2sb_b=
ar() at
> > two places for devfn=3D0 and devfn=3D(13,2), so at least two resources =
look
> > required. Not sure about the future. If two static resources are suffic=
ient, the
> > code will be simpler.
>=20
> PCI specification defines up to 8 functions. So, basically you need to ca=
che 8.
> But note, each function may have up to 6 or more resources, we only now r=
ely on
> bar 0 as it's hard coded IIRC.
>=20
> Theoretically we might require any bar from any function, but practically=
 we have
> at most two right now. So, to follow KISS 8 should be enough.

Thanks. This sounds reasonable. I'll create a patch based on it.

>=20
> > > > > > Having said that, Heiner says in another mail that "A solution =
has to support
> > > > > > pci drivers using p2sb_bar() in probe()". This idea does not fu=
lfill it. Hmm.
> > > > >=20
> > > > > Basically what you need to do is create two initcalls:
> > > > >=20
> > > > > Add one arch_initcall to unhide the P2SB device.
> > > > >=20
> > > > > The P2SB subsequently gets enumerated by the PCI core in a subsys=
_initcall.
> > > > >=20
> > > > > Then add an fs_initcall which extracts and stashes the struct res=
ource,
> > > > > hides the P2SB device and destroys the corresponding pci_dev.
> > > > >=20
> > > > > Then you don't need to acquire any locks at runtime, just retriev=
e the
> > > > > stashed struct resource.
> > > > >=20
> > > > > This approach will result in the P2SB device briefly being enumer=
ated
> > > > > and a driver could in theory bind to it.  Andy, is this a problem=
?
> > > > > I'm not seeing any drivers in the tree which bind to 8086/c5c5.
> > > >=20
> > > > At least one problem just out of my head. The P2SB on many system i=
s PCI
> > > > function 0. Unhiding the P2SB unhides all functions on that device,=
 and
> > > > we have use cases for those (that's why we have two first parameter=
s to
> > > > p2sb_bar() in case we want non-default device to be looked at).
> > >=20
> > > For the clarity this is true for ATOM_GOLDMONT (see p2sb_cpu_ids arra=
y).
> >=20
> > Lukas, thank you for the idea. If I understand the comment by Andy corr=
ectly,
> > P2SB should not be unhidden between arch_initcall and fs_initcall. Hmm.
> >=20
> > This made me think: how about to unhide and hide P2SB just during fs_in=
itcall
> > to cache the P2SB resources? To try it, I added a function below on top=
 of the
> > previous trial patch. The added function calls p2sb_bar() for devfn=3D0=
 at
> > fs_initcall so that the resource is cached before probe of i2c-i801. Th=
is worked
> > good on my system. It avoided the deadlock as well as the lockdep WARN =
:)
> >=20
> > static int __init p2sb_fs_init(void)
> > {
> > 	struct pci_bus *bus;
> > 	struct resource mem;
> > 	int ret =3D 0;
>=20
> > 	bus =3D pci_find_bus(0, 0);
> > 	if (bus) {
>=20
> This is inside p2sb_bar(), no need to repeat it.
>=20
> > 		ret =3D p2sb_bar(bus, 0, &mem);
> > 		if (ret)
> > 			pr_err("p2sb_bar failed: %d", ret);
> > 	}
> > 	return 0;
> > }
> > fs_initcall(p2sb_fs_init);
> >=20
> > The result of the trial is encouraging, but I'm not yet sure if this id=
ea is
> > really feasible. I have three questions in my mind:
> >=20
> > - The trial function above assumed the P2SB device is at the PCI bus nu=
mber=3D0
> >   and domain=3D0. It is ok on my system, but is it valid always? I see =
this is
> >   valid at least for drivers/edac/pdn2_edac.c and
> >   drivers/watchdog/simatic-ipc-wdt.c, but not sure for drivers/mfd/lpc_=
ich.c
> >   and drivers/i2c/busses/i2c-i801.
> >=20
> > - The trial function above only caches the resource for devfn=3D0. This=
 is not
> >   enough for drivers/mfd/lpc_ich.c. Another resource for devfn=3D(13,2)=
 should be
> >   cached. It does not look good to hardcode these devfns and cache them=
 always.
> >   It looks required to communicate devfn to cache from p2sb_bar() calle=
r drivers
> >   to p2sb. How can we do it?
> >=20
> > - Does this work when suspend-resume happens?
> >=20
> > Comments on the questions will be appreciated.
>=20
> I would give a try with a cache for full hierarchy, basically it's either=
 1 or
> 8 resources. It would be quite weird to have devfn to be different 'in de=
vice"
> to P2SB itself.
>=20
> So, something like this.
>=20
> - unhide p2sb device
> - cache its bar 0 (with BDF, etc)
> - if F =3D=3D 0, iterate over F =3D=3D 1..7 and if there is a device, cac=
he its
>   bar 0 as well (as in previous entry)
> - make p2sb_bar() to be just a cache lookup call (mutex protected?)
>=20
> Note, P2SB is inside PCI South Bridge, it's unlikely we will see it
> in external / Thunderbolt / etc devices.

Thanks again. I think I understand what you mean. I will post a patch soon.
Please take a look and see if I misunderstand anything.


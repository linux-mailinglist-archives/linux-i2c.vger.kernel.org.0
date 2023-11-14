Return-Path: <linux-i2c+bounces-142-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EAC7EAAAA
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Nov 2023 07:54:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A61D91C209BD
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Nov 2023 06:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7300FB66C;
	Tue, 14 Nov 2023 06:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="jaWB6kDP";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="rZJowvCg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30778F59
	for <linux-i2c@vger.kernel.org>; Tue, 14 Nov 2023 06:54:34 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF0E1D44;
	Mon, 13 Nov 2023 22:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1699944872; x=1731480872;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=ZGwRrC53+HunkHbftO+m0LOIM9EwhjObgf0FUO9rii8=;
  b=jaWB6kDPBV4Rr2oY53HgRWjWpvXg6D1MVV3fxBhgDU7nBnBUZHIsrGQK
   jHr/BBnwPYGvFJTnm8I3YdlGpcVOsj95PVtWWLsvLsG6MuR0B8vne1Hsj
   Z0aS8BSCHtClaGjlojVQAybobx2rKy6OlAJle8mx1Y80cdmugb8zuqunL
   4/bgPU4bdvDDxyKx772SMjxL0voZGCsJWVJJC1t4yrXVBuTeEmjasS3jh
   xBgu11zaIleiPa2U078UcSxUdndqJ7nZqqfyKhbwoT+B/aTtTfO3hZznq
   8+/LLso8ilS7fwoUtkU43kB64/dXAHgbD3IqAtNBOq3OcAjB1V9MJe/0o
   g==;
X-CSE-ConnectionGUID: o34ouOItRkGk2CyNmgxCsQ==
X-CSE-MsgGUID: pTsmt7frTNmgTkz7KiES7A==
X-IronPort-AV: E=Sophos;i="6.03,301,1694707200"; 
   d="scan'208";a="2182171"
Received: from mail-mw2nam12lp2040.outbound.protection.outlook.com (HELO NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.40])
  by ob1.hgst.iphmx.com with ESMTP; 14 Nov 2023 14:54:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZRavkqU3tfUxJAv9jD0exJggf3ryRthadC/5Gv/aINFKxS5IQvit4fvHOIPNh764mhjf+IHE//xv3EWkpx9bDYYUBiz6kQjwy98P0JyiZhTCikJzmMUFX7TG4fshQ+Sr6OfbzGsJwWNVCA40GkoSTxlzZ/sa2IkKLa66JBAMosmoVD4ytHsG9E7WFgblfv2luWDz2E5s6EpXm+QI3gd3j/XnJjKPxK3qtePLithB7foWq0iOEdWPezGU16Bv9eBYzssEWR/URx+73K/AnuY1V1smSZY0g8/d2k3wETCcXKvYVhzJa5tObItpBEWh1x7eJ3vjxQNjgR8q+iIc+CjJRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xO3PMmrHA3h0Sjw1ps7ST94BX+DyNQ8O34lzWmJLc1M=;
 b=gKRCsZd569/FcKYhl3juWhq6/SR74JuxVJ9I+U8ifuqz9Hx9lGWjVeQ6xDApNzrYT63rIu42EX6gLAJOqU7MXa7b9xdJOq/ED+bmpGigI4yNcEhxYicmowlR3kZ2GqJMveraNp5vsLHO6H1YdTShKz7DJcxt0Y73ahzT+LwQ42sDIyE3/0848vcD1iB+1Q3TtwFE0SsiBk9Dw7eYJCkfKKhx9kekvfgTKg22N1IR/Vec0CxPRtG70Tci/S7S9BMHMl5mtghjDuBE/QE6iAEGxCDDij6dEEoiz+djFxbL7AaPhidKYLxdHIec+pG3Pj5UqGqrwsJaLKGd+yGk5/h9sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xO3PMmrHA3h0Sjw1ps7ST94BX+DyNQ8O34lzWmJLc1M=;
 b=rZJowvCgZ0lYg9IYR6sXtDF57a03YirTCBf2AjgvCH3KN0lmyfPT/l2KOzsc+TkrqK66IaKmYTRGtzLud6kxY2dAafhXxNy8SC9roDurTmLPO6LbIBxG0/eo3eScVMJROEkO0ez09UHoQqiPdKyry29fZ5xZFqXGQiWijvfzwK0=
Received: from DM8PR04MB8037.namprd04.prod.outlook.com (2603:10b6:8:f::6) by
 DM6PR04MB7115.namprd04.prod.outlook.com (2603:10b6:5:24c::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.31; Tue, 14 Nov 2023 06:54:29 +0000
Received: from DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::2256:4ad2:cd2b:dc9e]) by DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::2256:4ad2:cd2b:dc9e%3]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 06:54:29 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
CC: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: [bug report] lockdep WARN at PCI device rescan
Thread-Topic: [bug report] lockdep WARN at PCI device rescan
Thread-Index: AQHaFsdpw8Adedg0CUyhPBScx+2k2A==
Date: Tue, 14 Nov 2023 06:54:29 +0000
Message-ID: <6xb24fjmptxxn5js2fjrrddjae6twex5bjaftwqsuawuqqqydx@7cl3uik5ef6j>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8037:EE_|DM6PR04MB7115:EE_
x-ms-office365-filtering-correlation-id: b49f84fd-60f2-4aac-2142-08dbe4de8c6e
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 f0SCmx3r+TJ37LFDxu+XaSm6lGEYjqDZEhMWaxDmwT76ttOWF2XtLSpUAYXaSOY0HuvQYgK9kQ5Zbffet/WiFvVOQDUpZVUdJVOfio//xCNE+TFtNiLbUCXfCE14dDlPpueCmsjqFuRVBwk0WbsJgekcxkloodWI7fmjD09UimoLcrE8J/RdRihaSQj13tvj3ZgpXmzSU9pgHckNSR6Ht1BtZk/avBtQTP/Z7AUKElBrepCa3z1w6WhsjNDilERU//KMr/lMV9xVzYuQRgzbCsvQZbeDtDZEjlSSFMJFxtPI81oCO8kCvPdTVfL5V3IlB1LzMda45oeCUDkVe5RC0JdYjbDeqJavsyj8x6wtIPd+xjkQLmVwUp05BwcNO05OxpyxiISG3DD3e1BhvZow02n1030l/FBBRV38ojQP025IdiSh3AMGm6jvWilrQF3M/whetki1rYaLrM+/8THiv4UWYyc17x6DEs32oTt2V3giPdvkSRJna3ZsfLgVKtpvin71pRHR4OSVkRJyMf4fdBsoOA9akP7ZF9K7VWqYbFYMkDO/7mMdo9p2heFImtW8/DO0N33EbxRP01HDaf7ARvO6PoTMl1Xf8BXDVPtRDkxua1i6+93azy98H2XekA8trYSHpopdynq/l7bSBieyZw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8037.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39860400002)(346002)(136003)(366004)(376002)(396003)(230173577357003)(230922051799003)(230273577357003)(64100799003)(1800799009)(186009)(451199024)(478600001)(6506007)(6486002)(966005)(86362001)(33716001)(38070700009)(450100002)(71200400001)(4326008)(8936002)(8676002)(6916009)(6512007)(316002)(9686003)(44832011)(66476007)(64756008)(66446008)(66946007)(66556008)(5660300002)(76116006)(26005)(91956017)(2906002)(83380400001)(41300700001)(122000001)(38100700002)(82960400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?w1lxRQxpm5IkPCh3OXrqe3GNr2vB9a6Yrwx7bZEU27be7hdbvTsW0/7yv6MV?=
 =?us-ascii?Q?xwYS2tib9DSV2XagGjS/By63AjAIH6bC+8L8AoytWDXM/Pym48T+DWSAC7pW?=
 =?us-ascii?Q?D4XsiuIcgA7eg7xLTxZg350XVae/tkxdQ1O8sNkZRzvtCywmIotvS7fG1dj+?=
 =?us-ascii?Q?oFWr0+lDXB1+IVEpn0TdYUJEp8Ez5TGDlnix4BLLkJXp0M77mPheVj+GWIRa?=
 =?us-ascii?Q?WRbGySy1GuTzl1xEZCC0Wp3ME+PRLpx3FiJiIF3rvBGJBvj9UTJOkyVVCVKI?=
 =?us-ascii?Q?Dww5qitOOzK0mRmmIbXbLtFrnldm32iPd0nQYTkOPgsiBBoIFT3qbs43+uPa?=
 =?us-ascii?Q?yiOCkb9T7FCCjRsK5v6KuHbvLC+X2UBLeRflfViRPm4n5CeK3c5fjl0y+IYZ?=
 =?us-ascii?Q?oZ5Hd8vQRV9NlPtfvZvHQQvGIgp55j3WX5whNlw3qc86K2F6ONgtlRo3a+2P?=
 =?us-ascii?Q?7Whjlxn+LYd/7ittUzr/CPddm4iWMo1a+R3W4XbG2HvS92T4DZiVil9a49iF?=
 =?us-ascii?Q?hr49RQrZ28ep0s8OyK+Iqo1l7w6OZNeH66VOuc74+5rGT3Kpd/OIA38vnQlI?=
 =?us-ascii?Q?a+3fYODysSzQDeTfe5b53uGL3a+CXcF2zouqjzT26WXCjvQQQppGN6pvOA3m?=
 =?us-ascii?Q?mnqR4WsDkMv9ofZ7ySpNWpT3HROAj48emE1Rm/UXYprQr77rTclTtWGLK6jc?=
 =?us-ascii?Q?VuE3BsxKLyCg5bDJVVfAx8izERprFbukwsbMvjckvt0cxEN6Fhh1ITqtFOUC?=
 =?us-ascii?Q?GgWm8xk+4TLTNSBahY7MEQmOrWUqfrzWzIAf9aBg++G8B/5Nh9hAYUad5M39?=
 =?us-ascii?Q?i4+tBAlDAz+0bP+nl9GIAlCQ/a6WlkZASnlTVDiW9XlOe6E/ISi6OkOMuogW?=
 =?us-ascii?Q?CVkrXIi1RhB1OoRKpmj29VMbBjC/E1Gxp6Gwp7+rmzGVZqvaImJs3VI9Au8S?=
 =?us-ascii?Q?cMTCJdzGJYOqWn67bosJyakmkR1PdWmwoHPH9XHoiktPbvb3rIciqS20bE1W?=
 =?us-ascii?Q?G9Gu4KA+O5C9du4IEDChxwTyBg6ItnUiFb2FCRv8SrrGKdQMnnX0AWtQ4U5q?=
 =?us-ascii?Q?uXhT3D5e+xPTXmJxEChJ8P6rqtkKk6fr00hvj3YH5gOFTs1CZ+EvMO7t135S?=
 =?us-ascii?Q?s2/OTtUIXfGTCU7RbyV07Bd4FVGi999C5o2qS32lzIouFBesr5nxpUBdzYSG?=
 =?us-ascii?Q?xIm+YxbR4iP1K+wXuHfgg6ni8BFtprtkkOQW3HP1dty2uBbne6N8+UM974Mg?=
 =?us-ascii?Q?DQ+X5uCh+XV4Fb6pRsmU8DMmWzNMXhBUdgMrKUFYc42bNBbWpD0mKwshVZcK?=
 =?us-ascii?Q?HZFVsNzWkAE5qNjw307TvLNWqF8hfUSTTEv8d+Xy1k+mSVVY6TEwgyIPn2fw?=
 =?us-ascii?Q?ao9gnHkDiV5gkvw+KXG1zcHmrvyyT68cawCVnUCDnSWpSIhz96SfGJnENfpJ?=
 =?us-ascii?Q?1TPORmDQntzVrxa9IgHp1XGQ8fhKcksawh6NOwSY2ZknfRkg//hWH13EfsC2?=
 =?us-ascii?Q?dW/qusC22RGERwF8+ZrCAoag77uOhGmyokeUQBulAAVdSThwzzf5HvIJjEcq?=
 =?us-ascii?Q?YicELIaZvXNivotpvzmzKsSUmoDCytjce4KzRPRzj71l16vOWNdL/HmPBGE4?=
 =?us-ascii?Q?hDFcupB0kv+FNhKpVBmQz44=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EA607B95289354448F815603C4EC2D83@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xGjx0L4Ji6T0glljXD8/M5QvDeB4tdqze2ScslnR2BuYBFn1VnBJOmZaekrjXHl6SFlykfHKWJ3CAmnfBG1lGMnfuPq5JM54ES1+SiZgjmrEeyWBOvJDCkOwaIF0ko2ec84npHRA61Jv5u2wOHaRGVKsj1yXLaBKaPC/Wpqx79aLKuAsAwe0K8HL7pxemkG7y7Hyj6YlYD5Qz+KBIJuk/43+B3MD0aebK7HLn2W2/xcB0obwhlPlgAfDwVPWB1bs5YE075N5SmICf7En49++bESSUG5HivEBddMZ25tg9PuutepydI5MOeLQKXmAzA/CapJ2HcXA8ohUf5yZYYMLTJ6oiyWn3Dm23TEJ3jx6MMOK4uLB/5KOOWXiKHJEZ85IupbM4oGiBghFtMuzlSya5ZvjHAaTxLT8BqrZiC9M5guCMigf2XJwIWMFKN1A3QJQWcORZn+gGFGCAEkTBJSTqUS+SWi1wheUSWq5DKIMFgnbpKddZ2zUGEBqL3UYblRW7L2S/Z/ifoptzEUKPOEzBev010vlsOHUsWeC7kqqOMRmf56feQ3Sv3VtKrmS8LjaxHkdbRoEYzqJUrMB4TSDipRIXgueuX/IneVebi3Ir19Mjgvp+Bu+sSrkHme5tqk5BOCyrfZ5VG1CiagxYyM4iz+KNyroHg13MRZIhFmKf8394S4L8nOtI1gmSQW/jfPmUvzphvfjDtg4HWOad9LxG+yaXqfZQ+lsH7zhOq/gx+xDNcdmQIHgXhELvveQXrvNJk1D+w7KLFUK1X2g0TCs8IzCs6Q08pquD2Ev9K9b/Rg=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8037.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b49f84fd-60f2-4aac-2142-08dbe4de8c6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2023 06:54:29.2899
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: btF/b8+sEvkUgYP9vynNppkYAK69dRsEoWn4OPjZVFBLlE1cpxGllqXHjWwI3ed7Y9yORrnvK6rR42LUNZAW+KhvL7YY+xM1YprWp/uIzjY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB7115

Hello there.

Recently I tried a couple of commands below on the kernel v6.6 and v6.7-rc1=
,
then observed a lockdep WARN at the second command [1]. The first command
removes a PCI device, and the second command rescans whole PCI devices to
regain the removed device.

 # echo 1 > /sys/bus/pci/devices/0000:51:00.0/remove
 # echo 1 > /sys/bus/pci/rescan

I tried this rescan for SAS-HBA or AHCI controller with HDDs. When those de=
vices
are left in weird status after some kernel tests, I want to remove the SAS-=
HBA
and AHCI controller and rescan to get back the devices in good status. This
rescan looks working good except the WARN.

The lockdep splat indicates possible deadlock between pci_rescan_remove_loc=
k
and work_completion lock have deadlock possibility. Is the lockdep WARN a k=
nown
issue? I found a similar discussion in the past [2], but it did not discuss=
 the
work_completion lock, so my observation looks a new, different issue.

In the call stack, I found that the workqueue thread for i801_probe() calls
p2sb_bar(), which locks pci_rescan_remove_lock. IMHO, the issue cause looks=
 that
pci_rescan_remove_lock is locked in both workqueue context and non-workqueu=
e
context. As a fix trial, I created a quick patch [3]. It calls i801_probe()=
 in
non-workqueue context only by adding a new flag to struct pci_driver. With =
this,
I observed the lockdep WARN disappears. Is this a good solution approach? I=
f
not, is there any other better solution?

[1] kernel message log at the second command

[  242.922091] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
[  242.931663] WARNING: possible circular locking dependency detected
[  242.938292] mpt3sas_cm1: 63 BIT PCI BUS DMA ADDRESSING SUPPORTED, total =
mem (56799464 kB)
[  242.939415] 6.7.0-rc1-kts #1 Not tainted
[  242.939419] ------------------------------------------------------
[  242.939421] bash/1615 is trying to acquire lock:
[  242.939424] ff1100017bf87910 ((work_completion)(&wfc.work)){+.+.}-{0:0},=
 at: __flush_work+0xc5/0x980
[  242.989069]=20
               but task is already holding lock:
[  243.000283] ffffffff870bf4a8 (pci_rescan_remove_lock){+.+.}-{3:3}, at: r=
escan_store+0x96/0xd0
[  243.012269]=20
               which lock already depends on the new lock.

[  243.028569]=20
               the existing dependency chain (in reverse order) is:
[  243.041611]=20
               -> #1 (pci_rescan_remove_lock){+.+.}-{3:3}:
[  243.053709]        __mutex_lock+0x16a/0x1880
[  243.060767]        p2sb_bar+0xa7/0x250
[  243.067213]        i801_add_tco_spt.constprop.0+0x88/0x1f0 [i2c_i801]
[  243.076707]        i801_add_tco+0x18a/0x210 [i2c_i801]
[  243.084727]        i801_probe+0x99c/0x1500 [i2c_i801]
[  243.092618]        local_pci_probe+0xd6/0x190
[  243.099708]        work_for_cpu_fn+0x4e/0xa0
[  243.106673]        process_one_work+0x736/0x1230
[  243.114012]        worker_thread+0x723/0x1300
[  243.121039]        kthread+0x2ee/0x3d0
[  243.127372]        ret_from_fork+0x2d/0x70
[  243.134073]        ret_from_fork_asm+0x1b/0x30
[  243.141140]=20
               -> #0 ((work_completion)(&wfc.work)){+.+.}-{0:0}:
[  243.153341]        __lock_acquire+0x2e74/0x5ea0
[  243.160490]        lock_acquire+0x196/0x4b0
[  243.167236]        __flush_work+0xe2/0x980
[  243.173882]        work_on_cpu_key+0xcc/0xf0
[  243.180709]        pci_device_probe+0x548/0x740
[  243.187813]        really_probe+0x3df/0xb80
[  243.194525]        __driver_probe_device+0x18c/0x450
[  243.202128]        driver_probe_device+0x4a/0x120
[  243.209437]        __device_attach_driver+0x15e/0x270
[  243.217149]        bus_for_each_drv+0x101/0x170
[  243.224260]        __device_attach+0x189/0x380
[  243.231254]        pci_bus_add_device+0x9f/0xf0
[  243.238360]        pci_bus_add_devices+0x7f/0x190
[  243.245639]        pci_bus_add_devices+0x114/0x190
[  243.253017]        pci_rescan_bus+0x23/0x30
[  243.259711]        rescan_store+0xa2/0xd0
[  243.266187]        kernfs_fop_write_iter+0x356/0x530
[  243.273735]        vfs_write+0x513/0xd60
[  243.280090]        ksys_write+0xe7/0x1b0
[  243.286412]        do_syscall_64+0x5d/0xe0
[  243.292908]        entry_SYSCALL_64_after_hwframe+0x6e/0x76
[  243.301053]=20
               other info that might help us debug this:

[  243.315550]  Possible unsafe locking scenario:

[  243.325803]        CPU0                    CPU1
[  243.332654]        ----                    ----
[  243.339492]   lock(pci_rescan_remove_lock);
[  243.345937]                                lock((work_completion)(&wfc.w=
ork));
[  243.355852]                                lock(pci_rescan_remove_lock);
[  243.365170]   lock((work_completion)(&wfc.work));
[  243.372235]=20
                *** DEADLOCK ***

[  243.384100] 5 locks held by bash/1615:
[  243.390048]  #0: ff1100013f4b0418 (sb_writers#4){.+.+}-{0:0}, at: ksys_w=
rite+0xe7/0x1b0
[  243.400833]  #1: ff11000128429888 (&of->mutex){+.+.}-{3:3}, at: kernfs_f=
op_write_iter+0x21d/0x530
[  243.412623]  #2: ff11000103849968 (kn->active#136){.+.+}-{0:0}, at: kern=
fs_fop_write_iter+0x241/0x530
[  243.424832]  #3: ffffffff870bf4a8 (pci_rescan_remove_lock){+.+.}-{3:3}, =
at: rescan_store+0x96/0xd0
[  243.436773]  #4: ff1100019cc7e1a8 (&dev->mutex){....}-{3:3}, at: __devic=
e_attach+0x67/0x380
[  243.448048]=20
               stack backtrace:
[  243.456654] CPU: 16 PID: 1615 Comm: bash Not tainted 6.7.0-rc1-kts #1
[  243.465797] Hardware name: Supermicro SYS-520P-WTR/X12SPW-TF, BIOS 1.2 0=
2/14/2022
[  243.476145] Call Trace:
[  243.480820]  <TASK>
[  243.485084]  dump_stack_lvl+0x57/0x90
[  243.491112]  check_noncircular+0x2e1/0x3c0
[  243.497630]  ? __pfx_check_noncircular+0x10/0x10
[  243.504747]  ? __pfx___bfs+0x10/0x10
[  243.510680]  ? lockdep_lock+0xbc/0x1a0
[  243.516811]  ? __pfx_lockdep_lock+0x10/0x10
[  243.523436]  __lock_acquire+0x2e74/0x5ea0
[  243.529866]  ? __pfx___lock_acquire+0x10/0x10
[  243.536682]  lock_acquire+0x196/0x4b0
[  243.542710]  ? __flush_work+0xc5/0x980
[  243.548829]  ? __pfx_lock_acquire+0x10/0x10
[  243.555442]  ? __pfx___lock_acquire+0x10/0x10
[  243.562252]  ? driver_probe_device+0x4a/0x120
[  243.569061]  ? __device_attach_driver+0x15e/0x270
[  243.576282]  ? mark_lock+0xee/0x16c0
[  243.582222]  ? __flush_work+0xc5/0x980
[  243.588364]  __flush_work+0xe2/0x980
[  243.594300]  ? __flush_work+0xc5/0x980
[  243.600425]  ? __queue_work+0x4e4/0xe30
[  243.606658]  ? __pfx___flush_work+0x10/0x10
[  243.613287]  ? lock_is_held_type+0xce/0x120
[  243.619917]  ? queue_work_on+0x69/0xa0
[  243.626032]  ? lockdep_hardirqs_on+0x7d/0x100
[  243.632834]  work_on_cpu_key+0xcc/0xf0
[  243.638950]  ? __pfx_work_on_cpu_key+0x10/0x10
[  243.645849]  ? __pfx_work_for_cpu_fn+0x10/0x10
[  243.652738]  ? __pfx_local_pci_probe+0x10/0x10
[  243.659638]  pci_device_probe+0x548/0x740
[  243.666057]  ? __pfx_pci_device_probe+0x10/0x10
[  243.673057]  ? kernfs_create_link+0x167/0x230
[  243.679855]  really_probe+0x3df/0xb80
[  243.685860]  __driver_probe_device+0x18c/0x450
[  243.692737]  driver_probe_device+0x4a/0x120
[  243.699314]  __device_attach_driver+0x15e/0x270
[  243.706297]  ? __pfx___device_attach_driver+0x10/0x10
[  243.713890]  bus_for_each_drv+0x101/0x170
[  243.720312]  ? __pfx_bus_for_each_drv+0x10/0x10
[  243.727294]  ? lockdep_hardirqs_on+0x7d/0x100
[  243.734063]  ? _raw_spin_unlock_irqrestore+0x35/0x60
[  243.741505]  __device_attach+0x189/0x380
[  243.747747]  ? __pfx___device_attach+0x10/0x10
[  243.754554]  pci_bus_add_device+0x9f/0xf0
[  243.760836]  pci_bus_add_devices+0x7f/0x190
[  243.767328]  pci_bus_add_devices+0x114/0x190
[  243.773890]  pci_rescan_bus+0x23/0x30
[  243.779741]  rescan_store+0xa2/0xd0
[  243.785362]  ? __pfx_rescan_store+0x10/0x10
[  243.791785]  kernfs_fop_write_iter+0x356/0x530
[  243.798516]  vfs_write+0x513/0xd60
[  243.804054]  ? __pfx_vfs_write+0x10/0x10
[  243.810193]  ? __fget_light+0x51/0x220
[  243.816125]  ? __pfx_lock_release+0x10/0x10
[  243.822555]  ksys_write+0xe7/0x1b0
[  243.828097]  ? __pfx_ksys_write+0x10/0x10
[  243.834327]  ? syscall_enter_from_user_mode+0x22/0x90
[  243.841736]  ? lockdep_hardirqs_on+0x7d/0x100
[  243.848366]  do_syscall_64+0x5d/0xe0
[  243.854114]  ? do_syscall_64+0x6c/0xe0
[  243.860053]  ? do_syscall_64+0x6c/0xe0
[  243.865989]  ? lockdep_hardirqs_on+0x7d/0x100
[  243.872608]  ? do_syscall_64+0x6c/0xe0
[  243.878537]  ? lockdep_hardirqs_on+0x7d/0x100
[  243.885147]  entry_SYSCALL_64_after_hwframe+0x6e/0x76
[  243.892555] RIP: 0033:0x7fee10d53c34
[  243.898305] Code: c7 00 16 00 00 00 b8 ff ff ff ff c3 66 2e 0f 1f 84 00 =
00 00 00 00 f3 0f 1e fa 80 3d 35 77 0d 00 00 74 13 b8 01 00 00 00 0f 05 <48=
> 3d 00 f0 ff ff 77 54 c3 0f 1f 00 55 48 89 e5 48 83 ec 20 48 89
[  243.922266] RSP: 002b:00007ffd173e68e8 EFLAGS: 00000202 ORIG_RAX: 000000=
0000000001
[  243.932655] RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007fee10d=
53c34
[  243.942564] RDX: 0000000000000002 RSI: 000055f17c9c4bc0 RDI: 00000000000=
00001
[  243.952485] RBP: 00007ffd173e6910 R08: 0000000000000073 R09: 00000000000=
00001
[  243.962408] R10: 0000000000000000 R11: 0000000000000202 R12: 00000000000=
00002
[  243.972328] R13: 000055f17c9c4bc0 R14: 00007fee10e245c0 R15: 00007fee10e=
21f20
[  243.982259]  </TASK>

[2] https://patchwork.kernel.org/project/linux-pci/patch/20180921205752.319=
1-1-keith.busch@intel.com/

[3] fix trial patch

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 070999139c6..00d57d4e006 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1820,6 +1820,7 @@ static struct pci_driver i801_driver =3D {
 		.pm	=3D pm_sleep_ptr(&i801_pm_ops),
 		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
 	},
+	.local_probe	=3D true,
 };
=20
 static int __init i2c_i801_init(struct pci_driver *drv)
diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index 51ec9e7e784..161ff37143a 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -368,7 +368,7 @@ static int pci_call_probe(struct pci_driver *drv, struc=
t pci_dev *dev,
 	 * device is probed from work_on_cpu() of the Physical device.
 	 */
 	if (node < 0 || node >=3D MAX_NUMNODES || !node_online(node) ||
-	    pci_physfn_is_probed(dev)) {
+	    pci_physfn_is_probed(dev) || drv->local_probe) {
 		cpu =3D nr_cpu_ids;
 	} else {
 		cpumask_var_t wq_domain_mask;
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 60ca768bc86..6fd086eb26c 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -957,6 +957,7 @@ struct pci_driver {
 	struct device_driver	driver;
 	struct pci_dynids	dynids;
 	bool driver_managed_dma;
+	bool local_probe;
 };
=20
 static inline struct pci_driver *to_pci_driver(struct device_driver *drv)


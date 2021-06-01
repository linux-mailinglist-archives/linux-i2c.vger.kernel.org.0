Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 632143977E8
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jun 2021 18:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232490AbhFAQZa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Jun 2021 12:25:30 -0400
Received: from mail-eopbgr80083.outbound.protection.outlook.com ([40.107.8.83]:21637
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231918AbhFAQZa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 1 Jun 2021 12:25:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gposCFLcfoGE1ZK2JoRHpYT8BmZ0azhaYzr3JZ3D+Y7vBASyxyP2uclHrJ6WWsLMVPvpm5GVJxG/uu48agqfwJM/wGYbY/xo7oQeK5TMuggn4P0apzPvWCatucOJxTNbGFMBFD38GIqtKH0r6xBSsIwRe5n6ZlHc4LNjCC/sRrP5OZ1kewoN5JzRccUe5ljgUYSuCPN/lSIHGQ1GJ7wKXh6ynfw75vQ+KnyFklk4WmxYQ+Ml4Fjab9vOzmk3vaS0LjO1UIugKJ23XdqS3mg6bQo3Z2KfeG21xpPEZ8zlPTfQL/lCu6bUS02UOhmezWGTRob67VUHB0YVDAq7v7PF2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D0SIuaY5EVCfH1/IJQ+dnqhff615y28hCMQdfCyV6cU=;
 b=AK3yyhxRAT0zTDZwo8URHvYOpqACBObsWC2f6Lp1K6uBSAmav5mshDIiIDxCvPbFCOkHdXEVRIxQNVe4wNBslzRNZvdvcdKSoHjEaKsASQR0ClFAY0s8bqT10I1LuYq91FpdtV489+CtNQ5Im1XL1mmxrqVlbm4VU2cKOoRRRYqessUr162uDQQAx8iggJKOzgNBZ8VchSBD2JHQWBzGj5PJEChvL/eYwFpBE1G+MJtzgpPbEVIIXt/Fsod5i801wRCp1Nx77NecgESoR7dBSIkWX3f9YhywojXOyMB6DVd3Q07E9i9BMZmY2aDSe7GERrkqS6MqsvXdumC68azNEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D0SIuaY5EVCfH1/IJQ+dnqhff615y28hCMQdfCyV6cU=;
 b=OrO2voykp+ReO6arZ38Xun/BMAvZEYN7H8v+dYhlEr/a07c9vf59xLhHlYL4jQ/XrlyN64QtnX2knLuCwVyf095/zXPgKCjv/4VnAHzLx8vCYlyn61H7JT0xIDGPgWB3swOEESwgi9mZue2rIm+Mpz5zbPznOFnxrL2iRChBGuU=
Received: from HE1PR0102MB2634.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:17::23) by HE1PR0101MB2137.eurprd01.prod.exchangelabs.com
 (2603:10a6:3:1d::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Tue, 1 Jun
 2021 16:23:44 +0000
Received: from HE1PR0102MB2634.eurprd01.prod.exchangelabs.com
 ([fe80::921:9f66:e26d:fee]) by HE1PR0102MB2634.eurprd01.prod.exchangelabs.com
 ([fe80::921:9f66:e26d:fee%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 16:23:44 +0000
From:   Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
To:     Alexander Fomichev <fomichev.ru@gmail.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "linux@yadro.com" <linux@yadro.com>
Subject: RE: [PATCH] misc: eeprom: at24: fix NVMEM name with custom AT24
 device name
Thread-Topic: [PATCH] misc: eeprom: at24: fix NVMEM name with custom AT24
 device name
Thread-Index: AQHXVt/b0GxWW0SorUWPczWozx79har/HiFQ
Date:   Tue, 1 Jun 2021 16:23:44 +0000
Message-ID: <HE1PR0102MB26344A26F83308A03A0FF5DA883E9@HE1PR0102MB2634.eurprd01.prod.exchangelabs.com>
References: <20201203214703.18258-1-Diego.SantaCruz () spinetix ! com>
 <20210601121542.a6gboyskhthd2bbv@yadro.com>
In-Reply-To: <20210601121542.a6gboyskhthd2bbv@yadro.com>
Accept-Language: en-GB, fr-CH, fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=spinetix.com;
x-originating-ip: [178.198.240.12]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6e36cba1-bdb1-4ed8-b3cf-08d92519a064
x-ms-traffictypediagnostic: HE1PR0101MB2137:
x-microsoft-antispam-prvs: <HE1PR0101MB2137CEA8C44327CC73239A3B883E9@HE1PR0101MB2137.eurprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +sXx0nGiWfaMGyXw6MouSSmsR+2Don09I7ge1Bk2UQ3QO2SYtFNgLgwpm+DrJhxHAb0EwQ4wSMlcxfgpmDlUGX/nsJ6zMJ14oKmSJMeUhrL8iog4Hb5wJRCNqNRATeiBM0tu6Tg4Ng/qf7tWMpom8bxrnUMUhvS/q/V+I0TGNzsefs7YPemjnGbVgqGXHb+HHBv9yvoTvN2ViMVd3Ql9ZqjT+VpwvMgJOTykvAYX2c9LYBhAUYRQig+TfFM2VtY46dh0uM+/w8iOJmA9EEWWXeLu/i+/VkiNFlVUri0l6KKQ9FiRytt6wW2KJEoKjYFhD6MrEGk85RbTPIa5dHO+h/LsDO6zozFdgim1G0yj/vqDrB3bEDjB+Qux6g1RrxH/QsBrZpKCNy3TMXrMH9FCHMVk74lCUD7ERJHO70kXTsdvOtEJcUEkgxXjmgSExGhhyd2egjWsMgVKnZUoCVJ0siV7hoNZp+8yNxqEEb77bT3fSOvcguEQsrKh7y7/NRE5G/fWiHsDNHyfDO+y6mGb8u+Dh92h5wa5a+okeoYyA50ATCJBlK3BfoRE6UBhzeK78jXvR5A3sZDb1r8qoFwe0tMirp11q0+9uBE5JCoFP2M=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0102MB2634.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(53546011)(9686003)(8936002)(86362001)(6506007)(66556008)(64756008)(38100700002)(66446008)(76116006)(186003)(508600001)(52536014)(7696005)(33656002)(110136005)(4326008)(71200400001)(55016002)(8676002)(5660300002)(54906003)(122000001)(26005)(66476007)(83380400001)(66946007)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?fNGsFWYyKmSXrtNQoItDou0sR6rgGL/8eIf9hV3UZlqbI4hw+qN6E/46Wq53?=
 =?us-ascii?Q?FYqik/P5F5CBlAEGPxM8iyMM2k1qWXaaVv8dbc6cw5gHCWZ8MV00tlpZzIJf?=
 =?us-ascii?Q?oSlv5e78KUQ0RbS8oVlwXL7/vYgpO9yFDQobn30NeusIVeof0NFT566En4Wq?=
 =?us-ascii?Q?NRkZbRgXXdswen0LvwTq+H++LX2VdSkQPG2YquTv6QlFj3n21ZJremAGC4C0?=
 =?us-ascii?Q?0iog1KTloP01BXUGGcaGqwqiP9/sTBh/1tkbeKfbZXAH7B0QZ6OYEsaKwKZQ?=
 =?us-ascii?Q?dOJh9mKYTbm8IkGx/zXTXzGWI/XvTBXuxjQHbw7UiY94K2VBtmyRRXxKSlr9?=
 =?us-ascii?Q?T9SHhRNLvdj/viBksqYUnuq7YYYTrPF/NpDAUrmXbLFVDbsOx4L0z/nqq8XT?=
 =?us-ascii?Q?fCFRo51Qf3BbZU7kBgMLwr44gmTqT9pjDojT8EdgiQuzXAvmvFNubAsQF3hl?=
 =?us-ascii?Q?M7gf84MVq0vFTtZaARdB9u8CNt7Ifu99+pcTArWDaHFHJRnfhKd4b9ZjjQ+0?=
 =?us-ascii?Q?6HGuFI0/dgF3GkkoJiY6m4PDUjv163SUBGI37OmH58u9O2mKX/7A4HtlauAA?=
 =?us-ascii?Q?P+Rep60k76KqKpwjcY/eot4pJReGqLWrOtOctCp8UqSc/sultIKA21trMy4b?=
 =?us-ascii?Q?a9Sjcbe2tMTOeDLFa9Wh9Y+o5CarUb6XKjNSbN+9YCUHPVJY8ZlPC3Ow/JjL?=
 =?us-ascii?Q?S8eScNvUyT/tbQ9GdkuMYDnecW0KCKP6zYx1zRp+wZfcKTv1iG5htZ/T5E9L?=
 =?us-ascii?Q?F6TFWIlHzEXMXBOTxriljfaG7NHHgjMAJxo2jOB1K71ii6Z0pwBis86tMRgV?=
 =?us-ascii?Q?05ZoyuWuYug4qRitBIHDzLSWbi5olFBpfftOBJHhGqKX16iC2NRE29PF6MaJ?=
 =?us-ascii?Q?6n8wPLWirkeqNgoTlaD7gU15mm5eGqt+bU0ACO0uKzzfAhgUXuSQ+h+Lscee?=
 =?us-ascii?Q?I7DrwNiCxv6OSgOhZBbkJrrIA4AlO27K1MeL+eMaELnh03ucRYG9yvjXpMQu?=
 =?us-ascii?Q?XTBg2TlAz7LLJw1wSYl/oL77hgTVQZmUw00bToXgn0S+E8No7l+ikDU/Qpig?=
 =?us-ascii?Q?74BFhmJZ3T3r2AxGyA1SrY6M8PQlwN6Xs0hnLioQ9PNmN5K1rdkZvVkt2X8I?=
 =?us-ascii?Q?ultLiII+k8lmojccspHzb44xW09pczT4jdqP+tHVP7dZ0lD6iZHRHDq4EdhT?=
 =?us-ascii?Q?rbZLtllfBQsI8HrYmoIk01zT1wuot6FeiN3+vzAeb/L3p9eqFK48edAYVRWK?=
 =?us-ascii?Q?TYWcd2NCNtT9jW+3YVKbowWpMU8aeSUtLvL8jelgwUpfjN5JNaXgbogCs2Sh?=
 =?us-ascii?Q?RJ9S8oup/jXJz9OZFRugeQ9K?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0102MB2634.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e36cba1-bdb1-4ed8-b3cf-08d92519a064
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2021 16:23:44.3541
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XRASVqR4RRTLL0DEesJ8gErc+gegtZrhpONoUrcZjiQBMp/YeNLNlbTP5+hYXWq6OkEJYmo2zPeah1yzzOjYdSDjU1AocHH5/kWxJtJ+Ww8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0101MB2137
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> -----Original Message-----
> From: Alexander Fomichev <fomichev.ru@gmail.com>
> Sent: 01 June 2021 14:16
> To: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>; linux-
> i2c@vger.kernel.org
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>; linux@yadro.com
> Subject: Re: [PATCH] misc: eeprom: at24: fix NVMEM name with custom
> AT24 device name
>=20
> On Thu, Dec 03, 2020 at 09:47:03PM +0000, Diego Santa Cruz wrote:
> > When the "label" property is set on the AT24 EEPROM the NVMEM devid is
> > set to NVMEM_DEVID_NONE, but it is not effective since there is a
> > leftover line setting it back to NVMEM_DEVID_AUTO a few lines after.
> >
> > Fixes: 61f764c307f6 ("eeprom: at24: Support custom device names for AT2=
4
> EEPROMs")
> > Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
> > ---
> >  drivers/misc/eeprom/at24.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> > index 35fabaf539b7..fbf69148b5ad 100644
> > --- a/drivers/misc/eeprom/at24.c
> > +++ b/drivers/misc/eeprom/at24.c
> > @@ -704,7 +704,6 @@ static int at24_probe(struct i2c_client *client)
> >
> >  	nvmem_config.type =3D NVMEM_TYPE_EEPROM;
> >  	nvmem_config.dev =3D dev;
> > -	nvmem_config.id =3D NVMEM_DEVID_AUTO;
> >  	nvmem_config.read_only =3D !writable;
> >  	nvmem_config.root_only =3D !(flags & AT24_FLAG_IRUGO);
> >  	nvmem_config.owner =3D THIS_MODULE;
>=20
> This commit (4e302c3b568eaf2aeebba804c07aba5d921a8c9e) makes a
> regress
> on powerpc64 systems. Tested on YADRO VESNIN (POWER8) and
> SuperMicro/IBM
> 9006-22P (POWER9) servers.
>=20

That commit is only making the previous commit 61f764c307f6 ("eeprom: at24:=
 Support custom device names for AT24 EEPROMs") take its intended effect in=
 full.
And if I get 61f764c307f6 correctly it makes the name from the "label" prop=
erty and sets the id to NVMEM_DEVID_NONE, and commit 4e302c3b568e just remo=
ves the leftover override to NVMEM_DEVID_AUTO so that 61f764c307f6 does wha=
t was intended.

The -17 is actually EEXIST, so probably the name is already being used by a=
nother device.
Although reverting 4e302c3b568e fixes the issue, it is probably not the cor=
rect solution. At a minimum the line that sets the id to NVMEM_DEVID_NONE w=
ould have to be removed and the comments from 61f764c307f6 adjusted to refl=
ect reality.

I have no powerpc64 systems nor any knowledge to find the real issue, altho=
ugh I expect a better solution can be found.=20

> The error is logged multiple times in dmesg as following fragment:
>=20
> [    5.164711] CPU: 26 PID: 1532 Comm: systemd-udevd Tainted: G        W
> 5.12.0-at24-catch+ #10
> [    5.164714] Call Trace:
> [    5.164715] [c000000052e2f010] [c000000000913610]
> dump_stack+0xc4/0x114 (unreliable)
> [    5.164721] [c000000052e2f060] [c00000000061bb88]
> sysfs_warn_dup+0x88/0xc0
> [    5.164726] [c000000052e2f0e0] [c00000000061c2ac]
> sysfs_do_create_link_sd+0x17c/0x190
> [    5.164730] [c000000052e2f130] [c000000000ac1854]
> bus_add_device+0x94/0x1d0
> [    5.164735] [c000000052e2f1b0] [c000000000abcff8]
> device_add+0x428/0xb90
> [    5.164738] [c000000052e2f2a0] [c000000000dea270]
> nvmem_register+0x220/0xe00
> [    5.164743] [c000000052e2f390] [c000000000deaeac]
> devm_nvmem_register+0x5c/0xc0
> [    5.164747] [c000000052e2f3d0] [c008000016ca0c1c]
> at24_probe+0x664/0x8d0 [at24]
> [    5.164753] [c000000052e2f650] [c000000000cfd404]
> i2c_device_probe+0x194/0x650
> [    5.164757] [c000000052e2f6f0] [c000000000ac357c]
> really_probe+0x1cc/0x790
> [    5.164761] [c000000052e2f790] [c000000000ac3c9c]
> driver_probe_device+0x15c/0x200
> [    5.164766] [c000000052e2f810] [c000000000ac470c]
> device_driver_attach+0x11c/0x130
> [    5.164771] [c000000052e2f850] [c000000000ac4810]
> __driver_attach+0xf0/0x200
> [    5.164775] [c000000052e2f8d0] [c000000000abf998]
> bus_for_each_dev+0xa8/0x130
> [    5.164779] [c000000052e2f930] [c000000000ac2944]
> driver_attach+0x34/0x50
> [    5.164783] [c000000052e2f950] [c000000000ac1e30]
> bus_add_driver+0x1b0/0x2f0
> [    5.164788] [c000000052e2f9e0] [c000000000ac58f4]
> driver_register+0xb4/0x1c0
> [    5.164792] [c000000052e2fa50] [c000000000cfcbc8]
> i2c_register_driver+0x78/0x120
> [    5.164796] [c000000052e2fad0] [c008000016ca11f0] at24_init+0x6c/0x88
> [at24]
> [    5.164801] [c000000052e2fb30] [c0000000000122c0]
> do_one_initcall+0x60/0x2c0
> [    5.164805] [c000000052e2fc00] [c000000000253bdc]
> do_init_module+0x7c/0x350
> [    5.164809] [c000000052e2fc90] [c000000000257d24]
> __do_sys_finit_module+0xd4/0x160
> [    5.164813] [c000000052e2fdb0] [c00000000002bfb4]
> system_call_exception+0xf4/0x200
> [    5.164817] [c000000052e2fe10] [c00000000000cf70]
> system_call_vectored_common+0xf0/0x268
> [    5.164821] --- interrupt: 3000 at 0x7f35ee3fb4c4
> [    5.164823] NIP:  00007f35ee3fb4c4 LR: 0000000000000000 CTR:
> 0000000000000000
> [    5.164825] REGS: c000000052e2fe80 TRAP: 3000   Tainted: G        W
> (5.12.0-at24-catch+)
> [    5.164828] MSR:  900000000280f033
> <SF,HV,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 44222884  XER: 00000000
> [    5.164842] IRQMASK: 0
>                GPR00: 0000000000000161 00007ffffbf36390 00007f35ee4e7000
> 0000000000000006
>                GPR04: 00007f35ee6ab510 0000000000000000 0000000000000006
> 0000000000000000
>                GPR08: 0000000000000000 0000000000000000 0000000000000000
> 0000000000000000
>                GPR12: 0000000000000000 00007f35ee78e680 0000000020000000
> 0000000000000000
>                GPR16: 0000000000000000 00000c0344781980 00000c0344781a18
> 00000c0344781948
>                GPR20: 0000000000000000 00000c0350142a20 00007ffffbf365f0
> 00000c03501b4d90
>                GPR24: 0000000000000000 00000c0350142a20 0000000000020000
> 00000c0350139830
>                GPR28: 00007f35ee6ab510 0000000000020000 0000000000000000
> 00000c0350142a20
> [    5.164883] NIP [00007f35ee3fb4c4] 0x7f35ee3fb4c4
> [    5.164885] LR [0000000000000000] 0x0
> [    5.164887] --- interrupt: 3000
> [    5.165102] at24: probe of 8-0057 failed with error -17
>=20
>=20
> Reverting the patch solves the issue.
>=20
>=20
> Reported-by: Alexander Fomichev <fomichev.ru@gmail.com>
> CC: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> CC: linux@yadro.com
>=20
> --
> Regards,
>   Alexander
--=20
Diego Santa Cruz, PhD
Technology Architect
spinetix.com



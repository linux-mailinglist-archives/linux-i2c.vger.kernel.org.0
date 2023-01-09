Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A71B0662C59
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jan 2023 18:12:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234955AbjAIRMY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Jan 2023 12:12:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236962AbjAIRMF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Jan 2023 12:12:05 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B081A264D;
        Mon,  9 Jan 2023 09:10:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ib/G3d6VZsnO7xGPt5j2Rs0vtBWpn0aV06GjbF4rCWJArM0WZpHhAzpnkVwNhl0RktJFYl9h3UdF6x8OuPh5GXIdAyDpOLZAJ5R1VhHzFS07HrSVd786rulraFcSaTaWsExev6ymUeMSF9EVu9IyI9exQqssWaUZ/uxPUy8ykaPivfDmhZ+mOFeufEFNKtc2tkTIC1O5ni/nIcdBvIbeviOT/USh6e+o8/LrdrwTD33bO5hX3az5fk/Y3RRbJR5oIey43eKM6Z/79H33knQgmCf67lS8WSu8Qq/FMPU3jFpXM9VeAuum/9HQ3IQ252nyC3848ZJfwNktP0sn92ksyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8uZaD8baIefCdUbhr8Og5yH8uWln5juaT5msMOV0j38=;
 b=DQ+HLeI8+CnDMv3VdnmfhaizsscRO/USAZKti7M0HQt0rXmXrAFQNkBw7Aah63NrRvwHmjt5EzhfpQSkT+L62YPFq6VcBgmbMhqOAEtGCq79xscfQW9RBf1MdVbVqyLEkmCH02YPJM8IHA9qDXm1GcEr9STV8XSfZ09WsFc2PO+xmEN+HRxHRZ8vm11+KphSJ9QgLEpnA3e81iW4Oh3yV7JAeh1JwiZ77i8pYpKbxgass7NNRV+tOIm424a2DDwbEyFClOShh0akezwTRWMV2RlmIUs4LM8A8URAPyFT8EhpTV1rzhAt/+KBYCSpIdIh5nG9fElbnhTEZVTwbM/QHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8uZaD8baIefCdUbhr8Og5yH8uWln5juaT5msMOV0j38=;
 b=XeEwtUh3kB6XiYyo7H1v3hA6ddyV9Omn/5yFkIY0n9yKbxd8oEReumVuPUstGlH2UM1qjQ8mNismiogAQLhk4jlKdFRwWN87TAWoi2iLpsJ2UuKJ9MT/0GBJ1gc3Qcq96dKFJrjkBoUBdoGbrlqrcu8dX9uZu/A+NPtHXhB6dNk=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH8PR12MB6841.namprd12.prod.outlook.com (2603:10b6:510:1c8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 17:10:45 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ff3c:2d37:75f3:442a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ff3c:2d37:75f3:442a%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 17:10:45 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     Grzegorz Bernacki <gjb@semihalf.com>,
        Borislav Petkov <bp@alien8.de>,
        =?iso-8859-2?Q?Jan_D=B1bro=B6?= <jsd@semihalf.com>
CC:     Borislav Petkov <bp@suse.de>, Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "rrangel@chromium.org" <rrangel@chromium.org>,
        "upstream@semihalf.com" <upstream@semihalf.com>,
        "M K, Muralidhara" <Muralidhara.MK@amd.com>,
        "Chatradhi, Naveen Krishna" <NaveenKrishna.Chatradhi@amd.com>,
        "Ghannam, Yazen" <Yazen.Ghannam@amd.com>,
        "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
Subject: RE: [PATCH -next 1/2] i2c: designware: Switch from using MMIO access
 to SMN access
Thread-Topic: [PATCH -next 1/2] i2c: designware: Switch from using MMIO access
 to SMN access
Thread-Index: AQHYyc72PJa6vYxdLkqirPQlPSziYK3iUqGAgAY0t4CAAdIHAIAAAecAgAAIyYCAANl4AIAAAI8AgABCL4CAAASeAIAABw6AgAYtMQCAACBVgIAx4oEAgHLm34CAAGLoYA==
Date:   Mon, 9 Jan 2023 17:10:45 +0000
Message-ID: <MN0PR12MB61011C8ED719A2FBDF823E17E2FE9@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <60a52348-7d50-1056-a596-e154f87c99d2@amd.com>
 <Yyt5LSxSz+6QeWF1@zn.tnic> <YywvmueFj/ibyZdf@smile.fi.intel.com>
 <YywwEvkZK1R9mJfE@smile.fi.intel.com>
 <c0c8bdce-26a0-ad3f-749b-7585d947608b@redhat.com> <YyxrdpUyc+kp48kX@zn.tnic>
 <33d5cc27-474b-fdec-a6b0-84ac16f7d386@redhat.com>
 <CAOtMz3M=BTZUTRMHWGULwMDWmGdOzHKo=UcZeg3sP8_ndVYk2g@mail.gmail.com>
 <YzG657ZFeEvLd6hm@zn.tnic>
 <CAOtMz3MWnmdMbw_CKxBKVt=TJpLNJuZUzpxvnDi+QnigaLozLA@mail.gmail.com>
 <Y7v2j92Ol6dL3FLE@zn.tnic>
In-Reply-To: <Y7v2j92Ol6dL3FLE@zn.tnic>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-01-09T17:06:58Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=615fa9f9-ea76-4202-bd33-db304e962ed6;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2023-01-09T17:10:43Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: bcb5e5ea-3c86-4579-83aa-c490e56b4a9c
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|PH8PR12MB6841:EE_
x-ms-office365-filtering-correlation-id: c89b1362-78f4-45ed-19f1-08daf2647217
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i01nBv4Q1RbShwuQ15qfCrcRSiJJfVKzjhHIZrP6SUophBNoQUDw1YaRM18qYzU7oure+OJtu5UMH6hZ1xLIU3OGP5RjXqv50u2xvZJOBmKyt8Fa6jefCmhK3yi+wyL+DtPDWVMSHVZxpP8d1u6DCSetLvIYZJiIE1jJCF/A1uOvBK04+EA6y8piXIlo3ejoHPh7N0l+KA6lRFp2ljuDUOYX5sRLy3BnF+ltrPn1xEQ/1oZ2clobKhxwDvnYJBplCzdbedTP9F8PzPC24y9BRoXEeSppDfNIpz7ElTR7BWwzUZjiX2GQHd/c+9bk2Ghgk51TVjfHMisvVW0ODEL2UF/WPLZHMfPVlOKRtLkaoKAHr9tt3kMkUmR91JIR7VKngCflReDEoir42p2hy7OcP8wZyPfCuMCJLq8DJ+fOKTqNDGlUr0g8U19ayeejyFldf63BRQE5udSqFoKd3u/u67/DJNeWdokmAy887j/9b1ix1Kn6FjehqSIYxymK2ZFKIsvPHE/3s2Q4PQ+8bXsrYGEeKF1p/3x2GaNnfZeQ9bPVPsqdBaGKihWQ0aktBvM+RScHzBhmnT57gqVJs8BbHnopS66+kSfg8piFvG+z4y9uQEccgF7W79p9IlPFfiZIhgKmQlQNWppOt0jmbGaXvZmAzOZvqJyu3ZkkA8irpei5AKKy5mteOe8ITQvMYv7sR8UF0YqEmEQqnbBdYuMKWg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(376002)(39860400002)(366004)(136003)(451199015)(33656002)(41300700001)(4326008)(83380400001)(52536014)(66946007)(76116006)(8676002)(38100700002)(66476007)(66556008)(64756008)(5660300002)(7416002)(8936002)(66446008)(26005)(55016003)(54906003)(186003)(9686003)(110136005)(45080400002)(122000001)(966005)(7696005)(53546011)(38070700005)(71200400001)(478600001)(6506007)(86362001)(66574015)(316002)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?wq1tMnuzG0/jzC4Ol8BPGMof0eNEEQc7fyfmD5bRI65ivR9651a+jMJfGG?=
 =?iso-8859-2?Q?e4w0ou8bbXpIwxPcy8kb8qDP/JVWmOPLho0hcSbz92qXphDGPHAPgEuUHn?=
 =?iso-8859-2?Q?EmvjWJrEcvK96Dn1VKoBwcIszVjsb+5HmLdkx0jhSWOr4AR/VZY44SxUTh?=
 =?iso-8859-2?Q?8eun8mZEQ0fPhN6wfcYkMKqm1pHetTDEIdLY985wTZ/5IX+l+ASGM5mGmd?=
 =?iso-8859-2?Q?XiVbEN5yPSaNve6mdhqulXyYcuUzyw5EoC1D5rwTyPmTFNW5XmkFwrgvIm?=
 =?iso-8859-2?Q?/0yxFu93VIo1yTFVJ5Gg9fGNDPgAAODjJQjdEsmIDhC0Y18kDrEwgtMSEI?=
 =?iso-8859-2?Q?8ilV8IrvWUv9NOgmI5YC0uBAF0l6YCGOIf4JjVkyYChnGTdxTK5QIIUlQT?=
 =?iso-8859-2?Q?7mGegG+BZp5HwMWDaniQD0QrLJADhmYHaF9NjapZMUfMPlsW02Mdj9dBrX?=
 =?iso-8859-2?Q?KO0gk3EO9FARG3+uwo9B6czmWM3UHIMNeItW7QcocN0lpuZARW8JLunC1o?=
 =?iso-8859-2?Q?/CbcSFslHuy4Qk6/pipJPQ7xby03BOqvsvu2eB+kQF7EdVrsFrnzMyygxV?=
 =?iso-8859-2?Q?tajEm7a9RQr1SDfGeaFw/HVAOE77E9XrY4Ca1eo3sAqv8jD3rB5DItZAKZ?=
 =?iso-8859-2?Q?BzzhDqCP2jmj4piM5KLttIEMij9DCUmM6mCGl9jg/QVmWXh7M8tDo6US4P?=
 =?iso-8859-2?Q?y7WNCxEynIMYl2GHEK6ze6/OYiLe2gNGakR+Nd4bz+yuPoDkoFCtUPZCS2?=
 =?iso-8859-2?Q?xx7vc6i4IetmY0pTucsqMdfM0kLoVxuNiJ8dI3ek+4vqhig3y/7UvxXXw2?=
 =?iso-8859-2?Q?tIKUAPkm+18B3pA+A6CCsLivY6q0be1z742Z6vJ0jMKu6B68IK4CirMF4F?=
 =?iso-8859-2?Q?4pbHQtYh1Ij/mJAkQOWKOgsX8jhFZ7FOxOof5bwIkWxvgIa5GxiQXksz0E?=
 =?iso-8859-2?Q?Lfy5x7VPXmZc1ri1FE5WYEbwpsSXmn+ba+og/Sv/Qq5LE+m04ESFJYM45s?=
 =?iso-8859-2?Q?Ec8CSPo1nD/sC3hGNIDGX033ueVZsySIQUMNZtqBFpgTVvFcyl8Tkmeps2?=
 =?iso-8859-2?Q?IKsFH6HmzTZ2nibkHWqJLnBo3CcIkKOnzYO/anY38r1Oe1wZDSS5RGfjQU?=
 =?iso-8859-2?Q?Lu9xUo794qrGzo6i+JDfQnZHzDA6IVh+TgIxiqRlQC4EdUPO6PihpfmspM?=
 =?iso-8859-2?Q?V9J/1TRa9VUc5qFdTFgDoE71qzSrOC5GV83vYo+TFJys5oeM4xexx4xd9u?=
 =?iso-8859-2?Q?tJ9wZQxbd3xtT9x4GvbzHlO8WWjeck0/ok4dSHbcuN/0APmg1kCHEioaC6?=
 =?iso-8859-2?Q?9adW5UMnklBgQkrv9YvPNO14uwNEdh2WM8i7mBex4LKAo2cmqPqiAscW7J?=
 =?iso-8859-2?Q?HnktlMIFpv5wZbAGl5k32mDPIuGzh015haE1s3yrwEIsjWhUUL5zxzOZjg?=
 =?iso-8859-2?Q?fv4gNjc8swmk4VYEgAoPRDNJV/UHt3ZgtSgaEM7BzNrT4dncwNTEQ7kCQx?=
 =?iso-8859-2?Q?Rf8aFkJ7Z2/+8G4f8NrFPpdJTn7+TZ8pPybKsXela5Bq1QT9ni/XNCigOF?=
 =?iso-8859-2?Q?Tp6m/s84gMyQvLnpIyAiToYT94XAt+bCLUrN8f7Q+zJ2rnVBy+Gk/15Hze?=
 =?iso-8859-2?Q?ZmMHefa9VR6cc=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c89b1362-78f4-45ed-19f1-08daf2647217
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2023 17:10:45.0645
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VgYwzdu9gVdK/fbeV2XFTu+R5T5b1jUfdJ3/rUiu76hp0ADnhunQ5YN52Tp1z74tLypmtWkWsDeMqTFnEX+IZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6841
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

[Public]

+Grzegorz who Jan mentioned is taking over some of this.
+Vijendar for sound/soc/amd

> -----Original Message-----
> From: Borislav Petkov <bp@alien8.de>
> Sent: Monday, January 9, 2023 05:12
> To: Jan D=B1bro=B6 <jsd@semihalf.com>; Limonciello, Mario
> <Mario.Limonciello@amd.com>
> Cc: Borislav Petkov <bp@suse.de>; Hans de Goede
> <hdegoede@redhat.com>; Andy Shevchenko
> <andriy.shevchenko@linux.intel.com>; linux-kernel@vger.kernel.org; linux-
> i2c@vger.kernel.org; jarkko.nikula@linux.intel.com; wsa@kernel.org;
> rrangel@chromium.org; upstream@semihalf.com; M K, Muralidhara
> <Muralidhara.MK@amd.com>; Chatradhi, Naveen Krishna
> <NaveenKrishna.Chatradhi@amd.com>; Ghannam, Yazen
> <Yazen.Ghannam@amd.com>
> Subject: Re: [PATCH -next 1/2] i2c: designware: Switch from using MMIO
> access to SMN access
>=20
> Another forgotten thread... ;-\
>=20
> + Yazen.
>=20
> On Fri, Oct 28, 2022 at 10:32:20AM +0200, Jan D=B1bro=B6 wrote:
> > So to summarize everything, I would like below order:
> >
> > acpi_init() -> init_amd_nbs() -> dw_i2c_init_driver()
> > ^--subsys_initcall   ^--fs_initicall            ^--subsys_initcall
> >
> > but I don't have a clear idea how to achieve this in a clean way.
> >
> > The only option seems to be to register init_amd_nbs() as
> > subsys_initcall and force it to execute after acpi_init() and before
> > dw_i2c_init_drvier(). However the only option (if I'm not mistaken)
> > for forcing order on initcalls placed on the same level is to modify
> > their order within Makefile, so that linker puts them in the "init"
> > section with addresses in desired order. This doesn't seem to be an
> > option for upstream.
> >
> > Do you have any clue how to solve this problem?
>=20
> Make init_amd_nbs() arch_initcall_sync() so that it executes after PCI in=
it.
>=20
> By the time subsys_initcalls come, they'll have all the facilities they n=
eed,
> prepared for them...
>=20
> Along with big fat comment why.
>=20
> Btw, note to myself as I keep wondering about it each time: the sync call=
s
> come
> after the regular ones, in link order if you look at preprocessed linker =
script
> arch/x86/kernel/vmlinux.lds:
>=20
> __initcall_start =3D .;
>  KEEP(*(.initcallearly.init)) __initcall0_start =3D .;
>  KEEP(*(.initcall0.init)) KEEP(*(.initcall0s.init)) __initcall1_start =3D=
 .;
>  KEEP(*(.initcall1.init)) KEEP(*(.initcall1s.init)) __initcall2_start =3D=
 .;
>  KEEP(*(.initcall2.init)) KEEP(*(.initcall2s.init)) __initcall3_start =3D=
 .;
>  KEEP(*(.initcall3.init)) KEEP(*(.initcall3s.init)) __initcall4_start =3D=
 .;
>  KEEP(*(.initcall4.init)) KEEP(*(.initcall4s.init)) __initcall5_start =3D=
 .;
>  KEEP(*(.initcall5.init)) KEEP(*(.initcall5s.init)) __initcallrootfs_star=
t =3D .;
>  KEEP(*(.initcallrootfs.init)) KEEP(*(.initcallrootfss.init)) __initcall6=
_start =3D .;
>  KEEP(*(.initcall6.init)) KEEP(*(.initcall6s.init)) __initcall7_start =3D=
 .;
>  KEEP(*(.initcall7.init)) KEEP(*(.initcall7s.init)) __initcall_end =3D .;
>=20
> Mario, is that something that would work for what you wanna do too?
>=20

Yeah I guess as long as the I2C init comes after arch_initcall_sync this sh=
ould work.

If it works for Jan & Grzegorz, then I think we can also adjust the "effect=
ively local
copy" of amd_smn_write/amd_smn_read that got added into sound/soc/amd
to use this too now and it should work for what I wanted to do too.

Jan/Grzegorz can you please have a try on your system and comment?

> Thx.
>=20
> --
> Regards/Gruss,
>     Boris.
>=20
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpeo
> ple.kernel.org%2Ftglx%2Fnotes-about-
> netiquette&data=3D05%7C01%7Cmario.limonciello%40amd.com%7C56e3280fc
> 1cd416bd7ae08daf23262d0%7C3dd8961fe4884e608e11a82d994e183d%7C0%
> 7C0%7C638088595520420341%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4
> wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7
> C%7C%7C&sdata=3D9t7J4u3W0kxXu717gzIyBJpAvt6YtQOKqtK9AcjWOvg%3D&r
> eserved=3D0

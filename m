Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C050749D28A
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jan 2022 20:36:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240981AbiAZTgW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jan 2022 14:36:22 -0500
Received: from mail-mw2nam10on2040.outbound.protection.outlook.com ([40.107.94.40]:29473
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230462AbiAZTgV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 Jan 2022 14:36:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VRLhLopYqikosXoR2EszajjJL5vSGApcDirW4LSGHs5Xs91WIWzNGubfgJVO6UBiUgzE638OdtQcxLs2NxI1nZH2IVE6/AGMZP3it9/5VzdAtsCNLiTWLJVy61sImIA07OPLhX+jsDVH2XVBQQdUwPpAf1y0Qakm/mEq0rM3FwCmztCJ2Llqc5TahBmlcSeK09mMSyeOuvHVBj9FwfC5Fst/cgHJTCZayMKPLJnGnHkwhet1mEHd3N+xNQgNDTiQsW0tIiku7AJ/kOUQv4wCYY704oii6kbe/8SszNFMZw1FDKF/sZCDp6NMbL7wFKENDlzEOxcc3Q2NdsqB8uwktw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8arMmDwQ7pNYTgPAs4ndth6VaNZY3SMfHUY9MJUcP8A=;
 b=Pnc3o5Jkno6sDvrpufTL+GPI0xPFWmXJoJgQR15XWiOhQDlL2VOSDKDPDctwFIXH4yuwLCkXOii8m8LV0OynOtBelwG9d/ARAgX7D6ItpTrUn+EOzy/k4//KrVzDpuqpSyXvO0aoTHNdZfQ5qYbAAgl3uGRRGz7ws4vuFAL9ctFucZCBaQ9V0EfbPZgbJ7Tw85kXnrFX8Yqs/VU2q7m8SCeGqEfkX0UFrvQ3dV5r4FWS3JpB0i3k90WIz2ExzrQ4ZN/ZTiBTv51vzUGtk9FG0q4shuG1RujfRyrqTZ/P/T+B0JXnuuuQVlSf422zcrp4I+aJpJ8WqB2a6RNnV6MW1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8arMmDwQ7pNYTgPAs4ndth6VaNZY3SMfHUY9MJUcP8A=;
 b=C9GNpbH3wXaYsKNHETgHCmNUEB2Md8A5mpaBRo+h+Qlam6tKXEvNRJ8KprLF0h+9Tq4BwCyuuvTrBSvzhIvOUba7iQP8LtNWTuN9CY/P3ZhyCycC9SGPbWdKTakvNgFjwKtRCrFILtlzrvwbmRVgx16mjzrVWL1LLhvM2l4Eg5o=
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by CH2PR12MB4327.namprd12.prod.outlook.com (2603:10b6:610:7d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.11; Wed, 26 Jan
 2022 19:36:19 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::42f:534d:e82:b59f]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::42f:534d:e82:b59f%4]) with mapi id 15.20.4930.015; Wed, 26 Jan 2022
 19:36:19 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     =?iso-8859-2?Q?Jan_D=B1bro=B6?= <jsd@semihalf.com>,
        "Lendacky, Thomas" <Thomas.Lendacky@amd.com>
CC:     Hans de Goede <hdegoede@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Raul E Rangel <rrangel@chromium.org>,
        Marcin Wojtas <mw@semihalf.com>,
        Grzegorz Jaszczyk <jaz@semihalf.com>,
        "upstream@semihalf.com" <upstream@semihalf.com>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>,
        "Easow, Nimesh" <Nimesh.Easow@amd.com>
Subject: RE: [PATCH 2/2] i2c: designware: Add AMD PSP I2C bus support
Thread-Topic: [PATCH 2/2] i2c: designware: Add AMD PSP I2C bus support
Thread-Index: AQHYDq3Wf7J+XDZDS0q63HnDx9C6raxtRv0AgAB1P8CAAB3HgIAEWQcAgAOFECA=
Date:   Wed, 26 Jan 2022 19:36:19 +0000
Message-ID: <BL1PR12MB51579285BF7D2F87F993C772E2209@BL1PR12MB5157.namprd12.prod.outlook.com>
References: <20220120001621.705352-1-jsd@semihalf.com>
 <20220120001621.705352-3-jsd@semihalf.com>
 <a6e0fc62-4a2e-cd2b-557f-5e86088aeeb7@redhat.com>
 <CAOtMz3NcMZsCMO+15wzzwvF44PqRmem1eP-rCbb+dCiaWiGKzA@mail.gmail.com>
 <b30a212f-643d-c85d-6301-d92ee0adf098@redhat.com>
 <BL1PR12MB5157C8952EF693A93785FBD2E25B9@BL1PR12MB5157.namprd12.prod.outlook.com>
 <d1a29d3e-c213-3478-966b-4ffbe21b1384@amd.com>
 <CAOtMz3N2YU14z9qngacKtwLYOcLwHFHBsAKQDjfztB3-Nuzz_A@mail.gmail.com>
In-Reply-To: <CAOtMz3N2YU14z9qngacKtwLYOcLwHFHBsAKQDjfztB3-Nuzz_A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-01-26T19:35:47Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=2f4fb740-76fc-4e9b-8418-60393be42f7f;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-01-26T19:36:17Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 48c82d1f-2988-4670-9722-5c2c122dda7d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a2cdd2ef-6dba-4870-692f-08d9e1032076
x-ms-traffictypediagnostic: CH2PR12MB4327:EE_
x-microsoft-antispam-prvs: <CH2PR12MB4327F63DAFFADC97FACAECA0E2209@CH2PR12MB4327.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sa16/WFZ5eDhfVdntg65fFxQ+iyXRjCIzuXaTMj9Ta5UKRLbeVxnpApywoUjEoAoXkZNtMxpYlXbp8+IgbPBB06O+u/xbKqlQO1Tb8S2vIC2Qz4Vaq2+oVuh5n2PCG3N5KWERr13RQDCuuo3slNM8J+YrP/6jgWWCkgj0W0nNegdf57493+dYnQHIYQ4CP93fcsBYIJMr3Q91o2rGiCofol+drNC4lh/2g6cFvrg1l2curKbDV0/KEojr9P2bv7AZTPjLA/hp/8sYvaokWaHYzqdPsPf48hAS7zOGx4GfgRLZTeyIRPpeIOtAdpx7zsYZX1sZwTWUyKPzh4gnwSZFEnfVQGkgM3MfWWRDDyMDf2peguJ1Fa2xNviB5QTOOU4zViaxKirdLH5bPbmGIh7BbhDQs3llQHMEyYp/CGbyZZKbfNvFm+mpx+GZImfoO3kF75SpeOpc6ugMla/OKzwCUjiLaxwhnLxXAQGtLDAqDFuGhZmiqSfSbHPiVJI+cpbsHtxJJppM1qy1oRpV6ktkh0b37uZwzHchYNgyFphzfhfg8tXRH4RmL+XBxg7q9GRL/yv4z1OSi/9/OEbggS+TKkLyl/9n4ab7/VlkPq1O+/dn29KWU+tiBgozN/tA/rrsIaRNxt/GIhH7n6GcF+MuQdXeehDx7OlIrt5UnhRt5xmaqCH5WtLqWdNVPB1WXZ4BFSW0jC6m/IC0t7j1vnTjnklYMKTOvyfCcTIt9+UdI4rfu39gAZ0+Mx70e4MRHV4hp81nsIysm9Y6zp5Ac0eVKM4swfG5qWOUSDUV+IdZc4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5157.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(33656002)(38100700002)(508600001)(186003)(86362001)(5660300002)(38070700005)(45080400002)(66556008)(8936002)(7696005)(6636002)(9686003)(66476007)(76116006)(66946007)(64756008)(66446008)(52536014)(83380400001)(110136005)(54906003)(122000001)(966005)(8676002)(4326008)(30864003)(55016003)(7416002)(6506007)(316002)(2906002)(26005)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?ypRTx8uKuM6hMQ7woSZGxa3jq2MXge/T0ElohHlrN25hudgElbHzItMlxT?=
 =?iso-8859-2?Q?dRw2DrftCUndeKX5zm22QQVTcYrOEJf+mIo2ODO9PsAW6qEs/4H9Z5pAXn?=
 =?iso-8859-2?Q?UIUPkX9rAEyaf9CLG2ptvFV9WXkVcJgDj6E6l8mWn65ujRE2c2Gc1E3qdT?=
 =?iso-8859-2?Q?puTFxRqvA5d+cihNFCNFks160xIvm7pED16rjBn/+NIzRlXsFvGNo5+mLB?=
 =?iso-8859-2?Q?nfN1yABYxNgSsBKXl8pAwe9VccVRv3GG20tLNo2VQuYZmNxjzm6zCJT+Ep?=
 =?iso-8859-2?Q?1HY/cKVRJKm4QGkjFHfUg6ugG62oeq9gwx+MKo1oKzsLjuVsKtk08K5lQ3?=
 =?iso-8859-2?Q?tCZJy9xgFrMBCqzD7sqbQIv5N+ItUmYvi1fuV0hT5HTuFj0szs9iu4PBcQ?=
 =?iso-8859-2?Q?kgcOME0Bly6DCZoZGE0iXwpizSGC4KkpI/CFashrJcWOw2J1+5fEgI0FRy?=
 =?iso-8859-2?Q?qYfJA21A00VosfLxTWhJLlZ70G95aeR7M8X+Zv+WgdKWnof+vWyLk+MY5M?=
 =?iso-8859-2?Q?VyhttXUt05wulOCM7NlchC91fJ/T8qnjWufpNgTgIuaj7TpBtMJEscvDj5?=
 =?iso-8859-2?Q?6M8sQ08bfbX3jxVsfaTCCBZEN/gUCnq/PwNcKlLSWAmMQqwMvVSPIDjrur?=
 =?iso-8859-2?Q?VJAn0r356Ci9n+sMnocR9kzEXeTb4aKOInRvMOAUdhoHADD55HZsrm0gr6?=
 =?iso-8859-2?Q?x5sk97A5bFwQsy71IXf9tAk2IbxQGeAXVWe/vyeY3XsYyotHPnZwTRB3Xe?=
 =?iso-8859-2?Q?patQtAuwS3/W0ND+yMwYxOM1und/Z69Tuf/hE/fhJD9Wqb7IU7DohFl5bN?=
 =?iso-8859-2?Q?tUY+/wx3yVXsn4q/hDkdephIenLF+vCFkiyMUcMozBBIQMu0YVIRcUPUSe?=
 =?iso-8859-2?Q?eNVCNywFSl43o2o79spw+7eVtdgau79X1slAl98FgXGCfnVJOARG95aCqp?=
 =?iso-8859-2?Q?wIzW3k68G+x2L0fveLydKJEeVlhekjFnHAZ0HyLbbUTW14vx4VBvNSV3zC?=
 =?iso-8859-2?Q?4s1CvQT9MQTap0hyH+L8r8DoxNw3oqVt2Z2F2X1ESU27KGe9sVXf+GD+3E?=
 =?iso-8859-2?Q?fUKiFvS2CvX1R6nmvZS1f7yvYMKSoCG0FNR7LQ3bxwjJmqz7xFaS8YyWNW?=
 =?iso-8859-2?Q?IU3suvi/zxPjtTWJc7DikmHXDkeQTNHrYkvSanzzOwJltvCxLglw3Rmg+g?=
 =?iso-8859-2?Q?cx10hMzJ95/RHsncN5wjFLbhwxmpIOVV8t+KbQ0adwiY1bd4Og6+66ePeS?=
 =?iso-8859-2?Q?3dWUuCtYLEHdq/YeRd4okqHr5Ivw1h89DERdmY+KuEA5hiAWNHMFQzIoDS?=
 =?iso-8859-2?Q?OZ8U5RZLjc3jRBMn2DjQNKY4f5ODLdFLn1N9aHxCtTwdfJGTCDKj6eJVp2?=
 =?iso-8859-2?Q?mKHGxfTu59e7EDvy/0dNbUqTCYvLwTug/HCksNjLESHCnKSxpUIDwhPF2p?=
 =?iso-8859-2?Q?Fm/YShZRkOVfVTzvN289Pj/Pmkem0RwIMHQzNk4X9S+3MZKUXIXeWpGqjJ?=
 =?iso-8859-2?Q?dWeqndWWN/WneEAqa6rBasQLFozX+S3QtvLbOetaXdsM7jbnNsZUCyu8kv?=
 =?iso-8859-2?Q?FP5YLRznu3GAVK7t2kfgeRFPKFPtvYeVzDE2oy1vwGKn3tthSGc/1mZ1pU?=
 =?iso-8859-2?Q?urQfN8efXqs3dMQHeIkMMEPDAsbpVtEH/qxDWODO1M7mFZVO4CvbMMoTu9?=
 =?iso-8859-2?Q?JEOAcmMhI2Q84CdR4Ss=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2cdd2ef-6dba-4870-692f-08d9e1032076
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2022 19:36:19.4168
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 90gqSHiMQgp+oNLjDpVhuzsJa7438tgm6jqtMgQIx3oWXs92IacxxH08kXUFu8UxU24oHw+HGsfF7NgY7xyKWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4327
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

[Public]

> >
> > >>>>
> > >>>> Through here seems to all be generic code for accessing
> > >>>> the AMD PSP. To me this seems like something which belongs
> > >>>> in a separate AMD-PSP-mbox driver/lib, which can then be
> > >>>> shared between other kernel drivers which may also want
> > >>>> to access PSP.
> > >>>
> > >>> I see your point clearly and actually it is not an accident that I'=
ve
> > >>> put all PSP-mailbox methods in one "block". They are logically
> > >>> different than the rest of i2c-adapter specific methods.
> > >>>
> > >>> That being said, above PSP mailbox was created by AMD solely for th=
e
> > >>> purpose of i2c_arbitration. It has its own set of commands and
> > >>> specific format of the command-response buffer. Thus it is not and =
it
> > >>> won't be generic in the future. There are already upstreamed driver=
s
> > >>> from AMD (under drivers/crypto/ccp/) which made use of PSP, however
> > >>> their channel of communication looks completely different than the
> > >>> very simple i2c_arbitration model implemented above.
> > >>>
> > >
> > > Can you please double confirm no other users for this mailbox and it'=
s for
> > > you only?  And if so is it only specific to this platform that no oth=
er users?
> > > At least on some UEFI AMD platforms that mailbox is defined for
> > > communication with something else.  We might need some way to attest
> > > from the firmware that it's safe to use.
> > >
> > > The only mailbox that is defined for OS use across different silicon =
AFAIK is
> > > the GPU driver mailbox.  It may be safer to use that, but I'm not sur=
e if
> > > GPU driver has come up early enough for your use.
> >
> > The CCP/PSP driver will load as a PCIe device driver on this platform a=
nd
> > will ioremap the MMIO space. Today, that driver doesn't reference those
> > mailbox registers, and I don't know that there will be a need in the
> > future. But if there is a need in the future, you could end up with a
> > conflict between these two drivers.
>=20
> Right, so I have confirmed this with AMD PSP firmware developers, that
> this particular x86-PSP mailbox is created and will be reserved
> _solely_ for the purpose of i2c arbitration (and thus this driver).
> There is no intend to use it elsewhere or share with another users.

I've learned never to say never.  People move on to different roles and his=
tory
gets lost.  As it's exclusive to this use case of I2C arbitration it will p=
robably still
be useful to leave in the comments nearby for our future selves what model/=
family
SOC this was introduced in case the number of mailboxes are extinguished so=
me
day and this ends up being needed for a secondary purpose for some future S=
OC.

>=20
> > Thanks,
> > Tom
> >
> > >
> > >>> Because of this I'm treating this as an i2c_semaphore-related code =
and
> > >>> putting this in this module. In my opinion moving this into some
> > >>> separate driver (which will be actually used only here) makes code
> > >>> less clear. But let's also hear some voice from AMD.
> > >>
> > >> Since as you say this mailbox is special and only for i2c-arbitratio=
n,
> > >> keeping it inside this patch / .c file is fine.
> > >>
> > >>>
> > >>>>
> > >>>> Sorta like the generic iosf_mbi_read() and
> > >>>> iosf_mbi_write() functions from:
> > >>>>
> > >>>> arch/x86/platform/intel/iosf_mbi.c
> > >>>>
> > >>>> used on the Intel chips, which are also used outside of
> > >>>> the I2C bus-locking code.
> > >>>>
> > >>>> This is also one of the reasons why I think it would be
> > >>>> good to get some AMD folks involved in this, since they
> > >>>> may be aware of other drivers which also need to access
> > >>>> the PSP mbox.
> > >>>>
> > >>>
> > >>> Right, I'm adding mario.limonciello@amd.com to the CC, so that he c=
an
> > >> comment.
> > >>>
> > >>> (...)
> > >>>
> > >>>>> +/*
> > >>>>> + * Locking methods are based on the default implementation from
> > >>>>> + * drivers/i2c/i2c-core.base.c, but with psp acquire and release
> operations
> > >>>>> + * added. With this in place we can ensure that i2c clients on t=
he bus
> shared
> > >>>>> + * with psp are able to lock HW access to the bus for arbitrary =
number
> of
> > >>>>> + * operations - that is e.g. write-wait-read.
> > >>>>> + */
> > >>>>> +static void i2c_adapter_dw_psp_lock_bus(struct i2c_adapter *adap=
ter,
> > >>>>> +                                     unsigned int flags)
> > >>>>> +{
> > >>>>> +     psp_acquire_i2c_bus();
> > >>>>> +     rt_mutex_lock_nested(&adapter->bus_lock,
> > >> i2c_adapter_depth(adapter));
> > >>>>
> > >>>> This does not do what you think it does and you will still deadloc=
k
> > >>>> when things nest because of someone taking the bus-lock and then
> > >>>> the main i2c-designware transfer function calling the acquire_lock
> > >>>> callback.
> > >>>
> > >>> I haven't used rt_mutex_lock_nested() with the intent to prevent me
> > >>> from deadlock when i2c-designware calls acquire_lock with bus-lock
> > >>> already taken. This is a method copied from
> > >>> drivers/i2c/i2c-core-base.c (BTW, I have a typo in above comment).
> > >>> This is the default implementation applied by i2c-core when particu=
lar
> > >>> adapter doesn't register its own locking callbacks - thus it is cal=
led
> > >>> for i2c-designware for all platforms.
> > >>>
> > >>> In case of this driver internal i2c-designware acquire_lock() is eq=
ual
> > >>> to psp_acquire_i2c_bus(). In other words, bus-level lock
> > >>> i2c_adapter_dw_psp_lock_bus() is a superset of internal adapter's
> > >>> acquire_lock().
> > >>
> > >> Ah I missed that this is just mimicking the core functions +
> > >> an extra call to psp_acquire_i2c_bus().
> > >>
> > >> I assumed that the dwc->acquire callback path was also taking
> > >> the mutex and I thought you had fallen for the _nested meaning
> > >> something different then it does, my bad.
> > >>
> > >>> In order to prevent deadlock which you are talking about, I'm using
> > >>> reference lock counter inside psp_acquire_i2c_bus() thus it is safe=
 to
> > >>> invoke acquire_lock() when bus-lock is already taken.
> > >>
> > >> Ah good, that is pretty much is the same as what the Bay Trail code
> > >> is doing.
> > >>
> > >>>
> > >>>>
> > >>>> The _nested postfix is only for the lockdep lock-debugger, this
> > >>>> actually turns into a regular mutex_lock when lockdep is not enabl=
ed:
> > >>>>
> > >>>> #ifdef CONFIG_DEBUG_LOCK_ALLOC
> > >>>> extern void rt_mutex_lock_nested(struct rt_mutex *lock, unsigned i=
nt
> > >> subclass);
> > >>>> #define rt_mutex_lock(lock) rt_mutex_lock_nested(lock, 0)
> > >>>> #else
> > >>>> extern void rt_mutex_lock(struct rt_mutex *lock);
> > >>>> #define rt_mutex_lock_nested(lock, subclass) rt_mutex_lock(lock)
> > >>>> #endif
> > >>>>
> > >>>> The _nested postfix as such is only to tell the lockdep code that
> > >>>> even though it seems we are trying to take the same mutex twice
> > >>>> since in both cases it is of i2c_adapter.rt_mutex "lock class"
> > >>>> that we are sure it is never the same i2c_adapter (but rather
> > >>>> one which always gets called in a nested fashion from another
> > >>>> i2c_adapter).
> > >>>>
> > >>>> IOW this only disables a false-positive lockdep warning, it does
> > >>>> not allow taking the same mutex twice, you will still hang on
> > >>>> the second mutex_lock call on the same lock.
> > >>>
> > >>> Thanks for the technical background about rt_mutex_lock_nested. I
> > >>> think we should keep using it as is, since as I wrote above I don't
> > >>> have any reasoning to modify it here.
> > >>
> > >> Ack, now that my misreading of the code has been cleared up
> > >> I agree.
> > >>
> > >>>> Also I don't think you are allowed to use the bus_locking code
> > >>>> like this. The i2c bus-locking code is intended to deal with
> > >>>> busses which have muxes in them, where the mux must be set
> > >>>> to the right branch of the bus to reach the client and then
> > >>>> not be changed during the transfer to that client.
> > >>>>
> > >>>> So i2c-client drivers are never supposed to directly call
> > >>>> the bus-locking functions.
> > >>>
> > >>> I think you are not correct here. There are examples of i2c-clients
> > >>> which are using i2c bus_locking for the purpose of locking adapter =
for
> > >>> the bunch of i2c transactions.
> > >>>
> > >>> As an example let's take drivers/char/tpm/tpm_tis_i2c_cr50.c. It
> > >>> operates in write-wait-read model and there is i2c_lock_bus() call
> > >>> used to ensure that bus won't be released -
> > >>>
> > >>
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.c
> %2F&amp;data=3D04%7C01%7CMario.Limonciello%40amd.com%7Cf8cd037a72b
> 749fb003408d9df3f5ced%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0
> %7C637786285501955886%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw
> MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata
> =3Ds4N9vTWbuRUww0qvsRz16fV%2Fnj41SxyLOB%2BjGFjyOaA%3D&amp;reserved
> =3D0
> > >>
> om%2Ftorvalds%2Flinux%2Fblob%2Fmaster%2Fdrivers%2Fchar%2Ftpm%2Ftpm_
> > >>
> tis_i2c_cr50.c%23L202&amp;data=3D04%7C01%7Cmario.limonciello%40amd.com
> > >>
> %7C1bdc742bc2a24f59b7d908d9dcc95438%7C3dd8961fe4884e608e11a82d994
> > >>
> e183d%7C0%7C0%7C637783579554955840%7CUnknown%7CTWFpbGZsb3d8ey
> > >>
> JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C
> > >>
> 3000&amp;sdata=3Dfr0UEka%2BxYyPxqUG6oOZo%2Bc6pWgto2mD7hWA20YulVQ
> > >> %3D&amp;reserved=3D0.
> > >>>
> > >>> Similar model is followed in drivers/char/tpm/tpm_i2c_infineon.c an=
d
> > >>> couple of other i2c-client drivers.
> > >>
> > >> Ah I see, interesting (live and learn).
> > >>
> > >> But this is then combined with using the special __i2c_transfer()
> > >> function for the actual i2c reads/writes, since using the regular
> > >> i2c_transfer() function after already taking the lock would deadlock=
.
> > >>
> > >> There is a similar unlocked raw __i2c_smbus_xfer(), but as the
> > >> comment in include/linux/i2c.h above the locked i2c_smbus_xfer() say=
s:
> > >>
> > >> /* This is the very generalized SMBus access routine. You probably d=
o not
> > >>     want to use this, though; one of the functions below may be much=
 easier,
> > >>     and probably just as fast.
> > >>     Note that we use i2c_adapter here, because you do not need a spe=
cific
> > >>     smbus adapter to call this function. */
> > >> s32 i2c_smbus_xfer(...);
> > >>
> > >> So in this case a driver cannot use the usual
> > >> i2c_smbus_read_byte/word/byte_data/word_data() helpers and
> > >> the same for writes. Also using an i2c_regmap (which is used
> > >> in a ton of places like PMIC drivers) will not work this way.
> > >>
> > >> So yes you can use i2c_bus_lock() for this; but only if all the
> > >> drivers where you want to do that limit themselves to
> > >> __i2c_transfer() and __i2c_smbus_xfer() calls and/or are
> > >> rewritten to only use those.
> > >>>> This is why in the Bay Trail case we have i2c-drivers
> > >>>> directly calling iosf_mbi_block_punit_i2c_access() and
> > >>>> iosf_mbi_unblock_punit_i2c_access() to lock the bus
> > >>>> for multiple i2c-transfers. We can get away with this there
> > >>>> because the bus in question is only used to access the
> > >>>> PMIC and that PMIC is only used on Bay Trail (and CHT)
> > >>>> boards, so the PMIC drivers can just hard-code these
> > >>>> calls.
> > >>>>
> > >>>> If you need to take the PSP I2C semaphore for multiple
> > >>>> transfers in some generic drivers, then I guess that the
> > >>>> i2c-subsys will need to get some new i2c_adapter callbacks
> > >>>> to acquire / release the bus for i2c-controllers where
> > >>>> the bus/controller is shared with some co-processor like
> > >>>> in the PSP case.
> > >>>
> > >>> This is exactly my intention to support generic i2c-clients drivers
> > >>> without them being aware that i2c-adapter above is using some
> > >>> semaphore/arbitration. Hopefully you can agree with me that current=
ly
> > >>> available bus_locking can be used and is enough for this purpose.
> > >>
> > >> It can be used, but with limitations, see above.
> > >>
> > >>>
> > >>>> Also note that iosf_mbi_block_punit_i2c_access() and
> > >>>> iosf_mbi_unblock_punit_i2c_access() do their own
> > >>>> ref/lock-counting to allow calling them multiple times and
> > >>>> the first block call takes the bus and the last unblock
> > >>>> call releases it.
> > >>>
> > >>> This is exactly what I was talking about above and also implemented
> > >>> within psp_acquire_i2c_bus() and psp_release_i2c_bus().
> > >>
> > >> Right, I was to quick in skimming over your code when
> > >> I wrote down my concerns about there being a deadlock
> > >> there, sorry.
> > >>
> > >> Regards,
> > >>
> > >> Hans

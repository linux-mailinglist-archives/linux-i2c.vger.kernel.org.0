Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C84AF48F720
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Jan 2022 14:46:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231881AbiAONqS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 15 Jan 2022 08:46:18 -0500
Received: from mail-dm6nam10on2059.outbound.protection.outlook.com ([40.107.93.59]:17536
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229946AbiAONqS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 15 Jan 2022 08:46:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GMjSARyPDqnzt71KImmE+H3O4WysezVbc29/YXsLG7s+XLFyxYHfeKI7/BphjHcV14EZSWOHHYuq3XYpfAqHpFkAtF1W6s4zVUGilMkxXHIZ7l3zezywjEtzI84ZdyA0X/un08OC76jc6ITM8hUAu7tb9MypteCcpFzehm45Dq1wn5vo9z3GMOUKJ7i6KbFc2MuDEJWkSFycefmfnouKVwevjACYD9rJLc7eXDItUys5AGSAyNjbzfOeGoinltLkPEBKRx1QCxhoBhLgAbljjn0X6RmZApLavB3jJ+tDL060EAdQr3ZAeqH0UrOdSiQn5KV2XOiqXfTMbGuoOTBvFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5nO7ec94g9O5HF54ADooK2vlDKhykbNcMbjeRL4Q6c=;
 b=LBTDhhAd/O3iPe0zsFBhEhIDaMzzuFJEYuO89zqC8s7gUDLFiW3t3evo3VzTVy69H/3jRIroq1Ttnt7/ndCS0WrKbcGb9oH+AyoGnH872YmkD3engkX0ycr/IEY1vj1Ij9OdXf1Uvmy6T2cvyDp3bQBfc6PNLFQk3P5ZRnPmjH9YN4ck/yCuzEKvpBskbmW//Ymk2ug8uhZ89kduel+et+gngv/whuFTxeSGvtWejqF98d/5y8Y+8FaLPDp454GHVR5j7inQp2fclYZlxwy8qQOPRfZ7SrXXAfZWjztgaL1ocFVwUZkCyjMALXPAgNKcXnQdiILkXJIsWPGmwBZjbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5nO7ec94g9O5HF54ADooK2vlDKhykbNcMbjeRL4Q6c=;
 b=sadbtszWCTBRerzM5JnjEgrqWEbAGoGKRpbNaJ1UhR4hGRROxwtXbGbbCfBiTYAQ5ILOVYg+VwjD0IsNmIpXj4M389fGMzKQeSfYxbf49PQR8oEH3v0opUIVRhwT1fQ3Civj5eCbIhhKZsSKzsMKvHxB/Kb+m0ofnxAQpo0UKdg=
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by BN8PR12MB3202.namprd12.prod.outlook.com (2603:10b6:408:9c::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Sat, 15 Jan
 2022 13:46:11 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::42f:534d:e82:b59f]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::42f:534d:e82:b59f%4]) with mapi id 15.20.4888.013; Sat, 15 Jan 2022
 13:46:11 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     =?iso-8859-1?Q?Miroslav_Bend=EDk?= <miroslav@wisdomtech.sk>,
        Wolfram Sang <wsa@kernel.org>,
        Benjamin Tissoires <btissoir@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andrea Ippolito <andrea.ippo@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alex Hung <alex.hung@canonical.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>
Subject: Re: Touchpad stickiness on AMD laptops (was Dell Inspiron/XPS)
Thread-Topic: Touchpad stickiness on AMD laptops (was Dell Inspiron/XPS)
Thread-Index: AQHYBtbfM8sDsnUL+0KqSGvunuhJKqxdqr4AgADJ5QCAAJu+AIAAP8iAgACwxICAA9jrAIAARBht
Date:   Sat, 15 Jan 2022 13:46:11 +0000
Message-ID: <BL1PR12MB5157412781B6C84B97C2A3E7E2559@BL1PR12MB5157.namprd12.prod.outlook.com>
References: <CAGhUXvBw4rzCQrqttyyS=Psxmhppk79c6fDoxPbV91jE7fO_9A@mail.gmail.com>
 <CAGhUXvDNj2v3O==+wWWKPYVzej8Vq+WNiBtPwmYxSQ2dTuLb9Q@mail.gmail.com>
 <CAGhUXvC8eHfxEKzkGN06VvRU6Z0ko7MJ9hF6uXNq+PxRZSbEmQ@mail.gmail.com>
 <70cbe360-6385-2536-32bd-ae803517d2b2@redhat.com> <YdbrLz3tU4ohANDk@ninjato>
 <42c83ec8-bbac-85e2-9ab5-87e59a679f95@redhat.com>
 <CAO-hwJJ9ALxpd5oRU8SQ3F65hZjDitR=MzmwDk=uiEguaXZYtw@mail.gmail.com>
 <5409e747-0c51-24e2-7ffa-7dd9c8a7aec7@amd.com> <Yd6SRl7sm8zS85Al@ninjato>
 <596d6af1-d67c-b9aa-0496-bd898350865c@wisdomtech.sk>
 <d39101a9-adc6-df32-12f5-fccc8fd34515@amd.com>
 <5c0ed06a-617e-077a-a4a4-549e91d372ba@wisdomtech.sk>
In-Reply-To: <5c0ed06a-617e-077a-a4a4-549e91d372ba@wisdomtech.sk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2022-01-15T13:46:10.609Z;MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use
 Only;MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
suggested_attachment_session_id: 2857409c-391f-6eb2-e921-cf0b9004970c
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3965c8ba-fbe6-4943-9132-08d9d82d644b
x-ms-traffictypediagnostic: BN8PR12MB3202:EE_
x-microsoft-antispam-prvs: <BN8PR12MB3202B01231271C0C7F691FD7E2559@BN8PR12MB3202.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uIlCdaq3nJsB+p8GjpQBWWAhREO9uecP7wjNlI0HxywdBKHgD3cCuSUcaDVKJnLidjVc+xQ8BWrOVJeUL2x4VnK3+czGrUL5o45+ox6RDFxlvx+UWD/iRTGY/iksAvzo1Ao7mUml311j3ktykF+kt7BPqXvp1Rhrv+QMsQ2cGmFPj7gMfK7TfmtcN4jOXW0EhfN2hsjC7s0+d3UIeUGoosCmxKcsZAGZ9FDtP78omR8G6+1ydT/NYVOpoTd6X8K0/4d2vzbSp9chr9aa+0IlQ7AdWELbKVSQsUNBo4jHpU1zJ/sfIdC98b44u13goo4VL6aQW191BgWLjZqvKprxWyIJ7Xv8iCEj8RipUPMeZu+Mrc+KMWU2kYRs37jNPGTbyFDbxR3ol8zvSMid9+nkr/eu394qnZxWfQUUk0u/mGJvOiZ81f4Yt48DmHwXYrQy5WYY/O0AqJfJMpzTFTO+KJ3+bHdJ5mLKuOKPcEs37RMHxjyU9HsfA2on8o0+zPf5bO5E+q+Bt1IIoaXLTHeubXm4oEWCX0rPZnUoVEtsmBU/6Go3CE5jXoUt1AUxj0AZCJRA9sTJ7TR+zTICZb/9Nm5J1v0EikJ9mNBjVW7QnT39+PKqKOz+nwxpWW86VNKND0deGYTp9CEOoxdWMlLo/oh+gpTct+9tLJ0+XPmRubQWJ5COUFAC4m6f3rqVzLiztrveKYQELmEapzINTX30WnFusk4JX8xrylnBdPl+CKc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5157.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(8676002)(508600001)(921005)(9686003)(66476007)(66556008)(64756008)(66446008)(5660300002)(33656002)(38070700005)(8936002)(66946007)(38100700002)(6636002)(2906002)(91956017)(76116006)(4744005)(7696005)(71200400001)(6506007)(316002)(110136005)(55016003)(122000001)(7416002)(52536014)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?savmwf1IhfXlegFF5Oz2ScZOn/6sU9AkW1a+4bq9M157RsU4w2MYBBGTYa?=
 =?iso-8859-1?Q?RMoASTyb5eu2SJL9pQCphezoh6/DrHfDKoVLnx+EVPPQcDod3OffGbjuMp?=
 =?iso-8859-1?Q?++DyQ22ncOOqar+h+GhGPn7M/enGrDeXB+JAi8feTLzupbWV9wkEVULAAY?=
 =?iso-8859-1?Q?h5ZyLDI6EhqQipkI71F8lYgulYqbMBGHNY4FPGRhBmi7Iknpb+xsmTtqII?=
 =?iso-8859-1?Q?goULK4Yb6inDls56DAfJ4cIKGZ4n/UTkO7krHdOq/Sbo7GfiqpfgAQZAjY?=
 =?iso-8859-1?Q?pSbLM6urO0VrK5wZONhd2cDqQPU8YImpag0K4ieixY4ml+lYgVSnXFf9Rk?=
 =?iso-8859-1?Q?0SBvHDPIrJA5mB8t0A6RsNWcpKeJ/IdoRImHj1Eoq398+AmgJqKXzcKIPb?=
 =?iso-8859-1?Q?N0b0UwiUoopvZMsAzPjuvVJFbgVP6L5CtW3kFUNVgyiXgriKAxo8oR85LO?=
 =?iso-8859-1?Q?+++i4rP431hIF2MkyBBdKf/KsZmqFHXarHovt/q3zjTJiunkaH+7aFm2qL?=
 =?iso-8859-1?Q?qLQ0rGwDADYC/X+pGWYdgnVmxbqtx/zeBEtR5AHA5GC5pMCBWAYs8dxPwK?=
 =?iso-8859-1?Q?oC/FYxxb2Qn92dY84j4y4ofnorAM1ACkBU31IRNkh2IdscOGW6los2mZcy?=
 =?iso-8859-1?Q?TJZeVQJqntrf0cBzXIfvzxjJZDqQxKQRHQhWUxzydhM7YtyRouRWoGNd0l?=
 =?iso-8859-1?Q?EZblh/m4jVpawkKUOnm3rqWoiLcxYxyCYY/xRYhufALgUKOtzBZjcNbhx4?=
 =?iso-8859-1?Q?2idwUR85b99SlEwa1ERZEA6lLWDyuTZvbd/UWK2eXi8yvpgJCr1ztw/Ocw?=
 =?iso-8859-1?Q?oAIPuRl6a+5rkQcc7RbAzPhod3zABpbMw8KqnUp3ZdeTm6DqiLlWyI+PPw?=
 =?iso-8859-1?Q?WW7GrqtSluHzL52WRK8DwzrOvqYAapo4Jshzu2eMjZ9S/niqsn9O+92vUQ?=
 =?iso-8859-1?Q?df3XU/xuvi7gcj30HzT8qnDraR70MpuZd7VNenKccgn4FE+bbiE4sGj8g+?=
 =?iso-8859-1?Q?EbLy7iw/84X1Ao8MA2QpLhF6Vz2Kfj28uzouUvnRZ3c0HLUW3XmGF0LPrJ?=
 =?iso-8859-1?Q?ubnKxv4AM32IYIS0mMF+LA3TqM9p1Gp5so/SwxHX4d9z9BxM7wayxRvNHw?=
 =?iso-8859-1?Q?4O9FA/nsvn1tApDvekjwFm2PP9dd3TN5ryXUWULPoACEBKNwxaqZKHmN/k?=
 =?iso-8859-1?Q?2BnQ1dbnDpIcFLvBOwdoDa7Nii/f93W16kswzaeABzS1rtwmQNnAgsYq1z?=
 =?iso-8859-1?Q?NxcBPtZL2qu7+MbtmLXeuM5CMn7MtDZ9TAkCNZYcuMSEYl3pWjuUNsIr8i?=
 =?iso-8859-1?Q?6OvrsfgflvusxCY8BSx/OTth0J5K50VD7gqZMqjqYq33lVPazPugsB+Tc0?=
 =?iso-8859-1?Q?kXp+i53mWhnNuBaLdNonv4sHTm7gsESX8rUkKKfdi9UxlXGtMlC+5R0E4L?=
 =?iso-8859-1?Q?f7dpMUod9rfeO9UQFzT6jYZ2oaWymDhQK/PhfzpbwRTcKKaA8paVW3DNGc?=
 =?iso-8859-1?Q?/bz70NDWKxybaviTq8V0pN5quD8PKCZLwMCnuAUwUIytkZ2Lf/GA+/sd5i?=
 =?iso-8859-1?Q?6O6+NRymojJ616o3iOChGhkGf7vKqETNC7s73WAQtFY5nVsGgxBq46nb/J?=
 =?iso-8859-1?Q?if/qsTAiEPvvI/LwPiEdn6HUNijOkccsYxBdlVXJWOpwWGWV589CWCxtev?=
 =?iso-8859-1?Q?VlL6vUyj5H3la+354T9XxJ84oSOTQ69DiulDKIbJrxUOrVEmZzS+aJmctx?=
 =?iso-8859-1?Q?wXyg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3965c8ba-fbe6-4943-9132-08d9d82d644b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2022 13:46:11.6032
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e8Y31uBe+Q17Effq15zKD8eYv1HZGfqYmqxy0yaRP+NZLP655MmPuKd5bVKfcxXRrhN+ni2XEV9mg49rl9lUTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3202
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

[AMD Official Use Only]

> Now i am trying to change ASF registers instead of SMBus registers.

> I have tried to enable interrupts and set listen address, but it don't
> work or
> i can't recognize the difference between interrupts generated by
> transfers and
> interrupts generated from slave.

Try reading the value of SFx0A ASFStatus bit 5 (it's write to clear if it's=
 an interrupt).

> outb_p(0x02, 0x15 + piix4_smba); // SlaveIntrListenEn
> outb_p(0x2c << 1 | 0x01, 0x09 + piix4_smba); // ListenAdr | ListenAdrEn

ASFx04 SlaveAddress instead of  ASFx09 ListenAdr
?

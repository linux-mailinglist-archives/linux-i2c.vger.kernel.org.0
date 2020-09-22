Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9A2D274CE1
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 00:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727253AbgIVWyi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 18:54:38 -0400
Received: from nat-hk.nvidia.com ([203.18.50.4]:35129 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726893AbgIVWwk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 22 Sep 2020 18:52:40 -0400
Received: from HKMAIL101.nvidia.com (Not Verified[10.18.92.77]) by nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f6a80350000>; Wed, 23 Sep 2020 06:52:37 +0800
Received: from HKMAIL103.nvidia.com (10.18.16.12) by HKMAIL101.nvidia.com
 (10.18.16.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 22 Sep
 2020 22:52:33 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by HKMAIL103.nvidia.com (10.18.16.12) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 22 Sep 2020 22:52:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bsAWuMjd1ae7/GME57qiQcym3klyo1WI8B57iLSYjbh+/RyP4d+LH7qqLwtsj7BJ4ToWcEKw4HuhPGTYB3Kq1wIJ0YCgkDDJs0s8YSnnzTa6V6OKYF8LArBNvGGh/ac02fBxIGX9ld+bMLzmAPRnyfv8/y7l0PjDmSLs3UidoCqkh851iWzInJytOlRB/1nDelccipd//pwiseOfG1iWqUj/0g3qzbQdTQcIEsgAtXiI/DUvdlt+4KNGmiDcOzsWzcTLJQtddPIGIP2v9tTpgbX0YAwvTdrA/Ugx/SzH59dEFBpyUMjlWd58v9EEuV0vWe7Dlm/m6K1PhYzHjljtyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1mwsV8TvKoLST0mBPJ/RyT2BjkjgQVRDA19zDPffpI=;
 b=XqEIlpMII1nwp2JuIUDAWT5BvBNV0PrTZyimxAqKhfy3HUIUWXKMkVCOGN06Ijrdx9+TWrrx7F0a31gkJw7N6g9FPVNGMyip4HUY2gmt3By+i2PmmGw7e5EbLyFEEP/wrUAfmBzZpWNE58/zRyHpOqxvQNbMihWzvIO8ic9LTzJf0p8TnDPFLqK4v4pGZQfJBJiM9Yu4cREzMi0VhwvYkp39+He2T5f5pdj30TH3CCTUSkKmGALXIxU+cLVVIhSVHYK98EV3kEjrklECj2akbFoqXWG6wY90+oD/4ftBHSfa+lFp+0OJr9uBhcfZK28210HNcXHlIya8CXit3hlT+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from MN2PR12MB3616.namprd12.prod.outlook.com (2603:10b6:208:cc::25)
 by MN2PR12MB2927.namprd12.prod.outlook.com (2603:10b6:208:103::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Tue, 22 Sep
 2020 22:52:31 +0000
Received: from MN2PR12MB3616.namprd12.prod.outlook.com
 ([fe80::f8db:1abf:2e05:4c3e]) by MN2PR12MB3616.namprd12.prod.outlook.com
 ([fe80::f8db:1abf:2e05:4c3e%7]) with mapi id 15.20.3391.024; Tue, 22 Sep 2020
 22:52:31 +0000
From:   Khalil Blaiech <kblaiech@nvidia.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Khalil Blaiech <kblaiech@mellanox.com>,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [PATCH v10 1/2] i2c: i2c-mlxbf: I2C SMBus driver for Mellanox
 BlueField SoC
Thread-Topic: [PATCH v10 1/2] i2c: i2c-mlxbf: I2C SMBus driver for Mellanox
 BlueField SoC
Thread-Index: AQHWkC8mGjujC4hvBEGXB35fFxw15qlze/AAgAHJHvA=
Date:   Tue, 22 Sep 2020 22:52:30 +0000
Message-ID: <MN2PR12MB3616BC8F998B550A8AE7DE6FAB3B0@MN2PR12MB3616.namprd12.prod.outlook.com>
References: <cover.1600702555.git.kblaiech@mellanox.com>
 <1f31d4c4ef0c65f75b6077c77fd24c2c404f2a98.1600702555.git.kblaiech@mellanox.com>
 <20200921193400.GB18032@ninjato>
In-Reply-To: <20200921193400.GB18032@ninjato>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=nvidia.com;
x-originating-ip: [173.48.75.27]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d651299-814b-4806-cc3c-08d85f4a2fff
x-ms-traffictypediagnostic: MN2PR12MB2927:
x-microsoft-antispam-prvs: <MN2PR12MB2927CF7599E4A539284F4FF3AB3B0@MN2PR12MB2927.namprd12.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:262;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fJ69b+cSbV8rIo5L1NNrouTbmkyd8Fuw9kjEofE4dANLUSlQ6K4+eTP7dMLr2SaWujOFd5Wj7e7ce8tFAX9pke/6vv0UWz1OYBh5u69Cq/P2b7vEUypJdPwsFkga3/H5t+sm1sqr9rwweNeDj0ghzdzbmxopZObaiLfPr9sSxhJiJVp8fZcGnqu4fZrKoZbn4HK+PEvEkf4d1VMWbRvC61hEL0AnqMo11WQzoD1L09Ja5xXXZC1aqT7RGoLk2n11PmKEy/c/VBTSMQ/KfJAEURPzOzOpYuuQSVAUh3bljxaGGwr3UhqongsKSP6i8kE3iFwnnteaSyH38YB9R6gNfQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3616.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(39850400004)(136003)(396003)(55016002)(76116006)(66946007)(66476007)(52536014)(9686003)(8676002)(64756008)(71200400001)(83380400001)(66556008)(5660300002)(478600001)(66446008)(2906002)(86362001)(26005)(4326008)(316002)(33656002)(53546011)(7696005)(6506007)(8936002)(107886003)(186003)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: HefBFkS5Nldls0dyGFl13F9QYL1MPduA38N9yKAY22TEkQFs8P/p/CcjSfFy71iIZNwPMPyYnneTmaWScfa6+MfmZBw5PF2kR5eBdA/Jfq68JuEjpswpxByWGvtoyEPiypEcJJOdRAnCRdgN1VKnfkHJkVEttsOyvPuUbhn+O/rT1jsQzSqOsiGxrBQfOR1vnnSpHSNgLAIAx2K+BappCRMVgFdktr3VwIqVbrJhf/e2x6cezRQhHe5A4NW6bkvWZF4gdWtA9E2Q921Sxr3ylRQJw9gYCuZGQbw+Y1s3SCuPwK60Ir0oTPkJVe9mjovkbHQjdZgZl45TK3kpjquQJWuHGV+AXisGh1RkyfLMHKh2DJZ/B3TP2o3xNFG1+kEkkVjEBt/JtTYbwkYBdrAhSFzui/N4oqaGu1tpOgdYR0+aHgd0v+QMYOClRj/8I+om6aQp4dd4cv2eCz1mRf+0pn0+Gm8+jD8QqhYf2mHscCcYFSDNG+vka32vse5PPvGwK51RgAfwIfu53YierHXpEmm8CHZqif45vvkKXikndVsqb6oTihZU+sJOPAyl+a/4DLe8VPYn6xCFxlhijqMCy48OCAkCP9qWePLnK7l5QDo20SuDjTF0VqAggjKZu3vaQhAhPCp2PXhbFIUM2gkaJA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3616.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d651299-814b-4806-cc3c-08d85f4a2fff
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2020 22:52:30.9257
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TYsBGS6bpixz3E6wcaBH+vxxCyNHgPVMRAoXg3W9NbrsC9dV0DM5ebebhK5JoThe2zWQBcySW0m7P41o57ac3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2927
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600815157; bh=o1mwsV8TvKoLST0mBPJ/RyT2BjkjgQVRDA19zDPffpI=;
        h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:From:To:
         CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
         In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
         X-MS-TNEF-Correlator:authentication-results:x-originating-ip:
         x-ms-publictraffictype:x-ms-office365-filtering-correlation-id:
         x-ms-traffictypediagnostic:x-microsoft-antispam-prvs:
         x-ms-exchange-transport-forked:x-ms-oob-tlc-oobclassifiers:
         x-ms-exchange-senderadcheck:x-microsoft-antispam:
         x-microsoft-antispam-message-info:x-forefront-antispam-report:
         x-ms-exchange-antispam-messagedata:Content-Type:
         Content-Transfer-Encoding:MIME-Version:
         X-MS-Exchange-CrossTenant-AuthAs:
         X-MS-Exchange-CrossTenant-AuthSource:
         X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
        b=ADhUXjBIJT2luoaquUsjlTM3EEyfV5zzXYMS+2fI8HLCPiz8IeyWuBngdnHayavMi
         Ld6gFcEFftJmdxliJfxL91j0bgs/LHf+nbr/gh3sSrC+K6dqWz2u487FXvCZ8KxV9i
         pZHEugn9yYV+e+32qhz02XNQZ2QvopW8ejBZq3q2XY0yGBLh0cz/OTgB7+b0zcQ3qW
         E0vGgJ141AT1jZEms5cfNgHilEFZdscq7lEV5u9pv0u77cUtN9YEjdMfefw0s8wjSP
         FS+zISFKOaLLiaEdtx52ZJdVDrNmckJCHt2ccVjAwE+o7RAFNFudT2PKuXK9OPeciZ
         kaCdsQTS3rjFA==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Wolfram,

Thank you for your comments.
Please note that I posted a v11.

> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: Monday, September 21, 2020 3:34 PM
> To: Khalil Blaiech <kblaiech@nvidia.com>
> Cc: linux-i2c@vger.kernel.org; Khalil Blaiech <kblaiech@mellanox.com>;
> Vadim Pasternak <vadimp@mellanox.com>
> Subject: Re: [PATCH v10 1/2] i2c: i2c-mlxbf: I2C SMBus driver for Mellano=
x
> BlueField SoC
>=20
> On Mon, Sep 21, 2020 at 11:50:14AM -0400, Khalil Blaiech wrote:
> > From: Khalil Blaiech <kblaiech@mellanox.com>
> >
> > Add BlueField I2C driver to offer master and slave support for
> > Mellanox BlueField SoCs. The driver implements an SMBus adapter
> > and interfaces to multiple busses that can be probed using both
> > ACPI and Device Tree infrastructures.
> >
> > The driver supports several SMBus operations to transfer data
> > back and forth from/to various I2C devices. It is mainly intended
> > to be consumed by userspace tools and utilities, such as i2c-tools
> > and decode-dimms to collect memory module information.
> >
> > On the other hand, the driver has a slave function to support,
> > among others, an IPMB interface that requires both master and
> > slave functions to handle transfers between the BlueField SoC
> > and a board management controllers (e.g., BMC).
> >
> > Signed-off-by: Khalil Blaiech <kblaiech@mellanox.com>
> > Reviewed-by: Vadim Pasternak <vadimp@mellanox.com>
>=20
> It still seems nobody has time for even a high level review of this huge
> driver. From a visual glimpse, the driver looks mostly OK to me. It
> probably makes sense to fix issues incrementally from here on.
>=20
> So, let's just fix these static analyzer warnings and I'll apply it for
> v5.10.

Sounds good :)

>=20
>     CHECKPATCH
> CHECK: struct mutex definition without comment
> #462: FILE: drivers/i2c/busses/i2c-mlxbf.c:372:
> +	struct mutex *lock;

Done.

>=20
> WARNING: Prefer 'fallthrough;' over fallthrough comment
> #1330: FILE: drivers/i2c/busses/i2c-mlxbf.c:1240:
> +		/* Fall-through. */
>=20

Done.

> WARNING: Prefer 'fallthrough;' over fallthrough comment
> #2000: FILE: drivers/i2c/busses/i2c-mlxbf.c:1910:
> +			/* Fall-through. */
>=20

Done.

>=20
>     SPARSE
> drivers/i2c/busses/i2c-mlxbf.c:513:16: warning: cast to restricted __be32
> drivers/i2c/busses/i2c-mlxbf.c:513:16: warning: cast to restricted __be32
> drivers/i2c/busses/i2c-mlxbf.c:513:16: warning: cast to restricted __be32
> drivers/i2c/busses/i2c-mlxbf.c:513:16: warning: cast to restricted __be32
> drivers/i2c/busses/i2c-mlxbf.c:513:16: warning: cast to restricted __be32
> drivers/i2c/busses/i2c-mlxbf.c:513:16: warning: cast to restricted __be32

Done.

> drivers/i2c/busses/i2c-mlxbf.c:527:34: warning: incorrect type in argumen=
t 3
> (different base types)
> drivers/i2c/busses/i2c-mlxbf.c:527:34:    expected unsigned int [usertype=
] val
> drivers/i2c/busses/i2c-mlxbf.c:527:34:    got restricted __be32 [usertype=
]

Done.

>=20
> Thanks for your patience!
>=20
>    Wolfram

Thanks,
-Khalil


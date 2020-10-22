Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D090296118
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Oct 2020 16:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2901073AbgJVOpJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Oct 2020 10:45:09 -0400
Received: from nat-hk.nvidia.com ([203.18.50.4]:35859 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2901062AbgJVOpI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 22 Oct 2020 10:45:08 -0400
Received: from HKMAIL101.nvidia.com (Not Verified[10.18.92.77]) by nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f919af30000>; Thu, 22 Oct 2020 22:45:07 +0800
Received: from HKMAIL102.nvidia.com (10.18.16.11) by HKMAIL101.nvidia.com
 (10.18.16.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 22 Oct
 2020 14:45:06 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by HKMAIL102.nvidia.com (10.18.16.11) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 22 Oct 2020 14:45:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sr47kqU47Oh4vYkYd4G6cSihXAWuxUycAKLu952inoCCAy+2A8SRA2p1mUewo1e3QEY2HSZCCJDqKxn+4YDfrE0F7YJf7zwHYBKbh4tztPjVOCViA72x2O9/BtbUUh5lgEXr0pNqYtbCdI5/uyRVTRr4BloVF+ikH/GC0Llw8q35wRv2wo6djb/8B68/SnSFGN+Xjb8uXGNU4OHuIOb776Oo344HqqWDfOy3DDXPzmbgIRgu6pMAsTM2bKN1+K5VJ+JISzqQBfA1ND1ctzA4hg3kCa1FzQo60rdQuVyL/Xv4znve/kDxoXbA1zRml1pU4QFqfuhE96Accdg/XdmmMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5p/BjlsoFtpsFpFosFAnACgQ8gbF8ibP6Ok58x8Dtxo=;
 b=cHR2GmAlCg4Ms8kievu1EX17lY3nGngRbTyFm6EqsBNM6b8NlWtlnjCTbi+ToPsEGZeWJmhXXeb0JhnkXTYqJ4KbFYPCDscNYqe9ddmOWNDbm/MkQOJzDQyyqJAVxG+WiwUxSVZltJaZ2i8M3ie45xIOZg9lTp/OISPzxWgCOo1EYn0fmkYWQJ2w7knvuem8pJVFMRh4A74eaKc9V/cVWcJt0yhNBRKBeKsqZ3B9kfY5CXzurJTgiMVwBdOEo/t88q91nQLtopiFTnOG0V9CeZiqH1q+mYDynSvHQl4R1ukzHlhdQNxipT0r3Pv/6GkEhPthadVm5vX4cZ1a9GbltA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from MN2PR12MB3616.namprd12.prod.outlook.com (2603:10b6:208:cc::25)
 by MN2PR12MB2944.namprd12.prod.outlook.com (2603:10b6:208:ae::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 22 Oct
 2020 14:45:04 +0000
Received: from MN2PR12MB3616.namprd12.prod.outlook.com
 ([fe80::89a:e4ad:708f:363f]) by MN2PR12MB3616.namprd12.prod.outlook.com
 ([fe80::89a:e4ad:708f:363f%5]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 14:45:04 +0000
From:   Khalil Blaiech <kblaiech@nvidia.com>
To:     Khalil Blaiech <kblaiech@nvidia.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Khalil Blaiech <kblaiech@mellanox.com>,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [PATCH v11 1/2] i2c: i2c-mlxbf: I2C SMBus driver for Mellanox
 BlueField SoC
Thread-Topic: [PATCH v11 1/2] i2c: i2c-mlxbf: I2C SMBus driver for Mellanox
 BlueField SoC
Thread-Index: AQHWkTLCvB89D0q+REKLlisH88Nxu6l8iR2AgAO3SgCAAHX/AIAJC4awgBoeS5A=
Date:   Thu, 22 Oct 2020 14:45:03 +0000
Message-ID: <MN2PR12MB36162FB0B85C6777212E2B57AB1D0@MN2PR12MB3616.namprd12.prod.outlook.com>
References: <cover.1600804577.git.kblaiech@mellanox.com>
 <69651f24de181c7ea766a41bf7ac7a2539368ee5.1600804577.git.kblaiech@mellanox.com>
 <20200927135445.GC7298@kunai>
 <MN2PR12MB36160C5BC782D9AF3A017D17AB320@MN2PR12MB3616.namprd12.prod.outlook.com>
 <20200930054152.GA1305@ninjato>
 <MN2PR12MB36167849F16529392C0337D1AB0C0@MN2PR12MB3616.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB36167849F16529392C0337D1AB0C0@MN2PR12MB3616.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [173.48.75.27]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d21bc9c8-3274-45ff-3676-08d876990fce
x-ms-traffictypediagnostic: MN2PR12MB2944:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB294478FF7382AAEFEDF884EFAB1D0@MN2PR12MB2944.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BpJJApSq85oRLxanWikUVOpR3RLweuVgpXMo5S3QbIjd0na2vvChsipfMknELMYFNarTTdziD37RtxK/94ncYwZx342bBFLM0HraOAsh3NyAlYYa3NZrUv8zkZ95js801zPhFv7MG8+LKENAxJSc8RNQjZqOu+fEpwhO48590Ddns/tuMWlazZIWq1OocJIoMEdmLvKIZ6z6LGeGPeZG/3UtAkbJo4g70j4vzh6Vr0cpzJuPoTsiORPTZrEK5X1tZ0r50GA4gKsvvNIzWil9eOZPZ0TUwTBrIFSV4WXKWKHaePOj68k3es84mllJ+gdRDr8LhWzUJ5Tp20O/kJZQWQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3616.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(366004)(376002)(136003)(396003)(6506007)(9686003)(4744005)(107886003)(52536014)(33656002)(186003)(86362001)(71200400001)(8676002)(55016002)(26005)(2906002)(4326008)(76116006)(110136005)(54906003)(478600001)(66556008)(316002)(64756008)(66946007)(66446008)(66476007)(7696005)(5660300002)(83380400001)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 3eQ19mg4pUSAkOkGNDId7huuU7F/MnvKB9OnzFh95K8BP0PWOmuxyfoWiPefcM5IpTVrXFtkPyv4J8fYhLN06dKqBXQKXCJlW4M/Ej4ijlXWNESBIJArIeXfbGuqu+4WMMlvQpS0pGEWNK1pZJVQsSolzrUUV/Uuk8AZSXHekZk65ko/cYpqYzD+esnLDytns6RtFHi5moYabfBs8xPUa64FsTucoh9h+9vGVzDurnO1pERsfPhQy9bUBCLTkq7cdALJsWmqbGY/Ixchx+cyYILbBIcfkZU1XyTC7bBHiW/UNd08oZl8k1F5RtivwPcEBGHNUib2hWUxRjpbeBt62S0bdhPyCy/6gne8EsquQlikSYd4uZxZrYT1Hvg7WAw4kr6bVsYfrvFeMr+SBO0vWIH4iwmLwut/qU6sNTHQP2++Rok6fRa1R2cxRimwt5Hd75KwpsitQhY3Mb6DsV4255fjUHp/QaNtt487cNw7iwyuBP4io2A+iZh8DSazJ6QWqVLG4lPpTG/kXFlw0avAjGkZ3vgl1BTUKLGlqONth4bPqQH+fh2zynWnv1UUnrvPPky0MYpK38ueySuRtyqIx39/vi8ypC3YBORYilgrWc5lhjQw9wCaMDMZo0b2Sp8MnWtMYifsinAcgB4x+Bb68A==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3616.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d21bc9c8-3274-45ff-3676-08d876990fce
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2020 14:45:03.9611
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I3N4H7PKJ6Oy9LNH2mZ2q3wNrlIvxbt35boYYurc4Qrdqpce0AGfv8/OGke4LjAiAvLovyRqqXcBpvx6djzxjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2944
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1603377907; bh=5p/BjlsoFtpsFpFosFAnACgQ8gbF8ibP6Ok58x8Dtxo=;
        h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:From:To:
         CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
         In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
         X-MS-TNEF-Correlator:authentication-results:x-originating-ip:
         x-ms-publictraffictype:x-ms-office365-filtering-correlation-id:
         x-ms-traffictypediagnostic:x-ms-exchange-transport-forked:
         x-microsoft-antispam-prvs:x-ms-oob-tlc-oobclassifiers:
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
        b=K7a3DSqEwmaqIOT9cLMHrH3yBWZo9MaAhQ+GVBW5xwsEal6dx9DAwqeRz0FpoWRw8
         u3T/hwhTeXJU+f+MtW0MaiOmFUsJ/ro/I8yLKhhPe6dA7oiiLwelq9zGz2iJmiW73g
         8QtrMf36P0/rCuY1H8KLvhY049Mv9qSU2NR6NFTnSi86XGrtsT0eWvyHWu7YlPGTeS
         2P+QitBeWwfC/locqpoDjvJVKnh3MY4nCU9XVGytG51InO2kDARjrf4kPtfz/GXKR3
         luA3BKJ+BvMRxSzJ/hnVdULtL6fLNsooEwRkk85+HeIor1apxVn2QCzacFrjRFjLmD
         Nf36Lg7ChHOgw==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> > > Wolfram, thank you very much.
> > > I have seen that you applied it to "for-next" branch.
> > > I 'll address the build issue as soon as possible and post a v12
> > > with the appropriate tags.
> >
> > You are welcome. But please don't send new versions anymore now but
> only
> > incremental patches which go on top of v11. That is the normal
> > procedure. Thank you as well!
>=20
> Thank you.
>=20
> Please note that I addressed the build issue and converted the DT file
> into YAML schema.
> Please allow some time for the internal review,  I will post the patches
> to the Linux kernel afterwards.

Wolfram, apologies for the delay. The Nvidia internal review is taking
more than I would've thought. The good news, most of the changes
have been approved. A couple are still under discussion.
I'll do my best to post the set of patches early next week or hopefully
by the end of this week.

Thanks,
-Khalil =20

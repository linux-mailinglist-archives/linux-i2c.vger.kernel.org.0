Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A26C72F69CE
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Jan 2021 19:44:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727421AbhANSoD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Jan 2021 13:44:03 -0500
Received: from nat-hk.nvidia.com ([203.18.50.4]:42271 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726131AbhANSoC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 14 Jan 2021 13:44:02 -0500
Received: from HKMAIL103.nvidia.com (Not Verified[10.18.92.77]) by nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B600090c90000>; Fri, 15 Jan 2021 02:43:21 +0800
Received: from HKMAIL104.nvidia.com (10.18.16.13) by HKMAIL103.nvidia.com
 (10.18.16.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 14 Jan
 2021 18:43:21 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 HKMAIL104.nvidia.com (10.18.16.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 14 Jan 2021 18:43:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R2kIzX3qdLziywQv4KF0pUowi+puBQX/ruc+5wgn1/dmu4jgqyghR4guu1MBKqKDqXsoQQnnsweL8jwQEvtrE3ycTAvyFd3pOMKeGeZR6Oqr81n5NVHlvBMrYnjmFuaRNFwBwMiSVeQD8ff+jPLoFp8ckktBaSS+XONjUctbL06sEEfKvkuh9FNGd02K8oV1hDjAD0S8N+UsyBi4X0XXoTYKO4vzf4uA4sQDFoHay9sNYt29FoUdxvICvlZXQbDbjKH/yyrmLX9QHNIn4Q5amRw4Nyx8jJvt6etT7d1CYiRib2EwTHq5u7+Vtl4+NB+DocUV1fXqQgIdn/2fp2yTZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z1B+Yx2wozuztRfI9g64y3dJ6VnWfj9mAjc8aO09lHE=;
 b=BVUDzRPvs/SJI9bClJZt01v0jqMRJNMbGWf5aR0HsrrrwF1lzAPvHh5gziBEcf4UH1OExpgA2MaHRPoH/V2ZwZBBRTO/QTwW2u6p+W6toVvY9AJN7wcHGMgoD11jXF28rhHTV811ZMH++2im4L47HAUU9sKQZr8WvYhNtjyUvfVVgbOf+mHaBaalmn/JatVPpsGWbFCACIA0ZxmmevdxA5G9NUsiDh6f8Mly5kNoZObyjKUZD5bhOpaLQeAdEUBcDyyuTBSzHl99VEVLcn1NmcBe2bm9xjGoaYgDKV9D1EsRHmsPnbNj5/ss+L84qpbqgkOkSJzxXU7a6rlvalb+wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3898.namprd12.prod.outlook.com (2603:10b6:5:1c6::18)
 by DM6PR12MB3003.namprd12.prod.outlook.com (2603:10b6:5:38::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Thu, 14 Jan
 2021 18:43:18 +0000
Received: from DM6PR12MB3898.namprd12.prod.outlook.com
 ([fe80::7c6c:69b0:b754:6963]) by DM6PR12MB3898.namprd12.prod.outlook.com
 ([fe80::7c6c:69b0:b754:6963%6]) with mapi id 15.20.3763.011; Thu, 14 Jan 2021
 18:43:18 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     Peter Rosin <peda@axentia.se>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: [Re-send: PATCH i2c-next 5/6] i2c: mux: mlxcpld: Extend driver to
 support word address space devices
Thread-Topic: [Re-send: PATCH i2c-next 5/6] i2c: mux: mlxcpld: Extend driver
 to support word address space devices
Thread-Index: AQHWvbljLIA6oXcJEUSiXN/tm2JeW6ocPVuAgABELQCAASwrAIAFXZiggAA5GwCAABMVsIAAuZeAgAAKIwCAAvzgAIAAslVA
Date:   Thu, 14 Jan 2021 18:43:18 +0000
Message-ID: <DM6PR12MB38982210DFF37C7A0591E481AFA80@DM6PR12MB3898.namprd12.prod.outlook.com>
References: <20201118144416.184120-1-vadimp@nvidia.com>
 <20201118144416.184120-6-vadimp@nvidia.com>
 <b1e3b52d-ddb2-ac56-665c-7500c939a55d@axentia.se>
 <DM6PR12MB38989872E06EA9593E862F23AFAF0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <268612bc-dc4a-cfcd-f529-e8540adfd8dc@axentia.se>
 <DM6PR12MB389804F87C41F41210837810AFAB0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <e02caf3a-86b7-23de-2723-3abe97fb92e4@axentia.se>
 <DM6PR12MB3898A35B743227426802C081AFAB0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <5860104a-f922-068d-18ca-32b69c7970f7@axentia.se>
 <20210112101144.GA973@kunai>
 <827c0c7f-dbe2-2769-749e-be838d890101@axentia.se>
In-Reply-To: <827c0c7f-dbe2-2769-749e-be838d890101@axentia.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: axentia.se; dkim=none (message not signed)
 header.d=none;axentia.se; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [46.116.164.38]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 32f87907-f96c-4175-810f-08d8b8bc4296
x-ms-traffictypediagnostic: DM6PR12MB3003:
x-microsoft-antispam-prvs: <DM6PR12MB3003930A18C8C2CD5C7D73F6AFA80@DM6PR12MB3003.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vWXyrAd05Y51eQKnYQ8ebA1qZJwC7guVKEUTz2p/tvc5bDQdLPGLmPtRaPi3qUOC0Oy+ZY3Sa5OpRk3iURKm9/Bdmlspug32/lBxOAKJe3LpKL25mRXaivPL/Ra6sUyLkpL0t42G8MZw6wVTiDxVIJQ/erX14A5dX5QxIvja5Ol3jIRCHlIP4EIWrHdhJ0cRyXiR+9vD5P8T3Fsi+OdQCbq8BY6M9c4996ntyRb5Ch8HM5Kkq3QVslVi4QAS6vRFZCB7aH0j3f4K+J+czMMI39m0nTxa0ueoIaqxB/R7DSsM9+NkUJJQSdm9TivtFJnAxQHogHBl/t1L7v4nzpoq4axPU+1zMHHn9wbyxgTx/BTakxEoiC7+WIkxdiOH8nSJQKcJypAYi5cjwNJ9pzDLdsaeQN6u49eFDqlmbiib5Yn3q5Ihrz5IGwM2BIUCUxtXLRLhn1a3cQWeN3J4fTrvqQkg/4OV3jQFHt5gKEkDUWM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3898.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(2906002)(66946007)(64756008)(66446008)(66476007)(71200400001)(53546011)(8936002)(66556008)(186003)(8676002)(478600001)(316002)(26005)(76116006)(55016002)(5660300002)(7696005)(86362001)(52536014)(110136005)(83380400001)(33656002)(6506007)(9686003)(133343001)(376954003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?7J7mExiG2naa1o56HSK82zl1JUMRfByqG3Mku33/azXm5bgUjrz7EspqnQMa?=
 =?us-ascii?Q?J8R9aDUll4CdnmJGPgpGo0vkkOR6rtR58m7C7pQnxUvlB1Sj9pccPjAjBIrE?=
 =?us-ascii?Q?2BG6idUgOjx5+t2RZVGAJDbimKs9Yslc+yNukZMDOiI0ILEtIjI+qj+CaQsA?=
 =?us-ascii?Q?JhU6r2ucZceY+csLTaBLLeHaYPwnBeCjntBb9iiuz+H/IgYLY6XnNiM+OW1O?=
 =?us-ascii?Q?6apXISpyjXoaZZXtZFDXaSoidnQsR+O1PR0JVd9bzsks8KwjJy7iYqShU7ts?=
 =?us-ascii?Q?3lU72rFap1ugKDO3Im3CRqAaoqjnQ+5j5Jit1kh3UuuHqYLsg0aoNiEf+Gh6?=
 =?us-ascii?Q?1tV/s9QTVD4jVmONDrf1yuqyD7YlaMV2V7nAMhb5K0XikfQ5/IPwPiBH0AnP?=
 =?us-ascii?Q?12rREjBTJyfqnJayiwG9T1nv0GvL0frHkj7+uAjeU/+iV5bxZcLaS4jpXMdW?=
 =?us-ascii?Q?3kMQMoZnP3NHq6XCNRrcDHlCtVlpf+meKd3wAMugn+gufsKxpDcrK5vkTQ18?=
 =?us-ascii?Q?QGVrbyGiFxgh/7ygAbzX1GetieoEuMXZB29Cqv0+qTIYRi8vTel7uSqV4WEn?=
 =?us-ascii?Q?68H6dB08pB469O/VpX91ePX3q0HdLCquCHkEdPue/EdbTF4n1c1YfFoAMMPh?=
 =?us-ascii?Q?s9FwUV/dVVSio/27t9B42fMJfzANjTRmiTqpBf5oJzASnYR+tbOd1y1NgPj4?=
 =?us-ascii?Q?Sxao4hEkmEEzcr/3ye0UjOK2DRTzsLAK0gaSrWxhnjm8Hs210+okjvXQhnc+?=
 =?us-ascii?Q?a4G53Yn3TJDv3XIqRaIy4GoGFFC6LHAWZetftZMIBtDFteQxw+o4lD22annq?=
 =?us-ascii?Q?6YWHI+Yn9aAXgKhXtJ8FslmdmAyKNYtV+RgaM9yrie5toB/BK1vfgfdpnsNi?=
 =?us-ascii?Q?MikiQI4VzzQve4xXGpG6l35lRfYuqc38r9We6Uy+RWSzHKuL71SNEAfJPDFf?=
 =?us-ascii?Q?RWAc6sFbkMSkh3hS3924B1peR4YM3X2YTIRHkwu/gVY=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3898.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32f87907-f96c-4175-810f-08d8b8bc4296
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2021 18:43:18.2198
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CAJIFLlDCv9nU1o6CkrHBTymxMNnqEQj4jv//WUgrhVLA9UjT+Mm1+YNqxQAOMqE0JY5kO+/FA1Jf9ZnbO8bKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3003
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1610649801; bh=z1B+Yx2wozuztRfI9g64y3dJ6VnWfj9mAjc8aO09lHE=;
        h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:From:To:
         Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
         In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
         X-MS-TNEF-Correlator:authentication-results:x-originating-ip:
         x-ms-publictraffictype:x-ms-office365-filtering-correlation-id:
         x-ms-traffictypediagnostic:x-microsoft-antispam-prvs:
         x-ms-oob-tlc-oobclassifiers:x-ms-exchange-senderadcheck:
         x-microsoft-antispam:x-microsoft-antispam-message-info:
         x-forefront-antispam-report:x-ms-exchange-antispam-messagedata:
         x-ms-exchange-transport-forked:Content-Type:
         Content-Transfer-Encoding:MIME-Version:
         X-MS-Exchange-CrossTenant-AuthAs:
         X-MS-Exchange-CrossTenant-AuthSource:
         X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
        b=Z+7a9/dmSqqPOFVRfeVLt1FBiLUW3UCpNGsyFIoYDB/mSZU/tZv/CdAVrXBM6Qgkb
         j9VRPiEiUP+OyLjN8+pCX6TFA8a4lwdvPaV/6AZ3G1mg0KQK/86nZkhECvnKuADgBs
         tMtKoEajBJhNn37kh88Iqy8drfdZ0JrakwvH9EKY/zW61W1e9TWir/wT/7Ko69I16t
         nthwLPAfIToFVvIUjb5J2GZJpipdR1h84XGiaMP79mIpTFjoL8E+hsZnjVNg/ldzT5
         EoASfhCUKxKdXsT5plH0YsIhxTSFXiGspRTBSWPF9LdTJeQd1A+jg0F9QYRQPAbiSJ
         xgScLKq4WIoAA==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Peter and Wolfram,

Thank you for your comments.

> -----Original Message-----
> From: Peter Rosin <peda@axentia.se>
> Sent: Thursday, January 14, 2021 9:49 AM
> To: wsa@the-dreams.de; Vadim Pasternak <vadimp@nvidia.com>; linux-
> i2c@vger.kernel.org
> Subject: Re: [Re-send: PATCH i2c-next 5/6] i2c: mux: mlxcpld: Extend driv=
er to
> support word address space devices
>=20
> Hi!
>=20
> On 2021-01-12 11:11, wsa@the-dreams.de wrote:
> >
> >> Wolfram, is there a better way to get something stable for user space
> >> to interact with? Is there maybe a way to do this with aliases or some=
thing?
> >> Setting up an ad-hoc scheme for forcing the adapter IDs feels a bit
> outdated.
> >
> > Yeah, it feels rightfully outdated IMO. Bringing such policy into the
> > kernel is frowned upon. I think the proper way is a udev rule to act
> > on the newly created I2C adapter. This even could provide a really
> > stable symlink for userspace to consume. The above scheme is only
> > stable per "block" but inside the block, there is still randomness. Or?
>=20
> Right, that makes sense. Thanks! Vadim, is there any reason to not solve =
this
> with udev? Doing that with care could perhaps provide stable names even i=
f
> you swap slots?

Yes, I can manage it by udev and provide some names like "i2c-lc1-fpga1",
which maybe will be more clear for user, then name like "i2c-132".

I have another, not user space problem and maybe you can
suggest some solution.

In line card driver I planned to create I2C infrastructure for the
specific line card, like:

static int mlxreg_lc_chan[] =3D {
	0x04, 0x05, 0x06, 0x07, 0x08, 0x10, 0x20, 0x21, 0x22, 0x23, 0x40, 0x41,
	0x42, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48, 0x49, 0x4a, 0x4b, 0x4c, 0x4d,
	0x4e, 0x4f
};

static struct mlxcpld_mux_plat_data mlxreg_lc_mux_data[] =3D {
	{
		.chan_ids =3D mlxreg_lc_chan,
		.num_adaps =3D ARRAY_SIZE(mlxreg_lc_chan),
		.sel_reg_addr =3D MLXREG_LC_CHANNEL_I2C_REG,
		.reg_size =3D 2,
	},
};

	mlxreg_lc->mux =3D platform_device_register_resndata(dev, "i2c-mux-mlxcpld=
", parent_nr,
							   NULL, 0, &mlxreg_lc_mux_data,
							   sizeof(mlxreg_lc_mux_data));

And after this infrastructure is ready - to attach from this drive line
card devices from 'i2c_board_info', like:

static struct i2c_board_info mlxreg_lc_main_pwr_devices[] =3D {
	{
		I2C_BOARD_INFO("mp2975", 0x62),
	},
	{
		I2C_BOARD_INFO("mp2975", 0x64),
	},
	{
		I2C_BOARD_INFO("max11603", 0x6d),
	},
	{
		I2C_BOARD_INFO("lm25066", 0x15),
	},
};

static struct mlxreg_hotplug_device mlxreg_lc_main_pwr_brdinfo[] =3D {
	{
		.brdinfo =3D &mlxreg_lc_main_pwr_devices[0],
		.nr =3D 4,
	},
	{
		.brdinfo =3D &mlxreg_lc_main_pwr_devices[1],
		.nr =3D 4,
	},
	{
		.brdinfo =3D &mlxreg_lc_main_pwr_devices[2],
		.nr =3D 5,
	},
	{
		.brdinfo =3D &mlxreg_lc_main_pwr_devices[3],
		.nr =3D 6,
	},
};

Where the above 'nr's are from 'mlxreg_lc_chan'.

And then create with i2c_new_client_device() all the above devices from
workqueue, which will be running until all the 'mlxreg_lc_chan' related
adapters are created.
With forcing base nr, I know the number of last nr, which should be
created by "i2c-mux-mlxcpld".

Without it I'll need some ability to find with nrs have been created by
"i2c-mux-mlxcpld".
Do you have any suggestions for that?

I understand that I can also do it through udev, but I'd prefer to create
all on-board (line card) devices from the kernel, if possible.

Cheers,
Vadim.

>=20
> Cheers,
> Peter

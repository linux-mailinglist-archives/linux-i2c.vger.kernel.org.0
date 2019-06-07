Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD877390BF
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 17:54:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731972AbfFGPyM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 11:54:12 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:8145 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731515AbfFGPrG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jun 2019 11:47:06 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cfa86f80000>; Fri, 07 Jun 2019 08:47:04 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 07 Jun 2019 08:47:04 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 07 Jun 2019 08:47:04 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Jun
 2019 15:47:04 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (104.47.44.59) by
 HQMAIL109.nvidia.com (172.20.187.15) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Fri, 7 Jun 2019 15:47:03 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (20.177.125.216) by
 BYAPR12MB2806.namprd12.prod.outlook.com (20.177.126.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Fri, 7 Jun 2019 15:47:02 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::54a2:b360:f53:6aa]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::54a2:b360:f53:6aa%6]) with mapi id 15.20.1965.011; Fri, 7 Jun 2019
 15:47:01 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Wolfram Sang <wsa@the-dreams.de>, Ajay Gupta <ajaykuee@gmail.com>
CC:     "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: [PATCH v4 2/5] i2c: nvidia-gpu: add runtime pm support
Thread-Topic: [PATCH v4 2/5] i2c: nvidia-gpu: add runtime pm support
Thread-Index: AQHVGi8CIE5ghl70p02XBMfZY6QCgKaP4u8AgAB5EUA=
Date:   Fri, 7 Jun 2019 15:47:01 +0000
Message-ID: <BYAPR12MB27270536D34E3ACFB55AB252DC100@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <20190603170545.24004-1-ajayg@nvidia.com>
 <20190603170545.24004-3-ajayg@nvidia.com> <20190607083316.GB3360@kunai>
In-Reply-To: <20190607083316.GB3360@kunai>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-06-07T15:46:59.8120883Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic;
 Sensitivity=Unrestricted
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b7352579-0a3f-4f7e-587e-08d6eb5f6201
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BYAPR12MB2806;
x-ms-traffictypediagnostic: BYAPR12MB2806:
x-microsoft-antispam-prvs: <BYAPR12MB28062CB1DDF96B5CBCEA3EDBDC100@BYAPR12MB2806.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0061C35778
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(979002)(136003)(346002)(396003)(39850400004)(376002)(366004)(13464003)(189003)(199004)(55016002)(6116002)(316002)(6246003)(4326008)(53936002)(54906003)(110136005)(3846002)(25786009)(9686003)(256004)(14444005)(7736002)(7696005)(33656002)(74316002)(76116006)(73956011)(102836004)(53546011)(76176011)(66446008)(64756008)(66556008)(66476007)(66946007)(71200400001)(305945005)(6506007)(6436002)(99286004)(81166006)(81156014)(8936002)(66066001)(229853002)(8676002)(52536014)(26005)(186003)(486006)(446003)(11346002)(476003)(4744005)(5660300002)(14454004)(68736007)(2906002)(71190400001)(478600001)(86362001)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB2806;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cqWI5SpIneslcAbCxBMlYL+nP0ZHVectAHV+azJ2Urb5ublvtDpcjaTtEcC97TAqizE4ohNZ7/cE5tPqhU0G8xoXne7ywqeVGtPQuQ90XQ1kBj+r2XYHpajR5rrinc5qfmaf8pAQlP8Gb5GErDX+sYNAORTsI7S1hOx7QlI2fSr5CN3EFDEf8mlTmA9Mn+ty8DQgDHXrFjOpkTh1i2IXUzFOn/SDf4mlfNCrTClr0RLYxA4/NF+gmxavdf3wkl0RQcH5PyOzehs9hD9JIsmXwOint+M2v0Jgb+Qwj8oqRaxiozCX7kbJZPWjTc9Wki/qpdFgw8ohg3xkvn7G/J+eS7PFg66B+0ekEAFCafqxlFG890QOWbfQPanGR7+Md+t3OSG57OFL5c4Sz5ysMVmRas8SJ00zNbBGNi9/n+QMvlQ=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b7352579-0a3f-4f7e-587e-08d6eb5f6201
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2019 15:47:01.6300
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ajayg@nvidia.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2806
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559922424; bh=Spd5zf7HiDCTWOrFh4waSST6JRcnTcJ+N+HlTxs2kZc=;
        h=X-PGP-Universal:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
         Message-ID:References:In-Reply-To:Accept-Language:X-MS-Has-Attach:
         X-MS-TNEF-Correlator:msip_labels:authentication-results:
         x-originating-ip:x-ms-publictraffictype:
         x-ms-office365-filtering-correlation-id:x-microsoft-antispam:
         x-ms-traffictypediagnostic:x-microsoft-antispam-prvs:
         x-ms-oob-tlc-oobclassifiers:x-forefront-prvs:
         x-forefront-antispam-report:received-spf:
         x-ms-exchange-senderadcheck:x-microsoft-antispam-message-info:
         MIME-Version:X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
         Content-Language:Content-Type:Content-Transfer-Encoding;
        b=LrPwtFHAj8FXAsX3XliFVblHyf+z8sIuPglerpY5j3tbOmq/EcM2/TErD5PBR+MCJ
         fLk8zSKDmQQMxh9SLItxFvjVyQ+Uycx9THmfFPrHXoLEJ/D1676+NuegrNweIgB/pL
         HlPh7Uui3EgKtVBVsMqjt1fiRqHcQky2SVK4U3IdBRSnMVXHFP1oSoLVBxg9Mh2xSU
         rnOKsfGdxxG03XYWP6YR8Lzvx2pFMLvQnyrjEir34hSL/r06PmWaNmXdtb7pJpMkA/
         Jkpin73mAbjqsTGa5eFVpWASrRa5MkYlojyZmTJJBRXBd0MyPymrG/w6Jk/+ggNQ0U
         dFb5nVBKyCE6A==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

> -----Original Message-----
> From: linux-i2c-owner@vger.kernel.org <linux-i2c-owner@vger.kernel.org>
> On Behalf Of Wolfram Sang
> Sent: Friday, June 7, 2019 1:33 AM
> To: Ajay Gupta <ajaykuee@gmail.com>
> Cc: heikki.krogerus@linux.intel.com; linux-usb@vger.kernel.org; linux-
> i2c@vger.kernel.org; Ajay Gupta <ajayg@nvidia.com>
> Subject: Re: [PATCH v4 2/5] i2c: nvidia-gpu: add runtime pm support
>=20
>=20
> > +	pm_runtime_mark_last_busy(i2cd->dev);
> > +	pm_runtime_put_autosuspend(i2cd->dev);
>=20
> Much better to have this only once!
>=20
> > +/*
> > + * We need gpu_i2c_suspend() even if it is stub, for runtime pm to
> > +work
> > + * correctly. Without it, lspci shows runtime pm status as "D0" for th=
e
> card.
> > + * Documentation/power/pci.txt also insists for driver to provide this=
:
>=20
> I'd think the comment up to here is enough and the rest can go. However, =
I
> leave this decision to you.
Sure, will fix it.

Thanks
> nvpublic


Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0CA139095
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 17:53:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729172AbfFGPxK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 11:53:10 -0400
Received: from nat-hk.nvidia.com ([203.18.50.4]:13311 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731744AbfFGPsR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 7 Jun 2019 11:48:17 -0400
Received: from hkpgpgate101.nvidia.com (Not Verified[10.18.92.100]) by nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cfa87420000>; Fri, 07 Jun 2019 23:48:18 +0800
Received: from HKMAIL102.nvidia.com ([10.18.16.11])
  by hkpgpgate101.nvidia.com (PGP Universal service);
  Fri, 07 Jun 2019 08:48:15 -0700
X-PGP-Universal: processed;
        by hkpgpgate101.nvidia.com on Fri, 07 Jun 2019 08:48:15 -0700
Received: from HKMAIL104.nvidia.com (10.18.16.13) by HKMAIL102.nvidia.com
 (10.18.16.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Jun
 2019 15:48:14 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (104.47.42.58) by
 HKMAIL104.nvidia.com (10.18.16.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Fri, 7 Jun 2019 15:48:14 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (20.177.125.216) by
 BYAPR12MB3495.namprd12.prod.outlook.com (20.178.196.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.14; Fri, 7 Jun 2019 15:47:53 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::54a2:b360:f53:6aa]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::54a2:b360:f53:6aa%6]) with mapi id 15.20.1965.011; Fri, 7 Jun 2019
 15:47:53 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Wolfram Sang <wsa@the-dreams.de>, Ajay Gupta <ajaykuee@gmail.com>
CC:     "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: [PATCH v4 1/5] i2c: nvidia-gpu: refactor master_xfer
Thread-Topic: [PATCH v4 1/5] i2c: nvidia-gpu: refactor master_xfer
Thread-Index: AQHVGi8Bq++I3XMFF0mHKDQeQfIH86aP4viAgAB5NOA=
Date:   Fri, 7 Jun 2019 15:47:53 +0000
Message-ID: <BYAPR12MB2727B6530F84F778EE8A492ADC100@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <20190603170545.24004-1-ajayg@nvidia.com>
 <20190603170545.24004-2-ajayg@nvidia.com> <20190607083322.GC3360@kunai>
In-Reply-To: <20190607083322.GC3360@kunai>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-06-07T15:47:51.1187711Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic;
 Sensitivity=Unrestricted
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: acbecd53-6439-4759-61ad-08d6eb5f80ed
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BYAPR12MB3495;
x-ms-traffictypediagnostic: BYAPR12MB3495:
x-microsoft-antispam-prvs: <BYAPR12MB349598323EDA3150243047B4DC100@BYAPR12MB3495.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1923;
x-forefront-prvs: 0061C35778
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(376002)(396003)(366004)(39860400002)(136003)(13464003)(199004)(189003)(2906002)(68736007)(11346002)(6246003)(26005)(5660300002)(64756008)(7736002)(25786009)(446003)(476003)(76116006)(86362001)(73956011)(66446008)(66476007)(66946007)(6436002)(486006)(66556008)(4326008)(53936002)(52536014)(229853002)(3846002)(55016002)(33656002)(6506007)(53546011)(316002)(110136005)(54906003)(14454004)(256004)(71200400001)(66066001)(74316002)(6116002)(71190400001)(9686003)(305945005)(102836004)(81166006)(7696005)(478600001)(8676002)(81156014)(76176011)(8936002)(99286004)(186003)(4744005);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB3495;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4msUzSpaJifj9fAYpYeBjemIHLB7mRPB9/TGDlSfVneJWazISsKYkF4uTJhdiTcNMufe8wMU6QT0Asnynw1DbBmJ81Vtk/XdtJxHA7vY4dzaBh27tdXdi/9AkhU+EJceo9KFH8QprqAqagMuXH+9HEGCGd/nl2ZURjvX4zv4wfK9eFCAZU2Wp9fo1AZfKDfexVPmANOf29pQbpZ9v6XbHbbeGVz1R5g88Ei+3L7tF3nNlGU/wDh0w+0XH5E3ieP7Zd9b4LJX3MluY6952ZS5o6zUIbazAfJCWjTvO/6iT0Wt9Ezk1Ss1l+h9dHFK1cInNMZ9C7l2QkNeo0l3Zzp2vwca+hkX4jmKximhymJ5rezs+GvbhWM2zSYkYdkN/mEhkujny3khm7nqL8VFCNqhF7d0oQL8c4uUom5nqlhLUcc=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: acbecd53-6439-4759-61ad-08d6eb5f80ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2019 15:47:53.5156
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ajayg@nvidia.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3495
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559922498; bh=FAgspAQj6rliDyCGXMC/ErQAkLrk0qps+PpHggX/vKI=;
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
        b=lKIVBvJPFS+nOzS3w/X6xtY7Y2NR7eiKYvQgLDHwZ0pyXzXurN/jaX3GqsqHx/0XL
         3om6m3w3pkCQMVmAtahz7xS6/BdW1tC++WYQZ1zMXdXSCOcHR7MYaXm7Yj8SPAMMyL
         xbnAV0ae42DCwL/iwWpRIic5IFe/CnQppUz/1+2hvrxMa9jSBn40rcUHj9Y6dK9kTC
         qZmC59bN74zzzugLzRbF3f2RAIVxWLr2OOYRVni5jrU/VvS5wxmEfUdiI6CH6vHMd9
         Xsdv9EuJ1P09mhYf3DlbZijRb7YSG3xtOgjS33BHgEcYbtA9m92ycHtQXD7aPJ5mza
         1Z/nv34N1MnmA==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

> -----Original Message-----
> From: Wolfram Sang <wsa@the-dreams.de>
> Sent: Friday, June 7, 2019 1:33 AM
> To: Ajay Gupta <ajaykuee@gmail.com>
> Cc: heikki.krogerus@linux.intel.com; linux-usb@vger.kernel.org; linux-
> i2c@vger.kernel.org; Ajay Gupta <ajayg@nvidia.com>
> Subject: Re: [PATCH v4 1/5] i2c: nvidia-gpu: refactor master_xfer
>=20
> > Changes from v3->v4:
> > 	- Further refactor master_xfer based on Wolfram's comment.
>=20
> Yay, looks even better. One thing to improve, though.
>=20
> >  	status =3D gpu_i2c_stop(i2cd);
>=20
> send_stop =3D false;

>=20
> > -	if (status < 0)
> > -		return status;
> > +	if (status < 0) {
> > +		send_stop =3D false;
>=20
> and skip it here...
>=20
> > +		goto exit;
> > +	}
> >
> > -	return i;
> > -stop:
> > -	status2 =3D gpu_i2c_stop(i2cd);
> > -	if (status2 < 0)
> > -		dev_err(i2cd->dev, "i2c stop failed %d\n", status2);
> > +	send_stop =3D false;
>=20
> ... and here.
Sure, will fix.

Thanks
>nvpublic


Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B8AE2C8B2
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2019 16:26:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727175AbfE1O0A (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 May 2019 10:26:00 -0400
Received: from nat-hk.nvidia.com ([203.18.50.4]:57178 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727194AbfE1O0A (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 28 May 2019 10:26:00 -0400
Received: from hkpgpgate102.nvidia.com (Not Verified[10.18.92.9]) by nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ced44f20000>; Tue, 28 May 2019 22:25:55 +0800
Received: from HKMAIL102.nvidia.com ([10.18.16.11])
  by hkpgpgate102.nvidia.com (PGP Universal service);
  Tue, 28 May 2019 07:25:55 -0700
X-PGP-Universal: processed;
        by hkpgpgate102.nvidia.com on Tue, 28 May 2019 07:25:55 -0700
Received: from HKMAIL102.nvidia.com (10.18.16.11) by HKMAIL102.nvidia.com
 (10.18.16.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 May
 2019 14:25:54 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (104.47.37.56) by
 HKMAIL102.nvidia.com (10.18.16.11) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 28 May 2019 14:25:54 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (20.177.125.216) by
 BYAPR12MB2631.namprd12.prod.outlook.com (20.176.255.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.20; Tue, 28 May 2019 14:25:51 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::54a2:b360:f53:6aa]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::54a2:b360:f53:6aa%6]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 14:25:51 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Wolfram Sang <wsa@the-dreams.de>, Ajay Gupta <ajaykuee@gmail.com>
CC:     "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: [PATCH v3 2/5] i2c: nvidia-gpu: add runtime pm support
Thread-Topic: [PATCH v3 2/5] i2c: nvidia-gpu: add runtime pm support
Thread-Index: AQHVEMzkPx3E/+mRIUKvJ8Fh+C4XEaZ8RkoAgARYKyA=
Date:   Tue, 28 May 2019 14:25:51 +0000
Message-ID: <BYAPR12MB2727D18CBA3BACC667F253C6DC1E0@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <20190522183142.11061-1-ajayg@nvidia.com>
 <20190522183142.11061-3-ajayg@nvidia.com> <20190525195630.GB12538@kunai>
In-Reply-To: <20190525195630.GB12538@kunai>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-05-28T14:25:49.8703516Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic;
 Sensitivity=Unrestricted
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75da3c2f-0243-4e6d-ab70-08d6e37862ed
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:BYAPR12MB2631;
x-ms-traffictypediagnostic: BYAPR12MB2631:
x-microsoft-antispam-prvs: <BYAPR12MB26310DAB8CB4CF1EFA304A37DC1E0@BYAPR12MB2631.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(366004)(396003)(376002)(39860400002)(136003)(199004)(189003)(13464003)(73956011)(5660300002)(66946007)(66446008)(64756008)(66556008)(66476007)(66066001)(476003)(71190400001)(486006)(478600001)(76116006)(2906002)(54906003)(110136005)(33656002)(446003)(71200400001)(14454004)(6436002)(76176011)(81166006)(6246003)(86362001)(11346002)(68736007)(14444005)(316002)(305945005)(53546011)(99286004)(81156014)(7696005)(7736002)(55016002)(26005)(8676002)(4326008)(53936002)(74316002)(186003)(6506007)(25786009)(3846002)(256004)(9686003)(8936002)(52536014)(102836004)(6116002)(229853002);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB2631;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bB+JBEgutqLECYjn67yv3WjCGBlo9w8AIhr6jtkT4svDHL26v/YPlhQ/DPQbQr5UKXeOGn+tj7o409INasYa5YzZ9W9KYniUcBP9aLaJRL5eDNYrIGT/f8csSMzIm6+K0/BBjNnQpXxzlgrT9d6CUMcte20iafQRYsHy7KO/J0p5kST/qYLkXfYTZHo8dSfur1ihfO+Fxpven1ZYotveUfxEmiPRw1BNspPQPsl5yVTMHi9NMJy4t+51hK51izvOXg06Era96sCDOzcycxu3mlAc2hhOfEcyMh8gKfRfFFb4l2BrBjNUcBbKizxD5BZ0tTWVDd1urPCMq0jk6iwtMjbPxLI19LErL0mnfDrrrtwoOyDzQiRAtx/Ma4XsZwfkS+IX9T/oVvLV9Lc5prsm7o6mMD/8RKupN69nSOwROaY=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 75da3c2f-0243-4e6d-ab70-08d6e37862ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 14:25:51.3248
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ajayg@nvidia.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2631
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559053555; bh=IYD3AqOdF69n+SaXtqLo61h+1ufKfr6duDHwG4Vre34=;
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
        b=fNG6EtLKAu2XeOk6DT9OmUEIoB1FciywEZvZZh8oM1IECw3b020jNxtNKxTWpvEY7
         KOSDQALyN89fhGnxgRyJAenNiUSBPhHARDKtmf+XNIclYGS/nwOunlO5v1ZvvZlTWo
         aRDrPFKRT5LOGDDwnCT1FDxf2sgfiUivy254rDVh8YeUDxQfC8NgPpuyh25bmD1/dC
         O1BMoykkpDJuz7UDHM2YUdJ1gi+d+5O6ixyj+Wo3CUHWXChJg0rHpEBkqJ/K9Eb18J
         wBwO1372UXZKn90LSRWULICgTwvGu4d4Q7APJQ8MZ5Xf2QjWrDbPEV6wb40thDid+T
         SVmmoic95bG2w==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

> -----Original Message-----
> From: linux-usb-owner@vger.kernel.org <linux-usb-owner@vger.kernel.org>
> On Behalf Of Wolfram Sang
> Sent: Saturday, May 25, 2019 12:57 PM
> To: Ajay Gupta <ajaykuee@gmail.com>
> Cc: heikki.krogerus@linux.intel.com; linux-usb@vger.kernel.org; linux-
> i2c@vger.kernel.org; Ajay Gupta <ajayg@nvidia.com>
> Subject: Re: [PATCH v3 2/5] i2c: nvidia-gpu: add runtime pm support
>=20
>=20
> > @@ -211,6 +212,8 @@ static int gpu_i2c_master_xfer(struct i2c_adapter
> *adap,
> >  		goto exit;
> >  	}
> >
> > +	pm_runtime_mark_last_busy(i2cd->dev);
> > +	pm_runtime_put_autosuspend(i2cd->dev);
> >  	return i;
> >  exit:
> >  	if (send_stop) {
> > @@ -218,6 +221,8 @@ static int gpu_i2c_master_xfer(struct i2c_adapter
> *adap,
> >  		if (status2 < 0)
> >  			dev_err(i2cd->dev, "i2c stop failed %d\n", status2);
> >  	}
> > +	pm_runtime_mark_last_busy(i2cd->dev);
> > +	pm_runtime_put_autosuspend(i2cd->dev);
>=20
> Maybe another worthwhile refactorization possible here? The exit code pat=
h
> and 'all good' code path look very similar.=20
> This can be done incrementally, though. I think for now it is okay.
Thanks for suggestion. Yes , it is possible to refactor a bit further here.
=20
> > +static __maybe_unused int gpu_i2c_suspend(struct device *dev) {
> > +	return 0;
> > +}
>=20
> Why do we need this?
I2C function of PCI bus remains in D0 (lspci output) without this function.=
=20

Following document also seems to insist on this.
" For this to work, the device's driver has to provide a=20
pm->runtime_suspend() callback "

Documentation/power/pci.txt=20
"First, a PCI device is put into a low-power state, or suspended, with the =
help
of pm_schedule_suspend() or pm_runtime_suspend() which for PCI devices call
pci_pm_runtime_suspend() to do the actual job.  For this to work, the devic=
e's
driver has to provide a pm->runtime_suspend() callback (see below), which i=
s
run by pci_pm_runtime_suspend() as the first action. If the driver's callba=
ck
returns successfully, the device's standard configuration registers are sav=
ed,
the device is prepared to generate wakeup signals and, finally, it is put i=
nto
the target low-power state."

Thanks
Ajay
> nvpublic


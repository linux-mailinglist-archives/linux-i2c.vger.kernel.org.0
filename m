Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA1F331585
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2019 21:43:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727367AbfEaTm5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 May 2019 15:42:57 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:14386 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727147AbfEaTm5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 May 2019 15:42:57 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cf183bd0000>; Fri, 31 May 2019 12:42:53 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 31 May 2019 12:42:54 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 31 May 2019 12:42:54 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 May
 2019 19:42:53 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 May
 2019 19:42:53 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (104.47.41.52) by
 HQMAIL109.nvidia.com (172.20.187.15) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Fri, 31 May 2019 19:42:53 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (20.177.125.216) by
 BYAPR12MB3493.namprd12.prod.outlook.com (20.178.196.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.16; Fri, 31 May 2019 19:42:51 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::54a2:b360:f53:6aa]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::54a2:b360:f53:6aa%6]) with mapi id 15.20.1922.021; Fri, 31 May 2019
 19:42:51 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Wolfram Sang <wsa@the-dreams.de>, Ajay Gupta <ajaykuee@gmail.com>
CC:     "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: [PATCH v3 2/5] i2c: nvidia-gpu: add runtime pm support
Thread-Topic: [PATCH v3 2/5] i2c: nvidia-gpu: add runtime pm support
Thread-Index: AQHVEMzkPx3E/+mRIUKvJ8Fh+C4XEaZ8RkoAgARYKyCABRGrUA==
Date:   Fri, 31 May 2019 19:42:50 +0000
Message-ID: <BYAPR12MB2727F7FA5B11E9DC776A1ABCDC190@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <20190522183142.11061-1-ajayg@nvidia.com>
 <20190522183142.11061-3-ajayg@nvidia.com> <20190525195630.GB12538@kunai>
 <BYAPR12MB2727D18CBA3BACC667F253C6DC1E0@BYAPR12MB2727.namprd12.prod.outlook.com>
In-Reply-To: <BYAPR12MB2727D18CBA3BACC667F253C6DC1E0@BYAPR12MB2727.namprd12.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: 02a25ee7-c528-4384-0a32-08d6e6002ace
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:BYAPR12MB3493;
x-ms-traffictypediagnostic: BYAPR12MB3493:
x-microsoft-antispam-prvs: <BYAPR12MB349362E3DD17A23BB930F5C9DC190@BYAPR12MB3493.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 00540983E2
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(366004)(396003)(376002)(346002)(136003)(13464003)(189003)(199004)(64756008)(71200400001)(9686003)(6116002)(2906002)(66556008)(66446008)(66476007)(73956011)(71190400001)(66946007)(55016002)(14444005)(66066001)(6436002)(6506007)(52536014)(256004)(7736002)(305945005)(3846002)(99286004)(11346002)(33656002)(186003)(486006)(5660300002)(316002)(446003)(476003)(6246003)(54906003)(478600001)(76116006)(74316002)(102836004)(110136005)(76176011)(86362001)(68736007)(53546011)(229853002)(81166006)(7696005)(25786009)(8676002)(53936002)(8936002)(81156014)(14454004)(4326008)(26005);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB3493;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 624IfehF/LggOG6tCXCmDV+wzvqshLKUI4yKsmAhYO+Sej4B/CkkDMocSnBXyTmKpOsHrSg8cX44q9hZD77Rvaqvn3/OO4u6KW20fod2v1HmLuJX16VvW7fnhcMPresW71k1zyGgncWK2uYPC/T/Zrrrs5E2a0/VVHnqhrZiQwD7TRXzVtkblUYkxMXhXgpaepEpSw3VBfm+wfxchHRHZGWqFgaQ4s6ipUPvrR9zyOED2Lp+GHcQae1qEuB0ze9AiQvsxpcYf1+vjV3ETMwhSXSSrYtgCfAAuH05v3mlTlWM6ES6kzGgHyNrFJu8vk7/6NV3GbHkSMfzYxarfX37qlwF+dt4qq17X28S5MV1skSu14QXcIC7ucBrQedhxF3nU1653oLTDRtF6CMLuPafdzFSt7yoTPtjOqFjqJN40Rc=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a25ee7-c528-4384-0a32-08d6e6002ace
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2019 19:42:51.0809
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ajayg@nvidia.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3493
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559331773; bh=GH5X9RQ+ObGIiGX4bGy2aqFfuGIisPVG2em/dlAH7Vw=;
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
        b=EXe22w9NS1s94ix3ZbnuFaknuz04AhwtU8DjHTV2O0v3rEgSn6ekjl+FjnnO2ol6N
         JOxCQFAN19mBkbIxhxkRFjOFbasSCtqqtvUEwKTrDuTYn4e9WxonoHxoqcAQPdsjGr
         uR3vV0B/FITcvf+WXWuL5EQSr0ndWHRpAOpCgWCc9OY8NripCXid33YtP+T86IDSgB
         RIIBAEkwoy2ZyMF15X+Wl8le9FRZgAgIuhjptr4Z5q1cN4+RrTWGRdCpouGG/lJuwo
         ktAPeRnoWu5wRHWBk9kb008RXY/QKktOdNrDAbvNXJWc71tI6OxBfFc/ovnKy2Xkgp
         nY2GKQKvM1Kpg==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

> > -----Original Message-----
> > From: linux-usb-owner@vger.kernel.org <linux-usb-
> owner@vger.kernel.org>
> > On Behalf Of Wolfram Sang
> > Sent: Saturday, May 25, 2019 12:57 PM
> > To: Ajay Gupta <ajaykuee@gmail.com>
> > Cc: heikki.krogerus@linux.intel.com; linux-usb@vger.kernel.org; linux-
> > i2c@vger.kernel.org; Ajay Gupta <ajayg@nvidia.com>
> > Subject: Re: [PATCH v3 2/5] i2c: nvidia-gpu: add runtime pm support
> >
> >
> > > @@ -211,6 +212,8 @@ static int gpu_i2c_master_xfer(struct i2c_adapter
> > *adap,
> > >  		goto exit;
> > >  	}
> > >
> > > +	pm_runtime_mark_last_busy(i2cd->dev);
> > > +	pm_runtime_put_autosuspend(i2cd->dev);
> > >  	return i;
> > >  exit:
> > >  	if (send_stop) {
> > > @@ -218,6 +221,8 @@ static int gpu_i2c_master_xfer(struct i2c_adapter
> > *adap,
> > >  		if (status2 < 0)
> > >  			dev_err(i2cd->dev, "i2c stop failed %d\n", status2);
> > >  	}
> > > +	pm_runtime_mark_last_busy(i2cd->dev);
> > > +	pm_runtime_put_autosuspend(i2cd->dev);
> >
> > Maybe another worthwhile refactorization possible here? The exit code
> path
> > and 'all good' code path look very similar.
> > This can be done incrementally, though. I think for now it is okay.
> Thanks for suggestion. Yes , it is possible to refactor a bit further her=
e.
>=20
> > > +static __maybe_unused int gpu_i2c_suspend(struct device *dev) {
> > > +	return 0;
> > > +}
> >
> > Why do we need this?
> I2C function of PCI bus remains in D0 (lspci output) without this functio=
n.

Do you still see any issue with gpu_i2c_suspend()?

Thanks
Ajay
> nvpublic
>=20
> Following document also seems to insist on this.
> " For this to work, the device's driver has to provide a
> pm->runtime_suspend() callback "
>=20
> Documentation/power/pci.txt
> "First, a PCI device is put into a low-power state, or suspended, with th=
e help
> of pm_schedule_suspend() or pm_runtime_suspend() which for PCI devices
> call
> pci_pm_runtime_suspend() to do the actual job.  For this to work, the
> device's
> driver has to provide a pm->runtime_suspend() callback (see below), which
> is
> run by pci_pm_runtime_suspend() as the first action. If the driver's call=
back
> returns successfully, the device's standard configuration registers are s=
aved,
> the device is prepared to generate wakeup signals and, finally, it is put=
 into
> the target low-power state."
>=20
> Thanks
> Ajay
> > nvpublic


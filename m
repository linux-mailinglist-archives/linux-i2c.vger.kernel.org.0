Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EEB823DF8
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2019 19:03:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390319AbfETRDH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 May 2019 13:03:07 -0400
Received: from nat-hk.nvidia.com ([203.18.50.4]:5497 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390273AbfETRDH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 20 May 2019 13:03:07 -0400
Received: from hkpgpgate102.nvidia.com (Not Verified[10.18.92.77]) by nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ce2ddc60000>; Tue, 21 May 2019 01:03:02 +0800
Received: from HKMAIL103.nvidia.com ([10.18.16.12])
  by hkpgpgate102.nvidia.com (PGP Universal service);
  Mon, 20 May 2019 10:03:02 -0700
X-PGP-Universal: processed;
        by hkpgpgate102.nvidia.com on Mon, 20 May 2019 10:03:02 -0700
Received: from HKMAIL103.nvidia.com (10.18.16.12) by HKMAIL103.nvidia.com
 (10.18.16.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 20 May
 2019 17:03:02 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (104.47.49.59) by
 HKMAIL103.nvidia.com (10.18.16.12) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Mon, 20 May 2019 17:03:01 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (20.177.125.216) by
 BYAPR12MB2870.namprd12.prod.outlook.com (20.179.90.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.18; Mon, 20 May 2019 17:02:59 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::54a2:b360:f53:6aa]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::54a2:b360:f53:6aa%6]) with mapi id 15.20.1900.020; Mon, 20 May 2019
 17:02:59 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Wolfram Sang <wsa@the-dreams.de>, Ajay Gupta <ajaykuee@gmail.com>
CC:     "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: [PATCH 1/4] i2c: nvidia-gpu: add runtime pm support
Thread-Topic: [PATCH 1/4] i2c: nvidia-gpu: add runtime pm support
Thread-Index: AQHVDM8yF+t9YO0uR0q9WF2IgNS9uKZyidQAgAGuH+A=
Date:   Mon, 20 May 2019 17:02:59 +0000
Message-ID: <BYAPR12MB272780E97D3D70EF46008E32DC060@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <20190517163818.5007-1-ajayg@nvidia.com>
 <20190517163818.5007-2-ajayg@nvidia.com> <20190519144704.GB7291@kunai>
In-Reply-To: <20190519144704.GB7291@kunai>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-05-20T17:02:58.3702951Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic;
 Sensitivity=Unrestricted
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0f2a3deb-1fc8-4f8f-bb22-08d6dd450324
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:BYAPR12MB2870;
x-ms-traffictypediagnostic: BYAPR12MB2870:
x-microsoft-antispam-prvs: <BYAPR12MB28702FD91CF6B4E78F8FC5B4DC060@BYAPR12MB2870.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 004395A01C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(136003)(366004)(376002)(396003)(39860400002)(13464003)(189003)(199004)(6246003)(256004)(68736007)(6436002)(81156014)(8676002)(81166006)(6116002)(5660300002)(3846002)(52536014)(9686003)(8936002)(7736002)(25786009)(7696005)(102836004)(76176011)(4326008)(55016002)(6506007)(316002)(54906003)(110136005)(53546011)(305945005)(53936002)(99286004)(74316002)(2906002)(26005)(14454004)(186003)(229853002)(66066001)(64756008)(66946007)(76116006)(66556008)(66446008)(66476007)(73956011)(71200400001)(86362001)(476003)(486006)(33656002)(478600001)(446003)(11346002)(71190400001);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB2870;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qhuiyx7r3YJxtMUbCtBFK+w4YSYlrQij+wtPQGbVFLMzJbaKn2+LHeuAshWZ6qvqivJwmpcZfxvyS5mGaZXWQ4K7v2dBrURQmjYGRDcOUwSQy/beublEHeEmIwUIAw8hJKaOeR5gp6hzviWOWmlwKyo3f9Mzj1bk9NyLcY3x+AqdLYGhA5hASmMu5J3cJE8a2DiCRhZ5/XbZGeiYmj5XMIBkVce0M+C4N1lFE1QGSTTXH4Mt+gWfgLahBDbSalIIDieFt3kD8hwhiJVcLsNwiNVqf/Ms/KnaMDf+M3Ixmx750/ocYHQlLgJI9KjztiY+v2A+AV+Ok+2PesH2HG21xlqVhn5EHCMjNIPZ7K9YwpznpZWVgXPgY6lRHNosXBB5xS38gPEunr+xSBPBM0Be2BlYXevsV1tBZ+UOqfZ5TnQ=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f2a3deb-1fc8-4f8f-bb22-08d6dd450324
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2019 17:02:59.3475
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2870
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1558371782; bh=jvjxF6RaQT5T2sUJaqJRqo5p3WB1YidL+QJ2LImwpsM=;
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
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
         Content-Language:Content-Type:Content-Transfer-Encoding;
        b=m8GGE2+C/IGt3O2Fr+Rjzrk0RXUDsjiRmtV5chquF8qti13GYnH7xhoGOV3RAUjF/
         /L+97zwfmnfEgSIvn+lxiXaq/1xSfdwlhTaegkYjjaaIVo/2EtwujOL/rPoqcC2VMt
         UY1wehrUsOwwM+ghfKS1SUSY6gGHjVk0bMXis5pr69twxHFb5zeU9xB+xbOX09Vi13
         mumGbLtqax1ZXfYGiT21NKQKLw4e/xHllZVXihb4IGPvr2A7zFqsHaVdjGkmTEpCRc
         VxoGiBx6jXWSLulK9sTS2h7H/QnRMbysp1W6fw3ZFzzux2hzZOLdae0NIxSj9WX/sN
         vWT309/CS2iWQ==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

> -----Original Message-----
> From: Wolfram Sang <wsa@the-dreams.de>
> Sent: Sunday, May 19, 2019 7:47 AM
> To: Ajay Gupta <ajaykuee@gmail.com>
> Cc: heikki.krogerus@linux.intel.com; linux-usb@vger.kernel.org; linux-
> i2c@vger.kernel.org; Ajay Gupta <ajayg@nvidia.com>
> Subject: Re: [PATCH 1/4] i2c: nvidia-gpu: add runtime pm support
>=20
> > diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c
> > b/drivers/i2c/busses/i2c-nvidia-gpu.c
> > index 1c8f708f212b..9d347583f8dc 100644
> > --- a/drivers/i2c/busses/i2c-nvidia-gpu.c
> > +++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
> > @@ -175,6 +175,7 @@ static int gpu_i2c_master_xfer(struct i2c_adapter
> *adap,
> >  	 * The controller supports maximum 4 byte read due to known
> >  	 * limitation of sending STOP after every read.
> >  	 */
> > +	pm_runtime_get_sync(i2cd->dev);
> >  	for (i =3D 0; i < num; i++) {
> >  		if (msgs[i].flags & I2C_M_RD) {
> >  			/* program client address before starting read */ @@ -
> 189,7 +190,7
> > @@ static int gpu_i2c_master_xfer(struct i2c_adapter *adap,
> >  			status =3D gpu_i2c_start(i2cd);
> >  			if (status < 0) {
> >  				if (i =3D=3D 0)
> > -					return status;
> > +					goto exit;
> >  				goto stop;
>=20
> Hmm, goto here, goto there... OK, the code didn't have a good flow even b=
efore
> this patch.
[...]
>=20
> >  			}
> >
> > @@ -206,13 +207,18 @@ static int gpu_i2c_master_xfer(struct i2c_adapter
> *adap,
> >  	}
> >  	status =3D gpu_i2c_stop(i2cd);
> >  	if (status < 0)
> > -		return status;
> > +		goto exit;
> >
> > +	pm_runtime_mark_last_busy(i2cd->dev);
> > +	pm_runtime_put_autosuspend(i2cd->dev);
> >  	return i;
> >  stop:
> >  	status2 =3D gpu_i2c_stop(i2cd);
> >  	if (status2 < 0)
> >  		dev_err(i2cd->dev, "i2c stop failed %d\n", status2);
> > +exit:
> > +	pm_runtime_mark_last_busy(i2cd->dev);
> > +	pm_runtime_put_autosuspend(i2cd->dev);
> >  	return status;
> >  }
>=20
> I am not nacking this, yet the use of goto here seems too much for my tas=
te. If
> you could try refactoring the whole code (dunno, maybe using a flag when =
to
> use stop?), I'd appreciate this.
Ok, I will add a local variable to make it more readable.

Thanks
Ajay
> nvpublic



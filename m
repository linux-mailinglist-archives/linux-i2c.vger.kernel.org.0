Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12DE5256F3
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2019 19:44:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729192AbfEURox (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 May 2019 13:44:53 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:6087 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727142AbfEURox (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 May 2019 13:44:53 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ce439110000>; Tue, 21 May 2019 10:44:49 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 21 May 2019 10:44:52 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 21 May 2019 10:44:52 -0700
Received: from HQMAIL112.nvidia.com (172.18.146.18) by HQMAIL103.nvidia.com
 (172.20.187.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 21 May
 2019 17:44:51 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL112.nvidia.com
 (172.18.146.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 21 May
 2019 17:44:51 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (104.47.37.51) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 21 May 2019 17:44:51 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (20.177.125.216) by
 BYAPR12MB3605.namprd12.prod.outlook.com (20.178.197.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.15; Tue, 21 May 2019 17:44:50 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::54a2:b360:f53:6aa]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::54a2:b360:f53:6aa%6]) with mapi id 15.20.1900.020; Tue, 21 May 2019
 17:44:50 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Ajay Gupta <ajaykuee@gmail.com>
CC:     "wsa@the-dreams.de" <wsa@the-dreams.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: [PATCH v2 3/5] usb: typec: ucsi: ccg: enable runtime pm support
Thread-Topic: [PATCH v2 3/5] usb: typec: ucsi: ccg: enable runtime pm support
Thread-Index: AQHVDztoP3Hz1Du5B0aMxzwyE+x+4qZ1ljGAgABBjEA=
Date:   Tue, 21 May 2019 17:44:50 +0000
Message-ID: <BYAPR12MB2727A21E3AB497C26BA699D2DC070@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <20190520183750.2932-1-ajayg@nvidia.com>
 <20190520183750.2932-4-ajayg@nvidia.com>
 <20190521133727.GK1887@kuha.fi.intel.com>
In-Reply-To: <20190521133727.GK1887@kuha.fi.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-05-21T17:44:48.8252789Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic;
 Sensitivity=Unrestricted
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 07dca30b-37d1-41da-77d7-08d6de140606
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:BYAPR12MB3605;
x-ms-traffictypediagnostic: BYAPR12MB3605:
x-microsoft-antispam-prvs: <BYAPR12MB36052E2D486148AC3B6C85F0DC070@BYAPR12MB3605.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0044C17179
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(376002)(346002)(39860400002)(366004)(136003)(189003)(199004)(7696005)(74316002)(76176011)(64756008)(66446008)(66556008)(66946007)(73956011)(66476007)(6506007)(52536014)(5660300002)(33656002)(305945005)(26005)(76116006)(486006)(7736002)(229853002)(11346002)(6436002)(186003)(476003)(110136005)(54906003)(66066001)(14454004)(446003)(9686003)(99286004)(478600001)(68736007)(55016002)(102836004)(81166006)(25786009)(4326008)(2906002)(8676002)(71200400001)(71190400001)(14444005)(8936002)(3846002)(6116002)(6246003)(81156014)(53936002)(256004)(316002)(86362001);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB3605;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IrlNdmP380SVm02YR0PZy9ta0fEKFSDB9DtnYQvYNAOttcC4Fb/uzkOsQuBph16QYh48DZChFMdttcGLyoP0AclFeOAKoOSlJHzK1IOYEfFTIoQPW+lQOziP2OfwcS2dWzk4r9Vc6dJyTQ4M6UNGjCzL20Gjjex/fldQ+o2mjMnd3Q4aJ5TCfs2BMABlfytaFagX8rK+hrnlOxXrmD2sHBQCbTWfqXj8ic+KGJQtH1aqfAj9790CQJ5ZHdkynPvr26wbtb3dmLvm0AqzK/sTSzwSekzKTLxoRLon45f5DDH7vlWrTE9advXqoCDe4g66oyJinNK5l8UyV9K29gWqXF/CRmFSm2AN9V5quIEpx1z6lnFUpLQFK4GLAyD0CiXK/EmRk2JDg1lp4Vq0c4qv36op1rgmVhR3SdW2YEOyz/Y=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 07dca30b-37d1-41da-77d7-08d6de140606
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2019 17:44:50.0293
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3605
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1558460689; bh=R6zEkG3Sqn8DxLKrSHvYpV0FbcbnqvHQRVm1LXPZLLo=;
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
        b=JwIot40l6Wc7VIZ7EsLbyOkTNJpHlgOqNX954pYP9c/r5KBIeMKTcbb0fWJramHQ2
         H8lvW6D3ETMspZH2MgrA26tP2+FkZ902dNTUXBWTV82NH4lsDWJ36Gxrqa7M7nn4hy
         TGrKgcJqrO41iz2Pu5DoZC7QVURBO7K+o1PEtp1ckzKs2syXAZ8xf21XD5gPyeS1DK
         o6kqcrpGmUsZ1kId3q8KE1p2PYYEDtmWjs2Ptu0vvMwv4seYih9KyQ2f9xtxJgkK5Y
         dlo9VQERwFkfsKKQo4Cmi6/f5Cw1aCN2fbsYEACLTh6/r1R8QL+n5jhyJBTWcmDBbU
         flqvq4sRYlrmQ==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heikki

> > +static int ucsi_ccg_resume(struct device *dev) {
> > +	struct i2c_client *client =3D to_i2c_client(dev);
> > +	struct ucsi_ccg *uc =3D i2c_get_clientdata(client);
> > +	struct ucsi *ucsi =3D uc->ucsi;
> > +	struct ucsi_control c;
> > +	int ret;
> > +
> > +	/* restore UCSI notification enable mask */
> > +	UCSI_CMD_SET_NTFY_ENABLE(c, UCSI_ENABLE_NTFY_ALL);
> > +	ret =3D ucsi_send_command(ucsi, &c, NULL, 0);
> > +	if (ret < 0) {
> > +		dev_err(uc->dev, "%s: failed to set notification enable - %d\n",
> > +			__func__, ret);
> > +	}
> > +	return 0;
> > +}
>=20
> I would prefer that we did this for all methods in ucsi.c, not just ccgx.=
 Could you
> add resume callback to struct ucsi_ppm, and then call it here.
struct ucsi_ppm currently have .sync() and .cmd() callback which is impleme=
nted by
ucsi_ccg and ucsi_acpi and invoked by usci.c.=20

Is it okay to add a callback in this structure and implement inside ucsi.c =
and invoke
from ucsi_ccg and ucsi_acpi? OR we can just add a function in ucsi.c and ex=
port it
and use it from ucsi_ccg and ucsi_acpi?

>=20
> > +static int ucsi_ccg_runtime_suspend(struct device *dev) {
> > +	return 0;
> > +}
> > +
> > +static int ucsi_ccg_runtime_resume(struct device *dev) {
> > +	return 0;
> > +}
> > +
> > +static int ucsi_ccg_runtime_idle(struct device *dev) {
> > +	return 0;
> > +}

> > Oh yes, and do you really need to supply all of those stubs?
We can drop ucsi_ccg_runtime_idle() but we do need
ucsi_ccg_runtime_suspend() and ucsi_ccg_runtime_resume() for
runtime pm functionality.

Thanks
Ajay
> nvpublic
> > +
> > +static const struct dev_pm_ops ucsi_ccg_pm =3D {
> > +	.suspend =3D ucsi_ccg_suspend,
> > +	.resume =3D ucsi_ccg_resume,
> > +	.runtime_suspend =3D ucsi_ccg_runtime_suspend,
> > +	.runtime_resume =3D ucsi_ccg_runtime_resume,
> > +	.runtime_idle =3D ucsi_ccg_runtime_idle, };
> > +
> >  static struct i2c_driver ucsi_ccg_driver =3D {
> >  	.driver =3D {
> >  		.name =3D "ucsi_ccg",
> > +		.pm =3D &ucsi_ccg_pm,
> >  	},
> >  	.probe =3D ucsi_ccg_probe,
> >  	.remove =3D ucsi_ccg_remove,
>=20
> thanks,
>=20
> --
> heikki

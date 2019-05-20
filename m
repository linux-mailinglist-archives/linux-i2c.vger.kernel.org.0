Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06DC523E09
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2019 19:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392726AbfETRIM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 May 2019 13:08:12 -0400
Received: from nat-hk.nvidia.com ([203.18.50.4]:55055 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390373AbfETRIL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 20 May 2019 13:08:11 -0400
Received: from hkpgpgate101.nvidia.com (Not Verified[10.18.92.77]) by nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ce2def80000>; Tue, 21 May 2019 01:08:08 +0800
Received: from HKMAIL101.nvidia.com ([10.18.16.10])
  by hkpgpgate101.nvidia.com (PGP Universal service);
  Mon, 20 May 2019 10:08:08 -0700
X-PGP-Universal: processed;
        by hkpgpgate101.nvidia.com on Mon, 20 May 2019 10:08:08 -0700
Received: from HKMAIL103.nvidia.com (10.18.16.12) by HKMAIL101.nvidia.com
 (10.18.16.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 20 May
 2019 17:08:07 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (104.47.48.58) by
 HKMAIL103.nvidia.com (10.18.16.12) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Mon, 20 May 2019 17:08:07 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (20.177.125.216) by
 BYAPR12MB2950.namprd12.prod.outlook.com (20.179.91.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Mon, 20 May 2019 17:08:05 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::54a2:b360:f53:6aa]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::54a2:b360:f53:6aa%6]) with mapi id 15.20.1900.020; Mon, 20 May 2019
 17:08:05 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Wolfram Sang <wsa@the-dreams.de>, Ajay Gupta <ajaykuee@gmail.com>
CC:     "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: [PATCH 3/4] i2c: nvidia-gpu: resume ccgx i2c client
Thread-Topic: [PATCH 3/4] i2c: nvidia-gpu: resume ccgx i2c client
Thread-Index: AQHVDM8rSUugAwHz/02yIZJm6ZthtKZyiksAgAG4NSA=
Date:   Mon, 20 May 2019 17:08:05 +0000
Message-ID: <BYAPR12MB27274FCCE776B445F33AF762DC060@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <20190517163818.5007-1-ajayg@nvidia.com>
 <20190517163818.5007-4-ajayg@nvidia.com> <20190519144844.GC7291@kunai>
In-Reply-To: <20190519144844.GC7291@kunai>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-05-20T17:08:04.2275910Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic;
 Sensitivity=Unrestricted
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e0aad025-fc68-4a40-8db9-08d6dd45b982
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:BYAPR12MB2950;
x-ms-traffictypediagnostic: BYAPR12MB2950:
x-microsoft-antispam-prvs: <BYAPR12MB295042828F4E1678BA68A917DC060@BYAPR12MB2950.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 004395A01C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(136003)(396003)(346002)(39860400002)(376002)(199004)(189003)(13464003)(64756008)(66556008)(476003)(5660300002)(99286004)(66446008)(73956011)(66476007)(76116006)(66946007)(4744005)(53936002)(186003)(7696005)(81166006)(53546011)(8936002)(86362001)(76176011)(316002)(81156014)(26005)(6506007)(54906003)(4326008)(6246003)(52536014)(71190400001)(71200400001)(66066001)(25786009)(110136005)(7736002)(74316002)(478600001)(486006)(14454004)(11346002)(256004)(446003)(305945005)(33656002)(229853002)(2906002)(68736007)(102836004)(6436002)(55016002)(9686003)(3846002)(6116002)(8676002);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB2950;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: //7NRCNycgzy0SFRZRFoLfDDdnyNFqkh6FReQM+le0W2YbLFxIm0+/vzvBuE7JgO0YLCzrq9I3Znq7daldN8LdP4r3XBPEspLSZjv7RyhpDWbqC26YicCKdcCnlNHdvsg3T2DyDzEUfEF6+BHzlzbNd1sePam3paR1ddVHctDBCyMohag7zLqIHpoYsYhaPs3iBXt9myqUtLuwgYwnGC1W9m+NBrStW5Vq5uwtCkc47aDWW9yMxWsMzj0vIi0n7QunP9JfAyyRJkBObTvZgyeV57Aj/nTOayKYLfQ9usK8jSzECubpuLTkXH6k2EBCVMk51ZxlHFqtbEG/3wXMVEZKCZiYmx/qRKreArVrz6NM5N5cGJEbneR2UM5SAWr2VsE33igkKuO1XFofZckUMi3mhS0/9Up1gx/rRaehFqKmA=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e0aad025-fc68-4a40-8db9-08d6dd45b982
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2019 17:08:05.2907
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2950
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1558372088; bh=QLPIUl0fxd9uGaWNI0G3pQSTXdeUsAC9ryzAVdJmMB4=;
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
        b=hti04QRTU+UxYKU0tPgKGZD9dH2rqHbUfxsbv0c5KHdFEadS/J0Hm8rf/XCDqfpoJ
         6rbizv6EAdun5DsUkFCLXIBcCnrRIDrv+fON59ZV+abORw+M6tVzwIh+aQZqY3/cZM
         eHO5Bja1RFOxas4h1mFTZR45dR7BrJDy4X3fva5iLKPSt7NUg+XdF2J8bGnpWjri/6
         atqGSxCa2+seuu/eAj2ZEoUWy5JqSQvCNGq1UhJYZM+9WE3ozgZjY1BagACekxuTxt
         w25K/YBA7SwAO/q3af+Eu9iJ+hPvbpwmimFLoSKWir9BkTDkF2POLPLLQwJ6qhR4rf
         t7p/fSe4peE6w==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

> -----Original Message-----
> From: Wolfram Sang <wsa@the-dreams.de>
> Sent: Sunday, May 19, 2019 7:49 AM
> To: Ajay Gupta <ajaykuee@gmail.com>
> Cc: heikki.krogerus@linux.intel.com; linux-usb@vger.kernel.org; linux-
> i2c@vger.kernel.org; Ajay Gupta <ajayg@nvidia.com>
> Subject: Re: [PATCH 3/4] i2c: nvidia-gpu: resume ccgx i2c client
>=20
>=20
> > +	/* runtime resume ccgx client so that it can see for any
> > +	 * connector change event. Old ccg firmware has known
> > +	 * issue of not triggering interrupt when a device is
> > +	 * connected to runtime resume the controller.
> > +	 */
>=20
> Check coding style for comments.
Sure, will fix.
>=20
> BTW how do you suggest this gets upstream? Through the usb-tree? Would be
> fine with me. Are there any dependencies? The cover-letter doesn't mentio=
n it.
I would prefer it to go through usb-tree since usb ucsi_ccg driver is the m=
ain driver
getting runtime pm functionality with the series. I will add this informati=
on in cover
letter too.

Thanks
Ajay
>nvpublic


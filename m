Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C47C38FE7
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 17:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731455AbfFGPqm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 11:46:42 -0400
Received: from nat-hk.nvidia.com ([203.18.50.4]:21919 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731431AbfFGPqi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 7 Jun 2019 11:46:38 -0400
Received: from hkpgpgate101.nvidia.com (Not Verified[10.18.92.100]) by nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cfa86da0000>; Fri, 07 Jun 2019 23:46:34 +0800
Received: from HKMAIL102.nvidia.com ([10.18.16.11])
  by hkpgpgate101.nvidia.com (PGP Universal service);
  Fri, 07 Jun 2019 08:46:34 -0700
X-PGP-Universal: processed;
        by hkpgpgate101.nvidia.com on Fri, 07 Jun 2019 08:46:34 -0700
Received: from HKMAIL103.nvidia.com (10.18.16.12) by HKMAIL102.nvidia.com
 (10.18.16.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Jun
 2019 15:46:34 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (104.47.42.52) by
 HKMAIL103.nvidia.com (10.18.16.12) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Fri, 7 Jun 2019 15:46:33 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (20.177.125.216) by
 BYAPR12MB3079.namprd12.prod.outlook.com (20.178.54.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.14; Fri, 7 Jun 2019 15:46:31 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::54a2:b360:f53:6aa]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::54a2:b360:f53:6aa%6]) with mapi id 15.20.1965.011; Fri, 7 Jun 2019
 15:46:31 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     Ajay Gupta <ajaykuee@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: [PATCH v4 3/5] usb: typec: ucsi: ccg: enable runtime pm support
Thread-Topic: [PATCH v4 3/5] usb: typec: ucsi: ccg: enable runtime pm support
Thread-Index: AQHVGi8HqgGN4jlQBUW8sHZpNgcaFaaP4KwAgAAAiACAAHoyMA==
Date:   Fri, 7 Jun 2019 15:46:31 +0000
Message-ID: <BYAPR12MB2727152C62A13508E5B4092FDC100@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <20190603170545.24004-1-ajayg@nvidia.com>
 <20190603170545.24004-4-ajayg@nvidia.com>
 <20190607082510.GB10298@kuha.fi.intel.com> <20190607082704.GA3360@kunai>
In-Reply-To: <20190607082704.GA3360@kunai>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-06-07T15:46:29.6001855Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic;
 Sensitivity=Unrestricted
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 17c1cb2b-885c-4b4e-f7b0-08d6eb5f4fdf
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BYAPR12MB3079;
x-ms-traffictypediagnostic: BYAPR12MB3079:
x-microsoft-antispam-prvs: <BYAPR12MB307935541869CCFBE3A82FF2DC100@BYAPR12MB3079.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0061C35778
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(979002)(136003)(346002)(396003)(39860400002)(366004)(376002)(13464003)(199004)(189003)(5660300002)(26005)(99286004)(53936002)(9686003)(81156014)(8676002)(54906003)(186003)(66946007)(6116002)(3846002)(305945005)(8936002)(68736007)(6246003)(14454004)(229853002)(476003)(102836004)(6506007)(7696005)(53546011)(110136005)(33656002)(55016002)(14444005)(478600001)(6436002)(76176011)(7736002)(256004)(486006)(2906002)(25786009)(76116006)(81166006)(66066001)(71190400001)(52536014)(11346002)(66476007)(66556008)(446003)(73956011)(71200400001)(66446008)(4326008)(316002)(74316002)(86362001)(64756008)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB3079;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rBHduFAsM1+bM8nZCOJvQvD07BB9tCHlDwDAgJeD43AIyDs2SWqtbwbg3OO8YEb3LBYVfNj712d6DRCmCMSR6DPP75c+fVCcZXFH06D72gLkSX4ktXl8SjMeiupBiweNfpRLxIdijon4jpVKN+oqJIJ81K4jcCX02Vj0YVhupyBE6KR3BZlWpVBx24/GWjSzQr/fUQ+4F2sGySHrBMsf26JkyFihY8zmdCAxdXtnM+SDl/KJceoiytmW0yBNJEZ1x0s3XdI+5TO9ebgcj0LHXoWTw0MxD5VwcpXkLdVCKJHCgCKsfmmnpsosfRFSNoLjlQ1F0hWTQg5oYKh83SFNFjNEUtxzplZLipRCyAM9wA9B0Y/G7YyJ/gC/Mu0z+4GqumHF9JL+uqAuVh4FJPIJeG0NH9qV9Pv2RDj+m2rhTck=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 17c1cb2b-885c-4b4e-f7b0-08d6eb5f4fdf
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2019 15:46:31.2103
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ajayg@nvidia.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3079
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559922394; bh=jUc8sNxBozVThXT153aMBu0ikOj7z9Qsr5cTRjBTEIY=;
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
        b=pWJ7Z3PtHsR7YejW7G4tBVZpmv/jrLX1KyNce8NWMeTXt409euqcsh3pzLvnzqRj5
         LAF6cRjo9pf0wMWF9EXNLljmiWSzhp4egqQYAUWhq4+HnVl2jiBGrz1s8Y1PVOUesW
         0R+SYR4XziTOCdnf9oJkzgyGrbNrbvRCfLIgyXn2ZNsvvRjbSl+WuoqYOJGMKQ0h56
         Zejt+q03YBvasB5LW8ryhMLBLPEjx/MZ8bVnxtmDGIFYZVL7qLHIsOkJtgfFpeqxOZ
         pyGpB+qWY4bJ5oN5gmUHSABCsJqnlmpG3pmQUgqbJb/W+BYyzlGOWFXsWwwPuDtf0L
         5qJSKq7NZlg0Q==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heikki and Wolfram,

> -----Original Message-----
> From: linux-i2c-owner@vger.kernel.org <linux-i2c-owner@vger.kernel.org>
> On Behalf Of Wolfram Sang
> Sent: Friday, June 7, 2019 1:27 AM
> To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Ajay Gupta <ajaykuee@gmail.com>; linux-usb@vger.kernel.org; linux-
> i2c@vger.kernel.org; Ajay Gupta <ajayg@nvidia.com>
> Subject: Re: [PATCH v4 3/5] usb: typec: ucsi: ccg: enable runtime pm supp=
ort
>=20
> On Fri, Jun 07, 2019 at 11:25:10AM +0300, Heikki Krogerus wrote:
> > On Mon, Jun 03, 2019 at 10:05:43AM -0700, Ajay Gupta wrote:
> > > From: Ajay Gupta <ajayg@nvidia.com>
> > >
> > > The change enables runtime pm support to UCSI CCG driver.
> > > Added ucsi_resume() function to enable notification after system
> > > reusme. Exported both ucsi_resume() and ucsi_send_command()
> symbols
> > > in ucsi.c for modular build.
> > >
> > > Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
> >
> > Was the idea that Wolfram picks these? In that case:
>=20
> Cover letter says your tree, will check the i2c patches now.
Either tree is fine with me. There are 3 (out of 5)  I2C related patches in=
 the set so better
they go through I2C tree.

Thanks
Ajay
> nvpublic


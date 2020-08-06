Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5E8A23D662
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Aug 2020 07:18:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727060AbgHFFSs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Aug 2020 01:18:48 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:10920 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725440AbgHFFSr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Aug 2020 01:18:47 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2b92520000>; Wed, 05 Aug 2020 22:17:06 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 05 Aug 2020 22:18:46 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 05 Aug 2020 22:18:46 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 6 Aug
 2020 05:18:45 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (104.47.38.51) by
 HQMAIL101.nvidia.com (172.20.187.10) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 6 Aug 2020 05:18:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FeofCGpp7hgz8EQChZBt4I6WFCSFHC6p14ViTaSd5J9SkvI7XZkOaIckKKQ2WuaRnzKHPZnjldyP8AbhyTFjzXq3grxT8jdT4M0ObZplVNKuwFTQto6TYuodeMwTGaDIE+Lxjh4+UjIlA1MF0i8tZunVSvv04hWCyCXeOO9JFhdhtx2DKG7JTs1Y4w+p5jysrtzBkgnTQIlHTwALQOV7naU4HwhqbG2SRQnVqGa77FT1Ohq6GY3vtI8sW3AUs9sKgT2VLXorxVaj+Qewa6nfxRprp+K1glDXwcU3nhQDXpbzSFPCBUTbPDK4v3xOtWIU4XmcrfXq59TWbf5NTENX7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CA6N1lOj7OHYPnk18tLvoypbceGIYnPlM+G6Yu1nwD8=;
 b=aw9xdjaCFGdSdkoi0ruWIhSw6eo74brVn1rUtWATe67S+20FxiOi08HPE7rov4KowG4Lr00UfMaxrFYGfAPxBqriPitoWiuXSauFGOomfcgb+WvnMveDOnham+ycgwHeMijdeTNDqXJe0qxhC8Jkvn6mN+8tzkBK3GiS30Mbr73dxys0m3COGODXg/3h6Q5khZZ9IibzSUDQaIFf/lmAW4JaKbkZyrF0XT2TecQeARwS97fOQUOLNAd+XYkBJh6cLQSPfUTf9mdL3C4Myo7nsWR3Z40oowO3LLvQghWPlbMLqHx2tiPVjuBjccwa18YrdcAAUs7c/XpzcCeNj8etRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BY5PR12MB3953.namprd12.prod.outlook.com (2603:10b6:a03:194::22)
 by BYAPR12MB2998.namprd12.prod.outlook.com (2603:10b6:a03:dd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.21; Thu, 6 Aug
 2020 05:18:44 +0000
Received: from BY5PR12MB3953.namprd12.prod.outlook.com
 ([fe80::177:5e82:bee4:f47a]) by BY5PR12MB3953.namprd12.prod.outlook.com
 ([fe80::177:5e82:bee4:f47a%5]) with mapi id 15.20.3239.022; Thu, 6 Aug 2020
 05:18:44 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: [PATCH v1] i2c: nvidia-gpu: Use put_unaligned_be24()
Thread-Topic: [PATCH v1] i2c: nvidia-gpu: Use put_unaligned_be24()
Thread-Index: AQHWW4Dmrod3bXmTx0+hihlKyR11hakpXpwAgAFMfZA=
Date:   Thu, 6 Aug 2020 05:18:44 +0000
Message-ID: <BY5PR12MB3953EDE14C4B3947F3A5A4F9DC480@BY5PR12MB3953.namprd12.prod.outlook.com>
References: <20200716145319.53773-1-andriy.shevchenko@linux.intel.com>
 <20200805092842.GL1229@kunai>
In-Reply-To: <20200805092842.GL1229@kunai>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2020-08-06T05:18:43.3768252Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=d6a5d43a-a472-4280-a39e-c19d7ffc5ac9;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=nvidia.com;
x-originating-ip: [216.228.112.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1af01172-7bb3-4711-931b-08d839c83074
x-ms-traffictypediagnostic: BYAPR12MB2998:
x-microsoft-antispam-prvs: <BYAPR12MB29986592254F19BAFC9C5490DC480@BYAPR12MB2998.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:883;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rJusZ+c+p4yvHsdsWjGAZW2tA8agnNp/3DZZ2UkSskAnQdge/3FPW44OmKzEJpNxSWKCd5lXDoBJIJtjq+BNYC7mTVSDUKATBPO5nltNFLEGNphwr3BjWib1VqeNl85qRJa6ZiP5o4AlF+5WmnvCazGG4oT1+SwuB/Y/KxI7W/QjFXK48L4G86/mGIrG2+Jg4fJZK64rSY5/MYKB6IFyxys20RrZEOwYrFQJY1wi0d9fIO193PBMLLqMLbHOkVmBRKdhs+axf9s1xak0zXkJgHJlXp7ziFDnMA5ojHf9sWs8ECSa5eTUb0bfEGcljr+Ji9zJWcTvRsgoprrl6cZC0Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB3953.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(66446008)(33656002)(71200400001)(53546011)(76116006)(86362001)(55016002)(66556008)(66946007)(9686003)(6506007)(66476007)(478600001)(64756008)(83380400001)(186003)(8936002)(52536014)(316002)(8676002)(2906002)(110136005)(26005)(7696005)(5660300002)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: JCKjYehS6ZOdf51h5gVoE9bVmUN6q7U9FYgAJHJQQWUxn+yiZtw/PWQoe53QCSr+MYWBkAUgCVy9hIzhEO/5vxHt5jifOHdOTucX1M07/h7H7m/IQCLP1uT0qz4uOHTy16hSWaD7wBtnIpajGHp2QByaKpAH388SNnmnmKxk9OpiUF3m9O/m49ponVHRiJ3HgSVo5XNOq4HcjtmmPP5OHtHrvurOhGOppG+aiUqsKWolvgAjDsNHMcsQb18YcwCbsI4FhL85/pyocgv51JWKZwMxbEkPuFolKPDhBeJmIKhqPefA5fntBAFngMWC4aZTj+9ZFpii5YSvfIUmGMOAdtKU61XT9IVTrZ4cF+ulxBjvW0Bm9fq8nyL2ifY3Z3ij7L7n9MW8KU4VeGhVxkMzAJ01/KTl+bR/OO3M6LKl+ozZnmOIuxvcQ0vu+nJaXaQAkZ1bXKw5EbZP2l9NS9Kgk/eo7k3whwuHKLClnIu3+oJ/lWgLx4pl6DU5Jf0gozRC/dfRHc1I+w0wQB8KFvOK6bdsD3Mgck7frroSCKELUJOKLMrZpQednbQVUsqTrhjxmO8/LOldUDoeVV23O+DRnfYnFns+1TUkYXo9CJIybAtttd89Q8PjbFa0Znl2l3ItMJowoH0u/6rFs8gvoiBl5g==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3953.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1af01172-7bb3-4711-931b-08d839c83074
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2020 05:18:44.1094
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4GytITnNk6SQ5WICphWL6/urnltzcQ2jPJDJU6eSf/QP1YyrbQh3YNWoNGGY9Mv+gqPnnxzcU85boT3hAT9kiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2998
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596691026; bh=CA6N1lOj7OHYPnk18tLvoypbceGIYnPlM+G6Yu1nwD8=;
        h=X-PGP-Universal:ARC-Seal:ARC-Message-Signature:
         ARC-Authentication-Results:From:To:CC:Subject:Thread-Topic:
         Thread-Index:Date:Message-ID:References:In-Reply-To:
         Accept-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
         authentication-results:x-originating-ip:x-ms-publictraffictype:
         x-ms-office365-filtering-correlation-id:x-ms-traffictypediagnostic:
         x-microsoft-antispam-prvs:x-ms-oob-tlc-oobclassifiers:
         x-ms-exchange-senderadcheck:x-microsoft-antispam:
         x-microsoft-antispam-message-info:x-forefront-antispam-report:
         x-ms-exchange-antispam-messagedata:x-ms-exchange-transport-forked:
         MIME-Version:X-MS-Exchange-CrossTenant-AuthAs:
         X-MS-Exchange-CrossTenant-AuthSource:
         X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
         Content-Language:Content-Type:Content-Transfer-Encoding;
        b=J6eO8AdQ+X/wcB3cd/kkUEYVWqEYsHv0bFiM5Dne8keSZm0wgY5jiKn3IvzErCMcd
         e+q/ujtO9UF9eUxY+r1YZnbvX6u5Lu0VvH77RvYtm8slrhUQ+VK2L4MSWzeXUNgyYv
         jqfzt/YsBloJ8bzZk3m7gmG+Kw3KUe3hXmgwTjBPF0iMJC4lES7tQgZsKb5TAZDd4n
         yMoPY0OrUKrosgV3IiYlJGwe9kQW+9PwXWwBxEQUSeQXml9DOJjR0U2iV4dz5dLz0X
         GQ9uGocWevQH0wUIYsE72Viq7u0AlTYmQhp9UVRwE2gAIcCm+fWmUD3wgHjrEoBKaG
         +V2bFzIZ67D9g==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: Wednesday, August 5, 2020 2:29 AM
> To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Ajay Gupta <ajayg@nvidia.com>; linux-i2c@vger.kernel.org
> Subject: Re: [PATCH v1] i2c: nvidia-gpu: Use put_unaligned_be24()
>=20
> On Thu, Jul 16, 2020 at 05:53:19PM +0300, Andy Shevchenko wrote:
> > This makes the driver code slightly easier to read.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
>=20
> Ajay, any comments?
The change looks good to me.

Reviewed-by: Ajay Gupta <ajayg@nvidia.com>

Thanks
> nvpublic
>=20
> >  drivers/i2c/busses/i2c-nvidia-gpu.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i=
2c-
> nvidia-gpu.c
> > index f480105000b8..f9a69b109e5c 100644
> > --- a/drivers/i2c/busses/i2c-nvidia-gpu.c
> > +++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
> > @@ -125,8 +125,7 @@ static int gpu_i2c_read(struct gpu_i2c_dev *i2cd, u=
8
> *data, u16 len)
> >  		put_unaligned_be16(val, data);
> >  		break;
> >  	case 3:
> > -		put_unaligned_be16(val >> 8, data);
> > -		data[2] =3D val;
> > +		put_unaligned_be24(val, data);
> >  		break;
> >  	case 4:
> >  		put_unaligned_be32(val, data);
> > --
> > 2.27.0
> >

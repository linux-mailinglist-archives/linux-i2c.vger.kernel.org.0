Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B67761E2682
	for <lists+linux-i2c@lfdr.de>; Tue, 26 May 2020 18:08:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387707AbgEZQIb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 May 2020 12:08:31 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:6577 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387400AbgEZQIb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 May 2020 12:08:31 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ecd3ef20000>; Tue, 26 May 2020 09:08:18 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 26 May 2020 09:08:30 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 26 May 2020 09:08:30 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 26 May
 2020 16:08:30 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (104.47.45.52) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 26 May 2020 16:08:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EqxLhbzucRKXMye+Xjk9IKJZ5NABt25vZZoHd0JSVQUh575qVkYvO5YINkkc2WEEn1Bj6VcdU6zbGPA1yJ4gpvKWMlbWS1x5wbsfP8xGA4DkrYlJCgD40DXc+3BoPwEAFbIscTbaW+gbI7FRXmKVuDUqkHSnNw7hwLiW8SeKWOs7iEquhUsQQwvntYDtyvoPpVO1ySj0Y+RxCyDCbyn/jou+b+lKxqHLIhJxjEndnKZg8zU9WmmhwmzZWN4wxIfdOnUzTWbAzN+b85tJ84SYx1qTIk3h1jfUTA4/+ePBjc47DTeas2VNpVavzpxh7KMNp0y2trmx/FP1y1vQ6zOf1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRc56iSknUJCgLV6tyweNkJn/J+dEUnkDgcTA0rS3Yw=;
 b=TNtU8H1UVdE4iPFDJXZS3PwWoWP2w+wUSzotLfLGixjp3AOslgZOQQeWJEZJaNtqRz7+UbGi7D9MiQ16ZUunwUGTwzria/Fm6+c+SRgv2Ggm9/83YO3WXBvaNWCHGLiqaTImktdz/0izZajWE0WoM/uFbPEMdDsKBM8yetuSiKZ1n/6YYcH10YjibhUqA7t3TDxBcE4QKNJnzAmv6LbflVz6J+LHOtAYF2WKd6Np9t+mZBuvW2BXnjNnUSx0lUIEESQT1cD05suDP6lsCFRl6Zz6iJ4JMyrqWzKbT4aB3ELDvnFwdNWry32JW3NTvshdTuNLWYwECmpiB3B3ANXDcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BY5PR12MB3953.namprd12.prod.outlook.com (2603:10b6:a03:194::22)
 by BY5PR12MB3731.namprd12.prod.outlook.com (2603:10b6:a03:1a7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Tue, 26 May
 2020 16:08:29 +0000
Received: from BY5PR12MB3953.namprd12.prod.outlook.com
 ([fe80::7c47:7b71:7bfc:2a2b]) by BY5PR12MB3953.namprd12.prod.outlook.com
 ([fe80::7c47:7b71:7bfc:2a2b%7]) with mapi id 15.20.3045.016; Tue, 26 May 2020
 16:08:29 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] i2c: nvidia-gpu: Use PTR_ERR_OR_ZERO() to simplify code
Thread-Topic: [PATCH] i2c: nvidia-gpu: Use PTR_ERR_OR_ZERO() to simplify code
Thread-Index: AQHWMEwY9XKS07n+H02N8bwRR/2jVKi6jzHw
Date:   Tue, 26 May 2020 16:08:29 +0000
Message-ID: <BY5PR12MB39537E5ADD522B282776D67FDCB00@BY5PR12MB3953.namprd12.prod.outlook.com>
References: <20200505145230.17251-1-aishwaryarj100@gmail.com>
 <20200522151710.GL5670@ninjato>
In-Reply-To: <20200522151710.GL5670@ninjato>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2020-05-26T16:08:28.2368703Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=5c850adb-75fb-4fc7-be3a-1bd865bc716f;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 83b1117f-a36f-4587-416b-08d8018f07d6
x-ms-traffictypediagnostic: BY5PR12MB3731:
x-microsoft-antispam-prvs: <BY5PR12MB37313296871A7EBD1787E1F2DCB00@BY5PR12MB3731.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 041517DFAB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m+jd/8pDWnrKtg3ZZu2nwoS3B/fCg4iDHIqmlW1+7mqpH6aXqG3L3MXyMH5a7KNLCIuTW/UJDP87UtoxcwtIPzeXZapU7oTQ26hDspayzqoxi7hqyakvd5ladBNUZax15gYr9hRKa0z3JspzQUtFmOMIsEcethPSqf8nBEC/7fJ0Sv4I7clLF1Or7MKxXKbkaiLRAMarMSgoN0qvfHHwT7wtoMA9vlXqE2jw15Alj7aZmGFFxVAxHoEvPbPft22ZDXL7tEcKWdj38kq7NpdpI/FIzBVuzIPP7NG5WRDTmct445vkqrWhMrQE4afDN43D5y4iCfmxV22b5a+zB/a7Bw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB3953.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(39860400002)(396003)(136003)(376002)(366004)(9686003)(55016002)(26005)(66946007)(76116006)(8676002)(186003)(7696005)(5660300002)(71200400001)(33656002)(316002)(110136005)(66476007)(52536014)(478600001)(2906002)(8936002)(86362001)(54906003)(53546011)(66556008)(66446008)(6506007)(4326008)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: eRVjbgLFdLyf+xc8K2wS8QMyI+Cv0Sx7BFj8uaLM2Se1Ix6PYAc+h7JY6IjT10fQN7esVXR+GZjEn+NRVvoB763Fox33zuxTTDEpRCKLTyszu3LQK+S5XwCcteLtVRxRfHfWdZ1QjYaCcZeLB4n5so9qvPRuUR6Gys4SsRxl6Sbis7L4ShUDNh9xbePDK65G0iCY8SWC7zWYc0WwRl/iD16U2vzwf6qdXeOPwq5gVZ8oPBDGLeKVu21RPq8Vvn7RpYs/AdhhMWHZhK7rnmL1AarLWR7oLwyUEE2T75Hg8TBkPPBjVGXXI50hWcnxTvZfJhyevRtCKFy9wOMHkqSX8u3zweBVbTCuIgFcVjzvHJkJJbykqax2v0SBB7QVVDpn6UcLT3zggw2zqpBEUdmgfFfYYHIMFY43FVIiv6RrMa6ZD/ebdPnc/5yLMFgKPMFSIxUAcLfVVR+Vuo21cUGLhRF+1FQNmKTnRlsitqbnh24FC+Z83+3ZPBYcvRelYVfi
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 83b1117f-a36f-4587-416b-08d8018f07d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2020 16:08:29.5328
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /+qAWaIFCETTfy++ygm2gkrz3k14oR61Zjzb1CwfbMDBz314cO6oHb/L5E5gj7QCZwG8ZAk+C5bOuN+8u57XHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3731
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1590509298; bh=CRc56iSknUJCgLV6tyweNkJn/J+dEUnkDgcTA0rS3Yw=;
        h=X-PGP-Universal:ARC-Seal:ARC-Message-Signature:
         ARC-Authentication-Results:From:To:CC:Subject:Thread-Topic:
         Thread-Index:Date:Message-ID:References:In-Reply-To:
         Accept-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
         authentication-results:x-originating-ip:x-ms-publictraffictype:
         x-ms-office365-filtering-correlation-id:x-ms-traffictypediagnostic:
         x-microsoft-antispam-prvs:x-ms-oob-tlc-oobclassifiers:
         x-forefront-prvs:x-ms-exchange-senderadcheck:x-microsoft-antispam:
         x-microsoft-antispam-message-info:x-forefront-antispam-report:
         x-ms-exchange-antispam-messagedata:x-ms-exchange-transport-forked:
         MIME-Version:X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
         Content-Language:Content-Type:Content-Transfer-Encoding;
        b=i4MJIL71u4QiH79SoR7bl1XNNM1GxcqGmfvMUyxNcjrbBi7v7QGb3RArsTtcqU8lB
         cQjCoGuUp7xGe0ECjMmmHJGq+V9A3UPNSREkT596jBx699sdgjRvvMUy5ioFSzCE/T
         hUvfPIqSXPYcJZvaUsH8keF+j17nqWO2FnKPkgeC9CG1ZyCU7AVgKXdw4+bgaxF1RC
         T4TN9fWzpLZaRomvVHBUnYNQus52eis7PNCzb67DgMrg2d6weQkLHLraRLSSKpse06
         zhySyqxVX5wj7skHX3DH7CLqfTR/R/cPx9oJ8/cJG77tWBsIScbda75XeKqjfnWSpQ
         vNfMadHXd9dAQ==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

> -----Original Message-----
> From: linux-i2c-owner@vger.kernel.org <linux-i2c-owner@vger.kernel.org> O=
n
> Behalf Of Wolfram Sang
> Sent: Friday, May 22, 2020 8:17 AM
> To: Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>
> Cc: Ajay Gupta <ajayg@nvidia.com>; linux-i2c@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH] i2c: nvidia-gpu: Use PTR_ERR_OR_ZERO() to simplify
> code
>=20
> On Tue, May 05, 2020 at 08:22:30PM +0530, Aishwarya Ramakrishnan wrote:
> > PTR_ERR_OR_ZERO contains if(IS_ERR(...)) + PTR_ERR.
> >
> > Generated by: scripts/coccinelle/api/ptr_ret.cocci
> >
> > Signed-off-by: Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>
>=20
> Waiting for the Rev-by from Ajay (driver maintainer).
Reviewed-by: Ajay Gupta <ajayg@nvidia.com>

Thanks
Ajay
>nvpublic
>=20
> > ---
> >  drivers/i2c/busses/i2c-nvidia-gpu.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i=
2c-
> nvidia-gpu.c
> > index f5d25ce00f03..f480105000b8 100644
> > --- a/drivers/i2c/busses/i2c-nvidia-gpu.c
> > +++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
> > @@ -277,10 +277,7 @@ static int gpu_populate_client(struct gpu_i2c_dev
> *i2cd, int irq)
> >  	i2cd->gpu_ccgx_ucsi->irq =3D irq;
> >  	i2cd->gpu_ccgx_ucsi->properties =3D ccgx_props;
> >  	i2cd->ccgx_client =3D i2c_new_client_device(&i2cd->adapter, i2cd-
> >gpu_ccgx_ucsi);
> > -	if (IS_ERR(i2cd->ccgx_client))
> > -		return PTR_ERR(i2cd->ccgx_client);
> > -
> > -	return 0;
> > +	return PTR_ERR_OR_ZERO(i2cd->ccgx_client);
> >  }
> >
> >  static int gpu_i2c_probe(struct pci_dev *pdev, const struct pci_device=
_id
> *id)
> > --
> > 2.17.1
> >

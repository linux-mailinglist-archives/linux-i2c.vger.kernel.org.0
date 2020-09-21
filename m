Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6CC72732F0
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 21:36:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727840AbgIUTgO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 15:36:14 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:1616 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727197AbgIUTgO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 15:36:14 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f6900a10000>; Mon, 21 Sep 2020 12:36:01 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 19:36:13 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by HQMAIL109.nvidia.com (172.20.187.15) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Mon, 21 Sep 2020 19:36:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCtYkRz6RCXxXRvDT5sEcN9KoePg/zwFWemVmrDnxX7axWGrwTSdLO50csNhTqJuwSxyOksur6qIWvSYgw4UOOZ6iWTjM1JbGXA00eQWjfXeQ8Nq25xbXl6ceP4uPE4/gYau6isqgoN31J8ApJq/ngge9bnvl8mIhP1Ej/sh1ITYRS2MGKCOStpUsF89nlk7X9y8fBpR3e66D6KjRJyraq9WJpTZjhFFAcVmAKjkHdbu3DgeE7WkajgsrRti2G4PpLNyyLb9vLkaA0teCeV8FgfgI52+rMhT2vNqryXsXcoyw6FI45Od0i6A+hgavTINbJZ0pwLF2uIhoAfDUsKS0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KksCM8YJ2PvtFmeZQyX/rMe46AVs8yj8mwQWl7ObbVo=;
 b=JNm/XNZruTmu3+IQF7peXx+sehgCLJ6m5TMyYlJkaF5xXeeuzyEHS1WEN0t1L80yTpsj12CXE12W8dbBHsSuMU7QEbUilQBuvhwtH+Lx8Y6xtuaiLk67SJ95fFS2xDGKTPL67c3eKzxOVNlq9hNZ0p1d5lcjaIYi/vDHKqOjjn1R6AQxmgghPoYm+aBWzJDaQd068iTK052dRyns4xZl690n+tlcNPMB0PU5FUmY0bkokSco9XorJMBnWKwRyvYbwCe+bybe4vCiopqRTv76aXeDKqAwWZdZ309UJ36LBkN84CCdkgElvUERpY+sY+A7HqkMytq3MFLJ2Dwkl+fU5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BY5PR12MB3953.namprd12.prod.outlook.com (2603:10b6:a03:194::22)
 by BYAPR12MB3111.namprd12.prod.outlook.com (2603:10b6:a03:dd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Mon, 21 Sep
 2020 19:36:12 +0000
Received: from BY5PR12MB3953.namprd12.prod.outlook.com
 ([fe80::4458:4eac:63ef:5a09]) by BY5PR12MB3953.namprd12.prod.outlook.com
 ([fe80::4458:4eac:63ef:5a09%6]) with mapi id 15.20.3391.011; Mon, 21 Sep 2020
 19:36:12 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Wolfram Sang <wsa@the-dreams.de>, Ajay Gupta <ajaykuee@gmail.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: [PATCH] i2c: nvidia-gpu: use dev_info for timeout error
Thread-Topic: [PATCH] i2c: nvidia-gpu: use dev_info for timeout error
Thread-Index: AQHWkD2iyOijezq+Hk+WC+CHDhyS0KlzY/wAgAAYdBA=
Date:   Mon, 21 Sep 2020 19:36:12 +0000
Message-ID: <BY5PR12MB39533464586F1F7FD459A2FEDC3A0@BY5PR12MB3953.namprd12.prod.outlook.com>
References: <20200921173426.2636-1-ajayg@nvidia.com>
 <20200921180840.GA18032@ninjato>
In-Reply-To: <20200921180840.GA18032@ninjato>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2020-09-21T19:36:11.1546051Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=57c218e8-46d4-4f8a-932d-586f2e51cac2;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: the-dreams.de; dkim=none (message not signed)
 header.d=none;the-dreams.de; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [216.228.112.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 331b9361-e3a7-4c8c-5024-08d85e6598f2
x-ms-traffictypediagnostic: BYAPR12MB3111:
x-microsoft-antispam-prvs: <BYAPR12MB311148EDF6F19EFC095E307DDC3A0@BYAPR12MB3111.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m6iTwP23U8D2Ep5/wlOsTuf1NmiHhgkxgVYGIQoW7CTvksuQccYwDZpf2DYA0vpDL1iXWsdDU2ZvL+dHQcSpWbKhWUSXP9XgYMID2VFuUVYcT3o2e4auCJPcqPJt7IK5ivq3EwbUsCCcl0R5kH2GMd4387o9pYJBMJNWkHCn4fPs3zy4M62QwBH0APFX9hyRi74Vpzf2em27Qp1Al+hov9EMe0eyICiuvskTXtA5yA2L+qhtEcOxQ8tLRWK1rZRt7+isI04tSB/RU6mmVZnn5J0gHsd8zJIkjRA0HPd3LidrV6DkffMlk0J+cu65qy/mKdorZX9AYQbyCUGGx7Clx5Mzc50E0TkKo1Y5B84KypanmkBngDmyHcUXJqnrHUcRKS9WkTOSLSBklQspbFrM0Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB3953.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(8936002)(64756008)(8676002)(52536014)(66446008)(110136005)(66476007)(83380400001)(66556008)(71200400001)(186003)(7696005)(55016002)(9686003)(5660300002)(966005)(66946007)(76116006)(478600001)(2906002)(26005)(53546011)(4326008)(86362001)(316002)(6506007)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: Qr2BOd1bVu1t0tATnOtYX8K3tqI0ynfCzdH08sIf7y0CipcUZH9MvAJ4PtLTLeGwONxl+JlkMKJN5nwvvpon75m+m8CLfneV2b/nLjI4x87FjQyrIvqwFri2FwO/4wr7HU5eGyuFYuM2G2GRXM/3pmkaPtVZwY2BfKHgbxIH2RBihUSStLJsnXeKqdFj50PLIFytvA8Oq49HmMMAvxrYfuZegfQ7+YEPwYhmKG3J9qm5ehPlaHC6+cbzQUKMUdZCuNpyxTLPpfEgQk+oXUBuW7nPy9ZBCcb/eEF4JFIaj2GBOelEMAGdHkF3q41CLW2ZvkwcmKgzt5tuGJiQ8pTwEcdIDXwOS6j0u95tsosTHkKOPjMW9dN39rckIShaC0PoVwENoOJJ328MkdB5wDywwGLlXaEGhq5OuGIPhjcyRzjCmu/UWBVD1nSuocOGG0Hj/sJDxm4w6/TDvWxZf1MS0HaIaK5xs80HgXdHEm0j+kJQUOF3kFheWy2xDIvFJOwWC3N1lNvCVebuZSwQKSP9aTxqT8KFJW+stO+tkXpGMMPdG8caS242vV5ewGeU7sagp8ni+B5VZXgKV+wMJXLSowe6JjgQcfC7ZG+wW1yWugcsFNr0y6Dmvbcg1v9f+NGcaHxhMvso+gU420N4725/kg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3953.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 331b9361-e3a7-4c8c-5024-08d85e6598f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2020 19:36:12.1571
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UKecBlgv31rZrFZySItf5w7xBGZzxPTf8KRWgrg4wDBBnHrpArYZzfIgtuy+FkSaT0obA+DzVJWz0vKvZQRwMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3111
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600716961; bh=KksCM8YJ2PvtFmeZQyX/rMe46AVs8yj8mwQWl7ObbVo=;
        h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:From:To:
         CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
         In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
         X-MS-TNEF-Correlator:msip_labels:authentication-results:
         x-originating-ip:x-ms-publictraffictype:
         x-ms-office365-filtering-correlation-id:x-ms-traffictypediagnostic:
         x-microsoft-antispam-prvs:x-ms-oob-tlc-oobclassifiers:
         x-ms-exchange-senderadcheck:x-microsoft-antispam:
         x-microsoft-antispam-message-info:x-forefront-antispam-report:
         x-ms-exchange-antispam-messagedata:x-ms-exchange-transport-forked:
         Content-Type:Content-Transfer-Encoding:MIME-Version:
         X-MS-Exchange-CrossTenant-AuthAs:
         X-MS-Exchange-CrossTenant-AuthSource:
         X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
        b=d9TsmhaUUJpKX3zMIxkIiX6qOhpTC4Kye6yORR7KKsN6Bqp3vlSK71zqEMO23vLbd
         fjH8hfpkgWOS86fDG2x9QXo3e24b796QImqp1ADJGa/BH6gpKHKTCw2w0nvqag2Uyn
         zJyGf86YKrLcwKrbZw+hFTYVn7oh4oZFMLF8gW4+vUIvfupjaO4ElIubG3uS1cpPmT
         hg3ShwBWVJPClz8TasN7rczusahHDZDUr+RZ94BWNhJ8IBvoPQ61yB8xVdGyOsPp/a
         bDjO+Nb3pOLb/8ezH9aYSudpDV0XzT9wMr/SkSaZzvTuPLgbjzpo+gNksKwijm6+Co
         UEmyYjkZlTq5g==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

> -----Original Message-----
> From: Wolfram Sang <wsa@the-dreams.de>
> Sent: Monday, September 21, 2020 11:09 AM
> To: Ajay Gupta <ajaykuee@gmail.com>
> Cc: linux-i2c@vger.kernel.org; Ajay Gupta <ajayg@nvidia.com>
> Subject: Re: [PATCH] i2c: nvidia-gpu: use dev_info for timeout error
>=20
> On Mon, Sep 21, 2020 at 10:34:26AM -0700, Ajay Gupta wrote:
> > From: Ajay Gupta <ajayg@nvidia.com>
> >
> > Timeout error may be seen due to missing i2c client such as USB Type-C
> > UCSI controller on some NVIDIA GPU card. Currently we don't have a
> > correct way to identify these cards.
> >
> > Tools like Plymouth (splashscreen) doesn't like dev_err so changing
> > timeout status log to dev_info.
> >
> > Bug information:
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D206653
> >
> > Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
>=20
> Hmm, a KERN_INFO message saying "error" does not make much sense.
> Maybe this is an argument to simply remove the message?
Sounds good. Client driver anyways gets probe error in case of a real i2c
timeout with an existing i2c device and that can help debug.

 Thanks
>nvpublic


Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E62427DC5C
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Sep 2020 00:58:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728115AbgI2W62 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Sep 2020 18:58:28 -0400
Received: from nat-hk.nvidia.com ([203.18.50.4]:54209 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728113AbgI2W61 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 29 Sep 2020 18:58:27 -0400
Received: from HKMAIL102.nvidia.com (Not Verified[10.18.92.100]) by nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f73bc100000>; Wed, 30 Sep 2020 06:58:24 +0800
Received: from HKMAIL104.nvidia.com (10.18.16.13) by HKMAIL102.nvidia.com
 (10.18.16.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 29 Sep
 2020 22:58:23 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by HKMAIL104.nvidia.com (10.18.16.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 29 Sep 2020 22:58:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OPKgY8S6KolXw0xEEcvYpwqF3P1xanjjZoe9EzyJg0jtzxziaj3dxiaAbACL0FfAd9fWW+ADCNtCzJC9oC0bt6jXi7vAPMeLeD53mEgNTI6F+QYtLZTfJP/HHA5leoIMPRTzaOl+kM+SspLXqxWo6wMIoRcrvx3gawjGcQmAhZ2oKvV3jmOdHfGRGogisRezBc0SqoniHbpHypmPzS/+PZkMhbZZuCLB/nuRsgLlJWiRn4TYLNeDtvNgkYkYeO03fmP/28Dm02MZMtTcDKJ6CS+Ypd+MnYQ233kXszvbNinpurphTDgnAPDhph1elmX1AyMY6rqxyjcfA1gcr73Ucg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Ul8+kwyIkBI1t+z+Z5mIbBeCQTvrkvzXf43TE30X24=;
 b=TQNudV2LU2Ok6mxrUGHm/IWq3LXqxvyqPzR1CqrIY3KPmzvwc7Vl532OuoR1sLRukFmuieobFUL8Wr1qW16W9kL+uFsOH1Ek5y06mCXbGRuMVD+uj8SIXVuUOdU97Rz03SF3GdD5ZLqpCb98e+6JfdV9J8MNnRBlFIQ2SKEqsTC+PB9fW4lsWJ74/v8SmZhvk8xgBLFlZNRYHZM0LTBU0fwXV8PBu0WMzGlAjbivd4TW3A9j4kHvqKYfLU2ves/6Gp4bTINmvy76Du0/uSFo5UigO5og+FwVSFzXvfPsU7YSN2tFV/lZPhhfqiE/wkPwe4zxcDzE9SPazZFclNIlrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from MN2PR12MB3616.namprd12.prod.outlook.com (2603:10b6:208:cc::25)
 by MN2PR12MB3646.namprd12.prod.outlook.com (2603:10b6:208:c5::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.25; Tue, 29 Sep
 2020 22:58:21 +0000
Received: from MN2PR12MB3616.namprd12.prod.outlook.com
 ([fe80::89a:e4ad:708f:363f]) by MN2PR12MB3616.namprd12.prod.outlook.com
 ([fe80::89a:e4ad:708f:363f%5]) with mapi id 15.20.3433.032; Tue, 29 Sep 2020
 22:58:21 +0000
From:   Khalil Blaiech <kblaiech@nvidia.com>
To:     Wolfram Sang <wsa@kernel.org>
CC:     Rob Herring <robh@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Khalil Blaiech <kblaiech@mellanox.com>,
        "Vadim Pasternak" <vadimp@mellanox.com>
Subject: RE: [PATCH v11 2/2] dt-bindings: i2c: I2C binding for Mellanox
 BlueField SoC
Thread-Topic: [PATCH v11 2/2] dt-bindings: i2c: I2C binding for Mellanox
 BlueField SoC
Thread-Index: AQHWkTK/DlIv7U4D/U6XMiw1r8e8/ql8icoAgAO4cnA=
Date:   Tue, 29 Sep 2020 22:58:21 +0000
Message-ID: <MN2PR12MB361651014BE6D69C6792A805AB320@MN2PR12MB3616.namprd12.prod.outlook.com>
References: <cover.1600804577.git.kblaiech@mellanox.com>
 <cce96d20e0bb258ad84c6ed52c49b957f0fa3452.1600804577.git.kblaiech@mellanox.com>
 <20200927135710.GD7298@kunai>
In-Reply-To: <20200927135710.GD7298@kunai>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [173.48.75.27]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ffcea54-d419-4b61-f607-08d864cb29a1
x-ms-traffictypediagnostic: MN2PR12MB3646:
x-microsoft-antispam-prvs: <MN2PR12MB364652D4F0C6FEF5D03B2622AB320@MN2PR12MB3646.namprd12.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v8jGmULJqK19ZzWlMl0cWw34jqnRUeq2IWvbNiYG+4OAhagohdq2KIM3exjlcZvIGvy57tq2TBx7V6wwTYQ1H+lTzwYtoWh9iRe4pd5cSiDTzl/g2zOOsCZ154O1RGGgNXTx1I85GL0X010H5ZTfAu1qtOhzyQ7TqeZ6Xuyod8/MjcpFrbJgsWu8YlAmG66+CaN2Wc4w1tp8L0uK4DgJ3MO52TPoXy0bz6z37ACci2VHp3TYehaXa4srIXC1qDTobfOx6Mtqml2zv8YNL3q63refirwwG5gU/FZIguA5YRBpw/WAJxpnB0g4RRK2k4O357rZmJGGKRt4X0E/kF1GxirpKVUI9YDxV51Y/HIP67wbIC/jUMRxQ299qFa3n57t
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3616.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(54906003)(8676002)(71200400001)(83380400001)(55016002)(9686003)(66946007)(66446008)(52536014)(2906002)(64756008)(5660300002)(66556008)(107886003)(6916009)(76116006)(186003)(316002)(7696005)(8936002)(33656002)(26005)(86362001)(4326008)(478600001)(66476007)(6506007)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: ovIhI4StxgEUl2zdiGl0T70FWu1wlFXoc/GDxsk9uyP4At6ZqqHcNnULGgjrIQ3gRDjpZYGJDMQNPHHOVRj2kgATezd7e560ImTu3UOZRkrN0bd8nXPfLwuxQLhWnhYzL8tNtacNldyXIKPXpQfNr2rrEiyaQN29tz7cnFKwZuEASDNKcTpP4d+RSXszWBPhkbkumFvuBlz6ble/hwa09lmxnbujwm9RWIh98C0zxojeHvkwFLD5bJPAcK0G5162i+Y6zof6kjkdAUpmffjtNxmLZuHUut0N5X0AMvNlfjz2O9Tv9PPMqa55qL49SPX1yd8Ro53DTI5gnTs/XfQCV4em1GGZJ3VnT52rkTNycqWtsx18ij3XfPu0H9Min6qwWFDTOY//6fHkvXmahbFiOMXejDQRCTzLOAjpTZbXTMqUrY+X9PChuOwB/IlGPt9SzVjQ6KwfAk36wJwQW1cRsUVG/dUhWg1hui5ga5BfJrMTON3bzXQhekzzsVHgKdkejGjmdpaivVoz/agYtr4qSuVZHppohymkC4DXAS7RMIJnQwk8mf693Uva4r/UF5QjfaBUUSVyYtu3scCSH1UrdiO2ZJTzIEtSmZhxWBaCOaYy9RtaOPRFjXx2Qi3diI2ihXVjMqb0RlO+2yOa2lutKg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3616.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ffcea54-d419-4b61-f607-08d864cb29a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2020 22:58:21.1164
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vIHpK3EnXIchyzGc69JvzGuoULXhu7x5p6EWISW6xsawYzoYG8uD9k/JWmRoQdX+59rJVt3YDQkmf4gewr+paA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3646
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1601420304; bh=6Ul8+kwyIkBI1t+z+Z5mIbBeCQTvrkvzXf43TE30X24=;
        h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:From:To:
         CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
         In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
         X-MS-TNEF-Correlator:authentication-results:x-originating-ip:
         x-ms-publictraffictype:x-ms-office365-filtering-correlation-id:
         x-ms-traffictypediagnostic:x-microsoft-antispam-prvs:
         x-ms-exchange-transport-forked:x-ms-oob-tlc-oobclassifiers:
         x-ms-exchange-senderadcheck:x-microsoft-antispam:
         x-microsoft-antispam-message-info:x-forefront-antispam-report:
         x-ms-exchange-antispam-messagedata:Content-Type:
         Content-Transfer-Encoding:MIME-Version:
         X-MS-Exchange-CrossTenant-AuthAs:
         X-MS-Exchange-CrossTenant-AuthSource:
         X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
        b=TyaFeRT9nlygdR2PjF1rPdtvbzzkE5cVsjAyuoynKjdRIoXDQGNh5J/GzdlBuVpzV
         w9eDZBW/sZ0CtvUQ4O2VsavqKvqO6CfJ6U3ZRhIegya7DVt1p0+//4OYbqO76bdT3Z
         IxtxbknCx48xdi2GTUy+1ZQZs98og11+K/B90UFvZ5SslWg4g+ohSbUZeq2YXrBlV4
         7UxauHLqA9fr9cJ1G4xAFw18uceSIUe+kPZsSj1M76A1WRrIPJW78inN1Jwu23sMdO
         z4pxILfArUiYXEEGCXO3zNM5WeG9pGGAX0iCadu7zc3LA+LVBaO7jguZKkqYg4bQiN
         J97DIDsOd8I+g==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


> -----Original Message-----
> From: Wolfram Sang <wsa@kernel.org>
> Sent: Sunday, September 27, 2020 9:57 AM
> To: Khalil Blaiech <kblaiech@nvidia.com>
> Cc: Rob Herring <robh@kernel.org>; linux-i2c@vger.kernel.org; Khalil Blai=
ech
> <kblaiech@mellanox.com>; Vadim Pasternak <vadimp@mellanox.com>
> Subject: Re: [PATCH v11 2/2] dt-bindings: i2c: I2C binding for Mellanox
> BlueField SoC
>=20
> On Tue, Sep 22, 2020 at 06:49:38PM -0400, Khalil Blaiech wrote:
> > From: Khalil Blaiech <kblaiech@mellanox.com>
> >
> > Add device tree bindings documentation for Mellanox BlueField
> > I2C SMBus controller.
> >
> > Signed-off-by: Khalil Blaiech <kblaiech@mellanox.com>
>=20
> Applied to for-next, thanks!

Again, thank you very much.

>=20
> A first incremental improvement could be converting this file to the
> YAML format. And add the new file to your MAINTAINERS entry.

Will do.

Our driver supports both ACPI and devicetree. However, the platform
firmware running on our platform implements ACPI and doesn't
really rely on devicetree. Do you think we should keep the devicetree
support? Or should I get rid of it before we apply the patch?

Your feedback is much appreciated.

>=20
> All that aside, thank you for your patience and for keeping at it!

Thanks.


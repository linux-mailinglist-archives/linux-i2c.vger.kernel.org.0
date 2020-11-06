Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7952A97F8
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Nov 2020 15:56:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727263AbgKFO4y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Nov 2020 09:56:54 -0500
Received: from nat-hk.nvidia.com ([203.18.50.4]:14763 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726422AbgKFO4x (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 6 Nov 2020 09:56:53 -0500
Received: from HKMAIL101.nvidia.com (Not Verified[10.18.92.77]) by nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fa564330000>; Fri, 06 Nov 2020 22:56:51 +0800
Received: from HKMAIL101.nvidia.com (10.18.16.10) by HKMAIL101.nvidia.com
 (10.18.16.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov
 2020 14:56:51 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by HKMAIL101.nvidia.com (10.18.16.10) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Fri, 6 Nov 2020 14:56:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gxv/kVZkJW3meoK9usnjqxhBGq/pO/E5F9zQyJKFGcLegvXMLXj6/HDs6vdlC3MtFOotRF7nmql6UuwX9nS4ZgKSbBmUX7eJ7u/DzQzedZHEUGIZz3FxKGzlPqVLUMuM9TLRezz4tJLqNyMLLBA6ZyePwWkOgsuoVVWy76+5SccakRqEwjRBLn/63gbvL1Eo5AWWhDiWepYnuHZztpSSQbVA+ufM4SSxjZIsGqnXioyWbgfUHVl3Ciou/64ZJMn0bISN/BHqv7MbaUYJboSGtzV3W5H61IzTm9bKaX04pvaS91eX6tvV9Y9gICAnwSo1+JPbNog55AeaAf83Z53dHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCQxw2gAk8oNjDH2/xNSCUn7Ehp3m7nz0h7vGRRqeqA=;
 b=aCdnHeocSIytFYl6Y7aYtWMhXgLZTuD4ikpAxVzPDlnZnwGs6jHW4GjJ9BFV51nnRaFskS1mUGqDeY7Z4g4kpZeJpOkMsre/f1lx0LjtJLNQeGVTaIWTRxS39kipSkWi34JN07CLT5QhYQGLGftThEIBrTmrQby1vupIGEjUaG8nfSm3m7EE10zBCyzbwn3sq2TP/bJrtDKHBDzN7GOtJ50JCIFFxlFW+2Iv/UMUChXz/umAwFXwiIJWg54asCrmAfGoOex8sQus6XgPlfKgu/8Nwtb0/Lzvh1KCdAETHizwT7hYAWY5OS7stB0VCxQGcXAnSlV50WZx1NwFl96rCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from MN2PR12MB3616.namprd12.prod.outlook.com (2603:10b6:208:cc::25)
 by MN2PR12MB3021.namprd12.prod.outlook.com (2603:10b6:208:c2::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 6 Nov
 2020 14:56:48 +0000
Received: from MN2PR12MB3616.namprd12.prod.outlook.com
 ([fe80::89a:e4ad:708f:363f]) by MN2PR12MB3616.namprd12.prod.outlook.com
 ([fe80::89a:e4ad:708f:363f%5]) with mapi id 15.20.3499.032; Fri, 6 Nov 2020
 14:56:48 +0000
From:   Khalil Blaiech <kblaiech@nvidia.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH i2c-next v2 6/6] dt-bindings: i2c: Convert DT file to YAML
 schema
Thread-Topic: [PATCH i2c-next v2 6/6] dt-bindings: i2c: Convert DT file to
 YAML schema
Thread-Index: AQHWshttx8StFjJLf0+yuj2kGuzED6m3SMiAgACz8tCAAzhcAIAAAGUA
Date:   Fri, 6 Nov 2020 14:56:48 +0000
Message-ID: <MN2PR12MB3616DA227BF0261DC47BC5C2ABED0@MN2PR12MB3616.namprd12.prod.outlook.com>
References: <cover.1604432921.git.kblaiech@nvidia.com>
 <c81a0679413dd77e68bdf7e3023d1a54e62f26ea.1604432921.git.kblaiech@nvidia.com>
 <CAL_JsqLC5nzPmNK41s3fB6nnRqjC3DXPfYn1uqdytrEKqFBpXQ@mail.gmail.com>
 <MN2PR12MB3616B19658725BC33D61FBF3ABEF0@MN2PR12MB3616.namprd12.prod.outlook.com>
 <20201106145356.GG1059@kunai>
In-Reply-To: <20201106145356.GG1059@kunai>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=nvidia.com;
x-originating-ip: [173.48.75.27]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 99ea8413-0083-45d5-ddd5-08d882642fcf
x-ms-traffictypediagnostic: MN2PR12MB3021:
x-microsoft-antispam-prvs: <MN2PR12MB3021BB8248F6BAD34DADAD51ABED0@MN2PR12MB3021.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I8OfCWwFi+H0k3MYOupP6cksjrqd9p2fFhw0uoFLETx/6Zr4dZhmzFmAkESKzlo4IPKR8YzD1uc2vUnhjPtDtrXIXGuEkIL/lLuZ5a7kN/Jlu2p6mHUVo1QHWJ52oi2O24EXsWNAYlLTVZmnc3EhhfDQ8BFZHcecxRdA9Ek2EDmrqfOSSIpaqvXmfv9dJe6mIhiQDFoO+3xfJJfyvFboUiaOQlyTnMFwW3tdke9mOlZOPlDJJBAOH9OquYCHWhfcLfEKvwKDxDcJ0YTn00IWEHQLIb5sInGGelhT+qPfAKT8nQnTtuK2adfSq4k//tE0Q3jYuyIP+WlNyro0w7Q/Eg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3616.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(396003)(376002)(366004)(54906003)(2906002)(4326008)(76116006)(71200400001)(186003)(316002)(8936002)(52536014)(6506007)(66476007)(558084003)(26005)(8676002)(33656002)(7696005)(86362001)(66556008)(66946007)(66446008)(9686003)(64756008)(5660300002)(55016002)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: orDASraFP0QWfp+Dx0QhSv53XEMvknF0Thdl48lqn4sdujT9l5d2PuZ5PDJXZ41THA/26srBZZzDrlkSFLjILpf5AN+pJmHKFHW2HETPjhpCZ7/eY7JcuCB6TwsbI8rATUFdBZ0vVAtigbI/u/VD7dsjQVHwcPAczCIvrzZZ1EeceOQT6bWlg7xccXQXULhWS6sZeGq6wGLU4YpLFum3NQYfov84ltrGGKIon03r7+rRdIyxSJGHPwEzH4aJJz8QJDFO9VFxEJIFlPgk70lRK8i/R6ReC5hE61JFCrL28sLGg+43TieEbNpm4e4lFAh5TVUYUppf8kDhTbeTRQbN6srKUdtje1GywzGKjXWPlN2smTNnh2WnRY57uj4FoG5goxE9lmcvAaiYgCgAeBSpHXAAx4EWE9PdtqJ8QJu3xT6rSUzNDYTQ3gF71KJ6S7BURASh8CCjb0DNxILBi0lFiL8fObhFCFovnnmKTOTKoturrrONXwHu5hB98i+VmZ4ZbKgL/Ss0uc+kpi6yy965aWdjVXumvKRhLJUF0mip9HqGR5kG8rLovkhezCR/1qtNHNzuvknpYFMYZejB+DOFIq8iP5b0csj5NpNMouAldHEzPErRTA21cCJi0te3NGWHPhSyYCjfqxSi3puZWL+ZZQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3616.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99ea8413-0083-45d5-ddd5-08d882642fcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2020 14:56:48.2578
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xeopbi736YnKf9r4DZiam+OubeAKbviwX+ld5+ZpIgTjiUjW40zQqo901zI61MHz0c9jnAT4Q9frgAz1cjfQiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3021
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1604674611; bh=JCQxw2gAk8oNjDH2/xNSCUn7Ehp3m7nz0h7vGRRqeqA=;
        h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:From:To:
         CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
         In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
         X-MS-TNEF-Correlator:authentication-results:x-originating-ip:
         x-ms-publictraffictype:x-ms-office365-filtering-correlation-id:
         x-ms-traffictypediagnostic:x-microsoft-antispam-prvs:
         x-ms-oob-tlc-oobclassifiers:x-ms-exchange-senderadcheck:
         x-microsoft-antispam:x-microsoft-antispam-message-info:
         x-forefront-antispam-report:x-ms-exchange-antispam-messagedata:
         x-ms-exchange-transport-forked:Content-Type:
         Content-Transfer-Encoding:MIME-Version:
         X-MS-Exchange-CrossTenant-AuthAs:
         X-MS-Exchange-CrossTenant-AuthSource:
         X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
        b=M731q14a9huRp92T2OFqLSieWdi3aYmzDr2GhUO2xMzztLeBJYM6Mxox/FTyhEhPY
         SU1ngJYdYshDylPFVZDJGrckWbTEwyUb2yjAjl1qEeM5VFyDfEORvZ7HmVzYksYgfB
         QvYCW1aEBUADsbqgmLMnQpqMdC3pReCPooEcaHkegsuEblXoIgHvhhcM3CFDr9YzM8
         Z8jRRCvl3AtHOMoZjjKElCHbxiD1gMZ78QvdIRCcs+Rl5axy6aj7Lmz1L8HAbBBU+5
         197NUlA3g89hozVSTWO6AMTIJOAIiQkVdXpQQPLY4Q0xiAph84IZJkQiPfR6RRzVLF
         bQi/kNKG6/1Rg==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> > > Please fix the subject as I asked in v1.
> >
> > Will do. Very sorry about that.
>=20
> Waiting for the resend of just this patch. The other ones are already
> applied.

Thank you very much, Wolfram.
Sure. I 'll resend the patch a bit later today.

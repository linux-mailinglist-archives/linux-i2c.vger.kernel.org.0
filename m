Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 642AD2AC7A9
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Nov 2020 22:53:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbgKIVxg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Nov 2020 16:53:36 -0500
Received: from nat-hk.nvidia.com ([203.18.50.4]:45871 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729247AbgKIVxg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 9 Nov 2020 16:53:36 -0500
Received: from HKMAIL102.nvidia.com (Not Verified[10.18.92.77]) by nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fa9ba5e0000>; Tue, 10 Nov 2020 05:53:34 +0800
Received: from HKMAIL102.nvidia.com (10.18.16.11) by HKMAIL102.nvidia.com
 (10.18.16.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Nov
 2020 21:53:34 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by HKMAIL102.nvidia.com (10.18.16.11) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Mon, 9 Nov 2020 21:53:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lud5JgtrsGleJeqS8Jrg/Xkh6+cjTHht/1QwjuFFzGchh7mk4p94cG0K+V8LWk21cfMGyn+ui1+D8zTla0e1dkSetoGOheNQH2JN04MZyobmaCWDhxeHSW3qbm7sgPSkGtKtVZFsgckyzIz8fsQ4GDbDedNnj8Rj4j4Db3I9Xcqaqr/or/GDtCtPEDW5X6XZYONFXpBuB2jmckhWHuXiTlhTG1TUoZBXGUa+MuJbPehEfRO8cGiW4leG15OhkYXPptc7iyWingnRqQEWUEQdIR9iMqVQ6OnWmRODq+S+tEzT2+/XuQpMqxU++3BLWXSqmsYwmF3dfB/tGwlwYqSzRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bcdszc4186mMt2FCuwdgIJ6boCp8kYYbm8yJd/J1GXA=;
 b=QLkbB/Rn4pg9SqcvyZE5J/fR8zCYKG8EmGehqXCjJ/6mzmamG06PJcOnhYGxYhxlu8gXW/hf7i8pvl236XBzlsFFArC+NHyinGOQEjkInEOOMFenChambltdyx0/sV60SXZlUz1WwCVjcmG/GNt/B3yQxAiopi8eW0/2vvJQGYymEm2oE1b4qeTWMhyki1bpSPT2BtHrr5KSkFsUu/EH07Bej9elBlREsd44WiUhIVS0UAObMF+qkQwEhnxKCWjBUTz7yWkVFhUl13iZsF3IInECgtMN8swhtRK3P7AjjdGDV5KgL81sTK0dELy1PGCGYZaZVjgCmWVZLpSgGAcO4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from MN2PR12MB3616.namprd12.prod.outlook.com (2603:10b6:208:cc::25)
 by MN2PR12MB3165.namprd12.prod.outlook.com (2603:10b6:208:ac::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Mon, 9 Nov
 2020 21:53:31 +0000
Received: from MN2PR12MB3616.namprd12.prod.outlook.com
 ([fe80::89a:e4ad:708f:363f]) by MN2PR12MB3616.namprd12.prod.outlook.com
 ([fe80::89a:e4ad:708f:363f%5]) with mapi id 15.20.3499.032; Mon, 9 Nov 2020
 21:53:31 +0000
From:   Khalil Blaiech <kblaiech@nvidia.com>
To:     Rob Herring <robh@kernel.org>
CC:     "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: [PATCH i2c-next v3 6/6] dt-bindings: i2c: mellanox,i2c-mlxbf:
 convert txt to YAML schema
Thread-Topic: [PATCH i2c-next v3 6/6] dt-bindings: i2c: mellanox,i2c-mlxbf:
 convert txt to YAML schema
Thread-Index: AQHWtF8vQCTRNJX3fEugLWyWCcnZzqnAXCaAgAAAURA=
Date:   Mon, 9 Nov 2020 21:53:31 +0000
Message-ID: <MN2PR12MB36163881FE16F23E892F573DABEA0@MN2PR12MB3616.namprd12.prod.outlook.com>
References: <cover.1604681934.git.kblaiech@nvidia.com>
 <3892893f87791fbf0e5e0d890fcbec7ba43106ef.1604681934.git.kblaiech@nvidia.com>
 <20201109215115.GA1818880@bogus>
In-Reply-To: <20201109215115.GA1818880@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [108.20.133.69]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4823a15d-2e92-451c-73de-08d884f9e623
x-ms-traffictypediagnostic: MN2PR12MB3165:
x-microsoft-antispam-prvs: <MN2PR12MB31653F5DC78ECE254AEA2AE7ABEA0@MN2PR12MB3165.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YK69aDpfbJ/gM5E8rPBODWbQqDdN2M6m7og2o/oJdf4q7YrqxPJ9BHzPUh0BIDpk8v+vigGgXqKkdAl09ov94G4qtMz78BGVhC780lR7dCIMwaHrpz5a8OuAxwGWakvM+50SV54QXM5i5Xh3Nx1sml0Tw3L+xdjZ1Pb9zqWEa3gYGH1vSliWxLwawW9OKQASrbnMCOATWk2W5GezRI9mOE57N3+P0TOD3Ui1tRHLDsnCNGBKi9/EPOvsPx/iij1FCjM/3NJ/5Wv+3NMDQXj3wgy+Qn8XRdbgkpaIQuoZebX493EFAQmtkGU+TKRpt3m3Nc76PxMbQg+2WxmQPiQIxQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3616.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(7696005)(478600001)(2906002)(8936002)(83380400001)(4744005)(6506007)(9686003)(71200400001)(66446008)(66476007)(33656002)(316002)(4326008)(6916009)(66556008)(64756008)(76116006)(55016002)(186003)(54906003)(26005)(8676002)(52536014)(86362001)(66946007)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: yjS6MXTRLmgIiLpa6lRu3OqgxHrIltOugd4LmXei5mwCNZLaQuE7n/XJHhecF3bTiZ/tNyPmrlJFs7qNC3zLE5OMvYvPVNF1FSQ3wXO2Zm6SuNAqcQSaOEqRlxiQqh8dVXSUJj3R8u1zXbL/XeULpxkNWkEXfs4gEgmA+TlFZA70wB1PvJUPwXxs3ciNjJBREbC8//Px6ISlSdLmUVDYpVVa1lfQ8T/WTCvM8paiF99r8sShrk3m8iL9KmzLCby8PJRxg69A7ynkdgBA90YM+RGwH9gwXo20EUpVFPJV8H2ggxeIjoJ78AeBnqQ9mLZzxyVFHnhJbyf8PPnsA/Fyc2pCZdIZcjUsJWpHEhtgqUoMlp8frD0yQh1UGipV7+6KIfsOFw1/8sEpZo0r2JoEeht8t8WMFCexJtWRY5oMZEOu0CDiql2gXKqZvAh/9mEjTi+lf5kKUKVlswZzq5sgjkUmUSW8xLfjbnafYUd1EVjk5e4N+wup83qFWyGLAEV76bLaMyqFzwZuQpL+NmO4nFYrVJaI6PTJLcszvg1fn8fun35ioCBUlYJbSigubNP2I+44z3TAWCdp9yOo0PhG92Vdp73GovAVAn7Eym8kz14qmvCdwJ8VXZwzfVSkgi43VN8RtNIC6YpkarbGNM3Lsw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3616.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4823a15d-2e92-451c-73de-08d884f9e623
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2020 21:53:31.2793
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xek0mOFwqTR/HiGPaa9XInO8vIRJAXMXygHlAZlw5497gbxSTP17MIm0yIzHIAOrLvCSAbDpF+Sy3EnkYtTaOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3165
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1604958814; bh=Bcdszc4186mMt2FCuwdgIJ6boCp8kYYbm8yJd/J1GXA=;
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
        b=mH+z+pV2Q1BDK6y8nIOwqjhFhYw4nOyuSMacK6ElouLtZumZyPr7u52xrJGWt0X4s
         SDgmSEY246N3zDUjb1QGtsZKdEuW3fYxcNFVOq5qE2URZcSE7TMq3V4G9i7o9f1LqS
         z35woWHSqyssKSG1wSCV0R/Q0622Fb9jF9zCVkB3jE2e/JTGaFfNb75H2PrZuG2HLo
         BRCbF8cj+w4XYQtJlImHPHTRw9OysR+hJfDm2Q3zXLBNcQimoiDPB1OPiE4q53rBM1
         Ox5VqEHc/Eb+CHG3UsMmY7Jrwt34O4QxObwJ4jIhOdGzneRMT4yED8wAKKfi1h8nuY
         71tHPA+lhxtvQ==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



>=20
> On Fri, 06 Nov 2020 12:06:30 -0500, Khalil Blaiech wrote:
> > Write the devicetree binding text file associated with
> > the Mellanox BlueField I2C controller in schema file,
> > JSON compatible subset of YAML. Besides, add an entry
> > within MAINTAINERS file.
> >
> > Signed-off-by: Khalil Blaiech <kblaiech@nvidia.com>
> > ---
> >  .../devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt | 42 ------------
> >  .../bindings/i2c/mellanox,i2c-mlxbf.yaml           | 78
> ++++++++++++++++++++++
> >  MAINTAINERS                                        |  1 +
> >  3 files changed, 79 insertions(+), 42 deletions(-)
> >  delete mode 100644
> Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
> >  create mode 100644
> Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml
> >
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>

Rob, thank you for having taken the time to review the changes.

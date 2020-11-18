Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00F602B7FAD
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Nov 2020 15:46:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726743AbgKROp3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Nov 2020 09:45:29 -0500
Received: from nat-hk.nvidia.com ([203.18.50.4]:29214 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726306AbgKROp2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 18 Nov 2020 09:45:28 -0500
Received: from HKMAIL103.nvidia.com (Not Verified[10.18.92.77]) by nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fb533860000>; Wed, 18 Nov 2020 22:45:26 +0800
Received: from HKMAIL102.nvidia.com (10.18.16.11) by HKMAIL103.nvidia.com
 (10.18.16.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Nov
 2020 14:45:26 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by HKMAIL102.nvidia.com (10.18.16.11) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Wed, 18 Nov 2020 14:45:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e4edJAr6q94XjZMqbWbYKlF+gIBQgVweyP9Y72j3e0T2nr+fTZd6OX42FxyzL1b1L5k2WKrXWizSyr+dKfXBUBeRD5m5eU/e6qpf6+Y0Q+ovGQkw4KoLSyJILUo0H0wfw5rFo35dV+5HdvuAsHH4iRBWtxEfQZgpRc1lXuGGoUk7Z2x85vzOP8qldqMgnPBafxS/xPwLu+QgmPtWug3XEwBsXs8qAa5GKkUpcbcRupDH9i3UOrfeQpzQ2rEo+9QXkGgW5XFTCtur7qfrDaQ9I5NvXS1mOJTex9FQDOdhsJ9xUpfv6CrzXGQ8pJgV+LqYE+2BzgxDUlAcVif4nyuLiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xRAkGNsyaQ0M+aRhqEkP0YsuDFKRwoMxde/zVkygfP0=;
 b=IsWlGKcxIuRtTjpRfqHsrsaVbUk0K/pB9uiozabDq9e5IEbS0mXEGP16t0wEAd0EyiKoDdavW+5rZL8he4g3hrA/vOB2U6JaekyiovkXRiQwTOpStI+MoIoaECro9fCg46SfiLod8MRzbMf6niHEQQgykG1XglX0dw+X8BrkgzEFTLJc1K7XJ0z9qCvRzmAznXuqM8uaMkLMERmyj80OqOhdLz3RYc05SAvog3aNB7Ek720jhybHXCUrG7WVvwmbP5/eUZOT1y8BwZW2rlbcgN6nAiRMfBccyCNUer6mVtgHrg/khZSWuTGdb3bXHicb/PiERMW6t0LHgFLKIkROUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3898.namprd12.prod.outlook.com (2603:10b6:5:1c6::18)
 by DM5PR12MB1531.namprd12.prod.outlook.com (2603:10b6:4:f::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.25; Wed, 18 Nov 2020 14:45:24 +0000
Received: from DM6PR12MB3898.namprd12.prod.outlook.com
 ([fe80::80c1:3479:15b6:a7a2]) by DM6PR12MB3898.namprd12.prod.outlook.com
 ([fe80::80c1:3479:15b6:a7a2%6]) with mapi id 15.20.3589.021; Wed, 18 Nov 2020
 14:45:24 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: [Re-send: PATCH i2c-next 0/6] i2c: mux: mlxcpld: Extend driver
 functionality and update licenses
Thread-Topic: [Re-send: PATCH i2c-next 0/6] i2c: mux: mlxcpld: Extend driver
 functionality and update licenses
Thread-Index: AQHWvbG9cTwqDcwd0k252CUGfhL2y6nN9jeAgAABH2A=
Date:   Wed, 18 Nov 2020 14:45:24 +0000
Message-ID: <DM6PR12MB3898736C1CE034080EE9FC2FAFE10@DM6PR12MB3898.namprd12.prod.outlook.com>
References: <20201118134957.182779-1-vadimp@nvidia.com>
 <20201118144047.GA2649@kunai>
In-Reply-To: <20201118144047.GA2649@kunai>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: the-dreams.de; dkim=none (message not signed)
 header.d=none;the-dreams.de; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [46.117.168.42]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ac600c4-b32c-4e6d-8887-08d88bd0953b
x-ms-traffictypediagnostic: DM5PR12MB1531:
x-microsoft-antispam-prvs: <DM5PR12MB1531E76BE27E1F55668B4AF0AFE10@DM5PR12MB1531.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hl6ctHdL29+oDgbbYBBy6Djgi0inf7BJAfJ3qemhCV8NWCnbCB72k9eBQiWk79ios2QbirKA8kShnZbLdR+klDvk5h3PgYBAXp3oNfK9Zbkpb3DZS4FRkRZKHQrPdA5sWL6JvuWZ28Vhx/haLrGRsftflza12gwhSI0R1MRRyzgQ9HP+XdSZrgg+nyKs4oqKxAMlw3xeibRia4slGwN6121GROqAmddeVKgD+25pYMcsVuEektF/FDZ+pVLbf8C5S+aoA9DcmRF0GlWfTDkDXf+OnqRUqRPIUjbLL4PFL8HkBoJ23WIKq0gv916FtZtU7YggFtjdvfacyMgwZgYwOrATyeVqAbp2xplAz8s0xUcrVjHr+IWW7JyJ5b3+Co8f
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3898.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(376002)(366004)(346002)(186003)(83380400001)(15650500001)(5660300002)(8676002)(86362001)(71200400001)(33656002)(64756008)(76116006)(55016002)(9686003)(66946007)(316002)(66476007)(478600001)(66556008)(66446008)(6916009)(7696005)(26005)(52536014)(2906002)(6506007)(8936002)(4744005)(53546011)(4326008)(133343001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 0/4Z6FMxGVXEbp3nD5wOe+zFyrzld2cvTR4YOMF78ce4gmedg7Incew/48vtwV4rkZ7sE88UsHKfTymDUFxFsB1yX2Dr207xISp9GpdgAJyaO46C9dKEbAOyEnlRgP0OjyE2gNDeMpbez59ffhVabuwmGt2AEDFLz9ZYcgWL3TWJ2llwweUc8g+MyKSy358fU3SaThMkOsve6zyj+5D3G4A7PCHRxxTy1Z4wEWlTeKPKbbpXWIEiLySoH7p4QZhEHd5npHnqTZlMojwgEhgaoMhHcen1fArDqrqHkGwv24n3500GJVKDQvckJMDc1LwNxCoCixbTI/Lj1tKq5irERv0P7bN7+znVBsm2/cj5QZR2dknPZaFQt9doPbC21KYlcc8E+vmf1ax7TTUoXopvGEfiarbu8jhp3va8qCrllghv68m49cKvVmwa6TtL5tr6pO2vLmsfOJWjIl0qUiOoNUl+JrMY0aAJSEqedV+BJbMv9Mm7c1RXGE4JMZP2wyLXa2DSwBeoaOa4jqkVnesefV2X2FqLA79frXHQdgZ7HayDSUm9m8ue7uhGiHeFzI5kLN5KiuFTlNIlalllu68EbCTMYzdIfFj3yz9q09bSPSkKMZwx4rVe95ENAZ1LfrmykiEIU+3nMAXZYyTzycitWctXMTPXtP5/mRDTLkfh/X+RJXMEwu2zMd8MHs+Bz4bZYqQVvwtGtbDThpJ8u3GUdtdDlk2ZCAamrvnYcpgsKPh4lYl1Jvctt881JnekQ6fGMCwVd0KEpY5OJUu2RNvXcRtwY0/kzWUMI6LV+viaE7bbijJ/LZD8qHsC5+OlsHNci1bGx9cRqYtdMoGLz/sUMfQY7gP5+gk+R/xmf3lhuMPZK7ZDaSGij1Vr6Uwso7LR0hsOvRCScupir/GwQQrE/A==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3898.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ac600c4-b32c-4e6d-8887-08d88bd0953b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2020 14:45:24.5220
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yw7FpOwp/or6iLXqBgaQgPgJRic/W5EMVUm+8fEDHZp8815qmnPaiZQSncEhbugvGfgpg7ZPNbs6KwXy596VMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1531
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1605710726; bh=xRAkGNsyaQ0M+aRhqEkP0YsuDFKRwoMxde/zVkygfP0=;
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
        b=OhxzztvjReuEYgdsUh4p89WH2CH63DEND/+qeuycvhu6yDcE4SUbmP6VfGwopjvCx
         Iq7NINf9bUnXWz4gN+U5QZnOHEB1pmTMdSKTWkYOa8GTmSoHq+iG0N16Fzo/CNYXhR
         MuYeh1Um5UGaEV7YqFgV0l0F2uDunxp0f7Bom/9suP5b85mpRqrchA7th5gbGshJMj
         q1lzZwnd3DlG18nuyc13cCefFUoL44IeVyvOL1hd/pKPx05rq/41JgFmz6D5uCEUh2
         tqHLVsK6YcLeQxGDoN5TkSaKDebGEgejo9VeSrKnCL6eM9NNYHNgtxBqPQV4KC4cUY
         srGhjbcG2q4ig==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> -----Original Message-----
> From: Wolfram Sang <wsa@the-dreams.de>
> Sent: Wednesday, November 18, 2020 4:41 PM
> To: Vadim Pasternak <vadimp@nvidia.com>
> Cc: linux-i2c@vger.kernel.org
> Subject: Re: [Re-send: PATCH i2c-next 0/6] i2c: mux: mlxcpld: Extend driv=
er
> functionality and update licenses
>=20
> On Wed, Nov 18, 2020 at 03:49:51PM +0200, Vadim Pasternak wrote:
> > The patchset adds new features for the existing Mellanox systems.
>=20
> Please CC the i2c-mux maintainer, too.

Sorry, I resent it, added Peter.


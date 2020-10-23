Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E450296DFE
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Oct 2020 13:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S463230AbgJWLzl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Oct 2020 07:55:41 -0400
Received: from mail-mw2nam12on2055.outbound.protection.outlook.com ([40.107.244.55]:17025
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S463228AbgJWLzk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 23 Oct 2020 07:55:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dFoyXX0202XW39BtDs/nQyxlR8zt3ciwdUh/ry6nJf9zoxxsVdn8sIgS6bDEENIHZxvUjhceiWXyL0H9J/oPvoYy0qQXpA/SEDMWno1gxfGa0buDtlJrLE6dupZo2d4vN412cc/8iGK6k2+/Ag7HE8b29Hd6ffp6WWq0reuTPtHxXPEXr69HxNEw0cHKUOR3HvO/WpHMsMgv82D99jkq/bfYKYE1T2karMYVP4dsezzYMnDngRbA2bOLrGQxgpV3IKSheI/Kenrq8aYPRSBAXL9c46epzxuuzjOzxAAbkBEBulO0V85+7Wbdey+Ta/QB1ra8xolT0YkoJaSi6QXk3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0euzpuP/yQw3OXNe0cGV0NjIlp8Yi4yW9tleski8gc=;
 b=SZ7q9b9GiQGXP4XNjyVyWG5TXwboocZbGMUtDZaqtuc6KXNHjuTB9t3JTs8trDQrhyG9DEUPlg877qEubYCtmJ8VxCLPiu0XNbINS0ukW3Efpmsm5hVDaHgphtceZHcf0dpHVRTEoNrqooBf7uAkhOUfu9KuM/nProvW+unNqKD39DfElrKT83sLnEKEPyxCFnDS/sQQE1wcmklbpcS4GCIEJRmk+Pwd4opWPMZxzJR03pTRFMuDdYY1h/6P93Uhf+2FY/Vq9GxAnydxdulBHCwoiUmPHMoylNso94IK+hn9NPklWRtEvwhyN+UNnL1ZQF+rjsPeZQlx8E9xDTkZ4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=openfive.com;
 dkim=pass header.d=openfive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=osportal.onmicrosoft.com; s=selector2-osportal-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0euzpuP/yQw3OXNe0cGV0NjIlp8Yi4yW9tleski8gc=;
 b=ZLYqbKhkAKZUmqG2hprETe7JEhb3KVMVxnccWfl/7EUE5hhxj5iK1GC++lsfi2yJPwdjjvrklezIkxWiOIGs8Oi9GRpX9lJKL2kCIT1PAneMwO9nRzRVyMVtzZESd0H4tJyQufg0jeT/n1C6Gu4/3Xa4ceo5vTa8EI6ppZvn5gg=
Received: from DM6PR13MB3451.namprd13.prod.outlook.com (2603:10b6:5:1c3::10)
 by DM5PR13MB1164.namprd13.prod.outlook.com (2603:10b6:3:6f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.7; Fri, 23 Oct
 2020 11:55:38 +0000
Received: from DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::f49f:d6d6:4c97:e5d5]) by DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::f49f:d6d6:4c97:e5d5%7]) with mapi id 15.20.3499.017; Fri, 23 Oct 2020
 11:55:38 +0000
From:   Sagar Kadam <sagar.kadam@openfive.com>
To:     Peter Korsgaard <peter@korsgaard.com>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "andrew@lunn.ch" <andrew@lunn.ch>,
        "Paul Walmsley ( Sifive)" <paul.walmsley@sifive.com>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
Subject: RE: [PATCH v4 1/1] i2c: ocores: fix polling mode workaround on
 FU540-C000 SoC
Thread-Topic: [PATCH v4 1/1] i2c: ocores: fix polling mode workaround on
 FU540-C000 SoC
Thread-Index: AQHWp7mCMMY56WVnp06VcwClNA/CpKmiM0MCgALidpA=
Date:   Fri, 23 Oct 2020 11:55:38 +0000
Message-ID: <DM6PR13MB3451537F5778BCE2E1210D53971A0@DM6PR13MB3451.namprd13.prod.outlook.com>
References: <1603291814-240377-1-git-send-email-sagar.kadam@sifive.com>
        <1603291814-240377-2-git-send-email-sagar.kadam@sifive.com>
 <87k0vjk2ek.fsf@dell.be.48ers.dk>
In-Reply-To: <87k0vjk2ek.fsf@dell.be.48ers.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: korsgaard.com; dkim=none (message not signed)
 header.d=none;korsgaard.com; dmarc=none action=none header.from=openfive.com;
x-originating-ip: [2402:8100:3003:ebdd:4046:b251:3bfd:6e4a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 57899e2e-6604-46d0-39ed-08d8774a8ef3
x-ms-traffictypediagnostic: DM5PR13MB1164:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR13MB1164FCC2006A1FAD39B7718B971A0@DM5PR13MB1164.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:765;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KzFmsn70dTcEFrOc70bcQfKQxo3A0Lt8csoJCNjgKqKBYOs9f25LIzHgeFeVzDNmJ5vtPyF7uHTF54SWuOcOjPTMPtgYq8DSh3y3i8osJVdJOK19T4XWrM0ttFY/g9ZZfmvc7RCqHO+MDvpHg6vYpo2RwKeDTWT0adyMqvOWP4g6QJklxBIUDgsfw6UK0K7Cfs10KJrvyrI4lTFaczUp49H+lceSPQJ7Kbwi2YoXGLxWO8GyKRA27kP4ja9n10jWno1FxlCgIjKItulFc4EZBYGZp1A7t0yagWWgGyJ/unKLZw5b4Z5weuy/4txpBd2cju8gzVSlmEtBZ2oMtyru5g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR13MB3451.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(366004)(136003)(396003)(39840400004)(86362001)(44832011)(9686003)(2906002)(64756008)(71200400001)(5660300002)(66446008)(66556008)(66946007)(66476007)(33656002)(76116006)(52536014)(83380400001)(316002)(6916009)(8676002)(55016002)(478600001)(54906003)(6506007)(186003)(4326008)(7696005)(8936002)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: r9agTzy7P2m1OlRymy7OOtG+sKJ/bkU72jNBAvrvc89+pkUzoAGXVh000xtUx/hokQ2MEqG9DiJgEai2bUHxseG889XxQUEG2GVamlFzOu+LGuUm9cjWUze8Z5NG8sBZ4/JN6VRuEOjjPV7ROdLrNi9R4GQ3WJYKIWwP4WkA9QWd/rSjED2QVz2/RW7a/h5I3LYM2/OT6rgkjhMuqOGUJNQ7BhseANhPisfPIKJEBsA2TimXA7OMjr7V1Jy2W/RAFYR5YhYeDakt50dg/G5VK0XAnzaA8l3ZbROj/hApFjjG4fptyzaJwtsNMsO21fi7kWNg8C5al6Ax6e/gF05WjaeTYJhgmerJ/H76xGvs+XVKzFoZqH8N5YEBVZVahP2I+nLKqSM8UvVmUTTwst5WhHuRtyeKIOf0yz+K/15/jMsRCf6DrKWhQXpM2dQ88A9LdjIOgsmWrtclO8812QyM1V27d8YVJrUVtvU2mSiVmNlVZs8C2CKDWFOla/bpNZG6PWfepue+w9o4DK5+5z6bTiOtR7FUasyMJ8ezwIUNbCwmq63mAyc+9DIL82OI9J9OsRJq5udyeXDHHu+FXQK5rgFWMxynkO1RHbGM0mfD1eM6B6PsRTZ+9MDyG2HS8fJdXzw0T5Sr3RbkRrUlhHvQCkREedlie/fO3JDTyEs5xxwI8Bew/iQ1qzn3cFP3CYml3pJdCfRFEgXSVZwvYpViqw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: openfive.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR13MB3451.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57899e2e-6604-46d0-39ed-08d8774a8ef3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2020 11:55:38.1086
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ogZ+FgWT+aRWqQVyMO78/VKsVeQ1+7man37YnxChJDVoIwo67BYct9Be9+Wl6Uj3t3U1AnoB0v+aFoKqohAPLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR13MB1164
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Peter,

> -----Original Message-----
> From: Peter Korsgaard <jacmet@gmail.com> On Behalf Of Peter Korsgaard
> Sent: Wednesday, October 21, 2020 9:16 PM
> To: Sagar Kadam <sagar.kadam@openfive.com>
> Cc: linux-kernel@vger.kernel.org; linux-riscv@lists.infradead.org; linux-
> i2c@vger.kernel.org; andrew@lunn.ch; Paul Walmsley ( Sifive)
> <paul.walmsley@sifive.com>; palmer@dabbelt.com;
> aou@eecs.berkeley.edu
> Subject: Re: [PATCH v4 1/1] i2c: ocores: fix polling mode workaround on
> FU540-C000 SoC
>=20
> [External Email] Do not click links or attachments unless you recognize t=
he
> sender and know the content is safe
>=20
> >>>>> "Sagar" =3D=3D Sagar Shrikant Kadam <sagar.kadam@sifive.com> writes=
:
>=20
>  > The FU540-C000 has a broken IRQ and support was added earlier
>  > so that it will operate in polling mode, but seems to work only
>  > in case interrupts property is missing from the i2c0 dt-node.
>  > This should not be the case and the driver should handle polling
>  > mode with the interrupt property present in i2c0 node of the
>  > device tree.
>  > So check if it's the FU540-C000 soc and enable polling mode master
>  > xfers, as the IRQ for this chip is broken.
>=20
>  > Fixes commit c45d4ba86731 ("i2c: ocores: add polling mode workaround
>  > for Sifive FU540-C000 SoC")
>=20
>  > Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
>=20
> LGTM, thanks.
>=20
> Acked-by: Peter Korsgaard <peter@korsgaard.com>
>=20

Thank you for the review and "Acked-by"

BR,
Sagar
> --
> Bye, Peter Korsgaard

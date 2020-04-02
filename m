Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 988D719BB90
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Apr 2020 08:16:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728803AbgDBGQx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Apr 2020 02:16:53 -0400
Received: from mail-eopbgr10082.outbound.protection.outlook.com ([40.107.1.82]:32412
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725789AbgDBGQx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 2 Apr 2020 02:16:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a5Q1Jve5GegZD6mzeM56wPy99/9Jnjcv2FkyoNJWchh/m6X7Q23GlTVugZnqmVswKCw3pKSr6+rsMMNn6J863ZDuQKj3onJwMBIIG2WY7DmcmmWf0PGAXglR/OqVAq55DlD8OBHS40CyfjwkynOvudwWKJ+p8XddP83t2PiLzmRMrl0rJuFVDDZ2br7m866d517zD+36iObRlexW5ZAWXl/tCwFxceaS9qfSTk/lDAkV1BDp6MX4fG6PRJ+zVV9WsYiwKSpNmL2NrdAc8AmD9dIa3vktInQ9g/Ghnc8uV4y2mweVRC6us8TKdLWjL3AH8ubYvcdH4gh/3GalOQhmcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxycI4jDZmk8gm4b3AvfUMx15suhXA9Du2vr7q19FP4=;
 b=MEYvj/tDesueoMpU3R88MWvcylhmqMpFUNGk5UYzn8SIGn6t473nHs8qAWakAbWMe2574d31LMmqKrapFupL28Zq+otIgZAny0UNYnmzs/rFLwukxxue8RDy5Ro09tQgsZ/SNpVl7shoQFFPZDuZzKWDnj1xjDXoaYAclGbRebnW4XpNN8lTSZewO130+Js/ACkX0PJo4WJVNDfdVrpsmQtg5kWRUShKZkasCs/TeVQs89mS0iRRaB4vleLE+NSsYjsTxkxjYCigUxWbehPqnM5oFB3RzFhp+bRXDzZtYJqSEhJRRBAvrN+N/31xLmglYV4EIanPot2748ihKrZFcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxycI4jDZmk8gm4b3AvfUMx15suhXA9Du2vr7q19FP4=;
 b=gyxOCUkq4Gxvls+F46Uqf/YqezfyQ0SIaHoJu6N940iDUB8SVxlmHyW003CwJ0vVLxv/dgcY2AL9rYeP9ewJau9bax/8wmnlsvU7XXp9IQlchubwmnqh2ItemXadbDuv3p1nI83/Yfz4ZmcPkUrsJghNyXkEwsAHLXQoP/fuV1g=
Received: from AM0PR06MB5185.eurprd06.prod.outlook.com (20.178.82.25) by
 AM0PR06MB6257.eurprd06.prod.outlook.com (20.179.254.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20; Thu, 2 Apr 2020 06:16:49 +0000
Received: from AM0PR06MB5185.eurprd06.prod.outlook.com
 ([fe80::3c0c:c6e8:c7b6:cabd]) by AM0PR06MB5185.eurprd06.prod.outlook.com
 ([fe80::3c0c:c6e8:c7b6:cabd%5]) with mapi id 15.20.2878.016; Thu, 2 Apr 2020
 06:16:49 +0000
From:   Laine Jaakko EXT <ext-jaakko.laine@vaisala.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] i2c: xiic: Support disabling multi-master in DT
Thread-Topic: [PATCH] i2c: xiic: Support disabling multi-master in DT
Thread-Index: AQHV5mNyTIn2+pYf+Eu7yiopaV9KGKhOcmGAgAAnv5CAFgB+gIAA/BRA
Date:   Thu, 2 Apr 2020 06:16:49 +0000
Message-ID: <AM0PR06MB5185F8F51316FCD5213F0ABED4C60@AM0PR06MB5185.eurprd06.prod.outlook.com>
References: <20200218135627.24739-1-ext-jaakko.laine@vaisala.com>
 <CAKfKVtFf+VpinkOGsBFZ2-_PKvx-C1L7G7_uhY2RCvV5dy6L_w@mail.gmail.com>
 <AM0PR06MB5185E501349E06428093B62FD4F70@AM0PR06MB5185.eurprd06.prod.outlook.com>
 <20200401143254.GA2409@ninjato>
In-Reply-To: <20200401143254.GA2409@ninjato>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Enabled=True;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_SiteId=6d7393e0-41f5-4c2e-9b12-4c2be5da5c57;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Owner=ext-jaakko.laine@vaisala.com;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_SetDate=2020-04-02T06:16:46.8464983Z;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Name=Restricted;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_ActionId=094f9e9a-668f-4b33-9e15-03adfbb5cd9b;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Extended_MSFT_Method=Automatic;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Enabled=True;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_SiteId=6d7393e0-41f5-4c2e-9b12-4c2be5da5c57;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Owner=ext-jaakko.laine@vaisala.com;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_SetDate=2020-04-02T06:16:46.8464983Z;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Name=No Label;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_ActionId=094f9e9a-668f-4b33-9e15-03adfbb5cd9b;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Parent=d5842b46-9b7a-431a-b662-8cc44ff92a4e;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ext-jaakko.laine@vaisala.com; 
x-originating-ip: [193.143.230.131]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 490be71c-3eef-4367-0ec1-08d7d6cd6dbe
x-ms-traffictypediagnostic: AM0PR06MB6257:
x-microsoft-antispam-prvs: <AM0PR06MB6257812AE45B29720BE3F882D4C60@AM0PR06MB6257.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0361212EA8
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR06MB5185.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39850400004)(396003)(346002)(136003)(366004)(376002)(5660300002)(4326008)(52536014)(6916009)(86362001)(2906002)(6506007)(33656002)(54906003)(8676002)(7696005)(66476007)(8936002)(478600001)(64756008)(81156014)(316002)(71200400001)(55016002)(81166006)(66946007)(966005)(66556008)(66446008)(76116006)(9686003)(26005)(186003);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: vaisala.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5cuBB4e/myJ9LpdCslpVC3gfnspe5F6dEN2nO4mBqezGFYteDT13/+E/8KIUPgDz/0PyXbu0UPZGLGAmZnTz8v0GFRhbKW9rKJEtCWznaVZZYS9zbEXnji5Uy1+QH2Z9qqxJNlGIMeEuxFoRMnJjAL8VSrnkyOkuYM7MnzJWzDIWQsNCFkWMAAMHQWZ+4+Qf8epnQw/DDxh+b8lh84FWxwVu+rxZA009vjHiMzqcnGL+S9ZdD2OH8mc3TZN+vSie8Ijw1bT26ZtdkMQV3CX9MaUP2klkPYr1tpB7t8KzT/c/pgyLU5aLyjICLWBNH4PWmnxogSQd+fYItqzCkKB/jnNtoNDynT1/OEkJ9zj4Di1KOFqmudwz1A0kok1JpmCV3vw5OuueEToMhnSMMcueFkwx3odHAI4jp+Q5tu0o4Uj6ohqz2cyuwzKEtCsRMXu6eO1oB53Y//7jIuk8EFnwIbkaA8mPK3k6EFpFoH3b+xrH+dBN0LxZpD2VudUiDtLkWWUngJCM/46R/cg0ARnCjw==
x-ms-exchange-antispam-messagedata: ynhAdZeW9tdbZ4c/h9jT03zDsRJPJtkTvUURdkW6q/alBmc9ERn9eJ4FFbR7SdL0/6WIIHdzeMYNv2pC7lgr/+dLkC+y2nU7Rr+KE5Z3xBVCo84AUdBc0HWugywP+sVG5brE2ep/66l6f1etI4CEtg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 490be71c-3eef-4367-0ec1-08d7d6cd6dbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2020 06:16:49.2907
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NRBFamskCEShtvbdDdk/disPwqc8GCEHecFPRZbzAyH1xcK5wPFIHBR9zexbq6zYQvGGDl54m3h9BqykqPV4dX7ZB/uDCjvRP+lgwtGBZkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB6257
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> > The multi-master -binding is documented here as boolean and encodes a
> > Boolean by either existing or not existing in device tree. It is also
> > used in other drivers so I couldn't do much about it missing meaning
> > False.
> > https://github.com/torvalds/linux/blob/master/Documentation/devicetree/=
bindings/i2c/i2c.txt
> > I originally had a custom device tree entry where the default was for
> > multi-master to be enabled before I noticed the pre-existing binding.
> >=20
> > Maybe if the multi-master binding was changed from Boolean to for
> > example a string property (multi-master =3D "ON" / multi-master =3D
> > "OFF"), code could still just check the existence with
> > "of_property_read_bool()" first, where property missing means "OFF"
> > and property existing means "ON"(like before) if there is no text
> > associated. Xiic driver would then only disable multimaster, if device
> > tree explicitly contains multi-master =3D "OFF".
> >=20
> > This should be able to maintain driver backwards compatibility with
> > old device trees, but requires binding documentation change and all
> > drivers should likely be updated to also accept the new style of
> > multi-master property to be consistent. This is also not as clean as
> > the old Boolean property in my opinion.
>
> I agree. I don't want to change the old "multi-master" binding like
> above because that would be quite intrusive for other drivers and
> confusing when trying to understand the binding.
>
> My best bet is to introduce another binding "single-master" which says
> clearly that we are the only bus master on that bus.
>
> Both bindings missing means then "unclear".
>
> I think this matches reality best.
>
> Opinions?

I agree that this sounds like the best option if original binding can't be =
used, even though it can also be a bit confusing to have 2 similar bindings=
.
How would both bindings existing simultaneously be interpreted? Maybe both =
existing simultaneously should be considered as an invalid configuration, s=
o that it would be enough to just check the one you need? The other option =
would be to treat both existing similarly to neither existing, which would =
require the driver to always check both if checking one.

Should the new single-master binding also be a general binding for all I2C =
drivers or a binding just defined for the XIIC driver? Having it as a gener=
al binding for all drivers could help with similar issues rising later with=
 some other driver. It seems possible that a similar issue could happen wit=
h some other driver implementing multi-master support, but I have no experi=
ence with using or testing them.

- Jaakko

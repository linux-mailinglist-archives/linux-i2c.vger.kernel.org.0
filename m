Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C438025522D
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Aug 2020 03:11:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728040AbgH1BLz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Aug 2020 21:11:55 -0400
Received: from mail-eopbgr1310130.outbound.protection.outlook.com ([40.107.131.130]:54609
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726147AbgH1BLx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 27 Aug 2020 21:11:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wh014z6D6N8/ngo1JS4rI9our1wIj8c+CuBJTWPpO9N9iAYkqz0487XN7mvgYkLkBQV60VMujh+m8KylU+mCQBu46AYhAvGlEguvL0wpnAlyj6575o0A6dvtrDNfkP8jFF4tYLvPA8vaewe9JYZ60QuCS5U1b+B307zHWqH8It1D97k9BELOtp+xJbrlCGKjIk9yZWOqwN+rPv7t8kZ2aiZRHrHn2JHXXAVijMbNFZ4gtYiezdV2fxYMn8lZfuLl7GOTlApMiVzje76uPYBOPhdUzX5Mvk9MBb8l1Fkr15KmB1rKh4Y+hUc9323Kq+o9wyBPdT23voAd5I8nj91pFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9UIRN1S3caVq7GLDNZa1/30HSz/7xUoOX5L1Hk8EQm8=;
 b=Ytn55ktobz01EnGDA7N964F+oOqVrcUyY6QXZuAZNrmqM4OErak0UEdYnNsYOr70OjvNTNhgJsiSomzvAlJc5+Ga+UQRmtOQkkhkzecuzRKq38lh7dmVZkq9ggwqrvee7ULvMrr8THESf/2SgAMluWVKixLgEDMPaf59/EQnM/nCdxuf+0LQV4LwSYCI8rq8yFk9lSJ+ftqza6+k6jm9mc3CbxWOdTwEEzBlBo1yvyIroIveBjiPyrTG8Y0LFPvqPIgDbgU1nfd9MSV8Lsqz0rF6HIw75XabotKm5QBnoCxJ/L+MGqp6cGarvZvEn4X4Ip9IHOGtKe9JOO1tq06PuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9UIRN1S3caVq7GLDNZa1/30HSz/7xUoOX5L1Hk8EQm8=;
 b=CgWpDkaaifmTgujEPwWjruXgad1wEvA1BBbevMl9Of2BQafeS2blNQbQbBBGOQFb/IHmJAeKSG1A0h/p94tWaxTzijZQkCbvhWkCJtiSpK5nwJeCpIH0tl5h4y3togXXJt7E67YHawX76slTc9OMNB9iVU2wQrw8NxPFvBNHGoY=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB3292.jpnprd01.prod.outlook.com (2603:1096:404:7a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Fri, 28 Aug
 2020 01:11:46 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3%6]) with mapi id 15.20.3305.032; Fri, 28 Aug 2020
 01:11:46 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Jens Axboe <axboe@kernel.dk>, Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Niklas <niklas.soderlund@ragnatech.se>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>,
        dmaengine <dmaengine@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-pci <linux-pci@vger.kernel.org>,
        alsa-devel <alsa-devel@alsa-project.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Subject: RE: [PATCH 08/20] dt-bindings: usb: usb-xhci: Document r8a774e1
 support
Thread-Topic: [PATCH 08/20] dt-bindings: usb: usb-xhci: Document r8a774e1
 support
Thread-Index: AQHWW5VD2NxLZpPSm0GcPQ/4Va1HXKlMdAgAgACERaA=
Date:   Fri, 28 Aug 2020 01:11:46 +0000
Message-ID: <TY2PR01MB36923A0548AAE7E0249042AFD8520@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-9-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8t-HHWeo4zwnTuyZHnhc8u_aXqt_KZHr1trnXQB15Jj6A@mail.gmail.com>
In-Reply-To: <CA+V-a8t-HHWeo4zwnTuyZHnhc8u_aXqt_KZHr1trnXQB15Jj6A@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:b16e:b7b1:d350:3c9a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1f1ed9c8-8b1e-4353-7656-08d84aef5572
x-ms-traffictypediagnostic: TY2PR01MB3292:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB3292EA757DBBB8B9694AF976D8520@TY2PR01MB3292.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JkDFaDAvqRg7+LFUKZS7f4MnEGHLQcstoPWOn7/wTw/VfGZ/cZ2Tf6wtkpjO7SOG8h6U8UZUT05QXmqctwOiaXUBXQ0I3Q0xGRcM/cagIdCAZ1a9Aaq6kurqmSbnSlzkiYSLtP/SzPkuK0Es25wEXTurcF28syzYO7rj0dYLuWYY2yZHRFmARBoWzlDZQAKqLuZ2wumxq+EBc1BgLX37GFnQKRmgbvV2n5U1/QSCJ32md74vFuL+jZu2nGlfMcVqAgtrME2kKsW5tN83EGxLjZqQH56URjSK2i6lgTmsxvkglkok16+E/vKrbNdCOQYRSvkbCW8pqHwbi9F+5wDt9Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(136003)(346002)(39860400002)(4744005)(7696005)(110136005)(316002)(478600001)(76116006)(2906002)(7416002)(66946007)(66556008)(64756008)(52536014)(54906003)(66476007)(66446008)(8936002)(8676002)(71200400001)(4326008)(186003)(33656002)(6506007)(55016002)(5660300002)(53546011)(9686003)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: JH9W+Zv8tUgGPnzLYghYnnfF1cogzpVOYo+/boYOlgF4BWmoyYJlBhHtB/U5sx0MZJnXz4WjFgoG6At9iOwlJA7sbeghTChWp/S9pxTSxJ159sf9chFPkytnOoZdFjlErhOO6ffp1WrdorFUBxskOIugtVCP7Pjnfntepxyu2VG10268wB+wYtxj8PtfAvw+XuCD7AqITnTCF0z2ksRosmd0YvcjPwIL8c7j/MdPoIAUeqpj+GkCDRcpVtXDW+t5ZE45zQmob6AGat3NyX4fwYYz/5BycdXhQQzbeTcWo+hxCSYo2e+uHCXFV6jDFwybngfJEYSTGtxQ6NCZCe44tDZK5Zd9v511fxr6SjJhcHsukWfUGPc/SvOV69rPF4NTbNmEsUAWY+KdGJAQtf1NDnyhthPA9+zafdkzij+e/p4q3IvrP75YaV95OXSHTNumbyhU7DCsoP6X6t6JvrMO1SQzbTDVIgaM65jKz/dtbVnR6ob3vG2vxjC54WCdq2uZEAYIwfBRA1HC03aEMyEZboy5HyZDtsP6rT03D0Z3ESUJWkmKwjsmscUkcQ2aPifkHEUzZAtHCBv0hIDbfS7LfkPSO5yqAXQt/uH7rWUo0uNsnOs8eKzy9q2rmiNOQXHjYwMMdtF7UfDipCz04hrhLt/iC12roZ3k2SosbQgS4tOsHol0EX0PIpm7Dzw30k2esXWWEN3bgysNt+4JAZj3Dw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f1ed9c8-8b1e-4353-7656-08d84aef5572
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2020 01:11:46.2070
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5WKZto6o7wQZ9NIo8NoZSr61MGzPCWkR5g3kxdD2rqzJWZwotqiqF4AKliklrMJZbQBh1kgpIBn0T+TxMB9BY4UC6PVo0r1c+fKzCMLaigsQvmuqExKpW17BoFKTXXvx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3292
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgTGFkLXNhbiwNCg0KPiBGcm9tOiBMYWQsIFByYWJoYWthciwgU2VudDogRnJpZGF5LCBBdWd1
c3QgMjgsIDIwMjAgMjoxNSBBTQ0KPiANCj4gSGkgR3JlZywNCj4gDQo+IE9uIFRodSwgSnVsIDE2
LCAyMDIwIGF0IDY6MTkgUE0gTGFkIFByYWJoYWthcg0KPiA8cHJhYmhha2FyLm1haGFkZXYtbGFk
LnJqQGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPg0KPiA+IERvY3VtZW50IHI4YTc3NGUxIHho
Y2kgc3VwcG9ydC4gVGhlIGRyaXZlciB3aWxsIHVzZSB0aGUgZmFsbGJhY2sNCj4gPiBjb21wYXRp
YmxlIHN0cmluZyAicmVuZXNhcyxyY2FyLWdlbjMteGhjaSIsIHRoZXJlZm9yZSBubyBkcml2ZXIN
Cj4gPiBjaGFuZ2UgaXMgbmVlZGVkLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTGFkIFByYWJo
YWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiA+IFJldmll
d2VkLWJ5OiBNYXJpYW4tQ3Jpc3RpYW4gUm90YXJpdSA8bWFyaWFuLWNyaXN0aWFuLnJvdGFyaXUu
cmJAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy91c2IvdXNiLXhoY2kudHh0IHwgMSArDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQ0KPiA+DQo+IEdlbnRsZSBwaW5nLg0KDQpUaGFuayB5b3UgZm9yIHRoZSBw
aW5nLiBIb3dldmVyLCBzaW5jZSB0aGUgbGF0ZXN0IGtlcm5lbCBoYXMgcmVuZXNhcyx1c2IteGhj
aS55YW1sLA0Kd291bGQgeW91IGZpeCB0aGUgcGF0Y2g/DQoNCkJlc3QgcmVnYXJkcywNCllvc2hp
aGlybyBTaGltb2RhDQoNCg==

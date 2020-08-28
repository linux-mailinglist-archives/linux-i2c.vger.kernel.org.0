Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E510D25526E
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Aug 2020 03:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728324AbgH1BNp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Aug 2020 21:13:45 -0400
Received: from mail-eopbgr1310112.outbound.protection.outlook.com ([40.107.131.112]:3136
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727784AbgH1BNo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 27 Aug 2020 21:13:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wk1PxVMYZVQ+OZhekVKg0tMC5I9RNHtUbFMaa2bcPMqkDM9bWly1FYVrE3IuPyYhL0pS7VpCWv1VPiIt2rH/Ccuhgn3lBKYvrsw2+cBse4jGSz8pNugczpNl4DykRGePR+1OyE4JHNFyBflDzg0ykrF2dzi6KP0cycqUUn+8E3YgoxzP/sA7+pHHVVXnSBZvKc5b5AAmxBot5Vl9f5SgOyOd3/u0+7viWYSo+pnuzy5bk4BfQvRyxA3Uwa+lmTVJyB8hZu5FNJPxC9q93EBnf4ZiU5GHa8bc+HWYgTuLnY0UWsBl7KABVOlBWWPcnGmpwr5H9L4gz0jJbtwxfKnZwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYmEGKCVmLNsbbTGMfyfW2oU1G7ZaSu7LmztrSay1M0=;
 b=E6TzSFiexcW2KuXxJCV4yuTdhV7IOkUe96cZzlPrMK/tTzd/kDeDdvSXiAWDHcilUyTfmQ+nXYJEW8Awp4MgrT7Q7tLV03r+BqGKAqMAWucBMcRqpmxVLNZiMG+TZqQq81AZnFGLY7PHmJD/RfqywPgPlGvEXihtHU8Up3Cd/8PFFsbgBqWOZ/MbfmkzYlrpAflGn0vGrIwjO7FUpb0g6Ffz2oXpCxU3D0y6Bt4A+vCJCwoteXtqVkl1E3qZQ7PbJ3dyZUPCnE7Jd4etVFu0d/ZFYtJe8j27nbxugpY9jwzF5li1cSG61w0LkHBNbVBXp//5HbQsSHk3+1ihUyUd+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYmEGKCVmLNsbbTGMfyfW2oU1G7ZaSu7LmztrSay1M0=;
 b=fYlgrgw7tZrgNRiFZVpJ61ZJRcHK3yjHvarMR76yVEPAWaH32qr/1O7eC3ws9Ub6ea6phhXgHg/LF0hH+jnBddufWcExDPzm4LSzbbqjp+zW+D1zoUDDx1NqQhVpA8KYboKwVxLmR4dvZdKhPSCGjcqsR4c/T4mbUxGCnS5jyhU=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB3292.jpnprd01.prod.outlook.com (2603:1096:404:7a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Fri, 28 Aug
 2020 01:13:34 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3%6]) with mapi id 15.20.3305.032; Fri, 28 Aug 2020
 01:13:34 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Jens Axboe <axboe@kernel.dk>, Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Niklas <niklas.soderlund@ragnatech.se>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Subject: RE: [PATCH 01/20] dt-bindings: pci: rcar-pci: Add device tree support
 for r8a774e1
Thread-Topic: [PATCH 01/20] dt-bindings: pci: rcar-pci: Add device tree
 support for r8a774e1
Thread-Index: AQHWW5UrUbPIlHvQCUyWdxM4+VVmPqlMeWoAgACAI2A=
Date:   Fri, 28 Aug 2020 01:13:33 +0000
Message-ID: <TY2PR01MB369299E1EA77E8BF87CA9E0DD8520@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8sn1_fKbHt6cy-27+j2HWFp7Fjt8XBRZPLpvN47C3E3hQ@mail.gmail.com>
In-Reply-To: <CA+V-a8sn1_fKbHt6cy-27+j2HWFp7Fjt8XBRZPLpvN47C3E3hQ@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:b16e:b7b1:d350:3c9a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 28242de6-c6ea-42e5-63ed-08d84aef959d
x-ms-traffictypediagnostic: TY2PR01MB3292:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB3292C20694D4A37C64216936D8520@TY2PR01MB3292.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2LBuLFqe98XEZl4n65+e3rTeZw94cm0vFPZCWvPWQjVj4cq+2cBSliZHbcD/LYdzDpf8MxiRFnZm/SpC9WmS0+6Y87MW22iARYouHJsKsbMQuqP9dZzPhwdb3U5Vmxw8E6iryETCC7BYWqbWyZdwlGI9hMHbMdLiyqEyEDU2VUusCx8l3ZPTjjNdx22FhucccPUIfRz8cyooivq6FiqMFp2bCCSZjP6fUYYGobQLaO2b2IsAXwLGR0+hCd7be6s9DSwzioR7deogYC6whc/hvJDWPq3q6w9J1TSkId3p7dDz1U8bpNHiGIM3W0K9nXWDJ/IW6cxFzWpkOYtOFZP+VZROpEaEhmgACy9xI9nzGjk8RkJj6MVM4gXmE08d/Dp+iD+FWMkjlTj4DVR87XjGJg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(136003)(346002)(39860400002)(4744005)(7696005)(110136005)(316002)(478600001)(76116006)(2906002)(7416002)(66946007)(66556008)(64756008)(52536014)(54906003)(66476007)(66446008)(8936002)(8676002)(71200400001)(4326008)(186003)(33656002)(6506007)(55016002)(5660300002)(53546011)(9686003)(86362001)(138113003)(98903001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: wkjAElkoPEIGXZx2OZ9Rc8Ze9DhHX3qoBKfdAUIhnQr9rCmTHqlS1l+ur4vuAid2RuHT24WNv9NS+N25tOWLHJHalKTsfw7hkkXIVa+sKToMIStbDYn6W9PHZjyGWlmjrpZe9XQhkUkIGDuc1beTlJPhUcgSm/K+H+7dsFebMu8oAFlOXIyMWivgjV5aIx3GgsD7v8CEIKxkumzKYZyPtN3ogy3z2ja8VLl0zo8zJp+b14ozYtqmEBPp4Cum9XCFUTUoW8Ag4XtrbcqBkRLK6i4visRyawTZU1FsNWNSRFNev64jnUG+tmFr7BR36YVZobabyvcFixYWyMC0oHgDdYGSOnrqktstsaDY4ooIUf9nm84w6nFsaIrsSzqj0D93FV9iHn/fgvUtUkwkBKMElFrCM60ueuHu6YlL19RnpR5obMBTdgIZfze/LjWzaEnazlJKCXggrDCOjI2+au89KxCPTs1RCq9gcLTw/h/y+PNT/66m2CVLM0TgDGiYSWCf1RwyG53ipvothrj4HKGHvcomfzHV8a9B93ZgBaUCgAwUkVsNu9bLJ36eGV8L52aILo6pdjJq+stpg6h8T0ZKGdD/J/lPzgaBUpO2G87oQoCECZB1aYXjD3mUcRU2jLtXssYIw0IqaPYjbeNz8x5MUKTXwqXyMknDE9oyFFLr2ycjTLU1unafQBbxLmOyMacuTZnH8OLT9hnVh6zf28mH+A==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28242de6-c6ea-42e5-63ed-08d84aef959d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2020 01:13:33.9005
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KfYgyeSdWI1iU9VbAWztBqehvG1FuMiq6ojU6JAKWekcRiwYdyM0CBYTi8At31xibv+8Na9gaKnXnZ9GTgoYIUX+WiVc8L5CwYMG8kFdMuic74nfozw1dByj+3qRcR47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3292
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgTGFkLXNhbiwNCg0KPiBGcm9tOiBMYWQsIFByYWJoYWthciwgU2VudDogRnJpZGF5LCBBdWd1
c3QgMjgsIDIwMjAgMjozNCBBTQ0KPiANCj4gSGkgQmpvcm4sDQo+IA0KPiBPbiBUaHUsIEp1bCAx
NiwgMjAyMCBhdCA2OjE4IFBNIExhZCBQcmFiaGFrYXINCj4gPHByYWJoYWthci5tYWhhZGV2LWxh
ZC5yakBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBBZGQgUENJZSBzdXBwb3J0IGZv
ciB0aGUgUlovRzJIIChhLmsuYS4gUjhBNzc0RTEpLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
TGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0K
PiA+IFJldmlld2VkLWJ5OiBNYXJpYW4tQ3Jpc3RpYW4gUm90YXJpdSA8bWFyaWFuLWNyaXN0aWFu
LnJvdGFyaXUucmJAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gIERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvcmNhci1wY2kudHh0IHwgMSArDQo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiA+DQo+IEdlbnRsZSBwaW5nLg0KDQpUaGFuayB5b3Ug
Zm9yIHRoZSBwaW5nLg0KDQpSZXZpZXdlZC1ieTogWW9zaGloaXJvIFNoaW1vZGEgPHlvc2hpaGly
by5zaGltb2RhLnVoQHJlbmVzYXMuY29tPg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hp
bW9kYQ0KDQo=

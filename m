Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83B85BF357
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2019 14:49:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726665AbfIZMtm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Sep 2019 08:49:42 -0400
Received: from mail-eopbgr1410111.outbound.protection.outlook.com ([40.107.141.111]:6416
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725836AbfIZMtm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 26 Sep 2019 08:49:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VAJdHxK1lGaaHS4xpb9raoGfjZpUVLfMo4/pKZRqHfLVJDnHZbnM4vYQLhHY/Qfq/k+UY/cSl1ypZaYeRf+Qn2H0Fh7fMrji+owJai1SQjBETNGY4AxaCfOdehlh+0beWhRvGREO+8zf+wAfGHfVMKVo8pfD9rel8Y1rm+n3tIhSUFvhdZdajSGkzWrRcPNHOPNa6MopJvaJ/Bva8LZ2k6pBdL+EVzpXL2afxVr73zrnYCuaRaLFDZz9a+HhEd1XSzdYsH1pt+9cwH7R9Bl4FzcrlauVZcJo6NlmnHk0CepYMEvVIMPonZUd0grTkpEHTpB9U+t4yWQb17i7WBtxcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=psO+4ljZKm8nMSgJDjvuEqvQcJCoMUZr+yZD3UYnpjo=;
 b=lGwWtYVkPMFThUj2AHLxZcqJMMu5B4GwFCOvgo4Y09VIG0zFHNSVqefQNaXL4yi/PGh+U1wNsUQ+nbN0i65u75hhpySk76n3KA0lFaGoS2KgkJYb80lpklSiw3BaprEuNTXFFZXtAnOHvUlsh4SXdVqTaM3DFh0qlJuoBnbVu2rX0A13SwwkCN6rF7ReRRjFMOrME41dNTlPIPQXGLq47lTXB9M/jllWLcH6DXiIKK407ehvPzvzBV5xtmwG/EPH8qebspeAnD8KpbKWJwFKgsadtbDjIHkCJ5bMYgNEpGB+Wo8jTq90GNLkPCRO074f9W9XRffOkZHfZQ5aZh9pNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=psO+4ljZKm8nMSgJDjvuEqvQcJCoMUZr+yZD3UYnpjo=;
 b=oAilihv5fqRByiqGlofcFRKT4JdP5PEUJnYwL4jgYZXP56SQscYtv5JgeXqAEJdjOzfAtf2FZLugpDGcaU4hy3oP3KX6bxCiR/gn1+XLMre/2Pd7LcNccjaX/VhByZweOiwNETcSrLxbHlJ+fq0/7H6U8LIPrUtYSxK7fC2QJ+I=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB3302.jpnprd01.prod.outlook.com (20.178.96.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.24; Thu, 26 Sep 2019 12:49:39 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::746b:49c1:925d:e9eb]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::746b:49c1:925d:e9eb%5]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 12:49:39 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: i2c: sh_mobile: Add r8a774b1 support
Thread-Topic: [PATCH] dt-bindings: i2c: sh_mobile: Add r8a774b1 support
Thread-Index: AQHVcqrj98JAbqCUV06v6YAlYD9KN6c96qAAgAABfyA=
Date:   Thu, 26 Sep 2019 12:49:39 +0000
Message-ID: <OSBPR01MB2103FBD1E80060A718C32FCFB8860@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1569310619-31071-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdXwpSeQPUtKT4g6Oa14w71WM9dw5xXj3DUZ8Qj6=9OM0g@mail.gmail.com>
In-Reply-To: <CAMuHMdXwpSeQPUtKT4g6Oa14w71WM9dw5xXj3DUZ8Qj6=9OM0g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 84401532-05b1-4c18-3980-08d7427ffeb3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB3302;
x-ms-traffictypediagnostic: OSBPR01MB3302:|OSBPR01MB3302:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB33025947B4F48E0ABBCE61E7B8860@OSBPR01MB3302.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(39860400002)(346002)(396003)(366004)(136003)(51914003)(199004)(189003)(7736002)(76176011)(8936002)(316002)(2906002)(186003)(478600001)(44832011)(26005)(55016002)(9686003)(54906003)(53546011)(99286004)(476003)(4744005)(11346002)(6246003)(446003)(486006)(81156014)(66556008)(66476007)(66946007)(74316002)(86362001)(25786009)(305945005)(81166006)(33656002)(7696005)(6506007)(5660300002)(66066001)(14454004)(71200400001)(6916009)(71190400001)(6436002)(8676002)(76116006)(256004)(3846002)(66446008)(64756008)(229853002)(102836004)(6116002)(52536014)(4326008);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3302;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hnF25ruY1+Vxp4Leo76myAMl+fZHne9//Qq3vFh4XwM5Fogl3bKnHbMP88oitS3Jlrb8Bc+uvJ4AYRMq42WyHG2489Y6exugL2Lg2Hoognb2KhNng3oc9Sw1chcZrZUQUnv4XEBNucu4UjPmitt9VB3I2t9w/O1DT4REGclGLBIkX/b2dPkaQT1zLSZy+G2CjVz9ZHdyXYLMCWrB4wtZSQnTKiC4/NeVWY0xhTxMb1KOcnXSjmGW+As936zLoQl3Mnbsljwupcui+09BKUtM5rxjanaio2QrbY2Ip7bFxirCSTx5gzrBv1kLMVKJtKAsxxskEQ8DYAasyFfIrlnYR4mNjIULnixO6qXLooANaKE/93lFM93kBgX8rcbj5X+kv1fW5qTrnGsfVVvn2bCuCI3Ir1Wvy1TVzqGGWfMFiPI=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84401532-05b1-4c18-3980-08d7427ffeb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 12:49:39.5644
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +ARC8kLfju4hasJqeGxY8OiADXwBImkWQpmD2neVkGEhg10+MKremYIyW80PBIs8KhW2eIT823qS0JyAChm4Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3302
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0hdIGR0LWJpbmRpbmdzOiBpMmM6IHNoX21vYmlsZTogQWRkIHI4YTc3NGIxIHN1cHBvcnQN
Cj4gDQo+IE9uIFR1ZSwgU2VwIDI0LCAyMDE5IGF0IDk6MzcgQU0gQmlqdSBEYXMgPGJpanUuZGFz
QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBEb2N1bWVudCBSWi9HMk4gKFI4QTc3NEIxKSBT
b0MgYmluZGluZ3MuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXNA
YnAucmVuZXNhcy5jb20+DQo+IA0KPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxn
ZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gDQo+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9pMmMvaTJjLXNoX21vYmlsZS50eHQgfCAxICsNCj4gDQo+IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvcmVuZXNhcyxpaWMudHh0DQoNCk9LLiBXaWxsIHNl
bmQgVjIgd2l0aCB0aGUgYWJvdmUgZmlsZSBuYW1lIGNoYW5nZS4NCg0KUmVnYXJkcywNCkJpanUN
Cg==

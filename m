Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D237CBF353
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2019 14:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726025AbfIZMso (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Sep 2019 08:48:44 -0400
Received: from mail-eopbgr1410115.outbound.protection.outlook.com ([40.107.141.115]:63360
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726004AbfIZMso (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 26 Sep 2019 08:48:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KveE6+82Bv9BBQchJ6o4DzN7pHhn8IonZpTWzaVOhaZS8zcOYHw34EMnFamQ4F564Cwv02hbWv54zLiDEnMUKepoVBsGJGk389S7/ei6zSGxJkmeNOX0BKJEl6l+bhV9Cei49MrurfNDmWvqhIC7Rmc0CPBmDA8UUq7T+qPz59CipCYqXlwoMBoq9RUiHE4KGDmFHbCGgyN/5mhdSF1yPvv3z+d9Zuz9qm/thhqAiBgVtT4ffo7/R9mjMPkfSRZAc9fa7bJ5Vl83HgWfeMeGT7+Xm3jIQS/xJ7hv8nYFOlDrLPsF9ef1SfReyDHaRsoZX3HwpOU+6e70fnCoEu4Qxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTy5Uf+HlJ138cxYcERY9TuVltVoQXe17n1icqHP8A0=;
 b=I7UwU+FcjVWe9MeemO49zQ+JoXi0ymNhLF+xneRI6AtOxmRwEaPunT3oyp7SvTOiE2PGNIGDkmopz7/LyVjHUNJRHvORGExzQYjSQNKTLOMdILTOaAQ4Kz5OXB6N7QKTeGdzQrfx1VeAi3wh8t8c1xE9KIi/H6GFNiTjei8M7nLH9eNUv2GKUGQ/IIpco/cHGP5IMqmM0I1rHhFdafo+GO+85jzsWls7IuffdFzlrWh5zku/GaeyiS6/4QRHtdvyjEgMMVsMt7Y5eWmgAHUn0SfsKwThkXgK7tQppcrwUnvBhpPcwO3WK9714D6Ru8SbhFTtcVP+7LJleXejXvCCNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTy5Uf+HlJ138cxYcERY9TuVltVoQXe17n1icqHP8A0=;
 b=a20+3co92UP35a1nw62Sd+oL0laIXitUB1PHu+I417OnxDntTI2vz53GCIAI0BChC1J/9AF6QziKLI2N2ZjOyiVtZTmL+hNiA5zziq8fSqyywhLEPMPGxExy4PR/8Plx8EE0apuGSQkT5nUFvGkpbHDajkqphVuNySbqJOGzuOw=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB3302.jpnprd01.prod.outlook.com (20.178.96.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.24; Thu, 26 Sep 2019 12:48:40 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::746b:49c1:925d:e9eb]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::746b:49c1:925d:e9eb%5]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 12:48:39 +0000
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
Subject: RE: [PATCH] dt-bindings: i2c: rcar: Add r8a774b1 support
Thread-Topic: [PATCH] dt-bindings: i2c: rcar: Add r8a774b1 support
Thread-Index: AQHVcqpSHM7YgJMz3Eqi6oDiZNhRqac96kIAgAABirA=
Date:   Thu, 26 Sep 2019 12:48:39 +0000
Message-ID: <OSBPR01MB2103237D77ECCD14A41EEFFAB8860@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1569310377-24976-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdXp_u-w9DMbmBZn3G99LexLuQyBR2hRA_0T8Wn130SsZg@mail.gmail.com>
In-Reply-To: <CAMuHMdXp_u-w9DMbmBZn3G99LexLuQyBR2hRA_0T8Wn130SsZg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 46875774-3406-4ecd-aa0c-08d7427fdb02
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB3302;
x-ms-traffictypediagnostic: OSBPR01MB3302:|OSBPR01MB3302:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB330244A367BBA7A1C5EEEFDEB8860@OSBPR01MB3302.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(39860400002)(346002)(396003)(366004)(136003)(51914003)(199004)(189003)(7736002)(76176011)(8936002)(316002)(2906002)(186003)(478600001)(44832011)(26005)(55016002)(9686003)(54906003)(53546011)(99286004)(476003)(4744005)(11346002)(6246003)(446003)(486006)(81156014)(66556008)(66476007)(66946007)(74316002)(86362001)(25786009)(305945005)(81166006)(33656002)(7696005)(6506007)(5660300002)(66066001)(14454004)(71200400001)(6916009)(71190400001)(6436002)(8676002)(76116006)(256004)(3846002)(66446008)(64756008)(229853002)(102836004)(6116002)(52536014)(4326008);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3302;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: l7EbtkIQiT1R8IlE7UcErjEgvYktewSPn7VfDR4i1crrJnsyhER1KN7bDzefgfOowjbDsKF+DUMUY/DARtlOfK+UlwOoFaZ4dRIIZXEQEFLcBO1utmX+NNMJBnqzyf/IF49azzVjOJ0qNLUQ4gYBghG1QfsDsnaNY67JtIkyJmHdPbnCO6xfBVe49uPnZIGCTZOgWtjGkA+I9Fw6kEF4ZizwR4qr1YdywRjq0K+kxwpwAZFqFtOfkojOz55Cfm72rwK+PiFMqrlMlX2rinTNVTteK9vQQt951MyFfpeLTPxByEKsY8Jw4KHAqcyQSmOly/oOfJ5MCaGzfgn33Ve47W7zwEVmv/tYlLg7a1VDkH2ZmDDjJcwrN2kE3VUGCht/gMM8ZIubwtIOrT9x41bMjMb2pfnV+691EevarSRRM8o=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46875774-3406-4ecd-aa0c-08d7427fdb02
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 12:48:39.5910
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HpTc2XSQOf7YkqqUaw+jHg8WaWVukiLzkU60JqzXRDxSIdysodyHIKMlgH0rC1a0LaWcrzF3gxS8XNi7zTePjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3302
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0hdIGR0LWJpbmRpbmdzOiBpMmM6IHJjYXI6IEFkZCByOGE3NzRiMSBzdXBwb3J0DQo+IA0K
PiBPbiBUdWUsIFNlcCAyNCwgMjAxOSBhdCA5OjMzIEFNIEJpanUgRGFzIDxiaWp1LmRhc0BicC5y
ZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gRG9jdW1lbnQgUlovRzJOIChSOEE3NzRCMSkgSTJDIGNv
bXBhdGliaWxpdHkgd2l0aCB0aGUgcmVsZXZhbnQgZHJpdmVyDQo+ID4gZHQtYmluZGluZ3MuDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXNAYnAucmVuZXNhcy5jb20+
DQo+IA0KPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGds
aWRlci5iZT4NCj4gDQo+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMv
aTJjLXJjYXIudHh0IHwgMSArDQo+IA0KPiBCVFcsIHRoaXMgZmlsZSBoYXMgYmVlbiByZW5hbWVk
IHRvDQo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvcmVuZXNhcyxpMmMu
dHh0DQoNCk9LLiBXaWxsIHNlbmQgVjIgd2l0aCB0aGUgYWJvdmUgZmlsZSBjaGFuZ2UuDQoNClJl
Z2FyZHMsDQpCaWp1DQo=

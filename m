Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D3B1FD66
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2019 18:03:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726053AbfD3QDn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Apr 2019 12:03:43 -0400
Received: from mail-eopbgr1400121.outbound.protection.outlook.com ([40.107.140.121]:2272
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726048AbfD3QDn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 30 Apr 2019 12:03:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WL910Zm3vbAVF4hEiB9Gn9Auqa/HBef4dYo8tgno/h0=;
 b=NAKsiPdl7XAGlMJLzQYfjRzY7WHjUibfXE756k4JeagvFS7iZOqijvKwiLPdfNg5v5Vf6fZOQp08T3nyT+66x1wVfGKJrMmcHfGcmh3A81QJI5EmvU9Sd4aABYhq8/U+mr4lVssO3uCt8eQQ6JnMfX2iEfmI/8feUSv780JqLZ0=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.163.12) by
 TY1PR01MB1738.jpnprd01.prod.outlook.com (52.133.162.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Tue, 30 Apr 2019 16:03:39 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0%5]) with mapi id 15.20.1835.018; Tue, 30 Apr 2019
 16:03:39 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 6/7] ARM: dts: r7s9210-rza2mevb: Add Ethernet support
Thread-Topic: [PATCH 6/7] ARM: dts: r7s9210-rza2mevb: Add Ethernet support
Thread-Index: AQHU/1fmL3U0ISDuWUqmKHJ9vTOOFKZU0jaAgAAI7RA=
Date:   Tue, 30 Apr 2019 16:03:39 +0000
Message-ID: <TY1PR01MB156277831BBAD3BF0E0EE52D8A3A0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190430132309.12473-1-chris.brandt@renesas.com>
 <20190430132309.12473-7-chris.brandt@renesas.com>
 <CAMuHMdWzN_1XmO8w_otDseJ+bxk+AKNouk-ycPPyM2XWMWritQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWzN_1XmO8w_otDseJ+bxk+AKNouk-ycPPyM2XWMWritQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b73dc88-d31b-4dda-6bba-08d6cd85691c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1738;
x-ms-traffictypediagnostic: TY1PR01MB1738:
x-microsoft-antispam-prvs: <TY1PR01MB1738A5433FFEA7C9C50BEC038A3A0@TY1PR01MB1738.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(39860400002)(346002)(136003)(376002)(396003)(189003)(199004)(6246003)(7696005)(102836004)(14454004)(229853002)(55016002)(68736007)(9686003)(3846002)(6506007)(305945005)(8676002)(72206003)(6116002)(4744005)(53936002)(4326008)(7736002)(25786009)(2906002)(52536014)(316002)(54906003)(33656002)(26005)(6916009)(81156014)(8936002)(11346002)(446003)(73956011)(66066001)(478600001)(66946007)(76116006)(76176011)(66556008)(71200400001)(256004)(66476007)(64756008)(66446008)(99286004)(6436002)(486006)(186003)(74316002)(5660300002)(81166006)(476003)(71190400001)(97736004)(86362001);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1738;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tU37aG7YWDXoA7U0ZCvi+VQ1w5539fF7xLzbKf4vHYHmOyeWwzsi6j5GKlq64HLt4i93GycMJsnTZO7wmDDcyNQBadxRnoms0jpKx4laKBIF8kyO/FNcr7OGLzAhG61sxo3nPyjGkx2dmRoG1ShxmcEjJchHQYzSAIRkJHO9HeB/yudF0BSS7aVaWZvCB3zpFZ9SZR8FeSW+IvAWNvT13sh35X15eqFeM4H3iDu2FieGkeiPUrREHIpjM9nj3GiC8+SS6NggcbR4kUy2e5SQ85DWLADqvBIvQ/FBde7gRUMU9q1vNFOb0my5rv1yDFBEKft3TkXq0DZ8XukH0FHRM0qsJdlp8jyNsTc9Cm8YsgN/ZwrN/5vwBjPajcUZ7J3BtFoP68MfgZYudPbwkHHmsmCDwusYSzxzi9UgGzca5mU=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b73dc88-d31b-4dda-6bba-08d6cd85691c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 16:03:39.5197
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1738
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgR2VlcnQsDQoNCk9uIFR1ZSwgQXByIDMwLCAyMDE5IDEsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3
cm90ZToNCj4gUGVyaGFwcyB5b3Ugd2FudCB0byBhZGQgYW4gImV0aGVybmV0MCIgYWxpYXMsIHNv
IFUtQm9vdCBjYW4gZmluZCB0aGUNCj4gZGV2aWNlLW5vZGUgYW5kIGFkZCBhbiBhcHByb3ByaWF0
ZSAibG9jYWwtbWFjLWFkZHJlc3MiIHByb3BlcnR5Pw0KDQpTaW5jZSBJIGhhdmUgMiBFdGhlcm5l
dHMsIHdvdWxkIHlvdXIgcmVjb21tZW5kYXRpb24gYmUgSSBhZGQgYW4gYWxpYXMgZm9yDQplYWNo
Pw0KDQpIb25lc3RseSwgSSd2ZSBuZXZlciBkb25lIGl0IHRoYXQgd2F5LiBJdCBoYXMgYWx3YXlz
IGJlZW4gdGhhdCB1LWJvb3QgDQpwcmVsb2FkcyB0aGUgTUFDIGFkZHJlc3MgcmVnaXN0ZXJzIGFu
ZCB0aGVuIHRoZSBzaF9ldGggZHJpdmVyIGp1c3QgdXNlcyANCndoYXQncyBhbHJlYWR5IGxvYWRl
ZC4NCkJ1dCwgaWYgdXNpbmcgRFQgaXMgdGhlIG1vcmUgcmVjb21tZW5kZWQgbWV0aG9kLCBJIGNh
biBtaWdyYXRlIHRvd2FyZHMNCnRoYXQuDQoNClRoYW5rcywNCkNocmlzDQoNCg==

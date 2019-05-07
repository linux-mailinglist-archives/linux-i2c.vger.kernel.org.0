Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C39016099
	for <lists+linux-i2c@lfdr.de>; Tue,  7 May 2019 11:17:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726522AbfEGJRn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 May 2019 05:17:43 -0400
Received: from mail-eopbgr10131.outbound.protection.outlook.com ([40.107.1.131]:21253
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726607AbfEGJRn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 May 2019 05:17:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xRPiGxR2SFsjMcx5LRpqB/hjoOxiQsglEUtFXdxcb4=;
 b=rI22+WbJgtVBPAsp40G8scs90i4oV3o8Gev8ags4WrXt/87/vfe6wCFPobRxKgkTLHgLC5TvNsX3KuL3Hx/9LjhoOCRYSBuoIPwROx7ZVtOh3nDb131XwuRQuxUUgJczjnyxQ1UjjY+v86p75+m/CgJDiDXoKgHP99Pbi6CxBa4=
Received: from AM0PR02MB4563.eurprd02.prod.outlook.com (20.178.17.97) by
 AM0PR02MB4945.eurprd02.prod.outlook.com (20.178.82.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Tue, 7 May 2019 09:17:38 +0000
Received: from AM0PR02MB4563.eurprd02.prod.outlook.com
 ([fe80::59ed:e49a:eab8:168f]) by AM0PR02MB4563.eurprd02.prod.outlook.com
 ([fe80::59ed:e49a:eab8:168f%3]) with mapi id 15.20.1856.012; Tue, 7 May 2019
 09:17:38 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Serge Semin <fancer.lancer@gmail.com>,
        Peter Korsgaard <peter.korsgaard@barco.com>
CC:     Serge Semin <Sergey.Semin@t-platforms.ru>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] i2c-mux-gpio: Split plat- and dt-specific code up
Thread-Topic: [PATCH v2 0/3] i2c-mux-gpio: Split plat- and dt-specific code up
Thread-Index: AQHU+72aZ5zENFrBHEyfsmLiopyjOKZfb6IAgAAETIA=
Date:   Tue, 7 May 2019 09:17:38 +0000
Message-ID: <689e1a7b-8544-6bbf-2fa1-a5845895a917@axentia.se>
References: <20190424123414.25311-1-fancer.lancer@gmail.com>
 <20190425232028.9333-1-fancer.lancer@gmail.com>
 <20190507090210.hn6vgcjg2q6tysbp@mobilestation>
In-Reply-To: <20190507090210.hn6vgcjg2q6tysbp@mobilestation>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1P18901CA0006.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:3:8b::16) To AM0PR02MB4563.eurprd02.prod.outlook.com
 (2603:10a6:208:ec::33)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b22686ab-d88d-43a6-b739-08d6d2ccd93e
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:AM0PR02MB4945;
x-ms-traffictypediagnostic: AM0PR02MB4945:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <AM0PR02MB49452F4E63A35700CD337073BC310@AM0PR02MB4945.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0030839EEE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(376002)(346002)(39830400003)(366004)(396003)(189003)(199004)(51914003)(3846002)(53936002)(446003)(11346002)(4326008)(305945005)(66066001)(6246003)(68736007)(65806001)(2906002)(65956001)(102836004)(508600001)(476003)(65826007)(36756003)(64126003)(74482002)(14444005)(256004)(2616005)(31686004)(486006)(5660300002)(99286004)(6486002)(6436002)(7736002)(186003)(52116002)(25786009)(229853002)(53546011)(6506007)(966005)(81156014)(81166006)(386003)(8676002)(8936002)(26005)(6116002)(71200400001)(71190400001)(58126008)(110136005)(54906003)(316002)(73956011)(66946007)(66446008)(66556008)(66476007)(64756008)(31696002)(14454004)(6306002)(86362001)(6512007)(76176011);DIR:OUT;SFP:1102;SCL:1;SRVR:AM0PR02MB4945;H:AM0PR02MB4563.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gq6lCpl54+Ax0PkM7MW4DVja6cOCwQgg70AvYaGHJS3UvHuVtAefaa4SsuXcRfd5qe1RALc9XPtmfWVqw48Kj4ANWNRs+IXeQyueAlUEzQvIDVLPxSPSIYvO51ovaAnHJHsX4+8LCcBmtYv30cwifoA1Mon+MHLZfpwUqn3bfODv714BobdjB6cCTSFn8MGlu69l1/Tv8Y0rmJ4oQcC7kOzgdez/yz+Rq+Tj6WZMH1s33GWfnnixWvZCLaca1YDdobP2Eqlk44QZyRGF8dy5i9VlmvUHQqT6MS2g/FuxbPJGaCjOaacfmcH6Cb7oW8jJaSM7Nm7D1iTugAAaCjWWrZRD+fMFPm0xf0RTUvcon+EU0AY2AkhtNk6UXoXOEJMHyNTctedP+fv9TwZfA5GeTYw0kBwLeFVvscBIz6KQma0=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CEFCC296A803D44186FE37F4BF1C9B9C@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: b22686ab-d88d-43a6-b739-08d6d2ccd93e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2019 09:17:38.2499
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB4945
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0wNS0wNyAxMTowMiwgU2VyZ2UgU2VtaW4gd3JvdGU6DQo+IEhlbGxvIGZvbGtzLA0K
PiANCj4gQW55IHVwZGF0ZXMgb24gdGhpcyBwYXRjaHNldCBzdGF0dXM/IEkgaGF2ZW4ndCBnb3Qg
YW55IGNvbW1lbnQgb24gdjIsIGJ1dA0KPiBpbnN0ZWFkIGEgbm90aWZpY2F0aW9uIGFib3V0IHRo
ZSBzdGF0dXMgY2hhbmdlIHdhcyBzZW50IHRvIG1lOg0KPiANCj4+ICogbGludXgtaTJjOiBbdjIs
MS8zXSBpMmMtbXV4LWdwaW86IFVucGluIGEgcGxhdGZvcm0tYmFzZWQgZGV2aWNlIGluaXRpYWxp
emF0aW9uDQo+PiAgICAgLSBodHRwOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcGF0Y2gvMTA5MTEy
MC8NCj4+ICAgICAtIGZvcjogTGludXggSTJDIGRldmVsb3BtZW50DQo+PiAgICB3YXM6IE5ldw0K
Pj4gICAgbm93OiBTdXBlcnNlZGVkDQo+Pg0KPj4gKiBsaW51eC1pMmM6IFt2MiwyLzNdIGkyYy1t
dXgtZ3BpbzogVW5waW4gdGhlIHBsYXRmb3JtLXNwZWNpZmljIEdQSU9zIHJlcXVlc3QgY29kZQ0K
Pj4gICAgIC0gaHR0cDovL3BhdGNod29yay5vemxhYnMub3JnL3BhdGNoLzEwOTExMjIvDQo+PiAg
ICAgLSBmb3I6IExpbnV4IEkyQyBkZXZlbG9wbWVudA0KPj4gICAgd2FzOiBOZXcNCj4+ICAgIG5v
dzogU3VwZXJzZWRlZA0KPj4NCj4+ICogbGludXgtaTJjOiBbdjIsMy8zXSBpMmMtbXV4LWdwaW86
IENyZWF0ZSBvZi1iYXNlZCBHUElPcyByZXF1ZXN0IG1ldGhvZA0KPj4gICAgIC0gaHR0cDovL3Bh
dGNod29yay5vemxhYnMub3JnL3BhdGNoLzEwOTExMjEvDQo+PiAgICAgLSBmb3I6IExpbnV4IEky
QyBkZXZlbG9wbWVudA0KPj4gICAgd2FzOiBOZXcNCj4+ICAgIG5vdzogU3VwZXJzZWRlZA0KPiAN
Cj4gSSBtYXkgbWlzdW5kZXJzdGFuZCBzb21ldGhpbmcsIGJ1dCBob3cgY29tZSB0aGUgdjIgcGF0
Y2hzZXQgc3dpdGNoZWQgdG8gYmUgc3VwZXJzZWRlZA0KPiB3aGlsZSBpdCBpcyB0aGUgbGFzdCBw
YXRjaHNldCB2ZXJzaW9uIEkndmUgc2VudD8NCg0KVGhhdCB3YXMgbXkgbWlzdGFrZS4gUGF0Y2h3
b3JrIGdvdCBjb25mdXNlZCB3aGVuIHYyIHdhcyBzZW50IGFzIGEgcmVwbHkgdG8NCnNvbWV0aGlu
ZyBpbiB0aGUgdjEgdHJlZSwgYW5kIG1hcmtlZCBhbGwgOCBwYXRjaGVzIGFzICJ2MiIuIFRoZW4g
SSBpbiB0dXJuDQpnb3QgY29uZnVzZWQgYnkgdGhhdCwgYW5kIGNoYW5nZWQgc3RhdHVzIG9uIHRo
ZSB3cm9uZyBzZXQuIFNvcnJ5IQ0KDQpTbywgdGhhbmtzIGZvciB0aGUgaGVhZHMgdXAsIGl0IHNo
b3VsZCBiZSBmaXhlZCBub3cuDQoNCkFzIGZvciBjb21tZW50cyBvbiB0aGUgcGF0Y2hlcywgSSdt
IHBlcnNvbmFsbHkgYnVyaWVkIGluIHdvcmsgYW5kIG90aGVycw0KbWF5IGhhdmUgdGhlIG1lcmdl
IHdpbmRvdyB0byBmb2N1cyBvbi4uLg0KDQpDaGVlcnMsDQpQZXRlcg0K

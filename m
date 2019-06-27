Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27DFE5838C
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2019 15:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726786AbfF0Nbq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Jun 2019 09:31:46 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:49382 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726498AbfF0Nbq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Jun 2019 09:31:46 -0400
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.63,423,1557212400"; 
   d="scan'208";a="37590056"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jun 2019 06:31:45 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex01.mchp-main.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 27 Jun 2019 06:31:40 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 27 Jun 2019 06:31:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvkkDxd7qua1jKxbqrbV5M/smHOB7b/4ya5cpeUvVJc=;
 b=Z7dFU7HL32HK4PfMOB21N4rRyPfAAjnP6ulSpv8SVeGJ3AKoghtTjsC89FBfl5WpFSzZa3+tZx4vw6KuMVQZgJG1iEu/wHbfshPn5+/amF3evEsNrDE2nZhEF4CCYaD7T8DoVururtixArya2FqS1R1o/H/X9vnMVlTwW4ik594=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1291.namprd11.prod.outlook.com (10.168.108.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Thu, 27 Jun 2019 13:31:39 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::6476:ace0:bf3a:322]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::6476:ace0:bf3a:322%9]) with mapi id 15.20.2008.018; Thu, 27 Jun 2019
 13:31:39 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <alexandre.belloni@bootlin.com>, <wsa@the-dreams.de>
CC:     <peda@axentia.se>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <Nicolas.Ferre@microchip.com>, <Ludovic.Desroches@microchip.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <pierre-yves.mordret@st.com>
Subject: Re: I2C filtering (was Re: [PATCH v2 6/9] dt-bindings: i2c: at91: add
 binding for enable-ana-filt)
Thread-Topic: I2C filtering (was Re: [PATCH v2 6/9] dt-bindings: i2c: at91:
 add binding for enable-ana-filt)
Thread-Index: AQHVKzw4jzAkF3hUn0CaRzOhl90Jh6avgCEAgAABogA=
Date:   Thu, 27 Jun 2019 13:31:39 +0000
Message-ID: <eb2d87b7-437c-53ee-a1ca-37c4d3fadea6@microchip.com>
References: <1561449642-26956-1-git-send-email-eugen.hristev@microchip.com>
 <1561449642-26956-7-git-send-email-eugen.hristev@microchip.com>
 <4e81d3c9-25f3-ca6e-f2d5-17fad5905bb8@axentia.se>
 <84628b5e-bea7-7d91-f790-f3a2650040fa@microchip.com>
 <20190625093156.GF5690@piout.net> <20190625095533.GC1688@kunai>
 <20190627132200.GK3692@piout.net>
In-Reply-To: <20190627132200.GK3692@piout.net>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR09CA0102.eurprd09.prod.outlook.com
 (2603:10a6:803:78::25) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190627162750239
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e86efaf9-7aeb-4ede-285f-08d6fb03c8bc
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1291;
x-ms-traffictypediagnostic: DM5PR11MB1291:
x-microsoft-antispam-prvs: <DM5PR11MB12912B60821954FD8EABBAD5E8FD0@DM5PR11MB1291.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 008184426E
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(366004)(346002)(136003)(39860400002)(396003)(199004)(189003)(53936002)(66446008)(66946007)(73956011)(2906002)(14444005)(256004)(305945005)(81166006)(478600001)(66476007)(64756008)(66556008)(6512007)(66066001)(476003)(486006)(186003)(36756003)(81156014)(14454004)(2616005)(229853002)(8676002)(11346002)(446003)(3846002)(72206003)(6116002)(7736002)(31696002)(102836004)(26005)(8936002)(6486002)(54906003)(110136005)(6506007)(53546011)(386003)(7416002)(6246003)(5660300002)(76176011)(99286004)(68736007)(86362001)(52116002)(31686004)(6436002)(25786009)(71200400001)(71190400001)(316002)(4326008);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1291;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2LE75PUXJdyykuNYTbjJAMwX6uENZmVBD7cTEJSO8x1eWvYGYc3lHXm03jaaskM/6AuIxgdSk6p3NSRkvWrED/r5WKKlz0mlppWX1dBe/izfrp3JBZNeIEgkHAJiw6sjdLgIpJ+X8B4ew0LJJ9jBU3b9KvK2DfRduPOj0kKdGwppWmi2gjtZ9EnBhe4QWVuScTGDHIczLonmb4XhUEjH9cveUBDxcL7F+KXaERqnePEW+BxZTRAfObUsA+WTwlGoVh0dvm6gf2qW2oJTIhnGqo8eoJkjG81kxvvvJUZXGw+rHug1YifmraroK6TeiXfmuDXGr4Ncw06UCauEyPXQQWEQ/nC4+qAFYoHzJc24R0KnTp27En65nkf8EjpX6QSKgRxYxnhQPjaW6MyiFkmcojRHLAsIM46x0Kb6nW7BR+M=
Content-Type: text/plain; charset="utf-8"
Content-ID: <20927CEDF033F540A4940D155C88D127@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e86efaf9-7aeb-4ede-285f-08d6fb03c8bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2019 13:31:39.3694
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eugen.hristev@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1291
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCk9uIDI3LjA2LjIwMTkgMTY6MjIsIEFsZXhhbmRyZSBCZWxsb25pIHdyb3RlOg0KPiBFeHRl
cm5hbCBFLU1haWwNCj4gDQo+IA0KPiBPbiAyNS8wNi8yMDE5IDExOjU1OjMzKzAyMDAsIFdvbGZy
YW0gU2FuZyB3cm90ZToNCj4+IE9uIFR1ZSwgSnVuIDI1LCAyMDE5IGF0IDExOjMxOjU2QU0gKzAy
MDAsIEFsZXhhbmRyZSBCZWxsb25pIHdyb3RlOg0KPj4+IE9uIDI1LzA2LzIwMTkgMDk6MTQ6MTMr
MDAwMCwgRXVnZW4uSHJpc3RldkBtaWNyb2NoaXAuY29tIHdyb3RlOg0KPj4+Pj4gUGVyaGFwcw0K
Pj4+Pj4NCj4+Pj4+IAltaWNyb2NoaXAsZGlnaXRhbC1maWx0ZXI7DQo+Pj4+PiAJbWljcm9jaGlw
LGFuYWxvZy1maWx0ZXI7DQo+Pj4+Pg0KPj4+Pj4gPw0KPj4+Pg0KPj4+PiBIaSBQZXRlciwNCj4+
Pj4NCj4+Pj4gVGhhbmtzIGZvciByZXZpZXdpbmcuIFRoZSBuYW1lIG9mIHRoZSBwcm9wZXJ0eSBk
b2VzIG5vdCBtYXR0ZXIgbXVjaCB0bw0KPj4+PiBtZSwgYW5kIHdlIGhhdmUgcHJvcGVydGllcyBw
cmVmaXhlZCB3aXRoIHZlbmRvciwgYW5kIHNvbWUgYXJlIG5vdC4NCj4+Pj4NCj4+Pj4gQEFsZXhh
bmRyZSBCZWxsb25pOiB3aGljaCBuYW1lIHlvdSB0aGluayBpdCdzIGJlc3QgPw0KPj4+Pg0KPj4+
DQo+Pj4gSSdtIG5vdCBzdXJlLCBpdCBkZXBlbmRzIG9uIHdoZXRoZXIgV29sZnJhbSB0aGlua3Mg
aXQgaXMgZ2VuZXJpYyBlbm91Z2gNCj4+PiB0byBiZSB1c2VkIHdpdGhvdXQgYSB2ZW5kb3IgcHJl
Zml4Lg0KPj4NCj4+IEkgY291bGQgaW1hZ2luZSB0aGF0IHdlIGRlc2lnbiBhIGdlbmVyaWMgcHJv
cGVydHkgZm9yIGZpbHRlcnMuIFRoZSBvbmVzDQo+PiBhYm92ZSBtYWtlIG1lIHdvbmRlciwgdGhv
dWdoLCBiZWNhdXNlIHRoZXkgYXJlIGJvb2wuIEknZCB0aGluayB5b3UgY2FuDQo+PiBjb25maWd1
cmUgdGhlIGZpbHRlcnMgaW4gc29tZSB3YXksIHRvbz8NCj4+DQo+IA0KPiBBcGFydCBmcm9tIGVu
YWJsaW5nIHRoZSBmaWx0ZXIgdGhlcmUgaXMgaW5kZWVkIG9uZSBjb25maWd1cmF0aW9uDQo+IHNl
dHRpbmcsIHRoZSBtYXhpbXVtIHB1bHNlIHdpZHRoIG9mIHNwaWtlcyB0byBiZSBzdXBwcmVzc2Vk
IGJ5IHRoZSBpbnB1dA0KPiBmaWx0ZXIuDQoNCkhlbGxvLA0KDQpUaGlzIGlzIGEgbnVtYmVyIDAg
dG8gNyAoMyBiaXRzKSB0aGF0IHJlcHJlc2VudHMgdGhlIHdpZHRoIG9mIHRoZSBzcGlrZSANCmlu
IHBlcmlwaCBjbG9jayBjeWNsZXMuDQpJIGFtIGxvb2tpbmcgdG8gc2VlIHdoYXQgaXMgUEFERkNG
RyAsIGFzIGl0J3MgcmVsYXRlZCB0byB0aGUgUEFEIGFuYWxvZyANCmZpbHRlciBjb25maWd1cmF0
aW9uLiBJdCBtYXkgYmUgdW51c2VkIGJ5IHRoZSBmaWx0ZXIuDQoNCkV1Z2VuDQoNCj4gDQo+PiBJ
IG5ldmVyIHVzZWQgc3VjaCBmaWx0ZXJpbmcsIHNvIEkgYW0gdW5hd2FyZSBvZiB0aGUgcGFyYW1l
dGVycyBuZWVkZWQgLw0KPj4gc3VpdGFibGUuIFF1aWNrIGdyZXBwaW5nIHRocm91Z2ggSTJDIG1h
c3RlciBkcml2ZXJzIHJldmVhbHMgdGhhdA0KPj4gaTJjLXN0bTMyZjcuYyBhbHNvIGhhbmRsZXMg
ZmlsdGVycywgYnV0IG9ubHkgd2l0aCBkZWZhdWx0IHZhbHVlcy4gTWF5YmUNCj4+IERUIGNvbmZp
Z3VyYXRpb24gd291bGQgYmUgYmVuZWZpdGlhbCB0byB0aGF0IGRyaXZlciwgdG9vPw0KPj4NCj4+
IEFkZGluZyBzb21lIHBlb3BsZSB0byBDQy4NCj4+DQo+IA0KPiANCj4gDQo=

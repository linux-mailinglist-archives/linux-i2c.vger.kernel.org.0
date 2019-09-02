Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E2EDA58F7
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2019 16:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730562AbfIBOPS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Sep 2019 10:15:18 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:16836 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729865AbfIBOPR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Sep 2019 10:15:17 -0400
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: wBMextQzhoTXQaj4j8sKJYMIkISTNixH4QYgsYgoUkQsfVyyC6X+fi2dc4o5QCTnquAjeXAXiW
 qCGIVAfR0HJ1bpr9pnxpf2wLXNOOlbBQh0iZYUbvdWDipr+X5UEXVk+/klWGKJ5cZkaSHWh40b
 1QRHMh9K+jrEKGpRHc99yCztJRyxDR5W+RsP7hMkzonN8eeQT8iM4xk65QTDAVFVyYgMQmfwWH
 vAdgrnNLpbcY5e6PnJ0ofMmLRK8W3O5dN3ixfCYsQydrVyz4CejmTtKYdLeDZ2LjqizbamKBVx
 5vI=
X-IronPort-AV: E=Sophos;i="5.64,459,1559545200"; 
   d="scan'208";a="47496630"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Sep 2019 07:15:16 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 2 Sep 2019 07:15:15 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 2 Sep 2019 07:15:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9fpHh+WgAlmQmSFWx9nkeBjxPYDe0CLuC7xxJ2bkBRAEpdzgwHAPiaF0WlL8qPZw4ngVge1OMKQRcsFebhxOQzmx8kUOamDKVjd0SztVTLN3HZmInypo3yAeQfV8d/0BIqmR+ueyyTHwcB89wI1W/aG1caRIGZ9lwi8zuzipkr7ROg5XWzHNeGe6owzhcNw6Na/skU8sqhD4N2bZfuvcPw5+9jI6jI7qT+8cKA3tRHDot3LQh1h4mZVbTWAhswmRb7gWeglcwMae2DoK1D64Mjpiqk2LirKQ+QvR8cMHuXNoQ+o+HKQVutQ+C1cPz4xemQtwytoq6w/HDA6gfY3zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gJk+ykZQp1g9XN8+ufvhyyihfLA51y34YLzRHtS918g=;
 b=DbaWicZc3M5FGBcTffVOhXMrreuJ/YbRCf85a1me4PyryqoN/9RmnC3sOdcIAxOGopHfuQNaW4AEQtHdQdcB0r/GA1Bo8PO3M73d8wGesEhMbEq36RBukz/nQI8ldLFqvFN4X8QvwiHk9oCNMdasJXy40UVWrgnjCv0l7XQrDkwz73WxmMilab9kNk+tVMqlSCDszvabh1J7yxHSqByQBm+ZRUhxPjIt+i9sPOCySqQfPAhyjNTyzxYtyKBV1t/zkPA7T2HrGA9VvQY5xK9P7hWNVPDPx7lF3b9BTVkhrs5YEgbi8wg0egfuTjehB1TjBqTCrUGljj+66SkMYtNcsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gJk+ykZQp1g9XN8+ufvhyyihfLA51y34YLzRHtS918g=;
 b=q0o8R0o1RpHI5V060ytVKJkWt6FUTWyce3N0gLgkUeaA6BTijffWn068kY6rcmODZkzvIJ78NHMHF+sf986YOoXoNu6J1y70wC9+/eJjFkOBM5soTX4NQ29juJgP2xZS5aAQMpJgI3i4l+BfJuzyzfzn1AhN36Kr0UKkNDUjeKU=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1644.namprd11.prod.outlook.com (10.172.38.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Mon, 2 Sep 2019 14:15:14 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::c457:dc57:6e6f:f4f3]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::c457:dc57:6e6f:f4f3%10]) with mapi id 15.20.2220.022; Mon, 2 Sep 2019
 14:15:14 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <peda@axentia.se>, <wsa@the-dreams.de>, <mark.rutland@arm.com>,
        <Ludovic.Desroches@microchip.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <pierre-yves.mordret@st.com>,
        <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>
Subject: Re: [PATCH v4 2/9] dt-bindings: i2c: add bindings for i2c analog and
 digital filter
Thread-Topic: [PATCH v4 2/9] dt-bindings: i2c: add bindings for i2c analog and
 digital filter
Thread-Index: AQHVYXbctVkeTzhRG0edAs7kSbS9TqcYNSkAgAA4B4A=
Date:   Mon, 2 Sep 2019 14:15:14 +0000
Message-ID: <b6528812-65d3-6561-38e7-c0545af900d8@microchip.com>
References: <1567418773-2427-1-git-send-email-eugen.hristev@microchip.com>
 <1567418773-2427-3-git-send-email-eugen.hristev@microchip.com>
 <9a9c209c-2fb8-0a4c-4e0a-b04fefda3360@axentia.se>
In-Reply-To: <9a9c209c-2fb8-0a4c-4e0a-b04fefda3360@axentia.se>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0701CA0069.eurprd07.prod.outlook.com
 (2603:10a6:800:5f::31) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190902170939569
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e0817322-2242-4de2-6d74-08d72faff8f8
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1644;
x-ms-traffictypediagnostic: DM5PR11MB1644:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB1644FF6E03968D0109FA8C0CE8BE0@DM5PR11MB1644.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01480965DA
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(396003)(376002)(39860400002)(136003)(366004)(189003)(199004)(8676002)(81166006)(81156014)(99286004)(36756003)(6512007)(316002)(53936002)(6116002)(186003)(26005)(3846002)(14454004)(386003)(2906002)(6246003)(31686004)(66066001)(6306002)(102836004)(966005)(478600001)(6436002)(110136005)(52116002)(6486002)(76176011)(256004)(66946007)(66476007)(71200400001)(2201001)(86362001)(6506007)(53546011)(305945005)(31696002)(229853002)(2501003)(2616005)(11346002)(64756008)(7416002)(5660300002)(486006)(476003)(66446008)(446003)(8936002)(66556008)(25786009)(7736002)(71190400001)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1644;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OlNg78jJzGsG8fyFFTdgbdQ1NgsXya3eJRPCDQI9KKO5MLq2b9EtlwzPWOC6Yb52v7Wkrtd+OZ7NhFHEb/oXFYlYByc2Un4SpMUugZc3U2+oAiILXGtRKwDg8u+R9XJVALx3zfEaGyC+yI2+7LxnLLjFNd5DBvJR6N2ISkgN/QTn188gA/ruz/Lp9vx9hQFNnGf36YWO/KG0xkGuhYwE3tDe1U6TN5LpnzHCKpm1P4jHDQwC91ihs0lxvnq1V/uGZ8Xr6IUP/3y3bQ80G7NaX9ScMUpjV49Qg3ajR3s86yRxN9/vLQmIiMA5znCWh+t0W6BtpRfMkd3eM9qOwcivSyVszsJbZdBVoePzI1BZuhACYh7S094LqUqubiusD3d48Ydwq503SWAvyLTq/05RndWlJFbeoJ8NCrzLSMf9wU8=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C58BCC47709F1E44BDF4A390A7880894@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e0817322-2242-4de2-6d74-08d72faff8f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2019 14:15:14.1316
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wpZ19MZ1TBmbjN5A29U9bknJz2dE9hZDHivk0+3yseLWC0pDB5DlkJ1OLSogwD3DypEbqFZEaqixNcapb+EPhguuCiDP9IzFQc5lgEb6ToQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1644
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCk9uIDAyLjA5LjIwMTkgMTM6NDksIFBldGVyIFJvc2luIHdyb3RlOg0KDQo+IE9uIDIwMTkt
MDktMDIgMTI6MTIsIEV1Z2VuLkhyaXN0ZXZAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+IEZyb206
IEV1Z2VuIEhyaXN0ZXYgPGV1Z2VuLmhyaXN0ZXZAbWljcm9jaGlwLmNvbT4NCj4+DQo+PiBTb21l
IGkyYyBjb250cm9sbGVycyBoYXZlIGEgYnVpbHQtaW4gZGlnaXRhbCBvciBhbmFsb2cgZmlsdGVy
Lg0KPj4gVGhpcyBpcyBzcGVjaWZpY2FsbHkgcmVxdWlyZWQgZGVwZW5kaW5nIG9uIHRoZSBoYXJk
d2FyZSBQQ0IvYm9hcmQuDQo+PiBTb21lIGNvbnRyb2xsZXJzIGFsc28gYWxsb3cgc3BlY2lmeWlu
ZyB0aGUgbWF4aW11bSB3aWR0aCBvZiB0aGUNCj4+IHNwaWtlcyB0aGF0IGNhbiBiZSBmaWx0ZXJl
ZC4gVGhlIHdpZHRoIGxlbmd0aCBjYW4gYmUgc3BlY2lmaWVkIGluIG5hbm9zZWNvbmRzLg0KPj4N
Cj4+IFNpZ25lZC1vZmYtYnk6IEV1Z2VuIEhyaXN0ZXYgPGV1Z2VuLmhyaXN0ZXZAbWljcm9jaGlw
LmNvbT4NCj4+IC0tLQ0KPj4gICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJj
L2kyYy50eHQgfCAxMSArKysrKysrKysrKw0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0
aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvaTJjL2kyYy50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJj
L2kyYy50eHQNCj4+IGluZGV4IDQ0ZWZhZmQuLjhkYmZmNjcgMTAwNjQ0DQo+PiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy50eHQNCj4+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJjLnR4dA0KPj4gQEAgLTU1LDYgKzU1
LDE3IEBAIHdhbnRzIHRvIHN1cHBvcnQgb25lIG9mIHRoZSBiZWxvdyBmZWF0dXJlcywgaXQgc2hv
dWxkIGFkYXB0IHRoZSBiaW5kaW5ncyBiZWxvdy4NCj4+ICAgCU51bWJlciBvZiBuYW5vc2Vjb25k
cyB0aGUgU0RBIHNpZ25hbCB0YWtlcyB0byBmYWxsOyB0KGYpIGluIHRoZSBJMkMNCj4+ICAgCXNw
ZWNpZmljYXRpb24uDQo+PiAgIA0KPj4gKy0gaTJjLWFuYWxvZy1maWx0ZXINCj4+ICsJRW5hYmxl
IGFuYWxvZyBmaWx0ZXIgZm9yIGkyYyBsaW5lcy4NCj4+ICsNCj4+ICstIGkyYy1kaWdpdGFsLWZp
bHRlcg0KPj4gKwlFbmFibGUgZGlnaXRhbCBmaWx0ZXIgZm9yIGkyYyBsaW5lcy4NCj4+ICsNCj4+
ICstIGkyYy1maWx0ZXItd2lkdGgtbnMNCj4+ICsJV2lkdGggb2Ygc3Bpa2VzIHdoaWNoIGNhbiBi
ZSBmaWx0ZXJlZCBieSBlaXRoZXIgZGlnaXRhbCBvciBhbmFsb2cNCj4+ICsJZmlsdGVycyAoaTJj
LWFuYWxvZy1maWx0ciBvciBpMmMtZGlnaXRhbC1maWx0cikuIFRoaXMgd2lkdGggaXMgc3BlY2lm
aWVkDQo+IA0KPiBmaWx0ciAtPiBmaWx0ZXIgKHR3byBpbnN0YW5jZXMpDQo+IA0KPiBXaGF0IGlm
IHlvdSB3YW50L25lZWQgdG8gaGF2ZSBkaWZmZXJlbnQgYmFuZHdpZHRoIGZvciB0aGUgZGlnaXRh
bCBhbmQgYW5hbG9nDQo+IGZpbHRlcnM/IEFmdGVyIGFsbCwgdGhpcyBpcyBhIGdlbmVyaWMgYmlu
ZGluZy4uLg0KDQpIaSBQZXRlciwNCg0KRm9yIG91ciBuZWVkcywgdGhpcyBpcyBlbm91Z2g6IHRo
ZSBwdXJwb3NlIG9mIHRoZSBmaWx0ZXJzIGlzIHRvIGF2b2lkIA0Kbm9pc2Ugb24gdGhlIGxpbmVz
LCB0aGUgbm9pc2UgaXMgYXMgYmlnIGFzIGl0IGlzIGZvciB0aGUgZGlnaXRhbCBhbmQgZm9yIA0K
dGhlIGFuYWxvZyBmaWx0ZXJzLCBzaW5jZSB3ZSB1c2UgYW4gYWJzb2x1dGUgbWVhc3VyZW1lbnQg
Zm9yIHRoZW0uIFNvIEkgDQpkbyBub3Qga25vdyBob3cgdXNlZnVsIGl0IHdvdWxkIGJlIHRvIG1h
a2UgYSBkaWZmZXJlbmNlLg0KDQpXb2xmcmFtLCB3aGF0IGRvIHlvdSB0aGluayA/DQoNCkV1Z2Vu
DQoNCg0KPiANCj4gQ2hlZXJzLA0KPiBQZXRlcg0KPiANCj4+ICsJaW4gbmFub3NlY29uZHMuDQo+
PiArDQo+PiAgIC0gaW50ZXJydXB0cw0KPj4gICAJaW50ZXJydXB0cyB1c2VkIGJ5IHRoZSBkZXZp
Y2UuDQo+PiAgIA0KPj4NCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fDQo+IGxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0DQo+IGxpbnV4LWFy
bS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwNCj4gDQo+IA0K

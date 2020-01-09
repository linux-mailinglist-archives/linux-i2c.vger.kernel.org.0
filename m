Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 727B3135772
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2020 11:54:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729707AbgAIKym (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jan 2020 05:54:42 -0500
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:46741 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729609AbgAIKym (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Jan 2020 05:54:42 -0500
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
  Codrin.Ciubotariu@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Codrin.Ciubotariu@microchip.com";
  x-sender="Codrin.Ciubotariu@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
  include:servers.mcsv.net include:mktomail.com
  include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Codrin.Ciubotariu@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com; spf=Pass smtp.mailfrom=Codrin.Ciubotariu@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: O5KPNmGO9vE/6dk3zZoUrbJUD9HzBNoYzbuJkIordsSpyN8cqup+Dz47xjX+7l0yexIbr/QgXX
 PyDjvhBNE69+qusHo/Ye8K/rBnar2bKeIxFvcYLuEoyQoUYuoDVpRfZvhcER1BEDDsONZe2MEA
 q6oPdBaA5ygZLYtJP91ogQmKcZ7ICdY0EVcFBpdyTrNjLVLC1+RnsqVgHVzI59RzuedytbB+2w
 ThNXKSXJHTobN4tyHzLvWVNfYUdbSqdijyFlWsotYP5ceS8WHRP4SXksgan9um5akJ0r6wBOcX
 slU=
X-IronPort-AV: E=Sophos;i="5.69,413,1571727600"; 
   d="scan'208";a="62703362"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Jan 2020 03:54:40 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 9 Jan 2020 03:54:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 9 Jan 2020 03:54:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P9dc5MB1pI8XWkAR9h5iZhylr0NHwqEs45EtrAtASHPIk+DkJbbT8GkVRfP4YGjZWjJJQuW5kAshsr2lB72FCshR0gdFU0Rnx5UN99TBVlsOsJqA9ZK+Ywu0o0akBSIJaEZkh49o1S8cebDjJx9is9aboxlyKGIrkGtsImvfjYioQVtF1I2m4+Il5PwixskITcTNUl0Xdq3w8zhqHqvB2xRma+Bs+0L6P55jtk6XFq/SDLZqgr3lQq/5grvBMOXwNH8P7dSQvpRldthMuNX0AvvDBjdv4h0ucJ4a8PmPTlkrf4A4/6RFgTmzVqVNVv8/CPsU7Cwiotf8q7tEXE97Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqGNCbVUE1ZOLRLlHsVr87aMjr7dsqdBqwKosAbwAVI=;
 b=E6Zfbe/BkKVjYe1hnPPqb9FstdbMoYrj+iR6lj6QxXr4S5bGXs8GUaHwjgn2F/QEqFUWqDnBwIE5avuPHSUeeBvnFOE76BYZmpYAaS3+1jNNGliJbst+YDE+cYEHIf9+26RMlgBmG32dBMg1wO1zLkSohydfenMrLe187pMXjvR7kQJgOG8ddsa1zGalmMlhaCwGT2JyzEjYVPFbxx7dKdsZnyeXyWi69HoLdJzanNcDxJ6P4J8GSN+gOT26hc0Cn4kjYHhmR7dAlym9RbZNhRS4okQzXU+QmDaFCoVJg2FkE3hVj53BusSk2A8Zkfyc167Ivl0z9QAoNZHla6tUtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqGNCbVUE1ZOLRLlHsVr87aMjr7dsqdBqwKosAbwAVI=;
 b=e7FoTizRUQnC9LyfclSBtHSR3bJu39/I5JQOGRFPi6rzD9Nb0PzVX2R53gFsMYPdmfoisv1wvtsO3FxbsG7pKQieyNcmCApu5bQ+EEdanI+TO3tAWXQ1ebmtALxe+GUn9IAeP57DOis10uCODr2bRlJe1p4BIiffA3oMExniptk=
Received: from BY5PR11MB4497.namprd11.prod.outlook.com (52.132.255.220) by
 BY5PR11MB4212.namprd11.prod.outlook.com (52.132.255.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Thu, 9 Jan 2020 10:54:38 +0000
Received: from BY5PR11MB4497.namprd11.prod.outlook.com
 ([fe80::6189:c32:b55b:b3fd]) by BY5PR11MB4497.namprd11.prod.outlook.com
 ([fe80::6189:c32:b55b:b3fd%5]) with mapi id 15.20.2623.011; Thu, 9 Jan 2020
 10:54:38 +0000
From:   <Codrin.Ciubotariu@microchip.com>
To:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <kamel.bouhara@bootlin.com>,
        <wsa@the-dreams.de>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <robh@kernel.org>
Subject: Re: [PATCH v2 2/6] i2c: at91: implement i2c bus recovery
Thread-Topic: [PATCH v2 2/6] i2c: at91: implement i2c bus recovery
Thread-Index: AQHVwhsKxM62dO/65kaQpOISnuFHxafh/huAgAA0AgA=
Date:   Thu, 9 Jan 2020 10:54:37 +0000
Message-ID: <d80b0dae-4310-9464-58c9-30b100dcb630@microchip.com>
References: <20200103094821.13185-1-codrin.ciubotariu@microchip.com>
 <20200103094821.13185-3-codrin.ciubotariu@microchip.com>
 <20200109074819.rhlaxg3sgwlng5xm@M43218.corp.atmel.com>
In-Reply-To: <20200109074819.rhlaxg3sgwlng5xm@M43218.corp.atmel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ca8b0491-7c3e-447c-9506-08d794f2526f
x-ms-traffictypediagnostic: BY5PR11MB4212:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB4212274906EDA0DE3BA18D79E7390@BY5PR11MB4212.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02778BF158
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(396003)(136003)(346002)(39860400002)(376002)(199004)(189003)(2906002)(6506007)(71200400001)(6512007)(53546011)(76116006)(64756008)(91956017)(6486002)(31696002)(2616005)(478600001)(86362001)(66446008)(66946007)(8936002)(36756003)(66476007)(81166006)(81156014)(8676002)(66556008)(5660300002)(186003)(26005)(110136005)(31686004)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:BY5PR11MB4212;H:BY5PR11MB4497.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +WXtAlOBvXWRmLq1SI2xgJtMkvFmMtUBWKoFlAzAaORtghCyZxkMODA7ddpodRX+UtvammURYNf5L/gjHpUa29NobaOnISOEtRztObCqKQ01MZ77lgIpCULbYJ5VvCkUx2cyHqpDVM8Zk9JprsvqN0He+CUBQbHhYUlMTD7X9fgC5ivztJsasoyOdmEzbJRxB7WBaeQ0A52TKNfksAfBDIgYcC02wWDDrw2eWz6YwG4UTvfsdlz9lU7ABzYTVtVKQVmQ022Ok8bcD141jpNm3yCEV0ERctJp3e+MHhsQCPu5o1PpL/KC02m1WgTdw0+fbbWUUn8pREXVgA7FSgIGCoT7arfC3JyhdxiXYJryUpdFAYmF/Tp3b9+aUYMCIm3CBbK8RL+UPisUzKH+cVcIeLoNCDCAn0saX3qOSwfBz0qdWYFhfWlhWUJm59WTcIpe
Content-Type: text/plain; charset="utf-8"
Content-ID: <203E1782E0105E47A8AF6EFA8A148B22@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ca8b0491-7c3e-447c-9506-08d794f2526f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2020 10:54:37.9397
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DXHTT8TwEM8CyO9IzVTrS185aWJNTQf5yWa2nbm2T8jP9HJsr+yDmjZGQRAzDrXfzG8EWV/N32JRnj2YbzvaRWKAEVdDDpF3RFMxLcLsNUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4212
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMDkuMDEuMjAyMCAwOTo0OCwgTHVkb3ZpYyBEZXNyb2NoZXMgd3JvdGU6DQo+IE9uIEZyaSwg
SmFuIDAzLCAyMDIwIGF0IDA5OjQ5OjA3QU0gKzAwMDAsIENvZHJpbiBDaXVib3Rhcml1IC0gTTE5
OTQwIHdyb3RlOg0KPj4gRnJvbTogS2FtZWwgQm91aGFyYSA8a2FtZWwuYm91aGFyYUBib290bGlu
LmNvbT4NCj4+DQo+PiBJbXBsZW1lbnQgaTJjIGJ1cyByZWNvdmVyeSB3aGVuIHNsYXZlcyBkZXZp
Y2VzIG1pZ2h0IGhvbGQgU0RBIGxvdy4NCj4+IEluIHRoaXMgY2FzZSByZS1hc3NpZ24gU0NML1NE
QSB0byBncGlvcyBhbmQgaXNzdWUgOSBkdW1teSBjbG9jayBwdWxzZXMNCj4+IHVudGlsIHRoZSBz
bGF2ZSByZWxlYXNlIFNEQS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBLYW1lbCBCb3VoYXJhIDxr
YW1lbC5ib3VoYXJhQGJvb3RsaW4uY29tPg0KPj4gW2NvZHJpbi5jaXVib3Rhcml1QG1pY3JvY2hp
cC5jb206IHJlbGVhc2UgZ3Bpb3Mgb24gZXJyb3I7IG1vdmUgaTJjX3JlY292ZXJfYnVzXQ0KPj4g
U2lnbmVkLW9mZi1ieTogQ29kcmluIENpdWJvdGFyaXUgPGNvZHJpbi5jaXVib3Rhcml1QG1pY3Jv
Y2hpcC5jb20+DQo+PiAtLS0NCj4+DQo+PiBDaGFuZ2VzIGluIHYyOg0KPj4gICAtIGNhbGxlZCBp
MmNfcmVjb3Zlcl9idXMoKSBhZnRlciBhbiBlcnJvciBvY2N1cnMsIGlmIFNEQSBpcyBkb3duOw0K
Pj4gICAtIHJlbGVhc2UgZ3Bpb3MgaWYgcmVjb3ZlcnkgaW5mb3JtYXRpb24gaXMgaW5jb21wbGV0
ZTsNCj4+DQo+PiAgIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS1tYXN0ZXIuYyB8IDc5ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+ICAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1h
dDkxLmggICAgICAgIHwgIDggKysrDQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgODcgaW5zZXJ0aW9u
cygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWF0OTEtbWFz
dGVyLmMgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWF0OTEtbWFzdGVyLmMNCj4+IGluZGV4IDdh
ODYyZTAwYjQ3NS4uYzU1ZThmZjM1MjAxIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9pMmMvYnVz
c2VzL2kyYy1hdDkxLW1hc3Rlci5jDQo+PiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWF0
OTEtbWFzdGVyLmMNCj4+IEBAIC0xOCwxMSArMTgsMTMgQEANCj4+ICAgI2luY2x1ZGUgPGxpbnV4
L2RtYS1tYXBwaW5nLmg+DQo+PiAgICNpbmNsdWRlIDxsaW51eC9kbWFlbmdpbmUuaD4NCj4+ICAg
I2luY2x1ZGUgPGxpbnV4L2Vyci5oPg0KPj4gKyNpbmNsdWRlIDxsaW51eC9ncGlvL2NvbnN1bWVy
Lmg+DQo+PiAgICNpbmNsdWRlIDxsaW51eC9pMmMuaD4NCj4+ICAgI2luY2x1ZGUgPGxpbnV4L2lu
dGVycnVwdC5oPg0KPj4gICAjaW5jbHVkZSA8bGludXgvaW8uaD4NCj4+ICAgI2luY2x1ZGUgPGxp
bnV4L29mLmg+DQo+PiAgICNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2UuaD4NCj4+ICsjaW5jbHVk
ZSA8bGludXgvcGluY3RybC9jb25zdW1lci5oPg0KPj4gICAjaW5jbHVkZSA8bGludXgvcGxhdGZv
cm1fZGV2aWNlLmg+DQo+PiAgICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kYXRhL2RtYS1hdG1l
bC5oPg0KPj4gICAjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPg0KPj4gQEAgLTQ3OCw2ICs0
ODAsNyBAQCBzdGF0aWMgaW50IGF0OTFfZG9fdHdpX3RyYW5zZmVyKHN0cnVjdCBhdDkxX3R3aV9k
ZXYgKmRldikNCj4+ICAgCXVuc2lnbmVkIGxvbmcgdGltZV9sZWZ0Ow0KPj4gICAJYm9vbCBoYXNf
dW5yZV9mbGFnID0gZGV2LT5wZGF0YS0+aGFzX3VucmVfZmxhZzsNCj4+ICAgCWJvb2wgaGFzX2Fs
dF9jbWQgPSBkZXYtPnBkYXRhLT5oYXNfYWx0X2NtZDsNCj4+ICsJc3RydWN0IGkyY19idXNfcmVj
b3ZlcnlfaW5mbyAqcmluZm8gPSAmZGV2LT5yaW5mbzsNCj4+ICAgDQo+PiAgIAkvKg0KPj4gICAJ
ICogV0FSTklORzogdGhlIFRYQ09NUCBiaXQgaW4gdGhlIFN0YXR1cyBSZWdpc3RlciBpcyBOT1Qg
YSBjbGVhciBvbg0KPj4gQEAgLTYzNyw2ICs2NDAsMTMgQEAgc3RhdGljIGludCBhdDkxX2RvX3R3
aV90cmFuc2ZlcihzdHJ1Y3QgYXQ5MV90d2lfZGV2ICpkZXYpDQo+PiAgIAkJYXQ5MV90d2lfd3Jp
dGUoZGV2LCBBVDkxX1RXSV9DUiwNCj4+ICAgCQkJICAgICAgIEFUOTFfVFdJX1RIUkNMUiB8IEFU
OTFfVFdJX0xPQ0tDTFIpOw0KPj4gICAJfQ0KPj4gKw0KPj4gKwlpZiAocmluZm8tPmdldF9zZGEg
JiYgIShyaW5mby0+Z2V0X3NkYSgmZGV2LT5hZGFwdGVyKSkpIHsNCj4+ICsJCWRldl9kYmcoZGV2
LT5kZXYsDQo+PiArCQkJIlNEQSBpcyBkb3duOyBjbGVhciBidXMgdXNpbmcgZ3Bpb1xuIik7DQo+
PiArCQlpMmNfcmVjb3Zlcl9idXMoJmRldi0+YWRhcHRlcik7DQo+PiArCX0NCj4+ICsNCj4+ICAg
CXJldHVybiByZXQ7DQo+PiAgIH0NCj4+ICAgDQo+PiBAQCAtODA2LDYgKzgxNiw3MSBAQCBzdGF0
aWMgaW50IGF0OTFfdHdpX2NvbmZpZ3VyZV9kbWEoc3RydWN0IGF0OTFfdHdpX2RldiAqZGV2LCB1
MzIgcGh5X2FkZHIpDQo+PiAgIAlyZXR1cm4gcmV0Ow0KPj4gICB9DQo+PiAgIA0KPj4gK3N0YXRp
YyB2b2lkIGF0OTFfcHJlcGFyZV90d2lfcmVjb3Zlcnkoc3RydWN0IGkyY19hZGFwdGVyICphZGFw
KQ0KPj4gK3sNCj4+ICsJc3RydWN0IGF0OTFfdHdpX2RldiAqZGV2ID0gaTJjX2dldF9hZGFwZGF0
YShhZGFwKTsNCj4+ICsNCj4+ICsJcGluY3RybF9zZWxlY3Rfc3RhdGUoZGV2LT5waW5jdHJsLCBk
ZXYtPnBpbmN0cmxfcGluc19ncGlvKTsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGljIHZvaWQgYXQ5
MV91bnByZXBhcmVfdHdpX3JlY292ZXJ5KHN0cnVjdCBpMmNfYWRhcHRlciAqYWRhcCkNCj4+ICt7
DQo+PiArCXN0cnVjdCBhdDkxX3R3aV9kZXYgKmRldiA9IGkyY19nZXRfYWRhcGRhdGEoYWRhcCk7
DQo+PiArDQo+PiArCXBpbmN0cmxfc2VsZWN0X3N0YXRlKGRldi0+cGluY3RybCwgZGV2LT5waW5j
dHJsX3BpbnNfZGVmYXVsdCk7DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyBpbnQgYXQ5MV9pbml0
X3R3aV9yZWNvdmVyeV9pbmZvKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsDQo+PiArCQkJ
CSAgICAgICBzdHJ1Y3QgYXQ5MV90d2lfZGV2ICpkZXYpDQo+PiArew0KPj4gKwlzdHJ1Y3QgaTJj
X2J1c19yZWNvdmVyeV9pbmZvICpyaW5mbyA9ICZkZXYtPnJpbmZvOw0KPj4gKw0KPj4gKwlkZXYt
PnBpbmN0cmwgPSBkZXZtX3BpbmN0cmxfZ2V0KCZwZGV2LT5kZXYpOw0KPj4gKwlpZiAoIWRldi0+
cGluY3RybCB8fCBJU19FUlIoZGV2LT5waW5jdHJsKSkgew0KPj4gKwkJZGV2X2luZm8oZGV2LT5k
ZXYsICJjYW4ndCBnZXQgcGluY3RybCwgYnVzIHJlY292ZXJ5IG5vdCBzdXBwb3J0ZWRcbiIpOw0K
Pj4gKwkJcmV0dXJuIFBUUl9FUlIoZGV2LT5waW5jdHJsKTsNCj4+ICsJfQ0KPj4gKw0KPj4gKwlk
ZXYtPnBpbmN0cmxfcGluc19kZWZhdWx0ID0gcGluY3RybF9sb29rdXBfc3RhdGUoZGV2LT5waW5j
dHJsLA0KPj4gKwkJCQkJCQkgUElOQ1RSTF9TVEFURV9ERUZBVUxUKTsNCj4+ICsJZGV2LT5waW5j
dHJsX3BpbnNfZ3BpbyA9IHBpbmN0cmxfbG9va3VwX3N0YXRlKGRldi0+cGluY3RybCwNCj4+ICsJ
CQkJCQkgICAgICAiZ3BpbyIpOw0KPj4gKwlyaW5mby0+c2RhX2dwaW9kID0gZGV2bV9ncGlvZF9n
ZXQoJnBkZXYtPmRldiwgInNkYSIsIEdQSU9EX0lOKTsNCj4+ICsJaWYgKFBUUl9FUlIocmluZm8t
PnNkYV9ncGlvZCkgPT0gLUVQUk9CRV9ERUZFUikNCj4+ICsJCXJldHVybiAtRVBST0JFX0RFRkVS
Ow0KPj4gKw0KPj4gKwlyaW5mby0+c2NsX2dwaW9kID0gZGV2bV9ncGlvZF9nZXQoJnBkZXYtPmRl
diwgInNjbCIsDQo+PiArCQkJCQkgIEdQSU9EX09VVF9ISUdIX09QRU5fRFJBSU4pOw0KPj4gKwlp
ZiAoUFRSX0VSUihyaW5mby0+c2NsX2dwaW9kKSA9PSAtRVBST0JFX0RFRkVSKQ0KPj4gKwkJcmV0
dXJuIC1FUFJPQkVfREVGRVI7DQo+PiArDQo+PiArCWlmIChJU19FUlIocmluZm8tPnNkYV9ncGlv
ZCkgfHwNCj4+ICsJICAgIElTX0VSUihyaW5mby0+c2NsX2dwaW9kKSB8fA0KPj4gKwkgICAgSVNf
RVJSKGRldi0+cGluY3RybF9waW5zX2RlZmF1bHQpIHx8DQo+PiArCSAgICBJU19FUlIoZGV2LT5w
aW5jdHJsX3BpbnNfZ3BpbykpIHsNCj4+ICsJCWRldl9pbmZvKCZwZGV2LT5kZXYsICJyZWNvdmVy
eSBpbmZvcm1hdGlvbiBpbmNvbXBsZXRlXG4iKTsNCj4+ICsJCWlmICghSVNfRVJSKHJpbmZvLT5z
ZGFfZ3Bpb2QpKSB7DQo+PiArCQkJZ3Bpb2RfcHV0KHJpbmZvLT5zZGFfZ3Bpb2QpOw0KPj4gKwkJ
CXJpbmZvLT5zZGFfZ3Bpb2QgPSBOVUxMOw0KPj4gKwkJfQ0KPj4gKwkJaWYgKCFJU19FUlIocmlu
Zm8tPnNjbF9ncGlvZCkpIHsNCj4+ICsJCQlncGlvZF9wdXQocmluZm8tPnNjbF9ncGlvZCk7DQo+
PiArCQkJcmluZm8tPnNjbF9ncGlvZCA9IE5VTEw7DQo+PiArCQl9DQo+PiArCQlyZXR1cm4gLUVJ
TlZBTDsNCj4+ICsJfQ0KPj4gKw0KPj4gKwlkZXZfaW5mbygmcGRldi0+ZGV2LCAidXNpbmcgc2Ns
JXMgZm9yIHJlY292ZXJ5XG4iLA0KPj4gKwkJIHJpbmZvLT5zZGFfZ3Bpb2QgPyAiLHNkYSIgOiAi
Iik7DQo+IA0KPiBJcyBpdCBwb3NzaWJsZSB0byBoYXZlIHNjbCB3aXRob3V0IHNkYT8gRnJvbSB0
aGUgY29uZGl0aW9uIGJlZm9yZSwgaWYNCj4gdGhlcmUgaXMgYW4gZXJyb3IgZm9yIHNkYSBvciBz
Y2wsIGFuIGVycm9yIGlzIHJldHVybmVkLg0KDQpObywgaXQncyBub3QuIFdlIG5lZWQgYm90aCBz
ZGEgYW5kIHNjbCBncGlvcy4gSSB3aWxsIGZpeCBpdC4NCg0KPiANCj4+ICsNCj4+ICsJcmluZm8t
PnByZXBhcmVfcmVjb3ZlcnkgPSBhdDkxX3ByZXBhcmVfdHdpX3JlY292ZXJ5Ow0KPj4gKwlyaW5m
by0+dW5wcmVwYXJlX3JlY292ZXJ5ID0gYXQ5MV91bnByZXBhcmVfdHdpX3JlY292ZXJ5Ow0KPj4g
KwlyaW5mby0+cmVjb3Zlcl9idXMgPSBpMmNfZ2VuZXJpY19zY2xfcmVjb3Zlcnk7DQo+PiArCWRl
di0+YWRhcHRlci5idXNfcmVjb3ZlcnlfaW5mbyA9IHJpbmZvOw0KPj4gKw0KPj4gKwlyZXR1cm4g
MDsNCj4+ICt9DQo+PiArDQo+PiAgIGludCBhdDkxX3R3aV9wcm9iZV9tYXN0ZXIoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldiwNCj4+ICAgCQkJICB1MzIgcGh5X2FkZHIsIHN0cnVjdCBhdDkx
X3R3aV9kZXYgKmRldikNCj4+ICAgew0KPj4gQEAgLTgzOCw2ICs5MTMsMTAgQEAgaW50IGF0OTFf
dHdpX3Byb2JlX21hc3RlcihzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LA0KPj4gICAJCQkJ
CQkgICAgICJpMmMtYW5hbG9nLWZpbHRlciIpOw0KPj4gICAJYXQ5MV9jYWxjX3R3aV9jbG9jayhk
ZXYpOw0KPj4gICANCj4+ICsJcmMgPSBhdDkxX2luaXRfdHdpX3JlY292ZXJ5X2luZm8ocGRldiwg
ZGV2KTsNCj4+ICsJaWYgKHJjID09IC1FUFJPQkVfREVGRVIpDQo+PiArCQlyZXR1cm4gcmM7DQo+
PiArDQo+PiAgIAlkZXYtPmFkYXB0ZXIuYWxnbyA9ICZhdDkxX3R3aV9hbGdvcml0aG07DQo+PiAg
IAlkZXYtPmFkYXB0ZXIucXVpcmtzID0gJmF0OTFfdHdpX3F1aXJrczsNCj4+ICAgDQo+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hdDkxLmggYi9kcml2ZXJzL2kyYy9idXNz
ZXMvaTJjLWF0OTEuaA0KPj4gaW5kZXggOTc3YTY3YmMwZjg4Li5lYjMzNWI3MWU3NzUgMTAwNjQ0
DQo+PiAtLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWF0OTEuaA0KPj4gKysrIGIvZHJpdmVy
cy9pMmMvYnVzc2VzL2kyYy1hdDkxLmgNCj4+IEBAIC0xNTEsNiArMTUxLDEwIEBAIHN0cnVjdCBh
dDkxX3R3aV9kZXYgew0KPj4gICAJdTMyIGZpZm9fc2l6ZTsNCj4+ICAgCXN0cnVjdCBhdDkxX3R3
aV9kbWEgZG1hOw0KPj4gICAJYm9vbCBzbGF2ZV9kZXRlY3RlZDsNCj4+ICsJc3RydWN0IGkyY19i
dXNfcmVjb3ZlcnlfaW5mbyByaW5mbzsNCj4+ICsJc3RydWN0IHBpbmN0cmwgKnBpbmN0cmw7DQo+
PiArCXN0cnVjdCBwaW5jdHJsX3N0YXRlICpwaW5jdHJsX3BpbnNfZGVmYXVsdDsNCj4+ICsJc3Ry
dWN0IHBpbmN0cmxfc3RhdGUgKnBpbmN0cmxfcGluc19ncGlvOw0KPj4gICAjaWZkZWYgQ09ORklH
X0kyQ19BVDkxX1NMQVZFX0VYUEVSSU1FTlRBTA0KPj4gICAJdW5zaWduZWQgc21yOw0KPj4gICAJ
c3RydWN0IGkyY19jbGllbnQgKnNsYXZlOw0KPj4gQEAgLTE3MSw2ICsxNzUsMTAgQEAgdm9pZCBh
dDkxX2luaXRfdHdpX2J1c19tYXN0ZXIoc3RydWN0IGF0OTFfdHdpX2RldiAqZGV2KTsNCj4+ICAg
aW50IGF0OTFfdHdpX3Byb2JlX21hc3RlcihzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LCB1
MzIgcGh5X2FkZHIsDQo+PiAgIAkJCSAgc3RydWN0IGF0OTFfdHdpX2RldiAqZGV2KTsNCj4+ICAg
DQo+IA0KPiBXcm9uZyBuYW1lcyBoZXJlOg0KPiANCj4+ICt2b2lkIGF0OTFfdHdpX3ByZXBhcmVf
cmVjb3Zlcnkoc3RydWN0IGkyY19hZGFwdGVyICphZGFwKTsNCj4gYXQ5MV9wcmVwYXJlX3R3aV9y
ZWNvdmVyeQ0KPiANCj4+ICt2b2lkIGF0OTFfdHdpX3VucHJlcGFyZV9yZWNvdmVyeShzdHJ1Y3Qg
aTJjX2FkYXB0ZXIgKmFkYXApOw0KPiBhdDkxX3VucHJlcGFyZV90d2lfcmVjb3ZlcnkNCj4gDQo+
PiArdm9pZCBhdDkxX3R3aV9pbml0X3JlY292ZXJ5X2luZm8oc3RydWN0IGF0OTFfdHdpX2RldiAq
ZGV2KTsNCj4gYXQ5MV9pbml0X3R3aV9yZWNvdmVyeV9pbmZvDQo+IA0KPiBBcmUgdGhlc2UgZGVj
bGFyYXRpb25zIHN0aWxsIG5lZWRlZD8NCg0KTm8sIHRoZXJlIGlzIG5vdC4gVGhleSBhcmUgdXNl
ZCBvbmx5IGluIHRoZSBtYXN0ZXIgbW9kZSBvZiB0aGUgZHJpdmVyLiBJIA0Kd2lsbCByZW1vdmUg
dGhlbS4NCg0KVGhhbmsgeW91IGZvciB5b3VyIHJldmlldyBMdWRvdmljLg0KDQpCZXN0IHJlZ2Fy
ZHMsDQpDb2RyaW4=

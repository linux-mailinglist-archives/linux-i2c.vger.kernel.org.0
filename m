Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C786D5BC9
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2019 09:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729981AbfJNHBs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Oct 2019 03:01:48 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:36067 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726618AbfJNHBs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Oct 2019 03:01:48 -0400
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
IronPort-SDR: mm6ewGogm9itbxy3lesnHVkSj5vpZLxGRzenFwcTpHO/yLq4FvUkOyofB36D4QWEYiHyPE5lVE
 DrU0emtqv03wswUuqajmWHcVmQVIU3mJ3Cokw9/t3S82GN2g4toqAOusXrHAZ4jVRr1QZwbS7U
 bd94t4Jg7vYxAmWKyp+7IJNMbkZePAWuMWIBbQCpDHf0Lk7hyR2VlL8K6bNwEtAwrw23Ui88Lk
 rbxVd2SfNJBvZfl9uVdPlbPg8JCLwWO8hE16Bg/QbL8yEITtmctuL1zeiMYvMX5pPxCMTOKSVA
 2KY=
X-IronPort-AV: E=Sophos;i="5.67,295,1566889200"; 
   d="scan'208";a="51328445"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Oct 2019 00:01:46 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 14 Oct 2019 00:01:46 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 14 Oct 2019 00:01:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q6pqb+IEzSnWC5urMU7tpGc9LOaz1lHIKNconTqXSJy0LA1JEGoCmcEsU1gY4fXJ1aAmnlbD+qdZH2VIANgPOdRnXrVky6TK54qUwuUqe5oMkQ7bd7MYMRgllxggsUw0mTUZ4TUwOrs5mZ8DDxRus9L4oa1BiNwjPkxMtuihXxu2OzZ1anID85k6x+29mKFhru9Wo0YfrRmoQ6/QpOT7StGO+87WZ2ZJLYpRBrDC8KJdjLqronUJtohLB9bcmp+0XYSUEH4LjWEVy+Y/Tnzw2VUqpK0xedgbdoB73Qc9Pmt6mi74LvRirDFl8VPp4kDKv9i58WFDfs0ZuNRVWG37tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFNjeXn8hEQdiW3W0oRGBOg7ckq5c0eoOr4TDkb/b4Y=;
 b=F2/angmXbnAXQjTQwh6SvRirGQpgs5A0TcJCCSfeYPBwWN5npU7D7Qe7dlMiS6nS1FQ57WrRUrp6T0hwimjmYo3wbbB/edCYpcw/UbRYJu2T6MaR9PB7GHebEOiE7vhlx4F4+jcgf05NXK5pXmY3hCPeNsJI/to3YmdokhhKthmQA7L7S4TO18U7S1AvcqCCZPIEVgOMDYrakT4TGp0yz5fs2HceLSzrQpemulyslSxDRMwAu22JimVxQcY4OlZNrOHuWR+4oByMJ1giGQAqh+oYvIJEjDdtg2mfXNWrv4WmgzAY0W+N7VPxnME9NKawfg6Cw0rCYJ3LUcJg2LcSCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFNjeXn8hEQdiW3W0oRGBOg7ckq5c0eoOr4TDkb/b4Y=;
 b=Bwt6U42k0m0DX9tOSxPE4frRr/jQRJabUe9ljBx85O17XypUaRCq6jilR3g+d15q2/uLsRiwyW/6AN2uDPKMHJ8jvfOeYeahRgmtGNU2VJlx+kssqdFcWZVjXPFhGRzzCX+VhKvR9KAQKBcmn9xB1phBQ4Cf0yc+oUylMOqdXog=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB0009.namprd11.prod.outlook.com (10.164.155.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Mon, 14 Oct 2019 07:01:40 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::b125:76c1:c9b1:34f4]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::b125:76c1:c9b1:34f4%10]) with mapi id 15.20.2347.021; Mon, 14 Oct
 2019 07:01:40 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <wsa@the-dreams.de>, <peda@axentia.se>, <mark.rutland@arm.com>,
        <Ludovic.Desroches@microchip.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <alexandre.belloni@bootlin.com>,
        <robh+dt@kernel.org>
CC:     <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH v5 0/9] i2c: add support for filters
Thread-Topic: [PATCH v5 0/9] i2c: add support for filters
Thread-Index: AQHVaHpLr7113TR4Hk2itVe9BFeajadO9gMAgArx6gA=
Date:   Mon, 14 Oct 2019 07:01:40 +0000
Message-ID: <82f83640-607b-d888-a268-a54b9753e3c4@microchip.com>
References: <1568189911-31641-1-git-send-email-eugen.hristev@microchip.com>
 <c17182ac-67dd-d11f-5daf-066bf446b969@microchip.com>
In-Reply-To: <c17182ac-67dd-d11f-5daf-066bf446b969@microchip.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR08CA0117.eurprd08.prod.outlook.com
 (2603:10a6:800:d4::19) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20191014095602867
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63798627-8fba-4cc3-4d59-08d750745cd2
x-ms-traffictypediagnostic: DM5PR11MB0009:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB00090E391C8A48AAE74B4A80E8900@DM5PR11MB0009.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01901B3451
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(346002)(396003)(39860400002)(366004)(136003)(199004)(189003)(6246003)(107886003)(66946007)(2201001)(316002)(229853002)(6486002)(8676002)(6512007)(6436002)(2906002)(4326008)(110136005)(478600001)(5660300002)(86362001)(14454004)(31696002)(305945005)(7736002)(486006)(36756003)(66066001)(256004)(71190400001)(71200400001)(3846002)(81156014)(6116002)(14444005)(99286004)(76176011)(26005)(31686004)(386003)(6506007)(53546011)(102836004)(186003)(446003)(11346002)(476003)(2616005)(52116002)(8936002)(66556008)(81166006)(66476007)(66446008)(2501003)(64756008)(25786009)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB0009;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RYHRg4inpaKespU9PJpdGuV8Q1ht/PQZoqSiHT1H4IAuRFPxkUHGUHBdIpxIOersUDKbn6Dgn63+a5F6AKlQogqbACkwG1J+9KJjSXrRQ4nM+Q6WUThTuy7fJakmUtkD6pUAsdwBB2kDWOuyjfDlmZmdjw2l693kTPFaRRzJhfgZCmkKQpQzayoCRE++taEkXsomsTptBcFtD+Qu2TvCbYPrY8BEJBikAyNfvoBaxCeAcjR4FHqtDeU5oKOLjEGaW/9iD3RxqnOyiunmBP2U6G5tal9aUtFs0Fh6Z9QXcuh/1gLUpMuO/O2EE0aHFyx7Ujn7HQKvhun6bticl4SEdnZyal/42t2bFZjQnxwAEFXMOXYQm+p/Q9RXIPrSMUU2zwKjbQ7iU0jvlHyLPTU4gYgU+tCLOGWSfUWTGsq/G2U=
Content-Type: text/plain; charset="utf-8"
Content-ID: <70DA4721E4558A49A41F1512E56EFFEB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 63798627-8fba-4cc3-4d59-08d750745cd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2019 07:01:40.3797
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N66ohLk8LWxCj/RXyIouKBixONAVXqQ+LQ5Dj79l3+f3dfyHEKbBnO/IzQ8r8L3WJbul2F5TLP6B9Fg0dU86AghAnekxvOT1mWxZZtD8iP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0009
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCk9uIDA3LjEwLjIwMTkgMTA6NDcsIEV1Z2VuIEhyaXN0ZXYgd3JvdGU6DQo+IA0KPiANCj4g
T24gMTEuMDkuMjAxOSAxMToyNCwgRXVnZW4gSHJpc3RldiAtIE0xODI4MiB3cm90ZToNCj4+IEZy
b206IEV1Z2VuIEhyaXN0ZXYgPGV1Z2VuLmhyaXN0ZXZAbWljcm9jaGlwLmNvbT4NCj4+DQo+PiBI
ZWxsbywNCj4+DQo+PiBUaGlzIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIGFuYWxvZyBhbmQgZGln
aXRhbCBmaWx0ZXJzIGZvciBpMmMgDQo+PiBjb250cm9sbGVycw0KPj4NCj4+IFRoaXMgc2VyaWVz
IGlzIGJhc2VkIG9uIHRoZSBzZXJpZXM6DQo+PiBbUEFUQ0ggdjIgMC85XSBpMmM6IGF0OTE6IGZp
bHRlcnMgc3VwcG9ydCBmb3IgYXQ5MSBTb0NzDQo+PiBhbmQgbGF0ZXINCj4+IFtQQVRDSCB2NCAw
LzldIGkyYzogYWRkIHN1cHBvcnQgZm9yIGZpbHRlcnMNCj4+IGFuZCBlbmhhbmNlZCB0byBhZGQg
dGhlIGJpbmRpbmdzIGZvciBhbGwgY29udHJvbGxlcnMgcGx1cyBhbiBleHRyYSANCj4+IGJpbmRp
bmdzDQo+PiBmb3IgdGhlIHdpZHRoIG9mIHRoZSBzcGlrZXMgaW4gbmFub3NlY29uZHMgKGRpZ2l0
YWwgZmlsdGVycykgYW5kIGN1dC1vZmYNCj4+IGZyZXF1ZW5jeSAoYW5hbG9nIGZpbHRlcnMpDQo+
Pg0KPj4gRmlyc3QsIGJpbmRpbmdzIGFyZSBjcmVhdGVkIGZvcg0KPj4gJ2kyYy1hbmFsb2ctZmls
dGVyJw0KPj4gJ2kyYy1kaWdpdGFsLWZpbHRlcicNCj4+ICdpMmMtZGlnaXRhbC1maWx0ZXItd2lk
dGgtbnMnDQo+PiAnaTJjLWFuYWxvZy1maWx0ZXItY3V0b2ZmLWZyZXF1ZW5jeScNCj4+DQo+PiBU
aGUgc3VwcG9ydCBpcyBhZGRlZCBpbiB0aGUgaTJjIGNvcmUgdG8gcmV0cmlldmUgZmlsdGVyIHdp
ZHRoL2N1dG9mZiANCj4+IGZyZXF1ZW5jeQ0KPj4gYW5kIGFkZCBpdCB0byB0aGUgdGltaW5ncyBz
dHJ1Y3R1cmUuDQo+PiBOZXh0LCB0aGUgYXQ5MSBkcml2ZXIgaXMgZW5oYW5jZWQgZm9yIHN1cHBv
cnRpbmcgZGlnaXRhbCBmaWx0ZXIsIGFkdmFuY2VkDQo+PiBkaWdpdGFsIGZpbHRlciAod2l0aCBz
ZWxlY3RhYmxlIHNwaWtlIHdpZHRoKSBhbmQgdGhlIGFuYWxvZyBmaWx0ZXIuDQo+Pg0KPj4gRmlu
YWxseSB0aGUgZGV2aWNlIHRyZWUgZm9yIHR3byBib2FyZHMgYXJlIG1vZGlmaWVkIHRvIG1ha2Ug
dXNlIG9mIHRoZQ0KPj4gbmV3IHByb3BlcnRpZXMuDQo+Pg0KPj4gVGhpcyBzZXJpZXMgaXMgdGhl
IHJlc3VsdCBvZiB0aGUgY29tbWVudHMgb24gdGhlIE1MIGluIHRoZSBkaXJlY3Rpb24NCj4+IHJl
cXVlc3RlZDogdG8gbWFrZSB0aGUgYmluZGluZ3MgZ2xvYmFsbHkgYXZhaWxhYmxlIGZvciBpMmMg
ZHJpdmVycy4NCj4+DQo+PiBDaGFuZ2VzIGluIHY1Og0KPj4gLSByZW5hbWVkIGkyYy1maWx0ZXIt
d2lkdGgtbnMgdG8gaTJjLWRpZ2l0YWwtZmlsdGVyLXdpZHRoLW5zIGFzIHRoaXMNCj4+IGlzIGFw
cGxpY2FibGUgb25seSB0byBkaWdpdGFsIGZpbHRlcg0KPj4gLSBjcmVhdGVkIG5ldyBiaW5kaW5n
IGkyYy1kaWdpdGFsLWZpbHRlci13aWR0aC1ucyBmb3IgYW5hbG9nIGZpbHRlcnMuDQo+IA0KPiBI
ZWxsbyBXb2xmcmFtIGFuZCBQZXRlciwNCj4gDQo+IEFyZSB5b3UgaGFwcHkgd2l0aCB0aGUgY2hh
bmdlcyBpbiB0aGlzIHZlcnNpb24/IEkgaGF2ZW4ndCBoZWFyZCBmcm9tIHlvdSANCj4gc2luY2Ug
dGhpcyBsYXRlc3QgdXBkYXRlLg0KPiBJIGFtIGludGVyZXN0ZWQgdG8ga25vdyBpZiBhbnltb3Jl
IGNoYW5nZXMgYXJlIHJlcXVpcmVkIG9yIG1heWJlIHdlIGNhbiANCj4gbW92ZSBmdXJ0aGVyIHdp
dGggdGhpcyBzdXBwb3J0Lg0KPiANCj4gVGhhbmtzICENCj4gRXVnZW4NCj4gDQoNCkdlbnRsZSBw
aW5nDQoNCg0KPj4NCj4+IENoYW5nZXMgaW4gdjQ6DQo+PiAtIHJlbmFtZWQgaTJjLWFuYS1maWx0
ZXIgdG8gaTJjLWFuYWxvZy1maWx0ZXINCj4+IC0gcmVuYW1lZCBpMmMtZGlnLWZpbHRlciB0byBp
MmMtZGlnaXRhbC1maWx0ZXINCj4+DQo+PiBDaGFuZ2VzIGluIHYzOg0KPj4gLSBtYWRlIGJpbmRp
bmdzIGdsb2JhbCBmb3IgaTJjIGNvbnRyb2xsZXJzIGFuZCBtb2RpZmllZCBhY2NvcmRpbmdseQ0K
Pj4gLSBnYXZlIHVwIFBBREZDREYgYml0IGJlY2F1c2UgaXQncyBhIGxhY2sgaW4gZGF0YXNoZWV0
DQo+PiAtIHRoZSBjb21wdXRhdGlvbiBvbiB0aGUgd2lkdGggb2YgdGhlIHNwaWtlIGlzIGJhc2Vk
IG9uIHBlcmlwaCBjbG9jayANCj4+IGFzIGl0DQo+PiBpcyBkb25lIGZvciBob2xkIHRpbWUuDQo+
Pg0KPj4gQ2hhbmdlcyBpbiB2MjoNCj4+IC0gYWRkZWQgZGV2aWNlIHRyZWUgYmluZGluZ3MgYW5k
IHN1cHBvcnQgZm9yIGVuYWJsZS1hbmEtZmlsdCBhbmQNCj4+IGVuYWJsZS1kaWctZmlsdA0KPj4g
LSBhZGRlZCB0aGUgbmV3IHByb3BlcnRpZXMgdG8gdGhlIERUIGZvciANCj4+IHNhbWE1ZDRfeHBs
YWluZWQvc2FtYTVkMl94cGxhaW5lZA0KPj4NCj4+IEV1Z2VuIEhyaXN0ZXYgKDkpOg0KPj4gwqDC
oCBkdC1iaW5kaW5nczogaTJjOiBhdDkxOiBhZGQgbmV3IGNvbXBhdGlibGUNCj4+IMKgwqAgZHQt
YmluZGluZ3M6IGkyYzogYWRkIGJpbmRpbmdzIGZvciBpMmMgYW5hbG9nIGFuZCBkaWdpdGFsIGZp
bHRlcg0KPj4gwqDCoCBpMmM6IGFkZCBzdXBwb3J0IGZvciBmaWx0ZXJzIG9wdGlvbmFsIHByb3Bl
cnRpZXMNCj4+IMKgwqAgaTJjOiBhdDkxOiBhZGQgbmV3IHBsYXRmb3JtIHN1cHBvcnQgZm9yIHNh
bTl4NjANCj4+IMKgwqAgaTJjOiBhdDkxOiBhZGQgc3VwcG9ydCBmb3IgZGlnaXRhbCBmaWx0ZXJp
bmcNCj4+IMKgwqAgaTJjOiBhdDkxOiBhZGQgc3VwcG9ydCBmb3IgYWR2YW5jZWQgZGlnaXRhbCBm
aWx0ZXJpbmcNCj4+IMKgwqAgaTJjOiBhdDkxOiBhZGQgc3VwcG9ydCBmb3IgYW5hbG9nIGZpbHRl
cmluZw0KPj4gwqDCoCBBUk06IGR0czogYXQ5MTogc2FtYTVkMl94cGxhaW5lZDogYWRkIGFuYWxv
ZyBhbmQgZGlnaXRhbCBmaWx0ZXIgZm9yDQo+PiDCoMKgwqDCoCBpMmMNCj4+IMKgwqAgQVJNOiBk
dHM6IGF0OTE6IHNhbWE1ZDRfeHBsYWluZWQ6IGFkZCBkaWdpdGFsIGZpbHRlciBmb3IgaTJjDQo+
Pg0KPj4gwqAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtYXQ5MS50
eHQgfMKgIDMgKy0NCj4+IMKgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMv
aTJjLnR4dMKgwqDCoMKgwqAgfCAxOCArKysrKysrKw0KPj4gwqAgYXJjaC9hcm0vYm9vdC9kdHMv
YXQ5MS1zYW1hNWQyX3hwbGFpbmVkLmR0c8KgwqDCoMKgwqDCoMKgIHzCoCA2ICsrKw0KPj4gwqAg
YXJjaC9hcm0vYm9vdC9kdHMvYXQ5MS1zYW1hNWQ0X3hwbGFpbmVkLmR0c8KgwqDCoMKgwqDCoMKg
IHzCoCAxICsNCj4+IMKgIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS1jb3JlLmPCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDM4IA0KPj4gKysrKysrKysrKysrKysrKysNCj4+
IMKgIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS1tYXN0ZXIuY8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfCA0OSANCj4+ICsrKysrKysrKysrKysrKysrKysrLS0NCj4+IMKgIGRyaXZl
cnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHwgMTMgKysrKysrDQo+PiDCoCBkcml2ZXJzL2kyYy9pMmMtY29yZS1iYXNlLmPC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA2ICsrKw0K
Pj4gwqAgaW5jbHVkZS9saW51eC9pMmMuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA2ICsrKw0KPj4gwqAgOSBmaWxlcyBj
aGFuZ2VkLCAxMzYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4+DQo=

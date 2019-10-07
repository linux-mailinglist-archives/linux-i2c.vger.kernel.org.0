Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 316B0CDC98
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Oct 2019 09:53:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727402AbfJGHxY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Oct 2019 03:53:24 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:41446 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727103AbfJGHxY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Oct 2019 03:53:24 -0400
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: /qc85ScnAK4lNGyE0LVWOB7FZ3d1nhTnUrkRnMgj+YvpJsXgRI+NCC1ExuR+gSmfjlLNKHESZ+
 qy5igtuplMgc6gl45AvqSfKqAUIVpr0KB6ZpDi8gFucC6yc3WE4yBc/F1rnRX9Z74q6hOLj8gn
 xrNEYBYgnaj8y6qP+raavn0UR/T7STVHw3WaB7LyPZsjVnQLsU0n2YjeDTB/WBy5Sl7f2uBsSX
 sasiNPHxIURDmp9FhRfbGfZUhaGcLby9Vb/x+1xV+ozlyaD+qWB/Q250zEozX5Zj9QsqW7Xf2H
 Av8=
X-IronPort-AV: E=Sophos;i="5.67,265,1566889200"; 
   d="scan'208";a="53264300"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Oct 2019 00:53:23 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 7 Oct 2019 00:53:22 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 7 Oct 2019 00:53:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kjCCZUovNK+wgqsmml8JtgSKlDZIHdq+r2iuYLYDGtDvXr9H/BxACKMK9aTDVxwjdW9nJkpnu1GfSfzeiy1ORiC6oZzWYH5LWaX+AYc1BQ4qEHhCM0E95Jb/FRxFhPQK3BBEbl7ndJPnJcmUCsJX54CfRdtxJGc32uorDvMyzxU9RRjrzcy84PQBAP5DfvTVWyg+VnpmNppnImt7K276rUHy4+ulQK+ejte2TofTB5n/P6n2BisoF2JyAU2MJNcapmMkdTqj7kSZAIOYNSgpjSSkdd3++wFnh+qJe/bAL6dRoPHJFxlZI1eWUCf7ZgdPN569YY2xcxXS6LraXt+4AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BSjGmqgHk1W5AlzakZsmiivBmjTdCaFx69yhyly/d9A=;
 b=II36Z3I+679F1Ttu1OVa8GamxZVTtkm0g9gbmHWmYxu65mM0bU0kExcRQut9JzAhoPj351GCU3EMzUEMSl4Xs5KVb4lTtkcxIwicrqwqGd4ylhmghw5P/P1T1zTQmRMo/+hHZ+NLK88L0Ll7SiNMPYVkIieTjeK1pHEhcKt3Ccbvzc2shZkMzxFl0GGsoW2co9CSGtq4hbvmwql9HsSvxa/c+68qBESRTjgzNiQ4KwY5MIyffyRAg0XCBkJwL/q8zg++pn+pMX6oq1aB+4ZYf5OOH2Pl0+wBqh0lvEm/mniDT2F7OgI7EszMvOxRkIYTbRzhR9oSoTt+g9s/Afuqnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BSjGmqgHk1W5AlzakZsmiivBmjTdCaFx69yhyly/d9A=;
 b=hRonke/GeEbLrjlAUNsl1NE8jLC+mbrDT1BxqiKJybGQIjFIiVGKF0dhg1BO+jwEOTcWJrUb6atJpHO6gVZGGka0SDTNxiiWySXOifTL3gXXTuBLbBW40e9GjeFL7Ns9Y2qMHxe7FGio/mU86e8B0baonHZRkpIDCL72xvTqHWw=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1577.namprd11.prod.outlook.com (10.172.37.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Mon, 7 Oct 2019 07:53:21 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::b125:76c1:c9b1:34f4]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::b125:76c1:c9b1:34f4%10]) with mapi id 15.20.2327.023; Mon, 7 Oct 2019
 07:53:21 +0000
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
Thread-Index: AQHVaHpLr7113TR4Hk2itVe9BFeajadO9gMA
Date:   Mon, 7 Oct 2019 07:53:21 +0000
Message-ID: <c17182ac-67dd-d11f-5daf-066bf446b969@microchip.com>
References: <1568189911-31641-1-git-send-email-eugen.hristev@microchip.com>
In-Reply-To: <1568189911-31641-1-git-send-email-eugen.hristev@microchip.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR09CA0060.eurprd09.prod.outlook.com
 (2603:10a6:802:28::28) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20191007104736728
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0933122f-09e1-4470-7d2d-08d74afb6c60
x-ms-traffictypediagnostic: DM5PR11MB1577:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB157721F44F0E0BAB14940BAFE89B0@DM5PR11MB1577.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(39860400002)(376002)(136003)(366004)(346002)(199004)(189003)(2906002)(66946007)(66556008)(66476007)(66446008)(64756008)(2201001)(36756003)(5660300002)(99286004)(31696002)(86362001)(3846002)(6116002)(53546011)(26005)(102836004)(6506007)(386003)(186003)(52116002)(76176011)(110136005)(2501003)(71200400001)(71190400001)(31686004)(316002)(81156014)(8676002)(25786009)(446003)(14454004)(478600001)(486006)(6486002)(8936002)(81166006)(476003)(229853002)(11346002)(2616005)(107886003)(6436002)(6512007)(7736002)(305945005)(14444005)(4326008)(66066001)(256004)(6246003)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1577;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +FLiBIK+Tct2QgWlSXgRsrrGdGsbhae3zK/VYvILUcnouqbUQdvnh3lbeuORrt9WoLRfb+7gvKUXOvv1I+Zpq54+5FFDTjprHmrxdGNxHLL4l0Qc0Mhe1g4rT68HbLshClxsGzPIBAxeY3x3vZvgFFo88O1N16/kh4UFj4AxwXj/cBYao6VQP0aq64bC2feit1vHOB/ZfTV2CPKNvRpFCMjvmWP4gcI0bCy+PAP6PfEo7wbdqgjoaKo8cJ7svdHTYUo5XBipeevjxkztgsUChG2r9liEv+fBzj7cuaVyIvZH9JcTag6po4uStQo9eUsiU4hu+WOZjF3jgRwbdu41h/ADCb4RS5mxgh3MT3++TeGvuSbMaOEH14c+TnaKG11q8+Fhp4M88Gw9BNHgwnBGMvxPddAk0ogb/9ou6lqfLB4=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AFA9552F544D064B9390772CF4786D08@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0933122f-09e1-4470-7d2d-08d74afb6c60
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 07:53:21.4612
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P0Ahm98Hg/Ijfohktv1rN7t1gXpmuYuuayRiODPDAXmzbVm0a8jyoqEvecae+I4Chiw+xos7QyLVRhzLx1BEIMlrAn0DmcVGYiDxhsMnNGc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1577
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCk9uIDExLjA5LjIwMTkgMTE6MjQsIEV1Z2VuIEhyaXN0ZXYgLSBNMTgyODIgd3JvdGU6DQo+
IEZyb206IEV1Z2VuIEhyaXN0ZXYgPGV1Z2VuLmhyaXN0ZXZAbWljcm9jaGlwLmNvbT4NCj4gDQo+
IEhlbGxvLA0KPiANCj4gVGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciBhbmFsb2cgYW5kIGRp
Z2l0YWwgZmlsdGVycyBmb3IgaTJjIGNvbnRyb2xsZXJzDQo+IA0KPiBUaGlzIHNlcmllcyBpcyBi
YXNlZCBvbiB0aGUgc2VyaWVzOg0KPiBbUEFUQ0ggdjIgMC85XSBpMmM6IGF0OTE6IGZpbHRlcnMg
c3VwcG9ydCBmb3IgYXQ5MSBTb0NzDQo+IGFuZCBsYXRlcg0KPiBbUEFUQ0ggdjQgMC85XSBpMmM6
IGFkZCBzdXBwb3J0IGZvciBmaWx0ZXJzDQo+IGFuZCBlbmhhbmNlZCB0byBhZGQgdGhlIGJpbmRp
bmdzIGZvciBhbGwgY29udHJvbGxlcnMgcGx1cyBhbiBleHRyYSBiaW5kaW5ncw0KPiBmb3IgdGhl
IHdpZHRoIG9mIHRoZSBzcGlrZXMgaW4gbmFub3NlY29uZHMgKGRpZ2l0YWwgZmlsdGVycykgYW5k
IGN1dC1vZmYNCj4gZnJlcXVlbmN5IChhbmFsb2cgZmlsdGVycykNCj4gDQo+IEZpcnN0LCBiaW5k
aW5ncyBhcmUgY3JlYXRlZCBmb3INCj4gJ2kyYy1hbmFsb2ctZmlsdGVyJw0KPiAnaTJjLWRpZ2l0
YWwtZmlsdGVyJw0KPiAnaTJjLWRpZ2l0YWwtZmlsdGVyLXdpZHRoLW5zJw0KPiAnaTJjLWFuYWxv
Zy1maWx0ZXItY3V0b2ZmLWZyZXF1ZW5jeScNCj4gDQo+IFRoZSBzdXBwb3J0IGlzIGFkZGVkIGlu
IHRoZSBpMmMgY29yZSB0byByZXRyaWV2ZSBmaWx0ZXIgd2lkdGgvY3V0b2ZmIGZyZXF1ZW5jeQ0K
PiBhbmQgYWRkIGl0IHRvIHRoZSB0aW1pbmdzIHN0cnVjdHVyZS4NCj4gTmV4dCwgdGhlIGF0OTEg
ZHJpdmVyIGlzIGVuaGFuY2VkIGZvciBzdXBwb3J0aW5nIGRpZ2l0YWwgZmlsdGVyLCBhZHZhbmNl
ZA0KPiBkaWdpdGFsIGZpbHRlciAod2l0aCBzZWxlY3RhYmxlIHNwaWtlIHdpZHRoKSBhbmQgdGhl
IGFuYWxvZyBmaWx0ZXIuDQo+IA0KPiBGaW5hbGx5IHRoZSBkZXZpY2UgdHJlZSBmb3IgdHdvIGJv
YXJkcyBhcmUgbW9kaWZpZWQgdG8gbWFrZSB1c2Ugb2YgdGhlDQo+IG5ldyBwcm9wZXJ0aWVzLg0K
PiANCj4gVGhpcyBzZXJpZXMgaXMgdGhlIHJlc3VsdCBvZiB0aGUgY29tbWVudHMgb24gdGhlIE1M
IGluIHRoZSBkaXJlY3Rpb24NCj4gcmVxdWVzdGVkOiB0byBtYWtlIHRoZSBiaW5kaW5ncyBnbG9i
YWxseSBhdmFpbGFibGUgZm9yIGkyYyBkcml2ZXJzLg0KPiANCj4gQ2hhbmdlcyBpbiB2NToNCj4g
LSByZW5hbWVkIGkyYy1maWx0ZXItd2lkdGgtbnMgdG8gaTJjLWRpZ2l0YWwtZmlsdGVyLXdpZHRo
LW5zIGFzIHRoaXMNCj4gaXMgYXBwbGljYWJsZSBvbmx5IHRvIGRpZ2l0YWwgZmlsdGVyDQo+IC0g
Y3JlYXRlZCBuZXcgYmluZGluZyBpMmMtZGlnaXRhbC1maWx0ZXItd2lkdGgtbnMgZm9yIGFuYWxv
ZyBmaWx0ZXJzLg0KDQpIZWxsbyBXb2xmcmFtIGFuZCBQZXRlciwNCg0KQXJlIHlvdSBoYXBweSB3
aXRoIHRoZSBjaGFuZ2VzIGluIHRoaXMgdmVyc2lvbj8gSSBoYXZlbid0IGhlYXJkIGZyb20geW91
IA0Kc2luY2UgdGhpcyBsYXRlc3QgdXBkYXRlLg0KSSBhbSBpbnRlcmVzdGVkIHRvIGtub3cgaWYg
YW55bW9yZSBjaGFuZ2VzIGFyZSByZXF1aXJlZCBvciBtYXliZSB3ZSBjYW4gDQptb3ZlIGZ1cnRo
ZXIgd2l0aCB0aGlzIHN1cHBvcnQuDQoNClRoYW5rcyAhDQpFdWdlbg0KDQo+IA0KPiBDaGFuZ2Vz
IGluIHY0Og0KPiAtIHJlbmFtZWQgaTJjLWFuYS1maWx0ZXIgdG8gaTJjLWFuYWxvZy1maWx0ZXIN
Cj4gLSByZW5hbWVkIGkyYy1kaWctZmlsdGVyIHRvIGkyYy1kaWdpdGFsLWZpbHRlcg0KPiANCj4g
Q2hhbmdlcyBpbiB2MzoNCj4gLSBtYWRlIGJpbmRpbmdzIGdsb2JhbCBmb3IgaTJjIGNvbnRyb2xs
ZXJzIGFuZCBtb2RpZmllZCBhY2NvcmRpbmdseQ0KPiAtIGdhdmUgdXAgUEFERkNERiBiaXQgYmVj
YXVzZSBpdCdzIGEgbGFjayBpbiBkYXRhc2hlZXQNCj4gLSB0aGUgY29tcHV0YXRpb24gb24gdGhl
IHdpZHRoIG9mIHRoZSBzcGlrZSBpcyBiYXNlZCBvbiBwZXJpcGggY2xvY2sgYXMgaXQNCj4gaXMg
ZG9uZSBmb3IgaG9sZCB0aW1lLg0KPiANCj4gQ2hhbmdlcyBpbiB2MjoNCj4gLSBhZGRlZCBkZXZp
Y2UgdHJlZSBiaW5kaW5ncyBhbmQgc3VwcG9ydCBmb3IgZW5hYmxlLWFuYS1maWx0IGFuZA0KPiBl
bmFibGUtZGlnLWZpbHQNCj4gLSBhZGRlZCB0aGUgbmV3IHByb3BlcnRpZXMgdG8gdGhlIERUIGZv
ciBzYW1hNWQ0X3hwbGFpbmVkL3NhbWE1ZDJfeHBsYWluZWQNCj4gDQo+IEV1Z2VuIEhyaXN0ZXYg
KDkpOg0KPiAgICBkdC1iaW5kaW5nczogaTJjOiBhdDkxOiBhZGQgbmV3IGNvbXBhdGlibGUNCj4g
ICAgZHQtYmluZGluZ3M6IGkyYzogYWRkIGJpbmRpbmdzIGZvciBpMmMgYW5hbG9nIGFuZCBkaWdp
dGFsIGZpbHRlcg0KPiAgICBpMmM6IGFkZCBzdXBwb3J0IGZvciBmaWx0ZXJzIG9wdGlvbmFsIHBy
b3BlcnRpZXMNCj4gICAgaTJjOiBhdDkxOiBhZGQgbmV3IHBsYXRmb3JtIHN1cHBvcnQgZm9yIHNh
bTl4NjANCj4gICAgaTJjOiBhdDkxOiBhZGQgc3VwcG9ydCBmb3IgZGlnaXRhbCBmaWx0ZXJpbmcN
Cj4gICAgaTJjOiBhdDkxOiBhZGQgc3VwcG9ydCBmb3IgYWR2YW5jZWQgZGlnaXRhbCBmaWx0ZXJp
bmcNCj4gICAgaTJjOiBhdDkxOiBhZGQgc3VwcG9ydCBmb3IgYW5hbG9nIGZpbHRlcmluZw0KPiAg
ICBBUk06IGR0czogYXQ5MTogc2FtYTVkMl94cGxhaW5lZDogYWRkIGFuYWxvZyBhbmQgZGlnaXRh
bCBmaWx0ZXIgZm9yDQo+ICAgICAgaTJjDQo+ICAgIEFSTTogZHRzOiBhdDkxOiBzYW1hNWQ0X3hw
bGFpbmVkOiBhZGQgZGlnaXRhbCBmaWx0ZXIgZm9yIGkyYw0KPiANCj4gICBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1hdDkxLnR4dCB8ICAzICstDQo+ICAgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMudHh0ICAgICAgfCAxOCArKysrKysr
Kw0KPiAgIGFyY2gvYXJtL2Jvb3QvZHRzL2F0OTEtc2FtYTVkMl94cGxhaW5lZC5kdHMgICAgICAg
IHwgIDYgKysrDQo+ICAgYXJjaC9hcm0vYm9vdC9kdHMvYXQ5MS1zYW1hNWQ0X3hwbGFpbmVkLmR0
cyAgICAgICAgfCAgMSArDQo+ICAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hdDkxLWNvcmUuYyAg
ICAgICAgICAgICAgICAgfCAzOCArKysrKysrKysrKysrKysrKw0KPiAgIGRyaXZlcnMvaTJjL2J1
c3Nlcy9pMmMtYXQ5MS1tYXN0ZXIuYyAgICAgICAgICAgICAgIHwgNDkgKysrKysrKysrKysrKysr
KysrKystLQ0KPiAgIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS5oICAgICAgICAgICAgICAg
ICAgICAgIHwgMTMgKysrKysrDQo+ICAgZHJpdmVycy9pMmMvaTJjLWNvcmUtYmFzZS5jICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgNiArKysNCj4gICBpbmNsdWRlL2xpbnV4L2kyYy5oICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA2ICsrKw0KPiAgIDkgZmlsZXMgY2hhbmdlZCwg
MTM2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+IA0K

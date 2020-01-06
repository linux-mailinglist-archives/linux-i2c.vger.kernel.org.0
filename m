Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 704F5131667
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2020 17:58:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgAFQ6s (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jan 2020 11:58:48 -0500
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:48224 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbgAFQ6s (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Jan 2020 11:58:48 -0500
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
  Codrin.Ciubotariu@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Codrin.Ciubotariu@microchip.com";
  x-sender="Codrin.Ciubotariu@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
  include:servers.mcsv.net include:mktomail.com
  include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Codrin.Ciubotariu@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com; spf=Pass smtp.mailfrom=Codrin.Ciubotariu@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: azee5UyKdEK2ILetTgSIC6OO6pyUjMEwJezZOOKaHLNZd+A70LUkKWH64UbuuD5Rgp6l4HJhrh
 9UILhV5APyEIKIE1HFdP4gE1KuX23RzUd/v/S1qbUllUFAn0ReDK1nU3gM7mlSDaBL/GssHDZN
 LD00gXbTItnyu02P4stB3IzJrSQsH+eZnaQMiqYgsFsitIzKjlTFlxotoqCj6l4xkaqmYrs4k0
 Fn6s4K+zM4kaQapUtUFIXitx7pKBEa26cwmwdnohqYtT3C6bGDrW5o1fbJ5i6ezFxKaeihogdD
 wwg=
X-IronPort-AV: E=Sophos;i="5.69,403,1571727600"; 
   d="scan'208";a="63769199"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Jan 2020 09:58:45 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 6 Jan 2020 09:58:43 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 6 Jan 2020 09:58:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MHBks47M+hTrQ1CVlZlY0bKY8VFB1pLgarvH+bIUt1uwBBH08aI+g85KM3dkMELY7joZ/P4Gc3DFBDWZZlgbZCCLy3HBK97B0GBKDsooPWhNLgzlDfUXxZOap7Vr5JSZjgX9uDQX32l8AxN8gDeTVd9lPJ11E3uPA/RDguga+m9xE6oQCQTVoKFquuOheJS3MLD0XA2eAYxF5N9NYv0IEjwmIlnm6u5U9mFtRI9IqP0ol0+CHtY8Ny+K4gDQkIpvxYmO1KAkfP5asrVLeDx28waWPfwcycysT2xK9UzEZBxw3oqD4ro8jcr+Q1sK1OGU5UnNBDZnLDLct6yoC8C2ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jgnq/i1Hdrrizale9zkzOkgt4qn3+C35nAgN3CJSW6k=;
 b=kjSLQkdJfrxsv91kiggJYOPpwCtO1HLUD/k4bV+CSRDI8D7QaJfjR/XU/jFXFbk0fBtHYtc1TymLeXVMjvRKo8ZotgiCf5i16j5bGhB0gGsBrZfZ/tUIGn1r4phU74to2yZdPmPav9Yz4ksPqp3TEu7Ws2Ex2jTMOL1V8q0CVOxbl6oS+jeU8INXmikmtK/dR3O47XexIv8rjKRIULNmyuDXWLjeGDCQp4zXGfeF/Cy6t3fxcmqixv3DdBLlgc2x8P0qTyQC8iyolctH6I1WUfOAz4XTy97Hg6r8QNYsOGSraT0PQ2EGmO4ZIeapjn4QRLW2JIz3GKy5VklsC2RBxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jgnq/i1Hdrrizale9zkzOkgt4qn3+C35nAgN3CJSW6k=;
 b=PsC3/LNJ2MkQYzU+eGR0/50n0SGHWXUKXwXWXdXSO/ID7mrGVNliXG++e0fZ1CAtmbYmSo3NyJsH4j/ioeokiojSB0038qs1T5RHQd4Mep6A5zJDh8F4+ciPKRgZ/sKYHRfX/V9wj7JvyFq+ioQ6IiJbsHtcCUcE7dZJlLQ4gc8=
Received: from BY5PR11MB4497.namprd11.prod.outlook.com (52.132.255.220) by
 BY5PR11MB3944.namprd11.prod.outlook.com (10.255.162.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.12; Mon, 6 Jan 2020 16:58:40 +0000
Received: from BY5PR11MB4497.namprd11.prod.outlook.com
 ([fe80::6189:c32:b55b:b3fd]) by BY5PR11MB4497.namprd11.prod.outlook.com
 ([fe80::6189:c32:b55b:b3fd%5]) with mapi id 15.20.2602.015; Mon, 6 Jan 2020
 16:58:40 +0000
From:   <Codrin.Ciubotariu@microchip.com>
To:     <peda@axentia.se>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <kamel.bouhara@bootlin.com>, <wsa@the-dreams.de>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>, <robh@kernel.org>
Subject: Re: [PATCH v2 4/6] ARM: at91/dt: sama5d3: add i2c gpio pinctrl
Thread-Topic: [PATCH v2 4/6] ARM: at91/dt: sama5d3: add i2c gpio pinctrl
Thread-Index: AQHVwhsLdxsZpEnI6UWudjXfEFHmN6fbG4OAgALFWoA=
Date:   Mon, 6 Jan 2020 16:58:39 +0000
Message-ID: <91f1362e-590d-4592-bc16-5d2393f73199@microchip.com>
References: <20200103094821.13185-1-codrin.ciubotariu@microchip.com>
 <20200103094821.13185-5-codrin.ciubotariu@microchip.com>
 <e22772f8-9e6d-002d-98d7-414136a32439@axentia.se>
In-Reply-To: <e22772f8-9e6d-002d-98d7-414136a32439@axentia.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bfebed43-aad4-411e-9baf-08d792c9aded
x-ms-traffictypediagnostic: BY5PR11MB3944:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB3944642680D73CD82EF6C8A0E73C0@BY5PR11MB3944.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0274272F87
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(366004)(396003)(39860400002)(346002)(376002)(199004)(189003)(52314003)(6512007)(2906002)(6486002)(8936002)(31686004)(71200400001)(478600001)(86362001)(81156014)(81166006)(2616005)(6506007)(8676002)(76116006)(91956017)(53546011)(31696002)(66946007)(186003)(36756003)(5660300002)(110136005)(4326008)(26005)(66556008)(66476007)(66446008)(64756008)(54906003)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:BY5PR11MB3944;H:BY5PR11MB4497.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w7iRiAWtIsamMT87zvbbtcEKFv8LPcwz8t/5wO4nT+OQFuWy6OYZtKPrhmY7IHxP8Whd8+JkpgTiRPcJoUX5jks2iIvKbwPrxDL8DivNcGJMT9J86+CirrfKpSS/ErVJlOexivT0ZRsq9dfhBLlQ6DQh8ClvN92dSArCm10ykS6eek1FNEVCi9qW/7GGz7zuxz+Kb/+5x03giNk/hDtMn3yVyz329yJWeQ/nxCgkBKiqvVdCLpfllcFICJG7GfDnbtkxHL2/FBbW5a04Awja4HXPUK1sI1h7pR2uCrrdWiGtc1cYfXOo5daQXR8Fv0Vw/bOIR9KiwRCZymM9ogUgFMK0aQTOQpYF3Uj7OUWNDF/ab+I5RSsrESDXKfE6gL2VI/k1wrEFL6tBi8zSCT45Igpx9taUZOd9z8/O/71OnEmARK6jZokaXc8aCBMDa/nUiYAEj7laU64y+7z3kkOHpHB3UXYUm0uTaQUXDuhj59jxQ2u9LMp5R11uWnYXqJTW
Content-Type: text/plain; charset="utf-8"
Content-ID: <25D5C0D394FFCB4AB26D9D6D5890582B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bfebed43-aad4-411e-9baf-08d792c9aded
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2020 16:58:39.9437
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Buq0qagEN8yNoOPRFNPc/ruIBR7ia0hL7Qijl3L5Qc9wXUmL+pvOEbsikFxpeoLp+Qe4xBW8q/j1SKX8MdS8x6BHu/uKhlmMaVZNBfXfCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3944
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMDUuMDEuMjAyMCAwMDozOSwgUGV0ZXIgUm9zaW4gd3JvdGU6DQo+IE9uIDIwMjAtMDEtMDMg
MTA6NDksIENvZHJpbi5DaXVib3Rhcml1QG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+PiBGcm9tOiBL
YW1lbCBCb3VoYXJhIDxrYW1lbC5ib3VoYXJhQGJvb3RsaW4uY29tPg0KPj4NCj4+IEFkZCB0aGUg
aTJjIGdwaW8gcGluY3RybHMgdG8gc3VwcG9ydCB0aGUgaTJjIGJ1cyByZWNvdmVyeQ0KPj4NCj4+
IFNpZ25lZC1vZmYtYnk6IEthbWVsIEJvdWhhcmEgPGthbWVsLmJvdWhhcmFAYm9vdGxpbi5jb20+
DQo+PiAtLS0NCj4+DQo+PiBDaGFuZ2VzIGluIHYyOg0KPj4gICAtIG5vbmU7DQo+Pg0KPj4gICBh
cmNoL2FybS9ib290L2R0cy9zYW1hNWQzLmR0c2kgfCAzMyArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKystLS0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pDQo+Pg0KPiANCj4gKnNuaXAqDQo+IA0KPj4gQEAgLTYzOSw2ICs2NDgsMTIgQEAN
Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICA8QVQ5MV9QSU9BIDMwIEFUOTFfUEVSSVBIX0EgQVQ5MV9QSU5DVFJMX05PTkUgICAvKiBQQTMw
IHBlcmlwaCBBIFRXRDAgcGluLCBjb25mbGljdHMgd2l0aCBVUlhEMSwgSVNJX1ZTWU5DICovDQo+
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IEFUOTFfUElPQSAzMSBBVDkxX1BFUklQSF9BIEFUOTFfUElOQ1RSTF9OT05FPjsgLyogUEEzMSBw
ZXJpcGggQSBUV0NLMCBwaW4sIGNvbmZsaWN0cyB3aXRoIFVUWEQxLCBJU0lfSFNZTkMgKi8NCj4+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH07DQo+PiArDQo+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBpbmN0cmxfaTJjMF9ncGlvOiBpMmMw
LWdwaW8gew0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGF0bWVsLHBpbnMgPQ0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgPEFUOTFfUElPQSAzMCBBVDkxX1BFUklQSF9HUElPIEFUOTFfUElOQ1RS
TF9QVUxMX1VQDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgQVQ5MV9QSU9BIDMxIEFUOTFfUEVSSVBIX0dQSU8gQVQ5MV9QSU5DVFJMX1BV
TExfVVA+Ow0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9Ow0KPiAN
Cj4gSSdtIGN1cmlvdXMsIGJ1dCB3aHkgYXJlIHB1bGwtdXBzIHN1ZGRlbmx5IG5lZWRlZCBqdXN0
IGJlY2F1c2UgdGhlIHBpbnMgYXJlDQo+IHVzZWQgZm9yIEdQSU8gcmVjb3Zlcnk/IFdoeSBhcmUg
cHVsbC11cHMgbm90IG5lZWRlZCB3aGVuIHRoZSBwaW5zIGFyZSB1c2VkDQo+IGJ5IHRoZSBJMkMg
cGVyaXBoZXJhbCBkZXZpY2Uocyk/DQo+IA0KPiBHaXZlbiBmaWd1cmUgMjctMiAiSS9PIExpbmUg
Q29udHJvbCBMb2dpYyIgaW4gbXkgU0FNQTVEMyBkYXRhc2hlZXQsIEkgc2VlDQo+IG5vIGRpZmZl
cmVuY2UgYXMgdG8gaG93IGFuZCB3aHkgdGhlIHB1bGwtdXBzIGFyZSBhcHBsaWVkIGRlcGVuZGlu
ZyBvbiB3aGF0DQo+IHRoZSBjdXJyZW50IGZ1bmN0aW9uIG9mIHRoZSBwaW4gaXMuIFNvLCBpZiB0
aGUgSTJDIGJ1cyB3b3JrcyB3L28gcHVsbHMsIGJ1cw0KPiByZWNvdmVyeSB1c2luZyBHUElPIG11
c3QgYWxzbyB3b3JrIHcvbyBwdWxscy4NCj4gDQo+IEkuZS4gdGhlIGRldmljZSB0cmVlIHJlcXVp
cmVzIHlvdSB0byBoYXZlIGV4dGVybmFsIHB1bGwtdXBzIG9uIHRoZSBJMkMgYnVzDQo+IGFueXdh
eSwgc28gd2h5IGJvdGhlciB3aXRoIGludGVybmFsIHB1bGwtdXBzIGZvciB0aGUgcmVjb3Zlcnkg
Y2FzZT8NCj4gDQo+IENoYW5naW5nIHB1bGwtdXAgc2V0dGluZ3MganVzdCBmb3IgcmVjb3Zlcnkg
ZmVlbHMgbGlrZSBzb21ldGhpbmcgdGhhdCB3aWxsDQo+IGluZXZpdGFibHkgY3JlYXRlIGhhcmQg
dG8gZGVidWcgc3VycHJpc2VzIGF0IHRoZSBsZWFzdCBvcHBvcnR1bmUgdGltZS4uLg0KPiANCj4g
T3IgYW0gSSBtaXNzaW5nIHNvbWV0aGluZz8NCj4gDQo+IChJJ20gZm9jdXNpbmcgb24gU0FNQTVE
MyBzaW5jZSB0aGF0IGlzIHdoYXQgSSBoYXBwZW4gdG8gd29yayB3aXRoLA0KPiAgIGJ1dCB0aGUg
c2FtZSBxdWVzdGlvbiBhcHBlYXJzIHRvIGFwcGx5IGZvciBTQU1BNUQyIGFuZCBTQU1BNUQ0Li4u
KQ0KDQpJIGRvbid0IHRoaW5rIHdlIG5lZWQgdGhlIHB1bGwtdXBzLiBJIHdpbGwgcmVtb3ZlIHRo
ZW0gaW4gdjMuDQoNClRoYW5rcyBhbmQgYmVzdCByZWdhcmRzLA0KQ29kcmluDQo=

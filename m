Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9178B527B7
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2019 11:14:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730196AbfFYJOR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jun 2019 05:14:17 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:56258 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728823AbfFYJOR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jun 2019 05:14:17 -0400
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.63,415,1557212400"; 
   d="scan'208";a="38780807"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Jun 2019 02:14:16 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex03.mchp-main.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 25 Jun 2019 02:14:37 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 25 Jun 2019 02:14:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQboUQZRVJ1cLGfCsaE2CbtP+tIP5CWRsoBrKFaRZT0=;
 b=m/iMZuccxjq4szPCOT4OPZPLTjt6SBjN2JAlemPxKe5pOH8mO49gl5/ZX01EcpRbP4KPNgZffGaCd6x+I6gTndI9tABGwlqWm3FfFnGFS+eTaPBVFhiZH/NHt63wK7BajnlwGUsBPQVwdzlSkiVTNTh1t0JMS6I+gGSeuUImIRM=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB0075.namprd11.prod.outlook.com (10.164.155.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Tue, 25 Jun 2019 09:14:13 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::6476:ace0:bf3a:322]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::6476:ace0:bf3a:322%9]) with mapi id 15.20.2008.017; Tue, 25 Jun 2019
 09:14:13 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <peda@axentia.se>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>, <wsa@the-dreams.de>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 6/9] dt-bindings: i2c: at91: add binding for
 enable-ana-filt
Thread-Topic: [PATCH v2 6/9] dt-bindings: i2c: at91: add binding for
 enable-ana-filt
Thread-Index: AQHVKyyv+/RK0NIkBk254PAOuF5Z96asET2AgAAEBoA=
Date:   Tue, 25 Jun 2019 09:14:13 +0000
Message-ID: <84628b5e-bea7-7d91-f790-f3a2650040fa@microchip.com>
References: <1561449642-26956-1-git-send-email-eugen.hristev@microchip.com>
 <1561449642-26956-7-git-send-email-eugen.hristev@microchip.com>
 <4e81d3c9-25f3-ca6e-f2d5-17fad5905bb8@axentia.se>
In-Reply-To: <4e81d3c9-25f3-ca6e-f2d5-17fad5905bb8@axentia.se>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0401CA0016.eurprd04.prod.outlook.com
 (2603:10a6:800:4a::26) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190625121017485
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f064436-3c8c-4001-82b1-08d6f94d7d8a
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB0075;
x-ms-traffictypediagnostic: DM5PR11MB0075:
x-microsoft-antispam-prvs: <DM5PR11MB0075FD35D254E0E3DAFA9E98E8E30@DM5PR11MB0075.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(346002)(396003)(366004)(39860400002)(136003)(189003)(199004)(5660300002)(305945005)(53936002)(6116002)(3846002)(86362001)(14454004)(25786009)(6436002)(2201001)(53546011)(446003)(66066001)(31696002)(6506007)(386003)(476003)(99286004)(8936002)(102836004)(6246003)(2616005)(486006)(229853002)(68736007)(6512007)(76176011)(7736002)(6486002)(66446008)(66556008)(66476007)(8676002)(64756008)(31686004)(2501003)(52116002)(478600001)(110136005)(81166006)(11346002)(26005)(66946007)(73956011)(316002)(72206003)(36756003)(186003)(256004)(2906002)(71190400001)(71200400001)(81156014)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB0075;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iBXj0ulX8MxhJ1vuQAQpi93D15L7Oog5P1541b8v8sz1uzVsUDHdKqXWCXUyqmDgXRq5yfEpFWmocxt3E/LPLGgacRQm0IqgsD/e1ZsiL5LPO3KG4PkFTnvkv06kB5nPTwQFIsWOgA8jHjqossrS10RO5rZYrQn8DxtKYBFdwuv/LzRG+WzeGSQl8UWBrQWE7GDDpctULz3pasaAKnjx+Q/yd5zoRlLXP2uz97lDedOLC2LUC4iARcj8rEZt7DAsyMtJFP7o2OkYYPy5uMRAUGW966XAHLFdo6QzVmgmUJ9hq5dvGwHAIV439i8+aACcMCkJCn1+Nvmd5AXCYm2kI46msP4o6JjwTayRAp4ENTMMk2/IFrwGoG+pJRdDgXaAcDnYoO/H9cMGTC9xIqS7E2uckmCUsBn5t5svSS33d7Y=
Content-Type: text/plain; charset="utf-8"
Content-ID: <21506B8E5B03ED40A516D9564C071A00@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f064436-3c8c-4001-82b1-08d6f94d7d8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 09:14:13.5723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eugen.hristev@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0075
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCk9uIDI1LjA2LjIwMTkgMTE6NTUsIFBldGVyIFJvc2luIHdyb3RlOg0KDQo+IA0KPiBPbiAy
MDE5LTA2LTI1IDEwOjA1LCBFdWdlbi5IcmlzdGV2QG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+PiBG
cm9tOiBFdWdlbiBIcmlzdGV2IDxldWdlbi5ocmlzdGV2QG1pY3JvY2hpcC5jb20+DQo+Pg0KPj4g
QWRkIGJpbmRpbmcgc3BlY2lmaWNhdGlvbiBmb3IgYW5hbG9naWMgZmlsdGVyIGluc2lkZSB0aGUg
aTJjIGNvbnRyb2xsZXINCj4gDQo+IHMvYW5hbG9naWMvdGhlIGFuYWxvZy8NCj4gDQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBFdWdlbiBIcmlzdGV2IDxldWdlbi5ocmlzdGV2QG1pY3JvY2hpcC5jb20+DQo+
PiAtLS0NCj4+ICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtYXQ5
MS50eHQgfCA0ICsrKysNCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0KPj4N
Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2ky
Yy1hdDkxLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJjLWF0
OTEudHh0DQo+PiBpbmRleCA4MjY4NTk1Li4yMGQzMzRjIDEwMDY0NA0KPj4gLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtYXQ5MS50eHQNCj4+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJjLWF0OTEudHh0DQo+PiBAQCAt
MjMsNiArMjMsOSBAQCBPcHRpb25hbCBwcm9wZXJ0aWVzOg0KPj4gICAtIGVuYWJsZS1kaWctZmls
dDogRW5hYmxlIHRoZSBidWlsdC1pbiBkaWdpdGFsIGZpbHRlciBvbiB0aGUgaTJjIGxpbmVzLA0K
Pj4gICAgIHNwZWNpZmljYWxseSByZXF1aXJlZCBkZXBlbmRpbmcgb24gdGhlIGhhcmR3YXJlIFBD
Qi9ib2FyZCBhbmQgaWYgdGhlDQo+PiAgICAgdmVyc2lvbiBvZiB0aGUgY29udHJvbGxlciBpbmNs
dWRlcyBpdC4NCj4+ICstIGVuYWJsZS1hbmEtZmlsdDogRW5hYmxlIHRoZSBidWlsdC1pbiBhbmFs
b2dpYyBmaWx0ZXIgb24gdGhlIGkyYyBsaW5lcywNCj4+ICsgIHNwZWNpZmljYWxseSByZXF1aXJl
ZCBkZXBlbmRpbmcgb24gdGhlIGhhcmR3YXJlIFBDQi9ib2FyZCBhbmQgaWYgdGhlDQo+PiArICB2
ZXJzaW9uIG9mIHRoZSBjb250cm9sbGVyIGluY2x1ZGVzIGl0Lg0KPj4gICAtIENoaWxkIG5vZGVz
IGNvbmZvcm1pbmcgdG8gaTJjIGJ1cyBiaW5kaW5nDQo+PiAgIA0KPj4gICBFeGFtcGxlcyA6DQo+
PiBAQCAtNjAsNiArNjMsNyBAQCBpMmMwOiBpMmNAZjgwMzQ2MDAgew0KPj4gICAJYXRtZWwsZmlm
by1zaXplID0gPDE2PjsNCj4+ICAgCWkyYy1zZGEtaG9sZC10aW1lLW5zID0gPDMzNj47DQo+PiAg
IAllbmFibGUtZGlnLWZpbHQ7DQo+PiArCWVuYWJsZS1hbmEtZmlsdDsNCj4gDQo+IFBlcmhhcHMN
Cj4gDQo+IAltaWNyb2NoaXAsZGlnaXRhbC1maWx0ZXI7DQo+IAltaWNyb2NoaXAsYW5hbG9nLWZp
bHRlcjsNCj4gDQo+ID8NCg0KSGkgUGV0ZXIsDQoNClRoYW5rcyBmb3IgcmV2aWV3aW5nLiBUaGUg
bmFtZSBvZiB0aGUgcHJvcGVydHkgZG9lcyBub3QgbWF0dGVyIG11Y2ggdG8gDQptZSwgYW5kIHdl
IGhhdmUgcHJvcGVydGllcyBwcmVmaXhlZCB3aXRoIHZlbmRvciwgYW5kIHNvbWUgYXJlIG5vdC4N
Cg0KQEFsZXhhbmRyZSBCZWxsb25pOiB3aGljaCBuYW1lIHlvdSB0aGluayBpdCdzIGJlc3QgPw0K
DQpFdWdlbg0KDQo+IA0KPiBDaGVlcnMsDQo+IFBldGVyDQo+IA0KPj4gICANCj4+ICAgCXdtODcz
MTogd204NzMxQDFhIHsNCj4+ICAgCQljb21wYXRpYmxlID0gIndtODczMSI7DQo+Pg0KPiANCg==

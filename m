Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAE10E350D
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2019 16:08:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404756AbfJXOIZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Oct 2019 10:08:25 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:36438 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389658AbfJXOIY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Oct 2019 10:08:24 -0400
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
  Codrin.Ciubotariu@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Codrin.Ciubotariu@microchip.com";
  x-sender="Codrin.Ciubotariu@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Codrin.Ciubotariu@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com; spf=Pass smtp.mailfrom=Codrin.Ciubotariu@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: PrxqaikAwrfnnNPSvIKIGexdX3b4TKLvdszW3DfQyFdF2lh0BZ/fl+wiaaD3cXfWMmlJsFcrTD
 VDs91TN7bQ4M9RUq1gjWyTbUwuOPpd2lFS4xYpOjDJdTQyPycbNTLa8mBAIlg1+/iAYSmBJmhW
 I775LRRJvQZHbaM2Ub8O/32/fJEDk+O6DEmmDDu0BwRSyTJuidPbi8Ib9XnfzG+uw0aMhkPK+r
 Prjntvr6lc/BAHpuE20z5zzBFrYhesQE5R2Qc1X/PerdRjLyHaWui3/S7NZma+h2vvNizfMXPX
 n2g=
X-IronPort-AV: E=Sophos;i="5.68,224,1569308400"; 
   d="scan'208";a="54255336"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Oct 2019 07:08:23 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 24 Oct 2019 07:08:22 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Thu, 24 Oct 2019 07:08:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U1MLYGMbCdTYs5C6YbhN7sVbIikFpbu0X7u2oWp8vFXVVQ0fwe5Pe3N/tBctxIZ9ZyfUBj9CEYXnkkA1uXIxOkA/jyDzCvMAH4zfbqiy1G7zzhBwZ+jXEXhryz2pQBlLDDWTa7I4QPLeKyIqQDvOS2J18KXNsTnEdkEJK6BIcub81KCXvVlgv1m5J8+miVzDAvdK0x28XasbIiYiOqKUgau1EG+tT3bLdKtbkhtU+5LHVgb2nCOiY3AdcYB3CX0LUhZd2//EM/CCjWQWKQZDCtnEeJ53KQpbGEhgKO4XB0IMwwTF+XjmlD0ZmQtGuxBvoUedhxfLeDu3AGlhRBUWJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyZZVkoRn3UIGafYECyb3X7DeCx6lrkIKsr0LV+OBkc=;
 b=DWL6t9WgfowB7SlnB/PrLMmxpkKRok32GGR7ozbeuMyDJ5Y7LCmTTxjKN+h4H3X6gSEJ4ejgpjcNBy3W80srO6D/INt9ajVIoTgEgsJuFv5K0XGMIccaMgVrFuobAud7VlJWbGi+TNJsySGL431Xn8uPydYNUJ3/GkkZL/yKuXEqOpNJ1bb9U+Py0/14h+exOcY706sfX5jPxx6mhO+KrKZkQQe851FTn42XNb+hHBha1HpxVwKX+h/y8gAkhe1FzCNwL0on2kNFZyuhTHco/XgCR1Vghsn/NvixC7wDde1BG8hjMZbNHaFXy+XZcnQnJMmHnaEOBntv5nrfckuz3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyZZVkoRn3UIGafYECyb3X7DeCx6lrkIKsr0LV+OBkc=;
 b=EXUIVfo1ucO04Iq70OsiyZM/6gZVX57djDIUho1DGX4xMY+9u77tPu8VCX4gWA+D1Z2e26aSEGZ87MaMSApNOolJvTwCxYzIBBL6iKMKv/QPugF1TBDd1Lmd3E5QphUDk6yB70PDqFr+LhPALSEwh5aoFkpmUtS7Mo2yZfbTbfU=
Received: from BY5PR11MB4497.namprd11.prod.outlook.com (52.132.255.220) by
 BY5PR11MB3957.namprd11.prod.outlook.com (10.255.72.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Thu, 24 Oct 2019 14:08:22 +0000
Received: from BY5PR11MB4497.namprd11.prod.outlook.com
 ([fe80::5830:772e:99d7:3a3]) by BY5PR11MB4497.namprd11.prod.outlook.com
 ([fe80::5830:772e:99d7:3a3%3]) with mapi id 15.20.2387.023; Thu, 24 Oct 2019
 14:08:21 +0000
From:   <Codrin.Ciubotariu@microchip.com>
To:     <kamel.bouhara@bootlin.com>, <wsa@the-dreams.de>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>, <devicetree@vger.kernel.org>,
        <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/4] i2c: at91: implement i2c bus recovery
Thread-Topic: [PATCH 2/4] i2c: at91: implement i2c bus recovery
Thread-Index: AQHVeTBjK0tNmFNyIkuOo6p8CcqP0qdlp6cAgADDS4CAA4uRgA==
Date:   Thu, 24 Oct 2019 14:08:21 +0000
Message-ID: <1e70ae35-052b-67cc-27c4-1077c211efd0@microchip.com>
References: <20191002144658.7718-1-kamel.bouhara@bootlin.com>
 <20191002144658.7718-3-kamel.bouhara@bootlin.com>
 <20191021202044.GB3607@kunai>
 <724d3470-0561-1b3f-c826-bc16c74a8c0a@bootlin.com>
In-Reply-To: <724d3470-0561-1b3f-c826-bc16c74a8c0a@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR2P264CA0027.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::15) To BY5PR11MB4497.namprd11.prod.outlook.com
 (2603:10b6:a03:1cc::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 66a09ab7-170a-45b2-ca99-08d7588ba09a
x-ms-traffictypediagnostic: BY5PR11MB3957:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB3957AB435BDF6DA94E74088AE76A0@BY5PR11MB3957.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0200DDA8BE
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(376002)(366004)(136003)(346002)(39860400002)(189003)(199004)(36756003)(26005)(8936002)(81166006)(81156014)(8676002)(2501003)(14454004)(53546011)(76176011)(6506007)(386003)(66066001)(25786009)(486006)(186003)(86362001)(52116002)(478600001)(99286004)(31696002)(11346002)(446003)(2616005)(256004)(6116002)(6486002)(5660300002)(6512007)(229853002)(2906002)(476003)(102836004)(4326008)(6246003)(6436002)(66476007)(66946007)(66446008)(64756008)(66556008)(71200400001)(71190400001)(305945005)(110136005)(54906003)(7736002)(31686004)(3846002)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:BY5PR11MB3957;H:BY5PR11MB4497.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CopqhEH6pFc2hAzrE7ViL3UX4fhPba4TV8VtT7goDjXbaI9pckw9/WQJj0Xt5PnvU+FziIeaWYytfGzz1IRzitmxAuzKfS9eyo56+uADwL8gotHgXDgeRVbd5aZuJtPP5RztpHOFTRGSA8/jKscNz7see8fyGQn+H+9lUYjwKVemQtZ9xITaqacEBneB6XupjpgP04O4wlrLoI6cmF5KqHkTfZt6/1Z+g3z9V/TOxxyNCI1czMDwr7EMWS9OMsmLIH7MalNG2Uo13whysuL2WiXlhLVRancJI/QzfrCDuBSwktzfpm0wt987y1oSwrLfRh9IFavsRsjohzT11x73MHhUxdcH9N+s8diKWLJYCJCcqDUqmOYsmYlCGlTbWorUZ0/c+0RBaRcT5898JHsoHDfK+PmnFelbsLicP5+FvcbFDovsOCyQFl4+UiDGV7lG
Content-Type: text/plain; charset="utf-8"
Content-ID: <E599F74D1D260C4AA9BDA63474521792@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 66a09ab7-170a-45b2-ca99-08d7588ba09a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2019 14:08:21.6800
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: swJ/whvCgLIodD7AcGUGJaxrFL4cEUkHbUnBsZkKxfbNcVlduv8U3CmByM1dmC2hJzLQ03kTBT+4D90Q49zj98U3n26aqrRCipdGCv2XrD0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3957
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjIuMTAuMjAxOSAxMDo1OSwgS2FtZWwgQm91aGFyYSB3cm90ZToNCj4gT24gMjEvMTAvMjAx
OSAyMjoyMCwgV29sZnJhbSBTYW5nIHdyb3RlOg0KPj4gT24gV2VkLCBPY3QgMDIsIDIwMTkgYXQg
MDQ6NDY6NTZQTSArMDIwMCwgS2FtZWwgQm91aGFyYSB3cm90ZToNCj4+PiBJbXBsZW1lbnQgaTJj
IGJ1cyByZWNvdmVyeSB3aGVuIHNsYXZlcyBkZXZpY2VzIG1pZ2h0IGhvbGQgU0RBIGxvdy4NCj4+
PiBJbiB0aGlzIGNhc2UgcmUtYXNzaWduIFNDTC9TREEgdG8gZ3Bpb3MgYW5kIGlzc3VlIDkgZHVt
bXkgY2xvY2sgcHVsc2VzDQo+Pj4gdW50aWwgdGhlIHNsYXZlIHJlbGVhc2UgU0RBLg0KPj4+DQo+
Pj4gU2lnbmVkLW9mZi1ieTogS2FtZWwgQm91aGFyYSA8a2FtZWwuYm91aGFyYUBib290bGluLmNv
bT4NCj4+DQo+PiBTZXR0aW5nIHVwIHRoZSBidXNfcmVjb3ZlcnkgbG9va3MgT0suIEhvd2V2ZXIs
IEkgZG9uJ3Qgc2VlIGFueSBjYWxsIHRvDQo+PiBpMmNfcmVjb3Zlcl9idXMoKSwgc28gdGhlIGJ1
c19yZWNvdmVyeSBpcyBuZXZlciB1c2VkLiBEaWQgeW91IHRlc3QgdGhpcw0KPj4gYW5kIHNlZSBh
biBlZmZlY3Q/DQo+Pg0KPiBJbmRlZWQsIEkgZ3Vlc3MgSSBtZXNzIGl0IHVwIHdoaWxlIGRvaW5n
IHNvbWUgZ2l0IHN0dWZmLCBpdCBzaG91bGQgYmUgDQo+IGNhbGxlZCBmcm9tIGF0OTFfZG9fdHdp
X3RyYW5zZmVyKCkgd2hlbiB0aGUgdHJhbnNmZXIgdGltZXMgb3V0Li4uDQo+IEkgYWN0dWFsbHkg
dGVzdGVkIGl0IGFuZCB2ZXJpZmllZCB0aGUgcmVjb3ZlcnkgaXMgdHJpZ2dlcmVkIGJ5IHB1bGxp
bmcgDQo+IHRoZSBTQ0wgdG8gdGhlIGdyb3VuZCAuLi4NCj4gDQo+PiBBbHNvLCBJIHRoaW5rIHdl
IHNob3VsZCBtZXJnZSB0aGlzIHBhdGNoICJbUEFUQ0ggdjNdIGkyYzogYXQ5MTogU2VuZCBidXMN
Cj4+IGNsZWFyIGNvbW1hbmQgaWYgU0NMIG9yIFNEQSBpcyBkb3duIiBpbnRvIHRoaXMgc2VyaWVz
LiBUaGUgY3J1Y2lhbCB0aGluZw0KPj4gZm9yIGJvdGggaXMgd2hlbiB0byBhcHBseSB0aGUgcmVj
b3ZlcnkgKGF0IHRoZSBiZWdpbm5pbmcgb2YgYQ0KPj4gdHJhbnNmZXIhKS4gVGhlIHJlc3QgaXMg
Imp1c3QiIHRoYXQgc29tZSBIVyBuZWVkcyBhIGJ1c19yZWNvdmVyeV9pbmZvDQo+PiBmb3IgcGlu
Y3RybC9HUElPIGhhbmRsaW5nIChmcm9tIHRoaXMgcGF0Y2gpLCB3aGlsZSBvdGhlciBIVyBuZWVk
cyBhDQo+PiBidXNfcmVjb3ZlcnlfaW5mbyB3aXRoIGEgY3VzdG9tIHJlY292ZXJfYnVzIGNhbGxi
YWNrLg0KPj4NCj4+IE9waW5pb25zPw0KPj4NCj4gSSdtIE9LIHRvIG1lcmdlIHRoZSB0d28gc2Vy
aWVzLg0KDQpTbyBhdCB0aGUgYmVnaW5uaW5nIG9mIGEgbmV3IHRyYW5zZmVyLCB3ZSBzaG91bGQg
Y2hlY2sgaWYgU0RBIChvciBTQ0w/KSANCmlzIGxvdyBhbmQsIGlmIGl0J3MgdHJ1ZSwgb25seSB0
aGVuIHdlIHNob3VsZCB0cnkgcmVjb3ZlciB0aGUgYnVzLg0KDQpLYW1lbCwgbGV0IG1lIGtub3cg
aWYgSSBjYW4gaGVscCB3aXRoIGFueXRoaW5nLg0KDQpCZXN0IHJlZ2FyZHMsDQpDb2RyaW4NCg0K

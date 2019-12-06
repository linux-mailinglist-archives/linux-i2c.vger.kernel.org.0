Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAA0F1155F9
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Dec 2019 17:58:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbfLFQ64 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Dec 2019 11:58:56 -0500
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:13831 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726271AbfLFQ64 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Dec 2019 11:58:56 -0500
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
  Codrin.Ciubotariu@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
  envelope-from="Codrin.Ciubotariu@microchip.com";
  x-sender="Codrin.Ciubotariu@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
  include:servers.mcsv.net include:mktomail.com
  include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
  envelope-from="Codrin.Ciubotariu@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com; spf=Pass smtp.mailfrom=Codrin.Ciubotariu@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: dKosNgJHfZQ0/A6WBOpD5/ufMMAWFOumrbuYgSPsAJKY97RK8X1HhJLqhTwyheKoS2YHaTal/n
 17MlyA+YSNAO4ozUCBt7LDa+8w5L06SzRgCIwkepsGBJZ/4TgF9v4czWUjcNVv4ZRDskq+9yFg
 3cfQbHXEd2lATnlTNU9cCfgjpwmXT0KKlPVoxI90A16sLJoTImw+x+gK/k2b9LQH/Wswk9Ej/q
 7+mZGxDyF3Cqyh3yRaKtf+hVDBSVTK/nBqDWfXsGcD+9MC10oH1ebev64Bi58MOXrVPhqDToRI
 8Hk=
X-IronPort-AV: E=Sophos;i="5.69,285,1571727600"; 
   d="scan'208";a="58105049"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Dec 2019 09:58:55 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 6 Dec 2019 09:58:57 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Fri, 6 Dec 2019 09:58:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kG6V+rQdXhXSuBXozcKx8E4Vh3WkDavz4WK1QJKW/oJXYIK05oZC120CTBT352Yu/7Yy7OmT8Kwp/xHHxByKADaAIkC0HpexLfYowFURD3sweKONtPDP7Kjuwf3zbdkfMn5pxXaXuiS7C+uZ/UEQW5FQKgOBlN4itTDcmo1vbt6yRWB5/EKfL7droZ09GqzPT7LUYprSk6WNIxonhE4s3hSFtkSxJnEbo0NJAUgPqBruCr+DBciR8b2yEh+RKMo4tdfBO4yaWe4oh95uNBGwyFGnyOrD2tlM1Y0ewLjk35xrUXR0k2v7xDSZtfo2AXQzDpQnqoVocxVrcfdGcpuKYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XyoNdPy74N+2xviunhx0ZAdGqwDeOcHpt4Z50ToVUWg=;
 b=hKyXlIwSB5jL38e19hpaNf7ZpFAOcTp6qs1sMbJxtoYgP9Zh8ksTWEvuUXEL8YOf5jXEYuL1XjwnIL6EKprGY7xWUcTCxqixivNJ4j7L5rnbO3nzOfnh9GwmnKK+5b9aX8DiKJYJzQu+9+7TkYrcIHpDT8XVkpRcHcw0lXlXk1VE1JJ3nKTrCpqmT52e+hE/3N7Ga5HgbflKdrlj5vlE2ivpRMeX8Nz7mWVOOP4nfGxGY+1ez1WuodVlpbRvcksMAt2z5w5/GKrEckpsnuBD2Lv7hPJm4jM9PpYr8aPxJx+V4KM0UcAYfPf2J/SdlBUkVnSO3Oyw7M1Lrmz4kmIiow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XyoNdPy74N+2xviunhx0ZAdGqwDeOcHpt4Z50ToVUWg=;
 b=Jc3fFCFsw290I+wU9kz1CA7Mrp0UrRt4AeBoQmvq7+XOJne9bcm/Z4FAyiZpY3TwbdLKz6+7Hk1VYfvQ/gDzlE0CYitDvM8SA/vdqAVx7bQSsGsmDI9AtZiXjAOhhfUonUJJ3sXB8pW5FuY/ROc4lI7VVvyrDtDgfm4G3bHdmKk=
Received: from BY5PR11MB4497.namprd11.prod.outlook.com (52.132.255.220) by
 BY5PR11MB4275.namprd11.prod.outlook.com (52.132.253.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.22; Fri, 6 Dec 2019 16:58:53 +0000
Received: from BY5PR11MB4497.namprd11.prod.outlook.com
 ([fe80::b034:f6be:ee33:8fe6]) by BY5PR11MB4497.namprd11.prod.outlook.com
 ([fe80::b034:f6be:ee33:8fe6%7]) with mapi id 15.20.2516.013; Fri, 6 Dec 2019
 16:58:53 +0000
From:   <Codrin.Ciubotariu@microchip.com>
To:     <Eugen.Hristev@microchip.com>, <robh+dt@kernel.org>,
        <Ludovic.Desroches@microchip.com>, <wsa@the-dreams.de>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <peda@axentia.se>
CC:     <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH 2/3] i2c: at91: fix clk_offset for sama5d2
Thread-Topic: [PATCH 2/3] i2c: at91: fix clk_offset for sama5d2
Thread-Index: AQHVqO5phmRDsF11wkuKIRrB0InCP6etWvsA
Date:   Fri, 6 Dec 2019 16:58:53 +0000
Message-ID: <8b911756-e1ad-0a49-f553-7d58b2f3c155@microchip.com>
References: <1575276957-5615-1-git-send-email-eugen.hristev@microchip.com>
 <1575276957-5615-2-git-send-email-eugen.hristev@microchip.com>
In-Reply-To: <1575276957-5615-2-git-send-email-eugen.hristev@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR11CA0058.namprd11.prod.outlook.com
 (2603:10b6:a03:80::35) To BY5PR11MB4497.namprd11.prod.outlook.com
 (2603:10b6:a03:1cc::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 968d272b-03a5-44eb-49eb-08d77a6d92be
x-ms-traffictypediagnostic: BY5PR11MB4275:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB427563DD7FC14B7D12A8E9A9E75F0@BY5PR11MB4275.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0243E5FD68
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(346002)(376002)(396003)(366004)(136003)(199004)(189003)(52116002)(305945005)(81166006)(76176011)(81156014)(66476007)(53546011)(31686004)(71200400001)(71190400001)(26005)(8676002)(31696002)(99286004)(66446008)(64756008)(2906002)(102836004)(8936002)(110136005)(4326008)(2616005)(5660300002)(66946007)(66556008)(316002)(6486002)(186003)(6506007)(86362001)(107886003)(6512007)(36756003)(478600001)(229853002)(138113003);DIR:OUT;SFP:1101;SCL:1;SRVR:BY5PR11MB4275;H:BY5PR11MB4497.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5FeYWCR9f0H6Y+RLZ3BEjiFrYQhhgSYk1wwTS1vjdByPlKXXUaCaESOmrnIyTNzhJS/4CAFOZ7Fs+P9AAA0IuWt0t8+LktiDZChdGvp+n3ka+FDZCdiwfcQzzvj+fkEBZnoi0DRbNYUY/bFw/BaNhsLxLvswn9KXvJSPEjtreyxKQpb9+PvexNVChmoPFZGJtg2BHHbm7X/Qfktx2pGqz8wmp8haiEWUjHMX/4taaxL2UVpopVk7iXlSiG1FukPPz0UmmqaQPPpQyh74DQgUL9z0fTyx0AHZOB2LE+vahd0ac8joMOccBJwYGrepMZqNWx/eW429k+yk1w7ThcSkhwInLBEcuAQwRBO4o8mfSCKYwXr/uqdHF55iD7gH4TsN6j2BR2csCqpJfhDH+BMo92/raumn3mT6xDETFlBIlpHtH7wmB7fzxkHE+e/7jEalasysWgAOTpT24d3o6mo0/98oerBAMxLn3yaReA1rKfOaurWqADdvwawGTpvtdMmr
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC865B96EAA9D24DA092B77F09DD1490@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 968d272b-03a5-44eb-49eb-08d77a6d92be
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2019 16:58:53.0681
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: haRjIHlUi9Axqjs5849WLOaxDfjfznMwM9oRKL76stABZR493eeOpi3+1viJ9pq4Ggd6DqHcZxsXoZ5HbEFXWazIGJQzFZ9XMXNp1RMl6fA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4275
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMDIuMTIuMjAxOSAxMDo1NiwgRXVnZW4gSHJpc3RldiAtIE0xODI4MiB3cm90ZToNCj4gRnJv
bTogRXVnZW4gSHJpc3RldiA8ZXVnZW4uaHJpc3RldkBtaWNyb2NoaXAuY29tPg0KPiANCj4gSW4g
U0FNOVg2MCBkYXRhc2hlZXQsIEZMRVhfVFdJX0NXR1IgcmVnaXN0ZXIgcmVzY3JpcHRpb24gbWVu
dGlvbnMgY2xvY2sNCj4gb2Zmc2V0IG9mIDMgY3ljbGVzIChjb21wYXJlZCB0byA0IGluIGVnLiBT
QU1BNUQzKS4NCj4gVGhpcyBpcyB0aGUgc2FtZSBvZmZzZXQgYXMgaW4gU0FNQTVEMi4NCj4gDQo+
IEZpeGVzOiBiMDAyNzc5MjM3NDMgKCJpMmM6IGF0OTE6IGFkZCBuZXcgcGxhdGZvcm0gc3VwcG9y
dCBmb3Igc2FtOXg2MCIpDQo+IFN1Z2dlc3RlZC1ieTogQ29kcmluIENpdWJvdGFyaXUgPGNvZHJp
bi5jaXVib3Rhcml1QG1pY3JvY2hpcC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEV1Z2VuIEhyaXN0
ZXYgPGV1Z2VuLmhyaXN0ZXZAbWljcm9jaGlwLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENvZHJpbiBD
aXVib3Rhcml1IDxjb2RyaW4uY2l1Ym90YXJpdUBtaWNyb2NoaXAuY29tPg0KDQpUaGFua3MhDQoN
CkJlc3QgcmVnYXJkcywNCkNvZHJpbg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvaTJjL2J1c3Nlcy9p
MmMtYXQ5MS1jb3JlLmMgfCAyICstDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2ky
Yy1hdDkxLWNvcmUuYyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS1jb3JlLmMNCj4gaW5k
ZXggZTEzYWY0OC4uNTEzN2U2MiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9pMmMvYnVzc2VzL2ky
Yy1hdDkxLWNvcmUuYw0KPiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWF0OTEtY29yZS5j
DQo+IEBAIC0xNzQsNyArMTc0LDcgQEAgc3RhdGljIHN0cnVjdCBhdDkxX3R3aV9wZGF0YSBzYW1h
NWQyX2NvbmZpZyA9IHsNCj4gICANCj4gICBzdGF0aWMgc3RydWN0IGF0OTFfdHdpX3BkYXRhIHNh
bTl4NjBfY29uZmlnID0gew0KPiAgIAkuY2xrX21heF9kaXYgPSA3LA0KPiAtCS5jbGtfb2Zmc2V0
ID0gNCwNCj4gKwkuY2xrX29mZnNldCA9IDMsDQo+ICAgCS5oYXNfdW5yZV9mbGFnID0gdHJ1ZSwN
Cj4gICAJLmhhc19hbHRfY21kID0gdHJ1ZSwNCj4gICAJLmhhc19ob2xkX2ZpZWxkID0gdHJ1ZSwN
Cj4gDQoNCg==

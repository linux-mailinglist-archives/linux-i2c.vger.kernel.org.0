Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B5CA4C812
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2019 09:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726084AbfFTHQN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jun 2019 03:16:13 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:9560 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbfFTHQN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jun 2019 03:16:13 -0400
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
X-IronPort-AV: E=Sophos;i="5.63,396,1557212400"; 
   d="scan'208";a="38329911"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Jun 2019 00:16:12 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex01.mchp-main.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 20 Jun 2019 00:16:12 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 20 Jun 2019 00:16:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZiTGsCspM4ZRXpu3cgeu+2Bg+Vf4IZs//RWk877eZo=;
 b=jP0BqJ2ziJrjpGCZsay5Uzz0sdRIOBBUaw1FVtFQBsk0RJph+NbmJmf4A5MLtx3b2HRxNouKX30KYQg0K6VeY71iLp/NdSv3MtPeF4ABerv0Bmg2oNXWa2nhOzk9Vzc9dcOhfKwKT7iag2Kh5xPOqKJ4fgaOZ8EOWRo4TCOaNzY=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1802.namprd11.prod.outlook.com (10.175.87.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Thu, 20 Jun 2019 07:16:05 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::6476:ace0:bf3a:322]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::6476:ace0:bf3a:322%9]) with mapi id 15.20.1987.014; Thu, 20 Jun 2019
 07:16:05 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>, <wsa@the-dreams.de>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <Eugen.Hristev@microchip.com>
Subject: [PATCH 1/5] dt-bindings: i2c: at91: add new compatible
Thread-Topic: [PATCH 1/5] dt-bindings: i2c: at91: add new compatible
Thread-Index: AQHVJzgGMmYrS7k2UkW+U3UbXypBkg==
Date:   Thu, 20 Jun 2019 07:16:05 +0000
Message-ID: <1561014676-22446-1-git-send-email-eugen.hristev@microchip.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P195CA0054.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::43) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ee68f66-d65f-4236-b5da-08d6f54f284e
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1802;
x-ms-traffictypediagnostic: DM5PR11MB1802:
x-microsoft-antispam-prvs: <DM5PR11MB1802BD3B685D6F16ADB6DB7EE8E40@DM5PR11MB1802.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(376002)(136003)(346002)(366004)(39860400002)(189003)(199004)(64756008)(73956011)(305945005)(3846002)(66556008)(8676002)(71200400001)(8936002)(81156014)(81166006)(66446008)(186003)(36756003)(110136005)(50226002)(2616005)(476003)(53936002)(102836004)(71190400001)(52116002)(14454004)(2501003)(107886003)(99286004)(26005)(316002)(2906002)(6486002)(6506007)(386003)(486006)(14444005)(256004)(66066001)(2201001)(68736007)(66946007)(6116002)(478600001)(7736002)(72206003)(6512007)(4326008)(25786009)(6436002)(4744005)(66476007)(86362001)(5660300002)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1802;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TTMVmsnNKdI2XkeaUQf2i90NhdcP3sxsiQjjAAhXUUe/cT9oMfcUT0iI1AWK6YdpkBsq607XNweqba0/ydYGO3gqMcEZW3kor2vu0WmIVF23pVjyd/YZQiPN1/53+vTxRW2uCynr1LxfIY3Cssco5LSYL18Q0eJCGPzyLkP6qAXeuCZ00PiyyXBU9dfmhwgSHVFRrIG84q5r1zacAjJ5gWnWYJCxjTZ/fypq5i1qaPyV3HGWYtcCTl6qik2NP+GUN1Bse9xr+4eq7+phj6V3cwnM6mH/rqfdicxiEWZEmP+lCmrnhzJQgg15R/UFAKBu9lKBC86/tCMlceDdM1YKbUGl2Nahcu5hOPha8D+lLGVoRo2BkXmC3iVE4MYssUY5x3T7kHe3VlnQIW/aVfFxhbGW19uoHvD39FpBrXfG5lY=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ee68f66-d65f-4236-b5da-08d6f54f284e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 07:16:05.5009
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eugen.hristev@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1802
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

RnJvbTogRXVnZW4gSHJpc3RldiA8ZXVnZW4uaHJpc3RldkBtaWNyb2NoaXAuY29tPg0KDQpBZGQg
Y29tcGF0aWJsZSBmb3IgbmV3IE1pY3JvY2hpcCBTb0MsIHNhbTl4NjANCg0KU2lnbmVkLW9mZi1i
eTogRXVnZW4gSHJpc3RldiA8ZXVnZW4uaHJpc3RldkBtaWNyb2NoaXAuY29tPg0KLS0tDQogRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtYXQ5MS50eHQgfCAzICsrLQ0K
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJjLWF0OTEudHh0
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtYXQ5MS50eHQNCmlu
ZGV4IGI3Y2VjMTcuLjIyMTBmNDMgMTAwNjQ0DQotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvaTJjL2kyYy1hdDkxLnR4dA0KKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2kyYy9pMmMtYXQ5MS50eHQNCkBAIC0zLDcgKzMsOCBAQCBJMkMgZm9yIEF0
bWVsIHBsYXRmb3Jtcw0KIFJlcXVpcmVkIHByb3BlcnRpZXMgOg0KIC0gY29tcGF0aWJsZSA6IE11
c3QgYmUgImF0bWVsLGF0OTFybTkyMDAtaTJjIiwgImF0bWVsLGF0OTFzYW05MjYxLWkyYyIsDQog
ICAgICAiYXRtZWwsYXQ5MXNhbTkyNjAtaTJjIiwgImF0bWVsLGF0OTFzYW05ZzIwLWkyYyIsICJh
dG1lbCxhdDkxc2FtOWcxMC1pMmMiLA0KLSAgICAgImF0bWVsLGF0OTFzYW05eDUtaTJjIiwgImF0
bWVsLHNhbWE1ZDQtaTJjIiBvciAiYXRtZWwsc2FtYTVkMi1pMmMiDQorICAgICAiYXRtZWwsYXQ5
MXNhbTl4NS1pMmMiLCAiYXRtZWwsc2FtYTVkNC1pMmMiLCAiYXRtZWwsc2FtYTVkMi1pMmMiIG9y
DQorICAgICAibWljcm9jaGlwLHNhbTl4NjAtaTJjIg0KIC0gcmVnOiBwaHlzaWNhbCBiYXNlIGFk
ZHJlc3Mgb2YgdGhlIGNvbnRyb2xsZXIgYW5kIGxlbmd0aCBvZiBtZW1vcnkgbWFwcGVkDQogICAg
ICByZWdpb24uDQogLSBpbnRlcnJ1cHRzOiBpbnRlcnJ1cHQgbnVtYmVyIHRvIHRoZSBjcHUuDQot
LSANCjIuNy40DQoNCg==

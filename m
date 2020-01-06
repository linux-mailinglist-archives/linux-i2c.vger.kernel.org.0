Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC6E131623
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2020 17:34:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgAFQe5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jan 2020 11:34:57 -0500
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:4474 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbgAFQe5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Jan 2020 11:34:57 -0500
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
  Codrin.Ciubotariu@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Codrin.Ciubotariu@microchip.com";
  x-sender="Codrin.Ciubotariu@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
  include:servers.mcsv.net include:mktomail.com
  include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Codrin.Ciubotariu@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com; spf=Pass smtp.mailfrom=Codrin.Ciubotariu@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: Q1XV6rmjGTOes0XCU66qNSEFHc2vjuNUTxz65T10lsGPdPz62MXIsEZ++Xl1yiECPSWwH0tira
 g1RwFVyon2lCwjOamtkynBfKYlcs3+lWl2MLJrElKcC6FXbjaChAzUgaxLSN/0T/en2LNMHHea
 XeN56KDPNTgOs5Gr7qslXJg6f7MEW+qNrxku3Io9qfGZOeqz+dWwD+EKwbl7/KpxRR9tHTpAAx
 z12+V0giYWhLz67locmxMcrytDxOXkIrA9F0uRm1u4Nh3z6fcBIIUWTBgPUBL6HUJ9IIZ2bY6b
 eWI=
X-IronPort-AV: E=Sophos;i="5.69,403,1571727600"; 
   d="scan'208";a="61730152"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Jan 2020 09:34:56 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 6 Jan 2020 09:34:55 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 6 Jan 2020 09:34:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kNmudSRWIVPVnxWS8U6Lux0C6b2HmiwolFhex9qkRuu5qPOzoMRu9FDG+x9NnQ3ajZOkhuuL6CC/kzkqmsiOhJQatiszg1ZUk+XSptWD1ab4dyHmDWb2Gg80l4X2wKOQZcbgfJO9uKx10mJ/ZpSRxn2OTV+eLBqiLZ91/cM3eAmo/idE1J7xSjC7l1sbXdxqlo092pNy9JbXHtv0y/Gc2NAmBCRu+FYPrVHKNlvfLzyhCq/q8NQ3PvswEJc0rwhn5UOZf2ITqDIPtY6tV/06paY3HRBOVTxA2lmwFJ6eDs3yyRc5GafXI3iUOCrs+TNygLORg9Qy3TviU/yAL10aog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6x6R+KsXR8zCvwlOgbng0GzimShOb9oDdNNSRKnuCrc=;
 b=iyq6ODJAufMug6IpOPo6pal40v5izHhQiS0r2h5c1FjKdPXcUHBCEgRqhOn9pm2TR1GuGhXDWbdwDqgXX7ADxvi0HuH+UXjJXRDP7y6Wuc8wGjzQGKKnJHmg72lymf+qSqphRewnO1lOEacQ4PH87YQimmoP8hcOo+esIxLlHv5gMXJp8h9AgWoT8BoSrGjGhLQFGT0IrdjR/HHNLGWifu2UDeORadDHZaNxjlJzLhtgml5FkQdXN63lmhGz/qdpID3+NiWxn632KI4hwk4w7GV4VgGRvmAx3rHIC5jmhQeQJ5zUh6aMgEmSvv4N6KQkr330W4/AUEluoNPUE+wXng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6x6R+KsXR8zCvwlOgbng0GzimShOb9oDdNNSRKnuCrc=;
 b=tPr1eAHBXex9cfxFMDmIzPZ2RrK1veArQYN/n1LkRnoARHtwnTAcwLZnLhxO5aEVdkhsAyOpAKEqpEJJ0IYi2K3vAlKHT5ewxeMclmgnHUfI8iJV1AATRS40sZnNBmTh3E0FMU6+ZA6th2J5hiHB5CpTRedI/Am/VgCMooyNzTo=
Received: from BY5PR11MB4497.namprd11.prod.outlook.com (52.132.255.220) by
 BY5PR11MB4005.namprd11.prod.outlook.com (10.255.162.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.11; Mon, 6 Jan 2020 16:34:51 +0000
Received: from BY5PR11MB4497.namprd11.prod.outlook.com
 ([fe80::6189:c32:b55b:b3fd]) by BY5PR11MB4497.namprd11.prod.outlook.com
 ([fe80::6189:c32:b55b:b3fd%5]) with mapi id 15.20.2602.015; Mon, 6 Jan 2020
 16:34:51 +0000
From:   <Codrin.Ciubotariu@microchip.com>
To:     <robh@kernel.org>
CC:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <kamel.bouhara@bootlin.com>,
        <wsa@the-dreams.de>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <Ludovic.Desroches@microchip.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: i2c: at91: document optional bus
 recovery properties
Thread-Topic: [PATCH v2 1/6] dt-bindings: i2c: at91: document optional bus
 recovery properties
Thread-Index: AQHVxK83iAYe1LHegEGHaSZlToSJNw==
Date:   Mon, 6 Jan 2020 16:34:51 +0000
Message-ID: <5f7c19f6-014e-d207-d3ab-bb439e1847f8@microchip.com>
References: <20200103094821.13185-1-codrin.ciubotariu@microchip.com>
 <20200103094821.13185-2-codrin.ciubotariu@microchip.com>
 <20200103222919.GA32421@bogus>
In-Reply-To: <20200103222919.GA32421@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a353c5de-5a11-49c6-8c89-08d792c65a63
x-ms-traffictypediagnostic: BY5PR11MB4005:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB40051E71BF86681F53035DF5E73C0@BY5PR11MB4005.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0274272F87
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(136003)(346002)(376002)(39860400002)(366004)(199004)(189003)(316002)(81156014)(81166006)(8676002)(54906003)(31686004)(76116006)(31696002)(186003)(107886003)(26005)(66446008)(66946007)(4326008)(91956017)(2906002)(5660300002)(4744005)(66476007)(66556008)(64756008)(6512007)(53546011)(71200400001)(36756003)(8936002)(86362001)(478600001)(6916009)(6506007)(2616005)(6486002);DIR:OUT;SFP:1101;SCL:1;SRVR:BY5PR11MB4005;H:BY5PR11MB4497.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pxhZB6tRuJD9/KtBCXSd7ra7tJFgII5Xp9cRLlzSkPed3v90IF3/buzb7QhyPa7AVNx7o6Zcz9Vne/crmtbjzRBizBOrkcb7s5vDfcJKStWrD3KLbxAWXjaoJEbzTtujoz1CeTiV7aJjshl1GXf+lSTGnWSczK6t3FyAScs09R3Vb6FXnmgS/zlZTX32gjai+6PdZt6zqaMgslRiwjwsgnstaGrghJ0rCmWgjOy6J7Wn6nAva+DXpCuNrpu9leUD/LoSRvYtoZ9aE12iN2xdd6FObYNXv05MBkBIQ69YNHMyPX0fwGrS3AaEdHIAQpl+etqyYVV+b4rQhT4YOM3vNte4Zu2WAVz8KBV2DZzYvPFn0Z37N2Ko9ICAjqY5OQgQ+uPCMBMW12AbueQcDlXJZHdAXVs2fBtNyG2CBclgRaahokjV4KasfOH4ldS4fOK3
Content-Type: text/plain; charset="utf-8"
Content-ID: <0518A744A6BCAA4A8848450F89CE5613@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a353c5de-5a11-49c6-8c89-08d792c65a63
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2020 16:34:51.2178
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ONh0kPwtk0jX9TkA/fMK17u88EvSvC+vi5MmdkhXuoS3hzadnwP/0b5M7fbCczA+/Zi1i89MAAyt+1va7zhYJ727x2gNIA0Qf73wpFIxPyw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4005
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMDQuMDEuMjAyMCAwMDoyOSwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlM
OiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cg
dGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gRnJpLCAzIEphbiAyMDIwIDA5OjQ5OjA2ICsw
MDAwLCA8Q29kcmluLkNpdWJvdGFyaXVAbWljcm9jaGlwLmNvbT4gd3JvdGU6DQo+Pg0KPj4gRnJv
bTogS2FtZWwgQm91aGFyYSA8a2FtZWwuYm91aGFyYUBib290bGluLmNvbT4NCj4+DQo+PiBUaGUg
YXQ5MSBJMkMgY29udHJvbGxlciBjYW4gc3VwcG9ydCBidXMgcmVjb3ZlcnkgYnkgcmUtYXNzaWdu
aW5nIFNDTA0KPj4gYW5kIFNEQSB0byBncGlvcy4gQWRkIHRoZSBvcHRpb25hbCBwaW5jdHJsIGFu
ZCBncGlvIHByb3BlcnRpZXMgdG8gZG8NCj4+IHNvLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEth
bWVsIEJvdWhhcmEgPGthbWVsLmJvdWhhcmFAYm9vdGxpbi5jb20+DQo+PiAtLS0NCj4+DQo+PiBD
aGFuZ2VzIGluIHYyOg0KPj4gICAtIG5vbmUNCj4+DQo+PiAgIERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9pMmMvaTJjLWF0OTEudHh0IHwgMTAgKysrKysrKysrKw0KPj4gICAxIGZp
bGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQ0KPj4NCj4gDQo+IFBsZWFzZSBhZGQgQWNrZWQt
YnkvUmV2aWV3ZWQtYnkgdGFncyB3aGVuIHBvc3RpbmcgbmV3IHZlcnNpb25zLiBIb3dldmVyLA0K
PiB0aGVyZSdzIG5vIG5lZWQgdG8gcmVwb3N0IHBhdGNoZXMgKm9ubHkqIHRvIGFkZCB0aGUgdGFn
cy4gVGhlIHVwc3RyZWFtDQo+IG1haW50YWluZXIgd2lsbCBkbyB0aGF0IGZvciBhY2tzIHJlY2Vp
dmVkIG9uIHRoZSB2ZXJzaW9uIHRoZXkgYXBwbHkuDQo+IA0KPiBJZiBhIHRhZyB3YXMgbm90IGFk
ZGVkIG9uIHB1cnBvc2UsIHBsZWFzZSBzdGF0ZSB3aHkgYW5kIHdoYXQgY2hhbmdlZC4NCj4gDQoN
ClNvcnJ5IFJvYiwgSSBmb3Jnb3QgdG8gYWRkIHlvdXIgQWNrZWQtYnkuIFRoZXJlIGlzIG5vdGhp
bmcgY2hhbmdlZCBpbiANCnRoaXMgdmVyc2lvbi4gSG93IHNob3VsZCBJIHByb2NlZWQsIHNob3Vs
ZCBJIHJlc2VuZCBpdCB3aXRoIHlvdXIgdGFnPw0KDQpCZXN0IHJlZ2FyZHMsDQpDb2RyaW4=

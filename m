Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 758A118B13E
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Mar 2020 11:26:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbgCSK0F (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Mar 2020 06:26:05 -0400
Received: from mail-eopbgr40054.outbound.protection.outlook.com ([40.107.4.54]:42305
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726802AbgCSK0E (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 19 Mar 2020 06:26:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LhEsiGHwWELq2zGBV/iFf4ri1YhDUNE9TYKzLEfE2C2MdJ8fCZPS2hAxRqkuPmc9qYYEqQa7qo8WwJL3A538LETMDs/4udVFlzjubX1BKQKp0+n3yY8vG6kZCMnoPFGsCW9W5yZS2KeSYEMg4gKn/d/zTUN0fkakjfNuyIv+zwRkp7ga1JvFNpcbIXzAfiIEQ0m8c+F5n7xFl48aYva0R4R72g3/1t9rq5nYJ4N2sW19a/b5U3NfA8N6EumIWixqRU9vriWPwoQuVV5DUiIAoE/y2GdsUSYjogDna4H7RG7PUPXqljp6NXGpF0N5p0lPXGwJodk4f1nElIkNp+wN+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T6YI1T+UiNVuzvBARtgsqH5GfmCRu0CHAFAieJHTmF8=;
 b=WvH9s2gH24BHF6lIp4+MkD91bvK0krSwSJXoEZHnU83r12mj2GZJ/glMPATP4O3TeZFINCQuxMjLUGul+RZIt4xa3SO3mq3P3xmwItPDugU1uqEsElLo97g5rUOvdP4vcuv9fSXdBO4tgWB0VNsrb7xcST0eLyA9d2iWXAhtah8wrrc4lU764uhpY/gvFZbjGm7f2h0SoAL2xBwNU3MoRS9nFmVHcL2SODYBL4guJdLxEQblQpLKKgeCiSgCMSjU6qAACANRPv8yTK9AAgsWKAGSFvDuEYLdwd4pi4CRL5jbA9T3rkKed3weV4/weJA+sDvPgJW7RCM7GTGlkzC6bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T6YI1T+UiNVuzvBARtgsqH5GfmCRu0CHAFAieJHTmF8=;
 b=Jxr+5UiBlDM4XO6twgyKZ6lRPyJTwB7S7n4PARtTZwgO7ZTN5PWu3+Nt0US2tiSWYoIpzaiJIqz9/gdJl0HKbzspC9fQHsYVyjuooZk9AlK7udSXl8brmM9fOJxRqhpYF8nF49Q7UL58+/ItGQKkn9shIA41tt+fgBlO1KK7R2E=
Received: from AM0PR06MB5185.eurprd06.prod.outlook.com (20.178.82.25) by
 AM0PR06MB5185.eurprd06.prod.outlook.com (20.178.82.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.19; Thu, 19 Mar 2020 10:26:01 +0000
Received: from AM0PR06MB5185.eurprd06.prod.outlook.com
 ([fe80::3c0c:c6e8:c7b6:cabd]) by AM0PR06MB5185.eurprd06.prod.outlook.com
 ([fe80::3c0c:c6e8:c7b6:cabd%5]) with mapi id 15.20.2814.021; Thu, 19 Mar 2020
 10:26:01 +0000
From:   Laine Jaakko EXT <ext-jaakko.laine@vaisala.com>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
CC:     "wsa@the-dreams.de" <wsa@the-dreams.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] i2c: xiic: Support disabling multi-master in DT
Thread-Topic: [PATCH] i2c: xiic: Support disabling multi-master in DT
Thread-Index: AQHV5mNyTIn2+pYf+Eu7yiopaV9KGKhOcmGAgAAnv5CAATwtgIAAAa2g
Date:   Thu, 19 Mar 2020 10:26:00 +0000
Message-ID: <AM0PR06MB51854C1BD04607231214750ED4F40@AM0PR06MB5185.eurprd06.prod.outlook.com>
References: <20200218135627.24739-1-ext-jaakko.laine@vaisala.com>
 <CAKfKVtFf+VpinkOGsBFZ2-_PKvx-C1L7G7_uhY2RCvV5dy6L_w@mail.gmail.com>
 <AM0PR06MB5185E501349E06428093B62FD4F70@AM0PR06MB5185.eurprd06.prod.outlook.com>
 <CAKfKVtGSq5rJ0EvZgyg1Rw3=d5Q4ReJUYM7hTSTPP4sXaJyJTw@mail.gmail.com>
In-Reply-To: <CAKfKVtGSq5rJ0EvZgyg1Rw3=d5Q4ReJUYM7hTSTPP4sXaJyJTw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Enabled=True;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_SiteId=6d7393e0-41f5-4c2e-9b12-4c2be5da5c57;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Owner=ext-jaakko.laine@vaisala.com;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_SetDate=2020-03-19T10:25:58.2071358Z;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Name=Restricted;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_ActionId=0a9cfefb-3854-4650-a383-5328eaf57882;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Extended_MSFT_Method=Automatic;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Enabled=True;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_SiteId=6d7393e0-41f5-4c2e-9b12-4c2be5da5c57;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Owner=ext-jaakko.laine@vaisala.com;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_SetDate=2020-03-19T10:25:58.2080956Z;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Name=No Label;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_ActionId=0a9cfefb-3854-4650-a383-5328eaf57882;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Parent=d5842b46-9b7a-431a-b662-8cc44ff92a4e;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ext-jaakko.laine@vaisala.com; 
x-originating-ip: [193.143.230.131]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 31687769-e5c5-4b01-fe6e-08d7cbefebe1
x-ms-traffictypediagnostic: AM0PR06MB5185:
x-microsoft-antispam-prvs: <AM0PR06MB5185F95474119FCD0FC636ABD4F40@AM0PR06MB5185.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0347410860
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(376002)(39850400004)(346002)(366004)(396003)(199004)(186003)(2906002)(86362001)(76116006)(4326008)(66946007)(64756008)(66476007)(66556008)(26005)(6506007)(81156014)(81166006)(8676002)(52536014)(54906003)(8936002)(66446008)(478600001)(6916009)(9686003)(33656002)(316002)(5660300002)(71200400001)(7696005)(55016002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR06MB5185;H:AM0PR06MB5185.eurprd06.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: vaisala.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xrYCWG5FngfYb1eSOlNWRFxbDa9fxxqh1BMUeUeI54gnzufqX24/rxdcPq5TDnR8caVW1gC2b7RFuY46URJHuxZ9nXzEAs1UBcc2vrP1QiPxFNYtzQ8/xDkgzq5KM3t7hB2gEPZIW5xfJeA1psHfv7OVIui2gR5dG0MsNs8+/Ziv0Xi48je+TeD0VJ9pKzUG74whpnlRfc48gacVHy5115POJFDxZPW5u22NF4DM67aa2OLKkgSck8K28OKM/y9VN4eYFWASdJ0wCtv2yG99JDWM9cMERb93l1DvMVCwAbRfdQ2tGDWXdQMTU0ld6D7URQvlI5asycjWXMUXHklnu7Bq/h/9RR+hUg0keMVFtkxSkrpUIeOQwRcCQv4bS/BG0/JDXOG/3d9LTG0x0w1J/i3lMC8qvTgPGl+l19uou/5yd4fB5yK2sQRn+G/0w1vS
x-ms-exchange-antispam-messagedata: E3vefvcrNfQVESlqU8bUBVgoJCv2sStl6qpsuq3wcwRFyN6O8Z8mY4WQdAE5eAkii1jKe5CqGkWhjzE8FUocMYOcP58F5iSoPdcoEGcJl0XeSyj7BhzYlw/D05nX5iYbO8kLp6adbB7Ful1lYJK7RQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31687769-e5c5-4b01-fe6e-08d7cbefebe1
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2020 10:26:01.0004
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M/NYD5Cvq7i7gH9BllCmijUAQe9xcoegrzSvl/b1HSfsVfN0Y3vZYwQLCTwQH2bIbTC9iCGXJCwRa6ldVwZryoE4hZrqvDwxjGnd0VMP9T0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB5185
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiA+ID4NCj4gPiA+dGhlIG90aGVyIHRoaW5nIGkgd2FzIHRoaW5raW5nIGhvdyB3aWxsIG11bHRp
dGhyZWFkaW5nIC4NCj4gPiA+U2hvdWxkIHdlIGhhdmUgYSBsb2NrIGhlcmUuDQo+ID4gPg0KPiA+
ID4+IC0gICAgICAgZXJyID0geGlpY19idXNfYnVzeShpMmMpOw0KPiA+ID4+IC0gICAgICAgd2hp
bGUgKGVyciAmJiB0cmllcy0tKSB7DQo+ID4gPj4gLSAgICAgICAgICAgICAgIG1zbGVlcCgxKTsN
Cj4gPiA+PiArICAgICAgIGlmIChpMmMtPm11bHRpbWFzdGVyKSB7DQo+ID4gPj4gKyAgICAgICAg
ICAgICAgIC8qIGZvciBpbnN0YW5jZSBpZiBwcmV2aW91cyB0cmFuc2ZlciB3YXMgdGVybWluYXRl
ZCBkdWUgdG8gVFgNCj4gPiA+PiArICAgICAgICAgICAgICAgICogZXJyb3IgaXQgbWlnaHQgYmUg
dGhhdCB0aGUgYnVzIGlzIG9uIGl0J3Mgd2F5IHRvIGJlY29tZQ0KPiA+ID4+ICsgICAgICAgICAg
ICAgICAgKiBhdmFpbGFibGUgZ2l2ZSBpdCBhdCBtb3N0IDMgbXMgdG8gd2FrZQ0KPiA+ID4+ICsg
ICAgICAgICAgICAgICAgKi8NCj4gPiA+PiAgICAgICAgICAgICAgICAgZXJyID0geGlpY19idXNf
YnVzeShpMmMpOw0KPiA+ID4+ICsgICAgICAgICAgICAgICB3aGlsZSAoZXJyICYmIHRyaWVzLS0p
IHsNCj4gPiA+PiArICAgICAgICAgICAgICAgICAgICAgICBtc2xlZXAoMSk7DQo+ID4gPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgZXJyID0geGlpY19idXNfYnVzeShpMmMpOw0KPiA+ID4+ICsg
ICAgICAgICAgICAgICB9DQo+ID4gPj4gICAgICAgICB9DQo+ID4gPj4NCj4gPiA+PiAgICAgICAg
IHJldHVybiBlcnI7DQo+ID4NCj4gPiBXaGljaCByZXNvdXJjZSBzcGVjaWZpY2FsbHkgYXJlIHlv
dSB3b3JyaWVkIGFib3V0IG5lZWRpbmcgbG9ja2luZyBoZXJlPw0KPiA+DQo+IEVhcmxpZXIgbXVs
dGlwbGUgdGhyZWFkcyBvbiB0aGUgc2FtZSBwcm9jZXNzb3Igd2lsbCB3YWl0IGZvciBidXMgYnVz
eS4NCj4NCj4gTm93IG15IGNvbmNlcm4gd2FzDQo+DQo+IHRocmVhZDEgLT4gbWFrZXMgYSB0cmFu
c2FjdGlvbg0KPg0KPiB0aHJlYWQyICAtPiB0aGlzIHdpbGwgbm90IHdhaXQgZm9yIGJ1cyBidXN5
IGFuZCBhY2Nlc3MuDQoNClNpbmNlIGkyYy0+dHhfbXNnIGlzIHNldCBiZWZvcmUgYW55dGhpbmcg
aXMgc2VudCB0byBGUEdBIGFuZCBvbmx5IHJldHVybmVkIHRvIE5VTEwgYWZ0ZXIgdHJhbnNhY3Rp
b24gaGFzIGZpbmlzaGVkLA0KSSB0aGluayB0aHJlYWQyIHdvdWxkIGFscmVhZHkgZXhpdCB3aXRo
IC1FQlVTWSBiZWZvcmUgeGlpY19idXNfYnVzeShpMmMpIGlzIGNhbGxlZCBiZWNhdXNlIG9mZjoN
CmlmIChpMmMtPnR4X21zZykNCglyZXR1cm4gLUVCVVNZOw0KaW4gc2FtZSBmdW5jdGlvbi4NCg0K
VGhpcyBpcyB3aHkgbXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IHhpaWNfYnVzX2J1c3koaTJjKSBv
bmx5IHByYWN0aWNhbGx5IGd1YXJkcyBhZ2FpbnN0IG90aGVyIG1hc3RlcnMgb3BlcmF0aW5nIG9u
IGJ1cy4NCkluIG15IHVuZGVyc3RhbmRpbmcgeGlpY19idXNfYnVzeShpMmMpIHJlYWRzIHRoZSBy
ZWdpc3RlciBvbiBGUEdBLCB3aGljaCBjYW4ndCBjaGFuZ2Ugc3RhdGUgYmVmb3JlIHRocmVhZDEg
aXMgYWxyZWFkeSBzbyBmYXIgaW50byB0cmFuc21pdHRpbmcgaXRzIGRhdGEgdGhhdCBGUEdBIGhh
cyByZWNlaXZlZCBzb21ldGhpbmcgdG8gc2VuZCBhbmQgaGFzIHJlc2VydmVkIHRoZSBidXMuIFRo
aXMgd291bGQgbGVhdmUgYW4gaW50ZXJ2YWwgb2YgdGltZSBiZXR3ZWVuIGNoZWNraW5nIHhpaWNf
YnVzX2J1c3kgYW5kIGl0cyByZWdpc3RlciB2YWx1ZSBjaGFuZ2luZyBkdXJpbmcgd2hpY2ggdGhy
ZWFkMiBjb3VsZCBhbHNvIGNoZWNrIHhpaWNfYnVzX2J1c3kgYW5kIHByb2NlZWQgdG8gdHJhbnNt
aXQgYXQgdGhlIHNhbWUgdGltZSB3aXRoIHRocmVhZDEuIChVbnRpbCBoaXR0aW5nIGEgdHJhbnNh
Y3Rpb24gbG9jayBsYXRlciwgYnV0IG9ubHkgYWZ0ZXIgaXQgaGFzIGFscmVhZHkgb3ZlcndyaXR0
ZW4gdGhlIHBvaW50ZXIgdG8gdHJhbnNtaXQgYnVmZmVyIGkyYy0+dHhfbXNnLCBhbmQgcG9zc2li
bHkgbWVzc2VkIHVwIHRoZSB0cmFuc21pc3Npb25zIGZvciB0aHJlYWQxKS4NCg0KTm93IGl0IHNl
ZW1zIHRvIG1lIHRoYXQgZXZlbiB3aXRoIGkyYy0+dHhfbXNnIGJlaW5nIGNoZWNrZWQsIHRocmVh
ZDIgY291bGQgZ2V0IHBhc3QgaXQgYmVmb3JlIHRocmVhZDEgaGFzIHNldCBpdCB0byBub3QgTlVM
TCwgc2luY2UgdGhyZWFkIHBlcmZvcm1zIG5vIGxvY2tpbmcgYmV0d2VlbiBjaGVja2luZyBpdCBh
bmQgc2V0dGluZyBpdCwgbGlrZSBJIG1lbnRpb25lZCBpbiBwcmV2aW91cyByZXBseS4gVGhpcyBp
c3N1ZSBoYXMgYXBwYXJlbnRseSBhbHJlYWR5IGV4aXN0ZWQgZm9yIHNvbWUgdGltZSB0aG91Z2gg
YW5kIGlzIHByb2JhYmx5IHF1aXRlIHVubGlrZWx5LCBzaW5jZSBpdCBoYXMgYmVlbiB0aGVyZSBm
b3Igc29tZSB0aW1lLg0KDQotSmFha2tvDQo=

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 450A918A0DD
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Mar 2020 17:49:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbgCRQtY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Mar 2020 12:49:24 -0400
Received: from mail-am6eur05on2049.outbound.protection.outlook.com ([40.107.22.49]:27352
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726473AbgCRQtY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 18 Mar 2020 12:49:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZygiMQlsWkNff6hAicbp6qeVzWWva7hUC9eTS3QWbTtx26h/ajjkbpk3dVtItk54Fc5fP1Mo70BnsB+L05wIlT0NffqDzNtgVsrtNoAEk/U6rHREHbZZWW0MehbDbegBXN8Ii2hIR3834yS4qqx2cL0hKuJI90f9NwDqbTY9cLJ9VxryQ96IdPN8PZJJyGBotelnAnU7k1ETHkyxOlgq7n3oksMSY6kFnpa8snNd32YufJbavOwyYu68/vZSjGjdwuKWDhWuaaZ1rXLG6QsMFWWu+oHitRw/clqx75XLwTiO6X/CEBerOGvOfVKDX7pZ3InGWteVBcs+g8GxH9cPsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7icJXE+P3NcLKQQkxumDttWO3IDuvwgFF6VzEF+ERU=;
 b=l0isT1xOWIsJvIE3rLuoM7c07m7Oge9ninFz+/mWiT+bEXRRQCJVlrVc39af25QmFW8fO2bCNQqKFx2IbtVolto6u1IbyUR2KcsU3QDJlg5J9bX8tcC4RDJMS71XJzcbf6gkYVJs0XK8LFBjxsv+HFs5nxOM5B7a9EFoBchDKNZVOf1GxmKjJWxLL0TEky4fUs7MNaQMQXKRcuzEg5IiL6p42kx2zLiiPK42xIWYbAyluBljQNf4AkICx+FyQVj26fXfhBc2J6mFdBvXnbfWa1z6LIIFBY87/Wpv4vQzZMZF1GIxCrTFbpSEmNGV7ihK0M+rTxbaFilN9xo/3WhBWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7icJXE+P3NcLKQQkxumDttWO3IDuvwgFF6VzEF+ERU=;
 b=s1/WET66FJAzorHh1MeeX/7cQqcLsjYoEpcHDmDyIyGw+Mjr4Fx4AYALU0A/WpX8nizSm5ujDmxH8vfFiBh58yiLYvdtp531FJ/renNM1MJ0g1nuj9n47fOJa4M98RZTHpKTu7+k1ge0y1YGh3qNYJneqFKRTrUQ1zIegUWbeD4=
Received: from AM0PR06MB5185.eurprd06.prod.outlook.com (20.178.82.25) by
 AM0PR06MB4129.eurprd06.prod.outlook.com (52.133.54.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.19; Wed, 18 Mar 2020 16:49:20 +0000
Received: from AM0PR06MB5185.eurprd06.prod.outlook.com
 ([fe80::3c0c:c6e8:c7b6:cabd]) by AM0PR06MB5185.eurprd06.prod.outlook.com
 ([fe80::3c0c:c6e8:c7b6:cabd%5]) with mapi id 15.20.2814.021; Wed, 18 Mar 2020
 16:49:20 +0000
From:   Laine Jaakko EXT <ext-jaakko.laine@vaisala.com>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
CC:     "wsa@the-dreams.de" <wsa@the-dreams.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] i2c: xiic: Support disabling multi-master in DT
Thread-Topic: [PATCH] i2c: xiic: Support disabling multi-master in DT
Thread-Index: AQHV5mNyTIn2+pYf+Eu7yiopaV9KGKhOcmGAgAAnv5A=
Date:   Wed, 18 Mar 2020 16:49:19 +0000
Message-ID: <AM0PR06MB5185E501349E06428093B62FD4F70@AM0PR06MB5185.eurprd06.prod.outlook.com>
References: <20200218135627.24739-1-ext-jaakko.laine@vaisala.com>
 <CAKfKVtFf+VpinkOGsBFZ2-_PKvx-C1L7G7_uhY2RCvV5dy6L_w@mail.gmail.com>
In-Reply-To: <CAKfKVtFf+VpinkOGsBFZ2-_PKvx-C1L7G7_uhY2RCvV5dy6L_w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Enabled=True;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_SiteId=6d7393e0-41f5-4c2e-9b12-4c2be5da5c57;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Owner=ext-jaakko.laine@vaisala.com;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_SetDate=2020-03-18T16:49:17.7096272Z;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Name=Restricted;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_ActionId=6a03551a-384e-42f6-b58f-367d6f895fbf;
 MSIP_Label_d5842b46-9b7a-431a-b662-8cc44ff92a4e_Extended_MSFT_Method=Automatic;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Enabled=True;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_SiteId=6d7393e0-41f5-4c2e-9b12-4c2be5da5c57;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Owner=ext-jaakko.laine@vaisala.com;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_SetDate=2020-03-18T16:49:17.7106244Z;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Name=No Label;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_ActionId=6a03551a-384e-42f6-b58f-367d6f895fbf;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Parent=d5842b46-9b7a-431a-b662-8cc44ff92a4e;
 MSIP_Label_7246d30e-a6af-4059-9b44-a42233242e28_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ext-jaakko.laine@vaisala.com; 
x-originating-ip: [2001:14ba:21e9:fc00:4537:b0a7:a50f:840a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d11a894a-49e3-4f73-4f01-08d7cb5c4de5
x-ms-traffictypediagnostic: AM0PR06MB4129:
x-microsoft-antispam-prvs: <AM0PR06MB41293EF2007910EE6806D148D4F70@AM0PR06MB4129.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 03468CBA43
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(199004)(55016002)(966005)(9686003)(498600001)(8936002)(4326008)(81166006)(6916009)(81156014)(186003)(54906003)(8676002)(7696005)(6506007)(66446008)(71200400001)(76116006)(52536014)(66946007)(64756008)(5660300002)(2906002)(66556008)(86362001)(33656002)(66476007);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR06MB4129;H:AM0PR06MB5185.eurprd06.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: vaisala.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JDoy5lpBsp5/ArD20OKQL1KzZak+DI0E6PmY8gY7HWYGnfWGK1Phwkp8vWBkAF95AHgaaa6pcoCYwXBzOKbY1bUvGssdM9JI6upxOL4stXkhv8EQFPa9sRxVE4ITFPNbhva3XqeUkND3oU1BoJvRfxdWpp2V5sI0K2xBB5ooZ3gKtsLWPoNP9R4DTn90jB+5vrpgMMuZ4PEol0ZVzGjqCeAzp395ZiVe2+FEWF0Wxz/3BDq8+HHEWez8u5rjA0CF0SeTpZSt6/FUykBTVhsdzToPgNuF+y617U0juD4wVKZS26UBechKs9pTrpqQ67KeyOAbRyDXRzJa112/hV5YUDlyhXy9teGUjYmn9sFw6kuJddj6z9JcMTlLPWYUILRWrS18+/PKmTO5Kqt14mraf+y6WNaEkENeQdHRBSZC6nOL/RPHPCRDm7gAorPt9GYW46hDpAkXSBep0P/l6wUdGnqo4/yNdrOQcvn9VBYFehwtCm3ScgmueYiz2m+bKhc8TE2hJm9UB1ny5EhA9JxlAg==
x-ms-exchange-antispam-messagedata: e2Ww2PZpr4wEt9++uOQgfNz6l4ZTgKV/Nq/GNKZ9gmLTcoyfXd9ijJgIOWfTJ2gpLV9/XI0b5fNKv5mAEF7M/IGuZr8dsAu4QEB6Bmh/X/yf2sHDWa/dQIN9q9A1KaL2OIbrogXJgz2VTwMYuPIvfcYg4+NZd/8MudtbEwsTODIJoTWJWBx29epD2Amd138aoW5xDMcNfZeg+fFWNm5J3g==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d11a894a-49e3-4f73-4f01-08d7cb5c4de5
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2020 16:49:19.8968
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jz87t8cjIKGpUpwtyMBxFzmt8Jax5vQT/MKy2IBUOBpjeoygkZcwJGKiz4P2I3lK9DMYujBwAAsuwT2wysTFuy/ds7ikjVq9mm/RHP6qvFs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB4129
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGVsbG8sDQoNCj4+IEBAIC01MjEsMTkgKzUyMywyNiBAQCBzdGF0aWMgaW50IHhpaWNfYnVzX2J1
c3koc3RydWN0IHhpaWNfaTJjICppMmMpDQo+PiAgc3RhdGljIGludCB4aWljX2J1c3koc3RydWN0
IHhpaWNfaTJjICppMmMpDQo+PiAgew0KPj4gICAgICAgICBpbnQgdHJpZXMgPSAzOw0KPj4gLSAg
ICAgICBpbnQgZXJyOw0KPj4gKyAgICAgICBpbnQgZXJyID0gMDsNCj4+DQo+PiAgICAgICAgIGlm
IChpMmMtPnR4X21zZykNCj4+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVCVVNZOw0KPj4NCj4+
IC0gICAgICAgLyogZm9yIGluc3RhbmNlIGlmIHByZXZpb3VzIHRyYW5zZmVyIHdhcyB0ZXJtaW5h
dGVkIGR1ZSB0byBUWCBlcnJvcg0KPj4gLSAgICAgICAgKiBpdCBtaWdodCBiZSB0aGF0IHRoZSBi
dXMgaXMgb24gaXQncyB3YXkgdG8gYmVjb21lIGF2YWlsYWJsZQ0KPj4gLSAgICAgICAgKiBnaXZl
IGl0IGF0IG1vc3QgMyBtcyB0byB3YWtlDQo+PiArICAgICAgIC8qIEluIHNpbmdsZSBtYXN0ZXIg
bW9kZSBidXMgY2FuIG9ubHkgYmUgYnVzeSwgd2hlbiBpbiB1c2UgYnkgdGhpcw0KPj4gKyAgICAg
ICAgKiBkcml2ZXIuIElmIHRoZSByZWdpc3RlciBpbmRpY2F0ZXMgYnVzIGJlaW5nIGJ1c3kgZm9y
IHNvbWUgcmVhc29uIHdlDQo+PiArICAgICAgICAqIHNob3VsZCBpZ25vcmUgaXQsIHNpbmNlIGJ1
cyB3aWxsIG5ldmVyIGJlIHJlbGVhc2VkIGFuZCBpMmMgd2lsbCBiZQ0KPj4gKyAgICAgICAgKiBz
dHVjayBmb3JldmVyLg0KPj4gICAgICAgICAgKi8NCj4NCj50aGUgb3RoZXIgdGhpbmcgaSB3YXMg
dGhpbmtpbmcgaG93IHdpbGwgbXVsdGl0aHJlYWRpbmcgLg0KPlNob3VsZCB3ZSBoYXZlIGEgbG9j
ayBoZXJlLg0KPg0KPj4gLSAgICAgICBlcnIgPSB4aWljX2J1c19idXN5KGkyYyk7DQo+PiAtICAg
ICAgIHdoaWxlIChlcnIgJiYgdHJpZXMtLSkgew0KPj4gLSAgICAgICAgICAgICAgIG1zbGVlcCgx
KTsNCj4+ICsgICAgICAgaWYgKGkyYy0+bXVsdGltYXN0ZXIpIHsNCj4+ICsgICAgICAgICAgICAg
ICAvKiBmb3IgaW5zdGFuY2UgaWYgcHJldmlvdXMgdHJhbnNmZXIgd2FzIHRlcm1pbmF0ZWQgZHVl
IHRvIFRYDQo+PiArICAgICAgICAgICAgICAgICogZXJyb3IgaXQgbWlnaHQgYmUgdGhhdCB0aGUg
YnVzIGlzIG9uIGl0J3Mgd2F5IHRvIGJlY29tZQ0KPj4gKyAgICAgICAgICAgICAgICAqIGF2YWls
YWJsZSBnaXZlIGl0IGF0IG1vc3QgMyBtcyB0byB3YWtlDQo+PiArICAgICAgICAgICAgICAgICov
DQo+PiAgICAgICAgICAgICAgICAgZXJyID0geGlpY19idXNfYnVzeShpMmMpOw0KPj4gKyAgICAg
ICAgICAgICAgIHdoaWxlIChlcnIgJiYgdHJpZXMtLSkgew0KPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgbXNsZWVwKDEpOw0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgZXJyID0geGlpY19i
dXNfYnVzeShpMmMpOw0KPj4gKyAgICAgICAgICAgICAgIH0NCj4+ICAgICAgICAgfQ0KPj4NCj4+
ICAgICAgICAgcmV0dXJuIGVycjsNCg0KV2hpY2ggcmVzb3VyY2Ugc3BlY2lmaWNhbGx5IGFyZSB5
b3Ugd29ycmllZCBhYm91dCBuZWVkaW5nIGxvY2tpbmcgaGVyZT8NCg0KSSBkb24ndCB0aGluayB0
aGlzIHBhdGNoIGludHJvZHVjZXMgYW55IG5ldyBuZWVkIGZvciBsb2NraW5nLiBPbmx5IG5ldyBw
YXJhbWV0ZXIsIHdoaWNoIHdhc24ndCBhY2Nlc3NlZCBhbHJlYWR5IGlzIGkyYy0+bXVsdGltYXN0
ZXIsIHdoaWNoIGlzIGEgY29uc3RhbnQgdGhhdCBpcyBuZXZlciBjaGFuZ2VkIGFmdGVyIGRyaXZl
ciBpcyBsb2FkZWQuDQpJZiBpMmMtPm11bHRpbWFzdGVyLCBuZWVkZWQgbG9ja2luZyBpMmMtPnR4
X21zZyB3b3VsZCBoYXZlIG5lZWRlZCBpdCBhbHJlYWR5IGJlZm9yZSwgc2luY2UgaXQgaXMgYSBw
YXJhbWV0ZXIgaW4gdGhlIHNhbWUgc3RydWN0IGFuZCBjYW4gYWN0dWFsbHkgZ2V0IGNoYW5nZWQg
Ynkgc29tZSBvdGhlciB0aHJlYWQuDQpJbiB0aGlzIHNlY3Rpb24gdGhlIG9ubHkgdmFyaWFibGVz
IHdyaXR0ZW4gdG8gYXJlIGxvY2FsIHRvIHRoZSBmdW5jdGlvbi4gU2hhcmVkIHZhcmlhYmxlcyBh
cmUgb25seSByZWFkIGZyb20sIHdoaWNoIHNlZW1zIHByZXR0eSBzYWZlIHRvIG1lIGlmIGNvbnNp
ZGVyaW5nIHRoaXMgZnVuY3Rpb24gYWxvbmUuDQoNCkhvd2V2ZXIsIG5vdyB0aGF0IHlvdSBtZW50
aW9uIGl0IG11bHRpcGxlIHRocmVhZHMgY291bGQgYmUgY2hlY2tpbmcgaTJjLT50eF9tc2cgYXQg
dGhlIHNhbWUgdGltZSBpbnNpZGUgdGhpcyBmdW5jdGlvbiBvciB3YWl0aW5nIGZvciB4aWljX2J1
c19idXN5KGkyYykgdG8gbm90IGJlIGJ1c3kgYW55bW9yZS4NClNpbmNlIGluICJzdGF0aWMgaW50
IHhpaWNfeGZlcihzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFkYXAsIHN0cnVjdCBpMmNfbXNnICptc2dz
LCBpbnQgbnVtKSIgaTJjLT50eF9tc2cgaXMgd3JpdHRlbiB3aXRoIGRhdGEgYmVmb3JlIGFueSBs
b2NraW5nLCBtdWx0aXBsZSB0aHJlYWRzIGNvdWxkIGV4aXQgInhpaWNfYnVzeShzdHJ1Y3QgeGlp
Y19pMmMgKmkyYykiIGFuZCB3cml0ZSB0aGVpciBzdHVmZiB0byBpMmMtPnR4X21zZywgc2luY2Ug
YnVmZmVyIGJlaW5nIGVtcHR5IHdhcyBjaGVja2VkIGJlZm9yZSBhbnlvbmUgaGFkIGEgY2hhbmNl
IHRvIHdyaXRlIHRvIGl0LiBJZiB0aGlzIGhhcHBlbnMsIHNvbWUgZGF0YSB0byBiZSB0cmFuc21p
dHRlZCBjb3VsZCBiZSBsb3N0IHdoZW4gaTJjLT50eF9tc2cgZ2V0cyBvdmVyd3JpdHRlbiBtdWx0
aXBsZSB0aW1lcyBiZWZvcmUgZGF0YSBnZXRzIHRyYW5zbWl0dGVkLiBUaGlzIGlzc3VlIGRpZCBh
bHJlYWR5IGV4aXN0IGJlZm9yZSwgYnV0IGl0IGxvb2tzIGxpa2UgaXQgc2hvdWxkIGJlIGZpeGVk
IHRvIG1lLg0KDQpGaXhpbmcgd291bGQgbmVlZCBsb2NraW5nIGhlcmUsIGJ1dCB0aGUgcG9zc2li
bGUgbXNsZWVwKDEpIC1jYWxscyBpbnNpZGUgeGlpY19idXN5IHNlZW0gbGlrZSBhbiBpc3N1ZSwg
c28gc29tZSBtb3JlIGNoYW5nZXMgbmVlZGVkOg0KLy8gbG9jayBoZXJlDQplcnIgPSB4aWljX2J1
c3koaTJjKTsNCmlmIChlcnIpDQogICAgICAgICAgICAgIC8vIHVubG9jayBoZXJlDQoJZ290byBv
dXQ7DQppMmMtPnR4X21zZyA9IG1zZ3M7DQppMmMtPm5tc2dzID0gbnVtOw0KLy8gdW5sb2NrIGhl
cmUNCg0KPj4gKyAgICAgICBpMmMtPm11bHRpbWFzdGVyID0NCj4+ICsgICAgICAgICAgICAgICBv
Zl9wcm9wZXJ0eV9yZWFkX2Jvb2wocGRldi0+ZGV2Lm9mX25vZGUsICJtdWx0aS1tYXN0ZXIiKTsN
Cj4+ICsNCj5DdXJyZW50IHdpbGwgZGVmYXVsdCB0byBtdXN0aW1hc3RlciBpcyAwLg0KPk1heSBi
ZSB0aGUgZGVmYXVsdCBzaG91bGQgYmUgMSBpZiBub3Qgc3BlY2lmaWVkLg0KDQpUaGUgbXVsdGkt
bWFzdGVyIC1iaW5kaW5nIGlzIGRvY3VtZW50ZWQgaGVyZSBhcyBib29sZWFuIGFuZCBlbmNvZGVz
IGEgQm9vbGVhbiBieSBlaXRoZXIgZXhpc3Rpbmcgb3Igbm90IGV4aXN0aW5nIGluIGRldmljZSB0
cmVlLg0KSXQgaXMgYWxzbyB1c2VkIGluIG90aGVyIGRyaXZlcnMgc28gSSBjb3VsZG4ndCBkbyBt
dWNoIGFib3V0IGl0IG1pc3NpbmcgbWVhbmluZyBGYWxzZS4NCmh0dHBzOi8vZ2l0aHViLmNvbS90
b3J2YWxkcy9saW51eC9ibG9iL21hc3Rlci9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvaTJjL2kyYy50eHQNCkkgb3JpZ2luYWxseSBoYWQgYSBjdXN0b20gZGV2aWNlIHRyZWUgZW50
cnkgd2hlcmUgdGhlIGRlZmF1bHQgd2FzIGZvciBtdWx0aS1tYXN0ZXIgdG8gYmUgZW5hYmxlZCBi
ZWZvcmUgSSBub3RpY2VkIHRoZSBwcmUtZXhpc3RpbmcgYmluZGluZy4NCg0KTWF5YmUgaWYgdGhl
IG11bHRpLW1hc3RlciBiaW5kaW5nIHdhcyBjaGFuZ2VkIGZyb20gQm9vbGVhbiB0byBmb3IgZXhh
bXBsZSBhIHN0cmluZyBwcm9wZXJ0eSAobXVsdGktbWFzdGVyID0gIk9OIiAvIG11bHRpLW1hc3Rl
ciA9ICJPRkYiKSwgY29kZSBjb3VsZCBzdGlsbCBqdXN0IGNoZWNrIHRoZSBleGlzdGVuY2Ugd2l0
aCAib2ZfcHJvcGVydHlfcmVhZF9ib29sKCkiIGZpcnN0LCB3aGVyZSBwcm9wZXJ0eSBtaXNzaW5n
IG1lYW5zICJPRkYiIGFuZCBwcm9wZXJ0eSBleGlzdGluZyBtZWFucyAiT04iKGxpa2UgYmVmb3Jl
KSBpZiB0aGVyZSBpcyBubyB0ZXh0IGFzc29jaWF0ZWQuIFhpaWMgZHJpdmVyIHdvdWxkIHRoZW4g
b25seSBkaXNhYmxlIG11bHRpbWFzdGVyLCBpZiBkZXZpY2UgdHJlZSBleHBsaWNpdGx5IGNvbnRh
aW5zIG11bHRpLW1hc3RlciA9ICJPRkYiLg0KDQpUaGlzIHNob3VsZCBiZSBhYmxlIHRvIG1haW50
YWluIGRyaXZlciBiYWNrd2FyZHMgY29tcGF0aWJpbGl0eSB3aXRoIG9sZCBkZXZpY2UgdHJlZXMs
IGJ1dCByZXF1aXJlcyBiaW5kaW5nIGRvY3VtZW50YXRpb24gY2hhbmdlIGFuZCBhbGwgZHJpdmVy
cyBzaG91bGQgbGlrZWx5IGJlIHVwZGF0ZWQgdG8gYWxzbyBhY2NlcHQgdGhlIG5ldyBzdHlsZSBv
ZiBtdWx0aS1tYXN0ZXIgcHJvcGVydHkgdG8gYmUgY29uc2lzdGVudC4gVGhpcyBpcyBhbHNvIG5v
dCBhcyBjbGVhbiBhcyB0aGUgb2xkIEJvb2xlYW4gcHJvcGVydHkgaW4gbXkgb3Bpbmlvbi4NCg0K
VGhhbmsgeW91IGZvciBjb21tZW50cywNCkphYWtrbw0K

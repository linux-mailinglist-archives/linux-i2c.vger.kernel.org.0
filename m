Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D40D4D865A
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2019 05:25:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390932AbfJPDZT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Oct 2019 23:25:19 -0400
Received: from mail-eopbgr130075.outbound.protection.outlook.com ([40.107.13.75]:32833
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2390917AbfJPDZS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 15 Oct 2019 23:25:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kViF3jUByFRMzBPPh67sYrIchayv7H8Od732y1yNAomMoaOHslyhUCHL/2sFKjRfAqjlbB4T9q5iTaFkCufEZrkpoxSzTsK4adYBZM+7W2eDwh6Z9uGP9J6DL4mGkrHLf1qmaMJczwmkUMNHDECFNhuQCm38TNhZO5GGHBXRRoJNkQyBHBPbOnC7b8dzp91zjGTg5exeaX8R3mWVRnvF435mX2rZtputNXhPVlxIongcJMTKVs7RyptCFPbXkJIS0hQHqZ2rwhKIUyURMYwwSBNGqBbEdgxCb1G2y0VmWBZuqvu8X7pzjUt3gCeBCczgqOjvELv0ug9P7Irl0k60IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3J0Edr48mYO0h8oHxz5tnmEKIJxtso1t3vzY3ny4ejE=;
 b=n+3aSG2q/ftPuu+NFbx3iqETC/3sb/vHZ4jK2lUP1WyXOWeeq0flC26LPotJOl1oiZb/zORJKQhDIUIlUA/9Irr2c+uHdKKGC0aIqyKlIUrTLODthL2q32j7W82k8dRAE7gp8o669E6ynbE7/pjb1q0YRUrsUXzN5+9aoGduqfX+QBappNJ+CFqWR22NEc8Z9HLF7o6OJinQSpf+Pxpf518UrbzFCmff75rt070TgRSuaSuWBZ5u4cguHGbr1gL4c7yWRmTZh0NvCkJb7Lk48cvtwlj+0ZnuXD8EnbLMun7kFljq/D4wzPdpg3/3f7uT1IGRjzQKis8vdE3leYPc4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3J0Edr48mYO0h8oHxz5tnmEKIJxtso1t3vzY3ny4ejE=;
 b=Tap8MQ3gd1SyZvpsnUktqV5am42c1hc+VqA7wPHsACRd9enRWD4jnxg9AeZ9Ob7KQAe3WphYJ5FmxCLDgaPjvc36OBhWGIlHXgViLkNxgcjsBHUddaSIM12JmWZij+DfA/AOCD3+ormm/hkGECFaWo4DSIXqb0wlucmA5wQzIGw=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB5148.eurprd04.prod.outlook.com (20.176.233.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.22; Wed, 16 Oct 2019 03:25:11 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::7804:558a:eef9:cc11]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::7804:558a:eef9:cc11%7]) with mapi id 15.20.2347.023; Wed, 16 Oct 2019
 03:25:11 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     Peter Rosin <peda@axentia.se>, Leo Li <leoyang.li@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [EXT] Re: [v2,1/2] dt-bindings: i2c: add property idle-state
Thread-Topic: [EXT] Re: [v2,1/2] dt-bindings: i2c: add property idle-state
Thread-Index: AQHVgxVYqJHX3ILyNkyr9awgyttOV6db0HsAgADL5PA=
Date:   Wed, 16 Oct 2019 03:25:11 +0000
Message-ID: <DB7PR04MB4490AFF4CA990D3F2C2F51C38F920@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20191015044839.23746-1-biwen.li@nxp.com>
 <996277d6-1c0b-6080-4565-ce3aad77e09e@axentia.se>
In-Reply-To: <996277d6-1c0b-6080-4565-ce3aad77e09e@axentia.se>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb774d58-f53d-4dec-254b-08d751e873f0
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DB7PR04MB5148:|DB7PR04MB5148:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB51481C2F393D6A866044564B8F920@DB7PR04MB5148.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0192E812EC
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(376002)(136003)(346002)(39860400002)(396003)(37524003)(189003)(199004)(66066001)(81156014)(14444005)(2906002)(5660300002)(186003)(316002)(110136005)(54906003)(6246003)(55016002)(9686003)(6116002)(256004)(476003)(8936002)(76116006)(26005)(33656002)(11346002)(81166006)(66446008)(64756008)(66476007)(66946007)(52536014)(446003)(66556008)(99286004)(71200400001)(44832011)(4326008)(486006)(102836004)(7736002)(53546011)(4001150100001)(3846002)(6506007)(7696005)(71190400001)(6436002)(76176011)(2501003)(478600001)(86362001)(305945005)(8676002)(74316002)(229853002)(25786009)(14454004);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB5148;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KJpgPD2i9tQ/B+2wA8DnD59h47PGbLS9K+Sw+gtnjgL5PBSiPSXhrr+i+SiXfypTV5UFyJbB7NDpb6wY+N5BXcnhtHRFGqAQdFz0xOXuaafQz8s6ivxmvPKpOw6T2vB/rosM7d6rey+5zrIujFNexMqfvUxBmYMyBFvdUX+zFIl0rqzRaH4Ih7wuf5glc1iGQUZIsCuIRtnO8YJbBja7WW4cbTotJhY0oKvypfKWgp5Ba3U7rkVn+8gTH2GtwbLJPjg1WacnDDJKAhGDPRCD4lFdQrvVVFXU8/4Cs5RDpwkbJslVBJSBWJSWg7Tro0WJXVfZDajSh/scgBaEqHw+YKwkueKZFIhRQcC+CQg5eigUgWS704tdI8Dkw3F5hKAQ+5s+VLoWdMl+b4qjDqHg7AaJjY9nNszRPVljLVjPYpk=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb774d58-f53d-4dec-254b-08d751e873f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2019 03:25:11.4165
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zRA7Flq0tQHTaPpfDiZYE6Ap1D6//FkHBbVGuWkv8e8Drdv2zL5KmyXRprwWMICg+wKJavWcNzQnAxahGbSCtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5148
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiANCj4gT24gMjAxOS0xMC0xNSAwNjo0OCwgQml3ZW4gTGkgd3JvdGU6DQo+ID4gVGhpcyBhZGRz
IHByb3BlcnR5IGlkbGUtc3RhdGUNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpd2VuIExpIDxi
aXdlbi5saUBueHAuY29tPg0KPiA+IC0tLQ0KPiA+IENoYW5nZSBpbiB2MjoNCj4gPiAgICAgICAt
IHVwZGF0ZSBzdWJqZWN0IGFuZCBkZXNjcmlwdGlvbg0KPiA+ICAgICAgIC0gYWRkIHByb3BlcnR5
IGlkbGUtc3RhdGUNCj4gPg0KPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
aTJjL2kyYy1tdXgtcGNhOTU0eC50eHQgfCAxICsNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2kyYy9pMmMtbXV4LXBjYTk1NHgudHh0DQo+ID4gYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1tdXgtcGNhOTU0eC50eHQNCj4gPiBpbmRleCAzMGFj
NmE2MGYwNDEuLjJjNzg3NWQzMzhmYiAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1tdXgtcGNhOTU0eC50eHQNCj4gPiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1tdXgtcGNhOTU0eC50eHQNCj4g
PiBAQCAtMzQsNiArMzQsNyBAQCBPcHRpb25hbCBQcm9wZXJ0aWVzOg0KPiA+ICAgICAgLSBmaXJz
dCBjZWxsIGlzIHRoZSBwaW4gbnVtYmVyDQo+ID4gICAgICAtIHNlY29uZCBjZWxsIGlzIHVzZWQg
dG8gc3BlY2lmeSBmbGFncy4NCj4gPiAgICAgIFNlZSBhbHNvDQo+ID4gRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2ludGVycnVwdHMudHh0DQo+
ID4gKyAgLSBpZGxlLXN0YXRlOiBQbGVhc2UgcmVmZXIgdG8NCj4gPiArIERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tdXgvbXV4LWNvbnRyb2xsZXIudHh0DQo+ID4NCj4gPiAgRXhh
bXBsZToNCj4gPg0KPiA+DQo+IA0KPiBBcyBwZXIgbXkgY29tbWVudHMgb24gdGhlIGNvZGUsIHlv
dSBzaG91bGQgbWVudGlvbiB0aGF0IGlkbGUtc3RhdGUsIGlmDQo+IHByZXNlbnQsIG92ZXJyaWRl
cyBpMmMtbXV4LWlkbGUtZGlzY29ubmVjdC4gSSBhbHNvIHRoaW5rIHlvdSBzaG91bGQga2VlcA0K
PiBpZGxlLXN0YXRlIGFuZCBpMmMtbXV4LWlkbGUtZGlzY29ubmVjdCByaWdodCBuZXh0IHRvIGVh
Y2ggb3RoZXIuDQpHb3QgaXQsIEkgd2lsbCBhZGp1c3QgaXQgaW4gdjMuDQo+IA0KPiBDaGVlcnMs
DQo+IFBldGVyDQo=

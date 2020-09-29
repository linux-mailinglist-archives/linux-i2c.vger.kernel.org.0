Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35A7E27DC63
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Sep 2020 01:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728197AbgI2XAF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Sep 2020 19:00:05 -0400
Received: from nat-hk.nvidia.com ([203.18.50.4]:12996 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728156AbgI2XAF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 29 Sep 2020 19:00:05 -0400
Received: from HKMAIL101.nvidia.com (Not Verified[10.18.92.77]) by nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f73bc710000>; Wed, 30 Sep 2020 07:00:01 +0800
Received: from HKMAIL103.nvidia.com (10.18.16.12) by HKMAIL101.nvidia.com
 (10.18.16.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 29 Sep
 2020 23:00:01 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (104.47.37.57) by
 HKMAIL103.nvidia.com (10.18.16.12) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 29 Sep 2020 23:00:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMLg2lPOlAcX6vSbEIYdbKl24/7HLmH9wsHGHkNJKgGd3e6KSmGdtYn53n88+wr/0vNqLkAxbzY1/QjEwM73NUEkdG/LPgWRe71fbMgv61CjNwkdfnAckJmN6/aZkSmeUQqx4mpCiH/6oOMUmH6xrSfRgBrfhKGzQ/obDLopFu+Mq4BZ6AEes7abu2xI77Dm+CPjwY9toa8F87WiP/hdapvcgKgrqmSguiGZN4BtejkH7BU8LMIsbuie5AoIYTLbuHprcZ4EvG2fXS4QkpKyeo2lIcAtyXYEDW/z7WNcyOS/CgHiNk8jAXNG6tr17pe+VsFHSMhWhdCpyr1tbbIQpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hBVJQJVA39PTsWRTg6kAsRotEMabClfULUe67jlsCts=;
 b=hRFEyGvVajMbaoRPp/TT91fyB/cMOwK05zqetriu1lX6p+s7dmrIC5sBB8QnWBPt92sKOVP50dCB1Qc4/0BRnIgf4S2iQsQmLMv0Xdsq5ME1PKhZD4FmgMkL2lIVoQL062jY0anm3xIpRYE2VqyH1mkmyANVO216UX164BonuOcVc8yFNp6EmSaIP2sVAL1NXSDPNmKxraag9XMeghAk1Tpy00HyRsoSIXHlorF7wi7SZRILqxvHDT776DMHuEUtLhIwEcABS60NVrr8ZQgYUJbS44ZaHYfdv4g50g77+6sYKvhiBeK7D9F1SOlh9Ja6el3Iu4Xl240SJ5J8cWf5wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from MN2PR12MB3616.namprd12.prod.outlook.com (2603:10b6:208:cc::25)
 by MN2PR12MB3295.namprd12.prod.outlook.com (2603:10b6:208:ae::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Tue, 29 Sep
 2020 22:59:59 +0000
Received: from MN2PR12MB3616.namprd12.prod.outlook.com
 ([fe80::89a:e4ad:708f:363f]) by MN2PR12MB3616.namprd12.prod.outlook.com
 ([fe80::89a:e4ad:708f:363f%5]) with mapi id 15.20.3433.032; Tue, 29 Sep 2020
 22:59:59 +0000
From:   Khalil Blaiech <kblaiech@nvidia.com>
To:     Rob Herring <robh@kernel.org>
CC:     Linux I2C <linux-i2c@vger.kernel.org>,
        Khalil Blaiech <kblaiech@mellanox.com>,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [PATCH v11 2/2] dt-bindings: i2c: I2C binding for Mellanox
 BlueField SoC
Thread-Topic: [PATCH v11 2/2] dt-bindings: i2c: I2C binding for Mellanox
 BlueField SoC
Thread-Index: AQHWkTK/DlIv7U4D/U6XMiw1r8e8/ql1R1KAgAr+bHA=
Date:   Tue, 29 Sep 2020 22:59:59 +0000
Message-ID: <MN2PR12MB3616169BAFE975A1B42F21A7AB320@MN2PR12MB3616.namprd12.prod.outlook.com>
References: <cover.1600804577.git.kblaiech@mellanox.com>
 <cce96d20e0bb258ad84c6ed52c49b957f0fa3452.1600804577.git.kblaiech@mellanox.com>
 <CAL_Jsq+-ZzOiS3CpVCScBmR2a8ZXqg9PbGcXviJ-QP34t41oVQ@mail.gmail.com>
In-Reply-To: <CAL_Jsq+-ZzOiS3CpVCScBmR2a8ZXqg9PbGcXviJ-QP34t41oVQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [173.48.75.27]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11f7de7a-6375-4924-ae04-08d864cb63f5
x-ms-traffictypediagnostic: MN2PR12MB3295:
x-microsoft-antispam-prvs: <MN2PR12MB32958AC4206558F04136BEA1AB320@MN2PR12MB3295.namprd12.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h8dCdJXW8aDkJWiY+f3udtEWL5fp8sPiOeLyXA1oha1EhwEsQSTKhJpkwaMpK2X3/hQHCw4lATEeOWZomxRpUHv7c1stMTDeK6aX8VXjUVL8y4ZXOWadekHWgKOM0OU3Yt5H9pxObjz/8brqSLaC7JV70dsGJx7QVrHOprtSGlhM+2XJQBVjAxDPh9ZMTfsPU5I+MrfLUp5e7W4wX8hGp+uIQTGCI/jXVQ+1n6M++lZF0Gj7aFStWJfwVr218qXDqVvfi1wAPdC7+xkRz/M98ERt4MGoyhRX2A98cpjNV93amcTlB8iFc++8WKk+1qmf1ilMVZqnNhFR8x6309Aptw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3616.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(6506007)(53546011)(8936002)(186003)(26005)(55016002)(9686003)(8676002)(7696005)(86362001)(107886003)(66946007)(76116006)(64756008)(66446008)(66556008)(66476007)(33656002)(478600001)(52536014)(71200400001)(5660300002)(316002)(54906003)(4326008)(2906002)(6916009)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: jto+SE+hCpJHTFt9scumWxRSvaiou6tIZPvvxLF/4WuDul8HYMz5bLRpyKmOCcu9w7uzZ+T4b0z7IxTQ1mND3HDkIvlagK0Zl4fdxNIbVND2Jtk8yZJwD5dQObgr/KHzzZaHF6gcEVZPM0utyxCaOlDX95RoPvj0zyYenWlriFwV2i8dQGD8BupDoKdi5TSrkpj+oAv5Wv0wFdM8AkZmACWqY0SBbpgL+gPb2JTUUKIHBpMWk3QsCHKK8Tbo6dQdY+LAjsx1FKH3mR1X9Glz4tBuq/n+4cyCwQ0FcsFMUeX0T+wEegCfe3e+yHfqccHTuc4fiJ32SGDKaYCYoHdXZrW00Mq6gaPTRKK08OzIq26cTbumCcoJJ+VFG2GVM1aEZqk+zHftiOtwcHsqHsWapz5P1vKUkgGX9B8zFRcC6RmDWgENa17f9KyQYVnOXMKTxd/fKiMefls149DdwFwfROoHkqs+fIOyDpmR9T/bWdPmdSoZa79GSZY4A7ehCQULppvoKGluqcOhG4WQ+AUqDYr9iyUK//P/dh58tSfQRnvDTn2FTxRoNRuCS2CmTetUPPRlfIf5UjpKO+EGJP2Z2Q8hr4zMM39VJpDnUeC2tfkHVZ+v0awIktPlWvOcQATd3Jh9OkiSkjXBAoYOmVMN5g==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3616.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11f7de7a-6375-4924-ae04-08d864cb63f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2020 22:59:59.0269
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7MMMAW8F4mowih2pfzRqBzh2qHPiFrOyifQNSs04wWKxW4rsGijOek+vEP0WFp15AVJCmAEqy0hd70jZ1MIlkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3295
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1601420401; bh=hBVJQJVA39PTsWRTg6kAsRotEMabClfULUe67jlsCts=;
        h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:From:To:
         CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
         In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
         X-MS-TNEF-Correlator:authentication-results:x-originating-ip:
         x-ms-publictraffictype:x-ms-office365-filtering-correlation-id:
         x-ms-traffictypediagnostic:x-microsoft-antispam-prvs:
         x-ms-exchange-transport-forked:x-ms-oob-tlc-oobclassifiers:
         x-ms-exchange-senderadcheck:x-microsoft-antispam:
         x-microsoft-antispam-message-info:x-forefront-antispam-report:
         x-ms-exchange-antispam-messagedata:Content-Type:
         Content-Transfer-Encoding:MIME-Version:
         X-MS-Exchange-CrossTenant-AuthAs:
         X-MS-Exchange-CrossTenant-AuthSource:
         X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
        b=hXcnqvUf93L6N5fAxkmiAb9G46HvFk8JCeLMTYYa+wZ3wIhdet67bQUKlWXMOnJj0
         Vses1SGI/j2cGm9v5uKMjTwH4bg6WX7vxTD2jDTsvHZfGOX3y8pxfYe5UoS3kEbqig
         4WrBtic0dE0W/aodjjujaYo/adZk9bDf9KFbnGpUhqvosYOPQkzxCdOknIPTwEu34S
         j+KWANRzUD0eKYyyMzCE/LfTZc5x3r40PCD7TpcF64XnfDUXiNiSxI4kLvoElwwxcZ
         3sMV8K8DLLBAtM7PV+MRnwyhjH/+bfFrUYxrCu7GIJJguafDU630K9oc7Z2KOdJX3t
         t+MiiDMnv1eKw==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9iIEhlcnJpbmcgPHJv
YmhAa2VybmVsLm9yZz4NCj4gU2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDIyLCAyMDIwIDc6MDUg
UE0NCj4gVG86IEtoYWxpbCBCbGFpZWNoIDxrYmxhaWVjaEBudmlkaWEuY29tPg0KPiBDYzogTGlu
dXggSTJDIDxsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnPjsgS2hhbGlsIEJsYWllY2gNCj4gPGti
bGFpZWNoQG1lbGxhbm94LmNvbT47IFZhZGltIFBhc3Rlcm5hayA8dmFkaW1wQG1lbGxhbm94LmNv
bT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MTEgMi8yXSBkdC1iaW5kaW5nczogaTJjOiBJMkMg
YmluZGluZyBmb3IgTWVsbGFub3gNCj4gQmx1ZUZpZWxkIFNvQw0KPiANCj4gT24gVHVlLCBTZXAg
MjIsIDIwMjAgYXQgNDo0OSBQTSBLaGFsaWwgQmxhaWVjaCA8a2JsYWllY2hAbnZpZGlhLmNvbT4g
d3JvdGU6DQo+ID4NCj4gPiBGcm9tOiBLaGFsaWwgQmxhaWVjaCA8a2JsYWllY2hAbWVsbGFub3gu
Y29tPg0KPiANCj4gVXNlIHNjcmlwdHMvZ2V0X21haW50YWluZXJzLnBsIGFuZCBzZW5kIHRvIHRo
ZSByaWdodCBsaXN0cy9wZW9wbGUuDQo+IFNwZWNpZmljYWxseSwgdGhpcyBuZWVkcyB0byBnbyB0
byB0aGUgRFQgbGlzdCB0byBnZXQgaW4gbXkgcXVldWUuDQoNClVuZGVyc3Rvb2QhDQpTb3JyeSBh
Ym91dCB0aGF0Lg0KDQo+IA0KPiA+DQo+ID4gQWRkIGRldmljZSB0cmVlIGJpbmRpbmdzIGRvY3Vt
ZW50YXRpb24gZm9yIE1lbGxhbm94IEJsdWVGaWVsZA0KPiA+IEkyQyBTTUJ1cyBjb250cm9sbGVy
Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogS2hhbGlsIEJsYWllY2ggPGtibGFpZWNoQG1lbGxh
bm94LmNvbT4NCj4gPiAtLS0NCj4gPiB2NS0+djY6DQo+ID4gICAgICAgICAtIEFkZGluZyBkZXNj
cmlwdGlvbiBvZiBhbiBleHRyYSByZXNvdXJjZSB0byBiZQ0KPiA+ICAgICAgICAgY29uc2lzdGVu
dCB3aXRoIG5ldyBCbHVlRmllbGQtMiBTb0NzLg0KPiA+ICAgICAgICAgLSBBZGRpbmcgYW4gYWRk
aXRpb25hbCBleGFtcGxlIG9mIGRldmljZSBpbnN0YW5jZS4NCj4gPiB2My0+djQ6DQo+ID4gICAg
ICAgICAtIFJlLW9yZGVyaW5nIG9mIHRoZSBwcm9wZXJ0eSBkZXNjcmlwdGlvbnMuDQo+ID4gICAg
ICAgICAtIFJlbW92aW5nIHVzZWxlc3MgcmVnaXN0ZXIgYWRkcmVzc2VzIGZyb20gdGhlDQo+ID4g
ICAgICAgICByZXNvdXJjZSBkZXNjcmlwdGlvbi4NCj4gPiAgICAgICAgIC0gRGVmaW5pdGlvbiBv
ZiBkZWZhdWx0IGNsb2NrLWZyZXF1ZW5jeSB2YWx1ZS4NCj4gPiAgICAgICAgIC0gRml4aW5nIGZv
cm1hdCBpc3N1ZXM7IHJlbW92aW5nIHNwYWNlcy4NCj4gPiAgICAgICAgIC0gUmVtb3ZpbmcgImFs
aWFzZXMiIGZyb20gRXhhbXBsZSBzZWN0aW9uLg0KPiA+ICAgICAgICAgLSBSZW5hbWluZyBkZXZp
Y2UgaW5zdGFuY2Ugbm9kZSBpbiBFeGFtcGxlIHNlY3Rpb24uDQo+ID4gdjItPnYzOg0KPiA+ICAg
ICAgICAgLSBSZW1vdmluZyBzaGFyZWQgcmVzb3VyY2VzIGZyb20gdGhlIGNvbnRyb2xsZXINCj4g
PiAgICAgICAgIGluc3RhbmNlLg0KPiA+ICAgICAgICAgLSBVcGRhdGluZyB0aGUgJ2NvbXBhdGli
bGUnIHByb3BlcnR5IGFuZCBzdXBwb3J0IHRoZQ0KPiA+ICAgICAgICAgc2Vjb25kIGdlbmVyYXRp
b24gb2YgdGhlIE1lbGxhbm94IEJsdWVGaWVsZCBTb0MuDQo+ID4gICAgICAgICAtIEZpeGluZyBm
aWxlIGZvcm1hdDsgcmVwbGFjaW5nIHNwYWNlcyB3aXRoIHRhYnMuDQo+ID4gdjEtPnYyOg0KPiA+
ICAgICAgICAgLSBFbnVtZXJhdGlvbiBvZiB0aGUgZGV2aWNlIHJlc291cmNlcy4NCj4gPiAgICAg
ICAgIC0gVXBkYXRpbmcgdGhlICdjb21wYXRpYmxlJyBwcm9wZXJ0eSB0byBtYWtlIGl0IGxlc3MN
Cj4gPiAgICAgICAgIGdlbmVyaWMuDQo+ID4gICAgICAgICAtIFJlbW92aW5nIHRoZSAnYnVzJyBp
bmRleCBwcm9wZXJ0eSBhbmQgcmVwbGFjZSBpdCB3aXRoDQo+ID4gICAgICAgICBzdGFuZGFyZCBh
cHByb2FjaCB0byByZWFkIHRoZSBidXMgaWRlbnRpZmllci4NCj4gPiAgICAgICAgIC0gR2V0dGlu
ZyByaWQgb2YgdGhlICdwcm9maWxlJyBwcm9wZXJ0eS4NCj4gPiAgICAgICAgIC0gVXNpbmcgJ2Ns
b2NrLWZyZXF1ZW5jeScgcHJvcGVydHkgaW5zdGVhZCBvZiAnYnVzLWZyZXEnLg0KPiA+ICAgICAg
ICAgLSBDb252ZXJ0aW9uIG9mIHRoZSBjbG9jayBmcmVxdWVuY3kgZnJvbSBLSHogdG8gSHouDQo+
ID4gICAgICAgICAtIFJlbW92aW5nIHVzZWxlc3MgZXhhbXBsZXMuDQo+ID4gLS0tDQo+ID4gIC4u
Li9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9tZWxsYW5veCxpMmMtbWx4YmYudHh0IHwgNDINCj4g
KysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNDIgaW5zZXJ0aW9u
cygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2kyYy9tZWxsYW5veCxpMmMtbWx4YmYudHh0DQo+IA0KPiBTb3JyeSwgYnV0IERU
IGJpbmRpbmdzIGFyZSBub3cgaW4gRFQgc2NoZW1hIGZvcm1hdC4NCg0KR290IGl0Lg0KDQo+IA0K
PiBSb2INCg0KVGhhbmtzLA0KLUtoYWxpbA0K

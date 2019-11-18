Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B7D8100F36
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2019 00:03:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727018AbfKRXD6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Nov 2019 18:03:58 -0500
Received: from mail-eopbgr20100.outbound.protection.outlook.com ([40.107.2.100]:7517
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726717AbfKRXD6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 18 Nov 2019 18:03:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Davc0FzVsLvyPEOQs/OvDo9TcqkFCrm0dFuLG/U/L0A6WnzV6vSZgv6IexqdtEfzMNRJjkMfPq1NGxNvVNONPbmCKZv2zMAC65+zkzKIuqghXmen7g0FwB9D0hb5MZKZhNNVGQRiorHN2rZ1PcjKsWVPUvCYeVbeQcsxgmVbwEjDAI6620ah5WyehulwJFrROSy7JD6mppxbDzR9Dns0EvB1UnYcmdhlH/3Kassqrxbi9Ps9Ow9axp2A9SOECR3cIsW2ywYldAzShiHJdTybTfPL0K1GM2JzF2xZaC5HAmAq0oJIrGQj30wWjAPiEyXMAuh/5MZzvvVl6Xgexbap5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1dzjGWPdAZcAyE2N+egMQke7Vn7oCdy/0aOgzg7SNws=;
 b=Kt2CDmpEmsj3lxrj+ValvkITRZszdkl+CDZkhg79DhYj8aF5Fr7E1n0suLRsPVJ1MW1Qx9rm/x19YHYyYox02Ae/xMbSey1qAj8IvVVU1WUi22LPwVK/VzQ84bs4VvRTwoSO9Fhpqf/KsmUuP3oHKTwYYne83z0yzzaTAtQTWNy2XB3fljQg+D0KLb27s0nQpVcC3QiviD4noAAV0uxSFFlOdLcUcB3WIh68wrLeAYJvWEPDm85vIgiyIUp01clIbx+j0pCA/1ha9UbvyDytJPGKv487UBynOGaD4ZI4nJkvYXGcV5f+7aA8SN2BHsE/LIa6gXhA5DQKzRVqzxikEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1dzjGWPdAZcAyE2N+egMQke7Vn7oCdy/0aOgzg7SNws=;
 b=d8LUIjAnIqCEt3XsW1N8GEo2RAUFJEJLNQDSpqLjR52kaieXD+HPw3oRdYAvky1HNe/ntKy4dTHoc7j91dyjCigEmgOgTtty4D2U4emBxkyi+u48pvuAlIxEKYHsLuOHujPKGYTVSp8X3YR3QgHSh+CiZW0koedKkWpbkM+iSeY=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3289.eurprd02.prod.outlook.com (52.134.65.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23; Mon, 18 Nov 2019 23:03:53 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::477:9510:3e3:f8ca]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::477:9510:3e3:f8ca%7]) with mapi id 15.20.2451.029; Mon, 18 Nov 2019
 23:03:53 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Biwen Li <biwen.li@nxp.com>, Leo Li <leoyang.li@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [v5,2/3] i2c: mux: pca954x: support property idle-state
Thread-Topic: [v5,2/3] i2c: mux: pca954x: support property idle-state
Thread-Index: AQHViJBm+lcMepwMLU+ndX3u4pkJDaeMK7oAgAWMBYA=
Date:   Mon, 18 Nov 2019 23:03:53 +0000
Message-ID: <e04c77cc-6c41-8ce3-b584-944eb1595191@axentia.se>
References: <20191022041152.3663-1-biwen.li@nxp.com>
 <20191022041152.3663-2-biwen.li@nxp.com>
 <DB7PR04MB4490B0121FEED3C74A682C248F700@DB7PR04MB4490.eurprd04.prod.outlook.com>
In-Reply-To: <DB7PR04MB4490B0121FEED3C74A682C248F700@DB7PR04MB4490.eurprd04.prod.outlook.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR0802CA0007.eurprd08.prod.outlook.com
 (2603:10a6:3:bd::17) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0f4f791f-44f0-4517-96d8-08d76c7b94f0
x-ms-traffictypediagnostic: DB3PR0202MB3289:
x-microsoft-antispam-prvs: <DB3PR0202MB3289DFD2CB967780BC474BACBC4D0@DB3PR0202MB3289.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0225B0D5BC
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(346002)(396003)(376002)(136003)(39830400003)(189003)(199004)(31686004)(6486002)(6436002)(31696002)(81156014)(229853002)(8676002)(6116002)(386003)(3846002)(66556008)(2906002)(186003)(25786009)(305945005)(71190400001)(71200400001)(66476007)(7736002)(4326008)(76176011)(66446008)(64756008)(52116002)(256004)(102836004)(53546011)(6506007)(6512007)(4744005)(26005)(86362001)(2501003)(8936002)(81166006)(99286004)(14454004)(486006)(66066001)(66946007)(65956001)(65806001)(4001150100001)(5660300002)(6246003)(110136005)(2616005)(446003)(508600001)(58126008)(11346002)(36756003)(476003)(316002)(54906003);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3289;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qTe1aBwXWcM6+efGo+pyW61XsRXmlK72T1+IZFF2klATUNfB7if8ouKuLU2/NrZH3HI9jua6S6QvBsrWCYzmCUXWySXqU0MgYMW9BPa2pVpKuyBjclWcRqg2NcfPXjjQ/y6nHQoOyaBqCMn26r0VlSUOXISudAay1HZedclR6KfUzN7eAG5fA89hNV0WlyMMkeqMP2ZpzVtPYfrIMBkgLI1qoLAIXiCAGzT29XhdJcI8vCqBJQpnZAVFPdzfSzd2f4iTkMDAnBL+qxgFaii4dhNRqaDggGFfWhhx+1P8x76QJNoSHh+ng2t0jaP3Vx38edhk22fWo4x9TSQ0mZYdoMJjy4kdi2/ezjwWq7AqCDsil0HJIsi04PLULP9Y4GmX2spLjvEZeqFt1Qz1/tk7etYW1pn3gOu5mFyvAeaSNesSdHrRv/UBaLk2NbarhYLi
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <DCE7B144E7759445A7D8937EB99236AE@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f4f791f-44f0-4517-96d8-08d76c7b94f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2019 23:03:53.3735
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IVxv6z5qC4Fx389vvfaFdEulG2FxmmWoBVogrtoAMdFoplr0+aopRLFArkdkv9mq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3289
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0xMS0xNSAxMToyMSwgQml3ZW4gTGkgd3JvdGU6DQo+IEhpIFBldGVyLA0KPiANCj4g
QW55IGNvbW1lbnRzPw0KPiBJZiBubyBjb21tZW50cywgY291bGQgeW91IGdpdmUgbWUgYSByZXZp
ZXdlZC1ieT8NCg0KSSB3b3VsZCBoYXZlIGxpa2VkIGEgY29tbWVudCBmcm9tIHRoZSBkcml2ZXIg
bWFpbnRhaW5lciBvciBhIHRlc3RlZC1ieSBmcm9tDQpzb21lb25lIHdpdGggYW5vdGhlciBjYXNl
IHRoYW4geW91cnMuIEJ1dCBub3cgdGhhdCBJIGNoZWNrIEkgc2VlIHRoYXQgdGhlcmUgLQ0KY29u
dHJhcnkgdG8gbXkgYXNzdW1wdGlvbiAtIGlzIG5vIG1haW50YWluZXIgbGlzdGVkLiBTbywgSSB0
aGluayBpdCBsb29rcyBmaW5lLA0KYW5kIEknbSBzdXJlIGl0IGNvbXBpbGVzIGNsZWFubHkgZXRj
IGlmIEkgdGVzdCB0aGF0LCBidXQgSSBjYW4ndCB0ZXN0IHJ1bnRpbWUNCmJlaGF2aW9yIG15c2Vs
ZiBzaW5jZSBJIGRvbid0IGhhdmUgdGhlIEhXLiBJIHNob3VsZCBoYXZlIGJlZW4gY2xlYXJlciBh
Ym91dA0KdGhpcywgYW5kIHNob3VsZCBoYXZlIGRvdWJsZSBjaGVja2VkIHRoZSBtYWludGFpbmVy
IHN0YXR1cyBpbnN0ZWFkIG9mIHJlbHlpbmcNCm9uIHdoYXQgSSB0aG91Z2h0LiBJIGhhdmUgc2lt
cGx5IGJlZW4gZXh0cmVtZWx5IGJ1c3kgYW5kIHRoYXQgc2xpcHBlZC4gU29ycnkuDQoNCkJ1dCBJ
J2xsIHRyeSB0byBzcXVlZXplIHRoaXMgaW50byBsaW51eC1uZXh0IHRvbW9ycm93LCBiZWNhdXNl
IGlmIGxvb2sgc2FmZSwNCmFuZCBob3BlZnVsbHkgYW55IHByb2JsZW0gd2lsbCBiZWNvbWUgYXBw
YXJlbnQuDQoNCkdpdmluZyBhIHJldmlld2VkLWJ5IHNlZW1lZCBwb2ludGxlc3MsIHdoZW4gSSdt
IHRoZSBvbmUgcGlja2luZyBpdCB1cCA6LSkNCg0KQ2hlZXJzLA0KUGV0ZXINCg==

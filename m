Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED2503C4F0
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2019 09:22:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404172AbfFKHVi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jun 2019 03:21:38 -0400
Received: from mail-eopbgr20091.outbound.protection.outlook.com ([40.107.2.91]:40535
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2404247AbfFKHVi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 11 Jun 2019 03:21:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98+ZB+NC7S2Yld34hoieWSEuJ04D1GS6pxtNAUsbicA=;
 b=vExHkttem7lMlTYBt3GGvOlmz5tXsFG8ccN7Cvp0l9VZ8+iPbwa8A1ORJXgKwa7MtM0YXCpc5iGXi84QdFzcRCPxJrwvBqw1AgFyiQf6eNP+Xpqmdbx+3hmYrCLGAYVi1+04rK8Tdt/0ZAiii00j/t+073TR20kQ7u5utpcMngU=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3449.eurprd02.prod.outlook.com (52.134.70.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Tue, 11 Jun 2019 07:21:34 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::49ac:3a71:a3ec:d6bf]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::49ac:3a71:a3ec:d6bf%5]) with mapi id 15.20.1965.017; Tue, 11 Jun 2019
 07:21:34 +0000
From:   Peter Rosin <peda@axentia.se>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] i2c: mux: pinctrl: use flexible-array member and
 struct_size() helper
Thread-Topic: [PATCH] i2c: mux: pinctrl: use flexible-array member and
 struct_size() helper
Thread-Index: AQHVGhwiCares0+d+Ea9vpG6qm7oIaaWGFyA
Date:   Tue, 11 Jun 2019 07:21:34 +0000
Message-ID: <13ad5f5e-28b3-fb1b-6a3b-4a5c347be6db@axentia.se>
References: <20190603145335.GA2743@embeddedor>
In-Reply-To: <20190603145335.GA2743@embeddedor>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR09CA0052.eurprd09.prod.outlook.com
 (2603:10a6:7:3c::20) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ddd9694-114e-4fea-5b81-08d6ee3d6edb
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DB3PR0202MB3449;
x-ms-traffictypediagnostic: DB3PR0202MB3449:
x-microsoft-antispam-prvs: <DB3PR0202MB34496FE96133BB492EF2C20FBCED0@DB3PR0202MB3449.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(39830400003)(376002)(366004)(136003)(396003)(189003)(199004)(36756003)(305945005)(508600001)(4326008)(25786009)(66476007)(31686004)(66556008)(99286004)(52116002)(64756008)(66446008)(74482002)(73956011)(76176011)(14454004)(66946007)(6916009)(58126008)(2906002)(81156014)(65826007)(54906003)(81166006)(8676002)(8936002)(53936002)(3846002)(6246003)(71190400001)(476003)(446003)(68736007)(11346002)(5660300002)(65956001)(6116002)(2616005)(65806001)(229853002)(7736002)(4744005)(14444005)(486006)(86362001)(6436002)(64126003)(256004)(66066001)(26005)(31696002)(53546011)(102836004)(316002)(386003)(6506007)(186003)(6512007)(6486002)(71200400001);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3449;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Hfs9byqxB5bEAZ4aWy6/lN6MlzXb4zBmaDqImZK8ZInneC7fmIxyTHJKUaKOnQRfF+T0B70d92B/447aB1wu7EuultO6xpi1vPFwfJBqY5IADWjtrCQFJAbjK5NiLVNdK4pk52q2xGOc5we1Ju3316XJlHBRCKsTNrQ2ntNILyOmS4wdj0lOZFCVYgZGd31qATBoVymQUvnBqFjy5QdQLe/gb+V9kSrWqink0/NlyYNkT9LCbo5rOFaiS0hFio5f5IJrp1Z1fLA8wtDklG3vwIKXd6pNMD7b0DpETzzqAdIhBvJzPRnMFyhMe8+9SGmX1ju2TOTNlbF+6uWqXCo6+g+MBdSfcSxj6HSyQgDRGlZNf+bUywNx1p6xar43hR0mj2jbb5WOk4BGrVk/rgHCm25IK952UV/LNXaJ4+i6tBY=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FCC2041AEDC7F749B899AD9B5795DD1D@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ddd9694-114e-4fea-5b81-08d6ee3d6edb
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 07:21:34.2617
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: peda@axentia.se
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3449
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0wNi0wMyAxNjo1MywgR3VzdGF2byBBLiBSLiBTaWx2YSB3cm90ZToNCj4gVXBkYXRl
IHRoZSBjb2RlIHRvIHVzZSBhIGZsZXhpYmxlIGFycmF5IG1lbWJlciBpbnN0ZWFkIG9mIGEgcG9p
bnRlciBpbg0KPiBzdHJ1Y3R1cmUgaTJjX211eF9waW5jdHJsIGFuZCB1c2UgdGhlIHN0cnVjdF9z
aXplKCkgaGVscGVyLg0KPiANCj4gQWxzbywgbWFrZSB1c2Ugb2YgdGhlIHN0cnVjdF9zaXplKCkg
aGVscGVyIGluc3RlYWQgb2YgYW4gb3Blbi1jb2RlZA0KPiB2ZXJzaW9uIGluIG9yZGVyIHRvIGF2
b2lkIGFueSBwb3RlbnRpYWwgdHlwZSBtaXN0YWtlcywgaW4gcGFydGljdWxhcg0KPiBpbiB0aGUg
Y29udGV4dCBpbiB3aGljaCB0aGlzIGNvZGUgaXMgYmVpbmcgdXNlZC4NCj4gDQo+IFNvLCByZXBs
YWNlIHRoZSBmb2xsb3dpbmcgZm9ybToNCj4gDQo+IHNpemVvZigqbXV4KSArIG51bV9uYW1lcyAq
IHNpemVvZigqbXV4LT5zdGF0ZXMpDQo+IA0KPiB3aXRoOg0KPiANCj4gc3RydWN0X3NpemUobXV4
LCBzdGF0ZXMsIG51bV9uYW1lcykNCj4gDQo+IFRoaXMgY29kZSB3YXMgZGV0ZWN0ZWQgd2l0aCB0
aGUgaGVscCBvZiBDb2NjaW5lbGxlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogR3VzdGF2byBBLiBS
LiBTaWx2YSA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNvbT4NCg0KVGhhbmtzLCBwYXRjaCBhcHBsaWVk
IHRvIGkyYy1tdXgvZm9yLW5leHQNCg0KQ2hlZXJzLA0KUGV0ZXINCg0KDQo=

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85972C1ADA
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2019 07:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725940AbfI3FRI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Sep 2019 01:17:08 -0400
Received: from mail-eopbgr60102.outbound.protection.outlook.com ([40.107.6.102]:47489
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725809AbfI3FRI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 30 Sep 2019 01:17:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ePRmL32d4pIQG8bONh1r4ep5EbYDnESSd5hTTQoSdfDGO8wjT9gLAt1bi0kAtmhdeE3u+wShzytC4IOCryTREnDJak4M4VluDDKSBcI9ZVNzadgtox3HoBEogCT9Jv70txN8benw3PZBz8+q0aYro6pcbW1+2OCyoAWxMF/iw6gBAMebocMrbu6KLdXyQ8Pf23lTB1y6/MYICm+AIMurYIh0eiVol1U8F4RVUYvk3747jVOwoXZVM3XKbdDFmxljv3J+i5FCp4O+oD/+EHUpBlujtB2OV5lH+qw609wKKKQ9F++pQaPu6Av25l2IktPkzMQwaTmf9D+TN+uUOjuYcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XpAg0sH77YO2bpDWQFLlvvumNWZNot0FTU3h6FbX6Go=;
 b=gIevuCDu3xKGZTOUGtA9K5wt3QsgXpuR9VJ0hJchdyBDGw0SylNLcAOxsBHKhjjJ13xIEjsb/5StL/CLON2GwBwOvw9kvpX1x6x1yqm1ElEgwkaPFCv7rXRyOp/o70ULgLypLmpaIhXLS8ZLKCyNzx0y+4DavpAqyi98q05ob1gekpx7NSjpqsA3EdxRY5CCz0Xqz3VRrbrilvju1htqBZ1z6lIBh4OrWVoJAVMtO0Sax81arhMpU3Hvz/YeTLgvKM/XPDROLo6nfCstndVqJml3rml9GIhH2ND20C7msJPmbTOIEyhmkz1V6CpVOpW4xiCCP7edRv+3zRYayycB1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XpAg0sH77YO2bpDWQFLlvvumNWZNot0FTU3h6FbX6Go=;
 b=JgnfsH3gpLc06YOFmFtSqMmW5vurp0YmZRqA+hl7Ck+56kQo82geaJMkVSrKqyZHBI7xwihm6S1iBiK7/elNDYCqyuc1SXhEIqroybZTiZOyq5iIUdqNhMnZvZmpOTW5MyAUCDgcGz3nDUv+WrgBwsEwl+Icez/NU3AsZERbYbc=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3275.eurprd02.prod.outlook.com (52.134.66.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Mon, 30 Sep 2019 05:16:24 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::c5b8:6014:87a4:1afe]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::c5b8:6014:87a4:1afe%7]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 05:16:24 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Biwen Li <biwen.li@nxp.com>, Leo Li <leoyang.li@nxp.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [EXT] Re: [PATCH] i2c: pca954x: Add property to skip disabling
 PCA954x MUX device
Thread-Topic: [EXT] Re: [PATCH] i2c: pca954x: Add property to skip disabling
 PCA954x MUX device
Thread-Index: AQHVdrNFZZMQUbNsZkan/V0TQ0c5o6dDS96AgAA4dwCAACqiAA==
Date:   Mon, 30 Sep 2019 05:16:24 +0000
Message-ID: <07d85748-0721-39d4-d2be-13eb16b0f1de@axentia.se>
References: <20190929103638.46038-1-biwen.li@nxp.com>
 <e5f4f0b8-05e0-5c70-84f0-817c83059ae7@axentia.se>
 <DB7PR04MB44907DC45C950DE0829A93688F820@DB7PR04MB4490.eurprd04.prod.outlook.com>
In-Reply-To: <DB7PR04MB44907DC45C950DE0829A93688F820@DB7PR04MB4490.eurprd04.prod.outlook.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR0701CA0070.eurprd07.prod.outlook.com
 (2603:10a6:3:64::14) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d9858e6-f14b-4b80-442f-08d745655661
x-ms-traffictypediagnostic: DB3PR0202MB3275:
x-microsoft-antispam-prvs: <DB3PR0202MB3275CE83D432DC90FABBAE41BC820@DB3PR0202MB3275.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(366004)(39830400003)(396003)(376002)(42606007)(346002)(189003)(199004)(508600001)(66946007)(66446008)(110136005)(66556008)(31696002)(7736002)(229853002)(6486002)(64756008)(65806001)(2906002)(6116002)(65956001)(66066001)(6436002)(102836004)(54906003)(305945005)(14454004)(86362001)(66476007)(316002)(3846002)(4326008)(31686004)(58126008)(6512007)(476003)(99286004)(76176011)(36756003)(71190400001)(25786009)(26005)(386003)(6506007)(53546011)(14444005)(81156014)(8676002)(6246003)(81166006)(446003)(2616005)(11346002)(256004)(8936002)(186003)(52116002)(71200400001)(486006)(5660300002);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3275;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qk9yhCtZjtm1numg/leIaJSn/+K/o839TrQHE+TNEhp337kQVqMOiMQwhL2wfBBc5hvoaAqrJIsQCbf6O2LeH6dfGnFDTKkssQlVwPASlY3TbffW9QlPnlfb7ipJZ0hF/7AduaZ3hmg9QP3QrrqHjRIEjfJnGGP7H/5Ro1ORl2TjQmk6dNeFZ71VdrOqHF4z1/X5VqGWI3jRpANqIxN9R0+3cA4nguZ+avj/dzY0mQ6yXibL1nrSRTxx42Ip9RngPhsw50Mnzt/6JcYPqoOu5+9GdN3QwAq5O2CHdgUXsG800jEggyWW6gKXMNe49ttMmdLGZySFFxVOZ/GzznxrHMqVbD1Nk0ZJ1cQWfSHoo7dW/40x/YPBjpnSA5NVU6qYAv122Dg9w253rIOjzaGG5hKyFMw+IrwIhd3pop74iYo=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <0B1D8956CF8A9340AEC713E571D6F58C@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d9858e6-f14b-4b80-442f-08d745655661
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 05:16:24.1152
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RUOtWhLUH7HSt7wwiK1p2s5/ya527vsi/ZfL49rm2jUQYZ4SLw1iP8KV1uqOq7Qt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3275
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0wOS0zMCAwNDo0MywgQml3ZW4gTGkgd3JvdGU6DQo+Pg0KPj4gT24gMjAxOS0wOS0y
OSAxMjozNiwgQml3ZW4gTGkgd3JvdGU6DQo+Pj4gT24gc29tZSBMYXllcnNjYXBlIGJvYXJkcyBs
aWtlIExTMjA4NUFSREIgYW5kIExTMjA4OEFSREIsIGlucHV0DQo+Pj4gcHVsbC11cCByZXNpc3Rv
cnMgb24gUENBOTU0eCBNVVggZGV2aWNlIGFyZSBtaXNzaW5nIG9uIGJvYXJkLCBTbywgaWYNCj4+
PiBNVVggYXJlIGRpc2FibGVkIGFmdGVyIHBvd2VyZWQtb24sIGlucHV0IGxpbmVzIHdpbGwgZmxv
YXQgbGVhZGluZyB0bw0KPj4+IGluY29ycmVjdCBmdW5jdGlvbmFsaXR5Lg0KDQpTREEgYW5kIFND
TCBhcmUgbm90ICJpbnB1dHMiLiBUaGV5IGFyZSBwYXJ0IG9mIGEgYnVzIGFuZCBhcmUgYm90aA0K
YmlkaXJlY3Rpb25hbCBzaWduYWxzLiBTcGVha2luZyBvZiBpbnB1dCBzaWduYWxzIGluIGFuIEky
QyBjb250ZXh0DQppcyBhbWJpZ3VvdXMuDQoNCj4+DQo+PiBIaSENCj4+DQo+PiBBcmUgeW91IHNh
eWluZyB0aGF0IHRoZSBwYXJlbnQgYnVzIG9mIHRoZSBtdXggaXMgcmVseWluZyBvbiBzb21lIHB1
bGwtdXBzIGluc2lkZQ0KPj4gdGhlIG11eD8NCj4gWWVzLCBhcyBmb2xsb3dzOg0KPiAJCQkJCQkJ
CQkJCQkJVkNDDQo+IAkJCQkJCQkJCQkJCQktLS0tLS0tDQo+IAkJCQkJCQkJCQkJCQkgIHwtLS0t
LS0tLS0tLS0tLS0tLS0tDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICAgICAgICAgICB8DQo+IAkJCQkJCQkJCQkJCQkgIFwgICAgICAg
ICAgICBcDQo+IAkJCQkJCQkJCQkJCQkgIC8xMEsgcmVzaXN0ZXIgIC8gMTBrIHJlc2lzdGVyDQo+
IAkJCQkJCQkJCQkJCQkgIFwgICAgICAgICAgICBcDQo+IAkJCQkJCQkJCQkJCQkgIHwgICAgICAg
ICAgICB8DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgICAgICAgICAgICB8DQo+ICAgIEkyQzFfU0NMICAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0gICAgICAgICAgICAgICAgICAgICAgICAgSTJDMV9TQ0wgICAgICAgfCAgICAgICAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tfFNDTCAgICAgICAgICAg
fCAgICAgICAgICAgICAgICAgICAgICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tfFNDTCAgICAgICAgICB8DQo+ICAgIEkyQzFfU0RBICB8ICAgUENBOTU0NyAgIHwgICAg
ICAgICAgICAgICAgICAgICAgICBJMkMxX1NEQSAgICAgICB8ICAgICAgIHwgICAgUENBOTU0NyAg
fCAgICAgICAgICANCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS18U0RBICAgICAgICAgICB8ICAgICAg
ICAgICAgICAgICAgICAgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS18LS0tLS0tLS0tLS18
U0RBICAgICAgICAgfA0KPiAgICAgICAgICAgICAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KPiAgIC0td3JvbmcgZGVzaWduKG5lZWQgc29mdHdhcmUgZml4IGFzIGFib3Zl
IG9yIGhhcmR3YXJlIGZpeCktLSAgICAgICAgICAgICAgLS1wcm9wZXIgZGVzaWduLS0NCg0KT2ss
IGdvdCBpdCAoYnV0IHRoZSAicGljdHVyZSIgZGlkbid0IGhlbHApLg0KDQo+Pg0KPj4+IEhlbmNl
LCBQQ0E5NTR4IE1VWCBkZXZpY2Ugc2hvdWxkIG5ldmVyIGJlIHR1cm5lZC1vZmYgYWZ0ZXIgcG93
ZXItb24uDQo+Pj4NCj4+PiBBZGQgcHJvcGVydHkgdG8gc2tpcCBkaXNhYmxpbmcgUENBOTU0eCBN
VVggZGV2aWNlIGlmIGRldmljZSB0cmVlDQo+Pj4gY29udGFpbnMgImkyYy1tdXgtbmV2ZXItZGlz
YWJsZSINCj4+PiBmb3IgUENBOTU0eCBkZXZpY2Ugbm9kZS4NCj4+Pg0KPj4+IEVycmF0YSBJRDog
RS0wMDAxMyBvbiBib2FyZCBMUzIwODVBUkRCIGFuZCBMUzIwODhBUkRCIChCb2FyZCByZXZpc2lv
bg0KPj4+IGZvdW5kIG9uIFJldi5CLCBSZXYuQyBhbmQgUmV2LkQpDQo+Pg0KPj4gSSB0aGluayB5
b3Ugc2hvdWxkIGZvbGxvdyB0aGUgZXhhbXBsZSBvZiB0aGUgaTJjLW11eC1ncGlvIGRyaXZlciBh
bmQgaW1wbGVtZW50DQo+PiB0aGUgaWRsZS1zdGF0ZSBwcm9wZXJ0eSBpbnN0ZWFkLg0KPj4NCj4+
IFRoYXQgaXMgYSBsb3QgbW9yZSBjb25zaXN0ZW50LCBhc3N1bWluZyBpdCBzb2x2ZXMgdGhlIHBy
b2JsZW0gYXQgaGFuZD8NCj4gR290IGl0LCB0aGFua3MsIEkgd2lsbCB0cnkgaXQuDQoNCkknbGwg
d2FpdCBmb3IgdGhhdCBwYXRjaCB0aGVuLCBpbnN0ZWFkIG9mIHNwZW5kaW5nIG1vcmUgZW5lcmd5
IG9uIHRoZQ0KbmV2ZXItZGlzYWJsZSBhcHByb2FjaC4NCg0KQ2hlZXJzLA0KUGV0ZXINCg==

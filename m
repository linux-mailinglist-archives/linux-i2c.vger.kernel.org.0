Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CF4CA5454
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2019 12:49:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730887AbfIBKtO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Sep 2019 06:49:14 -0400
Received: from mail-eopbgr50130.outbound.protection.outlook.com ([40.107.5.130]:59906
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731058AbfIBKtN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 2 Sep 2019 06:49:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fadFcP2lv/iIhg9YUftV1mxmCUQUgW2vzYAE2INVjTtC51M8Tdsyth3WNce8NdYFkSu8y4UVRedXWaz5CnsykOvNHzgY7/cAsz7ipTm/TWhro0j2meRpmxprKc/89dhZHiZeyyUYmqr+4WFoXI3XDEQR2D9OWH80HQ0OuhDFw/1lsXbLJrg7H3TvEUwXE3VtsLActEKOK1oxd/0n1bvS3t9BGsdDOe2klRAdpdPN2ouTOmyW9rytsdzlWb9mmxKOMeZRC10cVKDaA5VVD6Lyrt2lTHDKt1X+NAlnSh6l7VsXRzYdRdABAe8avue4O+k1CeiL5NDehKFmLLlMTTrF0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AEHqwOkfdWYakvkRhlL4rW+LV775fBYzJtkK33MbazM=;
 b=GQbz7oWUVyV90nQpKXMonfLEQvLr2fsTfpJ/BYf5D/qCrYsLkrp1Xc0+RJg2eMEIxIG2HcK/J9Bmy3YumLtskaR8W1+E/DHqfnPP76GtQmcfwAFB/HwxWGdBt50B6kzopbMtO20Nm1xlPQM4IdsbIgxbM3VpRadjYC5NCV4bnuCKL8QNVskcEEeKz8n9Ikf/aWxHBUxvbFCFHaakg/DqHjFJv9chLi7db0CmA9xKSsZTQTyiG5OJythyxTzcsp4QIOkbuFtE+RBD9hbeIhN0wc8rtpqkWqSaT7EANqQ6rMsGfrzxCLu+Nj/12WgCOMGYlHZk8J+qTkuHXDegd8jGvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AEHqwOkfdWYakvkRhlL4rW+LV775fBYzJtkK33MbazM=;
 b=S87ohxcqJxwFEdXTll/kY2fW4P5NYxBrZcek1CDk3NMr2Lq7Tkm8rlskSXtTkwxrHgc/sqocVPcYlz+LMRQ7BmAvY3BmQGPmWfIOlVKlI/bC9fklSPfmnYEbjtey/ipGCMZsRxFVYQ5OC637xMnm2dhoKQUlaW6yXFqM04sGydI=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3465.eurprd02.prod.outlook.com (52.134.65.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Mon, 2 Sep 2019 10:49:08 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::e12b:afcb:73e1:5d09]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::e12b:afcb:73e1:5d09%7]) with mapi id 15.20.2220.022; Mon, 2 Sep 2019
 10:49:08 +0000
From:   Peter Rosin <peda@axentia.se>
To:     "Eugen.Hristev@microchip.com" <Eugen.Hristev@microchip.com>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "Ludovic.Desroches@microchip.com" <Ludovic.Desroches@microchip.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "pierre-yves.mordret@st.com" <pierre-yves.mordret@st.com>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "Nicolas.Ferre@microchip.com" <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH v4 2/9] dt-bindings: i2c: add bindings for i2c analog and
 digital filter
Thread-Topic: [PATCH v4 2/9] dt-bindings: i2c: add bindings for i2c analog and
 digital filter
Thread-Index: AQHVYXbiXZEVScDXYk6rEHjvPF2S2qcYNSUA
Date:   Mon, 2 Sep 2019 10:49:08 +0000
Message-ID: <9a9c209c-2fb8-0a4c-4e0a-b04fefda3360@axentia.se>
References: <1567418773-2427-1-git-send-email-eugen.hristev@microchip.com>
 <1567418773-2427-3-git-send-email-eugen.hristev@microchip.com>
In-Reply-To: <1567418773-2427-3-git-send-email-eugen.hristev@microchip.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1P189CA0036.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::49)
 To DB3PR0202MB3434.eurprd02.prod.outlook.com (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3683aa3a-4e30-4d2b-5aeb-08d72f932e5b
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DB3PR0202MB3465;
x-ms-traffictypediagnostic: DB3PR0202MB3465:
x-microsoft-antispam-prvs: <DB3PR0202MB346530A8A4D110DC0A33A7FCBCBE0@DB3PR0202MB3465.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01480965DA
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(366004)(136003)(39830400003)(346002)(396003)(199004)(189003)(36756003)(229853002)(6436002)(4326008)(66946007)(8936002)(26005)(99286004)(76176011)(110136005)(3846002)(316002)(66476007)(66556008)(64756008)(6246003)(58126008)(81166006)(81156014)(53936002)(8676002)(66446008)(52116002)(6486002)(6116002)(31686004)(5660300002)(186003)(25786009)(486006)(71190400001)(2201001)(446003)(31696002)(86362001)(508600001)(7416002)(14454004)(2501003)(66066001)(65956001)(53546011)(6506007)(2906002)(6512007)(386003)(7736002)(305945005)(256004)(2616005)(476003)(65806001)(11346002)(71200400001)(102836004)(921003)(1121003);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3465;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Uv/WU99Ao7JFJRV6IBepgQpMYWEuzHNRfSfgh+5Rv3772GkC80k2XJ3rJA9CQe9Kap9M3XUOCudHsD+j9Fg5n7eDgJ+cVzWKLb8zCiiYPRwGwO8dnifBxyoGlJ83vbRHJ4XYr2O+vHOMP1da0vd1OBDZTnFopIeu7CklxmdV6SrUYo/jaqljYdBupN5mDUuxbPqvIHn12LNcRRAMt5n6kLJFs76yEEv5y8yKtZv8hLERpggbhexZoYJFX2jvcr/8YDB0ftPlp7UGX6NUxfMnDlVNNpZqUjFru9OHr5BOqzM1S9dn0VV9egJLoSmvw3prdxSkFhoRHxGttODlEiBl8ImCVfQhQmRHRIpZ0U/b6kf3/sto46EB5pPURlfLvK7+af5/AxM4MclAsOEOk+lZxhSGp3eRR1IQccryOIrJ00k=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <AC53F3D2C1E25D428E0625D4871D40DB@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 3683aa3a-4e30-4d2b-5aeb-08d72f932e5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2019 10:49:08.2390
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NJy+7E1ZYmMSbjWjBYFQeoVhMRWWpyDFTQyfPFgr1oT0gSZxkH5lhfABPoIr1BcR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3465
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0wOS0wMiAxMjoxMiwgRXVnZW4uSHJpc3RldkBtaWNyb2NoaXAuY29tIHdyb3RlOg0K
PiBGcm9tOiBFdWdlbiBIcmlzdGV2IDxldWdlbi5ocmlzdGV2QG1pY3JvY2hpcC5jb20+DQo+IA0K
PiBTb21lIGkyYyBjb250cm9sbGVycyBoYXZlIGEgYnVpbHQtaW4gZGlnaXRhbCBvciBhbmFsb2cg
ZmlsdGVyLg0KPiBUaGlzIGlzIHNwZWNpZmljYWxseSByZXF1aXJlZCBkZXBlbmRpbmcgb24gdGhl
IGhhcmR3YXJlIFBDQi9ib2FyZC4NCj4gU29tZSBjb250cm9sbGVycyBhbHNvIGFsbG93IHNwZWNp
ZnlpbmcgdGhlIG1heGltdW0gd2lkdGggb2YgdGhlDQo+IHNwaWtlcyB0aGF0IGNhbiBiZSBmaWx0
ZXJlZC4gVGhlIHdpZHRoIGxlbmd0aCBjYW4gYmUgc3BlY2lmaWVkIGluIG5hbm9zZWNvbmRzLg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogRXVnZW4gSHJpc3RldiA8ZXVnZW4uaHJpc3RldkBtaWNyb2No
aXAuY29tPg0KPiAtLS0NCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMv
aTJjLnR4dCB8IDExICsrKysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9u
cygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9pMmMvaTJjLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJj
LnR4dA0KPiBpbmRleCA0NGVmYWZkLi44ZGJmZjY3IDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy50eHQNCj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMudHh0DQo+IEBAIC01NSw2ICs1NSwxNyBAQCB3
YW50cyB0byBzdXBwb3J0IG9uZSBvZiB0aGUgYmVsb3cgZmVhdHVyZXMsIGl0IHNob3VsZCBhZGFw
dCB0aGUgYmluZGluZ3MgYmVsb3cuDQo+ICAJTnVtYmVyIG9mIG5hbm9zZWNvbmRzIHRoZSBTREEg
c2lnbmFsIHRha2VzIHRvIGZhbGw7IHQoZikgaW4gdGhlIEkyQw0KPiAgCXNwZWNpZmljYXRpb24u
DQo+ICANCj4gKy0gaTJjLWFuYWxvZy1maWx0ZXINCj4gKwlFbmFibGUgYW5hbG9nIGZpbHRlciBm
b3IgaTJjIGxpbmVzLg0KPiArDQo+ICstIGkyYy1kaWdpdGFsLWZpbHRlcg0KPiArCUVuYWJsZSBk
aWdpdGFsIGZpbHRlciBmb3IgaTJjIGxpbmVzLg0KPiArDQo+ICstIGkyYy1maWx0ZXItd2lkdGgt
bnMNCj4gKwlXaWR0aCBvZiBzcGlrZXMgd2hpY2ggY2FuIGJlIGZpbHRlcmVkIGJ5IGVpdGhlciBk
aWdpdGFsIG9yIGFuYWxvZw0KPiArCWZpbHRlcnMgKGkyYy1hbmFsb2ctZmlsdHIgb3IgaTJjLWRp
Z2l0YWwtZmlsdHIpLiBUaGlzIHdpZHRoIGlzIHNwZWNpZmllZA0KDQpmaWx0ciAtPiBmaWx0ZXIg
KHR3byBpbnN0YW5jZXMpDQoNCldoYXQgaWYgeW91IHdhbnQvbmVlZCB0byBoYXZlIGRpZmZlcmVu
dCBiYW5kd2lkdGggZm9yIHRoZSBkaWdpdGFsIGFuZCBhbmFsb2cNCmZpbHRlcnM/IEFmdGVyIGFs
bCwgdGhpcyBpcyBhIGdlbmVyaWMgYmluZGluZy4uLg0KDQpDaGVlcnMsDQpQZXRlcg0KDQo+ICsJ
aW4gbmFub3NlY29uZHMuDQo+ICsNCj4gIC0gaW50ZXJydXB0cw0KPiAgCWludGVycnVwdHMgdXNl
ZCBieSB0aGUgZGV2aWNlLg0KPiAgDQo+IA0KDQo=

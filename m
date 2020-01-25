Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 998D5149821
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Jan 2020 23:43:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727441AbgAYWnO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Jan 2020 17:43:14 -0500
Received: from mail-eopbgr70094.outbound.protection.outlook.com ([40.107.7.94]:47102
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727285AbgAYWnO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 25 Jan 2020 17:43:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPXhpQpqCmYiE3kHXOkh9rgi55++pZem0Lw/GLG1uwKfLike+g/caQCWd/m7wTJOZXC+ObOGiHE8a2QQdNiP9pcpdB2prg95SYkbn/P/oyFVzfetX6YXGiQuBXYq6W+A/b2mfdLAE8RZdBl1t75WrSeusSsKGVX/z/DY28OFuM/3KSV2RaPwMSsJyzj6352VF/UighD1aKviU4a77EDA45Bsgw+Th8XlgJoZbS3K9GbOuHkv/ewhOzVNjOAMRvzgyZC14ZYTGno7duBgI47mSAHPbtZNfp0KNj3alnKubIV5Lq0pk0nwl+3cDrXoV5MoCRWXm5jKR+OXLxuIBrW4YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiD9imhbL81DWhSOs4WCNLbtDyuvrxJnM6k74aBlpEo=;
 b=CkY8FtITh2VpJt53eyabiwxDJqCmJ8g5hF/XvIO1RIviiq9vJ8AT/cEm5ykfMPEVyhDhEY5OVr4AJtY4izayo/QV4zOx3m07b/db+KUIm3rOSxQBoRfKl7T+eDAp+mxh9qcyk+wt2ftjyvlG9mUDJtUaE6qh89bxEIzT59pdQkqeHxZGXeMa5IrM40G5ge50YToMJOB2bjI8HRyncCANW5PLRUY0N65QRSDyOmqFQe7Z8gzXY1iyqRRhHVNjKPNqzZnAndj2NDUE8OD0MTMiD0OJomTi8EHSw89uNbc0PROdramZ7Ps3Y7z6C0C/Qh8WItNQnvOFx+FD3MEje0vY/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiD9imhbL81DWhSOs4WCNLbtDyuvrxJnM6k74aBlpEo=;
 b=opNuQe+UG37CYG07KYx0deAxin4GhvzBahZLRBf/B1oSUn3XOCwb3g2m1cwS40blwLRB5YNTSQ162fVC+tlhfz1aqeuXUTGgsetDtXplpGN3yoT05PKUyBhgVqPgjpCqsMymJIrAYqgVUJX4m7jLeL0Ar02fGu10OxCy9MUTuzs=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3467.eurprd02.prod.outlook.com (52.134.67.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.24; Sat, 25 Jan 2020 22:43:09 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::cd85:a8a5:da14:db13]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::cd85:a8a5:da14:db13%7]) with mapi id 15.20.2665.017; Sat, 25 Jan 2020
 22:43:09 +0000
Received: from [192.168.13.3] (213.112.138.4) by HE1PR0102CA0035.eurprd01.prod.exchangelabs.com (2603:10a6:7:14::48) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2665.19 via Frontend Transport; Sat, 25 Jan 2020 22:43:08 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Wolfram Sang <wsa@the-dreams.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: [PULL REQUEST] i2c-mux for 5.6-rc1
Thread-Topic: [PULL REQUEST] i2c-mux for 5.6-rc1
Thread-Index: AQHV09DQpkINDjmeWke4+4ljzDWy1g==
Date:   Sat, 25 Jan 2020 22:43:09 +0000
Message-ID: <50c8b786-b261-311c-6c25-07959442c878@axentia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-originating-ip: [213.112.138.4]
x-clientproxiedby: HE1PR0102CA0035.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:14::48) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1bb9a65f-a879-4461-ad67-08d7a1e7f35c
x-ms-traffictypediagnostic: DB3PR0202MB3467:
x-microsoft-antispam-prvs: <DB3PR0202MB34675B9FEDA00479DC35E416BC090@DB3PR0202MB3467.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-forefront-prvs: 0293D40691
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(396003)(39830400003)(366004)(376002)(346002)(199004)(189003)(66446008)(64756008)(66556008)(66476007)(66946007)(508600001)(31686004)(2906002)(956004)(2616005)(26005)(186003)(16526019)(36756003)(81156014)(86362001)(5660300002)(52116002)(31696002)(316002)(16576012)(966005)(8936002)(110136005)(71200400001)(6486002)(81166006)(8676002)(4001150100001);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3467;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HzigVkPoVa1yiv6ZOszXI9N/3HIgX30h/5CJzHHXJxgs6amPkRGlIY96wTX01q4HgecMpbd1/78GIrMMp7zesbwwcLBSAATPU0Seuesoe6RNLqx5YujzS8ZN/h1U/+OHonMQs0dYTwUsd9m4k2Kl+d1DnefF0CeReZezMkPSTnt10zjLlyE27uGWetNlKYcQ2MqHZ+VX/ZX1WIcbpxY+dWPZ+Yc/4/7OlTHfWqqfWmNUCnqXLhRL+dvPjJdEON4Ogy1UqqTxBvd6xoWdJJzCJq0aYDB3OpwqtsKdF8U3t2oiLNxbYmvNsFeU47tfRrhbKv8KgxfVi1vKYAE8u8EB+hFNx492R05OaSHu7g0yDWKZf34JGd8LTyMBOYLtfFLjFqJz6xsuO8eo3iy6Mb4zfje1UtrtdGDGt2XZItbzYZ5Wbh0LnqUSHWxvI5LJJYvfFgA7ur/U0RpJTFhBs4RBvE5UfWoqHpOVXXzNvRS9KlhWz4OFYyVKLziSs7A4DBRmIx5SunGcesY4CWyPLl1FSQ==
x-ms-exchange-antispam-messagedata: ofcQ1ni8fiH/myeyhKle8Oz5GvMjpoRixM8TxrcbAkgwQfYIfnGKEGHiz1t1DsrHM6ZyrtHNUXveZyeewHndMbv9mQY29kLn4Picc2X49zWGiqY+W8C1x92gDh7xL3Oo8HdfZLU8dueu67yN57CaCQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <8606CEAFE60FF346A1D96D400F9C8B9C@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bb9a65f-a879-4461-ad67-08d7a1e7f35c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2020 22:43:09.0617
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eoJoNfwJUbuCW/5xSI90qcGaXTCv7jUHLQouzUBj59Q16oAqwHdA9dx4583N4Ksg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3467
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgV29sZnJhbSwNCg0KVGhpcyBoYXMgYmVlbiBpbiAtbmV4dCBzaW5jZSBhIGNvdXBsZSBvZiB3
ZWVrcywgYW5kIGhhcyB0aHVzIGJlZW4gdGVzdGVkIHNpbmNlDQpyaWdodCBhZnRlciBTdGVwaGVu
IGdvdCBiYWNrIGZyb20gaGlzIGJyZWFrLiBBbmQgaXQncyBob3BlZnVsbHkgbm90IHRvbyBsYXRl
Li4uDQoNClRoZSBtYWluIGZlYXR1cmUgaXMgdGhlIGlkbGUtc3RhdGUgcmV3b3JrIG9mIHRoZSBw
Y2E5NTR4IGRyaXZlciBmcm9tIEJpd2VuIExpLg0KDQpQbGVhc2UgcHVsbC4NCg0KQ2hlZXJzLA0K
UGV0ZXINCg0KVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBkMWVlZjFjNjE5NzQ5
YjJhNTdlNTE0YTNmYTY3ZDlhNTE2ZmZhOTE5Og0KDQogIExpbnV4IDUuNS1yYzIgKDIwMTktMTIt
MTUgMTU6MTY6MDggLTA4MDApDQoNCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5
IGF0Og0KDQogIGh0dHBzOi8vZ2l0aHViLmNvbS9wZWRhLXIvaTJjLW11eC5naXQgaTJjLW11eC9m
b3ItbmV4dA0KDQpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gZTY1ZTIyOGViMDk2M2Jl
MzIxODBkYjMwMzlmMGExNDY3YjQyNmFhZToNCg0KICBpMmM6IG11eDogcGNhOTU0eDogc3VwcG9y
dCBwcm9wZXJ0eSBpZGxlLXN0YXRlICgyMDIwLTAxLTAzIDE1OjAwOjUzICswMTAwKQ0KDQotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tDQpCaXdlbiBMaSAoMik6DQogICAgICBkdC1iaW5kaW5nczogaTJjOiBzdXBwb3J0IHByb3Bl
cnR5IGlkbGUtc3RhdGUNCiAgICAgIGkyYzogbXV4OiBwY2E5NTR4OiBzdXBwb3J0IHByb3BlcnR5
IGlkbGUtc3RhdGUNCg0KUGV0ZXIgUm9zaW4gKDEpOg0KICAgICAgaTJjOiBtdXg6IHBjYTk1NDE6
IHVzZSB0aGUgQklUIG1hY3JvDQoNCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJjLW11
eC1wY2E5NTR4LnR4dCAgICB8ICAyICsNCiBkcml2ZXJzL2kyYy9tdXhlcy9pMmMtbXV4LXBjYTk1
NDEuYyAgICAgICAgICAgICAgICB8IDI5ICsrKystLS0tLQ0KIGRyaXZlcnMvaTJjL211eGVzL2ky
Yy1tdXgtcGNhOTU0eC5jICAgICAgICAgICAgICAgIHwgNjkgKysrKysrKysrKysrKystLS0tLS0t
LQ0KIDMgZmlsZXMgY2hhbmdlZCwgNjMgaW5zZXJ0aW9ucygrKSwgMzcgZGVsZXRpb25zKC0pDQo=

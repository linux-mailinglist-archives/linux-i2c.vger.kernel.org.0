Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6B93A35D1
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2019 13:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727887AbfH3Lft (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Aug 2019 07:35:49 -0400
Received: from mail-eopbgr60122.outbound.protection.outlook.com ([40.107.6.122]:11803
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727417AbfH3Lfs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 30 Aug 2019 07:35:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hf6zgdGu9WLxUt/iJCn5cTTjzaFHwMQiXcjz9tKO2IZxs5xsCDLIP2HnwLxjPz2Oc6ZU5s46b0OD44+aIpQoZRV7euVf0dNzOmjoz8uqBtVc6UAmEqxsNJ/dEDaihm0U/ntUGWyn0Ei/rTCEjVZm/pFNFN8kvht338GrG/Bga1N6a8x+4f+8iFdTAVH9mB3l2LCzAXYTjig/L9GSr6+J2a4D1cW/J7Cddg4RjMI+APuDfYkW1QdSvjGi32fRY/rqkNk/XCakCRZYTFyd7dca5o5uOJbSNh81pLHyW5Nc5pzqQKxA7a0fR7H90/yzQPUMhm3he5rWjlq3FFtF+1zwPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMwTPHB++wv1AtRxw0e+3J8s5vM9Bjw2Fvps5l3ZBa4=;
 b=ZOe7dqUN9q6iigisQ1Uxy0UZ1Z0BTqEBNF7d5j6Fb2odk1rMDb7DPhOh/+gzMxYv9iLOwrkvWINbyuyVV3lS20XSX5iU1CaX3hny5kwSnpUJfNHj5xsaUQWpu0gb+oL2QT30q273Uu5xqwo+G2fqzx/HxNT9d+lDnI8CH/J30DTlKABk/QAdEs17I0Ho+DzQ0QMGz9sz2Zz7duNO5fQBtgKt/xLv9r0WUtMzI1mtuFuhyKHJQeqSZOnSMrx8btkszgUW3284MkiHW8OiNq2NsNba0l8GrsmONw9I2IRgDMaqLknv+2Ri8LWS1gGgsV7n7TWnaxnb6QbbPzOjEYMpZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMwTPHB++wv1AtRxw0e+3J8s5vM9Bjw2Fvps5l3ZBa4=;
 b=Um46H50EW+5GCy56D3gwXq2rc2iN55spSyT7blnfMR/u8VeIbBKgkRZTmVBlwoMe+R+4oLIDbre8UEcV5y4nWzCCnfVH2DwohGq1JultA9FXPsQPO4D5vYVnOX+JL5VTIntNKO08dqkD9bQ4w99qRtAwBXT7V5yoYm3/rEUulYw=
Received: from AM6PR0702MB3527.eurprd07.prod.outlook.com (52.133.24.149) by
 AM6PR0702MB3734.eurprd07.prod.outlook.com (52.133.17.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.14; Fri, 30 Aug 2019 11:35:46 +0000
Received: from AM6PR0702MB3527.eurprd07.prod.outlook.com
 ([fe80::900d:d8bf:ee4:3fbb]) by AM6PR0702MB3527.eurprd07.prod.outlook.com
 ([fe80::900d:d8bf:ee4:3fbb%3]) with mapi id 15.20.2220.013; Fri, 30 Aug 2019
 11:35:46 +0000
From:   "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
To:     Jean Delvare <jdelvare@suse.de>,
        "Xu, Lingyan (NSB - CN/Hangzhou)" <lingyan.xu@nokia-sbell.com>
CC:     "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>,
        "Wiebe, Wladislav (Nokia - DE/Ulm)" <wladislav.wiebe@nokia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i801_smbus: clear SMBALERT status bit and disable
 SMBALERT interrupt
Thread-Topic: [PATCH] i801_smbus: clear SMBALERT status bit and disable
 SMBALERT interrupt
Thread-Index: AQHVXycNtQ6bNeFFV0qdOS3acGbEtQ==
Date:   Fri, 30 Aug 2019 11:35:46 +0000
Message-ID: <2cd456ae-7e90-6c8d-32f4-5efa03823b84@nokia.com>
References: <1565577634-18264-1-git-send-email-lingyan.xu@nokia-sbell.com>
 <20190828155822.7cb13a7b@endymion>
In-Reply-To: <20190828155822.7cb13a7b@endymion>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [131.228.32.166]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-clientproxiedby: HE1PR0102CA0027.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:14::40) To AM6PR0702MB3527.eurprd07.prod.outlook.com
 (2603:10a6:209:11::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=alexander.sverdlin@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80e09812-8ea1-4139-e596-08d72d3e32ec
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:AM6PR0702MB3734;
x-ms-traffictypediagnostic: AM6PR0702MB3734:
x-ld-processed: 5d471751-9675-428d-917b-70f44f9630b0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR0702MB373499D77A1BFF5FA536E27788BD0@AM6PR0702MB3734.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0145758B1D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(136003)(376002)(396003)(39860400002)(366004)(199004)(189003)(6246003)(110136005)(3846002)(6116002)(4744005)(71190400001)(305945005)(71200400001)(81166006)(66066001)(8936002)(65806001)(446003)(2616005)(11346002)(478600001)(8676002)(65956001)(7736002)(5660300002)(2906002)(81156014)(86362001)(14454004)(31696002)(6506007)(36756003)(54906003)(102836004)(58126008)(53936002)(6436002)(99286004)(316002)(6486002)(53546011)(26005)(6512007)(14444005)(256004)(229853002)(186003)(486006)(476003)(25786009)(66556008)(386003)(76176011)(64756008)(66446008)(66476007)(52116002)(66946007)(31686004)(4326008)(79990200002);DIR:OUT;SFP:1102;SCL:1;SRVR:AM6PR0702MB3734;H:AM6PR0702MB3527.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0XaOZ7Zijy9vASYC151CcHJMlDBvxL4PBPXi3feraIAQwpnUiE03CdMo6pzDyNpFnyFO2q3idQgE4i/w4LvBgJrFU9e39FY211WjStv/PcP+WrbQiIsntJHDLPSjHCQMAOw6lKCOh7Xiumq2M0wbOHCqqWwfFmKjTlleNwsmE5RKpYGQ/9Q9nDK9tusaqShi/qZlV7uDkWRPoDKDDGlt0ls2xeTcvFK8gtRiOhMYNvNiWwMwWEDCxLkhNHP3BoZZSB5DR94LaJcOWobHrvyLULY+0eb5vCwNwia4K7YA92HZOVom+jyIz4P8xesZv+5s2gsp7ZKgOTu0A+zTgDRsO+/N5sI0UEucjrAiN3FzpaGBWAwJwiTyorW5L9b0cLtBQAP0zB509jxUjaJIcsSbXy6qdYZYtj1A1vc2ek0lIyhGU17WkVHywUzIZx0intGDp5nCOifOURvnt9Z0nNXR3A==
Content-Type: text/plain; charset="utf-8"
Content-ID: <D25B2473E899D54A90547C1A7DF6ED6E@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80e09812-8ea1-4139-e596-08d72d3e32ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2019 11:35:46.3481
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dQ+Yxaj/3e0ZVA9MasAm3FsTI+20OC/Qfhv23dkUTb5hGAARUkfmZ2MeHrpu8s42q5Z5gpzu9e+XOZ24RAgvyYEe+np3H8idVDwsolFrJ/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0702MB3734
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGVsbG8gSmVhbiwNCg0KT24gMjgvMDgvMjAxOSAxNTo1OCwgSmVhbiBEZWx2YXJlIHdyb3RlOg0K
PiBBbHNvIGl0IGlzIG1hbmRhdG9yeSB0byByZXN0b3JlIHRoZSB2YWx1ZSBvZiBTTUJTTFZDTUQg
YmVmb3JlIHJldHVybmluZw0KPiB0aGUgY29udHJvbCBiYWNrIHRvIHRoZSBCSU9TLiBDdXJyZW50
bHkgdGhpcyBpcyBvbmx5IGJlaW5nIGRvbmUgd2hlbg0KPiB0aGUgRkVBVFVSRV9IT1NUX05PVElG
WSBiaXQgaXMgc2V0IGJlY2F1c2UgdGhhdCdzIHRoZSBvbmx5IGNhc2Ugd2hlcmUNCj4gd2UgY2hh
bmdlIHRoZSB2YWx1ZSBvZiB0aGF0IHJlZ2lzdGVyLCBidXQgaWYgd2UgY2hhbmdlIGl0DQo+IHVu
Y29uZGl0aW9uYWxseSB0aGVuIGl0IG11c3QgYmUgc2F2ZWQgYW5kIHJlc3RvcmVkIHVuY29uZGl0
aW9uYWxseSB0b28uDQoNCmNvdWxkIHlvdSBwbGVhc2UgdGVsbCBhIGJpdCBtb3JlIGFib3V0IHRo
ZSB1c2UgY2FzZSwgd2hlcmUvaG93IGV4YWN0bHkgb25lDQpjYW4gInJldHVybiBjb250cm9sIGJh
Y2sgdG8gdGhlIEJJT1MiPyBNYXliZSByZWZlcmVuY2luZyB0aGUgZnVuY3Rpb25zIGluDQp0aGUg
ZHJpdmVyLi4uDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KQWxleGFuZGVyIFN2ZXJkbGluLg0K

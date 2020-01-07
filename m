Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 696351323A3
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 11:33:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727772AbgAGKd0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 05:33:26 -0500
Received: from mail-eopbgr40106.outbound.protection.outlook.com ([40.107.4.106]:32154
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727177AbgAGKd0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 Jan 2020 05:33:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n5Dir4ECTNYNd+kujy5rZ8L+yLBRuztFRMDBcL5sINqe3HYSsXR338nSJh08bgloS7Em2/jcdfGkbOBaAWf05E+9EY1QLQjOyHXCC+hmOz6UUupfIhZNiuS82mTyREhtwidafSWCl5gQuqMSgOrr391Y96mlIDvfH/Fsl4+R3x7amgAEWQPZATJJrksw7VCxPa8HAJ2YwtN7+UWeLWT5BOPog0loCFWrz9qZuzC7rYPtz/N9Rj6o5vHeU+uR7l5izkqNyhpDKK+Do6Y0iHhkA6iKKXzu0N8ohXVdYL5HRukLb6TfP4PfS8X5NF8JlzeEB9Vw+tSUlNVwydkQrZM6GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gh9naxGfGRaafdhO7qqgZu5oHQRRdfIPBSmmzrPDFJw=;
 b=BFK7wtx8rQna1tK8RVPGHdR2qsoYP7K3zaO1uPiABYhccrfOC1DjTeW/hVmP9m8PKjY9zt3OKNQXLzhhwbbUU7MthBYK7Wh72xx0nMsaTekr9T/9Dk3vGoL6+gj91aubIgTOJuTddI0OO65siO0OM3YlYvkvLvtwbRR8ug8Ycq91zVI/eQdKBeB11UsvKFkGb3YXGYPeKLe2rAiuFvK0nqhc0mwWOSqGmavaC9jsBtDpHtYCc2OED57ZNR2p7cwaS2n8XgEhI5/5l7X/gDLIXCeFqPYSGudReiX1lsVX84pRE/6eydXC0YXByr7W/clSqJs3uh71blW2BD7TBNVHsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gh9naxGfGRaafdhO7qqgZu5oHQRRdfIPBSmmzrPDFJw=;
 b=fMBUW/c+qCo5dBImR/GuuaVbBVwZ/FrXyG+RjiO/eEFt96zH/CDuABfUT2EwdxQs4mBK1FlnQtSo0OBRG0Y1GAonpMp8jbHZPS5oOVX5j9uYx7zC7YrCr6spPV+2PJqYv6b7y8pxFI2Cm8wa04tcNBc4nLbmYpquZhkbWrWHmHU=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3435.eurprd02.prod.outlook.com (52.134.65.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.15; Tue, 7 Jan 2020 10:33:22 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::cd85:a8a5:da14:db13]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::cd85:a8a5:da14:db13%7]) with mapi id 15.20.2602.015; Tue, 7 Jan 2020
 10:33:21 +0000
Received: from [192.168.13.3] (213.112.138.4) by HE1PR06CA0146.eurprd06.prod.outlook.com (2603:10a6:7:16::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.12 via Frontend Transport; Tue, 7 Jan 2020 10:33:21 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Luca Ceresoli <luca@lucaceresoli.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     Wolfram Sang <wsa@the-dreams.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 04/26] docs: i2c: call it "I2C" consistently
Thread-Topic: [PATCH 04/26] docs: i2c: call it "I2C" consistently
Thread-Index: AQHVxBqSvRIltpUk6kON4I7IxH2PsaffA4yA
Date:   Tue, 7 Jan 2020 10:33:21 +0000
Message-ID: <d154a959-a7bb-9d20-501d-757c566e3b5f@axentia.se>
References: <20200105224006.10321-1-luca@lucaceresoli.net>
 <20200105225012.11701-1-luca@lucaceresoli.net>
 <20200105225012.11701-4-luca@lucaceresoli.net>
In-Reply-To: <20200105225012.11701-4-luca@lucaceresoli.net>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
x-originating-ip: [213.112.138.4]
x-clientproxiedby: HE1PR06CA0146.eurprd06.prod.outlook.com
 (2603:10a6:7:16::33) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1592c62-7a12-42fe-f463-08d7935d04b6
x-ms-traffictypediagnostic: DB3PR0202MB3435:
x-microsoft-antispam-prvs: <DB3PR0202MB3435F6425C24B64E9A3C7D56BC3F0@DB3PR0202MB3435.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 027578BB13
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(136003)(376002)(346002)(39830400003)(366004)(189003)(199004)(52116002)(81166006)(53546011)(54906003)(81156014)(31686004)(36756003)(558084003)(110136005)(16526019)(2616005)(956004)(6486002)(8676002)(8936002)(31696002)(316002)(2906002)(186003)(5660300002)(86362001)(71200400001)(66476007)(66946007)(16576012)(66446008)(26005)(4326008)(508600001)(66556008)(64756008);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3435;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HSSchn40IgOh25VRvKlFwd/Ua0Thb9N742vNDVVhz7+1x9wmlkPxQSMVcTYNctlcdexzjxEuVCXEslcoD7DxtSvQiXSeL3kh35bR9lIBJPHiZdVJmhWX0rxmxi+3SluQpvo+69m6t8iC2nMeWDLAE6pcNLfAfbQ8FnnCWAgi7qDnXVC366zXSXmkxsgNTOmQSVdr8YVuycPXeWcPLA3ME3RezJc+3AO7vlTsv+/po8CnQCUZChT8qv7yu1eCIv4R/WlH269pDn0NZbGZTaPAeYGW5rkyEjKiVPM6NaaFgG6+sH6Y/iSAkFanuVSD5MfwojJxaxL5gIHfVQSSV+9YIRvmhrZzNqGC+Q+rVQWOi+0CIUBjLNind19IY9E/3R8fKbDe9Tk1K9teIApN5wttnSdc9W7u1lXYqV0OmQnXsMJi4mYQiPEftYzMmTxOM5q+
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <2A0D506F8311694E98A646E85E05B83D@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: f1592c62-7a12-42fe-f463-08d7935d04b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2020 10:33:21.8624
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cbACYdRJ5ee16qPupqCseE5G3WNfolCi5ai3kDdVz6KU5DxsMkN+47Nhmo4kHlne
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3435
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAyMC0wMS0wNSAyMzo0OSwgTHVjYSBDZXJlc29saSB3cm90ZToNCj4gVXBwZXJjYXNlICJJ
MkMiIGlzIHVzZWQgYWxtb3N0IGV2ZXJ5d2hlcmUgaW4gdGhlIGRvY3MsIGJ1dCB0aGUgbG93ZXJj
YXNlDQo+IHZlcnNpb24gImkyYyIgaXMgdXNlZCBzb21ld2hlcmUuIFVzZSB0aGUgdXBwZXJjYXNl
IGZvcm0gY29uc2lzdGVudGx5Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTHVjYSBDZXJlc29saSA8
bHVjYUBsdWNhY2VyZXNvbGkubmV0Pg0KDQpBY2tlZC1ieTogUGV0ZXIgUm9zaW4gPHBlZGFAYXhl
bnRpYS5zZT4NCg0KQ2hlZXJzLA0KUGV0ZXINCg==

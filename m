Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDEA0102E16
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2019 22:15:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbfKSVPR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Nov 2019 16:15:17 -0500
Received: from mail-eopbgr130128.outbound.protection.outlook.com ([40.107.13.128]:47175
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726874AbfKSVPR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 Nov 2019 16:15:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AhbJZ2OztIHKH2+mNxWwOJTecnsyZyPFseDY7utcX5T1KYC0B9aqPrTkk4TfrKUWctYCKRPsGaBMuSsnWqY7vldy+2vwiiUblexRkSONci3kU7gDR3gvm0mjufC970191Kl1ejdao+bqnJJ2kLcB+KVu7zATsUry6OWPGoE0H+Jk0ENfjnATapjy64222tMnu2CtSXEDjhNRnfVMEWT2f5sUTKhRnTJS8E8MW9VlbriNH+X9iCx9AeuXXBAv3r38PgrNyHI4Y6fe5ATXnMZrHC9vOCTKfNmUaa6JpxKmAUtGJ/921+MTkIfsJVY7OG0yiCnWiNAjMN4biDLVWCi0bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cAn65PskK0/qaHbf2gRU8JdiRb8uyeNTAB6laRBXbCg=;
 b=FP7n76840bTP6BJfH2uvn5sdx7U0l/6XCe8lR1ugsITf3klpaDvS6hWppFEkJDdpOPJj+zxlBdNacxcJKPyCr9s21MhcVo++NpdGGir1XF4gEmmJaEn/njkspX6A7dvPflhsap2I21+U5LPS6y13y1zHnzEKEt8E13cSJ8PcbdHAMMKY4S41zcO0X+NuuwsX+eTVlNzrg6mCqCwevGug4XXmeLxDO8cOLxrF8oaosvtIAQM8JZatND1Iz+1sA56p+wsVbMdGXmgcNnM0ORYQSQLPxAbdyXWVSVhh1TxN2ClOjxwS9YekDvE8IQkM75uJHGR1wnf/j4B6U6B9V2h4Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cAn65PskK0/qaHbf2gRU8JdiRb8uyeNTAB6laRBXbCg=;
 b=CRw8tUQEiKMX0+oZZkji+ZKHnBW3+iGVFXrRfBG45u/J88zZUpHVk11zO45JURU0p9T8qwwteYmOLqXD1wnMtjYqaC5Sy3ayEvyO8fDvUiGQS0HtUx16/AATGLdqXWAcAyRP5sFDMiuN8fssCfaTaANLk2Di+bLYPjlau84GCsU=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3371.eurprd02.prod.outlook.com (52.134.71.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.22; Tue, 19 Nov 2019 21:15:12 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::477:9510:3e3:f8ca]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::477:9510:3e3:f8ca%7]) with mapi id 15.20.2474.015; Tue, 19 Nov 2019
 21:15:12 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Saiyam Doshi <saiyamdoshi.in@gmail.com>,
        "linux@roeck-us.net" <linux@roeck-us.net>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: muxes: pca9541: use BIT() macro
Thread-Topic: [PATCH v2] i2c: muxes: pca9541: use BIT() macro
Thread-Index: AQHVZBRhgr4fXRkPg0qfeWUenga9u6dqZZEAgCkPHIA=
Date:   Tue, 19 Nov 2019 21:15:11 +0000
Message-ID: <6abe4a56-5707-79b5-8f28-a877a132eca9@axentia.se>
References: <20190905180423.GA7477@SD> <20191024181354.GA6889@SD>
In-Reply-To: <20191024181354.GA6889@SD>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR0102CA0023.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:14::36) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a4c39e28-9ed9-4ff5-f1cd-08d76d359010
x-ms-traffictypediagnostic: DB3PR0202MB3371:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DB3PR0202MB337111A63DC6886EDDEC9694BC4C0@DB3PR0202MB3371.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 022649CC2C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(39830400003)(376002)(396003)(136003)(366004)(189003)(199004)(446003)(11346002)(66946007)(6512007)(476003)(6246003)(486006)(4326008)(52116002)(14444005)(4744005)(2501003)(66556008)(66446008)(76176011)(6306002)(2616005)(5660300002)(64756008)(66476007)(25786009)(53546011)(6436002)(8936002)(14454004)(186003)(26005)(386003)(8676002)(6506007)(81156014)(508600001)(102836004)(99286004)(2906002)(81166006)(6486002)(229853002)(256004)(7736002)(36756003)(305945005)(4001150100001)(86362001)(966005)(58126008)(54906003)(31686004)(316002)(110136005)(3846002)(71200400001)(71190400001)(65806001)(65956001)(66066001)(6116002)(31696002);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3371;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oy2O/5bZ8rQhyHzRA9lwUQ1JcymYHy8uC+FLe+KupuRsGMb09sGyYqVZBz3f+TSUZEDnnFPlE3wD+ytxrRyDrPW+4lRSv019Njzip/QGafhKyvLDwkO0A972PuKZ99LQd6wXjEj1dZ2g4YImLzfNph3YjSJMmcpWfXAHVYb0o18Vd0AGWKN2Rpm6Rw691O6meZPByL6BrtJPUy66jisAOe3853zc05BXQsQ9WgTMAYY7Mzj1VwSF6cWZNf0lowdEbxdJn/pGUgxLuORWHHe3to5bG/qezqAXDT9dpDQOCxcrDTYVGIP/hA8tkHW11brlv0fUjekW0VTcjFABhSEhGh7eu+HS04NvCZxfbtb5wkJIRRDvU8UyVaAMrlb+JF4rYTNkxenYyDpRHeZUlM9UGn2GXQ1/RJYWCGGbSH1tngfe8krIyUywIb/zBZzj3/jQE5gJlxyUpKohftG/FI5uX4H4vqjIu+keZt3Z7fV7VMI=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B76985A6C0A154FB45655C23C95CD97@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: a4c39e28-9ed9-4ff5-f1cd-08d76d359010
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2019 21:15:11.8905
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0B8flRXxqi0OJEr8WKM+OU65TFAYPDWwa2d3GkJRhsE9SjaWKWmRDqlGvtKiaPbH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3371
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0xMC0yNCAyMDoxNCwgU2FpeWFtIERvc2hpIHdyb3RlOg0KPiBBbnkgdXBkYXRlIC8g
cmV2aWV3IGNvbW1lbnQgb24gdGhpcz8NCg0KSGkhDQoNClNvcnJ5IGZvciBiZWluZyB1bnJlc3Bv
bnNpdmUuIEl0J3MgZHVwbGljYXRlIGVmZm9ydC4gVGhlcmUncyBhDQp2aXJ0dWFsbHkgaWRlbnRp
Y2FsIHByZXZpb3VzIHBhdGNoIHBlbmRpbmcNCg0KaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9y
Zy9wYXRjaC8xMDUyNTY2Lw0KDQpUaGF0IHBhdGNoIGhhcyBzb21lIHJldmlld2VkLWJ5IGV0Yywg
c28gSSdtIGdvaW5nIHdpdGggdGhhdC4NCg0KQ2hlZXJzLA0KUGV0ZXINCg==

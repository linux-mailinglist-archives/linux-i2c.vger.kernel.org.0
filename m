Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62C9412F90A
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2020 15:06:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727590AbgACOGT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Jan 2020 09:06:19 -0500
Received: from mail-eopbgr10097.outbound.protection.outlook.com ([40.107.1.97]:25718
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727523AbgACOGT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 3 Jan 2020 09:06:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dhZrCJ2XqFFh6dSzIFoL2p8X2g4Doty3PRda6wva8lOudiyUTMkduH3V/SQ5uxpqradwx7BtkomGzw9em/nBFUca5g3aVu0HeSgQkbWgKU208QJ/1TAM7oPbmkIZ1M86iCPu52opaBqSG3hBelpr5+/tsroURNRfuuXs2tofoZJMdLkq9X+nnzgLZBL9Dh1JIl7t3TyvE1X5sSiQmesN4xty0+v5MKObNHVQziLmv4gEOE7bS5/Eo9jQS8MKMdboFNpoKeV2kOOoNDYhCwsNzh5/tS9W1tde4L89tbgweOzdQ2AsppcTSPRxtlhN1bMuGA4k5HKDr1C7SFBSwVgQSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QD2eomr6wBCKcCCpABp6tQVwlu5t0+kpxOUaLzr8E+o=;
 b=Luo9m8pN2ipg0NYxB5wPbd+mCuDn5pdtcq2j4LTDxCTDhMyOmWPxX7TMH0CfDrpiToZQ0LJQdMBxZvj4ws9LvRDS65jkj1sY9SrgDqcWyktHDlvefm/uHfB31BjTDxNg0aPSkdnCtrDl6ILo7ImvfnDnMKV/y3Ru0/k220PJeeCq3cRMLuzKpwsfSgE4NY8y/NT1BTc2QmRS2rqERUGMYeuyLi7nrRWMzRoL6OsIvOCVJKVQNleVtnzi3UjbaTlWUxz4sz4+hOG7hJeMnXoAPb3Vmohl/TrOVcfzEi3MEgEJSSFX9V7ZpG2pBBsLSaWBMrT6MwSkkYpTGtkSbpnYlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QD2eomr6wBCKcCCpABp6tQVwlu5t0+kpxOUaLzr8E+o=;
 b=Hm81V+qZ7gL2MTdWQ7GepEenYYSR3WF37tw3Jc38gV/4Mc+c0aB+LeW8aD/aRC8bRcFmT+gZMGJRK1nhkzTeL03pxFX385vixhj9u1Gu2QKiefCNuJLCp1mj3l1pnYSkIqbaWfV8MkWBXVCXQPaiq/M55kolHfROLhZZIq+SQ6U=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3530.eurprd02.prod.outlook.com (52.134.69.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.13; Fri, 3 Jan 2020 14:06:14 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::cd85:a8a5:da14:db13]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::cd85:a8a5:da14:db13%7]) with mapi id 15.20.2581.013; Fri, 3 Jan 2020
 14:06:14 +0000
Received: from [192.168.13.3] (213.112.138.4) by AM5P190CA0015.EURP190.PROD.OUTLOOK.COM (2603:10a6:206:14::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.12 via Frontend Transport; Fri, 3 Jan 2020 14:06:14 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Biwen Li <biwen.li@nxp.com>,
        "leoyang.li@nxp.com" <leoyang.li@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [RESEND v6,2/3] i2c: mux: pca954x: support property idle-state
Thread-Topic: [RESEND v6,2/3] i2c: mux: pca954x: support property idle-state
Thread-Index: AQHVuw9Tu3G5Z21MR0GhMvQDOXtlpKfZB8kA
Date:   Fri, 3 Jan 2020 14:06:14 +0000
Message-ID: <93a63ac2-eb96-725a-0856-081c332c2b86@axentia.se>
References: <20191225103624.48342-1-biwen.li@nxp.com>
 <20191225103624.48342-2-biwen.li@nxp.com>
In-Reply-To: <20191225103624.48342-2-biwen.li@nxp.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
x-originating-ip: [213.112.138.4]
x-clientproxiedby: AM5P190CA0015.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:206:14::28) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f57684e5-07ec-4d75-649c-08d79056183f
x-ms-traffictypediagnostic: DB3PR0202MB3530:
x-microsoft-antispam-prvs: <DB3PR0202MB353088070DBCD35726399218BC230@DB3PR0202MB3530.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0271483E06
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39830400003)(396003)(376002)(346002)(136003)(366004)(199004)(189003)(66556008)(26005)(316002)(66476007)(64756008)(16526019)(66946007)(186003)(110136005)(54906003)(66446008)(16576012)(31686004)(4001150100001)(6486002)(2906002)(2616005)(956004)(8936002)(8676002)(81166006)(81156014)(71200400001)(86362001)(36756003)(508600001)(53546011)(5660300002)(52116002)(4744005)(4326008)(31696002);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3530;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YrYs1sYZfWhsuAXQXJWyh4VU1ODD0faGi5Ye+8xIxiUhrd4dq2HJpKeZBgMvifge8aVlxHU+2mrrNNvA4G1gKVvBL7akqI41DC+8qGeijil4Te/dLSUJAlupCTTiln+TGPTPqgJIhifLBKMcLqI1hf/XE28HDKMASdLB8IVf8TY/f+Vmxi385A/DoH5XCDLtYKZut89zyLKzK2O1QwDia2/u9O9uLkLybqYLkxPzetOM3U9ECKB1viyzMgBVht2LFmUtOe/eu+lBo96ViZG01ODHHVmEjJbomHh7laLoK/5daf6cPmcXl+cvmv86DIHjTEbOwbACRM7YiU0H3pHnLOYXy9gcJGb2JifgFR7ztCqIKNi+u/RMRe+/3EGTWlV6FTidNPwsp79BJGphYZyPHVFlAk0YdbNKtyKUfpu/LMWC2VIhVp+NB1y8dxNiCOIa
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <8589A2FC10DE394BBDE2FB4A660F3A42@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: f57684e5-07ec-4d75-649c-08d79056183f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2020 14:06:14.6208
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FZWKXv6x1QxZiQ1Ri6yH9d4PocWha0zrYuL6yCVOGysPb57XN7uYN7WjlI10Mw4i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3530
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0xMi0yNSAxMTozNiwgQml3ZW4gTGkgd3JvdGU6DQo+IFRoaXMgc3VwcG9ydHMgcHJv
cGVydHkgaWRsZS1zdGF0ZSxpZiBwcmVzZW50LA0KPiBvdmVycmlkZXMgaTJjLW11eC1pZGxlLWRp
c2Nvbm5lY3QuDQo+IA0KPiBNeSB1c2UgY2FzZXM6DQo+IAktIFVzZSB0aGUgcHJvcGVydHkgaWRs
ZS1zdGF0ZSB0byBmaXgNCj4gCSAgYW4gZXJyYXRhIG9uIExTMjA4NUFSREIgYW5kIExTMjA4OEFS
REIuDQo+IAktIEVycmF0YSBpZDogRS0wMDAxMyhib2FyZCBMUzIwODVBUkRCIGFuZA0KPiAJICBM
UzIwODhBUkRCIHJldmlzaW9uIG9uIFJldi5CLCBSZXYuQyBhbmQgUmV2LkQpLg0KPiAJLSBBYm91
dCBFLTAwMDEzOg0KPiAJICAtIERlc2NyaXB0aW9uOiBJMkMxIGFuZCBJMkMzIGJ1c2VzDQo+IAkg
ICAgYXJlIG1pc3NpbmcgcHVsbC11cC4NCj4gCSAgLSBJbXBhY3Q6IFdoZW4gdGhlIFBDQTk1NHgg
ZGV2aWNlIGlzIHRyaS1zdGF0ZWQsIHRoZSBJMkMgYnVzDQo+IAkgICAgd2lsbCBmbG9hdC4gVGhp
cyBtYWtlcyB0aGUgSTJDIGJ1cyBhbmQgaXRzIGFzc29jaWF0ZWQNCj4gCSAgICBkb3duc3RyZWFt
IGRldmljZXMgaW5hY2Nlc3NpYmxlLg0KPiAJICAtIEhhcmR3YXJlIGZpeDogUG9wdWxhdGUgcmVz
aXN0b3JzIFIxODkgYW5kIFIxOTAgZm9yIEkyQzENCj4gCSAgICBhbmQgcmVzaXN0b3JzIFIyMjgg
YW5kIFIyMjkgZm9yIEkyQzMuDQo+IAkgIC0gU29mdHdhcmUgZml4OiBSZW1vdmUgdGhlIHRyaS1z
dGF0ZSBvcHRpb24gZnJvbSB0aGUgUENBOTU0eA0KPiAJICAgIGRyaXZlcihQQ0E5NTR4IGFsd2F5
cyBvbiBlbmFibGUgc3RhdHVzLCBzcGVjaWZ5IGENCj4gCSAgICBjaGFubmVsIHplcm8gaW4gZHRz
IHRvIGZpeCB0aGUgZXJyYXRhIEUtMDAwMTMpLg0KPiANCj4gVGVzdGVkLWJ5OiBJb2FuYSBDaW9y
bmVpIDxpb2FuYS5jaW9ybmVpQG54cC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEJpd2VuIExpIDxi
aXdlbi5saUBueHAuY29tPg0KDQpQdXNoZWQgdG8gaTJjLW11eC9mb3ItbmV4dCB3aXRoIHNvbWUg
bWlub3IgbGFuZ3VhZ2UgdHdlYWtzLg0KDQpDaGVlcnMsDQpQZXRlcg0KDQoNCg==

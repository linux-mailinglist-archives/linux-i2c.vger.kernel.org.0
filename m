Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E6DF1323AA
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 11:33:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727818AbgAGKdu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 05:33:50 -0500
Received: from mail-eopbgr40106.outbound.protection.outlook.com ([40.107.4.106]:29312
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727806AbgAGKdu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 Jan 2020 05:33:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HtWA665OnCKKzOrUe/cZpUXZ33koR8eyBf1zvC76icKF5h7YHYjJQQzvZU/Yka/CMI4PNDmCNaFC0bpdYAWhhaFV78Yrp7hiMqJFuvhIH6U9RAihWCZLqTa0sJXnmn2gLm50aXhSWHEWBX1IUK9SnwKSRkK0cHaAy14Ud+xvqJLrHckxuqyFHA6TssiB+G3wPgsJ0IgUsbVBLXuQ05R5dlJCbxVd6MC2NCIcHCEoZGRgfYJeDRAOIKIkYmgzcnvYRZwvOzLcI2kaDIeDl3akpnQNL8uhyvkrY581VoyWhgS2dYNG3CzmcTWWcofXuG8muCzLUovbixn7+53FqPnqlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VfTH+2/fbZUbw0p+L2ubAHUDQGa2ndpXPzf0W54hNro=;
 b=IVNo0eq+UIVV5xWHzItbjrlEcWAssoI6/dxOZDL/U5uvFxjqHmcgCml/mbcbN/EP0SWJBvsc7h8wcN8+D0GgaEC9YiGulqubXSp5y3nrqgxqLLN6F4ZwTxgt8vaGRDf3JUYlK4fLHObhUjL97Ih6cxACqb/6TB3Pa1ykCI3ITbmxYWpTBGAvUqe7LuDrHbB/ZlmcQUOakaRpdWMs5poCJrmiO3xWQ9enxJlqIMI0EG0Hc8CXY/64evj1x0sVD8cTF56Iy1AgztL0XfOCLZBUgF23hip+ZW0fQ7kXsq70auMnElytN3FHDQkfgHS1lI3k/iH5s1OCREGtU4fVOzsBQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VfTH+2/fbZUbw0p+L2ubAHUDQGa2ndpXPzf0W54hNro=;
 b=hSOh43+FHZJplTnFhsOBop+OXewelYPWO7GqLeH60fOOhPkcGTnNkNYnYvEGq5hiJMtaSwnGlZCkZOyybq/d9M0iP6KwDYmuV1HrZbttErDkX3JJQaN8alcE8bHGSGz/v0elqX0UNGB/2HG2AgFmJjVjYNkT6PYssR5F9DInnjg=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3435.eurprd02.prod.outlook.com (52.134.65.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.15; Tue, 7 Jan 2020 10:33:47 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::cd85:a8a5:da14:db13]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::cd85:a8a5:da14:db13%7]) with mapi id 15.20.2602.015; Tue, 7 Jan 2020
 10:33:47 +0000
Received: from [192.168.13.3] (213.112.138.4) by HE1PR05CA0288.eurprd05.prod.outlook.com (2603:10a6:7:93::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.12 via Frontend Transport; Tue, 7 Jan 2020 10:33:46 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Luca Ceresoli <luca@lucaceresoli.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     Wolfram Sang <wsa@the-dreams.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 05/26] docs: i2c: fix typo
Thread-Topic: [PATCH 05/26] docs: i2c: fix typo
Thread-Index: AQHVxBqVC/rqj2i6bUSwuPFjdqvrsqffA6kA
Date:   Tue, 7 Jan 2020 10:33:47 +0000
Message-ID: <ca11c14c-5e07-f430-06f0-32bcb71750d4@axentia.se>
References: <20200105224006.10321-1-luca@lucaceresoli.net>
 <20200105225012.11701-1-luca@lucaceresoli.net>
 <20200105225012.11701-5-luca@lucaceresoli.net>
In-Reply-To: <20200105225012.11701-5-luca@lucaceresoli.net>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
x-originating-ip: [213.112.138.4]
x-clientproxiedby: HE1PR05CA0288.eurprd05.prod.outlook.com
 (2603:10a6:7:93::19) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e178ee20-6b87-4f7c-afb8-08d7935d13d0
x-ms-traffictypediagnostic: DB3PR0202MB3435:
x-microsoft-antispam-prvs: <DB3PR0202MB3435EE3044577358904B9649BC3F0@DB3PR0202MB3435.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:400;
x-forefront-prvs: 027578BB13
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(136003)(376002)(346002)(39830400003)(366004)(189003)(199004)(52116002)(81166006)(53546011)(54906003)(81156014)(31686004)(36756003)(558084003)(110136005)(16526019)(2616005)(956004)(6486002)(8676002)(8936002)(31696002)(316002)(2906002)(186003)(5660300002)(86362001)(71200400001)(66476007)(66946007)(16576012)(66446008)(26005)(4326008)(508600001)(66556008)(64756008);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3435;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fZcK8IouTTXuDEb0lu6BDDQGYXR8WQQdVeIPwShmftLgtR1dX7Iewfr1LsMS/UN/JT3BA7BNMgxlsomFdXQf7m2cHjjhrp270j1fsrqkwQWUF/iYGIsNjpiAUiRqTzB/Y7n4VIWu5wQrg/uA92fDgv2SwcQXobcmWN0VkslPFi9s4t/w87OVYXFCbvmVyKIFgN2wGpUa5RjPLpNQOJraa503vNlikNZvFTHvA/wi9XsuQMA+ZukaYGjmstmzDjNun26gbZqv6Ygzml6+lU1oe/RSh4ka/ah0juO+AZXR2yJ9JoAjCRcefGQBijUVjWikuZQiL3TrJ4HZBnXpgj4RIfYxmNSfPGqXmKv3cdrMiCyXvxfbpS0ILYsauMS3CPVRUJFMvdMvgCaea/0aD/mxC1BTKhimH7Y1jz5kSlnBlYD7oYhtaAaUr06dZSWS3wKk
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <572DAD0D84ECC14D890D389C352D1C1E@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: e178ee20-6b87-4f7c-afb8-08d7935d13d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2020 10:33:47.1988
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YO3XIlv+WKiv9eV+o2YzEruThXg/Ip2QYG/HZG2NPcxQnTDMa87fS2odY1QHBss1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3435
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAyMC0wMS0wNSAyMzo0OSwgTHVjYSBDZXJlc29saSB3cm90ZToNCj4gRml4ICJpc3N1cyIg
LT4gImlzc3VlcyIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMdWNhIENlcmVzb2xpIDxsdWNhQGx1
Y2FjZXJlc29saS5uZXQ+DQoNCkFja2VkLWJ5OiBQZXRlciBSb3NpbiA8cGVkYUBheGVudGlhLnNl
Pg0KDQpDaGVlcnMsDQpQZXRlcg0KDQo=

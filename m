Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66A231323AF
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 11:34:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727427AbgAGKeU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 05:34:20 -0500
Received: from mail-eopbgr40107.outbound.protection.outlook.com ([40.107.4.107]:14661
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726558AbgAGKeT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 Jan 2020 05:34:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XxncbLowUIVA+gEbLoqzhJNOZUf0mCn+hNWPcMMguMMTBtMzpYmaFvIm6sdjEXJxnaLr3VtCx0hycnYHU40BOexJyLa+WOvIMftwDquHWvshY88u6qRKf0Y2a7ZQvJnxJZO3k1ZBS+6HzAsA5/BdqXKg31RavECr5tQ+Vnkw1YVL+pTvfeLuYqjMoEPwxOyvxLishiL2VrYe5mua4AjQ/4dauW//Uxi6Nn7A+NIsh6CFsjkUWGh4DtxC3+If2b1224PLrPfIC/E5sYl4PEeT7NWC+vaQ4ZhOgVm7MOe1JSXGxkl4PFAMwkDXvqCDjZdBJYbZd6SYh9WMk3+ObipqAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Thi2fcayMcobJ0EeMmksJYKISrWLGn8lo8O6qWeRy3c=;
 b=CPRJIuyrx3LpIlCnnPKyMEP4210xdxIMdVxSP8X7BOkB7kR6cbR2id8fSYU93IxvmrR41aGNbIV0lSVqBLs69kYwuY+jS+/hqk3EdNQQ0MTwRZMY0l8vbFJP5sI8SuRcWJr+0/ctBZPQFhKQBQxmJDnC1WcBhsr8nlM9MY3DzBCKQOTtPUIgtU+lPcrVEdArWy7h3CWdg65u7TCBiP7Z+AJArMOokoWyRhI+fhsWm3AtswuMk9Th3H9838SGVTqMbwP06dmSnYRis+VrglU+UvuhuZubmWxNUWttLhHDSL004u21PfV9E/Sb3WaCLJqWNXF9d1G3XxMZ/qqehyn07g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Thi2fcayMcobJ0EeMmksJYKISrWLGn8lo8O6qWeRy3c=;
 b=FI6M9KgIuHYmO4E5wgBeVhsNS2Ba2UQNfBVMpOJRLf/NNHhLUfyHoj2IhLoWkPh2TTCQyNjd4KPJnjcETRjO0bHBsb+WUG5swsB9JROJrCgC5YBOk1QaInlrHRW+ReAxrF/bhRBDBX4W95Se9w7yhj1tugv09HYuItdSAhY3Rf8=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3435.eurprd02.prod.outlook.com (52.134.65.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.15; Tue, 7 Jan 2020 10:34:17 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::cd85:a8a5:da14:db13]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::cd85:a8a5:da14:db13%7]) with mapi id 15.20.2602.015; Tue, 7 Jan 2020
 10:34:17 +0000
Received: from [192.168.13.3] (213.112.138.4) by HE1PR05CA0313.eurprd05.prod.outlook.com (2603:10a6:7:93::44) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.11 via Frontend Transport; Tue, 7 Jan 2020 10:34:16 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Luca Ceresoli <luca@lucaceresoli.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     Wolfram Sang <wsa@the-dreams.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 06/26] docs: i2c: replace "I2C-transfer" -> "I2C transfer"
 consistently
Thread-Topic: [PATCH 06/26] docs: i2c: replace "I2C-transfer" -> "I2C
 transfer" consistently
Thread-Index: AQHVxBqa/lSIwxTnaEGW0wDuxwv3AKffA80A
Date:   Tue, 7 Jan 2020 10:34:17 +0000
Message-ID: <083b6e8d-b0c6-0e35-5d69-90405a16418e@axentia.se>
References: <20200105224006.10321-1-luca@lucaceresoli.net>
 <20200105225012.11701-1-luca@lucaceresoli.net>
 <20200105225012.11701-6-luca@lucaceresoli.net>
In-Reply-To: <20200105225012.11701-6-luca@lucaceresoli.net>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
x-originating-ip: [213.112.138.4]
x-clientproxiedby: HE1PR05CA0313.eurprd05.prod.outlook.com
 (2603:10a6:7:93::44) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 71e28d92-a06a-477f-604c-08d7935d25c9
x-ms-traffictypediagnostic: DB3PR0202MB3435:
x-microsoft-antispam-prvs: <DB3PR0202MB3435C9934A9FE952DBC184A9BC3F0@DB3PR0202MB3435.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 027578BB13
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(136003)(376002)(346002)(39830400003)(366004)(189003)(199004)(52116002)(81166006)(53546011)(4744005)(54906003)(81156014)(31686004)(36756003)(110136005)(16526019)(2616005)(956004)(6486002)(8676002)(8936002)(31696002)(316002)(2906002)(186003)(5660300002)(86362001)(71200400001)(66476007)(66946007)(16576012)(66446008)(26005)(4326008)(508600001)(66556008)(64756008);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3435;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: faiQ1HsjRkno5xd8fPvvxLEG0DpWhROYNczkrMuQrnT3a8BE/vrKJNyIMitxLIrk9xmzALp2fSnD990fClyFivgKgnx+tlBZdmWMzRqna8yMg4DjrErW8aapWdhUtfTGP3SavPpOuwmCIua0rVYiVhMg2mpTt2q3dbab3hcSm7f6jHXhF52pI+ZpNkqzezeydKdL1to8WZOJ6KRhw2hEJbTsmOXtMVdg6XViSzKZi7zffAdPL93nISlirjZX0FDrgdZBpulZ5fM6F0ZlAf3bakSyArvpwkn/209o6xfLOhdjEw8pd292izovdSZkytWhS9e+VxJnT93jmOWsqdKPPQIqOjs6kYl25RB1tkIlg9T2xi0Rav9sIQT5JiENRVWMbetsbmzw0DSbezzAcYDkqK8DltYJCw1itH1spv4d0c8LDJN8EkhNaZ9ikoKKX3ZD
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <3DB10AC0EF9F5A43A35589379DA4FA1B@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 71e28d92-a06a-477f-604c-08d7935d25c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2020 10:34:17.2779
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YCwi+MQO5DmmGOnKJ3BC18dyZKsCDJ/ctQyJiImCy0Cue7gZIJi68DeQfGc7MI+S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3435
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAyMC0wMS0wNSAyMzo0OSwgTHVjYSBDZXJlc29saSB3cm90ZToNCj4gIkkyQyB0cmFuc2Zl
ciIgaXMgYSBsZWdpdGltYXRlIGVuZ2xpc2ggc2VudGVuY2UsIG5vIG5lZWQgZm9yIGEgaHlwaGVu
DQo+IGJldHdlZW4gdGhlIHR3byB3b3JkcywgYXMgYXMgc3VjaCBpdCBpcyB1c2VkIGluIG1vc3Qg
b2YgdGhlDQo+IGRvY3VtZW50YXRpb24uIFJlbW92ZSB0aGUgaHlwaGVuIGluIHRoZSBmZXcgcGxh
Y2VzIHdoZXJlIGl0IGlzIHByZXNlbnQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMdWNhIENlcmVz
b2xpIDxsdWNhQGx1Y2FjZXJlc29saS5uZXQ+DQoNCkFja2VkLWJ5OiBQZXRlciBSb3NpbiA8cGVk
YUBheGVudGlhLnNlPg0KDQpDaGVlcnMsDQpQZXRlcg0KDQo=

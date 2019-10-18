Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC192DBC36
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Oct 2019 06:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391474AbfJRE6M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Oct 2019 00:58:12 -0400
Received: from mail-eopbgr10118.outbound.protection.outlook.com ([40.107.1.118]:40356
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2409565AbfJRE6L (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 18 Oct 2019 00:58:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eIp6Sma/CnpdKpP7WK4L607PXeKMJd/7KLx21kesqVawIcD9RR8Hf8FL9rsO728qsdQv/HAhEAlmAAG/4X6YUTQ/EFI+biABtDl7S0iuAoD62z8++fzqZepe1IF5Ct6G/AwDrvwwQzeovS8glgvt82XYxrUkWosY++6r0lbMOaPh4u2DCxuajvJyoV9gJ+XtDBhqpCbL66qvMSlBp7F9zVyYVZrjNadnKkrgRSUjDXADpv1kDb2Cb0LN960iOQjyJk78GnV6VtyoFjx0NFZz6+ipS3Eesu/EycyTVnCSv0+eHT9QuB0j6ob/8SJzFZF9FSOKWAC2CoXrfX0GOCDlsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WAutOlWPaUpcgOQO8NkpjxAYX5HSqIynUyrCUfOhAs=;
 b=OWW+TYfgNvrt76nTfyzHYddOd+KnWN01caAHXA9tSYEXNQLrGtG4RggVQagZR1+1izVVQO1gP8UiyKUYOcXu13oohZryLfFQhCpYXKIL+/NcnCSUghJCP+UMX81Qx753fiNMuoMCbLOLeNSMGvdGAazmF37crZnyPBTc6CSzwKyWi4jcwDbrSuB/rmIMlaGjaH+rcnbBsou6uXkuzwo6K3Zhd0IkefKp6y5wlJ1Mib/xRkmjuXntyb8ZPyqPZPCUzVL71v7/nBDJwO1D8anMTmKt7w6za5LVJXwi2aAllLmAVkZtGMSbDnJPt0OnbI/JD1v4pY2loZzS3W2ZxSajSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WAutOlWPaUpcgOQO8NkpjxAYX5HSqIynUyrCUfOhAs=;
 b=ApUmRmjZ+rjNepJUyFjhAFTHEhWtQ3z/1ilcKPV305ElWwY2Bf+22VgC1NHQmNKKDoqpYjt3xhzBqE9BrlMvY84MsUpmfb5M0t6F1YaM5KZU37//fCTkS4lUa2rrdgrEu9I4l+b9iMNxTHKitpgxs2xYbQ/5JoxkZhrPEQi8qfs=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3290.eurprd02.prod.outlook.com (52.134.70.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Fri, 18 Oct 2019 04:28:51 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::c5b8:6014:87a4:1afe]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::c5b8:6014:87a4:1afe%7]) with mapi id 15.20.2347.023; Fri, 18 Oct 2019
 04:28:51 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Eddie James <eajames@linux.vnet.ibm.com>,
        Joel Stanley <joel@jms.id.au>,
        Brendan Higgins <brendanhiggins@google.com>
CC:     linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Eddie James <eajames@linux.ibm.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: AST2600 i2c irq issue
Thread-Topic: AST2600 i2c irq issue
Thread-Index: AQHVhLIhqiWAxQsJokuvc8rg/cExN6dfSmgAgAAgwwCAAGSBgA==
Date:   Fri, 18 Oct 2019 04:28:51 +0000
Message-ID: <b2149b86-56c7-dee7-2ea7-49f8837534b0@axentia.se>
References: <CACPK8XdqFkPgCQcgpM5C_YwfJ86Lmk=hG5zTcfbCDCMncXCJMg@mail.gmail.com>
 <f9fecc04-2a9a-4cbd-a1ff-ffb680b0fec2@linux.vnet.ibm.com>
 <dbb8635e-a95a-3951-cd65-3428adc461ec@linux.intel.com>
In-Reply-To: <dbb8635e-a95a-3951-cd65-3428adc461ec@linux.intel.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1P18901CA0014.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:3:8b::24) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5349acf6-03e5-4b2c-1363-08d75383ad43
x-ms-traffictypediagnostic: DB3PR0202MB3290:
x-microsoft-antispam-prvs: <DB3PR0202MB3290B5B3B41F9DAF6634C106BC6C0@DB3PR0202MB3290.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 01949FE337
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(396003)(346002)(39830400003)(136003)(366004)(199004)(189003)(36756003)(508600001)(14454004)(486006)(52116002)(476003)(76176011)(11346002)(2616005)(6512007)(229853002)(99286004)(2906002)(6436002)(6486002)(26005)(102836004)(6246003)(31686004)(4326008)(186003)(6506007)(53546011)(386003)(6116002)(3846002)(446003)(54906003)(110136005)(58126008)(7736002)(316002)(305945005)(25786009)(31696002)(86362001)(81166006)(81156014)(8676002)(8936002)(66446008)(66476007)(66556008)(256004)(64756008)(14444005)(66946007)(4744005)(4001150100001)(5660300002)(71190400001)(71200400001)(66066001)(65956001)(65806001);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3290;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UhP9dkYP5/G7FVyodB3zrU/skj53HBmMJE3JVnNxTKU2P7UgsKPc/JiyFzmglOn1d3L8+T2RT9RoGNPoFHMvydjNS7KCAYm+MmovvX9nccaMnfbXnF4odKO+H99tgxFqoIt2ar5p3UBTNwaJ7wEG3/fI1yN/AEgE+oGzvFoRfvAvct1qn/dHblvUGvGc8DCeHMLsMEIhdYI+7fzqtJ9WOryHBvRoexavqtwiQZI1+73m0n1epoETpC35H0/DrlLX+fJqZa9Y3EYHnhqgZh3UqrDwnPWTDVqk5x3DDouRX8KWZaVylViCAEJEHZ4Shjyceqra+vEpzqT+CnXp/JxMWf79pD4yqXpfrGZaqvUywJ9ySLMxBXtaaGqGwo0WVFzkVCWFzskN7RpEtTzZcrnsaQT62DlVqHsJWr+xy9yxJFk=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <8FA831F295B08D4689970F2EDEBAC02E@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 5349acf6-03e5-4b2c-1363-08d75383ad43
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2019 04:28:51.2517
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DX9whIvrsp9uFqYU6GtU2Ib3W8F5sseOfa1PYhuwXl0z2bgzKTnF98ZQBVSRBiFK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3290
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0xMC0xOCAwMDoyOSwgSmFlIEh5dW4gWW9vIHdyb3RlOg0KPiBPbiAxMC8xNy8yMDE5
IDE6MzEgUE0sIEVkZGllIEphbWVzIHdyb3RlOg0KPj4gSSB3YXMgYWxzbyBhYmxlIHRvICJmaXgi
IHRoaXMgYnkgc2ltcGxlIHJldHVybmluZyBJUlFfTk9ORSBpZiBpcnFfc3RhdHVzIA0KPj4gPT0g
MCBpbiB0aGUgaW50ZXJydXB0IGhhbmRsZXIuIEJ1dCBwcm9iYWJseSBub3QgYSBnb29kIHNvbHV0
aW9uLg0KPiANCj4gQSBmaXggbGlrZSBiZWxvdywgcmlnaHQ/DQo+IA0KPiBAQCAtNjAzLDYgKzYw
Myw5IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBhc3BlZWRfaTJjX2J1c19pcnEoaW50IGlycSwgdm9p
ZCANCj4gKmRldl9pZCkNCj4gDQo+ICAgICAgICAgIHNwaW5fbG9jaygmYnVzLT5sb2NrKTsNCj4g
ICAgICAgICAgaXJxX3JlY2VpdmVkID0gcmVhZGwoYnVzLT5iYXNlICsgQVNQRUVEX0kyQ19JTlRS
X1NUU19SRUcpOw0KPiArICAgICAgIGlmICghaXJxX3JlY2VpdmVkKQ0KPiArICAgICAgICAgICAg
ICAgcmV0dXJuIElSUV9OT05FOw0KPiArDQoNCkRvbid0IGZvcmdldCBzcGluX3VubG9jaygmYnVz
LT5sb2NrKTsNCg0KQ2hlZXJzLA0KUGV0ZXINCg==

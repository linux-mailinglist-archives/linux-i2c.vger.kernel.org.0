Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 747E2BBBB5
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2019 20:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728067AbfIWSj3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Sep 2019 14:39:29 -0400
Received: from mail-eopbgr10109.outbound.protection.outlook.com ([40.107.1.109]:49926
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727376AbfIWSj3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 23 Sep 2019 14:39:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gEm5irB5vlvofzcq8/Yvey+/LtB4ZOu3l+o694mt1M1FWcTmSisKW+QY0ptt31vMCAo9kIajWTPPozoDMOGwqSKNPLy3BwqsejjleUkAeS45ThbobAF85J0eokMgYgRzGk+N7TQ3SZ3WswIw33rtSUn0loBDJYa9Gc960Q+Z04/71mSQs1sIFW1vdbvsvK2351+HgZxfI1LdJ4RwjgU2RwpQlLE5x5mDct7lKHDXt5m5un40owiKWfdURgT8ga/kYIlVx2pmhTRJ/7yeF/8mhlXyqo1rP1LuKNQced0V3N2GWzm98xU7chBYmz9jij43L/ZAZC6A4gH9BiWlSXlkgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mF9rslXDRsdDPOrMQ48XVv7NCJ60qaDlzeL8GACi3uc=;
 b=neS5bUDs6fexnu62K6ljjAwMJr03YhX8Y56q7s5ckJWw/WX6+hQUp0F7KsbnbPAMZccZABSuJGJI3YAN92JFnnuYx3VcnbaezKV8wkYY2Beqspk03ldKF/ZT1iNb2zHk6f0ZobA1FYSpx5ttiBT+K2UIJPPx5CYuTWRzVdxrfB7vVs5DaOnpq/49MK0PNEvYGERfisegyZqR3eW21hlB76NPTJXLt+7fIJzA7wBqq/Nxb7CirxdygQLO3/aVvU3QxT306QCpKIbW3UlLjQOFTQ170H+3x97MTfz0HVMrfGVzektJHg4OPPcIL+BBfwFtTWsRwT7z59SBBgZoDV9JXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mF9rslXDRsdDPOrMQ48XVv7NCJ60qaDlzeL8GACi3uc=;
 b=YwHzAfPpwmgwl460HeEb7wIiNbfukzNlaQPuav9gN9mpbku8FGKNQf6xFb14EIIvu9KXNfnPA5atpbAx/3To5adzhIHxRZ123iJeXK8XtwSv7TaiGEPKcrMarjTrXWfIFRL2WIqJpqfRV8ci4Gxs6YXlQQorXLmFf5L7bfrjAGs=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3420.eurprd02.prod.outlook.com (52.134.67.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.25; Mon, 23 Sep 2019 18:39:24 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::c5b8:6014:87a4:1afe]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::c5b8:6014:87a4:1afe%7]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 18:39:24 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] dt-bindings: at24: convert the binding document to yaml
Thread-Topic: [PATCH] dt-bindings: at24: convert the binding document to yaml
Thread-Index: AQHVcjeocf98ho4EUE6as/1S5tdIl6c5lYUAgAABMQCAAAFEAA==
Date:   Mon, 23 Sep 2019 18:39:24 +0000
Message-ID: <bf499787-acd1-1919-a4b4-c0278a50e282@axentia.se>
References: <20190923175211.2060-1-brgl@bgdev.pl>
 <b3a3ca68-45ab-c60a-7f48-636b102b32c1@axentia.se>
 <CAMRc=MfEtSg9eABT5Zb=KQWqXn4BiWxC9eTibSSMAOnHMw8DGQ@mail.gmail.com>
In-Reply-To: <CAMRc=MfEtSg9eABT5Zb=KQWqXn4BiWxC9eTibSSMAOnHMw8DGQ@mail.gmail.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR0102CA0012.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:14::25) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1c0d51dd-b858-4f4e-1115-08d740555b1c
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DB3PR0202MB3420;
x-ms-traffictypediagnostic: DB3PR0202MB3420:
x-microsoft-antispam-prvs: <DB3PR0202MB3420EB69906E2331423C865FBC850@DB3PR0202MB3420.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(39830400003)(136003)(396003)(346002)(42606007)(366004)(189003)(199004)(7736002)(6436002)(305945005)(256004)(4326008)(4744005)(71190400001)(102836004)(316002)(6916009)(11346002)(8936002)(446003)(66946007)(6506007)(186003)(6246003)(54906003)(6512007)(58126008)(26005)(53546011)(386003)(66446008)(64756008)(66556008)(66476007)(5660300002)(8676002)(65806001)(65956001)(66066001)(99286004)(31696002)(14454004)(76176011)(71200400001)(3846002)(6116002)(36756003)(486006)(81156014)(81166006)(86362001)(476003)(2616005)(52116002)(6486002)(2906002)(25786009)(229853002)(508600001)(31686004);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3420;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: q1FqMqtXmkE628q17FqI5G1d6GMp+ELN30I9cVuxO3gfxapGqvLL/WxaN54A7rt6P6sXD1h5DUE0EtsTw8hT8Lk8PjlwLVBpo5FzCE1IRQzqW5ljTVxDYP8kMBrfJNIK7TJmW83kOaxKKteU9+2Lc+jqtA31bZkHm4jIaO0PZteUFJYuysHfSa9GN1IdSxjf8E1aa9DcOLJslG+pIg0ZJ5OZzprE732VA7e6QoMe0xaRTgiGcKCsjxsvX4CfdXYIP1Kar0/4MRnw8jP76kGYa0ipX+VHtgh5IiRX5HsqHmsz71CoDGIOG1mPgTEpwjkIkpavHQ8DzCqX6fRt8690uDuYKcJCWoZ9otuZ7rXVWmsZaCi+FObIE3YiokCutBWq/TSHJL+NKfoaX0Mdv8ugGFajUL/efLntOeGTY8BQIn8=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <4839E545D3A3E2409D208AED16C25AB7@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c0d51dd-b858-4f4e-1115-08d740555b1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 18:39:24.3047
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HXcEmtEXoW9yHezzhYBGkYUmR5mypcSNGcG5LuU3gr4aSZXU40J+PzWhv6jW6Wyn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3420
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0wOS0yMyAyMDozNCwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToNCj4gcG9uLiwg
MjMgd3J6IDIwMTkgbyAyMDozMCBQZXRlciBSb3NpbiA8cGVkYUBheGVudGlhLnNlPiBuYXBpc2HF
gihhKToNCj4+DQo+PiB3aGljaCBpcyBubyBsb25nZXIgYWxsb3dlZC4gVGhhdCBtaWdodCBiZSBh
IHByb2JsZW0/IFRoZSBwcmV2aW91cyBiaW5kaW5nDQo+PiBhbHNvIGFsbG93cyBsZXNzIGUuZy4N
Cj4+DQo+PiAgICAgICAgIGNvbXBhdGlibGUgPSAiYXRtZWwsMjRjMDAiLCAicmVuZXNhcywyNG1h
YzQwMiI7DQo+Pg0KPiANCj4gUmlnaHQsIGJ1dCBJJ20gbm90IHJlYWxseSBzdXJlIGhvdyB0byBl
eHByZXNzIGZhbGxiYWNrcyBpbiB5YW1sLiBBbnkgaGludD8NCg0KQWJzb2x1dGVseSBubyBpZGVh
IHdoYXQtc28tZXZlci4gU29ycnkuLi4NCg0KQ2hlZXJzLA0KUGV0ZXINCg==

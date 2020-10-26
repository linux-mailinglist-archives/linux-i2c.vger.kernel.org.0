Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F09F5298563
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Oct 2020 02:42:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1420261AbgJZBmD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 25 Oct 2020 21:42:03 -0400
Received: from mail-eopbgr70048.outbound.protection.outlook.com ([40.107.7.48]:1600
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1416385AbgJZBmC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 25 Oct 2020 21:42:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bvuX0ESrn5MzHavH1Hfvja65oQpIB7+itfRbCylHwEj+dLgxn47P7DfKbwo2Y/j24q95/myoeCnj8eInzZAyOTFzZ/clCKRBY+Us4rCN669xkmCLZJqKtWRX2rTMs5Ai6df6gqSEucpUIIUEriSzYmCM+mqN0BDC0nF56lz1U94J9EV8Ja0jHCfd9HfT/n4X/gFMoLuvID6UGGbp3lu5nbytB+zS7zqyBlyZ3bBg7fOTusdp7rKNNT/szPiYiycYXbqIq4xBETntko4AUuAwcUYTrqruZ1dhivcpFyJy+mDTajsVVx8Qjk2zLmjanQ1eP7QjOe5KRXtD2MxhRYE0QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zbOscufUZ+6rpY565yjd0AS214kU3AQQ3lGK8/nJkh8=;
 b=U1xQPTXvUTy1sRnXCNkBLArSRB/ByOVkKsk8dg9xgXcuUpz5lShj+YhqaaBGyIn3fhnAQ0oeffelevWEuFXU4JMUVMG/0zP1krmd0ZComCYqGCMKg0r5bxdlwhTV8UKWItkgB6k9wx3zgMbSqBdj03H39xAA2XSoK/j49DdRos1sMo31F2Vz73bwCa/8x9k8A3CVRTubETrn80yZ5cv/ghkTLdwXKsYrXrBaFYZf5j1t6+vHW6afPPrWkDiGEr1SqJkloLmVK3Su6Ns413LzdmLQ/ADoATvgvnalJM7wqLerAL3bMbiRPGuKqz7+0+2ZIoqeUvUuuG6tZyhZjmCtdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zbOscufUZ+6rpY565yjd0AS214kU3AQQ3lGK8/nJkh8=;
 b=kuCx7LwG7ZUwB0Bm50UOy6I1gkS37QPiuBHAMQzXzjCHEWlPYMevZllmzOn6cMy5EmWU7wX0kJLTPgHiLUq8/VO4USU37FQhjETTbKCSC2Vnk2U1sYotZOjMkQZGLsTGyBgeTgpGsnc9vJIS1LoJVNBHUuNGa4z74Lbp0yYzKQE=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB7563.eurprd04.prod.outlook.com (2603:10a6:10:206::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Mon, 26 Oct
 2020 01:41:58 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::ec42:b6d0:7666:19ef]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::ec42:b6d0:7666:19ef%8]) with mapi id 15.20.3477.028; Mon, 26 Oct 2020
 01:41:58 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
CC:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
        Angelo Dureghello <angelo.dureghello@timesys.com>
Subject: RE: [PATCH 2/2] i2c: imx: remove id_table entry
Thread-Topic: [PATCH 2/2] i2c: imx: remove id_table entry
Thread-Index: AQHWqRXTUwraF8FYdUmzA5S0YIqKi6mlUDQAgAEQSXCAAMRKgIAB+ctA
Date:   Mon, 26 Oct 2020 01:41:58 +0000
Message-ID: <DB6PR0402MB2760BF65AB6C7E6DCFEF766C88190@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <1603441103-17735-1-git-send-email-peng.fan@nxp.com>
 <1603441103-17735-2-git-send-email-peng.fan@nxp.com>
 <20201023152842.GA5227@kozik-lap>
 <DB6PR0402MB2760D2A54C69E7AAAB366C78881B0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <20201024192547.GA4638@kozik-lap>
In-Reply-To: <20201024192547.GA4638@kozik-lap>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 979f3cc8-cf71-4245-6af4-08d8795053fe
x-ms-traffictypediagnostic: DBBPR04MB7563:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DBBPR04MB75639367EE476DE4B1B5B5F588190@DBBPR04MB7563.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4rzw5NLhgEcNbCCMedPBEaqTewOdI4OF2BDMCWcNqOYw36c3sd7Vu9H93o2tWtrq6NY6AATa/57lO0zj7RNhz0cF6E0hcxoDSShnBvEwRRuFstSdRNhGfTXjh5MXMkWxqWVSdRXH88JYcX3Lv0gHfi6nnSabxCAgRyaL4sEuPX8sKGAcwIQX/pTMDpmPTegTt5iVa03M4qLmoAouQkLdd6aJ5dt6new2ezRXu0okb0WFj53lC0uNTjZelYVIvpPGFXhe3xetVb3y9I2mOS2JC9qVIKE181KZ+O93xvdkFADXo15GDpfU9R/lHwJzDdDkdKLjUNb7/uQWzWrRXC3czA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(396003)(136003)(39860400002)(66946007)(71200400001)(8936002)(66446008)(478600001)(52536014)(76116006)(7696005)(4744005)(66556008)(66476007)(64756008)(5660300002)(186003)(44832011)(316002)(2906002)(55016002)(4326008)(54906003)(33656002)(9686003)(6506007)(6916009)(7416002)(8676002)(86362001)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 3bCOwP/HIUmWHSMYYTszEgc/8QMGuXUErCyxF5Hfais3WPywMlTWPt3T5IiNPJNo2A3+Brd0mVhvwullcRDkkzOMn6JQ1xoQEeBFg9aQWdv7smFAXUq9EBEQNfWnxGjN76i5dsmgDfnbWh9QmF59ClKHym59ioICos2EYTsmh+7XtH6t7QIfg3oDEjQWa7H7dhd+8nXrEfnMRt1JnykSAvPQffeXUU/3EyUC0Pk6JH39tEEszHcq2hd2SA+XhGP3NB6ifvacdY+YiN4uslPo7DlFO/ASYMiis47tqtOLV7+AN3+dPrEqCSQoKXgD2+FW1RN57O6Q+8tjRNYs8ZJq/iPLsxK10KCjpmCmfeCV9BwsYbqKx7PmZpJjOBldsbIwzwpN2w4yrLfWaS/pTMIgrnBeJdOGuHWFVkCy4C7ELrC9uXW7+4/8rg+RBju4DtyBEpikHLOqvggFPNBl44pIeAV1Fi90hmlBK5yBDeNznzblD3mLZfJwkwuTTB9AQuQdMYwFUQ1aSXJxeCx6WCA0KSV/uy1pMoHxuiTC7S536R8cG5JSMg5922wn5GvQkbCce9looMzRl5/mtfUF0rxQQzAL39r9YtEHruJQu/8HXfX4Lsi/QzYOrjDFF609RtyK5l74ngpmK6kHn+YvSJBZ6g==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 979f3cc8-cf71-4245-6af4-08d8795053fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2020 01:41:58.5922
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K2WQS9zRWI9eiHFJ6zkqE69rHmty4oa5VJ6xXW3WTPhvVOu2FXJwhj4wndWKdpi83rrEFyhIr4EwI3pwIvgxjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7563
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBTdWJqZWN0OiBSZTogW1BBVENIIDIvMl0gaTJjOiBpbXg6IHJlbW92ZSBpZF90YWJsZSBlbnRy
eQ0KPiANCj4gT24gU2F0LCBPY3QgMjQsIDIwMjAgYXQgMDc6NDc6MTNBTSArMDAwMCwgUGVuZyBG
YW4gd3JvdGU6DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIDIvMl0gaTJjOiBpbXg6IHJlbW92
ZSBpZF90YWJsZSBlbnRyeQ0KPiA+ID4NCj4gPiA+IE9uIEZyaSwgT2N0IDIzLCAyMDIwIGF0IDA0
OjE4OjIzUE0gKzA4MDAsIHBlbmcuZmFuQG54cC5jb20gd3JvdGU6DQo+ID4gPiA+IEZyb206IFBl
bmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPg0KPiA+ID4gPg0KPiA+ID4gPiBUaGUgbGVnYWN5IHBs
YXRmb3JtIGRldmljZSBjb2RlIGhhcyBiZWVuIHJlbW92ZWQgdW5kZXINCj4gPiA+ID4gYXJjaC9h
cm0vbWFjaC1pbXgsIHNvIHdlIG5vIG5lZWQgaWRfdGFibGUgZW50cnkgaGVyZS4NCj4gPiA+DQo+
ID4gPiBDYzogR3JlZywgR2VlcnQsIEFuZ2VsbywNCj4gPiA+DQo+ID4gPiBBcmVuJ3QgeW91IGJy
ZWFraW5nIENvbGRmaXJlIHBsYXRmb3Jtcz8NCj4gPg0KPiA+IE9rLCBJIHNlZSBjb2xkZmlyZSBz
dGlsbCB1c2UgdXNlIGlteDEtaTJjLiBDb3VsZCB3ZSByZW1vdmUgaW14MjEtaTJjDQo+ID4gb3Ig
c3RpbGwga2VlcCBpdD8NCj4gDQo+IERpZCB5b3UgY2hlY2sgaWYgYW55dGhpbmcgZWxzZSB1c2Vz
IGl0Pw0KDQpOb3QgZmluZCBhbnlvbmUgdXNlIGlteDIxLWkyYyB1bmRlciBhcmNoLyogZXhjZXB0
IGFyY2gvYXJtL2Jvb3QvKmR0c2kNCg0KVGhhbmtzLA0KUGVuZy4NCg0KPiANCj4gQmVzdCByZWdh
cmRzLA0KPiBLcnp5c3p0b2YNCg==

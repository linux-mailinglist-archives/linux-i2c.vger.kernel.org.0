Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DEF0F1D1
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2019 10:10:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbfD3IK0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Apr 2019 04:10:26 -0400
Received: from mail-eopbgr70050.outbound.protection.outlook.com ([40.107.7.50]:44438
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725790AbfD3IKZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 30 Apr 2019 04:10:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQJcd1V092CHp5ZYUf0tzBNQVT8V4YjiRfdDANKslUY=;
 b=Gw4OwmuDgkqtYmRAFeQCEGCPoDkdH5gc6lC6ZM/0+FBioI7lgELe3iOzqgy/c26QtcF73Hfl9msLGFMsmCk7liwLieTWvp4cIZ5H6viotjfdZ8GqJuEVkWaVDqES0aL6Xm3Q1Q81OdJrjMOHpdth04mFqZ3ODEC3z3V6wsKUXHE=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.92.158) by
 AM0PR04MB6354.eurprd04.prod.outlook.com (10.255.182.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Tue, 30 Apr 2019 08:10:21 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::8cda:4e52:8e87:8f0e]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::8cda:4e52:8e87:8f0e%2]) with mapi id 15.20.1835.018; Tue, 30 Apr 2019
 08:10:21 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Anson Huang <anson.huang@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH] i2c: imx-lpi2c: Use __maybe_unused instead of #if
 CONFIG_PM_SLEEP
Thread-Topic: [PATCH] i2c: imx-lpi2c: Use __maybe_unused instead of #if
 CONFIG_PM_SLEEP
Thread-Index: AQHU/yJVTGic+X2v4ESo316NmJN4TKZUWBXw
Date:   Tue, 30 Apr 2019 08:10:21 +0000
Message-ID: <AM0PR04MB42114EDECD01526E128A323E803A0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1556607314-32401-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1556607314-32401-1-git-send-email-Anson.Huang@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2cc87847-e464-47dd-8801-08d6cd434a48
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB6354;
x-ms-traffictypediagnostic: AM0PR04MB6354:
x-microsoft-antispam-prvs: <AM0PR04MB6354723F0293EF858A80BC63803A0@AM0PR04MB6354.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(396003)(376002)(39860400002)(366004)(136003)(199004)(189003)(52536014)(64756008)(2201001)(6436002)(99286004)(8676002)(71190400001)(7696005)(86362001)(486006)(229853002)(44832011)(71200400001)(8936002)(2906002)(26005)(9686003)(186003)(7736002)(68736007)(5660300002)(25786009)(74316002)(305945005)(66066001)(110136005)(66556008)(53546011)(256004)(55016002)(73956011)(6246003)(316002)(478600001)(66476007)(53936002)(102836004)(76176011)(4744005)(3846002)(4326008)(97736004)(6116002)(33656002)(2501003)(6506007)(11346002)(81166006)(14454004)(446003)(476003)(81156014)(66446008)(76116006)(66946007);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB6354;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: W0aCUfl0nWOamvaZJW8tWNNbLYPfyq54qqmBYgDQDt4hS/ursHVrQd4fMI2M9vEpBdtME6BOcZduD5oWiZvyeW+aj/JzKn3c6iOw6n2oC5WDCPGgJmO+AY7nhJrS3YYHEPSM0xIm3/8005x+wQ1EqmPockqETHEl04xbGSnEYT8CBND+xNJtuFzk+bCxEQMO2BXzdTmSuymqKmoK+cCwEk13kkEB1LvCoy29iUEKlVzJw9iwwtBglG0sVV83tD7aR0PIbFuxcCmfQ26yTesdNGYFpyOSl8D3nh9xnL4J/IOp9X39ypa6gJfhhfupLUmJcMiUFmW5KmJl4lYSs2GLM8nzoD0avC/czIxfMVP5s0122wQGmer4yioiX15tjmLHw3G163Jet+HXAm3hda7IfuFET7pONTppVzq2k8zROUk=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cc87847-e464-47dd-8801-08d6cd434a48
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 08:10:21.1283
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6354
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBGcm9tOiBBbnNvbiBIdWFuZw0KPiBTZW50OiBUdWVzZGF5LCBBcHJpbCAzMCwgMjAxOSAzOjAw
IFBNDQo+IFN1YmplY3Q6IFtQQVRDSF0gaTJjOiBpbXgtbHBpMmM6IFVzZSBfX21heWJlX3VudXNl
ZCBpbnN0ZWFkIG9mICNpZg0KPiBDT05GSUdfUE1fU0xFRVANCj4gDQo+IFVzZSBfX21heWJlX3Vu
dXNlZCBmb3IgcG93ZXIgbWFuYWdlbWVudCByZWxhdGVkIGZ1bmN0aW9ucyBpbnN0ZWFkIG9mICNp
Zg0KPiBDT05GSUdfUE1fU0xFRVAgdG8gc2ltcGx5IHRoZSBjb2RlLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogQW5zb24gSHVhbmcgPEFuc29uLkh1YW5nQG54cC5jb20+DQoNCkFja2VkLWJ5OiBEb25n
IEFpc2hlbmcgPGFpc2hlbmcuZG9uZ0BueHAuY29tPg0KDQpSZWdhcmRzDQpEb25nIEFpc2hlbmcN
Cg0K

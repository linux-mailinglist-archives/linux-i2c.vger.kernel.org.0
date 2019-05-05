Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93F4813E2A
	for <lists+linux-i2c@lfdr.de>; Sun,  5 May 2019 09:31:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725792AbfEEHb1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 May 2019 03:31:27 -0400
Received: from mail-eopbgr10062.outbound.protection.outlook.com ([40.107.1.62]:23182
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726299AbfEEHb0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 5 May 2019 03:31:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MfLf56mpcxAI8moVFjmOnI2IMinlkiMF81F+gLwt5Uk=;
 b=Bl2Y0fvzwGfRij1UYyops/kBVQ7QF+t1ORXzTNi0I1eF0jRVxFeBxQa9Xjg1TiqzS/UnddtjFFZHRPSSyujXXiLEvy0dsQ1/VjnrYZz2dtWIvhjS386FispbQ0jExGDIu0VaL1nl/DlSJQWX3bM9GGe5Qg1nVW2QOlq8paT4f0w=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.92.158) by
 AM0PR04MB6531.eurprd04.prod.outlook.com (20.179.254.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Sun, 5 May 2019 07:31:21 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c415:3cab:a042:2e13]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c415:3cab:a042:2e13%6]) with mapi id 15.20.1856.012; Sun, 5 May 2019
 07:31:21 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Anson Huang <anson.huang@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
        "eha@deif.com" <eha@deif.com>,
        "linux@rempel-privat.de" <linux@rempel-privat.de>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>,
        "peda@axentia.se" <peda@axentia.se>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH] i2c: imx: Use __maybe_unused instead of #if CONFIG_PM
Thread-Topic: [PATCH] i2c: imx: Use __maybe_unused instead of #if CONFIG_PM
Thread-Index: AQHVAvMW5SvMlMIW0UqHU1fqWG2/GKZcIvPw
Date:   Sun, 5 May 2019 07:31:21 +0000
Message-ID: <AM0PR04MB4211C748DF192A56F3FE8E8280370@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1557026820-29428-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1557026820-29428-1-git-send-email-Anson.Huang@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e95af9b3-8f04-4353-a4f6-08d6d12babb6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB6531;
x-ms-traffictypediagnostic: AM0PR04MB6531:
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-microsoft-antispam-prvs: <AM0PR04MB653166279D949C0E5F686D4080370@AM0PR04MB6531.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-forefront-prvs: 00286C0CA6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(366004)(346002)(376002)(39860400002)(136003)(199004)(189003)(73956011)(66476007)(66556008)(64756008)(66446008)(7416002)(68736007)(8936002)(486006)(446003)(102836004)(52536014)(44832011)(7696005)(6506007)(26005)(110136005)(76176011)(11346002)(476003)(186003)(53546011)(74316002)(4744005)(99286004)(33656002)(256004)(25786009)(6436002)(71200400001)(2501003)(55016002)(71190400001)(66946007)(7736002)(2906002)(6246003)(53936002)(5660300002)(66066001)(3846002)(6116002)(316002)(8676002)(2201001)(86362001)(76116006)(81166006)(81156014)(305945005)(14454004)(478600001)(9686003)(4326008)(229853002)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB6531;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 49tJXGwS5bJgSWkiS0Tilug1NKBAxjWIdeeBhti8tdYynXFyTE5F+f0DBHamuviEvNeDGKc7o2tC+NK/wROCzmiEhIgrMnRucms8cggDARuMYkCUBq1QoR6Bem2RhhUJ+z+mqKz8l0CSq3wqdL8RMpByYCwVCSbiQzdJzdlJuK8rsMr7SD0qZsmz2EVTz61Evb+iXRHvorlKJ5BSn+TNR0CTS+nqJY7TLkovQvahLZX0IudI9qunmFrpSMzvH5uwocXuU1Nd4HwZ5tiTtZ7Y0z7n95AuKnT4IUQGBRpPe4hkBcoidVHPDTOOpFwVKc0aeS66S9zt1ruxT6y+NSzkNoDwxjzI9Woq8J2A6EV8PxhmPbCkhEFX7l3BI1+Q2u6L5QizoNd75hCKa7eqIwYKG2+ZDHFNCuGqK6Dxq/uNI0o=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e95af9b3-8f04-4353-a4f6-08d6d12babb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2019 07:31:21.3067
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6531
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBGcm9tOiBBbnNvbiBIdWFuZw0KPiBTZW50OiBTdW5kYXksIE1heSA1LCAyMDE5IDExOjMyIEFN
DQo+IFN1YmplY3Q6IFtQQVRDSF0gaTJjOiBpbXg6IFVzZSBfX21heWJlX3VudXNlZCBpbnN0ZWFk
IG9mICNpZiBDT05GSUdfUE0NCj4gDQo+IFVzZSBfX21heWJlX3VudXNlZCBmb3IgcnVudGltZSBQ
TSByZWxhdGVkIGZ1bmN0aW9ucyBpbnN0ZWFkIG9mICNpZg0KPiBDT05GSUdfUE0gdG8gc2ltcGx5
IHRoZSBjb2RlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5zb24gSHVhbmcgPEFuc29uLkh1YW5n
QG54cC5jb20+DQoNClJldmlld2VkLWJ5OiBEb25nIEFpc2hlbmcgPGFpc2hlbmcuZG9uZ0BueHAu
Y29tPg0KDQpSZWdhcmRzDQpEb25nIEFpc2hlbmcNCg==

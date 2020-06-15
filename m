Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A29BC1F8DE7
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jun 2020 08:33:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728280AbgFOGdo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Jun 2020 02:33:44 -0400
Received: from mail-eopbgr60073.outbound.protection.outlook.com ([40.107.6.73]:60483
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728276AbgFOGdo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 15 Jun 2020 02:33:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HtZbfevxDS5Zs9arBmfSlRlIk3ZE3Nfmk64+zue172B0rzrHrOIywMniFz1VECHn3LUVpvef2nysJWY89FRzrpww4pYmBOgy7OzXk/2r9JmZtrejw/BM8fcWpPlW+i5bj754SsGbpuKxsU9hwV+j9UM6SmZnMvpHSR/n/2kcEko16Ex67Al5vHG4bh/xjyimu2nd9yZ6g5gkBuSMq7t4mhC/n+kmS+vc/UtGfqPLnEJ9tx64uijUA/3VVvIQSfSsxpRM399KaaQAuaRrijQ3IirfR+0kfjDgTB0eiq/pdvMY7bEC8ACVWrBRUSzKzNTB0bC8Ne32Bg1wcDnDSE/Mxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXfroRNA573vzufwOFVP7OPR7NqOBERM2VqA4kkvUjQ=;
 b=TIwk2tcQmwXIbgGNLNRkUh0I8MuI0vx+Kv3Z9kA8LbaljP1N9F+BwADFesxdatwhH6nLGVOxh9+2lQL2rCVM9i8FnvbwYtjmvefkI61aZbwbMZrfT0MKSC/WGWWJaDJ+rqCLfjE8tmJI1BnV0DYbweyTJeERsfWk0N+RmFbeeaPTY0PptMOmRzemQ5ZykQEFHWPj8NMTnqO2qDVonwQ05qCqOVLBUZwgwZ3Y55mYNjJ90wUG2/qYjYUZQkPvIkwmdIWHrWZAvT1Q1OZ0b7HGV51KgLBDsMhPV+JLNT76qlcnfrRi87249XdWM5M3UAIUyMJnh4HeGzzj61BXtFpJ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXfroRNA573vzufwOFVP7OPR7NqOBERM2VqA4kkvUjQ=;
 b=M+NYOW+AX+MEJxxcMUqQy+yRIq7/Z9Yag4P8nGzyHzUsuBRDGgrxUgBJAHwaFCR6W4O/W4ZpcwO1EpSuMOb2K9329iE87VL4yC7Ncn+KhnCwQcy7U415+eEDQTRaSNqmU4YSVEHPM2FMrZCdUB4lQAKMse2ecniDykfMWK/6sYE=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB5816.eurprd04.prod.outlook.com (2603:10a6:20b:ac::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19; Mon, 15 Jun
 2020 06:33:40 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3c6c:a0e9:9a4e:c51d]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3c6c:a0e9:9a4e:c51d%7]) with mapi id 15.20.3088.028; Mon, 15 Jun 2020
 06:33:40 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
CC:     "kjlu@umn.edu" <kjlu@umn.edu>,
        Markus Elfring <Markus.Elfring@web.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Andy Duan <fugang.duan@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] [v3] i2c: imx-lpi2c: Fix runtime PM imbalance on error
Thread-Topic: [PATCH] [v3] i2c: imx-lpi2c: Fix runtime PM imbalance on error
Thread-Index: AQHWN9w+Q0hrdD3Y0kW70eX0BSxaHKjX6AOAgAFl52A=
Date:   Mon, 15 Jun 2020 06:33:40 +0000
Message-ID: <AM6PR04MB4966A1FD80A29BA1E63247C0809C0@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20200601061640.27632-1-dinghao.liu@zju.edu.cn>
 <20200614091203.GC2878@kunai>
In-Reply-To: <20200614091203.GC2878@kunai>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1f7f00cf-9453-43cf-5bf7-08d810f60aef
x-ms-traffictypediagnostic: AM6PR04MB5816:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB5816859867C9BE2F31C92489809C0@AM6PR04MB5816.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 04359FAD81
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ynGJi13+7+qoVaQ1BuPL5pU416dIPos5KKrPoy7VoCY6qsk0LE6GpvvrwSE95jLWDCIiVwmhA5p21uS7qANG8N4pgDuSj60h7k5WLTkcTHmBgkfw2AazRpmgz/Ms3Dif7kccwklqU7YnbcqxxMa9qRHwoVX0lUiTaE0+loyOpXmPBtPG0z4sfUEHlRugfoJk1ZFBjAjYRqcQcArrGc0LYdxVPC+KRWhDomsoG546jBNhAez/ATQeUBROvmuCfNqvrVnJ87ULM6RqNukLs2+zqPwe+5ZbE1tjNRUSs3fhEzwZuJzeyV2/6as8HjazLQXZP7h7NsKWr/UO7cesoAGbAQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(186003)(478600001)(7416002)(26005)(52536014)(7696005)(4326008)(2906002)(6506007)(5660300002)(55016002)(86362001)(54906003)(4744005)(9686003)(316002)(66946007)(33656002)(66556008)(66476007)(64756008)(66446008)(44832011)(8936002)(110136005)(8676002)(71200400001)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: xOQbWgDDdfHgdukctlkQpW+16OTaJVaLufKzI/JXzccbhMp/cNQLkLEIK4YOq7IO4+Q+/LaOgc1JnlmvuA8cQb9Ye+51LwJc3luVpJhhPgQrR6GsIFsag+1jOPabvj5zys76Bgu9IrE2xTRKsKxfhCZDEd+EwFMAKFFpI28aIWY8yvXJlm+hcQ2y1ZKkv3cdvGKG62JpvYQebN1asjUhNQ+eSvOSnfiSab/ZRn999XFppSO3LM8YMsZkvommjZSofIXC3/QApuMlWg4sVdtiT2SuxbihiKrb1buM8Sfh6W851HzxzNoKBscsg5A6amvkNiDD6/m2NeiGoqbuhuwzQcwKaHSqHc1duwk5PMTbu6OgaS5xGwaIJYMXoB0q0sm7dsFhW2SGTsHLznwijl4/CuGh9/oWTvFMZ2ydMr68XE9nk6qRgHwrjpxWG4SQUkJJ/jwptHDwWGUun6dBghmUclh5YV7+62eHaJnTsy1tiwg=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f7f00cf-9453-43cf-5bf7-08d810f60aef
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2020 06:33:40.3743
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qTbP9cAGOAw091QLY9zkFceLr40n2FaHrFQTrMImZmyHG60N9X5z0FNoZ7WXnyBYSbSCRgKKM4Oqu6qwUgsUgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5816
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBGcm9tOiBXb2xmcmFtIFNhbmcgPHdzYUBrZXJuZWwub3JnPg0KPiBTZW50OiBTdW5kYXksIEp1
bmUgMTQsIDIwMjAgNToxMiBQTQ0KPiANCj4gT24gTW9uLCBKdW4gMDEsIDIwMjAgYXQgMDI6MTY6
NDBQTSArMDgwMCwgRGluZ2hhbyBMaXUgd3JvdGU6DQo+ID4gcG1fcnVudGltZV9nZXRfc3luYygp
IGluY3JlbWVudHMgdGhlIHJ1bnRpbWUgUE0gdXNhZ2UgY291bnRlciBldmVuIHRoZQ0KPiA+IGNh
bGwgcmV0dXJucyBhbiBlcnJvciBjb2RlLiBUaHVzIGEgY29ycmVzcG9uZGluZyBkZWNyZW1lbnQg
aXMgbmVlZGVkDQo+ID4gb24gdGhlIGVycm9yIGhhbmRsaW5nIHBhdGggdG8ga2VlcCB0aGUgY291
bnRlciBiYWxhbmNlZC4NCj4gDQo+IENhbiB5b3UgcG9pbnQgbWUgdG8gYSBkaXNjdXNzaW9uIHdo
ZXJlIGl0IHdhcyBkZWNpZGVkIHRoYXQgdGhpcyBpcyBhIHByb3BlciBmaXg/DQo+IEknZCB0aGlu
ayB3ZSByYXRoZXIgc2hvdWxkIGZpeCBwbV9ydW50aW1lX2dldF9zeW5jKCkgYnV0IG1heWJlIHRo
ZXJlIGFyZQ0KPiB0ZWNobmljYWwgcmVhc29ucyBhZ2FpbnN0IGl0Lg0KDQpJIGhhZCB0aGUgc2Ft
ZSBmZWVsaW5nLg0KQ29weSBwbSBndXlzIHRvIGNvbW1lbnRzLg0KDQpSZWdhcmRzDQpBaXNoZW5n
DQo=

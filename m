Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 051D9341490
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Mar 2021 06:12:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233009AbhCSFMQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Mar 2021 01:12:16 -0400
Received: from mail-eopbgr20084.outbound.protection.outlook.com ([40.107.2.84]:14590
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233822AbhCSFLs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 19 Mar 2021 01:11:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SlQdgUtyPJidf6oguuDZhkZfcSSUeioYtXvjJrFjfuLNr/rb2TWvj496Rpf8FWWSO8VCKQtOXpo+WCtX5qzw8hD00/MKZkM4tR+BneJsjwhWw/4mFNNRtM/EoQiOWUCh/FCjO5YzXhwyPbZgirQmi/B1IpvYrAie2atXIAzO0LICF3d2NQcoN2SE4GrFORMG91hfpS3Uyd1Fc8OUZqz676qCyvIPBGygQLfIG01/yqMTbnqqwqcnvbQMyJgLphPD10n4OUw59sceQFojECi+SxQvNX/8CpI6Y2r2fthl92vvFUzGsQpEV1W67k3PHVD+glRAB7Qz3kAQGLt2NMo98w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fezm3eT4o4WsavgRd47ykBVuGvrQ430gg9A16uX0dxE=;
 b=U0NykaCo2e0TLBJ9n7xeCoQaVciw84nTk2IF1NVir+p2DcqQYiWT0U0tXdGqn1oZRTUx4+2ptmXkxJkpoz1G5VHonPPbyuoSDA8LutyAR5yNtEYbEheehA/VuUOoc1qFe2T632jePaapujFn30sONtF1M3IWRMWCIfvqwTavox6zdKszSvz73U3gIxUnNq8KnzFlcGZo+pyhk/FvRsEzAhXlUVqR2Gpu6TjqN1Hpq+bkEVz/NeRnBsmc3g7RtzpiXqPtMxaU4Ds2eXQGSPfNWFt2BqTnSfaTG6a+31ccTxqQb+L6q2NW8N013Mu7edSM1fcP1h2QK15mrX2oMsRlQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fezm3eT4o4WsavgRd47ykBVuGvrQ430gg9A16uX0dxE=;
 b=mA6nslk0wuNFcTTO2Z9/wac+kc1EKGgMzmnwDD5G6HZIt1wku8yq+gY3joQRIzb+DyTYgkpyjxNQrWFVtQQQNxAp0q4psV+e9Xq28aAhHT9qNKnoB7/wNatMEVa31BTDoOY/xQOlPaS89le7DOtQnS7nV2cnCVfDPW21ovQAa6U=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB6648.eurprd04.prod.outlook.com (2603:10a6:20b:f9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 05:11:45 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::ecad:ebb8:8eb0:d359]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::ecad:ebb8:8eb0:d359%7]) with mapi id 15.20.3955.023; Fri, 19 Mar 2021
 05:11:45 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Clark Wang <xiaoning.wang@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
CC:     "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 08/11] i2c: imx-lpi2c: add bus recovery feature
Thread-Topic: [PATCH 08/11] i2c: imx-lpi2c: add bus recovery feature
Thread-Index: AQHXGvpZIWTdsAPvyUqcSyKJTGyhVKqKxpyA
Date:   Fri, 19 Mar 2021 05:11:44 +0000
Message-ID: <AM6PR04MB4966BE0111D94F937330647F80689@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20210317065359.3109394-1-xiaoning.wang@nxp.com>
 <20210317065359.3109394-9-xiaoning.wang@nxp.com>
In-Reply-To: <20210317065359.3109394-9-xiaoning.wang@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b90d8fc6-e0e1-4202-e391-08d8ea957d8d
x-ms-traffictypediagnostic: AM6PR04MB6648:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB664826FDAC53BB8D74B6743380689@AM6PR04MB6648.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HNUz3Vi1Tb107AHqMIyCC9UpP3uu3OS/RAhp2OvAMH25x5NhX9QV0HMdh+vvlzSxgwQTVKQKfRNPW9B+fVZOLkbQHJP5HZniipcUad/6s1XgvkTm9XVgsCs3AXwsUeSs7CNQ/qlgD8no4J70dc5+gNrPem3jfmIBWg8avltggifZ/z/Wn59GQyZssGXGfA/9m1SnFE1ohELQZ+EQG5kw6ubJjmiXIopylP/W/2jUpFirTsbWMxIrhOeMSEu1M6PL0pW3IVvpcNHtQTuwLtCt3jX2sY/XT8W+WKtH53aHcxK28qyb99Wpk2nAHSfDngs2xhl6OFMPZg0zZrfB6lh1vYe1LaqFs+ntHfG3oIFmkKg3/2InAPVlVISGYkS0cBmABJRy879bXoTv8dQcgXH9NzbsJQUMjfgoY7f6ucE2kji9eHjZ+Dh/cq8ZymN9MTCA3y7dnx/xzejhHGil0EAci2oa2EyNmDa/ejCb4+SNz295/b/MGN1a07KtpcSd+u1MFmTXJ1S3VgQL79BcMRqx2UugBrzwMKQyBCYXh1BOU7Z5HBGfYezO3fIqGvyBOUMxHHfvg9RpYkn8DRJ61jHQaSDCfwZDuZPuSDYx3Wc7sNDfPoraeuoRYWdIHrQOysola/uAj9yPiBXT090ueL1F3+HUhXI5l13NApOBPUlSTXQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(8676002)(6506007)(8936002)(478600001)(52536014)(33656002)(83380400001)(110136005)(54906003)(38100700001)(26005)(186003)(4326008)(86362001)(7696005)(66476007)(44832011)(316002)(66946007)(66556008)(55016002)(9686003)(5660300002)(66446008)(64756008)(76116006)(71200400001)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?VFFKbHNmL3RxK2lXRythajdTTlFFOWN3Z1N6M3E4VEU3Y2dWcmRrMU9zS1la?=
 =?utf-8?B?bUhDSHR6K0dyYVRQZjRDQ2ZMNWlDd3cxOGozeHRrbTFFN2t1d05aL1MwTTBK?=
 =?utf-8?B?NzNES1d6SmwwbXZuQ0NILysyS1dTdE92cmh5MHFkTCt2Z05LQWYraVRDRDBP?=
 =?utf-8?B?b1VoZTN4d2ZZK2k3L3UxVGhySHRlOWl4WGg5VVBhOHNtVDhmeklOVE1WR3or?=
 =?utf-8?B?Z1ZqdkNFSXdxU05zT2o4ZTMySUFJZDQ3SVhKWEIweGsvZXpNd0Rkenp0cEV1?=
 =?utf-8?B?cXpLUnRuaEQ1RnBpSC92bzdNZ2tEM1Q0UVVVQTlxRmRnUk5XVlk1NTJTK24r?=
 =?utf-8?B?RVZLd0V1c1Q5L2Z0RkNTNU1uMVJKT1psNzdDZEdRTXFDN2dsSGJ3QTRQNkh6?=
 =?utf-8?B?ZEUvUyttbktJOUZmaTlQTkdnOEdZTW1sNjJwVkZJK2g2anhEUXdLM2E0V0cw?=
 =?utf-8?B?SnhVOVI2RXRmaGd2cjQ0OUJHd3o1WXhHendBWmVxZmpEdWNKS2xXS3o4SVQx?=
 =?utf-8?B?UTRXcHVpcXB4NzV1akN3cnkvMitnSThPbnN6ME41eUNCdjlHai9wV1g0M3pi?=
 =?utf-8?B?cThzR09BMzE3czdQVFgvT0ZVVC9jMVZZM3lmcFNDZ3dOeURXUE5ZZk9Cc3ZX?=
 =?utf-8?B?QS9XSXVtUUora1BFTmF3N2xsVDY1SWZKbUxtcnREVmNoSDF0RXVucmZuR2dM?=
 =?utf-8?B?NWpmUFFyeUt2ZlhTM1RhWkxxTVFoZmQ4QWJ3ZVBZdXZTajlyei8ralpLdHdL?=
 =?utf-8?B?cGRSM3g0dFlESFMydXpkbEQvenNmY2N0Z2duSVUyT1JHQXhhNW56QUVvTUxN?=
 =?utf-8?B?eDFaTWZmNXhzT0ttTEtwME9vUmtkZG5ET0hhRFYwOGU2N2d2WjRNeE5vUER6?=
 =?utf-8?B?NCtyYVJ1bU1mM0EzYXltNzNXOW8zdDdkTllCOUhNNjA0STZpOGNKS0hoeWdo?=
 =?utf-8?B?NVBNeTRjSG40UVdrRXZwWXVLWW1qdnpVcE1QTUxwY2xxMGhwZ1hRT0J6THhn?=
 =?utf-8?B?bTcvTWJhOVpLRGFsY3A0MW9Gd0JHVWplZkFGNE5JbktKRWRuSzFGYVpCaVZp?=
 =?utf-8?B?a0ZzdmtrK0Q5bTFzNTZXU25pTEdZdXlwSFdzQXVvSnZkd25FZDZpOG85ZEpp?=
 =?utf-8?B?ZXVuZnlPNVBZMjZ3UWt5a1NHVy9UNmZYVlY3WDdQQ0pFQUhpZDNNekw1eFR2?=
 =?utf-8?B?Unk4a21VdzJKNGc0cHpRb3lRK2l1TnBmNXhGS3hFY3JDcG11T2E0QmtaVGha?=
 =?utf-8?B?Nll1S2ZBWG1kWWZSczA1RSt6d1lGd0pMQzVFa3Vjd1dwUXFjWW9kUk92dFFy?=
 =?utf-8?B?Vk1yNUxBK2hvMko1WWdzZVIxM1dIWWROTmJOZTZKVXN3MjVsd1V1eFVFc1p2?=
 =?utf-8?B?QW5sNGxlUTQ4dWhKeEMycHM0Z3lESFIzYzMwVWhiNjEwcmJlK1NtQTVPK1hI?=
 =?utf-8?B?RG94cTIzZmE5djBmL3U5ZlBNc0lDMVdnU3ZkdHEvODRQQ2Q0dVUvRVgvNWtF?=
 =?utf-8?B?eTJUdFFkMndOWFRPNC8xZFArUG5iSW9TUHNmMjJiQ2l2RTI0VEJWM0Z2RmJS?=
 =?utf-8?B?U3hPL0xqWnArOWw1M1d1ekFCTlZWYW5IbG1ZcWlNejdaNWRMSE5lVUJ5SVEz?=
 =?utf-8?B?V1k1dDBCdGJXQ0JzczNPTWlBQ2JFOEdVRjU1dVJCc0FiZHJGeTJScmlJT0hK?=
 =?utf-8?B?cjl1L1VPU0dVc3l0OUVqcUFlZVE1b3NDMGh4VEZCQ1hmRHJ1cFpNd1NKMXhL?=
 =?utf-8?Q?DNXqQGT7ousKzyk2NyFodxAiuA11MDTYsJajeu2?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b90d8fc6-e0e1-4202-e391-08d8ea957d8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2021 05:11:44.8710
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zXqrlTH1k6CYy/3W1JkZuCHsrcstr5gOtoCAixIHB3XsQLDPgsaKiR7cqvaoh5OvllJ4nbaFj2QlhW2jmbLfDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6648
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBGcm9tOiBDbGFyayBXYW5nIDx4aWFvbmluZy53YW5nQG54cC5jb20+DQo+IFNlbnQ6IFdlZG5l
c2RheSwgTWFyY2ggMTcsIDIwMjEgMjo1NCBQTQ0KPiANCj4gQWRkIGJ1cyByZWNvdmVyeSBmZWF0
dXJlIGZvciBMUEkyQy4NCj4gTmVlZCBhZGQgZ3BpbyBwaW5jdHJsLCBzY2wtZ3Bpb3MgYW5kIHNk
YS1ncGlvcyBjb25maWd1cmF0aW9uIGluIGR0cy4NCj4gDQoNClBscyBhbHNvIHVwZGF0ZSBkdC1i
aW5kaW5nIGZpcnN0DQoNCj4gU2lnbmVkLW9mZi1ieTogQ2xhcmsgV2FuZyA8eGlhb25pbmcud2Fu
Z0BueHAuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LWxwaTJjLmMg
fCA4MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA4
MyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2ky
Yy1pbXgtbHBpMmMuYw0KPiBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LWxwaTJjLmMNCj4g
aW5kZXggYzBjYjc3YzY2MDkwLi43MjE2YTM5MzA5NWQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
aTJjL2J1c3Nlcy9pMmMtaW14LWxwaTJjLmMNCj4gKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2ky
Yy1pbXgtbHBpMmMuYw0KPiBAQCAtMTgsNiArMTgsNyBAQA0KPiAgI2luY2x1ZGUgPGxpbnV4L21v
ZHVsZS5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L29mLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvb2Zf
ZGV2aWNlLmg+DQo+ICsjaW5jbHVkZSA8bGludXgvb2ZfZ3Bpby5oPg0KPiAgI2luY2x1ZGUgPGxp
bnV4L3BpbmN0cmwvY29uc3VtZXIuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZp
Y2UuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1lLmg+DQo+IEBAIC0xMDgsNiArMTA5
LDExIEBAIHN0cnVjdCBscGkyY19pbXhfc3RydWN0IHsNCj4gIAl1bnNpZ25lZCBpbnQJCXR4Zmlm
b3NpemU7DQo+ICAJdW5zaWduZWQgaW50CQlyeGZpZm9zaXplOw0KPiAgCWVudW0gbHBpMmNfaW14
X21vZGUJbW9kZTsNCj4gKw0KPiArCXN0cnVjdCBpMmNfYnVzX3JlY292ZXJ5X2luZm8gcmluZm87
DQo+ICsJc3RydWN0IHBpbmN0cmwgKnBpbmN0cmw7DQo+ICsJc3RydWN0IHBpbmN0cmxfc3RhdGUg
KnBpbmN0cmxfcGluc19kZWZhdWx0Ow0KPiArCXN0cnVjdCBwaW5jdHJsX3N0YXRlICpwaW5jdHJs
X3BpbnNfZ3BpbzsNCj4gIH07DQo+IA0KPiAgc3RhdGljIHZvaWQgbHBpMmNfaW14X2ludGN0cmwo
c3RydWN0IGxwaTJjX2lteF9zdHJ1Y3QgKmxwaTJjX2lteCwgQEAgLTEzNSw2DQo+ICsxNDEsOCBA
QCBzdGF0aWMgaW50IGxwaTJjX2lteF9idXNfYnVzeShzdHJ1Y3QgbHBpMmNfaW14X3N0cnVjdCAq
bHBpMmNfaW14KQ0KPiANCj4gIAkJaWYgKHRpbWVfYWZ0ZXIoamlmZmllcywgb3JpZ19qaWZmaWVz
ICsgbXNlY3NfdG9famlmZmllcyg1MDApKSkgew0KPiAgCQkJZGV2X2RiZygmbHBpMmNfaW14LT5h
ZGFwdGVyLmRldiwgImJ1cyBub3Qgd29ya1xuIik7DQo+ICsJCQlpZiAobHBpMmNfaW14LT5hZGFw
dGVyLmJ1c19yZWNvdmVyeV9pbmZvKQ0KPiArCQkJCWkyY19yZWNvdmVyX2J1cygmbHBpMmNfaW14
LT5hZGFwdGVyKTsNCj4gIAkJCXJldHVybiAtRVRJTUVET1VUOw0KPiAgCQl9DQo+ICAJCXNjaGVk
dWxlKCk7DQo+IEBAIC0xOTIsNiArMjAwLDggQEAgc3RhdGljIHZvaWQgbHBpMmNfaW14X3N0b3Ao
c3RydWN0IGxwaTJjX2lteF9zdHJ1Y3QNCj4gKmxwaTJjX2lteCkNCj4gDQo+ICAJCWlmICh0aW1l
X2FmdGVyKGppZmZpZXMsIG9yaWdfamlmZmllcyArIG1zZWNzX3RvX2ppZmZpZXMoNTAwKSkpIHsN
Cj4gIAkJCWRldl9kYmcoJmxwaTJjX2lteC0+YWRhcHRlci5kZXYsICJzdG9wIHRpbWVvdXRcbiIp
Ow0KPiArCQkJaWYgKGxwaTJjX2lteC0+YWRhcHRlci5idXNfcmVjb3ZlcnlfaW5mbykNCj4gKwkJ
CQlpMmNfcmVjb3Zlcl9idXMoJmxwaTJjX2lteC0+YWRhcHRlcik7DQo+ICAJCQlicmVhazsNCj4g
IAkJfQ0KPiAgCQlzY2hlZHVsZSgpOw0KPiBAQCAtMzI5LDYgKzMzOSw4IEBAIHN0YXRpYyBpbnQg
bHBpMmNfaW14X3R4Zmlmb19lbXB0eShzdHJ1Y3QNCj4gbHBpMmNfaW14X3N0cnVjdCAqbHBpMmNf
aW14KQ0KPiANCj4gIAkJaWYgKHRpbWVfYWZ0ZXIoamlmZmllcywgb3JpZ19qaWZmaWVzICsgbXNl
Y3NfdG9famlmZmllcyg1MDApKSkgew0KPiAgCQkJZGV2X2RiZygmbHBpMmNfaW14LT5hZGFwdGVy
LmRldiwgInR4ZmlmbyBlbXB0eSB0aW1lb3V0XG4iKTsNCj4gKwkJCWlmIChscGkyY19pbXgtPmFk
YXB0ZXIuYnVzX3JlY292ZXJ5X2luZm8pDQo+ICsJCQkJaTJjX3JlY292ZXJfYnVzKCZscGkyY19p
bXgtPmFkYXB0ZXIpOw0KPiAgCQkJcmV0dXJuIC1FVElNRURPVVQ7DQo+ICAJCX0NCj4gIAkJc2No
ZWR1bGUoKTsNCj4gQEAgLTUyOCw2ICs1NDAsNzEgQEAgc3RhdGljIGlycXJldHVybl90IGxwaTJj
X2lteF9pc3IoaW50IGlycSwgdm9pZCAqZGV2X2lkKQ0KPiAgCXJldHVybiBJUlFfSEFORExFRDsN
Cj4gIH0NCj4gDQo+ICtzdGF0aWMgdm9pZCBscGkyY19pbXhfcHJlcGFyZV9yZWNvdmVyeShzdHJ1
Y3QgaTJjX2FkYXB0ZXIgKmFkYXApIHsNCj4gKwlzdHJ1Y3QgbHBpMmNfaW14X3N0cnVjdCAqbHBp
MmNfaW14Ow0KPiArDQo+ICsJbHBpMmNfaW14ID0gY29udGFpbmVyX29mKGFkYXAsIHN0cnVjdCBs
cGkyY19pbXhfc3RydWN0LCBhZGFwdGVyKTsNCj4gKw0KPiArCXBpbmN0cmxfc2VsZWN0X3N0YXRl
KGxwaTJjX2lteC0+cGluY3RybCwNCj4gK2xwaTJjX2lteC0+cGluY3RybF9waW5zX2dwaW8pOyB9
DQo+ICsNCj4gK3N0YXRpYyB2b2lkIGxwaTJjX2lteF91bnByZXBhcmVfcmVjb3Zlcnkoc3RydWN0
IGkyY19hZGFwdGVyICphZGFwKSB7DQo+ICsJc3RydWN0IGxwaTJjX2lteF9zdHJ1Y3QgKmxwaTJj
X2lteDsNCj4gKw0KPiArCWxwaTJjX2lteCA9IGNvbnRhaW5lcl9vZihhZGFwLCBzdHJ1Y3QgbHBp
MmNfaW14X3N0cnVjdCwgYWRhcHRlcik7DQo+ICsNCj4gKwlwaW5jdHJsX3NlbGVjdF9zdGF0ZShs
cGkyY19pbXgtPnBpbmN0cmwsDQo+ICtscGkyY19pbXgtPnBpbmN0cmxfcGluc19kZWZhdWx0KTsg
fQ0KPiArDQo+ICsvKg0KPiArICogV2Ugc3dpdGNoIFNDTCBhbmQgU0RBIHRvIHRoZWlyIEdQSU8g
ZnVuY3Rpb24gYW5kIGRvIHNvbWUgYml0YmFuZ2luZw0KPiArICogZm9yIGJ1cyByZWNvdmVyeS4g
VGhlc2UgYWx0ZXJuYXRpdmUgcGlubXV4IHNldHRpbmdzIGNhbiBiZQ0KPiArICogZGVzY3JpYmVk
IGluIHRoZSBkZXZpY2UgdHJlZSBieSBhIHNlcGFyYXRlIHBpbmN0cmwgc3RhdGUgImdwaW8iLiBJ
Zg0KPiArICogdGhpcyBpcyBtaXNzaW5nIHRoaXMgaXMgbm90IGEgYmlnIHByb2JsZW0sIHRoZSBv
bmx5IGltcGxpY2F0aW9uIGlzDQo+ICsgKiB0aGF0IHdlIGNhbid0IGRvIGJ1cyByZWNvdmVyeS4N
Cj4gKyAqLw0KPiArc3RhdGljIGludCBscGkyY19pbXhfaW5pdF9yZWNvdmVyeV9pbmZvKHN0cnVj
dCBscGkyY19pbXhfc3RydWN0ICpscGkyY19pbXgsDQo+ICsJCXN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpDQo+ICt7DQo+ICsJc3RydWN0IGkyY19idXNfcmVjb3ZlcnlfaW5mbyAqcmluZm8g
PSAmbHBpMmNfaW14LT5yaW5mbzsNCj4gKw0KPiArCWxwaTJjX2lteC0+cGluY3RybCA9IGRldm1f
cGluY3RybF9nZXQoJnBkZXYtPmRldik7DQo+ICsJaWYgKCFscGkyY19pbXgtPnBpbmN0cmwgfHwg
SVNfRVJSKGxwaTJjX2lteC0+cGluY3RybCkpIHsNCj4gKwkJZGV2X2luZm8oJnBkZXYtPmRldiwg
ImNhbid0IGdldCBwaW5jdHJsLCBidXMgcmVjb3Zlcnkgbm90DQo+IHN1cHBvcnRlZFxuIik7DQo+
ICsJCXJldHVybiBQVFJfRVJSKGxwaTJjX2lteC0+cGluY3RybCk7DQo+ICsJfQ0KPiArDQo+ICsJ
bHBpMmNfaW14LT5waW5jdHJsX3BpbnNfZGVmYXVsdCA9IHBpbmN0cmxfbG9va3VwX3N0YXRlKGxw
aTJjX2lteC0+cGluY3RybCwNCj4gKwkJCVBJTkNUUkxfU1RBVEVfREVGQVVMVCk7DQo+ICsJbHBp
MmNfaW14LT5waW5jdHJsX3BpbnNfZ3BpbyA9IHBpbmN0cmxfbG9va3VwX3N0YXRlKGxwaTJjX2lt
eC0+cGluY3RybCwNCj4gKwkJCSJncGlvIik7DQo+ICsJcmluZm8tPnNkYV9ncGlvZCA9IGRldm1f
Z3Bpb2RfZ2V0KCZwZGV2LT5kZXYsICJzZGEiLCBHUElPRF9JTik7DQo+ICsJcmluZm8tPnNjbF9n
cGlvZCA9IGRldm1fZ3Bpb2RfZ2V0KCZwZGV2LT5kZXYsICJzY2wiLA0KPiArR1BJT0RfT1VUX0hJ
R0hfT1BFTl9EUkFJTik7DQo+ICsNCj4gKwlpZiAoUFRSX0VSUihyaW5mby0+c2RhX2dwaW9kKSA9
PSAtRVBST0JFX0RFRkVSIHx8DQo+ICsJICAgIFBUUl9FUlIocmluZm8tPnNjbF9ncGlvZCkgPT0g
LUVQUk9CRV9ERUZFUikgew0KPiArCQlyZXR1cm4gLUVQUk9CRV9ERUZFUjsNCj4gKwl9IGVsc2Ug
aWYgKElTX0VSUihyaW5mby0+c2RhX2dwaW9kKSB8fA0KPiArCQkgICBJU19FUlIocmluZm8tPnNj
bF9ncGlvZCkgfHwNCj4gKwkJICAgSVNfRVJSKGxwaTJjX2lteC0+cGluY3RybF9waW5zX2RlZmF1
bHQpIHx8DQo+ICsJCSAgIElTX0VSUihscGkyY19pbXgtPnBpbmN0cmxfcGluc19ncGlvKSkgew0K
PiArCQlkZXZfZGJnKCZwZGV2LT5kZXYsICJyZWNvdmVyeSBpbmZvcm1hdGlvbiBpbmNvbXBsZXRl
XG4iKTsNCj4gKwkJcmV0dXJuIDA7DQo+ICsJfQ0KPiArDQo+ICsJZGV2X2luZm8oJnBkZXYtPmRl
diwgInVzaW5nIHNjbCVzIGZvciByZWNvdmVyeVxuIiwNCj4gKwkJIHJpbmZvLT5zZGFfZ3Bpb2Qg
PyAiLHNkYSIgOiAiIik7DQo+ICsNCj4gKwlyaW5mby0+cHJlcGFyZV9yZWNvdmVyeSA9IGxwaTJj
X2lteF9wcmVwYXJlX3JlY292ZXJ5Ow0KPiArCXJpbmZvLT51bnByZXBhcmVfcmVjb3ZlcnkgPSBs
cGkyY19pbXhfdW5wcmVwYXJlX3JlY292ZXJ5Ow0KPiArCXJpbmZvLT5yZWNvdmVyX2J1cyA9IGky
Y19nZW5lcmljX3NjbF9yZWNvdmVyeTsNCj4gKwlscGkyY19pbXgtPmFkYXB0ZXIuYnVzX3JlY292
ZXJ5X2luZm8gPSByaW5mbzsNCj4gKw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiArDQo+ICBzdGF0
aWMgdTMyIGxwaTJjX2lteF9mdW5jKHN0cnVjdCBpMmNfYWRhcHRlciAqYWRhcHRlcikgIHsNCj4g
IAlyZXR1cm4gSTJDX0ZVTkNfSTJDIHwgSTJDX0ZVTkNfU01CVVNfRU1VTCB8IEBAIC02MDcsNiAr
Njg0LDEyDQo+IEBAIHN0YXRpYyBpbnQgbHBpMmNfaW14X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpDQo+IA0KPiAgCXBtX3J1bnRpbWVfcHV0KCZwZGV2LT5kZXYpOw0KPiANCj4g
KwkvKiBJbml0IG9wdGlvbmFsIGJ1cyByZWNvdmVyeSBmdW5jdGlvbiAqLw0KPiArCXJldCA9IGxw
aTJjX2lteF9pbml0X3JlY292ZXJ5X2luZm8obHBpMmNfaW14LCBwZGV2KTsNCj4gKwkvKiBHaXZl
IGl0IGFub3RoZXIgY2hhbmNlIGlmIHBpbmN0cmwgdXNlZCBpcyBub3QgcmVhZHkgeWV0ICovDQo+
ICsJaWYgKHJldCA9PSAtRVBST0JFX0RFRkVSKQ0KPiArCQlnb3RvIHJwbV9kaXNhYmxlOw0KPiAr
DQo+ICAJcmV0ID0gaTJjX2FkZF9hZGFwdGVyKCZscGkyY19pbXgtPmFkYXB0ZXIpOw0KPiAgCWlm
IChyZXQpDQo+ICAJCWdvdG8gcnBtX2Rpc2FibGU7DQo+IC0tDQo+IDIuMjUuMQ0KDQo=

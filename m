Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1877341495
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Mar 2021 06:16:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232586AbhCSFPu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Mar 2021 01:15:50 -0400
Received: from mail-eopbgr140079.outbound.protection.outlook.com ([40.107.14.79]:20292
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233818AbhCSFPR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 19 Mar 2021 01:15:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OuDlqZ6UfWsKdztmbrTQGBFtOGjfmaDrykO5+k2ICqbjf+D+6Li4cI6CYeseHwgJySlL/jsZTYgY4bdTNTf3ef57VhAjDro4NWEIEILtAVUE022r+nmMjjClmdzsYcq2HZ5CqJet9jJAmrqRL6Ef2p5YuoHLCi9L5iFZdY9iUk1Dc2kOZ78fNfP3oWOABiR0/LPaYGOmHJtzDApWy+PWXuw7I+xVU6Jwz8IWoH2otKgb8vrjPY+UUMEIDzep0sFO/pNQB0YEaTrOZ5vz2byqdW8aH6MsOg3tXAp4UfxL29fM0ojjO4232QZvumoUv6l8ACh8UTwUI4RHZ2azaFLCrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1WCCrPR2ixSohGUFyQ4bjMY00k72phkArIlTCrRz0kk=;
 b=Mj2r+9V7DCcxpMr82nDeDmkLcyvM80UWGvs6GIUhzcHeZFttnYM+utPtavHMWl68uZKFlwyDOQWywjhFBVl03w1FXqmVJtTLh/HzOIfDgLEHLE3GmX0bDS3zwr0eDlTFsWUlmRZySg4vRoMIiQ+2HJFx0YIEKPzOzBfdNMttCwNmAIdM6U4xSsn7SBApMvFCqW/ySDJ/fL6Ob4nqjLfQeMbH4a6+7mPRI/qtg8zbr8KOvvSQTCQHLmZlMswUWQnG15P0Xqbeo94fxFESaWwAZHRimIJBbZS87ar9J7M63CBwBJJMd52mPs0MJp+p2cUNCvX168uLqjrlLk8ydWUrXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1WCCrPR2ixSohGUFyQ4bjMY00k72phkArIlTCrRz0kk=;
 b=YCZQJ31Ifhn6hkERjiRv7x6Dmncx/H2doQDSPgoUU2jNwWu9s2/BwSUJu0kDSEyotbNIEVDatVe2N6MyvjczkuKAzDMjKeEKpjqwJyGchgMrTFqLrGsQTC96HxrbAz0uBoJKBcPPcOc3fJhf0tf5ghPJViF5KlpLmr07HdDxmVI=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB5415.eurprd04.prod.outlook.com (2603:10a6:20b:93::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 05:15:14 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::ecad:ebb8:8eb0:d359]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::ecad:ebb8:8eb0:d359%7]) with mapi id 15.20.3955.023; Fri, 19 Mar 2021
 05:15:14 +0000
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
Subject: RE: [PATCH 09/11] i2c: imx-lpi2c: fix i2c timing issue
Thread-Topic: [PATCH 09/11] i2c: imx-lpi2c: fix i2c timing issue
Thread-Index: AQHXGvpcKA9FqNF4lkS+14z//M8t1KqKxuXw
Date:   Fri, 19 Mar 2021 05:15:14 +0000
Message-ID: <AM6PR04MB49660A7D1AB880EFF530654680689@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20210317065359.3109394-1-xiaoning.wang@nxp.com>
 <20210317065359.3109394-10-xiaoning.wang@nxp.com>
In-Reply-To: <20210317065359.3109394-10-xiaoning.wang@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 16b8cf51-f56a-4bdf-a300-08d8ea95fa74
x-ms-traffictypediagnostic: AM6PR04MB5415:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB5415CAD5A55E4A18389D4F7C80689@AM6PR04MB5415.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:324;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8d2YUsWz0OLq0Xn6e5IqALX54fpdgM5VOoQOcQCv/wnGeCjJw8y0fLMs9FOHOpJpMYEVgmqsVIHNGaqS0dEt0uR/h62CoqjEDipNAjcA9in5TKiEFi/3CgofIULuG0h/tU+EL9j8T+OH7BT3o4fa3NxZVEx2f6rClcELMuvrAZImsVEGfV4ze4BWMQtJPKzpIykdZABH2Lc7O9Ztr6a+6V3sx0VlK3pg3sNUfDmq+vAQQ0NPCuE3Hi2vjnQYQNboJfYPfwKM1/AZ1KARqklad93fRzKvI+j3ONLhjCutXIyPi/xTjz4rCjwVG/Bw8fMXZAG5hXoZj0K/saiHz7ejplowh+VMeeSJ+s1U2q/6b61GjXBNx/Az9QT2DjfD2L58SxUhU5aNIfTa0mVmh+zqjEvoxd4g/e6JW6nO6edOnSYt6vgA2H4g7TM0o9r1XAVyT0DtUVSKVeAGIhIX9Ycx6j869CyFghIPumlRKnp9N2qO8MR50cM+JhCcsKWxYCJq4bDkp9RaMzqtYf+oSMdoQK1OfYj2V3Lg4z47zcVEi8Otwv6JxcW8m/T32Lfklz9IsqjNrd9x7X/WSVqa7kwtPaE+OZXk5ux6WtFMP4AbJ0o6klmOj1cWMcMhQJbKr3BXO5S5mUTrSgcFrhh4JpQTiO29TFes9DEPh+GJKxcAxbc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(9686003)(44832011)(6506007)(8936002)(52536014)(33656002)(26005)(5660300002)(186003)(76116006)(66556008)(66446008)(66476007)(64756008)(66946007)(8676002)(71200400001)(2906002)(86362001)(55016002)(83380400001)(7696005)(4326008)(54906003)(316002)(478600001)(110136005)(38100700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZWI2NG1nQWE1SjJiYThjckZlZG9HSWVKQ1FSc2dSeFVnVU13R2J2Rno2bVpx?=
 =?utf-8?B?RWs5NEh5VFN5c1d6dE5DdFVOcXRFcmk1aFZRWWRvc21oWDIxMkZranRxVHp6?=
 =?utf-8?B?VnZIZ3Z3dHV2RnZKbGprYjMyVVpYZXhsdkRYSVpZWU9EQ1RNdlY4OGd4bmZW?=
 =?utf-8?B?UEp5UzFaeTJRRzIxQ1FHVzhvSGlZSlhBcVdwMEUyRFR1SUNLMmFSTTRNdzYr?=
 =?utf-8?B?cHg2eU1KdmgwMmxUVDErbEFETHZ0aDMzQi8vVTc3Q1gxb3lQNE53Mm85WnBE?=
 =?utf-8?B?L1c1TlJTS2sya2docnZ6cm5hSzNXMXhTNGkrRHdUcXB2YXN4cHQwaHdadVVR?=
 =?utf-8?B?MjNrWkdHcW5rbXRMSThES2VrUGRpaGpCVitHSnBRZS9kZE1iNGxCd3IzdDd0?=
 =?utf-8?B?eXUySWNveStERDVKOEc4M0U5Tzgrd0NpalZlaVF5VklsVStKdFZjTEpuMmhw?=
 =?utf-8?B?bjJMZmNyKzRQYk9GblRGaXFrTk94VlZ3cXVQUEFoNFpVV0MrV0o0RlMxRWp2?=
 =?utf-8?B?WGgxWDdPcWZqR0FQWExNZUVPdkZCNFdVM1FoZXEwcUI3YTFXS3FCbmhja3g5?=
 =?utf-8?B?eGdRamFCb3Z6Zk1UQWljY1N6MEhnNUZoSEw4QlJwZ3NRWStZdFZFRVBhOEtZ?=
 =?utf-8?B?WHFPMi90aE05UTVjMXdVSyt1NHJhWkZnMHA3dlNHTUpXckVNTXphWGQ3ak1j?=
 =?utf-8?B?QWQzUmtGOGxOa0psRzQxQWg3UkE0MVhKMHN3eGJxUW1veE5UeWFGREg3a1dy?=
 =?utf-8?B?bGEwOEtBSGYrbVE5YytiNk1lMDZmTWRMZSswTmpvMUZvZFM3SE5IeUVNa0VC?=
 =?utf-8?B?bmlHNXVQcitaU1pGb1ZyaWNIV0NVd0ZiLzg2UTNqNUkwZ0RmWjNmbWcwTmgv?=
 =?utf-8?B?NWFrOEtJNkFQUC9iaUY5RS8wcVFGV05ZMi9ERDhWeEtuUUhJRXFvRXkxMGRm?=
 =?utf-8?B?cXZPRTVUbndIL0FmcG80bTBwMHlObTRKL052cHozYXErWGgxUjRMQ2dRN2tw?=
 =?utf-8?B?UEk5bFkzNkxpMG50MUNhRlNkUWlDZW1SVHlYcTJOT041cDJWaXNPVUdqcVN3?=
 =?utf-8?B?VE5Sa0dQSVN3WWszS1hReXBnUUtlOGpQUHhtcFQ4VDRaYk9kSEpVd3o2QS9C?=
 =?utf-8?B?eGhGMVlqU3hycUNaMTE5Y1dWNEVOMyt4Q2liZFFFb2hhVG5qeHh6OEdEaUxl?=
 =?utf-8?B?R2JJN0dDZVZkME5vNjVPVkVINEpCR2ZuSkxwWk56a0xZK3p3LzdwYzI5WVpH?=
 =?utf-8?B?QWNoSEJhV2RNQ2dCQ3Y5L3pVRS90bndmV0lDMU9YMnNjb09vVjJzVnRocGQ4?=
 =?utf-8?B?MkpKa0Y5ZzY2MXJTUWQ5cFFXMnUza2YzeHVCSDB2dWdVZndiMmdlbStKaTdF?=
 =?utf-8?B?V2svS1NzQXo2V0xuWFBhVHE0aFIvM1VqYTIwbG80c0MyMVNoVDhZcGJvelhh?=
 =?utf-8?B?WTkrNkdQNXBwbDRJRjh2T2xxejJTaXVpZVNLZUxzMU1PcHUrcU1ZK2pNMG9y?=
 =?utf-8?B?Zmhqc2x1aEZtQXlkRWVKTUpVSkFzSUx1WWVjdjdPWWl5R2NmYklYUTRxemg0?=
 =?utf-8?B?VGd0N2czL3ppNDl1eXpBU0lpSGFocGlsdGNWUVllSFpSejdxQkFaakNFakw3?=
 =?utf-8?B?NU1DcUhVVTN5YXFJVkZ1Z210TXNLd0FSdHlIUzJMY3Vxbkl3c2g5dUNxYlJu?=
 =?utf-8?B?aWNxY1NOQTVLOUhGTXdMaFpheWZBbUNVYkM3Sm5RbjRCVUtLSVhHVFAycVdM?=
 =?utf-8?Q?s6FGb6Cle86FgX9g7gjK81rt+VsMNNDs9q7pCfz?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b8cf51-f56a-4bdf-a300-08d8ea95fa74
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2021 05:15:14.5106
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 584lUFyRyRlzLWc6CNa2DB+osIKyGeQmupzWvTCnRvbgO/zvpnRv43AVo7dPiP/xH/m1QUodgO2MwCOqwFruSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5415
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBGcm9tOiBDbGFyayBXYW5nIDx4aWFvbmluZy53YW5nQG54cC5jb20+DQo+IFNlbnQ6IFdlZG5l
c2RheSwgTWFyY2ggMTcsIDIwMjEgMjo1NCBQTQ0KPiANCj4gVGhlIGNsa2hpIGFuZCBjbGtsbyBy
YXRpbyB3YXMgbm90IHZlcnkgcHJlY2lzZSBiZWZvcmUgdGhhdCBjYW4gbWFrZSB0aGUgdGltZSBv
Zg0KPiBTVEFSVC9TVE9QL0hJR0ggTEVWRUwgb3V0IG9mIHNwZWNpZmljYXRpb24uDQo+IA0KPiBU
aGVyZWZvcmUsIHRoZSBjYWxjdWxhdGlvbiBvZiB0aGVzZSB0aW1lcyBoYXMgYmVlbiBtb2RpZmll
ZCBpbiB0aGlzIHBhdGNoLg0KPiBBdCB0aGUgc2FtZSB0aW1lLCB0aGUgbW9kZSByYXRlIGRlZmlu
aXRpb24gb2YgaTJjIGlzIGNvcnJlY3RlZC4NCj4gDQo+IFJldmlld2VkLWJ5OiBGdWdhbmcgRHVh
biA8ZnVnYW5nLmR1YW5AbnhwLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogQ2xhcmsgV2FuZyA8eGlh
b25pbmcud2FuZ0BueHAuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14
LWxwaTJjLmMgfCAyNyArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxNCBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWlteC1scGkyYy5jDQo+IGIvZHJpdmVycy9pMmMvYnVz
c2VzL2kyYy1pbXgtbHBpMmMuYw0KPiBpbmRleCA3MjE2YTM5MzA5NWQuLjVkYmU4NTEyNmYyNCAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbXgtbHBpMmMuYw0KPiArKysg
Yi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWlteC1scGkyYy5jDQo+IEBAIC03MywxNyArNzMsMTcg
QEANCj4gICNkZWZpbmUgTUNGR1IxX0lHTkFDSwlCSVQoOSkNCj4gICNkZWZpbmUgTVJEUl9SWEVN
UFRZCUJJVCgxNCkNCj4gDQo+IC0jZGVmaW5lIEkyQ19DTEtfUkFUSU8JMg0KPiArI2RlZmluZSBJ
MkNfQ0xLX1JBVElPCTI0IC8gNTkNCg0KV2hlcmUgaXMgdGhpcyByYXRpbyBjb21pbmcgZnJvbT8N
CkNhbiB5b3UgZGVzY3JpYmUgd2h5IHVzZSBpdCBpbiBjb21taXQgbWVzc2FnZT8NCg0KUmVnYXJk
cw0KQWlzaGVuZw0KDQo+ICAjZGVmaW5lIENIVU5LX0RBVEEJMjU2DQo+IA0KPiAgI2RlZmluZSBJ
MkNfUE1fVElNRU9VVAkJMTAwMCAvKiBtcyAqLw0KPiANCj4gIGVudW0gbHBpMmNfaW14X21vZGUg
ew0KPiAtCVNUQU5EQVJELAkvKiAxMDArS2JwcyAqLw0KPiAtCUZBU1QsCQkvKiA0MDArS2JwcyAq
Lw0KPiAtCUZBU1RfUExVUywJLyogMS4wK01icHMgKi8NCj4gLQlIUywJCS8qIDMuNCtNYnBzICov
DQo+IC0JVUxUUkFfRkFTVCwJLyogNS4wK01icHMgKi8NCj4gKwlTVEFOREFSRCwJLyogPD0xMDBL
YnBzICovDQo+ICsJRkFTVCwJCS8qIDw9NDAwS2JwcyAqLw0KPiArCUZBU1RfUExVUywJLyogPD0x
LjBNYnBzICovDQo+ICsJSFMsCQkvKiA8PTMuNE1icHMgKi8NCj4gKwlVTFRSQV9GQVNULAkvKiA8
PTUuME1icHMgKi8NCj4gIH07DQo+IA0KPiAgZW51bSBscGkyY19pbXhfcGluY2ZnIHsNCj4gQEAg
LTE1NiwxMyArMTU2LDEzIEBAIHN0YXRpYyB2b2lkIGxwaTJjX2lteF9zZXRfbW9kZShzdHJ1Y3QN
Cj4gbHBpMmNfaW14X3N0cnVjdCAqbHBpMmNfaW14KQ0KPiAgCXVuc2lnbmVkIGludCBiaXRyYXRl
ID0gbHBpMmNfaW14LT5iaXRyYXRlOw0KPiAgCWVudW0gbHBpMmNfaW14X21vZGUgbW9kZTsNCj4g
DQo+IC0JaWYgKGJpdHJhdGUgPCBJMkNfTUFYX0ZBU1RfTU9ERV9GUkVRKQ0KPiArCWlmIChiaXRy
YXRlIDw9IEkyQ19NQVhfU1RBTkRBUkRfTU9ERV9GUkVRKQ0KPiAgCQltb2RlID0gU1RBTkRBUkQ7
DQo+IC0JZWxzZSBpZiAoYml0cmF0ZSA8IEkyQ19NQVhfRkFTVF9NT0RFX1BMVVNfRlJFUSkNCj4g
KwllbHNlIGlmIChiaXRyYXRlIDw9IEkyQ19NQVhfRkFTVF9NT0RFX0ZSRVEpDQo+ICAJCW1vZGUg
PSBGQVNUOw0KPiAtCWVsc2UgaWYgKGJpdHJhdGUgPCBJMkNfTUFYX0hJR0hfU1BFRURfTU9ERV9G
UkVRKQ0KPiArCWVsc2UgaWYgKGJpdHJhdGUgPD0gSTJDX01BWF9GQVNUX01PREVfUExVU19GUkVR
KQ0KPiAgCQltb2RlID0gRkFTVF9QTFVTOw0KPiAtCWVsc2UgaWYgKGJpdHJhdGUgPCBJMkNfTUFY
X1VMVFJBX0ZBU1RfTU9ERV9GUkVRKQ0KPiArCWVsc2UgaWYgKGJpdHJhdGUgPD0gSTJDX01BWF9I
SUdIX1NQRUVEX01PREVfRlJFUSkNCj4gIAkJbW9kZSA9IEhTOw0KPiAgCWVsc2UNCj4gIAkJbW9k
ZSA9IFVMVFJBX0ZBU1Q7DQo+IEBAIC0yMDksNyArMjA5LDggQEAgc3RhdGljIHZvaWQgbHBpMmNf
aW14X3N0b3Aoc3RydWN0IGxwaTJjX2lteF9zdHJ1Y3QNCj4gKmxwaTJjX2lteCkNCj4gIAl9IHdo
aWxlICgxKTsNCj4gIH0NCj4gDQo+IC0vKiBDTEtMTyA9IEkyQ19DTEtfUkFUSU8gKiBDTEtISSwg
U0VUSE9MRCA9IENMS0hJLCBEQVRBVkQgPSBDTEtISS8yICovDQo+ICsvKiBDTEtMTyA9ICgxIC0g
STJDX0NMS19SQVRJTykgKiBjbGtfY3ljbGUsIFNFVEhPTEQgPSBDTEtISSwgREFUQVZEID0NCj4g
Q0xLSEkvMg0KPiArICAgQ0xLSEkgPSBJMkNfQ0xLX1JBVElPICogY2xrX2N5Y2xlICovDQo+ICBz
dGF0aWMgaW50IGxwaTJjX2lteF9jb25maWcoc3RydWN0IGxwaTJjX2lteF9zdHJ1Y3QgKmxwaTJj
X2lteCkgIHsNCj4gIAl1OCBwcmVzY2FsZSwgZmlsdCwgc2V0aG9sZCwgY2xraGksIGNsa2xvLCBk
YXRhdmQ7IEBAIC0yMzIsOCArMjMzLDggQEANCj4gc3RhdGljIGludCBscGkyY19pbXhfY29uZmln
KHN0cnVjdCBscGkyY19pbXhfc3RydWN0ICpscGkyY19pbXgpDQo+IA0KPiAgCWZvciAocHJlc2Nh
bGUgPSAwOyBwcmVzY2FsZSA8PSA3OyBwcmVzY2FsZSsrKSB7DQo+ICAJCWNsa19jeWNsZSA9IGNs
a19yYXRlIC8gKCgxIDw8IHByZXNjYWxlKSAqIGxwaTJjX2lteC0+Yml0cmF0ZSkNCj4gLQkJCSAg
ICAtIDMgLSAoZmlsdCA+PiAxKTsNCj4gLQkJY2xraGkgPSAoY2xrX2N5Y2xlICsgSTJDX0NMS19S
QVRJTykgLyAoSTJDX0NMS19SQVRJTyArIDEpOw0KPiArCQkJICAgIC0gKDIgKyBmaWx0KSAvICgx
IDw8IHByZXNjYWxlKTsNCj4gKwkJY2xraGkgPSBjbGtfY3ljbGUgKiBJMkNfQ0xLX1JBVElPOw0K
PiAgCQljbGtsbyA9IGNsa19jeWNsZSAtIGNsa2hpOw0KPiAgCQlpZiAoY2xrbG8gPCA2NCkNCj4g
IAkJCWJyZWFrOw0KPiAtLQ0KPiAyLjI1LjENCg0K

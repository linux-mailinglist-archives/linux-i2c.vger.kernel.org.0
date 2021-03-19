Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54D5834147B
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Mar 2021 06:06:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229946AbhCSFGF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Mar 2021 01:06:05 -0400
Received: from mail-eopbgr80088.outbound.protection.outlook.com ([40.107.8.88]:20352
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229447AbhCSFFh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 19 Mar 2021 01:05:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SKlYDmIS3EsrEFqk9EDqqmelHEXcTdHrIQi9EtOP4WUYu1aYVHex8EE58G6nfKsvfRTl0vqw1k36QyxQnB8+wmi+jmnYqRMnqFemyy0UpD0RpVulyfL9HH74V9nvkJKcpuYfgudK2dOr+ktNxu0OhEhw0SSTOsbeQmZBJdqWdmVdxy9F/ucpy1PanaRomamdAxkfOm+PqG9vV/rBnrSa8WxGMYrh6EKjzlwW+qk2p01SDjG02qEIlL0f7QtEPXRfBCaeA1DLbOkRZazPEdlYb7gsRgMVasY3S39Yuj8tRNu08znvBu5ltmSpuH7hKcro+GmSmsbNNW7Qft/5jTqomw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sIIN4wSI/06BC/fRGEyn9V69cdtcUyh61mCAskc3EQM=;
 b=Ua3ngyM1aYaGtP0w9Rup/9RfVPnokmPupKfsoJX5Gl5esuQ10HvYeJU6+meLNlL9Q4kdFPSogpSi+wft7YKB0sJYY2kpTQjO6ymMCL6BNFxidelcmSqxnvT8jIG4gvTKvGP9cnV7d5y48Frqx7UrFJ6XXzjtniLrRoH6Jlaqm8Q7KyEWpCVx3uVv8hyaqkYhX/iGUY9k1Ks42PMyuyms7+GgFkgwehKWJGkXNtezOeD0xLKbBiqVPi16z+VG6aOk2g4fJKShGPrQnqvOklKNmzk2h3EQdDPJ1DZDSiZVp9U3VRh91UgY8JAUZOjsjSwN8EYTz2SzDDcohA9wtJP08w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sIIN4wSI/06BC/fRGEyn9V69cdtcUyh61mCAskc3EQM=;
 b=E401b/mPSoXkSAiT1iTh7H8QpYzFDjpFFshFFx68noymEv7jFvRqPSTUz7aIfiD41jgLLK+UZ3wSrUrzKBGzdXd/OTMeFxE5BGLxT+1Ex00d07ukIhmAb90ETZSTPAnwRM92hCMJv0eJRgy2cCSHkTzOCGVrFKV8UIiG0Urg0zY=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM5PR04MB3154.eurprd04.prod.outlook.com (2603:10a6:206:7::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Fri, 19 Mar
 2021 05:05:34 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::ecad:ebb8:8eb0:d359]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::ecad:ebb8:8eb0:d359%7]) with mapi id 15.20.3955.023; Fri, 19 Mar 2021
 05:05:34 +0000
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
Subject: RE: [PATCH 06/11] i2c: imx-lpi2c: improve i2c driver probe priority
Thread-Topic: [PATCH 06/11] i2c: imx-lpi2c: improve i2c driver probe priority
Thread-Index: AQHXGvpVE42KmqlLm0i92t+eRYIAsaqKxLjA
Date:   Fri, 19 Mar 2021 05:05:34 +0000
Message-ID: <AM6PR04MB4966AFFBF0547DBCB6658D9B80689@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20210317065359.3109394-1-xiaoning.wang@nxp.com>
 <20210317065359.3109394-7-xiaoning.wang@nxp.com>
In-Reply-To: <20210317065359.3109394-7-xiaoning.wang@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fa8816af-93a1-4e64-4307-08d8ea94a0a4
x-ms-traffictypediagnostic: AM5PR04MB3154:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB3154FF1EE1BA9D48A85768AA80689@AM5PR04MB3154.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1vRLHTqQkcugel5a2yKf9dJeXDwdQ0AmhEKbjHmHw+fjIf5epAM8mapcRjJf/aw7RLjYAnbmHw0D7XEfBPN92khYNtW7bABcnJpd43VlAoU5C5ffQ3i9q/CffK2UhhWypaIoFXUfzmQS0d+p9esL/M/7er0/g8NcKg0c2rOn8mSBiP3WCPGiftqD19/aZZztMmhGC1K+BWE+hrJsZgjevpnbNAkewgm4OZOOfbYQIN/Kf99tkrZsaNUQ5pGzYAgjcvdzO0Bpl9OK0sA/5P8L1WQEFg+NCh7gPdzPWUy5oG2sUwCdBDEOVCsqw/c6A/eFZH+RA0YjPphZVeIY4+NzsANSNAYGFy60ZbAC5GhF/dyQaWk56CtYcrrZhLnB5Nt3lF9KI5F/c4gsFEKdIiiD9dE/e2kMZbtU34SPpBVEaDZu3GOlwFP2+fFihBMY2gsLkyFCpP5Jj13coXvP8IKxNqGEUjbxMgYL4iA6PoAg1h8IhTEQ4U0ubikrv5US0OCicSVvGrH0V+5DJS0QhMxGj1S+SkO/kjIsrcnMk9Wl9A0u+wd0Jdju1C6O5wYM73N0KWg2wdxdwkETRYMJj/LV8A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(26005)(83380400001)(52536014)(4326008)(7696005)(55016002)(5660300002)(66946007)(71200400001)(44832011)(54906003)(38100700001)(2906002)(186003)(110136005)(478600001)(8676002)(9686003)(8936002)(76116006)(66476007)(66556008)(33656002)(86362001)(64756008)(316002)(6506007)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?MEt0Nml6SzRrRFgyT1hWbTZTSTVZbnBDTXloNnBkYWlUM2FKTXF2OFVYYU84?=
 =?utf-8?B?aGswTnN6cG5ndDc4Qk8yNUoxWU11eU1yRU9rNXp4ZWorVE5iaEU2SmRaM0I1?=
 =?utf-8?B?Yi9oUzM3eGhFSmFTeVp6ck9jZWpqUGpCYUtBbmlZbmJvNmprVHF6dzY1NkRr?=
 =?utf-8?B?eWNCSEdFa1I0ODVwYy94RTBhYVVFR215TlZhWjEwTnFQajRyWVNZWkIwTFV4?=
 =?utf-8?B?cFdSK2F1VGpWYlZNcWp3SmVWV3BJS25MclIzcmF2UzJKODdLYXlpSFgzaDJV?=
 =?utf-8?B?cE5Nb1JnK2l6S05DRldUQTNadXhYNEIxQmdMV0NZLzBZbWlVOUllSEJKU0dx?=
 =?utf-8?B?YXd1c0p2TWxRbmZTOWN3aCtmSzJNT3o0Y1V3dDFveVhCb0ljTmNkcjVZQkVK?=
 =?utf-8?B?cGRHeTNYeG43OUdKbmE3TWU5UEhVUzFnY0VLeGNWZkhzRVd6akZxeGlQaTNn?=
 =?utf-8?B?REVwVy8xei9HNnV1allpTThOVXJTNy9uV05BWERrbE9rVmIzQ2tObDNjSDhG?=
 =?utf-8?B?d3gwZWxKM1k3SHcraGUrKzlVWHdTTGFMNDZZNTkwRDFNNVhuOHcybzhRK1Ra?=
 =?utf-8?B?TE8zait1eS9ZRFhZVmJ6R1dZbksxMEdBYlNzdGJlaFd0dXRxOTZKZGljM3lk?=
 =?utf-8?B?NmF3Sk9aQ1VKYlNWMzd4b2oyTUY5bDRjTWdJLzUxcC8rS3ovYldNK1N2RlIr?=
 =?utf-8?B?a0txT05EU3hNTDUvbXFNSS9pY2sva3U5TklxdlMyVFdnNGFKaHRFRjZndk1S?=
 =?utf-8?B?R1V4azg4T2Z2MUNOVkJZZ3VZZHhyWVZrRnBBZVowa3JON2JCdStOM2x6enBQ?=
 =?utf-8?B?TUNRS1BtdngxWWwrZVZMbkUrcXArZkVHYzlIRkJjanNsMjI0UGptYXZYODZ6?=
 =?utf-8?B?Ui9rSHRqZ1RFcStFbjJaU2lCSVl0VDhaSS9wV0VlMmVlaW05RFJBTUhCdDEr?=
 =?utf-8?B?WmtZUGRmUzY0RjhkY0l0bUMzdGE1L094TjY5NzYyVFVrWGNhenVOUWl0WkZQ?=
 =?utf-8?B?RTZHTW5KTnA3TVFHNHY1dFdCQkJ3a1hCL1F1MklLQVFrNThzdmg5VkZXcG9n?=
 =?utf-8?B?MkZaVGljTU5idGthT0FINStqZWs3N3B2ZjNFU1k4RUtvSGtBSWpSeEpXQWNs?=
 =?utf-8?B?bHdZWEMrOTlpQ1d2MGVCSnBjNzZoOElyRDBiZm51SjdML0NHVUNpUzMwK21F?=
 =?utf-8?B?RlRSVG56RzBPaDVqbTRZR0xNL3BERVFUQU9LU3Fmc3NhMGNuK0F6Mnc4ckl6?=
 =?utf-8?B?RTJrTWhIcG9LakRZUmdFOW41YnRmVVpLYTBnWnhvc21CbURpdjk0dzVCSkFs?=
 =?utf-8?B?UmdIbU5BYmxGYmJMaXhQQ29mbXdPZ1lmZFlnbDNaSU1PTEh3YXdiMWptbXla?=
 =?utf-8?B?TWhBNFhGY3l6UjdlWitXTEk4MEk5Z0hxbkJTT0lJdWVKSWx4eXptU2pDSnhJ?=
 =?utf-8?B?Z0xmZ0pYUkQ3Q3A3UWN0WTNTenQ1ajArL3drYlRHakNKZzFxblJSd1R5bTVS?=
 =?utf-8?B?cENMOXRKZmltcXcxRXYzdmNCSExpdldGV0Ntc01YLzhXaXNNT0M0Y2U1bmtY?=
 =?utf-8?B?VDBLN0ZaeHp0dGdtZk1FdmM0dHRXNEVNU0EwSmQ0LzQ2Q2NVcVpDZHUzM3dX?=
 =?utf-8?B?aHJ6eGMySUY4RlZwdkRUY0tvN1NGUGgxRUY0cjJiSUpuaVZNUkkwWkNJeG1t?=
 =?utf-8?B?YjdjdHpvVkc5UmpFa2Z1WTJXVDlPdGxOVGthQm03RCtIKzdGRGlLT2k2bHNy?=
 =?utf-8?Q?IHq2S2RV3nVrMbpiNEUMKjeOq2Wo+enw/b0lzbA?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa8816af-93a1-4e64-4307-08d8ea94a0a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2021 05:05:34.3051
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xN4SU0CoB8XjtMs+/NP+pzUPfzkph7qjNzL8DoUeI3ar391kwmMnL+j7gWi4HYRT8mUPcUTS3rLquHoop+rg9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3154
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBGcm9tOiBDbGFyayBXYW5nIDx4aWFvbmluZy53YW5nQG54cC5jb20+DQo+IFNlbnQ6IFdlZG5l
c2RheSwgTWFyY2ggMTcsIDIwMjEgMjo1NCBQTQ0KPiANCj4gdXNlIHN1YnN5c19pbml0Y2FsbCBm
b3IgaTJjIGRyaXZlciB0byBpbXByb3ZlIGkyYyBkcml2ZXIgcHJvYmUgcHJpb3JpdHkNCg0KV2ls
bCB0aGlzIGFmZmVjdCBETUEgc3VwcG9ydCB3aGljaCB3aWxsIGJlIHByb2JlZCBtdWNoIGxhdGVy
IGNvbXBhcmVkIHdpdGggc3Vic3lzX2luaXRjYWxsPw0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBH
YW8gUGFuIDxwYW5keS5nYW9AbnhwLmNvbT4NCg0KQWRkIHlvdXIgc2lnbi1vZmYNCg0KPiAtLS0N
Cj4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LWxwaTJjLmMgfCAxMiArKysrKysrKysrKy0N
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbXgtbHBpMmMuYw0KPiBiL2Ry
aXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LWxwaTJjLmMNCj4gaW5kZXggOGY5ZGQzZGQyOTUxLi44
NmI2OTg1MmY3YmUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LWxw
aTJjLmMNCj4gKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbXgtbHBpMmMuYw0KPiBAQCAt
NzEwLDcgKzcxMCwxNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBscGkyY19pbXhf
ZHJpdmVyID0gew0KPiAgCX0sDQo+ICB9Ow0KPiANCj4gLW1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIo
bHBpMmNfaW14X2RyaXZlcik7DQo+ICtzdGF0aWMgaW50IF9faW5pdCBscGkyY19pbXhfaW5pdCh2
b2lkKQ0KPiArew0KPiArCXJldHVybiBwbGF0Zm9ybV9kcml2ZXJfcmVnaXN0ZXIoJmxwaTJjX2lt
eF9kcml2ZXIpOw0KPiArfQ0KPiArc3Vic3lzX2luaXRjYWxsKGxwaTJjX2lteF9pbml0KTsNCj4g
Kw0KPiArc3RhdGljIHZvaWQgX19leGl0IGxwaTJjX2lteF9leGl0KHZvaWQpIHsNCj4gKwlwbGF0
Zm9ybV9kcml2ZXJfdW5yZWdpc3RlcigmbHBpMmNfaW14X2RyaXZlcik7DQo+ICt9DQo+ICttb2R1
bGVfZXhpdChscGkyY19pbXhfZXhpdCk7DQo+IA0KPiAgTU9EVUxFX0FVVEhPUigiR2FvIFBhbiA8
cGFuZHkuZ2FvQG54cC5jb20+Iik7DQo+IE1PRFVMRV9ERVNDUklQVElPTigiSTJDIGFkYXB0ZXIg
ZHJpdmVyIGZvciBMUEkyQyBidXMiKTsNCj4gLS0NCj4gMi4yNS4xDQoNCg==

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DC443419A2
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Mar 2021 11:13:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbhCSKMl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Mar 2021 06:12:41 -0400
Received: from mail-eopbgr80044.outbound.protection.outlook.com ([40.107.8.44]:17315
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230008AbhCSKMR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 19 Mar 2021 06:12:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EiLxwd3eYLZah94gg0W2RQDsx1VPaea7K0HExUIdxNumomjphnQl7Jpw1Qvkq40Gvs5wG/SEKcJwqDSOxMS/BHd6FqZuB/UtKK33dniLgRxxTSezJHQvE+pjhiaiEN4pq0ooeo4KV/H7nHJhzaKTiptieEhJ20UL6o9dKgMvQuVgiT+sJzby47PKbHrq2nomApk1tfiEwyeaNGQnHyv/xKnhnpH/5MgC9oGndOFwIYjqQuAXgleoDjsYQZu/bKO+2VS99btB4ZFe4yd1AhcGvqx9Dh0jb81E1vsiF94xwynwZfFT/vytw2jBiQoPsVrC7cT5CN14ZQ04guL6dh/aeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vEkeY9qk26OCDMgxt58Yv+96Fsw75qh+ARbzWAiGOW0=;
 b=Im5hRKSJ9Ix0VQa+7sFuRh0sIPaqvZ4f3gVXJBFNY2oPv8F7fEGl8roVImXL1p+Pu97jLCy5YmHYu+wy6wbKLupyyUctj2DZHgDvPHSEtr5um4Eg8UGk1U0nQUwaZAaFCPqPjP5HcyifQqSYCQcY/qLEMtHengD+h1xLpWO9L0cGYiiwI5XgBamGzBzPYTT6mSDYRdLNs3Gw6sgO2TSgg4dOCtgI9oKgTRqSw3aJrikyLYnBqj+ZZfJ2zsWnCJBOgBTonZpR9LHopUT3rlmqJxH3mdQHSWWVM1Sn2ouGselHCGfqsU9mdDd7Py/DyZeIWr+6Kj8awB8FLzp0w/WPVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vEkeY9qk26OCDMgxt58Yv+96Fsw75qh+ARbzWAiGOW0=;
 b=oayFG/oOm5t5VDSbBNb1/76cQ2nA+utBAwGEAk6/Fxb9v7OC3wQ1CpUrL5Tgxj2oDnXJF62PzB9BC0/DYD7+KJK67PmDITWQ+iuduteFRWtRhJhSuYMpIzWHc2eyWYHIWyFLj/vdZ4Vp5ETOkTt4wxZCxe2X4gOkZNSeP5VKmbk=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM7PR04MB7062.eurprd04.prod.outlook.com (2603:10a6:20b:122::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 10:12:12 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::ecad:ebb8:8eb0:d359]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::ecad:ebb8:8eb0:d359%7]) with mapi id 15.20.3955.023; Fri, 19 Mar 2021
 10:12:12 +0000
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
Subject: RE: [PATCH 04/11] i2c: imx-lpi2c: manage irq resource request/release
 in runtime pm
Thread-Topic: [PATCH 04/11] i2c: imx-lpi2c: manage irq resource
 request/release in runtime pm
Thread-Index: AQHXGvpRMC9RrtsTgkyXF7VMJ0eOUqqKwZxggAAkUYCAACXG4A==
Date:   Fri, 19 Mar 2021 10:12:12 +0000
Message-ID: <AM6PR04MB49666D5B55AB3FBA6BEC294E80689@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20210317065359.3109394-1-xiaoning.wang@nxp.com>
 <20210317065359.3109394-5-xiaoning.wang@nxp.com>
 <AM6PR04MB4966C74D4E052317F22358C080689@AM6PR04MB4966.eurprd04.prod.outlook.com>
 <AM6PR04MB56237A9E5A332422D82FB30DF3689@AM6PR04MB5623.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB56237A9E5A332422D82FB30DF3689@AM6PR04MB5623.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1494b1cc-d815-42ac-a891-08d8eabf76ec
x-ms-traffictypediagnostic: AM7PR04MB7062:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB7062C6F6CB918A4F6A8E41CE80689@AM7PR04MB7062.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7IpkY59YAkzBdR3EZbEYAe7ErPk0EVcr4XZIW3Y7NdqD5+QXCa2bznzi9X3BletH6ei8tjDlLsmZneEmHFPibtjQ65q5t3vo4c17mPICIIbg/wfAuEG0h16Z438i3hRskSDeRgjcMzCjnVsPlthQhhvxrt1F4YCf7tMcqhedVpUTeOuS4/G4nmRZJ0CbQCsv3GOV7h473ZQlksl3rYKQdIZhVoyLNFvGSgbYknwyF9Y+hTNlnUSwewcLEdghEni9ySERwUM2l09+qbxXv45Uv6X6lXRrUfXZC1I3By5vp3im9OqfYAZHSv9eNSB6HrNJoHnfcj0WN5+WkZhuc8jgBL9kYdd8W4FwoGb0STzbMSuBNrwqu4HbbTkFJqhCwQdH29Lvs/CkXGFsMkhZ5uBVE7fq1p+wT34mey0zOsT7pBxmEYr92T1g8ZvEKBv8G19NGB6TCXpkurEh0Au0U7L4Gs95NHnDGKXjmCCk2+yxmf1DTIH6wKb6bZiWdJoPBqdjLGkNxtx0sC4fbzA7jieEbrdHnIJQBzo09o52/sikXLLJvJ3pxDx7fhRa7S+autsn6vBXuTckPsXccFgepnhVkfO+H4lBsUQapfNSSnyE7T2MgH3VPcVWNM5IxAK1i6OcExnGmu4gzx9dNdqzhIhEv5U9LSH5g0zzJMSeAs0ECki04SIoAf6X9+QGjvUf0Ev4
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(376002)(136003)(366004)(33656002)(316002)(8676002)(44832011)(71200400001)(4326008)(7696005)(478600001)(38100700001)(6506007)(9686003)(8936002)(26005)(86362001)(52536014)(110136005)(2906002)(54906003)(83380400001)(66946007)(66556008)(66446008)(66476007)(64756008)(186003)(55016002)(5660300002)(76116006)(21314003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?QkhKWDhvelF1WSt5RzNNUUV5ZnJVbmYxczRqVTJsNVJTV2drT1pxa2IwZzdJ?=
 =?utf-8?B?Z1p0cUhVU05sQXNlcksrVzJUYTJzUXdSVG1LZCszbkVBRk5MQlhrQlVSY0py?=
 =?utf-8?B?MWZZVmhGMXhoblNNQTlXc2xRL2VXVDhyeTAxakJndG1NMFlzNDJWNWVhUmtt?=
 =?utf-8?B?ZGpoSU5vRVZqYzBnUlozNkZKYlVMcUFtRW14eVZsV3hLUjNFUkJOSUxWQjBX?=
 =?utf-8?B?dHp2bVYyZHVobHAvZzArekovN0IwRnpRN2lERUsyb0c4TjgrVU5zZE1iT3hm?=
 =?utf-8?B?U3VzOS9od2hqZXBMdmd0MjE0RzZmU0xxWWxzbGFjR21UcUJQdytaNnRqc3Fv?=
 =?utf-8?B?Q1hTVUZJazN0aWQwZHVSUEg1S0FlNGN5YmNXcWttSjBGUlN6NWtJWnJvT1JG?=
 =?utf-8?B?dnh0azRtRmZSbGpVUHl0aW1GZ1FCQ0JXaU5oZjRHeVAreWxZN1p1T2t3N0U3?=
 =?utf-8?B?NnhGQVlLZXJqV0RUOUlWYitXZlM4NUdJVDMwd3NnZ1o0SXpKbU1ybVBQTUtk?=
 =?utf-8?B?Q2JrcWw0RWwwdHJzTExVZ3ZCa0VyUFZjeE84SUM5UXZMSGhVMHdBVjRqZS9X?=
 =?utf-8?B?VnhBdCtSQnhFYjBib3FTTi9ZMmlidVEybktUeTRjUitXYjk4S1BPSWR1UlZB?=
 =?utf-8?B?anZWcEdqK0ZXTElubjNHcXdxU3NUTHVFam5Da2FuSkhZQ1ZYK3NwTW5iLy9i?=
 =?utf-8?B?TkdnazNITHppbDFqR1FaM0swNjRQVGxRMjhkOUZvVnJnd0VLeUNXcXdRZFMz?=
 =?utf-8?B?UG8xMXdadkVzdGVXeENWNytVQUV1RnhRdytBcU9HODZNR0JwczZDY2lzV29B?=
 =?utf-8?B?ZW05SU4vTHREMDV0WEVuRTNiREo1Ukt6MUpYaHVZK2pka0gyZGRra3VjRXFh?=
 =?utf-8?B?THpzYVFEZERqMnczM1QrLzRxcnRQaTZxT0drS0pqN2UzN3NJbXhTSjgwUGFN?=
 =?utf-8?B?a1B2SUQzbUVhb1g4ZW1yNU0yQXBtcC9UandaRW1Yb0QrWTE4d1RWZEdJZlFw?=
 =?utf-8?B?ZndvMjY2cmN0SEhrWTdweEtWVkMzdFF0Zm8wd0pDNXp3YVRnemp3OWN6TkJN?=
 =?utf-8?B?cW15UVMxMGFIelQ0VVBtUEluQWlMcjB6ZExQVDBsVkJRcUJIaW10TXpzTExK?=
 =?utf-8?B?QjF4VmV6eC92UWhqYzIvUzRPUkRCaXg0UHdzbmNHRCtoZ3pSNFU1RjNKZVdx?=
 =?utf-8?B?TkxRcWw5bSt2S0ZEVW5nQjdkRGgzZEZ5TWlnTXd6cW9wYmVrUW5MK0dKc2Q4?=
 =?utf-8?B?aGhvQXdjWURTcW5MSnR6N2FJTmVXOS9JMEZPTmQrcDJmb2RxY2tTeW1DRGEr?=
 =?utf-8?B?OFozcDhidmkxZGJnWlBraFdlei90ZWtjcXBnSWZLZlFlVkZUTjZYbjVSREZC?=
 =?utf-8?B?TTBmSnFZS2NiekhlVTl6YWVETGh4Yzc3dFpzRDFCK0tNVE1VanhiRzVLb081?=
 =?utf-8?B?bkpMNUVXUnlFZytoRUdDUitOR1dxMXBic0tqaXlpWXg1bVRIQ01DdjdKRWEz?=
 =?utf-8?B?T3ZYSllXYk5UMURjTkZzblpXcmN6eE5qZUZxZWY2TkQ4ZzI0MFN1KzdNdTds?=
 =?utf-8?B?ZjhxaUEyd2srR0FocUlCNEROemN2R09EWXlmWExYWkM5SkV3Y3ZVRHhNZ1Ba?=
 =?utf-8?B?ejRQODl3a296Q3c3emg0QUJqQzBuZ2YzWExGa0RrSjZta0hUNG0remtxNnBo?=
 =?utf-8?B?Vm9sM2RSdTAwQkw3RFdGR2NmbStpTEs4UWdXWTFTMWRXb1RoVzJLMFE4Ni96?=
 =?utf-8?Q?mbBn/yKXahLJuZGkoFKkB46CXDW7Ke1U2Xlm/V3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1494b1cc-d815-42ac-a891-08d8eabf76ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2021 10:12:12.7055
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VBxBfK/kWEfU/kSOno74vV7tG7aYi/mIHF1lb/0Tr0h2HsRe0r/auVqYv6yJVoFXXYUKbN9S6J0K91eQ+A9S/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7062
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiA+ID4gQEAgLTY2NSw2ICs2NTksMTQgQEAgc3RhdGljIGludCBfX21heWJlX3VudXNlZA0KPiA+
ID4gbHBpMmNfcnVudGltZV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQ0KPiA+ID4gIAkJZGV2
X2VycihkZXYsICJjYW4ndCBlbmFibGUgSTJDIGlwZyBjbG9jaywgcmV0PSVkXG4iLCByZXQpOw0K
PiA+ID4gIAl9DQo+ID4gPg0KPiA+ID4gKwlyZXQgPSBkZXZtX3JlcXVlc3RfaXJxKGRldiwgbHBp
MmNfaW14LT5pcnEsIGxwaTJjX2lteF9pc3IsDQo+ID4NCj4gPiBJIGd1ZXNzIHVubmVjZXNzYXJ5
IHRvIHVzZSBkZXZtIGluIHJwbQ0KPiANCj4gZGV2bV9yZXF1ZXN0X2lycSgpIHdpbGwgdXNlIGRl
dmljZSByZXNvdXJjZSBtYW5hZ2VtZW50Lg0KPiBPdGhlciByZXNvdXJjZSBsaWtlIGNsayBhbmQg
c3RydWN0IHNwYWNlIGFyZSBhbGwgbWFuYWdlZCBieSBkZXZyZXMuDQo+IE1heWJlIHdlIGNhbiBz
dGlsbCB1c2UgZGV2bV8gdG8gbGV0IGRldnJlcyBtYW5hZ2UgaXJxIGhlcmU/DQo+IA0KDQpkZXZt
X3h4eCBpcyB1c3VhbGx5IHVzZWQgdG8gYXV0byBmcmVlIHJlc291cmNlcyB3aGVuIHByb2JlIGZh
aWwsDQpkcml2ZXIgdW5ib3VuZCAvIGRldmljZSB1bnJlZ2lzdGVyIGFuZCBldGMuIE5vdCBmb3Ig
cnVudGltZSBwbS4NCkkgbWF5IHByZWZlciB1c2luZyByZXF1ZXN0X2lycS9mcmVlX2lycSBkaXJl
Y3RseSBpbiBydW50aW1lLg0KDQpCVFcsIGN1cnJlbnQgbHBpMmNfaW14X3JlbW92ZSBzZWVtcyBk
aWRuJ3QgZW5zdXJlIHRoZSBkZXZpY2UgaXMNCkluIHJ1bnRpbWUgc3VzcGVuZCBzdGF0ZSBhZnRl
ciByZW1vdmluZy4NCklmIGZyYW1ld29yayBjYW4ndCBndWFyYW50ZWUsIHRoZSBkcml2ZXIgaGFz
IHRvIGRvIGl0Lg0KQW55d2F5LCB0aGF0J3MgYW5vdGhlciBpc3N1ZSBhbmQgbmVlZCBhIHNlcGFy
YXRlIHBhdGNoLg0KDQpSZWdhcmRzDQpBaXNoZW5nDQoNCj4gVGhhbmtzLg0KPiANCj4gQmVzdCBS
ZWdhcmRzLA0KPiBDbGFyayBXYW5nDQo+IA0KPiANCj4gPg0KPiA+ID4gKwkJCSAgICAgICBJUlFG
X05PX1NVU1BFTkQsDQo+ID4gPiArCQkJICAgICAgIGRldl9uYW1lKGRldiksIGxwaTJjX2lteCk7
DQo+ID4gPiArCWlmIChyZXQpIHsNCj4gPiA+ICsJCWRldl9lcnIoZGV2LCAiY2FuJ3QgY2xhaW0g
aXJxICVkXG4iLCBscGkyY19pbXgtPmlycSk7DQo+ID4gPiArCQlyZXR1cm4gcmV0Ow0KPiA+ID4g
Kwl9DQo+ID4gPiArDQo+ID4gPiAgCXJldHVybiByZXQ7DQo+ID4gPiAgfQ0KPiA+ID4NCj4gPiA+
IC0tDQo+ID4gPiAyLjI1LjENCg0K

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8BD0647C4F
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Dec 2022 03:37:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229798AbiLIChu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Dec 2022 21:37:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbiLICht (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Dec 2022 21:37:49 -0500
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2075.outbound.protection.outlook.com [40.107.8.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E43F1AF19;
        Thu,  8 Dec 2022 18:37:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GXjfTSpAZU9DfMygeMPVrlVttyt/5FRXpCvpXrVqEv/Aw5ap2tWIs0RByZd/nJqPbA+XKsLFJsLgNkjHGzOXY96wYgB4vylT4Szug0uro/kltAHfmiY8AzaVzvhDWHqvxlkicemLWsjI0D59va/5NJS0keO/AgLcu0AwZR6Bmwrha4a5IykdHIUVKi9EGybOb827OEVzIgU/g4lac/ezeVtEIxMCg20l4zgVyZwmiCqmddQjRcgZSTpjobfVG+hdkOjgw+ArbgvkPxqC2f9acBu0Sr9bHt+BLQ3SDjp5KHeASJYAOmxPLumGVXAtZ5Qh6mjbf1fcrrG2OLjmldkjwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zV+eEuf7PsOzJpN43sCsMzzqPf9PjJSCgLrvt2GYzdY=;
 b=ite9rKFi3/K6YboRRrJXJ7ebQkFnxJMDuqICopz97e5yyom9xf+yk47le2JsuqvMOHtN4pblhCMqh+VU4AAHHPuYLpd8uzU4+ptjFfT+c9kW7L5Ao8B69Z7jIQyYxXO1HpLQEWT12zdemm9I1+Dlv+Q9bekmEI6avIIWFu7Wv4hr4dJdO3SJSyXX6KvKNFLt4oqjjgKaldZ/QHlrVaFX12vTFzzOrM9xf0Fpjsc/1DQMlY91tnHmlNU8fc80Mx6bQXUAXWrFxeLW+IIpvsl8P7HNwqfT5+8QeK8eNuJLCDT3qjMqoInig9IYp+YYWBgsQyyIafw81m4pYWBruO57PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zV+eEuf7PsOzJpN43sCsMzzqPf9PjJSCgLrvt2GYzdY=;
 b=bKvQvCgruResuAjxeKj8PGbnTdjmw1F0vK62znPYRFuf2kkg+YGGptaYJ1FwwvQUax4VIn1QlPPbbrMsEIc0GiPTmRAyqInH+GsfHF3+Td1i+ocoU3m3eyEFMJPys2VFmxCWAKDyUkOTJFQmkZwEwvaxQuW/BI9TqoidkF3/H30=
Received: from HE1PR0402MB2939.eurprd04.prod.outlook.com (2603:10a6:3:db::18)
 by AS8PR04MB7752.eurprd04.prod.outlook.com (2603:10a6:20b:288::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Fri, 9 Dec
 2022 02:37:45 +0000
Received: from HE1PR0402MB2939.eurprd04.prod.outlook.com
 ([fe80::7682:a2e6:b891:2f4d]) by HE1PR0402MB2939.eurprd04.prod.outlook.com
 ([fe80::7682:a2e6:b891:2f4d%10]) with mapi id 15.20.5880.016; Fri, 9 Dec 2022
 02:37:44 +0000
From:   Clark Wang <xiaoning.wang@nxp.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Oleksij Rempel <o.rempel@pengutronix.de>
CC:     "linux@rempel-privat.de" <linux@rempel-privat.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] i2c: imx: add irqf_no_suspend flag
Thread-Topic: [PATCH] i2c: imx: add irqf_no_suspend flag
Thread-Index: AQHY+Y9Fbo+WAuifTEe0ozFpp45sr65BQUiAgBiAB4CACAuLoA==
Date:   Fri, 9 Dec 2022 02:37:44 +0000
Message-ID: <HE1PR0402MB2939E0B858A15275CC3C42B7F31C9@HE1PR0402MB2939.eurprd04.prod.outlook.com>
References: <20221116074431.513214-1-xiaoning.wang@nxp.com>
 <20221116090249.GB12278@pengutronix.de> <Y4k0lVMueLEic75K@shikoro>
In-Reply-To: <Y4k0lVMueLEic75K@shikoro>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: HE1PR0402MB2939:EE_|AS8PR04MB7752:EE_
x-ms-office365-filtering-correlation-id: 5d21853f-a05a-4310-bc00-08dad98e5a36
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HgcZlVkeY1RQFCIX0uRtSm7DR/RTEFmazI4KLXcm+H/9OAxtCxERDZkiaWwPxSc3A985gLwwo5NCnrTgrjoUnHVd7DNzK+8716Xw4G67d1dZ0bAPW5c14eRNZNZFR/6NLaqytMHwY9gU71W4QxNnhWCfgjecYUxg0M7y5OtPFyU9pAWR1L7nSpbsgzmHhLJAibAEsRofeYs/+Q3UveXw0t42eetfm1JtfcrvbXIEtWwa5QJHOQCl/XYCRpKCrZWWze498LBxO3/iT3eZXPx1b+evjaejYwJjntLytTTgRBT2eQxrj1low3JH3DiDAfra8uzUqrq2TF4vTcvz/cV55U93uCrkbWmj+vUnhmGvXe7AfvqWspFMUwhype1LMDW8buD8YpnYw+UBsw++F3ewz9hQd9kO4rPnS/QqLWzudKqmUSmF4fZEtWuYedFE9IoJyy4A/BP00wTsB91pbER0mkmlGrtV2Jii2AekSWo2CG1pPIghe8XijRwssT2mDST+NSEYarNdYwxqymNIn6zVCgkOSIs9eshuMWRkVezvgJNYO+vdRJ0OyHH6KRnMxib+DAGkwVQWU8wIkQFg8tuQx6IXC9hiL7ur4BI+uN/0j+/OJLa8+s+T+TR51+ycr9vc+0dyMkjHSO+OW6zOIcaQsXn9H3/aVvrI9mOu5DH1ile1lAdgoIn+y1YQ0Jz5+8Wm9YpR07Qge4kvwe2AZWCF7g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0402MB2939.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(451199015)(186003)(83380400001)(38100700002)(38070700005)(86362001)(122000001)(2906002)(8936002)(52536014)(5660300002)(7416002)(55016003)(26005)(41300700001)(478600001)(71200400001)(9686003)(7696005)(6506007)(76116006)(53546011)(66946007)(66556008)(66476007)(66446008)(64756008)(8676002)(4326008)(110136005)(316002)(54906003)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?cHlaejlHRithVFV5T3grNmhTVFd2R3hiNHJYL2tNczdXNTlpWmRqem13TDl2?=
 =?gb2312?B?YlF3QWxkeFJEeGNLekhFRWFLTFBpL0p1MFZ2LzJ1bXpvdVJ4cXFqWW1ZWkZp?=
 =?gb2312?B?c2JTaWRzSG5CM2Q4bjBaaGtxcFNnUllYRC9QNXRDQ0ZDWjdLTi9aZGNTMElq?=
 =?gb2312?B?d0xrdy9JdUJmL2MzWVoxaWsvYkZOcHNrY0ZZSHlDRWw4bldMdXhoKzI4L0I5?=
 =?gb2312?B?RVRIQWIyUEVNU29RUVorYUg2cWZQcFl0bDBBcS9iVzIzYUloWFJKdWw5M1Vq?=
 =?gb2312?B?aTI4cUp6WWZXVUQxQWpIYmZMRkg3aUZmMkVHK3MwVVowcVFPU0ViRERWODNJ?=
 =?gb2312?B?YlM1OElndUlrUW1rTVo4MWtLd3lvaVYzb2RnLzZTTXRtM01XRitJZXM1NlRX?=
 =?gb2312?B?T2lieUI0d21teTB2WnRUQVhCTXBCaldQZkw2aVhWaTV0eGxHVEd0QkhTS0pl?=
 =?gb2312?B?S0xlUHBJNG52VnBFcjRWcTRHLzZEaXMwWVFrdnBWdEFTQjlicmIvU1R5NkVy?=
 =?gb2312?B?L21JNmVZMHl3cGZrVXpoeDZwQ1FIa1NreWU5RFI4UmQwMUo1VEphU3NMV0tX?=
 =?gb2312?B?WDRIcm5mRHVGRkZ6VTlvOXVScFc0eUhCRjJFR1pKSVlBOEtPYmRqbVZkZmQv?=
 =?gb2312?B?M05VYi9ESndORXF6bmxLb3ZvOVl5bTRsY1ZUekNzNlBTczIyRERMMmppeERv?=
 =?gb2312?B?R0cwTVFJQ1I0ZVJ2b21TUncxdUQrMFcxeUlnYWg5WjJIOU1BQS9YUldwdkcv?=
 =?gb2312?B?Z1FPNmZMcmpyZlFaNUh0VmxvOXVTdTR1NXFkWXNteVkvTVVteWtSdlJxU2ox?=
 =?gb2312?B?bW8vNFJGZWpsUjJ6dytiTkFhUmUzeGg1K29lVm1PeEZZOEM1WjNEQ3VJeWMv?=
 =?gb2312?B?a0xRbi8zME5rZGxPS0hYTmJrMURzY1RuZ1RVY2pPbWFyL0Qxc1k3eFQrUVha?=
 =?gb2312?B?SGdLbDMzV21GS2txbzFEYklXdGREdG15UHdoVkxzck02TU4vR0dQcDN4WVo0?=
 =?gb2312?B?dyt3TWVwaVpnZGY5NTZkRUdiUWZPMDJhVXRCMUQ4aDlOUFc5Mm9KcHg5QmRW?=
 =?gb2312?B?OTlIYjU3TlNiNm92UWI3SXdycXRkVHl6VzA2NG9SV0IveFB0R2VEdDhMOWJm?=
 =?gb2312?B?UkJlcVk1Ym50dG1FWmJOVktua05yNXh4d1E0QkRHYytqWUx4OGJ2MjdJZVFo?=
 =?gb2312?B?c2w0TTlzOXpSQXduZS90d2YrVzhnTWEzc240R0d3S0R1ZExkeGVNYzQvbWpH?=
 =?gb2312?B?dGVFaExtSU5FRGRnb2x0c3NtUEYzTFpnRkpIcG95STBqUTI2UU1LOS9MbFhw?=
 =?gb2312?B?YUprUkRySXMwK1JyNlF2dmV2Y3psQk5xOGYyRTJoczJleHlGVWdDWHNSRWs4?=
 =?gb2312?B?RG1tdnFKQ0tvS0VHdEdHWFFENEV4NTF0NWg4bUl5ZU81bzN2eVBTOVZZdnZ5?=
 =?gb2312?B?OXdmN1hqS3daZE9hVWxPa3BwNE04RFNVck1LK2ZjUTZZK2ZBV1RNdVdMNC83?=
 =?gb2312?B?YnE2SEdyVkh1U3dGekxYR1AxVHFiV1NteDFjV0xzQkQzTXV2QTFheVJWTEg3?=
 =?gb2312?B?RjB1dldkS3BSM3dETFMyM0oyZVlaZFhvZXRYOVRWQWdwUVU4S1RVaEpyUi8r?=
 =?gb2312?B?ZDN3VW5uWU9iY1VPem9xSjN5RGZhM29TQXRRQ1l2TzlNU0lxTlJHcE1OZHVk?=
 =?gb2312?B?eTNhRFVyZmU3YlJsVkprcXd3OG5lenVsOFFmWnBwY2FoLzAzdWZqVTdRUDdT?=
 =?gb2312?B?V0pCcnhxNHgwZ3N2Snk1SXRFZ3ZQZmZsN3lqSUh0TkVKVEJ3dkV0RkRFNnIw?=
 =?gb2312?B?Wlp3TlhiQWtVZ0tEUWdzbW13MjAwVEpZeWUrWjRpUE1mT1JBNmxsUEs4N2Mv?=
 =?gb2312?B?R3IxSEorS0x1MDZyd2lRZW9qVkhkSElrTXk3NC9RSGE1VHgwZHVPSW9jTFVV?=
 =?gb2312?B?N3lKajloUFJyNmlvdytiTWQ3MXkrZWlENk1MY1l5RzRpZHlDQUJRRTN2TlVr?=
 =?gb2312?B?ZDBBWkczVkZ3NHRhY2lrYTgyTndPOTNKWTZaUjVrMXpPNXRiUkJUcjhwT1FQ?=
 =?gb2312?B?TUY0Z3VYQ2xUYkhHVTdKUDRhcTR6eHMvQUI4YUxDK3YzNUZqeDR5cUJJSUo5?=
 =?gb2312?Q?C7yIkEuTPuCzce/bbmkn3Z1Aa?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0402MB2939.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d21853f-a05a-4310-bc00-08dad98e5a36
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2022 02:37:44.8310
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: borDQgr6DgujsqO8qITO3DN3s8E2A5UlNOOBk9M/jUvQhCVb4MylkYOg/m72SWMlh+usTv/1nPW4Jdu2Er/lyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7752
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgV29sZnJhbSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBXb2xm
cmFtIFNhbmcgPHdzYUBrZXJuZWwub3JnPg0KPiBTZW50OiAyMDIyxOoxMtTCMsjVIDc6MTENCj4g
VG86IE9sZWtzaWogUmVtcGVsIDxvLnJlbXBlbEBwZW5ndXRyb25peC5kZT4NCj4gQ2M6IENsYXJr
IFdhbmcgPHhpYW9uaW5nLndhbmdAbnhwLmNvbT47IGxpbnV4QHJlbXBlbC1wcml2YXQuZGU7DQo+
IGtlcm5lbEBwZW5ndXRyb25peC5kZTsgc2hhd25ndW9Aa2VybmVsLm9yZzsgcy5oYXVlckBwZW5n
dXRyb25peC5kZTsNCj4gZmVzdGV2YW1AZ21haWwuY29tOyBkbC1saW51eC1pbXggPGxpbnV4LWlt
eEBueHAuY29tPjsNCj4gbGludXgtaTJjQHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJtLWtlcm5l
bEBsaXN0cy5pbmZyYWRlYWQub3JnOw0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGkyYzogaW14OiBhZGQgaXJxZl9ub19zdXNwZW5kIGZsYWcN
Cj4gDQo+IE9uIFdlZCwgTm92IDE2LCAyMDIyIGF0IDEwOjAyOjQ5QU0gKzAxMDAsIE9sZWtzaWog
UmVtcGVsIHdyb3RlOg0KPiA+IE9uIFdlZCwgTm92IDE2LCAyMDIyIGF0IDAzOjQ0OjMxUE0gKzA4
MDAsIENsYXJrIFdhbmcgd3JvdGU6DQo+ID4gPiBUaGUgaTJjIGlycSBpcyBtYXNrZWQgd2hlbiB1
c2VyIHN0YXJ0cyBhbiBpMmMgdHJhbnNmZXIgcHJvY2Vzcw0KPiA+ID4gZHVyaW5nIG5vaXJxIHN1
c3BlbmQgc3RhZ2UuIEFzIGEgcmVzdWx0LCBpMmMgdHJhbnNmZXIgZmFpbHMuDQo+ID4gPiBUbyBz
b2x2ZSB0aGUgcHJvYmxlbSwgSVJRRl9OT19TVVNQRU5EIGlzIGFkZGVkIHRvIGkyYyBidXMuDQo+
ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2xhcmsgV2FuZyA8eGlhb25pbmcud2FuZ0BueHAu
Y29tPg0KPiA+DQo+ID4gQWNrZWQtYnk6IE9sZWtzaWogUmVtcGVsIDxvLnJlbXBlbEBwZW5ndXRy
b25peC5kZT4NCj4gDQo+IElzIHRoaXMgcmVhbGx5IGhhcHBlbmluZz8gVGhlIGRyaXZlciBhbHJl
YWR5IGltcGxlbWVudHMgbWFzdGVyX3hmZXJfYXRvbWljLA0KPiBzbyBJJ2Qgc3VzcGVjdCBpdCBn
ZXRzIGNhbGxlZCBpbnN0ZWFkPw0KDQpZZXMsIHlvdSBhcmUgcmlnaHQhDQoNCkZvciB0aGUgYXRv
bWljIEFQSSwgSSBoYXZlIGEgcXVlc3Rpb24uIFdpbGwgdGhpcyBhcGkgYmUgdXNlZCBvbmx5IGlu
IHRoZSBub2lycSBwaGFzZT8gV2UgaGF2ZSBhIGNhc2UgdGhhdCBpcyBjdXJyZW50bHkgYm90aGVy
aW5nIHVzLg0KDQpDYXNlIGRlc2NyaXB0aW9uOiBVc2UgdGhlIHR5cGVjIGRldmljZSBpbnRlcnJ1
cHQgcGluIHRvIHdha2UgdXAgdGhlIHN1c3BlbmQgc3lzdGVtLiBXZSB1c2VkIHB0bjUxMTAgZm9y
IHR5cGVjIGRldmljZS4gSXQncyBhbiBpMmMgZGV2aWNlLCBjb25maWd1cmUgaXQgdmlhIGkyYyBi
dXMuDQoNCldlIGZvdW5kIHRoYXQgd2hlbiB0aGUgc3lzdGVtIGlzIGluIHRoZSByZXN1bWUgcHJv
Y2VzcyBvZiB3YWtldXAsIGJlY2F1c2UgdGhlIHR5cGVjIGludGVycnVwdCBpcyBub3QgZGlzYWJs
ZWQgZHVyaW5nIHN1c3BlbmQsIG9uY2UgdGhlIG5vaXJxIHBoYXNlIGlzIG92ZXIsIGl0IHdpbGwg
aW1tZWRpYXRlbHkgY2FsbCBpMmMgeGZlciB0byByZWFkIGFuZCB3cml0ZSBwdG41MTEwIHRvIGhh
bmRsZSB0aGF0IGludGVycnVwdC4gQXQgdGhpcyB0aW1lLCBldmVuIHJlc3VtZV9lYXJseSBoYXMg
bm90IGJlZW4gY2FsbGVkLCB0aGF0IGlzLCB0aGUgcnVudGltZSBwbSBvZiB0aGUgaTJjIGNvbnRy
b2xsZXIgaGFzIG5vdCBiZWVuIGVuYWJsZWQuDQpXZSBtYWRlIGEgd29ya2Fyb3VuZCB0byBjaGVj
ayB3aGV0aGVyIHRoZSBydW50aW1lIHBtIGlzIGVuYWJsZWQgaW4gaTJjIHhmZXIuIElmIGl0IGlz
IG5vdCBlbmFibGVkLCB0ZW1wb3JhcmlseSBlbmFibGUgaXQsIGFuZCBjYWxsIHBtX3J1bnRpbWVf
ZGlzYWJsZSBhdCB0aGUgZW5kIG9mIGkyYyB4ZmVyLiBIb3dldmVyLCBzb21ldGltZXMgdGhlIHJl
c3VtZV9lYXJseSB3aWxsIGJlIGNhbGxlZCB3aGVuIHRoZSBydW50aW1lIHBtIGlzIHRlbXBvcmFy
aWx5IGVuYWJsZWQgaW4gdGhpcyB3b3JrYXJvdW5kLCByZXN1bHRpbmcgaW4gYW4gdW5iYWxhbmNl
ZCBlbmFibGluZyBvZiB0aGUgcnVudGltZSBwbSBvZiBpMmMgY29udHJvbGxlci4NCg0KRG8geW91
IHRoaW5rIHRoaXMgaXMgYSBwcm9ibGVtPyBJcyB0aGUgSTJDIGF0b21pYyBBUEkgaGVscGZ1bCBm
b3IgdGhpcyBjYXNlPw0KDQpUaGFuayB5b3UgdmVyeSBtdWNoIQ0KDQpCZXN0IFJlZ2FyZHMsDQpD
bGFyayBXYW5nDQo=

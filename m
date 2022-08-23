Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC3FC59E726
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Aug 2022 18:26:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241443AbiHWQ0M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Aug 2022 12:26:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244941AbiHWQZW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Aug 2022 12:25:22 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70077.outbound.protection.outlook.com [40.107.7.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8EFEA00CC;
        Tue, 23 Aug 2022 05:49:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2YjE1EGEArSd0fEThu/pO3rmdG0s/yt1llk6rANQbEkK2QsKOC7B0dIyfUAw/E4Ee1TLOfONiFoI4JG07gDzXMe46rnFvGvHVP90a8n4pLVux1kUbGv81xOILS6krvQOwkuNggVX1JOf4mARdLHPL6/JM64guI+seQY5BfirHmHECUZEnoQ9l4YOIavbz6Fbd9ReTwIk6nNGed4ddtF6LvBbhdleOeetVi29H9geDBoQpljcGAdH3Q2eM9CGlWDO6uVz8MtosvvK/lUvcoSFsM+PTRgKJe07XO1SttpqOjsEzW6TIz925W4ptDu+8J/uR/MIB1Bhnu1LP+q33WfCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=882ZMDRRSZ81l4PjkJ422jeCBssxgPi1+5pNprp6wx8=;
 b=N9S7lf0BMAu3bmpqD6+xPgiAFSYSarzcAZi7yqMX3A7jjwyez9TFovtU0q31SpALK30+BCGsNQey7to6MVW8gAQnKHf99ufPgbtAYMVh+jPl/W+JFho6NB6+q+wWI4krSGzG6TUptaqXRgeXpsrSlEvnOjC23VTHLlxSKmjTzGS4IGlspXRWthPONsSnFXXn43E6fkzuRKurZxxGhl7tHG0coD9ni+bGmhH7cMA4FPPF0DZklEAFVkAUFDQTG/kj8xfvCCpYi7JjJqeSD4stGjVf3NxQb++x4OCOy4gqPePrOhDHHWgZg6szghkeVWFr5il0yILNLbPdRYXBEQJu0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=882ZMDRRSZ81l4PjkJ422jeCBssxgPi1+5pNprp6wx8=;
 b=pORrqEs0/6UyEjHuFHmRNir3TbajA+QJ7PdlAeJ/ApcsrXkl7+ehaWkykJT/+5ZCmq9WhEyNigaqLQXnianTd9iDhWfrP+IQXHQ4l6s0hRsPsiYYsi3F2IAJwm4h6Q/pPQ4OWlNqs0Ru/BEnjqEbPq81uAzd6m1eur4qxCJHGRw=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AS8PR04MB8674.eurprd04.prod.outlook.com (2603:10a6:20b:429::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Tue, 23 Aug
 2022 12:49:14 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%4]) with mapi id 15.20.5546.023; Tue, 23 Aug 2022
 12:49:14 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "wsa@kernel.org" <wsa@kernel.org>
CC:     "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Clark Wang <xiaoning.wang@nxp.com>
Subject: RE: [PATCH V2 0/7] i2c-imx-lpi2c: add IPG clock
Thread-Topic: [PATCH V2 0/7] i2c-imx-lpi2c: add IPG clock
Thread-Index: AQHYsW876SxYc4rxXUGbKvyYc8nHU626pHbAgAG9ZACAABcMsA==
Date:   Tue, 23 Aug 2022 12:49:14 +0000
Message-ID: <DU0PR04MB9417CA946AD601F900500A5488709@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20220816125526.2978895-1-peng.fan@oss.nxp.com>
 <DU0PR04MB9417E7BD5F1FB7A8E00BAA3F88719@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <7eb3cca0-1be6-8f7f-a7bf-f0c9478e7080@linaro.org>
In-Reply-To: <7eb3cca0-1be6-8f7f-a7bf-f0c9478e7080@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9e54adb5-ae57-4604-6eb2-08da8505e24b
x-ms-traffictypediagnostic: AS8PR04MB8674:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T1G8HshyMYxXLZvE+8tcBDkPq2eoxtXpkJRVqtKcQ5/94aNxiaefzi8igZPOt3gVU8UNdyTPNW+GIJC4cJL3xnzaeMMt9AahlC4stq5oe7AiqmKoaH7+eQGZq6D2gC+HrecQ/XmGEbWIHU8zLkRBs9ANz16AwNhhuZ20c/5dmLhNX+wNID3y3SRyiqsEdz55d3l7LXROMD+kiBxzCIJxQcFXPSrIs4d86aJwSvCqMwIYliK6WD7Ceyi6WQGd2mDR3OWnLJWXRza0cjd7j24ohfu+y0HybZOPPmvcRrlgRE7GdNV48aMXtuS/v4R452/jdPNtxaOQzp/jyimQCYV7y5rvXnrCxvYL3vKgzx4LosyTkVpBGtzuDm3nxxxuNUvrMXuKy9lUWNnn0FspeejGaj6fbEqMnS+WlpiJF+OTSRBLi1xRS+AHvfE3CNdZBQKfD/XoRwXNgshnWKvMdq9cGpGGP49SrswR53n3p+cH4RtzOE/oqkoFPWgbyMWXeDzVIWFHxXLvUgFUruzQ8k67ro1lF2Vfwj3ECmyNFW3hB4G+I9jN2Ui3e/cQYkYmV9VrVis9WRlY4jGZZoMOMe21UVgOEvt+JvqD+R6lOkIjxiJXInQ75FuEqD2oDw97vwHfpiILuxA3nezhJEzV2COyFGhfcfuW3YLkWf1t8C4moEMURfVkgfYj2jciwFKBIMAzSwIf4Z5SYzUhiDjdYTBM1o2piGpUhnkLs4i3BQvqm3liV6weVmw7SC4FgGnsTUD4c5n1ZTUkHQpUDkwc8ME/3A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(396003)(346002)(136003)(366004)(86362001)(186003)(38100700002)(38070700005)(83380400001)(122000001)(52536014)(8936002)(4744005)(44832011)(7416002)(5660300002)(4326008)(8676002)(76116006)(66946007)(66556008)(66446008)(66476007)(64756008)(55016003)(2906002)(71200400001)(41300700001)(26005)(9686003)(478600001)(53546011)(7696005)(6506007)(33656002)(316002)(110136005)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZGw5MkNaUUVuZkJwcnJsVEhzL1pwbnFJSzg5Njdud2E0bEgyM2JFRlUyWDdO?=
 =?utf-8?B?V3k0VFd3SDFXSzB3ZTl1OWlFRlFaZWJ4c1BXK2FScWlNQjlHM3JYVEZxS1A4?=
 =?utf-8?B?dlNFN3QzM1J2YWRkaCtIWmlWZHNrVXEzZFdBR3J6OEFENytZL1pnVGRQZXI5?=
 =?utf-8?B?QXhBN2dVbHdMMWw1ZVlYTDdsL0krQmNkcmVNL3c2WVNaSVJwRE5ua2phYldk?=
 =?utf-8?B?RFlZTFlQcDNkSi9VbXF1QklqRUcrZ2lWQjcyR0M1UmxCNTlrYUlvcVJna1Bp?=
 =?utf-8?B?MkZyVEpRNU03a29pbkw3MVFNTHVFTEV2dUM2VUh1K29zaHphcWprdDl6NWN4?=
 =?utf-8?B?UXo5aElBQUk2MjlRRktKVWU2SXlNQnV0TE96cTN5UGJPY0x3ako1VWtqRGFz?=
 =?utf-8?B?L2dGT3JQcEtoNTVIZW1adlNNSWZUdUVGYzdBSHNCWWtkQnRPTm81RVVBMmF0?=
 =?utf-8?B?TkR3Y3R2VVJ4akh4d0FNTmNUcERqanIrUU9MM3l1RlVQZ0hiVi93RUxNbFRK?=
 =?utf-8?B?SjVwbjVady9tb1E3YjN3d2lpcnkxeTNVdXB1SkF5NFRCR2xielFCUmJkWldK?=
 =?utf-8?B?TmY3a2JBaWE2UmhKRW94cUZFODhSaWNZQzk4TVo4cVJxek1oTDlnRG1UbTlZ?=
 =?utf-8?B?MHBzT08vNzJCYlFERXcvanA3VmFZTjI4Ym1KZ1N2dlJWc1ZUejdBT2w0dzdH?=
 =?utf-8?B?RFJ0UGMvdVdmKzY4MDQrcDNJZjJ2N3E3SWZhc0pXdy8yVVBqWVNEQks5QWl0?=
 =?utf-8?B?V0R5L0Q4RFhtZHBCMXVGQnZadCtPenlkeElab1FJb0NzOGlHNUh1VnZNUlFX?=
 =?utf-8?B?bk1TUlVHMGVjQ3RvTVVtTlNjWVdqQ1dUNHovblFwSHNjYXZaK1dVeWlNd2hX?=
 =?utf-8?B?anZjQTBkMkVnaXl0M09WOE9WTWFFNDRTMjZGY0gyNjFLMExrZVBadDhpeFB0?=
 =?utf-8?B?VXVGL0N6SEY2WUZnNklPZlVsYXJid2JHS000aDYvQ2pKQ1dyYktZMUdEM3NH?=
 =?utf-8?B?czVUeUNGQ0E0bTBqajdxQ1Y3R2pnbXh5RE1peWhyUTM5MWI2bGVLQytCN1h0?=
 =?utf-8?B?ZUVpSnVQTUxGYTBBYTNqdlB2YTdCTXBUSEJ2d3psY3d0em1YbXZEOUpQcEJy?=
 =?utf-8?B?WGRERWVRcCtOZ0t4WmVsc2hmTWlxOGI3bWZkU3ljV0x6cStmcHFWNFl1d0ZS?=
 =?utf-8?B?VzhZcU9vV1g4NzJzdzEzeGZXbXl0RHZOMFVzWTVjc1lETU1TTEpJZGN2Y3BJ?=
 =?utf-8?B?alEzMjBZOGlSb0xhV3RaTDV6SVJrZkZvQ21oaTlaYW4rY1NVU0t3YU8yQWdk?=
 =?utf-8?B?cVBGRlgwM29meVQ0Q3pzREE2QU9mMVR4NEltSDVMQ1ZNb0kvSUVFUWVHM3ow?=
 =?utf-8?B?NnlDVXNBWGFvYzFyVkF2YWRSQUUvU2ZBczB2cThBOTdaaE5ham5KWjM2SzFC?=
 =?utf-8?B?eHV3bGZRQWJRMDFPL0hpbmdQem1jZmo3YXJTR2gyYWFidGgzZGJFdUFDTFkx?=
 =?utf-8?B?WTFrdHdSaXFIYkZGQjY0WVVjZW5YSEtNb2ZqajNSUVJQU25jd3V1dmhML08z?=
 =?utf-8?B?NDZtb21OZFNDRVpmYXlXYytIZE5YOWE4NzV5eWNwTDdsaG5ZeWwrRHJvbmph?=
 =?utf-8?B?Vm5XbzdOOUFncG15UUtEekM0NWtaR1ZZZU1QUUkyMkV2ZmV6U1ZMcWh1OVFy?=
 =?utf-8?B?MkdwSnRsU3FldHVkdnFLUm91ZjhCTm84dXNndVMxSXVoWVJqeUdCWWR4aHhE?=
 =?utf-8?B?UGthZE10UHZLMW9jcG41WHJDVmlpUDZ5K0QwVlNTL1dXT3VYbVA3eFpOcXNM?=
 =?utf-8?B?VlEvT1RuRUZkWUZvOHY1ckpxRVRkSVRqUHdhaFpFL04vKzZkbVdSdEZXZ3pz?=
 =?utf-8?B?L1BweHZ2UXd6MTJDd24rb3BKZUJFQWZSYWhKeng0WTdqem9obnNITVlITlUw?=
 =?utf-8?B?bUZncUZTck13TjEwcHhWL1ZEbXk1ZCtyMWNkMFdiNWNXSzVzMW1FWnJtWUxB?=
 =?utf-8?B?cGd5ZVpZSkVVcGxzV2lYeFdNVFp2OG9mbEFBMVhDTmQra0xyQlhvYWlGLzFW?=
 =?utf-8?B?QWpHVFYzZW0raXR6MWZGN1M4UEpKK2Q4VmRBemwzcVBxZ3h5OGF2MmRMeTVK?=
 =?utf-8?Q?aiRk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e54adb5-ae57-4604-6eb2-08da8505e24b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2022 12:49:14.3959
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GNeO3eAf0bAsGLA5sV9vOty3XP76Ys9R0mFYpBjj1oTIE5deyPtEEQk29Tv9ML0sSgBYwi9HmNCQgXmjXqIdIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8674
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBTdWJqZWN0OiBSZTogW1BBVENIIFYyIDAvN10gaTJjLWlteC1scGkyYzogYWRkIElQRyBjbG9j
aw0KPiANCj4gT24gMjIvMDgvMjAyMiAxMTo0NiwgUGVuZyBGYW4gd3JvdGU6DQo+ID4+IFN1Ympl
Y3Q6IFtQQVRDSCBWMiAwLzddIGkyYy1pbXgtbHBpMmM6IGFkZCBJUEcgY2xvY2sNCj4gPg0KPiA+
ICsgV29sZnJhbSBTYW5nIEkyQyBtYWludGFpbmVyLg0KPiA+DQo+ID4gS3J6eXN6dG9mLA0KPiA+
DQo+ID4gRG8geW91IGhhdmUgdGltZSB0byBnaXZlIGEgbG9vayB3aGV0aGVyIHRoaXMgcGF0Y2hz
ZXQgaXMgb2sgZm9yIHlvdT8NCj4gPiBQbGVhc2UgZm9yZ2l2ZSBpZiB0aGlzIGlzIHRvbyBlYXJs
eSBwaW5nLiBTb21lIGkuTVg5MyBkdHMgdXBkYXRlDQo+ID4gcGVuZGluZw0KPiA+DQo+IA0KPiBJ
IGRvbid0IHVuZGVyc3RhbmQgdGhlIHBpbmcuIFlvdSBnb3QgZXZlcnl0aGluZyBuZWVkZWQgZnJv
bSB1cywgd2h5IHN0aWxsDQo+IHBpbmdpbmc/IFdoYXQgdGhhdCBEVFMgaGFzIGFueXRoaW5nIHRv
IGRvIHdpdGggdXM/DQoNCkluIGxhc3QgdmVyc2lvbiwgeW91IHJhaXNlZCBhIGNvbW1lbnQgdGhh
dCB0aGUgZHJpdmVyIHBhdGNoIGJyb2tlIEFCSSwgbm90DQpiYWNrd2FyZCBjb21wYXRpYmxlLiBT
byBJIHVwZGF0ZWQgdGhlIGRyaXZlciBwYXRjaCB0byBiZSBiYWNrd2FyZA0KY29tcGF0aWJsZSBp
biBWMyA6KQ0KDQpUaGFua3MgZm9yIHlvdXIgcmV2aWV3IGZvciB0aGUgYmluZGluZyBwYXRjaGVz
LCBJIGhhdmUgaW5jbHVkZWQgeW91ciB0YWcgaW4gVjMNCkZvciBkcml2ZXIvZHRzIHBhcnQsIEky
QyAmIGkuTVggbWFpbnRhaW5lciB3aWxsIHJldmlldy4NCg0KVGhhbmtzLA0KUGVuZy4NCg0KPiAN
Cj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg==

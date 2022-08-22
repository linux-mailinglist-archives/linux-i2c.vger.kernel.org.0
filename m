Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD88F59BED9
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Aug 2022 13:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232600AbiHVLvX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Aug 2022 07:51:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234829AbiHVLuI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Aug 2022 07:50:08 -0400
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50054.outbound.protection.outlook.com [40.107.5.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A6AA10BE;
        Mon, 22 Aug 2022 04:50:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N4I93pGTIjxO5ItZJwGW+N71NQsojAtiMyFcJPcB5nL68+u22G5VaG4n6sl2OQt0wOPxFadEhezHjpYhkGQysOIh8WmEKJE5+PgjVZKcbihiFDOk62GlWWeWLihXNu8po86bdd2IE8RkSVvOcq54aaE6cwDunFH7/DRCyAqMXMNKlsNMBn1H/p8aK0Vf+WcIW/eH9IHVYUMOhi6Ef8uxwODTLvpkeH/enkaWWNY0A3nMVkP3GdvzR5XXVmtmq+6x/7GiZL0Uteao2OORVajs5V3edue3lX3h6kKGGmq8ZuoDFCVfzlycoUKTBWbTUaNszBdKVEkK0YaM1CNdmIUpEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BG8pzBuhdlxg1Rkz9z3eGzgeNqTqgqHOe5EY84yn7Y0=;
 b=EmfsseezmSYqft7PcDQmWUFVijrpQ077tbWP14OLUO8AfrO01Yqz7FfUTFpM2Fs/zKZTmJ7uODhSTKbs7gUxQB66W8vD2Ze+WD0wzEKs09FX/XWsr1TKIEW8kyeasoxvGKJdz2EmvJtiwgLEHY7UTtdp0PJXDpWkElawCPC3evMsB9Tq8Pw0NJndDCCPQ+x/owjH8k/w/oMKvxf7UWmg7O9wi+vyUBm5tTdiCUexUbjGIXHCCQcBEOoRTTdOypVpdVs2I0cM7io7wdkCO9Nw4zRbsil2f/cejmCt42hZ/3m4HM/n0szNbIGqI+xZqBqIwccRCFSzRFkGSzYqrJBVFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BG8pzBuhdlxg1Rkz9z3eGzgeNqTqgqHOe5EY84yn7Y0=;
 b=cdYQG+8dN7A2y2UKC7yDWRMxXT6KJRhmYKOceE1hy8AQk0X/5h7dY7WylaEwI9gG1ES4EC+zbRK4f+4CO1XWoPas9BzfXfEi+t8yqPgUx5cws6CbW0RRpJ9cFm5r2w+yJokxpLtlbjWEDzmL2s3t1NBp7vVPazUqqU0D/xF81Yo=
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DB7PR04MB5499.eurprd04.prod.outlook.com (2603:10a6:10:8b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Mon, 22 Aug
 2022 11:49:59 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::8948:3ca3:ca1:1baa]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::8948:3ca3:ca1:1baa%4]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 11:49:59 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
CC:     "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Clark Wang <xiaoning.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: RE: [PATCH V2 0/7] i2c-imx-lpi2c: add IPG clock
Thread-Topic: [PATCH V2 0/7] i2c-imx-lpi2c: add IPG clock
Thread-Index: AQHYsW88v2jU6A+mME+DBfz1BRRkmq2613vg
Date:   Mon, 22 Aug 2022 11:49:59 +0000
Message-ID: <DB9PR04MB847728D7A49D2209ED799FB980719@DB9PR04MB8477.eurprd04.prod.outlook.com>
References: <20220816125526.2978895-1-peng.fan@oss.nxp.com>
In-Reply-To: <20220816125526.2978895-1-peng.fan@oss.nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b8cab5ec-705b-464d-8d7f-08da8434710a
x-ms-traffictypediagnostic: DB7PR04MB5499:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SOqj8FpWwvbw6ERFpyzmr/e0sHxNvr7CWY1y3bb5ScnnEZCKncNZ+BFmvHaDOPQLT2l3EA+J/QXil8OCdQKFfnIJFqMYwyNhdhUaXxkj+ZIHQBteWkiFHUEK22smL052KL1+uHqaamRdOXs4B0jkLVWEuDGIQtwz0HQzTqBa46Gv9NjInhKrQrldW+5/tlxkb985lrUSEGkkYZhOjHQPyqTwBnwNHC03KiHVebY56DUV4f2+Tujq7O1McvH88Gs01F8xR474F6nzZiRYTDVLTN5WsPFsLbjnfgcUajihvgu/lm7+krWyHyjTvjxo9OwIHWJx3ARlJKnx0ab+YKMvxJHeuLpqS2v83IFgT2s7VUU9FxiSO3Yj3I9AgZPDz88keDOAscAm9Jr2JxvnNeI6I2Il9qr/ZquqNQl6AI1Jgnbl4ScHHcdfTmjOO4N/0rl7mmBUTRXDk91yvDRPgabvH1BG73uDYPov8+mTbYSLSMjKd0VkeVuuI8P5rr1mSM3HrRh0tsxyqFWmO1L5kLYGkWuZTXSPFycv9X8U7VShGkynEbHKvvC6KMVyJWmM9/79Cz7ChM5ctbnGLbMAI2+37l7kcbn1OpqZy3zOh622/+VLAWrN/tRJO/K0PxXivBr++h4TGCgtXcTcs9U/6OYbNBsGbyrD1el4c1yZXA4IMSg9FFlrAeuNGEPv08VX1WjadSgxbCNRthCslD3q48cqxfTPTwX11b0t7xhqpSUvtyYe/2yYYPQaD9JYXn5zddngiO3ujhWIz/ecZdBU9w8MeA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(71200400001)(83380400001)(7696005)(6506007)(9686003)(26005)(2906002)(33656002)(186003)(38070700005)(86362001)(55016003)(38100700002)(122000001)(7416002)(4744005)(66556008)(66446008)(66946007)(76116006)(41300700001)(44832011)(316002)(5660300002)(54906003)(110136005)(52536014)(478600001)(8936002)(64756008)(66476007)(8676002)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?SzNjSUU3dHdiZXRacnlRV21zZ2NabWVKRmJIVFpkR2xqYUVPUERyOEpQOXB2?=
 =?gb2312?B?RUxUbTgvWGlndis0c0h1ZmErMGxaanAwbnF4VUpIQ25QcEdGN29GWktPWjdh?=
 =?gb2312?B?U045TEI3VjU3VXVCR1JTUUNWSlo2U3EyVUhuNDhRMmNMQVUxaURpRktMaks4?=
 =?gb2312?B?QVcyS296ZE5JcmJjdjMvalVEeUQyL0orUGtlSjNVNDY0aWgweHVHNCtmTG5W?=
 =?gb2312?B?NkZvUEJKN2l1SW5yNlhlK1d6OFJpa1A5WnR0T3M2K3IrTHRwdFp3M3pVMXQ0?=
 =?gb2312?B?Z2hKVTg2NjQzdS9WR3M3UFg3RlZvOGY5YjJCZXJucWVYRUZqYldncXhMQm9y?=
 =?gb2312?B?S0pKYVRFdzBwWWl6M0swckgvS0hmaGU3RGZEWWc1ZXFHN2ZLZFZsZEJGbVRL?=
 =?gb2312?B?SnFDUEREcFk4cElnYnorVitCT2Z2U0dyeFd6UmQxeGUzTkRqL3BlYWxFWUxt?=
 =?gb2312?B?YmExSmQxM0lkdFJHNXJQdG55cVpzMWdxUkhYVlQrbmZFM1Jwdyt1Q1p1U25V?=
 =?gb2312?B?ckVncEtBTTUvRUpOZkRlRDVnSWdtdDROd1I2ejR0WWpiRFd1OXlROGhyREFB?=
 =?gb2312?B?RkxhMVR4OVN3M3JTRWJFcEprNUNmNkIwUmsrcS9kdDd6RUJNT1IvRStIbFZC?=
 =?gb2312?B?TEdBcnBvdnlCNjgrUjdMTTBHTWlhVWkxamxpM0JyT3RkUnk0OGJ2ckU0MGpq?=
 =?gb2312?B?citIRUxVTGVUQVZMdUdveldFdnQrMXAyakZkVEs0bGZ2UlBIWUtTYnFBeDdJ?=
 =?gb2312?B?UURRVzdrbjdpWXFkbFlWSVZ5bkM0M291dG9MV3NNdHlwUEhtcjluZHJhajZn?=
 =?gb2312?B?bFdhWklXZWNsVXJJenllS3NZVHoyOGNLSm1YTUErNUlOV3JDRjlmRTZKUkxL?=
 =?gb2312?B?YkdITUJiK3FWVVhQOHloSlFhU2dtbFRLU2FpbENtTUhOVmlyVkZRTXk4T3RR?=
 =?gb2312?B?MjEvSldxb3NoNWlLekRDdlZYcFFlSndjWWllNUxRVGRtUm1icHQycUd2MnNV?=
 =?gb2312?B?d29Wc2NFdXhBQm9EeHgrVjlBNWxmdHEvRkJNTDlvOHptSmxYV1A1KzB5SU9t?=
 =?gb2312?B?UkVSbm1wY1lrKzZ3RnFub0FDQVpaNWEwZUU3SnhpTExscytlMEMrZTkvRnlz?=
 =?gb2312?B?SlRoY2RxWnNoc2NGVWo1Tzcxd1lmb1ZqL2FJNTgxRFg5R3I1WC9XNFVRUzZI?=
 =?gb2312?B?NW9LSWNvSCt5UXdGVGhxQ3JGajMyQ0xlbVJXYlhaK3JROGRnNTNuRTJnY0VL?=
 =?gb2312?B?dmNsVGxvRGR2dGY1bHBDaGpZa1FHT00yZ0YvTVUrd0toMnBhaTZEeVVXb3hu?=
 =?gb2312?B?QnZIRTdCakJWTER2ZlNobmppbEZ3MVYwa1VHMkhBRldQVUNYR25kdHRKQ3V3?=
 =?gb2312?B?T1ZjaElrM294TVFUeFU2YUF1Z1JpVDdUUTgwUHhZSGN6YWJFUGhiSnpVTDN1?=
 =?gb2312?B?UjFxaEd3aVBpNjRkOXNVT2tkR0djK2xydmxVelhXSDVKcUp2TTVCV2N2eTdJ?=
 =?gb2312?B?aEZmVDd3VjB2MWxLUmp6Y0hKYU1ZMHZSWTNTeDFtYnVDLy8xQlFkelBHVFo0?=
 =?gb2312?B?cjJTOGNqNXhYVElmQ2R5Q095ZU8wc3Baa05OeEFEZDNLazNXcjNMK2JkRExD?=
 =?gb2312?B?SGhxRDFlanZQZ2FMVnNWUWxpc1U5U3BEQ1h0WVU5L3VVMysvRlZkY3VRQXZq?=
 =?gb2312?B?LzJhUnNiTHdSV2lUK2tHdnk0bERDRWlpYm4vKzR1eWxTb2dDMVRaS0NRY1cv?=
 =?gb2312?B?S21Pcjg5Z3o1Y0lZc1RXMWxZUC90bzVjMmhTQWkzcnZySFhsZXh3aXlGbzRE?=
 =?gb2312?B?SFV6QThkbjNmdDQ1TURYc29wV3RZYm4yWjhPT3hEUHhYd2FtRktGYTJCbkds?=
 =?gb2312?B?SGZsT3RwT1ZUdnBjTmR6SGFjeU5xM1h5NHRkYjBkcEFSWE1RdjVHNmp5N1Fs?=
 =?gb2312?B?d0Qwb1BMUXBweFBFVVJvaE12d0RIZ2ZGRmhtb21RTnRKR3A5TEo5TUowKzBv?=
 =?gb2312?B?L2xsQnlKNTFKTmR5c1p4SDFDWVhVbEs4WS95TXhmYy8ydzFDNnloMCtaQlVs?=
 =?gb2312?B?R2xPUEJ6UXFWVHI4bkhta3E4QVptR3oxTU1BcnRiUzhZb3lISjNBd3J4WjZq?=
 =?gb2312?Q?lco8ckW9JMhciV7UTEiExRW0H?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8cab5ec-705b-464d-8d7f-08da8434710a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2022 11:49:59.5404
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: czuP+lKXWG6uJmAsskhAXX0I9BV6CajS8qlDJpIKxHGyGzLOMi0N0HEwDR9suyGJqxeww8Z00EJJ7DKPI+jvig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5499
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBGcm9tOiBQZW5nIEZhbiAoT1NTKSA8cGVuZy5mYW5Ab3NzLm54cC5jb20+DQo+IFNlbnQ6IDIw
MjLE6jjUwjE2yNUgMjA6NTUNCj4gDQo+IFYyOg0KPiAgdXNlIGNsayBidWxrIEFQSSBpbiBkcml2
ZXIgdG8gc3VwcG9ydCBiYWNrd2FyZCBjb21wYXRpYmlsaXR5Lg0KPiAgSW5jbHVkZSBhIG5ldyBw
YXRjaCwgcGF0Y2ggMS4NCj4gDQo+IFRoZSBpLk1YIExQSTJDIG5lZWRzIFBFUiBhbmQgSVBHIGNs
b2NrLCBub3QganVzdCBQRVIgb3IgSVBHIGNsb2NrLg0KPiBUaGUgY3VycmVudCBkcml2ZXIvZHRz
L2JpbmRpbmdzIHVzZSBvbmUgQ0xLLiBBbHRob3VnaCBpdCB3b3JrcyB3aXRoIHdpdGgNCj4gdXBz
dHJlYW0ga2VybmVsLCBidXQgaXQgbm90IG1hdGNoIHRoZSBoYXJkd2FyZSBkZXNpZ24uIElmIElQ
RyBjbG9jayBpcyBkaXNhYmxlZCwNCj4gdGhlIExQSTJDIHdpbGwgbm90IHdvcmsuDQo+IA0KPiBU
aGVyZSBhcmUgY2hhbmdlcyBtYWRlIHRvIEFSTTMyIGkuTVg3VUxQIGR0cywgQVJNNjQgaS5NWDgg
ZHRzLA0KPiBkdC1iaW5kaW5ncywgYW5kIHRoZSBscGkyYyBkcml2ZXIuDQo+IA0KPiBUaGUgZHJp
dmVyIGlzIHVwZGF0ZWQgdG8gdXNlIGJ1bGsgY2xrIEFQSSB0byBhdm9pZCBicmVhayBiYWNrd2Fy
ZCBjb21wYXRpYmlsaXR5Lg0KPiBCdXQgaXQgaXMgaGFyZCB0byBhdm9pZCBkdGJzX2NoZWNrIHBh
c3MsIGJlY2F1c2UgdGhlIGR0cyBhbmQgYmluZGluZyB1cGRhdGUgYXJlDQo+IGluIHNlcGFyYXRl
IHBhdGNoZXMuDQoNClJldmlld2VkLWJ5OiBEb25nIEFpc2hlbmcgPGFpc2hlbmcuZG9uZ0BueHAu
Y29tPg0KDQpSZWdhcmRzDQpBaXNoZW5nDQo=

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D43235959DF
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Aug 2022 13:23:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234387AbiHPLXp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Aug 2022 07:23:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232667AbiHPLXG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Aug 2022 07:23:06 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2086.outbound.protection.outlook.com [40.107.104.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC61A7E30E;
        Tue, 16 Aug 2022 02:47:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=llJZSnxyvCio9rftXIeOaDFOqQQJEx9z9k1kne7vOkk9SmGHJDgHFVqSdFvoZcojgDpzuXi91Q0cWC6D9pUSU1ZsTSA3GEpNPua6L2SERbWYpBLuGMR98UqEhu8IcU1caOG6M06QyD3cVy8FBoNnt7dLPxqUM4AKS6HSs7uMc6ivyvOmSSNeXBPyuhRAh0Od8hVGid/uEaTKtlXS0yDfEY7W6fiLlpcYgkajutVZNJqtIDa5wzsCzcXouNHGa1baYYtiQVBPYRreWiGlMAiBCWvHdapgB3MuAXSRBD4q5oyVtT09GAI3Khek5V9L7DLyW1n37dDiIqDROkkrJP/vsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pjJYukIbaAtHbVJuVzWW7eVl35LychZa09iSy7sJRzk=;
 b=kb9FP1wPqY6U3sBmbAuyVsMzugFZ9hUPN+Ia5dky01DYjmtf1ouAksPDUB7I+nigmnwl/MOOsOQrDnen18r78H7DcrDjDKcl3EnLWZm3vf/BAu2VEV8DM57faqiZByopbg/n69F8onYfmzNTUg1taFtw7xrgc8mhy2d93lBx+8J3Gv5QnWHSmA7A29jwDl9DyyFt2ItfOf5Bsgx3hT511vqwjll8+gRtwFDoiXHPOAH1SBiaiMaAMd23S+VgqwlvzKsj4Q8qRlCXkbr08tAaKY7Moc9JblR3Dvt1VXfgEzX+IYxSvlkkffHisSErlJZ/2xIqDtFYp70hiX8nyshulw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjJYukIbaAtHbVJuVzWW7eVl35LychZa09iSy7sJRzk=;
 b=ABUa9Cc2KJiW5QR0boG5MHh7l8pNruTjNT4c4D7Sn6kp+zx4OLBNSTXnfaUSR/CEUERVt3TTvHNbnYddhucB6Mwr1vuV9/cw4UxtxSRyZeFYK4OCZRgLytRF+suY8/7bjyP/hwUIPvq6Ul3tOXOO9knW0D5p4BjQJyZuPNYgjtA=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB8PR04MB7082.eurprd04.prod.outlook.com (2603:10a6:10:129::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Tue, 16 Aug
 2022 09:47:01 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%4]) with mapi id 15.20.5525.011; Tue, 16 Aug 2022
 09:47:01 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
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
        Clark Wang <xiaoning.wang@nxp.com>
Subject: RE: [PATCH 0/6] i2c-imx-lpi2c: add IPG clock
Thread-Topic: [PATCH 0/6] i2c-imx-lpi2c: add IPG clock
Thread-Index: AQHYrgSSA2Yxdic4lUaQqa4Ze2PTqa2rDHsAgAQXC0CAAeuegIAAK22wgAAS/oCAAABQ8A==
Date:   Tue, 16 Aug 2022 09:47:01 +0000
Message-ID: <DU0PR04MB9417187B9A8A52F4120E3488886B9@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20220812043424.4078034-1-peng.fan@oss.nxp.com>
 <f1add9c7-fc2e-a600-49a6-a6579f17db1b@linaro.org>
 <DU0PR04MB9417D62230578AC8CA4234F288689@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <039566a7-5c65-b2d8-7b45-c616863cb292@linaro.org>
 <DU0PR04MB9417EF15DD50EC51B4FBBCFF886B9@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <b630a007-2548-2196-a963-786c6a98b748@linaro.org>
In-Reply-To: <b630a007-2548-2196-a963-786c6a98b748@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d64e386-42e5-49d0-c6d2-08da7f6c44c0
x-ms-traffictypediagnostic: DB8PR04MB7082:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EngqbTm4c07ghbKA7meo/5dbwn3NDnFXS6RFQH0j/m6jwWSJFs0oVNgMUjYb1ckuiPF7Ztf2qjIeVZbwvsgt+dbmvro4V8sDxnXPVo+S+pBB+hg2fed2qWoVj1FOmc1EtRv67+bVgXUsJj2Xclohl3idi5iGbZdmoZyDtU5PzPNoo1g2elKYpOgKG1Rgs8iFcYoSOAPQLWA4PMwtuoMgcmIVkTCbDtFCHgBtMN7JKgkwQukJDYc6hPusMdoPOyx14Z4Ptht85zAX+8oL6/U1WScHlVgwAeRCYGrJ4jqB00bzgNZ15OO46CMXeH4gcVA2G3PIfwRGTXHqEf4Dwn7wkF4aa7igozM+8CO/0HZDWoZ1+tqKZTwHMhkKosKWSWncOjNvUNGIncXDxTo0t7siUv0R5xhlfMcweWqiLHKSH+/XOBlWZBg6K++ruWw+KPLYIlBL7m90mI/BoWhmN6Dgt0iG2EZBKAxnwvlheWh9kXTFi9x8pmxSNUC9CxmGhNMXBVJDfNotiru3s/FkeQm/j2K92Vf3bynvAu45U5BSfUgjloKPKaz/eTo+wNWIpP4PjSp0eeI3BoZkvOVFzbOKL+8Uihr0CfhqhC0adFXHWzhdwDScImVOdhdpNT2TpjO1ZoIsRL2kET7mOdjoH5R9+Z+QS095h3YlXgk28gpIKioDifomkhEJ3xil4/rgdgcHdN11cTiLmnFHMNyotmCRj9r0uAwTOEPXrLp6HWAaLfLbud499HH+AIwl7pjd0NSwyonlN52850greWHEXKc8bmDa41pqmS0tJEFSr4X1PJ8YXvmJURBSwtFmBn+w1YjM
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(366004)(39860400002)(346002)(396003)(44832011)(5660300002)(7416002)(53546011)(33656002)(7696005)(83380400001)(9686003)(6506007)(26005)(186003)(4744005)(41300700001)(478600001)(76116006)(52536014)(66556008)(86362001)(316002)(66476007)(64756008)(66446008)(4326008)(122000001)(71200400001)(2906002)(8676002)(38100700002)(66946007)(38070700005)(54906003)(55016003)(110136005)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aW9mVDJOVEhFYWFKakVsRkd5VjFmaGFsWElPZ0NpcHVKYnp3VzlqU3BEWG9v?=
 =?utf-8?B?N3VjL3Q0cHlDaDcwWjE0QkhnYTdUanYxVGdCeWdmOEZybFhFUWM2Mk5NYnIr?=
 =?utf-8?B?c09oYnFQKzEweTZLUWxLWHljdDdNUWRqSFF3L2ZEaFhocm4zdFpGTmh3R0V2?=
 =?utf-8?B?SEJlQnZiT3JkTTFtenF0YkxHbE9EdC91U0lzaXBlRHpBeFZ1YklPeGR6djZR?=
 =?utf-8?B?eFF5ZmF6a0dmcmt2bVpmeEU5TjhoenI2bGptblZnMkZzUnlZaGNhK3lpc2pR?=
 =?utf-8?B?VlBwak5zaE5FQ2N4UTczd3hlRkhYTVRmQ3FadmJ3NFllR1l1L21YdUF1TkpC?=
 =?utf-8?B?eXlJVTdjWEUweGhVaXM4NmdRUXA0R05kY0gzYkFlSSs4Si9SOHhnWFY2bGV6?=
 =?utf-8?B?VzFURW5UbzRSL3NQQjYyS3lpYitpYlFJY1A3L1JMdVZGSEQwZStuYURicU9F?=
 =?utf-8?B?RDlNbDNkZWdXRmRjd1QrNTdBT2t1Q1l4OEIvZ2ovci8zMkpJc29LZm9UUmVu?=
 =?utf-8?B?MzdyMmU4N0pEenpHMmk5Qzk0VFI2NUtQYVU0TVo0NldaL01Ydk5vNFRPVmll?=
 =?utf-8?B?blgxUk5tRXBBQ1FXUExDMEw1OGtyVFBDNHB1NWxTcnAxVXZhR0UreFdmSkxv?=
 =?utf-8?B?dkZnNzBiQ0QxQlFIQTN4by96RlI3K3RlM0d5dHNMODBKWVQxNGtqZVZSV3Fh?=
 =?utf-8?B?MWYxQVJYcUVhT3ozdDVxaDFlMm9EZHlWMDU3REhFTXEyM1N0TzkzSW5nMll6?=
 =?utf-8?B?aDFtL0dtSlYzSEVsNFZvZXE3dXJUcVZPMTg2dFhhMjhydWNHbTAwam1Odkxz?=
 =?utf-8?B?YTVaSXJDdW5wY1d6YnF4eGZ4NE9UQmdwcEgxYmhsejRHc0g5Zmgra0xkbHpJ?=
 =?utf-8?B?TmtkOGZyNUNySllTaVdXTDBKRGEwY2NtN3hVbTlDcW92ZkdwYmY4NHRQOGQ0?=
 =?utf-8?B?b1pNa2c2VUlYOFlCS2hwbHlqMjAvejhiZGgwMGdYWVlKMG1OOXgzVWpDaVYr?=
 =?utf-8?B?dW5tL0hmVHdxRng3bGJ5Y3RhbmZPUDFPVDJWRWU4Kzk5eFBFSHhjTGFwblFW?=
 =?utf-8?B?QklQMWxHVkxVV1RuRFpnZFhtYk1nL3M3REE0eHo0NGxhbVg4SVk3L0dUQ2I1?=
 =?utf-8?B?L1lZZi9TVGFlRWkyQzlBTUJLVjNSZlg3TTFvT0dXU250Ujl5MUdtbEYzcWlT?=
 =?utf-8?B?SmJ0QUdMM1FmbXFOdmc1SHI0SDIyTkFZY3ZteWZnZ2d2aGNKaHdQYXFSbEVW?=
 =?utf-8?B?dCt1UzlWRFFjdGVLMkhwVS9ndDJFemFqKzN5MnI3N09FVWpNeWNLRlQrblBl?=
 =?utf-8?B?TUx1WVlsWFEycFlXcnp2dGN3ajFUMUlYQUhTdyt1RHNhdEp1MXRxK25neXVP?=
 =?utf-8?B?TmVETG45U1NiSWhLZjdBRmNneVZ2TXh6aVBJa3BUYWNkMUhBdVZRSGM5OXFn?=
 =?utf-8?B?bVlRcDd0TGsyRVJ1V2Rtd0EwbkxEZWhpeG5HL04zYXd4VkZhdXdHaGs4aVQw?=
 =?utf-8?B?S1RjWi9Xc2ZrV0huZ1lqSVE0TTRmQ0E4cFY4Y2ExZEMzNzM1RmlTUWlCVjRC?=
 =?utf-8?B?b05MMGpWV1Rta3o5dzVEc3RtT3RzRE1XZmFBem56aFlvallyNVlON3R6KzRC?=
 =?utf-8?B?Qk9RMFlLQnhCM3M5NEZaNmROTDc4ejBJbVVIaWNFc3h0MmhUaVlrSWZnbkFu?=
 =?utf-8?B?Z1h2MDRUOVZraUZ0c2JQR3VhbmtHaFM3SDhYcWkzdllqQ1BrNTZWOVlLaU1W?=
 =?utf-8?B?NVFUaXFQV0ZFVXNaUWR2anUyb1lUcm1KcVJ0K0xYSTRrTjJjWHFObmZBdDVL?=
 =?utf-8?B?Sm5ySDJkNWJVTDBxMzFkRXRLL1hFRUs4SUFhRXhmWllxN2xDWEdwR3RIU0NB?=
 =?utf-8?B?VzR6RHdncWhpcnovODNaR21GLys0Z3ZRYnR4Ym1RejNMZ25qRytBcnN3amdS?=
 =?utf-8?B?TW5OVXNmR1pwM1NaOFBjMWdBSzVoVkVJMUFjSjJ4RDBzS0NYNGlYN0F0ZEQr?=
 =?utf-8?B?NjBLY1VUUDUxOEVKN0RmZWI2aVpjTWtRMjhTTnd0NDU5eFE5ajlGdWk0b2FC?=
 =?utf-8?B?RzBBV3VsMXVlc2tzazhNUzdZZmY4UkNKV2FlTlVNeC9aWXhtL202T0laWDc1?=
 =?utf-8?Q?GOnw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d64e386-42e5-49d0-c6d2-08da7f6c44c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2022 09:47:01.2557
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hel4Gqk2jFkSR1kRozWzLduqw9gmNXfqnwsgVKcQgcH+lMJ2MnliLUB7w7zLLWN0ou84qRIwcyyj3BIifMQAwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7082
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBTdWJqZWN0OiBSZTogW1BBVENIIDAvNl0gaTJjLWlteC1scGkyYzogYWRkIElQRyBjbG9jaw0K
PiANCj4gT24gMTYvMDgvMjAyMiAxMTo0MywgUGVuZyBGYW4gd3JvdGU6DQo+ID4+IE5vLiBGb3Ig
c3VjaCBwYXRjaCBBQkkgYnJlYWsgaXMgYWxzbyBub3QgYWxsb3dlZCBpbiB0aGF0IGNhc2UuIEp1
c3QNCj4gPj4gbWFrZSB0aGUgZHJpdmVyIGJhY2t3YXJkcyBjb21wYXRpYmxlIGFuZCBib3RoIHBy
b2JsZW1zIC0gbm9uDQo+ID4+IGJpc2VjdGFiaWxpdHkgYW5kIEFCSSBicmVhayAtIGdvIGF3YXku
DQo+ID4NCj4gPiBPbmUgbW9yZSBwb2ludCB0aGF0IEkgYW0gbm90IHZlcnkgY2xlYXIgYWJvdXQg
Im5vbiBiaXNlY3RhYmlsaXR5IGFuZA0KPiA+IEFCSSBicmVhayAiDQo+ID4NCj4gPiBBQkksIEkg
c3VwcG9zZSB5b3UgbWVhbiBkdC1iaW5kaW5nLCByaWdodD8NCj4gPiBUaGUgSTJDIGJpbmRpbmdz
IGFuZCBkdHMgdXBkYXRlIHdpbGwgZ28gdGhyb3VnaCBkaWZmZXJlbnQgdHJlZSwgSQ0KPiA+IHRo
aW5rLiBTbyBkdGJzX2NoZWNrIG1heSBmYWlsIGNvbnNpZGVyaW5nIHRoZSBQUiBtZXJnZSBvcmRl
ci4NCj4gDQo+IEFCSSBicmVhayBtZWFucyBicmVha2luZyBBcHBsaWNhdGlvbiBCaW5hcnkgSW50
ZXJmYWNlLCBzbyBvdXQgb2YgdHJlZSBEVFMNCj4gY29uZm9ybWluZyB0byBvbGQgYmluZGluZ3Mg
c3RvcCB3b3JraW5nIHdpdGggbmV3IGtlcm5lbC4NCj4gDQo+IEFCSSBpcyBkZXNjcmliZWQgYnkg
YmluZGluZ3MgYW5kIGltcGxlbWVudGVkIGJ5IGRyaXZlci4gWW91IGJyb2tlIGl0IGluIHRoZQ0K
PiBkcml2ZXIuDQoNClRoYW5rcyBmb3IgeW91ciBleHBsYW5hdGlvbi4gVjIgd2lsbCB0YWtlIGNh
cmUgb2YgdGhpcy4NCg0KVGhhbmtzLA0KUGVuZy4NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6
eXN6dG9mDQo=

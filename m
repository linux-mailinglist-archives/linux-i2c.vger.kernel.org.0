Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 061EA717D28
	for <lists+linux-i2c@lfdr.de>; Wed, 31 May 2023 12:23:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235256AbjEaKXH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 May 2023 06:23:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235277AbjEaKWf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 31 May 2023 06:22:35 -0400
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2046.outbound.protection.outlook.com [40.107.249.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7416E62;
        Wed, 31 May 2023 03:22:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PY79DsmSdqV9BJRX1yUDNgizO9P8iD+cYkuOan6Q6a5aWpSN0dNv5hzHVfFqiuCIuW6asaJhmof7dNjjIvjEikKK1qFWt3NF51zQDeI6zNWjbyrrR7s6yO4KeoXwTk9R0QxLzJVANbS/gar3nem1PwXKQdybBHT8qeqqladwNSZD9hJypuOMzYclwHA5HPXzyF//bsBS6OOmrFsDb9PHuFcFo7Jpj0fBGpvleP86ZFlVXdtwI1vDRNU14t+fA10T9u+dj2SZFR+EghIGiNyf8cpAEOBXUANAwBYNhv1L7EzBXMFlUk0sY6k0i54FaS7Thyp4sVSutpXO8as1i4GvtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tZP3LVrJEequLC2cZzUyxCv6nA/AOy3Ak6n6Sy7nFiY=;
 b=PWVXzgbNK4A8opIRrgGwVt8UDlLCZUTfGrNV6Az4IA9EbTaxMCkuSrE8lmrBUGFqP1ko+QbJ+FvZwUbg8N7LbEgAlL4Uin0DoiIXHxQD5c8yIIdnrBggYj5RVSdTq0BT6GmViffnIItZsi3Ypkv6iTmaXiRr6GufFJG3vUln54ieCcklU1uXzLIwYLXiKW69W/LhGpPE5FE20M8V3lVdtm/hVmAwAszj77BAR/jZuYf9Gjz+qsMXjiWRfxSWgHxLjwzY6iKNaqY13w33PwGMFxhoKanKzmy7xbHCc59jw7Aj1jhAgJkTbylQOuQx9+U1HmijedW5KGaBplArB3l/FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZP3LVrJEequLC2cZzUyxCv6nA/AOy3Ak6n6Sy7nFiY=;
 b=rSZqm6Sz4Qc/wNRJHUfi0+O6hEtwR8ZxkD+1nbs2o6NkQ4CVUgzKrQFdfXc71IzC9O8Sd8mGU/ew/fSQtL5MUjX0ABGlywrqpIEI5giOXvUA9zdZqIXfIM5jq7dsnf1s0s/GeEIGw+6F9CruFWqEIswNWGmZJ/Zm0AV2z9eXyrg=
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com (2603:10a6:803:57::30)
 by PAXPR04MB8256.eurprd04.prod.outlook.com (2603:10a6:102:1c6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Wed, 31 May
 2023 10:22:26 +0000
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::c2d2:71f0:4080:dbb4]) by VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::c2d2:71f0:4080:dbb4%7]) with mapi id 15.20.6433.024; Wed, 31 May 2023
 10:22:25 +0000
From:   Carlos Song <carlos.song@nxp.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "Anson.Huang@nxp.com" <Anson.Huang@nxp.com>
CC:     Clark Wang <xiaoning.wang@nxp.com>,
        Bough Chen <haibo.chen@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH 2/2] dt-bindings: i2c: imx-lpi2c: Add bus
 recovery example
Thread-Topic: [EXT] Re: [PATCH 2/2] dt-bindings: i2c: imx-lpi2c: Add bus
 recovery example
Thread-Index: AQHZkgDKNieDK5p0x0ufpk1V6aTcbK9y6mUAgAEgY/A=
Date:   Wed, 31 May 2023 10:22:25 +0000
Message-ID: <VI1PR04MB5005E43373DB10A9FD726AD7E8489@VI1PR04MB5005.eurprd04.prod.outlook.com>
References: <20230529074302.3612294-1-carlos.song@nxp.com>
 <20230529074302.3612294-2-carlos.song@nxp.com>
 <ed004607-5a23-564a-3185-a63af87783e5@linaro.org>
In-Reply-To: <ed004607-5a23-564a-3185-a63af87783e5@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5005:EE_|PAXPR04MB8256:EE_
x-ms-office365-filtering-correlation-id: cc46626f-89fc-4730-1f6d-08db61c0eda6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CzAABOSdBuSeVTWgliwWwiL5jS4Knkp4QaSa+NOhFillw+SSxGCO2T3hyzEpGDAdCfM7FbAPpcZ+UV2CrlZGDYsDIl15LHLZAV0V839hlwJB40Z5ruG8v2WFu9mMGe7U+tzvedB0c2zn6DfLwzVjXhVhpy6jaIl3iWNum5H0M5YwBu4d+OvzxLOwXiCSpzmXkUzGnh7Spc7SOHVr/Jpkq1Yl0yV8mpVEpvl2DoWXG6KzjlvcLXK8XpIuRT1OXx2ypSKifpfA/noGsi4W7UZleiM4jP8e2uAy0WCv7BfoWcp4Nh2HA5Cw6h9PrnjVMeXbI+gy8iUZERbZrBQ5eVg7QO1ZvlcbJylK7dTX3O4gJgI9QZvo/pn6UVD/eF93O5LrvlVsheHaZl/tqNwFHmDl2AU5w9U+1uFxcZfQ6NCI5L6NFXixxo9gzogWzG9qu3otffgkOPue+VpAGUtLA77HeGNAJVFN7AVPy/RxYgV6RJgXm5gUGbaqvDTGT3o7cIdzns474hYu2GBfK+SkABFLXzvkOO2drqV6vEFZYQpYp9pgtQK0fyue0R43wGiumSCTqjoRaTE8pqcje9PCXyEZzCjbhOjajijUf9zZlYfgZY2VpNE1LdhAFitCNObX8xsi/pH8VRAYFgCPDav6zSfk5A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5005.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(39860400002)(366004)(396003)(346002)(451199021)(44832011)(38070700005)(83380400001)(41300700001)(33656002)(7696005)(7416002)(186003)(316002)(53546011)(6506007)(9686003)(26005)(86362001)(55016003)(5660300002)(8936002)(8676002)(52536014)(2906002)(122000001)(921005)(38100700002)(110136005)(54906003)(478600001)(6636002)(4326008)(76116006)(66946007)(71200400001)(66556008)(64756008)(66476007)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dFFaSVJCR2o0WEpXZm1NZzBTa3E1aS9rdjVITzlPT2NZY1FmRktSREdFYlBj?=
 =?utf-8?B?MmlzdHUrd3RDM3NoSE5mZTJDUmgrQVZVMFVLNGxvUjZ4RHYwRUM5M0xMa3ZH?=
 =?utf-8?B?NmlabVpNRW1wa0NJUEZFbXBuMm1aMzlhc1pEbmUrWUhKT2JTT0QrVkplbFpo?=
 =?utf-8?B?cDhtK293WFNwdi9Jd2VqY1lYM2ZQUzRpaTQ2ME1aRlBuaGkxZjNXeGpNSFNY?=
 =?utf-8?B?R1NNZ2RiVW1naktWMkpTNWQ1WG5jejZHaWo2c1owWk5SY3IvMVRsdDZUbVRr?=
 =?utf-8?B?cFc1WldDd21jOEtFUGhkeWNvOEMydE9YNk9iYkl6OWtUWXJsVWsvbEViRmhv?=
 =?utf-8?B?TnhsVXRpOW1CQmxnSnZqMk40b0JpTUFQK2szdGxxUGhIUkIydUxPbXR5RGJj?=
 =?utf-8?B?cFNxQURtNWR0am9EQTdNM0h1cFNYRUVEZGYxWHV0Ymt2OVE0bG1zUFBjOGJO?=
 =?utf-8?B?TjBTbURuUkZXc1IwOU1ySStlZzliTGI5MkI0eGF2cy9OZDd1TXRYV2Z3b1RO?=
 =?utf-8?B?anpaTlA5OWppWkR0dXQzbitmY0FYa251dU9QSU9RQWJuOUpIV2RybFhZZi8v?=
 =?utf-8?B?b1NtcE5KVzlXZ05Wa2NXcjZ1TTFKM1pQZ2pCRWhpdjN3VHdRWHhpZjkrYmEz?=
 =?utf-8?B?ZmxEN2VWWHRHMGlRQzZEaHp0M3lkaHNOaHl6U0Nodk9QYWZES2JZcXJYWU4v?=
 =?utf-8?B?b3Brckd1NTkyVStWbVNFK2trZDhObnJCcllHUjhRbFBZZ1Q0MldudGpGdE1o?=
 =?utf-8?B?S1RJN1VXdmErV0JzbHYzNXUxUzZMQ2RVaVE3eEJqaEQra1lCZEtYQjN6Z0ZF?=
 =?utf-8?B?NEZjVDc4cGZZVmtqbTk0Y253d0tsVGdVNmsxUFR4azhQcWxlaWg1NE44WS8z?=
 =?utf-8?B?aGF6dkdwNXV0TXFJZGVqYU9FNjBTSm9OWDVTWnhtWmprUHAwWE9JUGFaTko2?=
 =?utf-8?B?ODlmSEQ5T2VBVStQb1pEU0RmNzR0WENVNXlLdkVQZ0c1VDZZdVFuakxmQ0Fx?=
 =?utf-8?B?NUg0MDVjR1NFbDZQcTRxMW1kMmNCNWQzV2MvR1lJZFdxb3l2Y1NmV1hFTlU3?=
 =?utf-8?B?Q1RDMTEwV0NScnlMWXRYY0VRZ01paC9Ka1FSbUJoZm1LbU9VeEZ5aC96NHA5?=
 =?utf-8?B?cXVYSW5EWGtwZmZZNWJwTXVqdHhGKzdITmVRYVdwb0h3blp6VU9NQU5rOXVz?=
 =?utf-8?B?YWhRdVRYdFc1blJON0FSNmpON1hFM0l3Z0VIZnZsZlFoaEMyZFFTRDhFeTRE?=
 =?utf-8?B?ajRpb0hxM08vY1pLV3V5Qm5DYkdiZzI4V1dSbzNmdjJNNWxBaHVHTzUwbHZN?=
 =?utf-8?B?Z1l4bW11eDhKTENZLzBUcW1WRkdxUFh5ZEhESTlrRktYVGI1Y21TRzE3bVFH?=
 =?utf-8?B?djdXUTZvTjBDa0FzUTBpUDJhbDdZaDVzSkd0ZzdPNkVqMGFjWW9FQ1YydHF0?=
 =?utf-8?B?eTdXcFh1a3BQMm5tUldEaGR0RWowbUpvYVFmZituaWF5My9aU1dUdU10ZUsz?=
 =?utf-8?B?ejU0ZmRxZ0g1Mktuc3BHNEZKc0ZMQmpMOCtyZTFNc2xCdzhKQUNDUVlQT2ND?=
 =?utf-8?B?SDVhMVpXUHgxYkYwSWVKSFlWWlRWSmxCeS9ycXpGMk94K3M1KzRubEIvWHFZ?=
 =?utf-8?B?eGx4VzRaNjIwNHdOOHk2MVJUaU1la3FBaVQrQmFxU1NNQjJuNjRLbkUydEJS?=
 =?utf-8?B?OFcvL3FaMWxJeXVraVdGLzBNL2ZYUW9oSkxRUnRWMzhWNW0zdnFYdzVDMm5v?=
 =?utf-8?B?MGNxODVybzlqV0dWMDhDejd1eG91ZS9NYk1ycVlwMnlJbkEzSUttYnpKRVhv?=
 =?utf-8?B?NmNVVno4WW5VbXl5c1FCcVp6aTk5NzkxMkg4RlVsTFo4YTh2WlhoYW9qRmdB?=
 =?utf-8?B?VDZHM3psdzVVbVF6cUdCRlY1UVF6S1V3Qkw2UUdKM0hEeTFMeVpEMDlkeERN?=
 =?utf-8?B?ZkFudzQ5N0VZQTZDbnFGR2l1ZDdQbG5CNDhMUjJ2aXJrK2J3a0p5TGpvQUVB?=
 =?utf-8?B?SmxBMkdqTURaSXJlUG5HMVVXaTkvV2ZFSmp3MjNUL1FHdzNJODZHMXhjQUJY?=
 =?utf-8?B?dVRvRlhoOHFGZkNJTExzOWVzbEl4aDdCV0pHbmlmWWpZTDNEWWRrM3pMOUxr?=
 =?utf-8?Q?PnSM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5005.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc46626f-89fc-4730-1f6d-08db61c0eda6
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2023 10:22:25.1330
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3eMU1jz4Rh9YNWDo/OrtMfx61bM00r6G3Mx2q2D/p+FXFSAMxkZ9YaLFsVFrxTcOkOf3njBZupjjgkkt6K7CMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8256
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGksDQoJVGhhbmtzIGZvciB5b3UgcmVwbHkuIA0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFy
by5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIE1heSAzMCwgMjAyMyAxMDo1OSBQTQ0KPiBUbzogQ2Fy
bG9zIFNvbmcgPGNhcmxvcy5zb25nQG54cC5jb20+OyBBaXNoZW5nIERvbmcNCj4gPGFpc2hlbmcu
ZG9uZ0BueHAuY29tPjsgc2hhd25ndW9Aa2VybmVsLm9yZzsgcy5oYXVlckBwZW5ndXRyb25peC5k
ZTsNCj4ga2VybmVsQHBlbmd1dHJvbml4LmRlOyBmZXN0ZXZhbUBnbWFpbC5jb207IHJvYmgrZHRA
a2VybmVsLm9yZzsNCj4ga3J6eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3JnOyBjb25vcitk
dEBrZXJuZWwub3JnOw0KPiBBbnNvbi5IdWFuZ0BueHAuY29tDQo+IENjOiBDbGFyayBXYW5nIDx4
aWFvbmluZy53YW5nQG54cC5jb20+OyBCb3VnaCBDaGVuDQo+IDxoYWliby5jaGVuQG54cC5jb20+
OyBkbC1saW51eC1pbXggPGxpbnV4LWlteEBueHAuY29tPjsNCj4gbGludXgtaTJjQHZnZXIua2Vy
bmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWFybS1rZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBTdWJq
ZWN0OiBbRVhUXSBSZTogW1BBVENIIDIvMl0gZHQtYmluZGluZ3M6IGkyYzogaW14LWxwaTJjOiBB
ZGQgYnVzIHJlY292ZXJ5DQo+IGV4YW1wbGUNCj4gDQo+IENhdXRpb246IFRoaXMgaXMgYW4gZXh0
ZXJuYWwgZW1haWwuIFBsZWFzZSB0YWtlIGNhcmUgd2hlbiBjbGlja2luZyBsaW5rcyBvcg0KPiBv
cGVuaW5nIGF0dGFjaG1lbnRzLiBXaGVuIGluIGRvdWJ0LCByZXBvcnQgdGhlIG1lc3NhZ2UgdXNp
bmcgdGhlICdSZXBvcnQgdGhpcw0KPiBlbWFpbCcgYnV0dG9uDQo+IA0KPiANCj4gT24gMjkvMDUv
MjAyMyAwOTo0MywgY2FybG9zLnNvbmdAbnhwLmNvbSB3cm90ZToNCj4gPiBGcm9tOiBDbGFyayBX
YW5nIDx4aWFvbmluZy53YW5nQG54cC5jb20+DQo+ID4NCj4gPiBBZGQgaTJjIGJ1cyByZWNvdmVy
eSBjb25maWd1cmF0aW9uIGV4YW1wbGUuDQo+IA0KPiBXaHk/IFRoYXQncyBqdXN0IGV4YW1wbGUu
Li4gYWxzbyB3aXRoIGNvZGluZyBzdHlsZSBpc3N1ZS4NCj4gDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBDbGFyayBXYW5nIDx4aWFvbmluZy53YW5nQG54cC5jb20+DQo+ID4gU2lnbmVkLW9mZi1i
eTogQ2FybG9zIFNvbmcgPGNhcmxvcy5zb25nQG54cC5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtaW14LWxwaTJjLnlhbWwgICB8IDE2ICsrKysrKysr
KysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykNCj4gPg0KPiA+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1p
bXgtbHBpMmMueWFtbA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ky
Yy9pMmMtaW14LWxwaTJjLnlhbWwNCj4gPiBpbmRleCA0NjU2ZjUxMTJiODQuLjYyZWU0NTc0OTZl
NCAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJj
L2kyYy1pbXgtbHBpMmMueWFtbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9pMmMvaTJjLWlteC1scGkyYy55YW1sDQo+ID4gQEAgLTU4LDYgKzU4LDE2IEBAIHBy
b3BlcnRpZXM6DQo+ID4gICAgcG93ZXItZG9tYWluczoNCj4gPiAgICAgIG1heEl0ZW1zOiAxDQo+
ID4NCj4gPiArICBwaW5jdHJsLW5hbWVzOg0KPiA+ICsgICAgbWluSXRlbXM6IDENCj4gPiArICAg
IG1heEl0ZW1zOiAzDQo+IA0KPiBXaGF0J3MgdGhlIGJlbmVmaXQgb2YgdGhpcz8gRW50cmllcyBz
aG91bGQgYmUgZGVmaW5lZCBidXQgd2l0aG91dCBpdCBpcyBub3QgcmVhbGx5DQo+IGhlbHBmdWwu
IEFueXdheSBub3QgZXhwbGFpbmVkIGluIGNvbW1pdCBtc2cuDQo+IA0KPiA+ICsNCj4gPiArICBz
Y2wtZ3Bpb3M6DQo+ID4gKyAgICBtYXhJdGVtczogMQ0KPiA+ICsNCj4gPiArICBzZGEtZ3Bpb3M6
DQo+ID4gKyAgICBtYXhJdGVtczogMQ0KPiANCj4gWW91IGRvbid0IG5lZWQgdGhlc2UgdHdvLiBB
bnl3YXkgbm90IGV4cGxhaW5lZCBpbiBjb21taXQgbXNnLg0KPiANCg0KU29ycnkgZm9yIGNvbmZ1
c2luZyB5b3Ugd2l0aCB0aGUgcG9vciBjb21taXQgbG9nIGFuZCB3aXRob3V0DQpmdWxsIGRlc2Ny
aXB0aW9uLg0KDQpUaGUgcmVhc29uIHdoeSB3ZSBuZWVkIHNlbmRpbmcgdGhlIHBhdGNoIGZvciBk
dC1iaW5kaW5nIGlzIDoNCldlIHNlbnQgb3V0IGEgcGF0Y2ggZm9yIEkuTVggTFBJMkMgYnVzIHN1
cHBvcnQgcmVjb3ZlcnkgZnVuY3Rpb24uDQpXaGVuIExQSTJDIHVzZSByZWNvdmVyeSBmdW5jdGlv
biwgbHBpMmMgY29udHJvbGxlciBuZWVkIHRvIHN3aXRjaCB0aGUgDQpTQ0wgcGluIGFuZCBTREEg
cGluIHRvIHRoZWlyIEdQSU8gZnVuY3Rpb24uICBTbyBJIHRoaW5rIHRoZSBzY2wtZ3BpbyBhbmQN
CnNkYS1ncGlvIHByb3BlcnR5IG5lZWQgdG8gYmUgYWRkZWQgaW4gdGhlIGR0LWJpbmRpbmdzLg0K
DQpBbmQgYWx0ZXJuYXRpdmUgcGlubXV4IHNldHRpbmdzIGFyZSBkZXNjcmliZWQgaW4gYSBzZXBh
cmF0ZSBwaW5jdHJsIHN0YXRlICJncGlvIi4gDQpTbyBtYXliZSAiZ3BpbyIgcGluY3RybCBpdGVt
IG5lZWQgdG8gYmUgYWRkZWQuDQoNCkkgd291bGQgbGlrZSB0byBrbm93IHdoZXRoZXIgdGhlIGFi
b3ZlIGNoYW5nZXMgYXJlIHJlYWxseSB1bm5lY2Vzc2FyeSBhY2NvcmRpbmcgdG8gYWJvdmUgY2Fz
ZT8NCk9yIGJlY2F1c2Ugb2YgdGhlIHZhZ3VlIGNvbW1pdCBsb2csIHlvdSBhcmUgbWlzbGVkIGFu
ZCB0aGluayB0aGF0IG91ciBwYXRjaCBpcyBub3QgbmVjZXNzYXJ5IHRvIGFkZCBleGFtcGxlcy4N
Cg0KSXMgdGhlcmUgbm8gbmVlZCB0byBhZGQgc2RhL3NjbC1ncGlvcyBwcm9wZXJ0eSBvciBubyBu
ZWVkIHRvIGFkZCBtYXhJdGVtczogMT8NCldlIGFsc28gZmluZCB0aGUgc2NpLWdwaW8gYW5kIHNk
YS1ncGlvIGhhdmUgYmVlbiBkZWZpbmVkIGluIHRoZSByZWY6IC9zY2hlbWFzL2kyYy9pMmMtY29u
dHJvbGxlci55YW1sLiANClNvIGlzIHRoaXMgdGhlIHJvb3QgY2F1c2Ugb2Ygbm8gbmVlZCB0byBh
ZGQgdGhlc2UgcHJvcGVydGllcz8NCg0KVGhhbmtzIQ0KPiA+ICsNCj4gPiAgcmVxdWlyZWQ6DQo+
ID4gICAgLSBjb21wYXRpYmxlDQo+ID4gICAgLSByZWcNCj4gPiBAQCAtNzAsNiArODAsNyBAQCBl
eGFtcGxlczoNCj4gPiAgICAtIHwNCj4gPiAgICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9j
ay9pbXg3dWxwLWNsb2NrLmg+DQo+ID4gICAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJy
dXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPg0KPiA+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdz
L2dwaW8vZ3Bpby5oPg0KPiA+DQo+ID4gICAgICBpMmNANDBhNTAwMDAgew0KPiA+ICAgICAgICAg
IGNvbXBhdGlibGUgPSAiZnNsLGlteDd1bHAtbHBpMmMiOyBAQCAtNzgsNCArODksOSBAQCBleGFt
cGxlczoNCj4gPiAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMzcgSVJRX1RZUEVfTEVW
RUxfSElHSD47DQo+ID4gICAgICAgICAgY2xvY2tzID0gPCZjbGtzIElNWDdVTFBfQ0xLX0xQSTJD
Nz4sDQo+ID4gICAgICAgICAgICAgICAgICAgPCZjbGtzIElNWDdVTFBfQ0xLX05JQzFfQlVTX0RJ
Vj47DQo+ID4gKyAgICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IiwiZ3BpbyI7DQo+IA0K
PiBNaXNzaW5nIHNwYWNlLg0KPiANCj4gPiArICAgICAgICBwaW5jdHJsLTAgPSA8JnBpbmN0cmxf
aTJjPjsNCj4gPiArICAgICAgICBwaW5jdHJsLTEgPSA8JnBpbmN0cmxfaTJjX3JlY292ZXJ5PjsN
Cj4gPiArICAgICAgICBzY2wtZ3Bpb3MgPSA8JmdwaW81IDE0IChHUElPX0FDVElWRV9ISUdIIHwN
Cj4gR1BJT19PUEVOX0RSQUlOKT47DQo+ID4gKyAgICAgICAgc2RhLWdwaW9zID0gPCZncGlvNSAx
NSAoR1BJT19BQ1RJVkVfSElHSCB8DQo+IEdQSU9fT1BFTl9EUkFJTik+Ow0KPiA+ICAgICAgfTsN
Cj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoNCg==

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C3115BF0B6
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Sep 2022 00:59:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbiITW66 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Sep 2022 18:58:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbiITW65 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Sep 2022 18:58:57 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2048.outbound.protection.outlook.com [40.107.21.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0606571BCE;
        Tue, 20 Sep 2022 15:58:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l6e7vSm/Khlj6XUyQ7hAHq+Oc1fTCknXuwFU7m6nnnCUWMCvxRqxX9oDIRYvGygJKsvuC2SblRmWTgimet/UsLF3iwCd3uZAOPcYwv5tLMeWIQS/iN/u2URiBk1K6/eLQIDSEWD3JN6OSrSHeBLd7lHq6vV+8jEbtYqgiuUarkH1cBOmevuNxzadab7rTsTjf6AhZAlBy1PDHv0ZVTo3yb2ht2nw3K1bX40BrhFNApUpXLn/nNYV9KWXS0EltYNCuNXgn7372cHfKJNFU8NEOvNdsa3Cwnn6JNVJ9BGTrUJAM/ttf4DIFdfq809nUmVk9YZWIQQlqGJZ2wa2VAdCHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o6jOAJSvD2t8ncU5jYQlpQSupgN7pLDksxcccDHg1sA=;
 b=AaRv6IIrMDcuooW0Hz6Axx69ISo3Dy3/BZXu5GvUXAZKrAaG/rcOHvb5KZIywLyylD1KJW8qjxnNWSCNmy5GetIlTJaKSfACS5sANPFYxl2AZWOVsrSl0Q/U44vyTZ7k+ZnCgxt4jTiKkihg7G7VtTGF76oxJ52dV5cuGSbu8rGdqUPQ2/YCUhVP6yTEZeLNPpFZzMIxJ2bdtLfjOK8+pJCK4NRRKJ09+P7ILwBCIFAmBEdCYoLNwygwuSRsfPOQSYRWh2Dpls0qtVZ1pMdZiv5ZzQy8krgGUlR+SMMTJSxicRSSK98RUuob565IvYAn2cuqtj6U72YjZ2GTjNcDvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6jOAJSvD2t8ncU5jYQlpQSupgN7pLDksxcccDHg1sA=;
 b=sxD86LW3+7bSUf3rAMiul5Ihk0AexX+cFtDhTpzIlso8Ir+hDbEtJlFJq7BAisdDeAg3ic+2I2YF8nHBFWIzM6lmPaB2BINrVzVTGxdgVqfXLkLTxcLaSpGK5EhYFumRaZXbE5BGwrrQOr6ywn4zOsFtgclYS8IvL1sb1j9xaVo=
Received: from DBBPR04MB6298.eurprd04.prod.outlook.com (2603:10a6:10:cf::14)
 by DB9PR04MB8139.eurprd04.prod.outlook.com (2603:10a6:10:248::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 22:58:53 +0000
Received: from DBBPR04MB6298.eurprd04.prod.outlook.com
 ([fe80::2a3d:6135:5a27:7044]) by DBBPR04MB6298.eurprd04.prod.outlook.com
 ([fe80::2a3d:6135:5a27:7044%6]) with mapi id 15.20.5632.021; Tue, 20 Sep 2022
 22:58:53 +0000
From:   Leo Li <leoyang.li@nxp.com>
To:     Robin Murphy <robin.murphy@arm.com>,
        Sean Anderson <sean.anderson@seco.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Vinod Koul <vkoul@kernel.org>,
        "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Joy Zou <joy.zou@nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [BUG] ls1046a: eDMA does not transfer data from I2C
Thread-Topic: [BUG] ls1046a: eDMA does not transfer data from I2C
Thread-Index: AQHYzHaN1LN2T6ZYUU6MBMqKWnOJd63oGIuAgADVpqA=
Date:   Tue, 20 Sep 2022 22:58:53 +0000
Message-ID: <DBBPR04MB6298A5820CEDC04B37E711BE8F4C9@DBBPR04MB6298.eurprd04.prod.outlook.com>
References: <38974aab-06d0-f5ff-d359-5eedd2f3bb3e@seco.com>
 <5ef51421-e6b0-edd5-6b6e-439b47b794a8@arm.com>
In-Reply-To: <5ef51421-e6b0-edd5-6b6e-439b47b794a8@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBPR04MB6298:EE_|DB9PR04MB8139:EE_
x-ms-office365-filtering-correlation-id: 0efdfe36-5881-4187-d1b6-08da9b5bb090
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lBJsoJLsFmCDdEqq6UUm/ptJKTMKJpy02G6Nskw5CT2eD8Gt/3lUAvXYNUiQvONWSD2IYTOD51sPCfatUqhArPckcaL90fU5dARCDs6eKAhVwhgiKvWh2bcVPEoAVAVej+mvnBRwCqDX7IqBG6A0XcKXlALwyUNhEOCEK45JJQNDsJDluCryjIqmY7Nz6BpiEL9GMnTBLg4NfaNoT44VyKfLUSn/jjDOJ4HeI2QF5m0ynlLEguhH9zptC8RwtciMWRU50Er7lUHEXlWx291WZd3PZ+qu3D0Imo9H2FjwJEfgV3To/FphiJrmZSNZu5Pewu2R8KUbax3u3iR7CyZD4vi8vShTLNxKvvlWNR2xKQ4e+esNGjgU09WJVYo4JSxSCisT/mIeTeWbxwO8nitvSNyF7PzuFYljcOQ3H8YLi3KD5BwpkKvyz0ddFYyeY4PQUVeupoxGdHG7I3burWm0CA8csdFYCweG/OET818QSmkjRezDIYeJ3s3U8eNT4eCmvwlvM8sgnXlRJfn5wneKZbqhDTu3HAVvbAwhIDiC9NBxq5PsVK9tBSBP7Auswtd2c1YWxfWVPYQ/5/IXNtmHLz59tSG/WkVOyIMx8OuHDU0q7Pkm5/atP9T6CtugzG8BcqZMlc7pjKUBlxCjrcymp+Wm+tR+j6gaWocHP3zbcWyw2jeL+1/yssYBm2KLB9CXdD1P1wC60+ljNNC+3YaF38T8CG0//UmTnoZbfVbkD5803p4pU41r36VvtNR1Um0YGwBAh3Dgn1sPQBcqfjElww==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB6298.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(366004)(136003)(39860400002)(376002)(451199015)(33656002)(55016003)(2906002)(122000001)(316002)(38100700002)(4326008)(8676002)(5660300002)(66946007)(76116006)(66476007)(7416002)(66446008)(64756008)(66556008)(110136005)(54906003)(86362001)(83380400001)(9686003)(186003)(478600001)(38070700005)(26005)(8936002)(55236004)(6506007)(52536014)(71200400001)(41300700001)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UjhNVk9SNDhCRXd4YkxrRnpqZ0RqOTdTT09KTG5vTFBPS2FwVEU2T0thcHhY?=
 =?utf-8?B?OWtPUThWWktrVXYwWHo4bEM5cmhnYXZ5c3RzcEkvaVRhSnc3SVdXWWdmS1JQ?=
 =?utf-8?B?bElpTXdRQW1HWGhkS1V6blZlRWl2cWhLRmQ2eXRHMFcySVVVYlhmczNwK2Rq?=
 =?utf-8?B?R3J1Y1JudzVGN2hWeVN6TG1IcnhIU09DL3BvcWZWekN0MW1TYkJBOFZ1REhJ?=
 =?utf-8?B?YWMzTUY4OTZOV2pQTDJjb0R5MzZPbkFkVjVhL3NBMElYajg4T2FCRnhNV1du?=
 =?utf-8?B?T3krcDhhSzB6dEVOZ0N5Y2hsWlZnTG00UStBUGFTOWlYbjV2TFVoTk5kamFk?=
 =?utf-8?B?RUtPSFRSTEFQRVg5a1hVL3o4SmtqaTZmZWV5eWlzQXNwdXFVSU1SRHIyZHNw?=
 =?utf-8?B?cGh0SDMwZmpEaTgrZ3FxcVBXOGhXaGNsZkFEVTNxWG54eVhNVzJjZmdjdU1H?=
 =?utf-8?B?bW55MnJza3RUTGZiUmg1dE1uM0xlNFZGd2YrRDRETkRVTFZQRXdtZllCYUtj?=
 =?utf-8?B?L1ArWlRjMjB1dXhDeHhpQ2RDZlhQSFZuRHoxUW9zMlY5TXhLSW9HcTAvbVQ3?=
 =?utf-8?B?NmpLWkhGeFFUaHk0RGt0OUVNb1dxd3FPVzlqc01Ta2NWSUtkR0cvNlZ2bEli?=
 =?utf-8?B?MTNvbW5zSmZZajJRdjFrakhEU3lveXZVN0Q1M003MU5ST2FKdVlSUWZJend1?=
 =?utf-8?B?a1FLRmtVNHdrcnN1a0E0SHJRa1dBZXVJN0NTMU9YMzlYL1l5cEpYU1ZqTHBD?=
 =?utf-8?B?VXpIazJ1WFlaUzI5MURYTG1KUEd5cmZZL21YN0NsL0w5L1ZmUkpYYUF1dHUr?=
 =?utf-8?B?R3VTdnUvcnZOK2xUVzd6YWhTUk1QbVZqNTdxbkdEdWFqRVgvSU9ScXYyWFkr?=
 =?utf-8?B?YUcramc4ZlpzTXhhSk4xVDhZa3pkcFg5VWVXZThFUnpUTlpKSEE1amduZ0Jw?=
 =?utf-8?B?aHNpY05Hc0NwMzc4MjlqdjdxSW5MVDB6T3FJUXA0K2w2ajVaWG5NUDlwYVRZ?=
 =?utf-8?B?bkxNcm0yRUM1VWg3KzBVUVRGMjNJUnlkWGJMR1Y4blhTVXQ3aFRQa2VCeXdM?=
 =?utf-8?B?MVladHdqbVpBNlMvVGVZOGNqU2VJNTNlTW1LWUhTYnRaVXd3WjlmWElxZ2NZ?=
 =?utf-8?B?eHV4ZWxqenFndDJnQjdOeXhqRGJWaVgxZE5tNlUxZG1hR3IzRVhPZS9WODJz?=
 =?utf-8?B?bW5pb1ZmazNMTERDZXE2YTkvcmhreEpUWnprcTBVVDJVbVdvaytHVy9SUlZz?=
 =?utf-8?B?bGIvQzhyUVd2N1c4Tys1YmhxeG40WFFvNGxvNVBIdnNxWHFVendWK3BaZEkv?=
 =?utf-8?B?OVFibVV1L0dpMysvQ0R5VTY1cC8zWTZvQWlXejc4a2xrelBxdytGaHRzQnpl?=
 =?utf-8?B?bkIwTEM3eGlHRzNjSmVQY2xSY01LakU3TVVsWCtKcnkvREhhQ0VjeCsrUUdk?=
 =?utf-8?B?ZkZ0Zy91VFI2aXFKYWtFZHREdjUxTldjLzM3K0p6ZW1mVUpBaUV3akRmOUk4?=
 =?utf-8?B?RXVQaktXaDNvdjdyWWRFNkF1Mmg5Mm0xTmMrT1F2VTZrQmRtaU5UU3hzc2RO?=
 =?utf-8?B?eEZkeXFUb2NHZWE1TWVSbUszb3BvMnJPNnFoVjhSdnhJSFBLTmtyUFFBWTUw?=
 =?utf-8?B?UnFXSjg2aG5iajE2NHVUT3lrU3FxWHFCRmQ2bGpvSC9BWmhXVVE3VVJZUFdU?=
 =?utf-8?B?akxZWGltWWh6dFp5dTFhbFQ2dVc5cVlxQzY2YnIyUHE5OVFHQUpkaGlIRkI1?=
 =?utf-8?B?QUQ4dFVBaTBWUjNwYTdaUU1uM0U2Uloxa1pZYnFnS0NXV21vVlRYaVVPUnBI?=
 =?utf-8?B?aW5vdWd5Z0Zaa2VaNS82K1ExTFdWUXhkLzRWRGNtZzI5OXEreHhkL0c2c09Z?=
 =?utf-8?B?S2ErQ09wR01yRzNkdi9FZ0hnOE5Zemp3S1NmbWpJbVEzTVdzcWxzNUF6Rldq?=
 =?utf-8?B?QVlCZHBIdXZUS1dRc040QUJhb1FZNUJ2Z3RvUlgzSFliUHlUNHpmbmt0bVRM?=
 =?utf-8?B?bEdUMkxNY3AvUnAzSmJOandORDlWOVMwUExnWjc0S2ZjM3JXSkJiWXMxOWEz?=
 =?utf-8?B?VlhLSDNYZ0N4VkpXeVBTR0hjak9nK1NVQlRJZGE2VUpBVXhNMUZFR2RDN2pL?=
 =?utf-8?Q?oe8W7edpF37Zspv2HjoeDdTvj?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB6298.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0efdfe36-5881-4187-d1b6-08da9b5bb090
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2022 22:58:53.2487
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OQtgRf3581nOVYO4ny5KCjf4ryDmTCnBo3CCBWXEjMv73Gg72Z7c4rbiLMKFEyDCfWceHCjZsYWHoGn90EhzLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8139
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiA+DQo+ID4gRGVzcGl0ZSB0aGUgRE1BIGNvbXBsZXRpbmcgc3VjY2Vzc2Z1bGx5LCBubyBkYXRh
IHdhcyBjb3BpZWQgaW50byB0aGUNCj4gPiBidWZmZXIsIGxlYXZpbmcgdGhlIG9yaWdpbmFsIChu
b3cganVuaykgY29udGVudHMuIEkgcHJvYmVkIHRoZSBJMkMgYnVzDQo+ID4gd2l0aCBhbiBvc2Np
bGxvc2NvcGUsIGFuZCBJIHZlcmlmaWVkIHRoYXQgdGhlIHRyYW5zZmVyIGRpZCBpbmRlZWQgb2Nj
dXIuDQo+ID4gVGhlIHRpbWluZyBiZXR3ZWVuIHN1Ym1pc3Npb24gYW5kIGNvbXBsZXRpb24gc2Vl
bXMgcmVhc29uYWJsZSBmb3IgdGhlDQo+ID4gYnVzIHNwZWVkICg1MCBrSHogZm9yIHdoYXRldmVy
IHJlYXNvbikuDQo+ID4NCj4gPiBJIGhhZCBhIGxvb2sgb3ZlciB0aGUgSTJDIGRyaXZlciwgYW5k
IG5vdGhpbmcgbG9va2VkIG9idmlvdXNseQ0KPiA+IGluY29ycmVjdC4gSWYgYW55b25lIGhhcyBp
ZGVhcyBvbiB3aGF0IHRvIHRyeSwgSSdtIG1vcmUgdGhhbiB3aWxsaW5nLg0KPiANCj4gSXMgdGhl
IERNQSBjb250cm9sbGVyIGNhY2hlLWNvaGVyZW50PyBJIHNlZSB0aGUgbWFpbmxpbmUgTFMxMDQ2
QSBEVCBkb2Vzbid0DQo+IGhhdmUgYSAiZG1hLWNvaGVyZW50IiBwcm9wZXJ0eSBmb3IgaXQsIGJ1
dCB0aGUgYmVoYXZpb3VyIGlzIGVudGlyZWx5DQo+IGNvbnNpc3RlbnQgd2l0aCB0aGF0IGJlaW5n
IHdyb25nIC0gZG1hX21hcF9zaW5nbGUoKSBjbGVhbnMgdGhlIGNhY2hlLA0KPiBjb2hlcmVudCBE
TUEgd3JpdGUgaGl0cyB0aGUgc3RpbGwtcHJlc2VudCBjYWNoZSBsaW5lcywNCg0KU28gdGhlIGNv
aGVyZW50IERNQSB3cml0ZSBvbmx5IGdldHMgZGF0YSBpbnRvIHRoZSBjYWNoZSBub3QgYWxzbyB0
aGUgRFJBTT8gIE90aGVyd2lzZSBhIHJlYWQgYmFjayB3b3VsZCBnZXQgdGhlIHVwZGF0ZWQgZGF0
YSB0b28uDQoNCi0gTGVvDQoNCj4gZG1hX3VubWFwX3NpbmdsZSgpIGludmFsaWRhdGVzIHRoZSBj
YWNoZSwgYW5kIGJvb20sIHRoZSBkYXRhIGlzIGdvbmUgYW5kDQo+IHlvdSByZWFkIGJhY2sgdGhl
IHByZXZpb3VzIGNvbnRlbnQgb2YgdGhlIGJ1ZmZlciB0aGF0IHdhcyBjbGVhbmVkIG91dCB0bw0K
PiBEUkFNIGJlZm9yZWhhbmQuDQo+IA0KPiBSb2Jpbi4NCj4gDQo+ID4gLS1TZWFuDQoNCg==

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C36F773B7D
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Aug 2023 17:52:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbjHHPwB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Aug 2023 11:52:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230197AbjHHPuY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Aug 2023 11:50:24 -0400
Received: from CAN01-YT3-obe.outbound.protection.outlook.com (mail-yt3can01on20731.outbound.protection.outlook.com [IPv6:2a01:111:f403:7053::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9123C4C29;
        Tue,  8 Aug 2023 08:42:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C/2ewKuzQyArXjdkFN6s99F+ib4dyoFBF3Av9NucbnKJ6PU1jBeTOwrbDm+oGEBuLGm9wvGD4+cDSNcgqxp+TA9kHkdJTVUYZgDHJmiiTFq1OWnOMmizuqS39pyJIeKv3bDNgoXfEENthDgqCI5ymJX670TXBBDb/YyRwJKkqEVthAAXTRKBedrreg9XoaC12e5Ked6mW20UmE4uaM465EjzXgrAaYV1SerkT3vqCirhI/1LGPxSAraHFzlE5AcMXGEnwk/PU76YpWIJ+gainJPyMm0BCiNEQL/lH6Dn4Am9hdQKSjXk6LwWKXJRP0aU1oYNN3X6CEHE4cY4SJvGzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UENp+LMq4IrLpNmP08FNrqC+M9zI6JJa7zGsFkkNXwA=;
 b=B1McEy8vt2097x3BzJqy3F5mxzbyiN7w2Xa2hvkZQFM9I3lmKSOegnERGWCjKZDEGK7haR6wBDLTIY2qynUv5KlA2xtvO38Dl20B0zmsmc6Ukpwhbk9e7W3ssD6EM8lmyEVq9AT79iriLlPkgp26F/EdxTdAj/qkglpamVgYbLbjpvC3wcj/3qMklVCYd9PXm8uCCEktd91y0TBrNfjDic0QvPEiPMYXOF8KuDxfdziTg/PJyNSdBpLsFVMWVw4Q8jKZaf4MGy+Bg/xq9Qyxqfgwnq0/oi4ipKx5uFe9RRN+/xzrKfC8iGyszKmqQGHKu49O0dkgEDC+Cl85qDRJuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=connecttech.com; dmarc=pass action=none
 header.from=connecttech.com; dkim=pass header.d=connecttech.com; arc=none
Received: from YT1PR01MB4124.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2b::11)
 by YQBPR0101MB9119.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:5e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 12:42:28 +0000
Received: from YT1PR01MB4124.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::7fe0:2f38:7134:6e7d]) by YT1PR01MB4124.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::7fe0:2f38:7134:6e7d%7]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 12:42:28 +0000
From:   Parker Newman <pnewman@connecttech.com>
To:     Akhil R <akhilrajeev@nvidia.com>,
        Andi Shyti <andi.shyti@kernel.org>
CC:     Laxman Dewangan <ldewangan@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: tegra: Fix i2c-tegra DMA config option processing
Thread-Topic: [PATCH] i2c: tegra: Fix i2c-tegra DMA config option processing
Thread-Index: AQHZxi1X/DFR5Xjq7k2794y4/1T6O6/asLOAgAKln4CAAwjnAA==
Date:   Tue, 8 Aug 2023 12:42:28 +0000
Message-ID: <eb8ceb2b-3a23-8cef-91b5-ef416fbc3594@connecttech.com>
References: <fcfcf9b3-c8c4-9b34-2ff8-cd60a3d490bd@connecttech.com>
 <20230804215631.wc22pkyetsyyt5ye@intel.intel>
 <DS7PR12MB63358D8D877BBC81BF94C53AC00FA@DS7PR12MB6335.namprd12.prod.outlook.com>
In-Reply-To: <DS7PR12MB63358D8D877BBC81BF94C53AC00FA@DS7PR12MB6335.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=connecttech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: YT1PR01MB4124:EE_|YQBPR0101MB9119:EE_
x-ms-office365-filtering-correlation-id: b18603a7-a69c-4d98-77c2-08db980cece0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XzvQSpGM7bIM8ZDH7cpF4N3TrxW75rjh4pKMWi3yBPONsJxHnc779OLtfzKU1VCOblzVXhikGcgSftbpEpB0hT5LnnTKCNLmgn7giANIMHo98SAiEV9tipRzx46KQvjhO4r4Ia5Cq/lmv2pmerzsVoB/6ny0tv9f0/bXJ07X0EWm+qZ2XEiPCIKeuSDK6OTKJEKJxg7AphpeT1OklzXN/C57eTZwWDqd4HkcGdaA/tc3mePrfukYmhnySJzJE2b8DfibOsGUYMbKTgTPuBgF+8uA8fE7dz0bokqDRI9jQfc04R5r+2RniQ4AjkoN5kfXxb/9yNIZoIj+ZjN30FG92AagKcnLf0d0qq84IP4lZs5BjB8VXZsV7NMCTE9plVFYPWRnWlFbFNKWMj6l1srDk0NwkJI8GWKzEDWWld6Isf/eLrpInULuVT3vgqcpPa1eUvCzJXa1vQFsl7XAp+SGbmPHyR6cz1ukdmFuqTIGvWQvW8xQ3cs8wnCIW5hvM600/GVw6AwxDdydgx+N1aNRpilNvfsmCz4EOKx/wBzUulaxKzrOK/J0ciQFXQPo1RmvYuWt18V+pcVpbC5pg4hvtRM/x3vEwKVhpKIZGb2smPP+XzU9I+A1heGXIJjueyaSn9h2bOxjfY0clvkC/AJ19Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB4124.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(346002)(366004)(376002)(39840400004)(451199021)(1800799003)(186006)(71200400001)(2616005)(6486002)(316002)(86362001)(478600001)(6512007)(31696002)(122000001)(26005)(36756003)(53546011)(6506007)(41300700001)(5660300002)(8936002)(8676002)(38070700005)(110136005)(38100700002)(4326008)(54906003)(2906002)(76116006)(64756008)(66556008)(66446008)(66476007)(66946007)(83380400001)(31686004)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U21Ed1hBQm5KOGJ4ZTNsRU13VFFIMmxFamxWT3dqbkY1dU9kUmFVanJGNGV4?=
 =?utf-8?B?bDdLb05Qb2xoNnd0ZW80RjNEZHlETHNDb3F0ODdNd3o3V1F1WjRJdjZEVll1?=
 =?utf-8?B?M1dmRUIyc3Q2OGxyejRvWHZrTzVkU2lYNFJKdmwzU1RrQUhxMTRvRjlQd0pL?=
 =?utf-8?B?QzRvT0tWd1pMOWt3S0c0VDN3UE9hbm9DZW8yUlhnNnFBbU0xYnBOeTFpaVU0?=
 =?utf-8?B?cXpRUjRNVVRmc0VQZzlTalVwbTV5aHFoT2xCUHFzcDlMUDl5UjQvTXRWRDIz?=
 =?utf-8?B?dUkzclE1akQ0Yy9nVkV4UEJiWUdDbkEydGNJbXNNTGV4cS8ydVhaT0IxeSt4?=
 =?utf-8?B?NFpSaHhNK0x6QkVoVjhFLzUzOWE5UTFMZDVWZWFZUjREVW10SS8rZHJldERG?=
 =?utf-8?B?U3BRVWhsUTVmQlFHbit6WVdIZ0s1cG9wMjluRk1TbWZrVmY4anZpbFVXOW9E?=
 =?utf-8?B?TnJxZWpkQjdLSENRcXJjNWFaWVl2UTZodWJpeFhNOCs5RlQzQmpQUXYxVVRi?=
 =?utf-8?B?NW1aNC9oVzJnbGFKcjRmSUZzbzJYWWtyNnBFbUpXMTZRQUw2bVpCb3M2QzAw?=
 =?utf-8?B?K003elc4bUZqVm5tVzgwR0lqVG5uVEw4OGFnZWFkVkNZMUhkbUFNQjE2NGE1?=
 =?utf-8?B?ODFRVGcvbjBJQTVBMVNma3M3OUNxQTQ5dmFxYjVzZk9Ga0JmWkxYaERHQmtv?=
 =?utf-8?B?aVU1bk1KS2tsTEg0YzlRbzNQWW9xT0xLcUEvRjZVSkVJZ2wramd6eTREWXBB?=
 =?utf-8?B?ekN1bUM3UEJiclNxSHp5eHRBQk44MjVKQnd5YXE5OGVxSDFRZzl5RGE5R1ho?=
 =?utf-8?B?SWNMNnMvUDQ2UTVPT3ZiV1ZyM3Nyb3lOQmtQT1lKY3NxbGtoWm01Q0liNytl?=
 =?utf-8?B?aWJ1WGlacmxNMDd4Y2RCSW9ZM2h4VS90YlRWMVBQN0VuZER5dFQxU0dnZC9K?=
 =?utf-8?B?RWQ4TldhbkhFQlFrcWI1Tk12aVRsT2RjQVJ3OXlpMlRaVEw2S0ZhSkg1dE9V?=
 =?utf-8?B?TVUzMnBybTlCZ3l5Tmt3VGtvVFpaS1FQSTRCTjA2K001MWxSTlFhMm1Gdmhr?=
 =?utf-8?B?cHQweU9yZDFxZGFuQmdzcGhPd0RwZEZrZU1vYTROSDZvMC9yQVF0SDE5d05x?=
 =?utf-8?B?bzRjSGRibXlLWjRSb1Y2bVlYMzJtNWdsVmY1OUpHSTNjRVh5VVJCZjdISCty?=
 =?utf-8?B?UE11NGt0SUF4cWxURTdiWVJCaFFkcnk5RzYyZ0tQcTMzTy9aM1M1bTBWZVZB?=
 =?utf-8?B?VkZmNUpOOS9TZk5KR3JOK2NxZ0hCbk1iVGRCYVY0ZDljclAwK0ZoVjRDQWV5?=
 =?utf-8?B?Z1laNWtvc1F6akliOGI2STkrY3BkWWZXN240NmsxdVpNS3pFYzFMelVudjVp?=
 =?utf-8?B?ZWVPNUtCemw1cEdJWDZTWUIya09LaUFmTjNybG9ZeXVTMG05ODhOd05KQzQ4?=
 =?utf-8?B?Zlp3c21XNll1cU0wTWRWSmZMZHk5R3JYazErcFM0ZjZ4OHV6UXlMcCtZSkg1?=
 =?utf-8?B?aVRUYk94bG5mRlRaNWFPaW4yTlR1MmtHOTl6QkJVbTBaNXJZWEZMekVqa21N?=
 =?utf-8?B?WmJrakp6Q3NMSjBWUjdvTUt3VmdZODFFemYzZmlyNktkbHJtN0RQS0ZSTWh6?=
 =?utf-8?B?ejVVa25Ld2RIL0JObnB3L3RLM0sxZTN3ekdiSG5zV09pYUE1dzJ2ZkZ2Zmtv?=
 =?utf-8?B?OU9TVE9JZGtOYzhPdDZyQzFrSk9wNGdFa2lKLzBOL0lRd0ZXcjd0bm9zMVFO?=
 =?utf-8?B?TjdiNmY3U3dseXQvWXNvMWpUMW5sVDlEbWo2REJvQmNvQWUzZ2NqT29qS0ph?=
 =?utf-8?B?YndQWW5meXFvd0Zjem9jTC9WVER1UHRaejRnNGgzNDlLRnRXZEJHbnFJYWEy?=
 =?utf-8?B?Nm5MeWVvZGNlQmdaRm9tbjNUYW9qNEhQeXZQS25uYTR5cFJDbHl5T0tsU1dP?=
 =?utf-8?B?NU0wbmM1T2RpNDRqY0lhUWNFbXg5VHNQeUZpQUJQU3liWlFUT2NRVGl4eTJY?=
 =?utf-8?B?Rk5udDdkbnZBS2NwVDF3NTRsN0U5UFlNeHlyREt1YXhMbFlqdm9KZVN3NTRk?=
 =?utf-8?B?d0RLdzJXS1Z2a2ZaNjc5TXF2THlLMWp6cittZC9MeXd3eTdxb2ZiUWdKQ0Nr?=
 =?utf-8?Q?sQ2IvZ3bYe/SySM0DKruyCpnI?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3772823EA14841448DA22DF2FC9951A5@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: connecttech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB4124.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b18603a7-a69c-4d98-77c2-08db980cece0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 12:42:28.3982
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d33071ec-da55-4b12-8469-920f998c36b3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wgtWVCHJDRBfMy/Fpm+B7Uyn8cogcUrA8HLX5hZoiFujTbiSw/1F+G2PyD0kaYXa2xtx/gvNQzCXCVc16VUbZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB9119
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAyMy0wOC0wNiAxMDoyMSwgQWtoaWwgUiB3cm90ZToNCj4+DQo+PiBCVFcuLi4NCj4+DQo+
PiBPbiBUaHUsIEF1ZyAwMywgMjAyMyBhdCAwNToxMDowMlBNICswMDAwLCBQYXJrZXIgTmV3bWFu
IHdyb3RlOg0KPj4+DQo+Pg0KPj4geW91IGhhdmUgYSBibGFuayBsaW5lIGhlcmUuDQo+Pg0KPj4+
IFRoaXMgcGF0Y2ggZml4ZXMgdGhlIFRlZ3JhIERNQSBjb25maWcgb3B0aW9uIHByb2Nlc3Npbmcg
aW4gdGhlDQo+Pj4gaTJjLXRlZ3JhIGRyaXZlci4NCj4+Pg0KPj4+IFRlZ3JhIHByb2Nlc3NvcnMg
cHJpb3IgdG8gVGVncmExODYgdXNlZCBBUEIgRE1BIGZvciBJMkMgcmVxdWlyaW5nDQo+Pj4gQ09O
RklHX1RFR1JBMjBfQVBCX0RNQT15IHdoaWxlIFRlZ3JhMTg2IGFuZCBsYXRlciB1c2UgR1BDIERN
QQ0KPj4+IHJlcXVpcmluZyBDT05GSUdfVEVHUkExODZfR1BDX0RNQT15Lg0KPj4+DQo+Pj4gVGhl
IGNoZWNrIGZvciBpZiB0aGUgcHJvY2Vzc29yIHVzZXMgQVBCIERNQSBpcyBpbnZlcnRlZCBhbmQg
c28gdGhlDQo+Pj4gd3JvbmcgRE1BIGNvbmZpZyBvcHRpb25zIGFyZSBjaGVja2VkLg0KPj4+DQo+
Pj4gVGhpcyBtZWFucyBpZiBDT05GSUdfVEVHUkEyMF9BUEJfRE1BPXkgYnV0DQo+PiBDT05GSUdf
VEVHUkExODZfR1BDX0RNQT1uDQo+Pj4gd2l0aCBhIFRlZ3JhMTg2IG9yIGxhdGVyIHByb2Nlc3Nv
ciB0aGUgZHJpdmVyIHdpbGwgaW5jb3JyZWN0bHkgdGhpbmsNCj4+PiBETUEgaXMgZW5hYmxlZCBh
bmQgYXR0ZW1wdCB0byByZXF1ZXN0IERNQSBjaGFubmVscyB0aGF0IHdpbGwgbmV2ZXIgYmUNCj4+
PiBhdmFpbGlibGUsIGxlYXZpbmcgdGhlIGRyaXZlciBpbiBhIHBlcnBldHVhbCBFUFJPQkVfREVG
RVIgc3RhdGUuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBQYXJrZXIgTmV3bWFuIDxwbmV3bWFu
QGNvbm5lY3R0ZWNoLmNvbT4NCj4+DQo+PiBBcyB0aGlzIGlzIGEgZml4IHlvdSBhbHNvIG5lZWQg
dG8gYWRkDQo+Pg0KPj4gRml4ZXM6IDQ4Y2I2MzU2ZmFlMSAoImkyYzogdGVncmE6IEFkZCBHUENE
TUEgc3VwcG9ydCIpDQo+PiBDYzogQWtoaWwgUiA8YWtoaWxyYWplZXZAbnZpZGlhLmNvbT4NCj4+
IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyB2Ni4xKw0KPj4NCj4+IENjJ2VpbmcgQWto
aWwgYXMgd2VsbCBmb3IgaGlzIG9waW5pb24gb24gdGhpcy4NCj4gVGhlIGZpeCBsb29rcyB2YWxp
ZCB0byBtZS4gTXVzdCBoYXZlIGJlZW4gYSB0eXBvIHRoZXJlLg0KPiANCj4gUmVnYXJkcywNCj4g
QWtoaWwNCj4gDQpZZXMgaXQgYXBwZWFycyB0byBiZSBhIHNpbXBsZSB0eXBvIGFuZCBpZiB5b3Ug
aGF2ZSBib3RoIERNQSBDb25maWcgb3B0aW9ucyANCnNldCB0aGUgYnVnIHdvdWxkIGdldCBtaXNz
ZWQuIA0KDQpJIGFtIG5ldyB0byB0aGUgTGludXggbWFpbGluZyBsaXN0LCBzaG91bGQgSSBzZW5k
IGEgbmV3IG1lc3NhZ2UgdG8gDQpzdGFibGVAdmdlci5rZXJuZWwub3JnIG9yIENDIHRoZW0gb24g
dGhpcyBvbmU/DQoNClRoYW5rcywNClBhcmtlcg0K

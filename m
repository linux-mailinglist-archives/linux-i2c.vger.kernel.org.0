Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D25F6FBEEA
	for <lists+linux-i2c@lfdr.de>; Tue,  9 May 2023 07:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234687AbjEIFzd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 May 2023 01:55:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234624AbjEIFzc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 May 2023 01:55:32 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BBEF559D
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 22:55:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N449u9YrEnk08ikoR2UB9XAzL2VmyFPbm/PaRjl3FZZufwtvEJcXWHPaTEuk59NISdQUexnQRDiAyr4PGo7+Z0KePGDlhoEhAKNdXagfko9B+6VEKnZc1ACJ9iJlFdKirVjyPC9CAbYQLhf1ogZjn5E6RdC/vAYC16i7UX370kITpQMOmedH3oB1EDVtd7SbBGyrcLM1DMBL188/4U5r9dtPwfKO0LFO5saCgwAt8RXkhrm0NG0MZEDIjlX2uhcRDLgqSCdhOQZlXZJ5uDDLdOXwp8tuLR+46Av1Y6FT6lGUEvgk1Rig92zmZZurzaCRp1CgHF/o6UJ9FmDiZ69eUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/6NwhmIYGOsOF5ESyXDuQ1Rl45rbEsumpVk56hTHOs=;
 b=KbOTDdnvisjIZTC1+a/lLHbEyxPh3v0yGOt4VcJlqhCLdH/xEmvNXblQXmUt8Rwrg+JU7mCzMJKGKSN+S5N9RK32gEnrcnmSHaUZyTc5h3w7Qkhl9Rro54Q00QwTj2F/ABG8RbznD4QejXTz0Nl5jVRa/ohD9aviajbl5NOFp0Z0jZo1wGbTOLvaNDeDHELger7gUBtTauUUmKShvCR9x7+HvKqjQhiWAnA6eeYWCcOVQnwZUA1T9JftKdG2rzGe2d9pVGbFzW/o2v2WigtfHjgF0tq02j2gwqxWlQwUJCt+Xcl4a7DmFhSHrlrnZ7xFuPBGdG8ilBMoJufbhICv+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/6NwhmIYGOsOF5ESyXDuQ1Rl45rbEsumpVk56hTHOs=;
 b=XS+cQrnMPPsZhd6OF2g2YTOYSq6Iu3+XaQKZDUp2IsbA+3ARRKu5uwHebA8BhqNnWNLM4rKW8PShYMPOSFpG9RQKq3Bncz1brQlKcZaas6gJAShuxYIXVKBc8U1aSSeH+WkOYX4e6mlhzeeUyhdfaFahjmHKLyqqngq86FNzsBxNtr3ohFnVrDJqKQoEDlqiOuZbPPNXufjFaWSD/xAEbAe7+bqRFVhIsiwDpUxA9M/w2gb5c9kznvRiwjkTAbjymwexQ5JMivt4n2G8tOMqj6w30U4iOJZMqqd4MFWGqKY4JvHFmrHuAQVJdkD7YRzLUF1xzbxCN6pq3v63eC8zzg==
Received: from BN9PR12MB5381.namprd12.prod.outlook.com (2603:10b6:408:102::24)
 by MN2PR12MB4078.namprd12.prod.outlook.com (2603:10b6:208:1de::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 05:55:30 +0000
Received: from BN9PR12MB5381.namprd12.prod.outlook.com
 ([fe80::affc:9f98:eb16:ab5e]) by BN9PR12MB5381.namprd12.prod.outlook.com
 ([fe80::affc:9f98:eb16:ab5e%3]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 05:55:29 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        Michael Shych <michaelsh@nvidia.com>,
        Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@kernel.org>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH 87/89] i2c: mux: mlxcpld: Convert to platform remove
 callback returning void
Thread-Topic: [PATCH 87/89] i2c: mux: mlxcpld: Convert to platform remove
 callback returning void
Thread-Index: AQHZge8s+nnrMwDJR0eMatODYfCdxK9Rccog
Date:   Tue, 9 May 2023 05:55:29 +0000
Message-ID: <BN9PR12MB538108B490F53E17C35C9BF0AF769@BN9PR12MB5381.namprd12.prod.outlook.com>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230508205306.1474415-88-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230508205306.1474415-88-u.kleine-koenig@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5381:EE_|MN2PR12MB4078:EE_
x-ms-office365-filtering-correlation-id: c58ef44c-54cf-446c-db65-08db5051feb7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jHVbxhoR3t2DI8rBqVB95J0ycmZKiAk9uKigC+O3KchXhSfOzTkwdBrvS2aIPQt1hH/B7LV8z/tSv7x4UGexnx137rIGVC/VCOWWcuWvMMRBViqDFPJGhWZ/1kf9Vbjb+EVXwA8aEN92MGns11j37oa/yfVGCtA9S4RlrUn0LhF5h9pVgkVBToPWNjB1FU6gBEdesPkrrRLy6Nkwq2F0yHiOwyDEMM/UR1nFcNHdJlkizmgtDonFkidnTPQ20oWk6I0e8F3hAmBrE1CDN5oUomUKaAv0GoG0EtlXEPsI1h+4oNeXY4AQ/dPiTCnmFmsBfZp8pdxvFRpNevvEiMR83wT6j8uciPTIyB9Tl73VUSEXFJ9fgMDBlm37pI/aF0e88XNckbbQRUoJF6If8fSpHPHviQjqwJrxC3pQpNNMp39drej/Y/fg0WxrF4f8occdFeWXr5nQTBZf+yx8LpO+iNd87LSqWhm08jl9rxbJJnH002CtOeE1a6WokhpTkbqc7obZ36G1ceCYPA7DnOuAyfou7/n8C34eQtMYAsxQIUWME82oSxskB3ZNr8WcMCaEaCx1lu1LSTnOH/QFRoMrfBoRVie+uUU8ITcnObvxqM22JqXbJeWHxvEihBTWR6C69pbm8Sio7kX6sxR6ti2bLQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5381.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(366004)(39860400002)(136003)(346002)(451199021)(33656002)(38100700002)(66476007)(52536014)(2906002)(38070700005)(316002)(5660300002)(8936002)(55016003)(86362001)(8676002)(64756008)(76116006)(66446008)(66556008)(66946007)(122000001)(41300700001)(4326008)(83380400001)(186003)(53546011)(6506007)(26005)(9686003)(478600001)(7696005)(110136005)(71200400001)(54906003)(133343001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2FQV21yc3FCekw4MXlCL2xjU2hYL09mZzRCWTllMnlkUjF4TjRhVjZFK2hh?=
 =?utf-8?B?aVBvWEEySllRSUpiNjV6TXdNVytRdnFHOXhEeDJlRDZWYWZkSzNReTQ4ZGZZ?=
 =?utf-8?B?aHV1c1dpdE9HZGRIR0JCOEpDVk9DZDlCWkhib0ZHM2tFbG54eUR0aCsyWDlY?=
 =?utf-8?B?My95MzhtdXh3Y0hVekYwQktKRXQrMDV2MlFqZXZWT3M1bm1IQm4vM29TYXpW?=
 =?utf-8?B?VG5yZTlsSm42ZGJVN1BBOGNOQlRrdnBsZUZaNy9IQzVjNlYxODI3Q0UwdjZM?=
 =?utf-8?B?TDJyM3J1eWkvUTJWY2lnK3NqMjBNYUMvWHZoeGxtR0wrSHFjWExFb1VqTjhw?=
 =?utf-8?B?VXNJQ0kwN29sc3plY0pqNURySitTUi90S09kbUN3M2hyczR5NkRKd2xGdTZD?=
 =?utf-8?B?dlZrYzdtd3J2aE9hM0djU3g0TzVFdjg5b3k2Y1Y4c0R4a1U3dlpROCtHOTY5?=
 =?utf-8?B?aHBOSUU4VlJYUjlKK0cwYWMyeEoxM05lZGhQMTBLT1E4cklBOVlNQ3NkeENG?=
 =?utf-8?B?TGhEak5nMzdwbllya0p4YXZyb3RCQzgrRzM1d0MzbS9heGFUL2VkWVlFdDRX?=
 =?utf-8?B?RzhsV1NOaFRTRlB6Z0ZUMlRiYVdKZ0JYWS9LM3RGQjlKVDg5dm1wQXBWRjIz?=
 =?utf-8?B?aEpKcFZiemVzZ0o0eEJ5NzM4cTRQZkdMNlVTSWRkZTIyTTZteWRrdHFubm9i?=
 =?utf-8?B?Mk5XeXZjTFVJVU8yZ2RWb3ZiaS9ROTdRekQ0eEhrRGtPNHJjYVBLODJsN3Qw?=
 =?utf-8?B?WCs3cjA4VnExZHZJRldEU1Z4SjlJcVJEVTJuN3pEY2FpbW1hU0ZKWDZhM0Vy?=
 =?utf-8?B?TXp2d3lIM2dicE81UjgxUmxOeCtlRGE4R0lEdGcwQmovNjNhaG14eTJ4eWhO?=
 =?utf-8?B?U2NiMEFlajhTRzFVRnp0cmRJT205eHNFVThXeFRFandBUnBVQzRqOEZ0bDVZ?=
 =?utf-8?B?b2NnVnY1dU5mdlYwRlB3dXlxemN0emV4Nm44RmE1R3g3VkdYNnVDcXFUMmRl?=
 =?utf-8?B?ckZXMmZHL0xNN2tLNEpaYUloS3MwejF2bS9tMGwwaFVnMEwwMmJBWkxHam4r?=
 =?utf-8?B?c2ZBOCthN0daaVJKd1NKOSt6S0dCKzUyaXFLUnFYUVU4SnpEejJuRlBvRHd3?=
 =?utf-8?B?SU1aejFtbWY2M3JVV20vMERIR05INEZHdTdzUG93Vkk4dkNrbkN5emliTGNP?=
 =?utf-8?B?S21JTUhTZUw5bUU2RDNzZW9saTl2TGtacVBycmc4M0tsdTRSQjkyWEMzRVQ2?=
 =?utf-8?B?Vi92ejJmSXBrT1Vwa0dubVF2ZDVKZnNoQmJaUWlvWFRMY2RQVXdudHlnMTVV?=
 =?utf-8?B?QnZPWE5VOXBSbHBkcUsvRW4ycVduK0tlTnl1L3JsV2tGSHdyRXZLdDNXQTdj?=
 =?utf-8?B?dDZOZ01LZ2lXeTdaSENjckZlQ2xVN1NIeGFTZjEzN2JTZ1l5QVhQcE9CNUZ2?=
 =?utf-8?B?dGhMdmcxQmtkanRoNTFJVFYxVDF0LzRmbnFQa2pWbXUzYi9WVGhLTzkrV09P?=
 =?utf-8?B?b08zUnlDcVBUWmpuZGdKMDRjTFd4OTVTN2ZzWnYwSkh6dzZPT2tGOUI5aGhp?=
 =?utf-8?B?SFcxM0JXdFNUYWJzdXFjZUNVT3RWa2NtQ1NzNUt5RmVCRTJScisyQmhKMjhR?=
 =?utf-8?B?SU5OYVRPM0NoL2dQNHByenIycG56UVd5amI2bVV1RHQrRVRZRk9UV0gybFQr?=
 =?utf-8?B?R0phZERiWWdoRTdxS000d2FvaTVXNEJVemFXZlJXSTgweVRxblkweVBwN0p2?=
 =?utf-8?B?YnhPekRZY1Z3ZjY3aDZjT0R3MERkNGhhcjNOb01abHVNNDdRaVExSG15YjAz?=
 =?utf-8?B?a3ZURUJTbjROT2xhNTgwRFZFOUxBbnV1OGdwVll5NmRzMnRaNEcxVGdmR2tU?=
 =?utf-8?B?czR6ZFN1a1ZWRVVaNjlPYm1WSko4MnZSNHFhTXhPRDVBQWVBOEx2Sllva0Zk?=
 =?utf-8?B?c0RBbzd6S3lWOHkxUTZBdS9QM21VSUpiQlNXMU9pUkJFcFd2QWlCTEV1bXNr?=
 =?utf-8?B?U292b1FBQUR6NHB5TGJLUDFQcEhZaWdROVRuMTl2WnljRTVmT1BITEJGd2pv?=
 =?utf-8?B?dTVITVU2TmFWZjdQWjdoT2FtU1pNY1RHTlR6clg0ZlpLSTJWVlpYMU9ubld1?=
 =?utf-8?Q?qnJ0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5381.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c58ef44c-54cf-446c-db65-08db5051feb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 05:55:29.8737
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ufcjEz4XLjiTmfYevkWR0wD4Zwv3RNnOxtsrCusltqVfUuHfn3xz5LLbLi5JqeSEuhb+5YG4aE299/z6LjSr0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4078
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVXdlIEtsZWluZS1Lw7Zu
aWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4NCj4gU2VudDogTW9uZGF5LCA4IE1h
eSAyMDIzIDIzOjUzDQo+IFRvOiBWYWRpbSBQYXN0ZXJuYWsgPHZhZGltcEBudmlkaWEuY29tPjsg
TWljaGFlbCBTaHljaA0KPiA8bWljaGFlbHNoQG52aWRpYS5jb20+OyBQZXRlciBSb3NpbiA8cGVk
YUBheGVudGlhLnNlPjsgV29sZnJhbSBTYW5nDQo+IDx3c2FAa2VybmVsLm9yZz4NCj4gQ2M6IGxp
bnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmc7IGtlcm5lbEBwZW5ndXRyb25peC5kZQ0KPiBTdWJqZWN0
OiBbUEFUQ0ggODcvODldIGkyYzogbXV4OiBtbHhjcGxkOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJl
bW92ZQ0KPiBjYWxsYmFjayByZXR1cm5pbmcgdm9pZA0KPiANCj4gVGhlIC5yZW1vdmUoKSBjYWxs
YmFjayBmb3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBpbnQgd2hpY2ggbWFrZXMgbWFu
eQ0KPiBkcml2ZXIgYXV0aG9ycyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBvc3NpYmxlIHRvIGRvIGVy
cm9yIGhhbmRsaW5nIGJ5IHJldHVybmluZw0KPiBhbiBlcnJvciBjb2RlLiBIb3dldmVyIHRoZSB2
YWx1ZSByZXR1cm5lZCBpcyAobW9zdGx5KSBpZ25vcmVkIGFuZCB0aGlzDQo+IHR5cGljYWxseSBy
ZXN1bHRzIGluIHJlc291cmNlIGxlYWtzLiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUgaXMgYSBxdWVz
dCB0byBtYWtlDQo+IHRoZSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuIHZvaWQuIEluIHRoZSBmaXJz
dCBzdGVwIG9mIHRoaXMgcXVlc3QgYWxsIGRyaXZlcnMgYXJlDQo+IGNvbnZlcnRlZCB0byAucmVt
b3ZlX25ldygpIHdoaWNoIGFscmVhZHkgcmV0dXJucyB2b2lkLg0KPiANCj4gVHJpdmlhbGx5IGNv
bnZlcnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92
ZSBjYWxsYmFjaw0KPiB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXgu
ZGU+DQoNCkFja2VkLWJ5OiBWYWRpbSBQYXN0ZXJuYWsgPHZhZGltcEBudmlkaWEuY29tPg0KPiAt
LS0NCj4gIGRyaXZlcnMvaTJjL211eGVzL2kyYy1tdXgtbWx4Y3BsZC5jIHwgNSArKy0tLQ0KPiAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9tdXhlcy9pMmMtbXV4LW1seGNwbGQuYyBiL2RyaXZlcnMv
aTJjL211eGVzL2kyYy0NCj4gbXV4LW1seGNwbGQuYw0KPiBpbmRleCAxYTg3OWY2YTMxZWYuLjNk
ZGEwMGYxZGY3OCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9pMmMvbXV4ZXMvaTJjLW11eC1tbHhj
cGxkLmMNCj4gKysrIGIvZHJpdmVycy9pMmMvbXV4ZXMvaTJjLW11eC1tbHhjcGxkLmMNCj4gQEAg
LTE3MCwxMiArMTcwLDExIEBAIHN0YXRpYyBpbnQgbWx4Y3BsZF9tdXhfcHJvYmUoc3RydWN0DQo+
IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAlyZXR1cm4gZXJyOw0KPiAgfQ0KPiANCj4gLXN0
YXRpYyBpbnQgbWx4Y3BsZF9tdXhfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
DQo+ICtzdGF0aWMgdm9pZCBtbHhjcGxkX211eF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikNCj4gIHsNCj4gIAlzdHJ1Y3QgaTJjX211eF9jb3JlICptdXhjID0gcGxhdGZvcm1f
Z2V0X2RydmRhdGEocGRldik7DQo+IA0KPiAgCWkyY19tdXhfZGVsX2FkYXB0ZXJzKG11eGMpOw0K
PiAtCXJldHVybiAwOw0KPiAgfQ0KPiANCj4gIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVy
IG1seGNwbGRfbXV4X2RyaXZlciA9IHsgQEAgLTE4Myw3ICsxODIsNyBAQA0KPiBzdGF0aWMgc3Ry
dWN0IHBsYXRmb3JtX2RyaXZlciBtbHhjcGxkX211eF9kcml2ZXIgPSB7DQo+ICAJCS5uYW1lID0g
ImkyYy1tdXgtbWx4Y3BsZCIsDQo+ICAJfSwNCj4gIAkucHJvYmUgPSBtbHhjcGxkX211eF9wcm9i
ZSwNCj4gLQkucmVtb3ZlID0gbWx4Y3BsZF9tdXhfcmVtb3ZlLA0KPiArCS5yZW1vdmVfbmV3ID0g
bWx4Y3BsZF9tdXhfcmVtb3ZlLA0KPiAgfTsNCj4gDQo+ICBtb2R1bGVfcGxhdGZvcm1fZHJpdmVy
KG1seGNwbGRfbXV4X2RyaXZlcik7DQo+IC0tDQo+IDIuMzkuMg0KDQo=

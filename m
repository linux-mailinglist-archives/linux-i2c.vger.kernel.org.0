Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2C32791711
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Sep 2023 14:25:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352606AbjIDMZ1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Sep 2023 08:25:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242468AbjIDMZ0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Sep 2023 08:25:26 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2045.outbound.protection.outlook.com [40.107.96.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B91041BE;
        Mon,  4 Sep 2023 05:25:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Drkd1yuzYwOKv2YuUkWzEzhh6LPcXs5KS5QLXkL++rCr2as3FeAuODJrbOeuJlGIlGTVAD6fAQk0kcyIjo/3RWxpIwvBs43JWHGW4pugKvIWMlvYMuNTCwN8WJpVylxVXoJns/ikcd3MekX3mUqdJmYeyy7N+0ctZieQvoqvvO19M2ahHucCnn+Dit3Pt/4G9V/z0teKVDotVN6vUjSqK4JZqnKydmMcE2dJAB5QUqqj2ptpYm60pwc+8rQATGZazPAaD/uGZzEDTl/F+hlgoy4zdkwZqguifmrj2VRq8LbjtU8FZRUUHotiM5yFJe9WwDs9lnhICPSPnKQhzEesGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fO4SEHm7tdRUVLK+vrapd6+mnhropODkf4PO9KG6fXo=;
 b=kWZ7iNTifrorswtxSC/AS7ugX2xxRqms4ASzoUATd1VC68OUwbddXZckwzCHJcAYcHsHoXWiQcbpW8lFW2odTPogWIOFD6SPvJ2Ui2DBJnMYT8L63MDAhzNuRjn5sMpKbcX/YfrP/kyiqUk7/sdSEXi0sthVXdvQPRnn6o5q9wXVl/Esd6Wg2CKGpJo0pNeUDCTxP4noli4ygQDR5uRjad6pFmRv+iXP1S2Wt9521BrJYarEHD9rM+K+wKBUrdq9XQok3U5YZbFFn9+4PgZutpXqT85y6KTN85GWEl9JbnumhNrMSIKAHKFcpCsdglFa5i5UXCBUDqZEmAYlqOxcLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fO4SEHm7tdRUVLK+vrapd6+mnhropODkf4PO9KG6fXo=;
 b=Cdt79wWP4vJGJ6IDqBYPYSGayjOVP6pwYxqFuM3Nyf2wFI/9GpD5WtQ+cS6IrvVWQ+WIgAekW30SfiDylnegVrg3DY3uQYWYmnNK1xuua5Ri/fEVZjtjW9gtQPUtj2uzCSBshDuH1OmaTLW1YimmjcOlAsmaK0R3yYA65BmiQqFxbG3mZNqas1xXkBK0KMkcJQ7An74J/FaWcFyTDuFjHP8erZ0SQcEueghwbocOBTb0JSMC6FSjtzw1oWKC2A7hk7dSy7NxD7ZtsROY/0/jI63/ICFLPynlHKhhiuTmgSQisSGwQfnjNnW/KsA9nRXNLIP6oWNvnR/V7SgCm+nrwg==
Received: from BN9PR12MB5381.namprd12.prod.outlook.com (2603:10b6:408:102::24)
 by CY5PR12MB6406.namprd12.prod.outlook.com (2603:10b6:930:3d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 12:25:19 +0000
Received: from BN9PR12MB5381.namprd12.prod.outlook.com
 ([fe80::5fa6:31e7:e6fb:3beb]) by BN9PR12MB5381.namprd12.prod.outlook.com
 ([fe80::5fa6:31e7:e6fb:3beb%4]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 12:25:18 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Andi Shyti <andi.shyti@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Michael Shych <michaelsh@nvidia.com>,
        Wolfram Sang <wsa@kernel.org>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/2] i2c: I2C_MLXCPLD on ARM64 should depend on ACPI
Thread-Topic: [PATCH 2/2] i2c: I2C_MLXCPLD on ARM64 should depend on ACPI
Thread-Index: AQHZ3yduBmKGDD6VbUqWvi56OXWlaLAKl1rw
Date:   Mon, 4 Sep 2023 12:25:18 +0000
Message-ID: <BN9PR12MB53812F432AE7060963A9FF4CAFE9A@BN9PR12MB5381.namprd12.prod.outlook.com>
References: <cover.1693828363.git.geert+renesas@glider.be>
 <71c8d6d8c2c7ef31040ff5a0266cde0a6b3cd189.1693828363.git.geert+renesas@glider.be>
In-Reply-To: <71c8d6d8c2c7ef31040ff5a0266cde0a6b3cd189.1693828363.git.geert+renesas@glider.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5381:EE_|CY5PR12MB6406:EE_
x-ms-office365-filtering-correlation-id: 5787e8fb-adc9-40a6-d568-08dbad420060
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oa32KZtVThgrUq8+PcGWCZsrRdt0ZEl0QPEtBExVNlz21G9TW+OYl+ElLl8PH4P7V1ddqbKK6Y6m5oet1fGHnitCa7o9LmMaJCd4nz4F+TQ8s+dJI0poOX77YV9BF5PRepo7ZuavBftFzl4mwqNbZEXdOvhEhs0d7a5yr6x8dc1y2Lp+sIgB2psXskFZ0UTeLlPQfuh2YIX+gANQEi286jhB+qChFmJ07uOCbpw5nn0C5AM5A76i1O31mD7Jpwu5mdPwYmQqAq7LTZbrxxwyNS5WHbMFsdUTRGFa6ICDFgptiAZ0KWd0pFY8bWSHi1PD4VMGAXdB85s+g2nFQp9GFTqfJBEcwqHyR1v8cYg0FuDkPB0g96mZdvt7lhQFZ7ibPZdS/C1qKtbjDFvaIeKhV4Vuim/TTRG3JoVJ8XHAKzQQTxk5yQ0Vh+qbXYuQI3aTsVLFyEnLVSAfh+H1Gs/qCIXklcHQQfM7OsRTJotpMVL/S3iLkW4zFd0ABwQ/zdGY1//3l55lmfFN4zYV82e142LcqcEvoiFv+CUdiPeU1snaiaNLG7tG3ZaTcs2JYhopUSa8QnVQn+eWzWi8r83qDIfb9Rx5nNtvWeowGixihnG8Z1ZLnc9/gh4+Y2xGp8Mv
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5381.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(136003)(376002)(366004)(396003)(451199024)(1800799009)(186009)(41300700001)(8936002)(83380400001)(55016003)(478600001)(71200400001)(2906002)(76116006)(66946007)(5660300002)(4326008)(8676002)(110136005)(52536014)(66556008)(54906003)(64756008)(66446008)(66476007)(316002)(9686003)(53546011)(6506007)(26005)(7696005)(122000001)(38100700002)(38070700005)(33656002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bnVDUTdIeldkbVcxQVJvTTlzaTBITk51WHZBYW5RTVgxL29BZGhjelZpQkVy?=
 =?utf-8?B?Nk5mZGJGNGxuNWk1RmwxUVNDVXNqWVM4TnBnSkNZdVI0UGo3RG5tYitBWllr?=
 =?utf-8?B?UlRNaitoZ0pRNysvN1N3WTVIWC80TndNNmtoTm52MFl5NndOaUR5bDF3eDFm?=
 =?utf-8?B?MzJ2ZUU5Uk1TeUhvd3A2cHIxcnY1T2NJM2ZWbEVJa21WR01DaHRpSHAvamlF?=
 =?utf-8?B?NnRqbXJ0UC9uMnlzaWZ5QVFQTGJPUXZ3bVczOVJpNGpJYmkzR2xjQWtSMWR2?=
 =?utf-8?B?TnVZNFZDQ2kwRENFUmlGLzdSWDFvZDEvaE9FOHErMmM0bFU5VTBuM1JPYXhP?=
 =?utf-8?B?cmJUYXp4ZExBSE8xR083SGR4eFU2WWVmVzU3Z3gzUmVEcjJCOVpJV2Y4RUY4?=
 =?utf-8?B?a01LbWtWWUhJclB6R0tvTExoYlJxRkUzYjk3TmpKMkZpRmUxWjBNSUZwbU91?=
 =?utf-8?B?N3ZubUVBZUFFZndsa0Y0a2JRcTVPOVZHTUc4Z1RwUEZMY1BvVEVWNmNRKzdG?=
 =?utf-8?B?QjMxNUhBeEdITXpSbVFiSlRabUY5MWlWKzA2S0dRTkhwNlZ5NFNHZk04MFZn?=
 =?utf-8?B?N3MvM2dvS2ZzOEVqeGUvdHhOM29Nb1I2T01tOVRNVmpMeFllNVVpRHdqUGlF?=
 =?utf-8?B?VHJsQmFBc20zZXhVRjAxTlBsYThUYldheWFWUnZVelMvaFYrYW1TY29yTXdQ?=
 =?utf-8?B?UkxidUMxbnVWSFVTMzhRQm9DVC9IbGtmaEJGU0VLK043S2FwNDYvOHFTNURy?=
 =?utf-8?B?N3B4cTgwWUVmTXlMbnBJK3hoZE14Qks5Qm1oSENocERFbERNMDJ2MThJTDBN?=
 =?utf-8?B?TDFnY0I4cGhsUW55Qk16ZFI5VkQ1S0JRQlNaRzdWS0FTYkM4NGZaeFpOeWFT?=
 =?utf-8?B?N0FBdHU2OHUzOG94Y2poVVAzQzBBY1BJZ0pkdVZBdVhUcnV1UUgwSExkSmU5?=
 =?utf-8?B?QU4zaFpSOGJOQmpKbVNvQW1tOEJDM2ZJS2wxc3A2UHJQSHZ1a0RVR2xXODR5?=
 =?utf-8?B?bVJwR1hUV3VPZjVWY0QzVm03eXNXL3EzZkJnK1VteHc1ZHExbmU2U0R4aytZ?=
 =?utf-8?B?aWZtMk9Mb09pYzg0K0o0bXpaNDlqMlA5Vm1FZWloV1Q5Mnk2eTNEOVorOHJ5?=
 =?utf-8?B?d0hUM0JMTSs2Qk1sK2EySStxMjNPblhKOXh6VFYxNi80WGl0cUdYZ1JaSURi?=
 =?utf-8?B?VkZ2azA1NFFwdXFFdEhUY2R0YklGS3I0UGQ3UW45cGpCOWMveHl2UG1PZXN2?=
 =?utf-8?B?T1Z1UmgvSmx3NVpQc0tVM0JldjZhbjcvY3NGWlNTdkJ5eDMyR1R3eC9kY0Nn?=
 =?utf-8?B?dU5HWGprNFM3TForaXBzelVpQ0JUSjQ4L0dpTUJ2c01aOEwyeHh3dUhXcDBI?=
 =?utf-8?B?dFRMZXo4M2hiblo5VGhRS0thZGYycCtlVzdQRElnNng0aDdLUUt3cnROMmlT?=
 =?utf-8?B?eUhnNi9nRnpUUGgwSWVEVDJZZk9iWlBQV3dSV25IalVhNk44S3lzOEhpV2E4?=
 =?utf-8?B?N0NWMDZWMFVnelIvRS9hUkVaNmg0WVlRb3ZIbkQrcjY0ZTkyaTF0NGNJV283?=
 =?utf-8?B?MGtwbW0zV2RRVTBIVFFnbGNJWFRGRnU4ZzRyY093SlcrN3V2QkZueStqdXFE?=
 =?utf-8?B?dlJHQXdNYktVRmwvN2x4V0laWk1OUFpITFZzYW53NVpORGF1RktwZjE5OVNZ?=
 =?utf-8?B?Z3VkVHlPNytvQ2tOM0syNSs4azNFWmJjcGZBV1M4Q1ZrdC9OaEFDVjhhZnlG?=
 =?utf-8?B?VmVSeGYyRGFsZ2ZUbVhQYXBGTHJNSHp1bTBYM2RBNDlPRUdXOXBDQ2o1aVox?=
 =?utf-8?B?cituSjhEampyeHB4WWJzL084bnhrcTkrcWsyYTNvaEMvYTJCNlVJSDBSdG9M?=
 =?utf-8?B?WjN4OTh4R2lidFB6TTZrOWx3ajlublBhN0JUV01mWkd4dkFOR242MHU3djcw?=
 =?utf-8?B?ZXpqbkVmS0RXSTN0QlZ0TGRydkRvWmVudGgyYlJ3UnZzVXEzN2UyV3RkalVr?=
 =?utf-8?B?WXRlSlFKalhIZjNlcXRtaU9uR0RlZE54WFRVbnh4dFdmaVJ2S2R0L2lNZWEy?=
 =?utf-8?B?OXcrQlhoaG1lTUtUQU9EOTc5NnFnbXFGYU1qdkpMaXRNK1p5Vm5pQjRvNUhq?=
 =?utf-8?Q?hI9k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5381.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5787e8fb-adc9-40a6-d568-08dbad420060
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2023 12:25:18.8299
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ycgvwH0tIrS4R/pwu12caPN7/C7NEETmTmeHz8yNi7v3Fy3x8eN+47D1NtIQnf8377i749z4jQDYynvxN0KebQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6406
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gU2VudDogTW9uZGF5LCA0IFNlcHRlbWJl
ciAyMDIzIDE1OjAxDQo+IFRvOiBBbmRpIFNoeXRpIDxhbmRpLnNoeXRpQGtlcm5lbC5vcmc+OyBI
YW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPjsNCj4gTWFyayBHcm9zcyA8bWFya2dy
b3NzQGtlcm5lbC5vcmc+OyBWYWRpbSBQYXN0ZXJuYWsgPHZhZGltcEBudmlkaWEuY29tPjsNCj4g
TWljaGFlbCBTaHljaCA8bWljaGFlbHNoQG52aWRpYS5jb20+OyBXb2xmcmFtIFNhbmcgPHdzYUBr
ZXJuZWwub3JnPg0KPiBDYzogbGludXgtaTJjQHZnZXIua2VybmVsLm9yZzsgcGxhdGZvcm0tZHJp
dmVyLXg4NkB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3Jn
OyBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiBTdWJqZWN0
OiBbUEFUQ0ggMi8yXSBpMmM6IEkyQ19NTFhDUExEIG9uIEFSTTY0IHNob3VsZCBkZXBlbmQgb24g
QUNQSQ0KPiANCj4gVGhlICJpMmNfbWx4Y3BsZCIgcGxhdGZvcm0gZGV2aWNlIGlzIG9ubHkgaW5z
dGFudGlhdGVkIG9uIFg4NiBzeXN0ZW1zICh0aHJvdWdoDQo+IGRyaXZlcnMvcGxhdGZvcm0veDg2
L21seC1wbGF0Zm9ybS5jKSwgb3Igb24gQVJNNjQgc3lzdGVtcyB3aXRoIEFDUEkgKHRocm91Z2gN
Cj4gZHJpdmVycy9wbGF0Zm9ybS9tZWxsYW5veC9udnN3LXNuMjIwMS5jKS4gIEhlbmNlIGZ1cnRo
ZXIgcmVzdHJpY3QgdGhlIGRlcGVuZGVuY3kNCj4gb24gQVJNNjQgdG8gQUNQSSwgdG8gcHJldmVu
dCBhc2tpbmcgdGhlIHVzZXIgYWJvdXQgdGhpcyBkcml2ZXIgd2hlbiBjb25maWd1cmluZw0KPiBh
biBBUk02NCBrZXJuZWwgd2l0aG91dCBBQ1BJIHN1cHBvcnQuDQo+IA0KPiBXaGlsZSBhdCBpdCwg
ZG9jdW1lbnQgaW4gdGhlIEtjb25maWcgaGVscCB0ZXh0IHRoYXQgdGhlIGRyaXZlciBzdXBwb3J0
cw0KPiBBUk02NC9BQ1BJIGJhc2VkIHN5c3RlbXMsIHRvby4NCj4gDQo+IEZpeGVzOiBkN2NmOTkz
ZjgzMmFkMmE0ICgiaTJjOiBtbHhjcGxkOiBBbGxvdyBkcml2ZXIgdG8gcnVuIG9uIEFSTTY0DQo+
IGFyY2hpdGVjdHVyZSIpDQo+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2Vl
cnQrcmVuZXNhc0BnbGlkZXIuYmU+DQoNCkFja2VkLWJ5OiBWYWRpbSBQYXN0ZXJuYWsgPHZhZGlt
cEBudmlkaWEuY29tPg0KDQo+IC0tLQ0KPiAgZHJpdmVycy9pMmMvYnVzc2VzL0tjb25maWcgfCA0
ICsrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL0tjb25maWcgYi9kcml2ZXJz
L2kyYy9idXNzZXMvS2NvbmZpZyBpbmRleA0KPiAwYWE5Nzc2MjMzMmQ4YTg3Li5iZWYyYWY1MGZi
MTU5YmFmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvS2NvbmZpZw0KPiArKysg
Yi9kcml2ZXJzL2kyYy9idXNzZXMvS2NvbmZpZw0KPiBAQCAtMTM5MSwxMCArMTM5MSwxMCBAQCBj
b25maWcgSTJDX0lDWQ0KPiANCj4gIGNvbmZpZyBJMkNfTUxYQ1BMRA0KPiAgCXRyaXN0YXRlICJN
ZWxsYW5veCBJMkMgZHJpdmVyIg0KPiAtCWRlcGVuZHMgb24gWDg2XzY0IHx8IEFSTTY0IHx8IENP
TVBJTEVfVEVTVA0KPiArCWRlcGVuZHMgb24gWDg2XzY0IHx8IChBUk02NCAmJiBBQ1BJKSB8fCBD
T01QSUxFX1RFU1QNCj4gIAloZWxwDQo+ICAJICBUaGlzIGV4cG9zZXMgdGhlIE1lbGxhbm94IHBs
YXRmb3JtIEkyQyBidXNzZXMgdG8gdGhlIGxpbnV4IEkyQyBsYXllcg0KPiAtCSAgZm9yIFg4NiBi
YXNlZCBzeXN0ZW1zLg0KPiArCSAgZm9yIFg4NiBhbmQgQVJNNjQvQUNQSSBiYXNlZCBzeXN0ZW1z
Lg0KPiAgCSAgQ29udHJvbGxlciBpcyBpbXBsZW1lbnRlZCBhcyBDUExEIGxvZ2ljLg0KPiANCj4g
IAkgIFRoaXMgZHJpdmVyIGNhbiBhbHNvIGJlIGJ1aWx0IGFzIGEgbW9kdWxlLiBJZiBzbywgdGhl
IG1vZHVsZSB3aWxsIGJlDQo+IC0tDQo+IDIuMzQuMQ0KDQo=

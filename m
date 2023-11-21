Return-Path: <linux-i2c+bounces-361-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 439467F241B
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Nov 2023 03:38:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ADF4AB21AC8
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Nov 2023 02:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E758C5235;
	Tue, 21 Nov 2023 02:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="ZVFwd8gT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2073.outbound.protection.outlook.com [40.107.255.73])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08ED9AA;
	Mon, 20 Nov 2023 18:37:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ExOzrvrlZErwzUKa6hmk9FPGxqGEJzbCkOK5SWnkYuRtoRi1/eoQbhplpOBkC5o77RNPmZ6gtN+dmfrWckU7Mu6drkdYEFXSba6ZANLPuYdCQeVv8wXaYLe0LngaUw6mXx6RmOLQhaGvpa7WlasBNySFQg5LFO3QKRq80hHgD3HAiGXuurTYVsuIgT+QoZiuP095so3g58d0xGkLEn8/sV1VGG1+mD5kJU9Cj3FMoGGm4/h6WYrHV07+wjfGShxYn6laO7LUp+LraN47kJgASAbHjPweqXR43ZgGJJAlEJo/WLLAp6kpHEadM89Z3aa4RmAiUtMP50Wb/qUfclo8dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+L2pLNr6OST7OqqM1z4VrJVKY/EwXqhMP1vzf/g7Pi4=;
 b=J5o+bLX82d/N2/6PV2Mr+x6rK/s+SQJCrhc1162oZlEakydBBIMh76vKxcbWW0+l3csahYk/s3TypwrFdrfmfCWOaxru6862r8dEVeP9RPIK8wFqqrbAnKGoaLend/BVNznxXoJPQZF6Xe/nqOTWUxeVdJXwh+NtyKG/IHZ8cdihoRmv31UPcHxRcZl3BfU4Y/nZSIa8ugZczznboIXJdW2uYQHyf0NjW27sNqxVtj+UHKPkgwk4vLllpnmrqV4YzOyUlUTQS+TdTvlKTABInjdLTs8gLIaHuNhxd9hHMijkkJjh1HXZ85HwzzaHhjRBkDRV2/op3GfqP4d/Ahhevg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none header.from=wiwynn.com;
 dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+L2pLNr6OST7OqqM1z4VrJVKY/EwXqhMP1vzf/g7Pi4=;
 b=ZVFwd8gTP1G8I2RmodWAXsf2cYBP9NlqVTXfvXl31fdICGt7IwMWczQiiKwSrV9giq2mqZyhcVTv5vqpHjc9hQZZgtSFofMBNj6rduqyoxpf9ShDEk3D9rr5amzYqzCav2YBvSII18QBDmorLC1yDogyh4VvZRMAjRxou2RVwJGijXYLFgKGTgGDnZ5HEALk/Y0LI+mLHN8nJTlL6/zaD48SNHMWNBpZYBDySzop2QgPi/8LrOOpA4foexPZ0LkNepEBXbZFU5FKhsfdnwrTC6QTQtcphK1mpjITU/I/KK4HCeMO0ehVGq/xtswccyffQui0qW/Z6L6IC9DYtezY4A==
Received: from SG2PR04MB5543.apcprd04.prod.outlook.com (2603:1096:4:172::14)
 by JH0PR04MB7070.apcprd04.prod.outlook.com (2603:1096:990:30::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Tue, 21 Nov
 2023 02:37:48 +0000
Received: from SG2PR04MB5543.apcprd04.prod.outlook.com
 ([fe80::c980:d5d7:4099:fa07]) by SG2PR04MB5543.apcprd04.prod.outlook.com
 ([fe80::c980:d5d7:4099:fa07%3]) with mapi id 15.20.7002.028; Tue, 21 Nov 2023
 02:37:48 +0000
From: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
To: Guenter Roeck <linux@roeck-us.net>, Delphine_CC_Chiu/WYHQ/Wiwynn
	<Delphine_CC_Chiu@wiwynn.com>
CC: "patrick@stwcx.xyz" <patrick@stwcx.xyz>, Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] hwmon: pmbus: Add ltc4286 driver
Thread-Topic: [PATCH v2 2/2] hwmon: pmbus: Add ltc4286 driver
Thread-Index:
 AQHaB+TGZscXMUpHJES8eSDx4MdG9LBcQtiAgAczeDCAAHtcAIAKS76ggAAIJwCADOl6kIAA7DGAgAgcPXA=
Date: Tue, 21 Nov 2023 02:37:48 +0000
Message-ID:
 <SG2PR04MB55438FCD71BB685C9F8A474BA1BBA@SG2PR04MB5543.apcprd04.prod.outlook.com>
References: <20231026081514.3610343-1-Delphine_CC_Chiu@Wiwynn.com>
 <20231026081514.3610343-3-Delphine_CC_Chiu@Wiwynn.com>
 <2ef2e804-d498-a2ae-9717-dd03bfd26853@roeck-us.net>
 <SG2PR04MB5543FEAFC1777ADE29239AC9A1A0A@SG2PR04MB5543.apcprd04.prod.outlook.com>
 <e223764a-c081-4634-810b-56886a29804a@roeck-us.net>
 <SG2PR04MB55436CFA902895FD5472838AA1A9A@SG2PR04MB5543.apcprd04.prod.outlook.com>
 <4b73a239-c90e-4515-b89d-65de15a1e9a9@roeck-us.net>
 <SG2PR04MB55430E53CC7229B5BB5592E7A1B1A@SG2PR04MB5543.apcprd04.prod.outlook.com>
 <e2d17ee5-f09a-4c29-b719-9ac6178af1e4@roeck-us.net>
In-Reply-To: <e2d17ee5-f09a-4c29-b719-9ac6178af1e4@roeck-us.net>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiwynn.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR04MB5543:EE_|JH0PR04MB7070:EE_
x-ms-office365-filtering-correlation-id: 34f7c913-bd24-4b85-2079-08dbea3ad9c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 vkPRuIa1cWHdPGXr9VglLo4bsLOIc9y4XnEhecYi6pLe+gBYNKLKl3P4KlAAzmjUOHxjwQhflcQ+3YhHD/tc1DOYo4IgPdUo4xe8maM+Ibc8sm7Zhpn655kbpQGujfzAwkpBDhChVa0a416SaXGxc2g7URDYEj/D8Fsxpmyi/oHn+qLsWDN7CSKSoFiiNBAUeqIP+MfGmhlsGJwki5/lyrSzIt6CzjfE36TAXVILbKsnPdmBDYrHNvUcHwWp5Q6zAi6/6fNSLX79ZSWUDWGlQ1eZaBsx1UvQTcBYO6UA5Sm1DkdyFQNy8iwRmbB5RSplUKe3F1j4pUY0iKV5W05+NhrNx4ISenzzUMiEtCM4/ATYlkW7Yjd7qljv4fEm3f3pyHsLjFM1FG/qUCDdEj6ooCFPHQJL9cTMlrgWMzr+PGsdY6r47j6ZCZ6qgtvSY0H5SIc71v9lz1Y7QF8a1YihQJDwEdnX/pgAeNUuJ8Rp0Sks6TMoqhdEZn5TmyS4TvGtI5PzL244kSfweVw/4EZjK3uWWPBEV9TKkmqS7X+0hqTT1ttS/HRR4t0mjIgkQ9gkTmuwA7DK3sqDLpjT3cRexJqsb9mIw7DdAbZ4+uHIDRnO5pFU6jXs7T5zsvh3hDv2Iiev3CdzODKoJORgN31I1ubHepLiIScyDFKz02t93CM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR04MB5543.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(366004)(376002)(396003)(136003)(230173577357003)(230273577357003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(316002)(66556008)(110136005)(26005)(41300700001)(66446008)(64756008)(66476007)(76116006)(54906003)(66946007)(122000001)(478600001)(71200400001)(6506007)(83380400001)(53546011)(52536014)(7696005)(9686003)(55016003)(8936002)(8676002)(4326008)(7416002)(2906002)(5660300002)(33656002)(38100700002)(38070700009)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SWtJZHBFc2ZBbnpPa2EvM3NrWnd4MHFEUm9CQWhWZGF6azI1SDdtNkdLdkxV?=
 =?utf-8?B?RnVCc2w4eFh6U1FDUzFvU2FFbzZmYmFDSnFkUnJZdjJXbE5wSUxUbldlTkl3?=
 =?utf-8?B?SDQxQVZmcG5QWXprQ3F5Qzd3S09JVEFNZHA5aUE5VXNvTEozSWNWRURGM2Vn?=
 =?utf-8?B?clQ1Z0tvS3lId25xYU5sdmtNb2lHUGNJdDg0Uitnb2o4Y1pZMkNaRHM2SVVH?=
 =?utf-8?B?QW9pdVM1WkR2NzZVVVh6RWZmeFRSaFJWazhsNjdZMlRDb0pob0Q0bXFoN0tx?=
 =?utf-8?B?bTN5ckFYMVh6M3ZENjIyOUhuZzBPdkZnQWlGNk4zdjErdDdKNVU3RDRBV3lC?=
 =?utf-8?B?bjZBT1o0eGtzRlpmYXJjUkJSMERMTE1OL1grQVpQeEZNOWkwY1J1ZDRZY0xk?=
 =?utf-8?B?RGNlMW1rRXd6b1VYSzQraWdkTndGbG1rdS9VOEZEUFVXZGsvZm9NK3ZUNyt2?=
 =?utf-8?B?dXBNVnlwcWpDUi9VL0pIcVAxTmpRa2lWQnFrdEg4M3BlTmQwOHFhN3V1UmZ0?=
 =?utf-8?B?Y2RxS0k4L3NNY2VKNUlrZGVIQ09OQWRwb2NwSlA4US9PVnpRckdUTlFwdDcw?=
 =?utf-8?B?dXVPRmUvbk5FUGc1ZGRka1JRU1BtRExNbDFPK2JyN2wrSnVpQWhnWkFUNEhq?=
 =?utf-8?B?dDJsODYyUlNXV1Z4bUUzNUVaUEU1SUt1VXN3d0R0dElBM0Z3cm02dERFL2pJ?=
 =?utf-8?B?SmNQVDZyR1NPc1h3RWpMeFFzcXIvdEtvZ1lnUXRKb1pIQkpoUkJGVFVHUW1F?=
 =?utf-8?B?bWxnZHp1VGlPQXdJSXI3QXpTemNMMVZNeVVCQThpOVFTbG1qWXBiMTNoZnl3?=
 =?utf-8?B?WHZra1JoQU9XNGQ2RXNTN2VjYkJValAzQU1pNXFxTm90Sk5jVXNFZjFTWnQ3?=
 =?utf-8?B?d3RIc3dxQTUwck10cG51QnRGSmxLV2tlK3djN055cmFZWEZHNm85ZFRYdnA0?=
 =?utf-8?B?WVZxTGRzcmRtcHA3RjVYRWlRTHhpc1ZHREJBdzQvMGxNWmxWM1g2UTVOVkV4?=
 =?utf-8?B?c2FjbW9hZFQ4N0hVRVFzaU5YRTFnTndyTVJlSDhWY1YyS1VrdXNiNkFCU080?=
 =?utf-8?B?QlBVT0U3Y2Y1UFNUWE9PaFNSMmd2RTlTemZnN01MRWZ4Z0F4QUh5ekQ3alRw?=
 =?utf-8?B?bDcybU4rbkg1RS9OVnE4YXYzQlVJcksrUWozd24yRlhjTlNLd3NMQjZ4WE5p?=
 =?utf-8?B?NjFyQzJnKzRPT1l0eVphWU9SQndNV25MMFJKVGV3aXZMZ21Jb3ZTTG9VM1lF?=
 =?utf-8?B?bTFJY0Q0eGQxVVN4N2o3OGNPczRYYkx1T2RjTGZYOEVkSTA4eTRNK2NzdjhY?=
 =?utf-8?B?UFJZL050N3JIZXJyamxDL2wvVGxmdzVrK2ZGQll2SWFCM0dZUElQN1YxbnZv?=
 =?utf-8?B?cUlCcmttY1I0eURuS3pBTFdGMFc1cFh4VG1sTUcxbHVPNERncTJ4RE8zLzVI?=
 =?utf-8?B?ckYvc1Ntai9wNWJyS0hZbjRKRGErT2pDZUIwaytSNFRZQVFVVW9ZTzdiZ3BZ?=
 =?utf-8?B?TmxzR2tSSk9XVDI4QU5zUE1QbkpyNHNnU0JrdGFaZXc1dDZZR2ZuRmEvdnVo?=
 =?utf-8?B?bm9aUGNNQmg2ZXhjdzRFSjFjdjdxOVk2a21GU3AxVFNQd3l0UEtUQlplMUdJ?=
 =?utf-8?B?V0R2aG5ldTZTTVpIaDBYNjk3U2paVzdsMmVpTUZ1VlVmc09aeGpuMUkrUlcw?=
 =?utf-8?B?RzFmeXdteWd1aXk0SlUxY2FmTVA0V2duNlJGRnFhR0xIT0FkUEYvMVdpSjM1?=
 =?utf-8?B?U3laWDFuMmw3aW90N3hxcHpEVUJicmdYN2EwT0dZaUNOaFptTFFieXBQMWg2?=
 =?utf-8?B?MUdCcEM2RzZIZVVoRlpCUjJyaGtSZ0hvS0JaTXJsTXdnRVV1TTlpM25EMU5U?=
 =?utf-8?B?YUlxRzVLakUvRG5PTXVsZnl1M2tJNzBMTTA2bUdrcC80eTkvN0lUeE1HZGhr?=
 =?utf-8?B?M3BXMWRnUVlhK3puRmc1Q3RSamkwTTBEcWQxdjdYMkhsQjA0cXgrRzAvWm1W?=
 =?utf-8?B?cjM3eEhNeVc5REVFTVBaaEh4SEpxcjV2dklhVW5lc1ZiTHI3UEJCcW1OK2tM?=
 =?utf-8?B?SnBFVEN6UXUwUGl3U2dUYmN6ZDgxZVA0cHJ1SURhSzltTG9iNE4xdHBOTU5j?=
 =?utf-8?Q?NxQ3OAqDQ/0dAW8+arlq73woO?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR04MB5543.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34f7c913-bd24-4b85-2079-08dbea3ad9c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2023 02:37:48.5301
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bjTwzmeXOcqQ9tQ/r5yzuD08vnd9HHvAhAdW5kuaJ0O4n68sgIDSOHPr84x7Hqp2axIUwJxGdtTFGPW40NIsxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB7070

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHdWVudGVyIFJvZWNrIDxncm9l
Y2s3QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIEd1ZW50ZXIgUm9lY2sNCj4gU2VudDogVGh1cnNk
YXksIE5vdmVtYmVyIDE2LCAyMDIzIDY6NDYgQU0NCj4gVG86IERlbHBoaW5lX0NDX0NoaXUvV1lI
US9XaXd5bm4gPERlbHBoaW5lX0NDX0NoaXVAd2l3eW5uLmNvbT4NCj4gQ2M6IHBhdHJpY2tAc3R3
Y3gueHl6OyBKZWFuIERlbHZhcmUgPGpkZWx2YXJlQHN1c2UuY29tPjsgSm9uYXRoYW4gQ29yYmV0
DQo+IDxjb3JiZXRAbHduLm5ldD47IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBL
cnp5c3p0b2YgS296bG93c2tpDQo+IDxrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc+
OyBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+Ow0KPiBsaW51eC1pMmNAdmdlci5r
ZXJuZWwub3JnOyBsaW51eC1od21vbkB2Z2VyLmtlcm5lbC5vcmc7DQo+IGRldmljZXRyZWVAdmdl
ci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiBsaW51eC1kb2NA
dmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMi8yXSBod21vbjogcG1i
dXM6IEFkZCBsdGM0Mjg2IGRyaXZlcg0KPiANCj4gICBTZWN1cml0eSBSZW1pbmRlcjogUGxlYXNl
IGJlIGF3YXJlIHRoYXQgdGhpcyBlbWFpbCBpcyBzZW50IGJ5IGFuIGV4dGVybmFsDQo+IHNlbmRl
ci4NCj4gDQo+IE9uIFdlZCwgTm92IDE1LCAyMDIzIGF0IDA4OjQyOjIyQU0gKzAwMDAsDQo+IERl
bHBoaW5lX0NDX0NoaXUvV1lIUS9XaXd5bm4gd3JvdGU6DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogR3VlbnRlciBSb2VjayA8Z3JvZWNrN0BnbWFpbC5jb20+
IE9uIEJlaGFsZiBPZiBHdWVudGVyIFJvZWNrDQo+ID4gPiBTZW50OiBUdWVzZGF5LCBOb3ZlbWJl
ciA3LCAyMDIzIDExOjMwIEFNDQo+ID4gPiBUbzogRGVscGhpbmVfQ0NfQ2hpdS9XWUhRL1dpd3lu
bg0KPiA8RGVscGhpbmVfQ0NfQ2hpdUB3aXd5bm4uY29tPjsNCj4gPiA+IHBhdHJpY2tAc3R3Y3gu
eHl6OyBKZWFuIERlbHZhcmUgPGpkZWx2YXJlQHN1c2UuY29tPjsgSm9uYXRoYW4gQ29yYmV0DQo+
ID4gPiA8Y29yYmV0QGx3bi5uZXQ+DQo+ID4gPiBDYzogUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2Vy
bmVsLm9yZz47IEtyenlzenRvZiBLb3psb3dza2kNCj4gPiA+IDxrcnp5c3p0b2Yua296bG93c2tp
K2R0QGxpbmFyby5vcmc+OyBDb25vciBEb29sZXkNCj4gPiA+IDxjb25vcitkdEBrZXJuZWwub3Jn
PjsgbGludXgtaTJjQHZnZXIua2VybmVsLm9yZzsNCj4gPiA+IGxpbnV4LWh3bW9uQHZnZXIua2Vy
bmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7DQo+ID4gPiBsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnOyBsaW51eC1kb2NAdmdlci5rZXJuZWwub3JnDQo+ID4gPiBTdWJqZWN0
OiBSZTogW1BBVENIIHYyIDIvMl0gaHdtb246IHBtYnVzOiBBZGQgbHRjNDI4NiBkcml2ZXINCj4g
PiA+DQo+ID4gPiAgIFNlY3VyaXR5IFJlbWluZGVyOiBQbGVhc2UgYmUgYXdhcmUgdGhhdCB0aGlz
IGVtYWlsIGlzIHNlbnQgYnkgYW4NCj4gPiA+IGV4dGVybmFsIHNlbmRlci4NCj4gPiA+DQo+ID4g
PiBPbiAxMS82LzIzIDE5OjA4LCBEZWxwaGluZV9DQ19DaGl1L1dZSFEvV2l3eW5uIHdyb3RlOg0K
PiA+ID4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+ID4+IEZyb206IEd1ZW50
ZXIgUm9lY2sgPGdyb2VjazdAZ21haWwuY29tPiBPbiBCZWhhbGYgT2YgR3VlbnRlcg0KPiA+ID4g
Pj4gUm9lY2sNCj4gPiA+ID4+IFNlbnQ6IFR1ZXNkYXksIE9jdG9iZXIgMzEsIDIwMjMgOTo0NyBQ
TQ0KPiA+ID4gPj4gVG86IERlbHBoaW5lX0NDX0NoaXUvV1lIUS9XaXd5bm4NCj4gPERlbHBoaW5l
X0NDX0NoaXVAd2l3eW5uLmNvbT47DQo+ID4gPiA+PiBwYXRyaWNrQHN0d2N4Lnh5ejsgSmVhbiBE
ZWx2YXJlIDxqZGVsdmFyZUBzdXNlLmNvbT47IEpvbmF0aGFuDQo+ID4gPiA+PiBDb3JiZXQgPGNv
cmJldEBsd24ubmV0Pg0KPiA+ID4gPj4gQ2M6IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5v
cmc+OyBLcnp5c3p0b2YgS296bG93c2tpDQo+ID4gPiA+PiA8a3J6eXN6dG9mLmtvemxvd3NraStk
dEBsaW5hcm8ub3JnPjsgQ29ub3IgRG9vbGV5DQo+ID4gPiA+PiA8Y29ub3IrZHRAa2VybmVsLm9y
Zz47IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmc7DQo+ID4gPiA+PiBsaW51eC1od21vbkB2Z2Vy
Lmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOw0KPiA+ID4gPj4gbGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtZG9jQHZnZXIua2VybmVsLm9yZw0KPiA+ID4g
Pj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAyLzJdIGh3bW9uOiBwbWJ1czogQWRkIGx0YzQyODYg
ZHJpdmVyDQo+ID4gPiA+Pg0KPiA+ID4gPj4gICAgU2VjdXJpdHkgUmVtaW5kZXI6IFBsZWFzZSBi
ZSBhd2FyZSB0aGF0IHRoaXMgZW1haWwgaXMgc2VudCBieQ0KPiA+ID4gPj4gYW4gZXh0ZXJuYWwg
c2VuZGVyLg0KPiA+ID4gPj4NCj4gPiA+ID4+IE9uIDEwLzMwLzIzIDIzOjQ2LCBEZWxwaGluZV9D
Q19DaGl1L1dZSFEvV2l3eW5uIHdyb3RlOg0KPiA+ID4gPj4gWyAuLi4gXQ0KPiA+ID4gPj4+Pg0K
PiA+ID4gPj4+Pj4gKw0KPiA+ID4gPj4+Pj4gKyAgICAgcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91
MzIoY2xpZW50LT5kZXYub2Zfbm9kZSwNCj4gPiA+ID4+Pj4+ICsNCj4gInNodW50LXJlc2lzdG9y
LW1pY3JvLW9obXMiLA0KPiA+ID4gPj4+PiAmcnNlbnNlKTsNCj4gPiA+ID4+Pj4+ICsgICAgIGlm
IChyZXQgPCAwKQ0KPiA+ID4gPj4+Pj4gKyAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiA+ID4g
Pj4+Pj4gKw0KPiA+ID4gPj4+Pj4gKyAgICAgaWYgKHJzZW5zZSA9PSAwKQ0KPiA+ID4gPj4+Pj4g
KyAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiA+ID4+Pj4+ICsNCj4gPiA+ID4+Pj4+
ICsgICAgIGluZm8gPSAmbHRjNDI4Nl9pbmZvOw0KPiA+ID4gPj4+Pj4gKw0KPiA+ID4gPj4+Pj4g
KyAgICAgLyogRGVmYXVsdCBvZiBWUkFOR0VfU0VMRUNUID0gMSwgMTAyLjRWICovDQo+ID4gPiA+
Pj4+PiArICAgICBpZiAoZGV2aWNlX3Byb3BlcnR5X3JlYWRfYm9vbCgmY2xpZW50LT5kZXYsDQo+
ID4gPiA+Pj4+ICJhZGksdnJhbmdlLXNlbGVjdC0yNXA2IikpIHsNCj4gPiA+ID4+Pj4NCj4gPiA+
ID4+Pj4gV2hhdCBpZiB0aGUgYWRpLHZyYW5nZS1zZWxlY3QtMjVwNiBwcm9wZXJ0eSBpcyBub3Qg
cHJvdmlkZWQsDQo+ID4gPiA+Pj4+IGJ1dCB0aGUgY2hpcCBpcyBwcm9ncmFtbWVkIGZvciB0aGlz
IHJhbmdlID8NCj4gPiA+ID4+PiBUaGUgYmluZGluZyBkb2N1bWVudCB0ZWxscyBwcm9ncmFtbWVy
cyBob3cgdG8gZmlsbCB0aGUgZHRzLg0KPiA+ID4gPj4+IFRodXMsIHByb2dyYW1tZXJzIG11c3Qg
ZmlsbCB0aGlzIHByb3BlcnR5IGlmIHRoZWlyIHN5c3RlbSBpcw0KPiA+ID4gPj4+IDI1LjYgdm9s
dHMgdm9sdGFnZQ0KPiA+ID4gPj4gcmFuZ2UuDQo+ID4gPiA+Pj4NCj4gPiA+ID4+DQo+ID4gPiA+
PiBTdXJlLCBidXQgdGhlcmUgaXMgbm8gZWxzZSBjYXNlLCBtZWFuaW5nIFZSQU5HRV9TRUxFQ1Qg
aXMNCj4gPiA+ID4+IHVubW9kaWZpZWQgaW4gdGhhdCBjYXNlLiBUaGVyZSBpcyBubyBndWFyYW50
ZWUgdGhhdCB0aGUgY2hpcCBpcyBpbiBpdHMNCj4gcG93ZXItb24gc3RhdGUuDQo+ID4gPiA+DQo+
ID4gPiA+IFRoZSBlbHNlIGNhc2UgaXMgaW4gdjIgbHRjNDI4Ni5jIGxpbmUgMTMzIEl0IG1lYW5z
IHRoYXQgdGhlDQo+ID4gPiA+IHZvbHRhZ2UgcmFuZ2UgZm9yIHByb2dyYW1tZXIgaXMgMTAyLjQg
dm9sdHMgd2hpY2ggaXMgZGVmYXVsdA0KPiA+ID4gPiB2YWx1ZSwgc28gZHJpdmVyIGRvZXNuJ3Qg
bmVlZCB0byBkbyBhbnkgY2hhbmdlIGZvciBWUkFOR0VfU0VMRUNUIGJpdC4NCj4gPiA+DQo+ID4g
PiBUaGVyZSBpcyBubyBndWFyYW50ZWUgdGhhdCB0aGUgdmFsdWUgd2Fzbid0IGNoYW5nZWQgYmVm
b3JlIHRoZQ0KPiA+ID4gZHJpdmVyIHdhcyBsb2FkZWQuDQo+ID4NCj4gPiBXZSBzdGlsbCBjYW7i
gJl0IGdldCB5b3VyIHBvaW50Lg0KPiA+IENvdWxkIHlvdSB0ZWxsIHVzIGFib3V0IHlvdXIgY29u
Y2VybiBoZXJlPw0KPiANCj4gSSBoYXZlIHJlcGVhdGVkIGl0IHNldmVyYWwgdGltZXMuIFlvdSBh
cmUgbWFraW5nIGFzc3VtcHRpb25zIGFib3V0IHJlZ2lzdGVyDQo+IHZhbHVlcyB3aGVuIHRoZSBk
cml2ZXIgaXMgbG9hZGVkLiBUaG9zZSBhc3VtcHRpb25zIGFyZSB3cm9uZyBzaW5jZSB0aGUgc3Rh
dGUNCj4gb2YgdGhlIGNoaXAgaXMgdW5rbm93biB3aGVuIHRoZSBkcml2ZXIgaXMgbG9hZGVkLiBB
bnkgZW50dHkgKEJJT1MsIFJPTU1PTiwNCj4gaTJjc2V0LCBzb21lIG9wZXJhdGluZyBzeXN0ZW0g
bG9hZGVkIGVhcmxpZXIsIG9yIGV2ZW4gc29tZSBvdGhlciBkcml2ZXIgb3INCj4gcGxhdGZvcm0g
Y29kZSkgbWF5IGhhdmUgY2hhbmdlZCB0aG9zZSB2YWx1ZXMuDQo+IA0KPiBPbiB0b3Agb2YgdGhh
dCwgYXMgSSBhbHNvIGhhdmUgcG9pbnRlZCBvdXQsIExUQzQyODcgc3VwcG9ydHMgc2F2aW5nIGl0
cw0KPiBjb25maWd1cmF0aW9uIGRhdGEgaW4gZWVwcm9tLiBUaGF0IG1lYW5zIHRoYXQgYW55IGNo
aXAgY29uZmlndXJhdGlvbiBzZXQNCj4gZHVyaW5nIHByb2R1Y3Rpb24gb3IgYW55dGltZSBsYXRl
ciB3aWxsIGJlIHJldGFpbmVkLCBtZWFuaW5nIGFueSBhc3N1bXB0aW9uDQo+IGFib3V0IGNoaXAg
Y29uZmlndXJhdGlvbiB3aGVuIHRoZSBkcml2ZXIgaXMgbG9hZGVkIGlzIGV2ZW4gbW9yZSB3cm9u
Zy4NCg0KT0sNCldlIHdpbGwgY2hlY2sgdGhlIHJlZ2lzdGVyIHZhbHVlIGZpcnN0Lg0KVGhlbiwg
d2Ugd2lsbCBjaGVjayB0aGUgcHJvcGVydHkgaW4gZHRzLg0KDQo+IA0KPiBHdWVudGVyDQo=


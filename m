Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7FEC5BFEB4
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Sep 2022 15:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbiIUNMZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Sep 2022 09:12:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiIUNMX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Sep 2022 09:12:23 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 430CE82752;
        Wed, 21 Sep 2022 06:12:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DcTjiH86M0HNQ7zxGyN0D2EiD1FoZU7E3df1tL66nqsp7fOxwWrNyxicIjTGYwDwq5oVgdxQvTsnmZ++zz+FXKE8sLnmjqV6RNblZawuEEBNXwAEyN9sWhM+X8WsUPm8HV8Y8vymEVMP5GXT+ClHHfD0dDFCkpHfxzmFSBUT37mTOvLWKcmg2kYRsC9mOZ5K5goazSRvHHJ1AzHwAE8IAzwHXyzYdZWZWk4xjbT4H0y5MRc57R8pmzGO27D3SG9r9FHo5uFp9py1xmU+ECJ1XEKxGPp3Qq4BLd/o6Mq4V+0aTMCMNNRDKyLTWtChBO6VwW8gv9+PxuDdi4To8+UzpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XrtBwVMYTQjAqBtdkh/jRYNgM2zxKfEISRYKEpr+Bc=;
 b=HIEsUVotdFuDEqOlllbk0zLMQn8hiNrgQf8VdBFjAye+8N6DHdOEK4RUMJidar7KSO7GajymIxTIvg/ORO29Lic/ogWYK3aU3O69+OyHyK49U2zzWJ95NnykuZPOKLNnj+OLCf0w1QU979mJEFfl3ys5ufMe7PU9OuGPzaIVPeXpycql5tTPCDmynBVMqaj/aVzDEpjXrys+jRiB3llkJhqPzvSTZz591wXuVYqXE2OMEj5wCCFS6HfY9DIBCz/mXJOwdrFq5zFnSK4u2320q02ceSY/O0m+cNT9TKtF7TQYoeSQynSv1faNUU8Z3cjTINh4ADa+llt5Qus005Jxtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1XrtBwVMYTQjAqBtdkh/jRYNgM2zxKfEISRYKEpr+Bc=;
 b=IFKwGR+BPM/kL+0UGcENDG4hJFVhdVsNOeK+iSdgsXsyCJerZIoOKs4D6552PWJXHQsyX3dOmNpVpEQBXjLAw5r1K0OGQ42XaMMXQyDPBRYM5rYckLKCgV2Yb+j8vYAPgs2tlUDnPkoLu33p3fEIe9tHCZiU97lgUQautzRc2zosKymHElr+ebhx3YhgYFg83vYosR0nDtikz3aS8KAtSVEIOdnm8vQjznhNKiW3oehD+zQsQY+FyWFpHNSEwA6L+HJXb8uaUcGrgw09BC3WoECI9GjwEaDvmEVY3Irt1a7NPltUMft9p1V8+SdYMlKOr7S3IsbrtKbCSuIuG1xioA==
Received: from CH2PR12MB3895.namprd12.prod.outlook.com (2603:10b6:610:2a::13)
 by CH2PR12MB4086.namprd12.prod.outlook.com (2603:10b6:610:7c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14; Wed, 21 Sep
 2022 13:12:20 +0000
Received: from CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::7129:e05:131a:b109]) by CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::7129:e05:131a:b109%5]) with mapi id 15.20.5654.017; Wed, 21 Sep 2022
 13:12:19 +0000
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Khalil Blaiech <kblaiech@nvidia.com>
Subject: RE: [PATCH v5 8/8] i2c: i2c-mlxbf.c: Update binding devicetree
Thread-Topic: [PATCH v5 8/8] i2c: i2c-mlxbf.c: Update binding devicetree
Thread-Index: AQHYzRkuwHxVxW18Gkmk53vw2a7jHK3pc/cAgABn09A=
Date:   Wed, 21 Sep 2022 13:12:19 +0000
Message-ID: <CH2PR12MB3895572575B5BED5DAFFAA29D74F9@CH2PR12MB3895.namprd12.prod.outlook.com>
References: <20220920174736.9766-1-asmaa@nvidia.com>
 <20220920174736.9766-9-asmaa@nvidia.com>
 <20220921065506.6cu6p2cpu3zfhtie@krzk-bin>
In-Reply-To: <20220921065506.6cu6p2cpu3zfhtie@krzk-bin>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB3895:EE_|CH2PR12MB4086:EE_
x-ms-office365-filtering-correlation-id: ef5fd468-147a-4b07-7d2f-08da9bd2ea1a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y588ZLLR3v+upNixBwJDRhA5C+lDqjf5OupQPNgOHxI0xyH4GG5sVxtVmcWrbyoWiR0GgMF54ay23VBuU4McVFJXMJ/Roz5lsqShY9v3u87i+Q1nuMMSJ8ewW48SxEgba6SzdrKsxTqhuPmoPLTPhKDmkWAc1gzY6Jf6JxTk9QRSkquk+QJdpU5swOQJl3jS94NE+BEzyjgvCzMWJ0AW4uwc5rLRnuEtvak8O/yoec4HfaDFxlMq4cdkxqTB9AbSZPhBs2eTrzFvWD/JaoZ/sDg4k8Wf7NWjgKy05nas4QaP/WCYDUcmtorJ+lUHC1G1iZEn07WyQEVSgX7FfMzofixquoOWyZMlMaIUpAGlYWDT2MLVJ7c5E2bIhI+oz1dZiTZMUtXHx87MTjxET2OtxQnhzFdi2zLFUrGkELZeZiI+zvk5W6xcJhJ4EXNizQVKRxofhGAgWCjwljxOYOzx1nv/Z2HJS6d90lPx8HcPR/zuwHprZdaUHVnMbWV75cOb3EVoR0Dqy+EBDT1SUPZ4WOXvyp31nLO2oH/9EXM+LPheV0o9Owi5sJaMWD6Ie3xMnz7uLEX/sAEnaiKRzkck8qvyf5nc0pU7jS5T6nKi2lAzgF8l3KVOcLZ/pg3/izZeAnk01YTHooJlPLGoNPCBb7u7XinlanFJ91ShAmbpF1GabxFzi61HfBwKk4t14/8Q1QnNsvn6PER2xqtle7QM6st+edYInBpHOsAnznnnVUv3OKOEEJfbEJrJ93cADbZgXsjO6kShER3CH2F1kTzA/q3r+0yrUEnWDOZkJPF0a10INwNBM0kEkhHc1wTuhUecRcM3yccFPsqZzLpy+wcKxUlyZL69460xxBMGKQkWt8M=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3895.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(136003)(39860400002)(396003)(346002)(451199015)(186003)(83380400001)(26005)(9686003)(53546011)(33656002)(15650500001)(107886003)(86362001)(4326008)(66556008)(66476007)(66446008)(64756008)(8676002)(66946007)(54906003)(6916009)(316002)(122000001)(966005)(52536014)(2906002)(5660300002)(478600001)(38100700002)(8936002)(7696005)(76116006)(55016003)(38070700005)(41300700001)(71200400001)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZzNxM2dHQVpCNWJVQXgyMFVYTmU5cHlQWHVNMUJTYXg2dHQvRjZnSXVyc0Fy?=
 =?utf-8?B?T3p6cnFqZkEzaFdkTGVQQXlEUXV6U2gxNHlscGtqeUZCZ0c5SDZ5bCs5Szkv?=
 =?utf-8?B?SmY3Y2VVMHRLUTc2WklPTk5BRnRnUHFqS3cxbWNwckJvV2pOVHFYUUh0RGwx?=
 =?utf-8?B?Z3g4T2VFd0QyRVowVUVHRlFrV3lzNW82M0w5cUxsaENNK2ZRZEFYQkJDaFlK?=
 =?utf-8?B?OWZxc2I5OE1kOGVPQjRGVnhYMHY4Wm9UVExnVlJtclZ6WGthR21VUytNZnUx?=
 =?utf-8?B?MVZnOGNsMHdsNm5DSWg4ZThUM05HSTlVeFJKU2N0Y1pEbi9pak5PWEF0Tzl2?=
 =?utf-8?B?Q1VMMThFM1lJbml0cjNteHRWUERXdlpKNkYvWUROMEhhWWxtU0J2Y3M4ZDNH?=
 =?utf-8?B?ODU2K09SNDZJVk9hM1dyNE9aRDY0d3RaWDJtMkZSU255TFN4K0RpYm9DUU53?=
 =?utf-8?B?cTBGSUlNZS9NaXMyWHRkcXp2djBza3ZGVW02aEZucVd0aFQ4enYvWTFXSURY?=
 =?utf-8?B?NVdxSndGTFZxY2dFZ0dMUFhvMFNaYU9jSEIwV2lKbTBrekJSSTVWR3puTlFh?=
 =?utf-8?B?cHByNEcvSlZFaXRpZzJIM2ZvZGtnczdMODlnWTl5RFo4NVBjNElYU25pRTNP?=
 =?utf-8?B?dkFlWGdhdnNIMkp2WTFYbUxUQWREbm9obFdiTldCNGJsV0dMbXdiYndqUmtw?=
 =?utf-8?B?cmN3ZFVhRVM4NExqWnNpdTV5djZXRCtJQW5WamVxdU9mekVjb2N0VXFYZ0Fy?=
 =?utf-8?B?Z2FBMFNySWhUaFBQWVUvWTZyUE9vQnJ0RTAwdFA0aEJ5NjRYRWVoTnRBbjAw?=
 =?utf-8?B?L2s1Q29XUi95RU81eXF5eVlRZEpOd0lVSUszV3lreXhLTStWeHBETE5MRUdT?=
 =?utf-8?B?WnQ4MTFDVENJeUFveTR3REZQdUE1ck92ZmFXbXczeDB1eHJibXZ3emt3QnZI?=
 =?utf-8?B?NE41TldDTytUL3lOaXBMQ2ZubEcwZjFuM2J4bDlkenJhekxPMVRWZ3FuQTVK?=
 =?utf-8?B?MXNTeGZtTmlocHNLdnNjWW1ialU4WHdkNmlHb3NPemZiam9BYlRyQUQ5UDZQ?=
 =?utf-8?B?dVhiQVErSHZ2RDlOSFdXY0svbkRMTTFuNS9uTkhRdVRLYkJLQTBSZlpyRERJ?=
 =?utf-8?B?YW5DcHc2SlZvR2h6M3VtdHVhUENnK2E0VmYyNGZYM0d5bm5qUEp6K0d4RE01?=
 =?utf-8?B?MEE2TExSSERHVkltQm5ydEtQaDNFVTJSTVF1RzhqQ3NMSzZhblZ0OXVtZm9k?=
 =?utf-8?B?VU9vMjhPNVYwWkNuZ3NrQ0w1TmJ6M1Azbmd3cldsVnpqbitveUpSUnJ0TVQ5?=
 =?utf-8?B?OHZwOGdlVmtGM1dSVnRRS0JETnVHckdXN0Rsc3RiSEVFb2ViNEFueEEvVWhV?=
 =?utf-8?B?aHI3K3Q0L3NGQjJUZDA2ZXZJTzk0WEdwV3QxNFNzOEovWlhwRnFxbEhpSUh1?=
 =?utf-8?B?alZVV3N5SXB6SStzWWtCWHkzaXlpZHVwNTcxcndsdzhDa2NNSFIxRjVlYTJK?=
 =?utf-8?B?MEJpb013OTRNS2tZL3poVDhOZ2VhTjFBU05pSG9KUHlsOFp3MGZWY0pSWjRt?=
 =?utf-8?B?bk5CZWV4RnZXSnlaM3p4NEdUNmt5ZzdwSFlUbit2bmlBUGg0cm02WGI3K3o1?=
 =?utf-8?B?bWZxQkVyQk5xa2MrWEt2WTRYN2VwaXp3bzd4UW9BSnZ4WTBNUUxmSWtSTzVD?=
 =?utf-8?B?NUFoL3FYNlhEY0lKeXFKY05Pdy9SeGlGbUY4ck5mYXRITzZoSElOTnBxd0Ji?=
 =?utf-8?B?bmtneklVUXNUblhXQ0wyWCtpaUtsVmQyRU9xalZMUzdPVzBUQVVQKzJBWXpR?=
 =?utf-8?B?bzdnY0F4b2NnOG52S1BSMjdQZlNBcmZ4M1d2L0N2VCtKWm1SZFNOV29ZbUpR?=
 =?utf-8?B?b1QzY0xWb1NXOU5zR3YzamxmMzB2bVIxbVI3VncrZXRxWkx3VTEzQ0svcXZL?=
 =?utf-8?B?SnlqREFPM29FcWwxQUthdnUrU0ZON1hPR1g5VzErNVVud0FCc1JsVnlDK2tE?=
 =?utf-8?B?UUNoMFFpZkpCWXJ1dGdTTkZGREw0OVFuRSt4NUNhVlQvUDRmME5mdGVpVVEr?=
 =?utf-8?B?VWt2dTRQVWplZEptME9BOTYvOWhUeHJTYW9sTk1MOXRHQi9FRXpPMmo5WXNy?=
 =?utf-8?Q?kp2s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3895.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef5fd468-147a-4b07-7d2f-08da9bd2ea1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2022 13:12:19.8763
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YRXUExbVPY4A5H5kCdbdFn/bzrUE9KEASJIaxsZwxhOXcSwNMgoeS1FAGzI+yw1+AjAb7jkvvWw+qOCy9O+HbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4086
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SSBoYXZlIGEgcXVlc3Rpb24gZm9yIHlvdSBhbmQgV29sZnJhbSwgd2UgZG9u4oCZdCB1c2UgZGV2
aWNlIHRyZWVzIGFuZCBhcmUgbm90IHBsYW5uaW5nIHRvIHVzZSBkZXZpY2UgdHJlZXM7IHdlIG9u
bHkgdXNlIEFDUEkgdGFibGVzLiBCdXQgSSB0aGluayB3aGVuIEtoYWxpbCBzdWJtaXR0ZWQgdGhl
IGZpcnN0IHZlcnNpb24gb2YgdGhlIGkyYy1tbHhiZi5jIGRyaXZlciwgaXQgd2FzIHJlcXVlc3Rl
ZCBmcm9tIGhpbSB0byBhZGQgZGV2aWNldHJlZSBzdXBwb3J0LiBEbyB5b3Uga25vdyB3aHk/IElz
IGl0IHBvc3NpYmxlIHRvIHJlbW92ZSB0aGUgZGV2aWNlIHRyZWUgc3VwcG9ydCBhbmQgc28gdGhp
cyBkb2M/IG9yIGlzIGRldmljZXRyZWUgc3VwcG9ydCBhIHJlcXVpcmVtZW50IHJlZ2FyZGxlc3Mg
b2YgdGhlIGFjdHVhbCBpbXBsZW1lbnRhdGlvbj8gDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQpGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFy
by5vcmc+IA0KU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMjEsIDIwMjIgMjo1NSBBTQ0KVG86
IEFzbWFhIE1uZWJoaSA8YXNtYWFAbnZpZGlhLmNvbT4NCkNjOiBXb2xmcmFtIFNhbmcgPHdzYSty
ZW5lc2FzQHNhbmctZW5naW5lZXJpbmcuY29tPjsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9y
Zzsgcm9iaEBrZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgtaTJj
QHZnZXIua2VybmVsLm9yZzsgS2hhbGlsIEJsYWllY2ggPGtibGFpZWNoQG52aWRpYS5jb20+DQpT
dWJqZWN0OiBSZTogW1BBVENIIHY1IDgvOF0gaTJjOiBpMmMtbWx4YmYuYzogVXBkYXRlIGJpbmRp
bmcgZGV2aWNldHJlZQ0KDQpPbiBUdWUsIDIwIFNlcCAyMDIyIDEzOjQ3OjM2IC0wNDAwLCBBc21h
YSBNbmViaGkgd3JvdGU6DQo+IEluIHRoZSBsYXRlc3QgdmVyc2lvbiBvZiB0aGUgaTJjLW1seGJm
LmMgZHJpdmVyLCB0aGUgIlNtYnVzIGJsb2NrIg0KPiByZXNvdXJjZSB3YXMgYnJva2VuIGRvd24g
dG8gMyBzZXBhcmF0ZSByZXNvdXJjZXMgIlNtYnVzIHRpbWVyIiwgIlNtYnVzIA0KPiBtYXN0ZXIi
IGFuZCAiU21idXMgc2xhdmUiIHRvIGFjY29tbW9kYXRlIGZvciBCbHVlRmllbGQtMyBTb0MgDQo+
IHJlZ2lzdGVycycgY2hhbmdlcy4NCj4gDQo+IFJldmlld2VkLWJ5OiBLaGFsaWwgQmxhaWVjaCA8
a2JsYWllY2hAbnZpZGlhLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogQXNtYWEgTW5lYmhpIDxhc21h
YUBudmlkaWEuY29tPg0KPiAtLS0NCj4gIC4uLi9iaW5kaW5ncy9pMmMvbWVsbGFub3gsaTJjLW1s
eGJmLnlhbWwgICAgICB8IDQ4ICsrKysrKysrKysrKysrLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAzNiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkNCj4gDQoNCk15IGJvdCBmb3VuZCBl
cnJvcnMgcnVubmluZyAnbWFrZSBEVF9DSEVDS0VSX0ZMQUdTPS1tIGR0X2JpbmRpbmdfY2hlY2sn
DQpvbiB5b3VyIHBhdGNoIChEVF9DSEVDS0VSX0ZMQUdTIGlzIG5ldyBpbiB2NS4xMyk6DQoNCnlh
bWxsaW50IHdhcm5pbmdzL2Vycm9yczoNCg0KZHRzY2hlbWEvZHRjIHdhcm5pbmdzL2Vycm9yczoN
CkVycm9yOiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL21lbGxhbm94LGky
Yy1tbHhiZi5leGFtcGxlLmR0czoyNi4xOS0yMCBzeW50YXggZXJyb3IgRkFUQUwgRVJST1I6IFVu
YWJsZSB0byBwYXJzZSBpbnB1dCB0cmVlDQptYWtlWzFdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUu
bGliOjM4NDogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9tZWxsYW5veCxp
MmMtbWx4YmYuZXhhbXBsZS5kdGJdIEVycm9yIDENCm1ha2VbMV06ICoqKiBXYWl0aW5nIGZvciB1
bmZpbmlzaGVkIGpvYnMuLi4uDQptYWtlOiAqKiogW01ha2VmaWxlOjE0MjA6IGR0X2JpbmRpbmdf
Y2hlY2tdIEVycm9yIDINCg0KZG9jIHJlZmVyZW5jZSBlcnJvcnMgKG1ha2UgcmVmY2hlY2tkb2Nz
KToNCg0KU2VlIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcGF0Y2gvDQoNClRoaXMgY2hl
Y2sgY2FuIGZhaWwgaWYgdGhlcmUgYXJlIGFueSBkZXBlbmRlbmNpZXMuIFRoZSBiYXNlIGZvciBh
IHBhdGNoIHNlcmllcyBpcyBnZW5lcmFsbHkgdGhlIG1vc3QgcmVjZW50IHJjMS4NCg0KSWYgeW91
IGFscmVhZHkgcmFuICdtYWtlIGR0X2JpbmRpbmdfY2hlY2snIGFuZCBkaWRuJ3Qgc2VlIHRoZSBh
Ym92ZSBlcnJvcihzKSwgdGhlbiBtYWtlIHN1cmUgJ3lhbWxsaW50JyBpcyBpbnN0YWxsZWQgYW5k
IGR0LXNjaGVtYSBpcyB1cCB0bw0KZGF0ZToNCg0KcGlwMyBpbnN0YWxsIGR0c2NoZW1hIC0tdXBn
cmFkZQ0KDQpQbGVhc2UgY2hlY2sgYW5kIHJlLXN1Ym1pdC4NCg==

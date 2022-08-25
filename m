Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9928A5A16DC
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Aug 2022 18:41:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241383AbiHYQlR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Aug 2022 12:41:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233141AbiHYQlL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Aug 2022 12:41:11 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42439B9FBA;
        Thu, 25 Aug 2022 09:41:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cKsjGpne0j5W5GsINeIGquRHJD5iMnmNor/Ns69ZliLMwqvNYwtDKOfW3qFklER9EkBybY1JsbJFdd8XQj1NzoTV6+0MiBhf/ao3mJxOZp3Gq4crVsHI9LAoocOeisbIlUm+WB7VMgQ3CWjhneNOM8gDTlBOBlthfmQElUXbRwlN7MA351KykPQZGJYD/qrREz8sgzZYD+yNl58UZPRlO60QsGDy/4yYGK0xJT6kfYsBPzxaHqV5Nn3MY71pNhc9Geip231ImmU8n+Z5Lt1fg5lgDdPzd35CZzS8cILyL6ADjWr8aWrMO+1QxlHZ/y+xBmVzSoWwmovysLSfzSO4zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4+B3s8BolKbMsrP5sUzNH5m4pIphX+jXjoiOxKpS2g=;
 b=il5pFwKR6gVBaQ2nX6o3wrJa3eFrMIECZ35BHnTW87IZQW9Gtz/pM1hYM/coQEjeKBwr3P7dPg4x1/UPhvyFle+lNfHCjZHNJbH/5B1SjnO3ZG5tBjpMLoObMwIovCdDyIdlfT+m1/PccYT0WZY4KHMzBE0xGBQycQEgjn1X6Y7WnvpnDwn3mpln50sxuymDtZ29jko+F0BwS6g/tLqKp5WBFCiHmTeBXUQTlpatYiQunbK1o51ZLghXflI7LVfjU0RNAMWp31pUOMGV8CWXCPzttMxTILWNzjfIcC7zhPrRWHfq+M0kx2otQB2WOpwoanpvMoooWExRZYcQQGJ3xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c4+B3s8BolKbMsrP5sUzNH5m4pIphX+jXjoiOxKpS2g=;
 b=XXc5P7Q8ZKhqf55YCFr9nj7hQrs4XkN9z0leNFbrTHSPOw0/qkBU3U1Z7+e7y2uK+0h9aHo6laYjM6Pwnsb2wmTKtBFPRPljqqiSqS05bMPPbOBrwvGqemUMxKjBBDAo5ZnLdJeo27ahexGSJ0OekA4pKv+XiR6W6OqZiPdysp8luXO6/BMkxDEtGefmQ2vDX7j8IlDPSJxODeJlRbGFIRX9LxSLTniq318o2ssrzPeADEJUnGuJtgIvtMRjWVtOdVzY4DoLDZih3Qzvswu5+iTbAndTrIkIq5tH3QyZRPfIL5/oiYwU4fQez8m6hPJKFJ66/zeXHkO1EhpPIQvFtA==
Received: from SJ1PR12MB6339.namprd12.prod.outlook.com (2603:10b6:a03:454::10)
 by CY4PR1201MB2484.namprd12.prod.outlook.com (2603:10b6:903:d7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 16:41:08 +0000
Received: from SJ1PR12MB6339.namprd12.prod.outlook.com
 ([fe80::24cb:46cd:5176:aa13]) by SJ1PR12MB6339.namprd12.prod.outlook.com
 ([fe80::24cb:46cd:5176:aa13%8]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 16:41:08 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "wsa@kernel.org" <wsa@kernel.org>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "Kartik ." <kkartik@nvidia.com>
Subject: RE: [PATCH RESEND 1/2] i2c: tegra: Add GPCDMA support
Thread-Topic: [PATCH RESEND 1/2] i2c: tegra: Add GPCDMA support
Thread-Index: AQHYs8aKp+OlLQycOkO470/UfA2RzK22VXAAgAADTwCABBngUIAAPbIAgAAHnMCAAK1egIAACdIAgAB/C4CAAEIiAIAAAWsAgAA0KUCAABwUgIADTeFA
Date:   Thu, 25 Aug 2022 16:41:08 +0000
Message-ID: <SJ1PR12MB6339E13E9AFDCA1EAB9A72E9C0729@SJ1PR12MB6339.namprd12.prod.outlook.com>
References: <20220819122313.40445-1-akhilrajeev@nvidia.com>
 <20220819122313.40445-2-akhilrajeev@nvidia.com>
 <20281ca7-e597-7030-4861-5f9a3594726d@gmail.com>
 <89a746fd-a98e-3147-7811-33c5051c2b6d@gmail.com>
 <SJ1PR12MB6339FC1F82EB1BB7417E533BC0719@SJ1PR12MB6339.namprd12.prod.outlook.com>
 <ebb0764f-db92-d69d-49ac-151f4e3e0b8a@collabora.com>
 <SJ1PR12MB63396DC508F63807F1CE9901C0719@SJ1PR12MB6339.namprd12.prod.outlook.com>
 <fac10841-1682-845f-3e4a-5668f59caed0@gmail.com>
 <cd0374f1-2c05-7e61-7187-cfc9c42edf63@gmail.com>
 <SJ1PR12MB63397BBD4EF314A742680F2CC0709@SJ1PR12MB6339.namprd12.prod.outlook.com>
 <a7ba27c4-992b-28d1-f6c2-3937b4f275ce@collabora.com>
 <c9ba2629-fc81-cefd-0d6d-991084781ec3@collabora.com>
 <SJ1PR12MB63393F51E29BA1F85AD249DBC0709@SJ1PR12MB6339.namprd12.prod.outlook.com>
 <4f791065-e0dd-6ed5-f152-86d7be683490@collabora.com>
In-Reply-To: <4f791065-e0dd-6ed5-f152-86d7be683490@collabora.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fc1d43a1-2d68-44f7-5571-08da86b89ca6
x-ms-traffictypediagnostic: CY4PR1201MB2484:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8lcl+xGQiyavyv6QsF6YCfvWqyE9z2JqquL+UgmMuOB4bazmTG9+ypZBA3/z8kmoNFlBwegp1Xe8VE4lRtBElpXCY9fz1zzlE3vN22P3GwoDfE9OImg4QALbNvWXslrALoil/khqLp5hDgxQyQ1eZDNkTchu2mgUFbjwZk1dVl0xb3ThwSELNoxzhaRsvN2SIEQ/tgtrmTrsdySqopPwQQVHwHQnrUnsD5qXYWU7j5Q5vYQWw9aT9kEYBKPp6ZRrZjb7XnBAvSf1p65Qm730IafkteXklGKhFkPxUnA+U1NCuX+AtNNxJOfp/CX34WP4Dg4uTpEtWp8dkcQSoIUJHxJJOEGCNAhDkXKidam8BDR3eV68i4hZSySSpM00L6cdGCvHnVkbyPJIyip5aQKEhnCOUm1GK0LBJix9RbdL1GChnRSOwoI9TLSKAoTzFVI8IpmJKfj1XvIEVm/mFShm01cNGiTQ0Iu0xqHmYl4c952T4B+gIbnp8C34ouJjmgNBFQEzf06W9j2EZYPYrhV3OjC8o3IoNdYnIGjzKqldY1SCus033yfGdviT05ZbwFKPyUTo/MtFZs1Cg0j9wLMx6cTDkwYsZKwpg3RBzn8CXAd4LLoeR9wgBurO0+mUa93mqKSJ7c1yqGRjNur0b9LCOXp2+c0DTLZLm1qixqoAnqttQQEIlxmuDI+GTZLgv8RUunt7ifDWOxmKKU3SF5c7f4R7goZbYFza6nKBzE5yFnJ9K2vanSqIZ3VMH/q52+TRFQFqRQPyaE7A+tGtjoTvwA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6339.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(396003)(136003)(346002)(366004)(83380400001)(4326008)(66476007)(64756008)(38100700002)(54906003)(316002)(66446008)(55016003)(8676002)(52536014)(66556008)(76116006)(66946007)(5660300002)(110136005)(2906002)(122000001)(8936002)(7416002)(33656002)(86362001)(55236004)(53546011)(7696005)(26005)(41300700001)(6506007)(107886003)(9686003)(38070700005)(478600001)(71200400001)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?clJVbEFSVWNLRDBvUkR6dWZnVmh2TDNpMjBxa3p0WThNZXdnKzhjS1JpL3JY?=
 =?utf-8?B?VzlMNnlZbFliL0RvSFY2dE84UGhBZHBCQTJMOUMwTFBIMW5ndmJ6UWVRczQw?=
 =?utf-8?B?TnpQb2wyNGxuQm11akc0ZXJGWlpLU1pzUklWVm94aTRWY2ZxRmU4UVlvYzhw?=
 =?utf-8?B?NXpTUkN2OTI1YnlVdDlSbWticUl6emxid3JESUp6WUJFV3M5QjFZT1lPZUto?=
 =?utf-8?B?VzF2NFdNNHZsWFVheldhTWRxZEZ5U2c1bHFtamttNm9rU0ZpQmIxNlVjbkx2?=
 =?utf-8?B?T1BLaEhzQ2dNdVhpODlYZWtseWZ0cnUyUm9PaU5peTBQa3lvZmlBaUErQlRs?=
 =?utf-8?B?aEVLenFycGhPVTNxVHYrRGw0dUdPckErVEI2bVJrZmdFM1F6L3o4MW9TQzRs?=
 =?utf-8?B?Tm1hZ3lzWXlKTk5IMzRieURDUFlLelN4dlBNZytxN3g0QXhuZFJ0dlN1Tk9F?=
 =?utf-8?B?VlJIcU9NdkZFUGRQVGtEZitBS3RreHAyRzBnN2hWeHM3cnVjdEplZTZWMlVD?=
 =?utf-8?B?OEFZYjYxYVBxNmdXcndveVdMb1VhVVpiVExGSGZFMVFpMW90ZGF5UzRhNFBk?=
 =?utf-8?B?SmdUclp4WnRlUkdxQjlkVzFoaVNtM1VYRzUrMmc1R1l2VTJ4N1ZZaUtUVmpM?=
 =?utf-8?B?aGhHY1BhbzFGdWw5QWZNVUNDdENLYWplQTY4YWhoczRucmFNcGNxbWVyU1Zw?=
 =?utf-8?B?WElGVW5ZZEw2R0FWL0N4TlpSMVpFcTNhS2R1VlJMM2R5M1NZTXJ1NmY2c0hn?=
 =?utf-8?B?Njl2akVkemhFck91cmJhWmhiNnB2RGtMMUhnRVhqbno0b2o1RjY3TU9qV2Ew?=
 =?utf-8?B?R2FpOGhFZ2Vyc25rejVyaG96anR0N0YrYmV4L2ptaGk2dlNGR2xYUERoRmZx?=
 =?utf-8?B?eVREaGpuVzhJWkd1RmU5SGxqMHhiTWJuMEFrR0YzRTdYeWdkSEVFU1VxSWUw?=
 =?utf-8?B?NjhlWXFlWjBQc0ZsM1UrQ0JKSEJNZDlScXRGdllYdmZkQWFvakNuTWRyTDQ2?=
 =?utf-8?B?NlhJbHlnVkl4TmlneUxZU1dmMXdSMFRoTDZaS3U3b3c4cHVoOVJOQUdFbWJo?=
 =?utf-8?B?eXd0a3JPaTMvZUNjcm9sTktpbDhscGxYT3grL2JrZ1M3VWFoVGthNml3dm1O?=
 =?utf-8?B?WWs4VlB3TjQ2RlVnS3IxTVJoZStYY1FyY0FCS3hmL21ZMmUxUDNUeTFkekZH?=
 =?utf-8?B?NHNQNEplN0MxMm9oVnNGaklmQmxmbXdzbW5KOHN2WERiR2w1cHJ2dFNsMjht?=
 =?utf-8?B?ZE5IendmY1h5V0xMb1VXV2o3OXV5VkRzUHZHRENZV1VqMnFZTVludnVDeGNW?=
 =?utf-8?B?cW5DSlB6cTJhZTZzUGJNTVdsNE5NV0hpZCtkdnc2VDhqQ2xBbmh2alVTWFFm?=
 =?utf-8?B?TUUwRWpaNExaMGRwLzh5blJIaVdRSEtCS3U5YUVpWWhaVHp2cHQzME1hMm4r?=
 =?utf-8?B?NGJ3V1lLU3BnQ3Azd0VKenVIRC9DaHJNejk4c29kdkpTaWQ0U29BRkQxb01C?=
 =?utf-8?B?SE1BdXkxczA0UExMckNWTTlCbEY2M2FHVGNqbEliYktZMFJ6Z0F6Ym9SN0R3?=
 =?utf-8?B?SmMzRjAyTlR1Tkh3YWx1YmFodXdSVHFZa1hWUE5YczF6aGtsNHZmNzZnMldX?=
 =?utf-8?B?Z01QUExHd3NoemhzVVBPQVBleUxOd0VzTm5USU0xZzNId21EQ1htTEVDVHJN?=
 =?utf-8?B?UFVWaC8xVDF3LzJ1Zkw5U3VuOVRvRkpoWXppWWhJRjkxTVQyV0h5ZUdBa002?=
 =?utf-8?B?NEhmY1F4cGZodlIyeVVjTm52YURvRDI0WHJOTm41bk1nNzUrS3VZYUpudXZr?=
 =?utf-8?B?Nms2ZUVuREhTcTRNZ3Z0emFFQSs4KzBpTE4yb3gvSWlwWmQweHo4SUVQSlVs?=
 =?utf-8?B?ZjdTVVNmUjYrd2pFRDFVazJyVHZDYUdFdGRxbjB5dU4wN29NN0FiZjNhMmVE?=
 =?utf-8?B?dThuczFwRlQwaVIvT0JsQzJkazloMlg3QndxcVhjVjFJUWhwKytuOGYxOXFr?=
 =?utf-8?B?K2REMnVZRmdkYVNLTm5mNXFyZ0pLWkxvWmNiTXlCQXZScmt3TjFOU0NDVGxo?=
 =?utf-8?B?V2ZaTHJCOFZDQnNacTVWSXRvbXVSaWdYMXFMQnpGaFFHYjNlNE5SUUtLSU0x?=
 =?utf-8?Q?xyr4pQEn5VO3sqcFNWLr0P4f5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6339.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc1d43a1-2d68-44f7-5571-08da86b89ca6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2022 16:41:08.6285
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wqLtcdFdkxgsEWaIo4aG6qz0AZj6yropB/PGuDMW9B27DEae9jh1T1EZJcuNiZR4ozek+qwOvmTUeQL1LrVbVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2484
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

PiBPbiA4LzIzLzIyIDE1OjU1LCBBa2hpbCBSIHdyb3RlOg0KPiAuLi4NCj4gPj4+PiBXaGF0IEkg
YW0gdHJ5aW5nIGZvciBpcyB0byBoYXZlIGEgbWVjaGFuaXNtIHRoYXQgZG9lc24ndCBoYWx0IHRo
ZSBpMmMNCj4gPj4gdHJhbnNmZXJzDQo+ID4+Pj4gdGlsbCBETUEgaXMgYXZhaWxhYmxlLiBBbHNv
LCBJIGRvIG5vdCB3YW50IHRvIGRyb3AgRE1BIGJlY2F1c2UgaXQgd2FzDQo+ID4+IHVuYXZhaWxh
YmxlDQo+ID4+Pj4gZHVyaW5nIHByb2JlKCkuDQo+ID4+Pg0KPiA+Pj4gV2h5IGlzIGl0IHVuYXZh
aWxhYmxlPyBTb3VuZHMgbGlrZSB5b3UncmUgbm90IHBhY2thZ2luZyBrZXJuZWwgcHJvcGVybHku
DQo+ID4gVW5hdmFpbGFibGUgdW50aWwgaW5pdHJhbWZzIG9yIHN5c3RlbWQgaXMgc3RhcnRlZCBz
aW5jZSB0aGUgbW9kdWxlIGhhcyB0byBiZQ0KPiA+IGxvYWRlZCBmcm9tIGVpdGhlciBvZiBpdC4N
Cj4gPg0KPiA+Pj4NCj4gPj4+PiBUaGlzIHNpdHVhdGlvbiBpcyBzdXJlIHRvIGhpdCBpZiB3ZSBo
YXZlIEkyQyBkcml2ZXIgYXMgYnVpbHQgaW4gYW5kIERNQSBkcml2ZXINCj4gYXMgYQ0KPiA+Pj4+
IG1vZHVsZS4gSW4gc3VjaCBjYXNlcywgSTJDIHdpbGwgbmV2ZXIgYmUgYWJsZSB0byB1c2UgdGhl
IERNQS4NCj4gPj4+DQo+ID4+PiBGb3IgVGVncmEgSTJDIGJ1aWx0LWluICsgRE1BIGRyaXZlciBt
b2R1bGUgeW91IHNob3VsZCBhZGQgdGhlIGRtYS5rbyB0bw0KPiA+Pj4gaW5pdHJhbWZzIGFuZCB0
aGVuIGl0IHdpbGwgd29yay4gVGhpcyBpcyBhIGNvbW1vbiBwcmFjdGljZSBmb3IgbWFueQ0KPiA+
Pj4ga2VybmVsIGRyaXZlcnMuDQo+ID4+Pg0KPiA+Pj4gSXQncyBhbHNvIHNpbWlsYXIgdG8gYSBw
cm9ibGVtIHdpdGggZmlybXdhcmUgZmlsZXMgdGhhdCBtdXN0IGJlDQo+ID4+PiBhdmFpbGFibGUg
dG8gZHJpdmVycyBkdXJpbmcgYm9vdCwNCj4gPg0KPiA+IElzbid0IHRoZSBpbml0cmFtZnMgbG9h
ZGVkIGFmdGVyIHRoZSBkcml2ZXIgaW5pdGNhbGxzPyBXYXNuJ3QgdmVyeSBtdWNoIGNsZWFyIGZv
cg0KPiBtZQ0KPiA+IGZyb20gdGhlIGNvZGUgYW5kIGRvY3MuIFdlIGRpZCB0cnkgYWRkaW5nIHRo
ZSBtb2R1bGUgaW4gaW5pdHJhbWZzIGluaXRpYWxseSwgYnV0DQo+ID4gY291bGRuJ3QgZmluZCBt
dWNoIG9mIGEgZGlmZmVyZW5jZSBmcm9tIHdoZW4gaXQgaXMgbG9hZGVkIGJ5IHN5c3RlbWQgaW4g
cm9vdGZzLg0KPiA+IFdpbGwgZXhwbG9yZSBtb3JlIG9uIHRoaXMgaWYgdGhpcyByZWFsbHkgaGVs
cHMuDQo+IA0KPiBJdCBkb2Vzbid0IG1hdHRlciB3aGVuIGluaXRyYW1mcyBpcyBsb2FkZWQuIFRl
Z3JhIEkyQyBzaG91bGQgYmUNCj4gcmUtcHJvYmVkIG9uY2UgRE1BIGRyaXZlciBpcyByZWFkeSwg
dGhhdCdzIHRoZSBwb2ludCBvZiBkZWZlcnJlZA0KPiBwcm9iaW5nLiBJJ2QgYXNzdW1lIHRoYXQg
eW91ciBETUEgZHJpdmVyIG1vZHVsZSBpc24ndCBsb2FkaW5nLg0KDQpETUEgbW9kdWxlIGRvZXMg
Z2V0IGxvYWRlZC4gSTJDIHByb2JlIGV2ZW50dWFsbHkgc3VjY2VlZHMgYW5kIGNhbg0KdXNlIERN
QSB0aGVuLg0KDQpCdXQgbXkgaWRlYSBoZXJlIGlzIHRvIGF2b2lkIGJsb2NraW5nIG9mIEkyQyB0
cmFuc2ZlcnMgdW50aWwgRE1BIGlzIGF2YWlsYWJsZS4NCkkgYW0gbG9va2luZyBmb3IgYSB3YXkg
dGhhdCBJMkMgY2FuIHdvcmsgaW4gUElPIG1vZGUgdW50aWwgRE1BIGNvbWVzIHVwIGFuZA0KdGhl
biBzd2l0Y2ggdG8gRE1BIG9uY2UgaXQgaXMgYXZhaWxhYmxlLg0KSSBhbSBob3BpbmcgdGhhdCBp
dCB3b3VsZCBoZWxwIG90aGVyIEkyQyBkZXBlbmRlbnQgZHJpdmVycyBhcyB3ZWxsIGR1cmluZyBi
b290Lg0KDQoNCj4gPiBTaW5jZSBJMkMgY2FuIHdvcmsgd2l0aG91dCBETUEsIHdvdWxkbid0IGl0
IGxpbWl0IHRoZSBmbGV4aWJpbGl0eSBvZiBJMkMgZHJpdmVyLg0KPiANCj4gVGhlcmUgYXJlIGtl
cm5lbCBjb25maWd1cmF0aW9ucyB0aGF0IGFyZSBub3Qgd29ydGh3aGlsZSB0byBzdXBwb3J0DQo+
IGJlY2F1c2Ugbm9ib2R5IHVzZSB0aGVtIGluIHByYWN0aWNlLiBJIHRoaW5rIHRoaXMgaXMgZXhh
Y3RseSB0aGUgY2FzZQ0KPiBoZXJlLiBUaGUgVEVHUkEyMF9BUEJfRE1BIGRyaXZlciBkZXBlbmRl
bmN5IGNyZWF0ZWQgdHJvdWJsZXMgZm9yIGEgbG9uZw0KPiB0aW1lLg0KPiANCj4gSWYgRE1BIGRy
aXZlciBpcyBlbmFibGVkIGluIGtlcm5lbCBjb25maWcsIHRoZW4geW91IHNob3VsZCBwcm92aWRl
IHRoZQ0KPiBkcml2ZXIgbW9kdWxlIHRvIGtlcm5lbCBhbmQgaXQgd2lsbCB3b3JrLg0KPiANCj4g
SWYgRE1BIGRyaXZlciBpcyBkaXNhYmxlZCBpbiBrZXJuZWwgY29uZmlnLCB0aGVuIFRlZ3JhIEky
QyBkcml2ZXIgc2hvdWxkDQo+IHRha2UgdGhhdCBpbnRvIGFjY291bnQuIEknbSBub3cgcmVjYWxs
aW5nIHRoYXQgdGhpcyB3YXMgdGhlIHJlYXNvbiBvZg0KPiAiIUlTX0VOQUJMRUQoQ09ORklHX1RF
R1JBMjBfQVBCX0RNQSkiIGluIHRoZSBjb2RlLg0KPiANCj4gU2luY2UgYWxsIGgvdyBnZW5zIG5v
dyBwcm92aWRlIERNQSBzdXBwb3J0IGZvciBUZWdyYSBJMkMsIHRoZW4gc2hvdWxkIGJlDQo+IGJl
dHRlciBhbmQgZWFzaWVyIHRvIG1ha2UgRE1BIGEgZGVwZW5kZW5jeSBmb3IgVGVncmEgSTJDIGFu
ZCBkb24ndA0KPiBtYWludGFpbiBrZXJuZWwgYnVpbGQgY29uZmlndXJhdGlvbnMgdGhhdCBub2Jv
ZHkgY2FyZXMgYWJvdXQuDQoNCkkgYW0gc29tZWhvdyBzdGlsbCBub3QgdmVyeSBtdWNoIGluY2xp
bmVkIHRvIGFkZCBHUENETUEgYXMgYSBkZXBlbmRlbmN5DQpmb3IgSTJDLiBFdmVuIGlmIHdlIGRp
c2NhcmQgdGhlIGZhY3QgdGhhdCB0aGUgZHJpdmVyIGV4dGVuZHMgdG8gc3VwcG9ydCBjaGlwcw0K
dGhhdCBkb2VzIG5vdCBoYXZlIEdQQ0RNQSwgSSB3b3VsZCBsb29rIGF0IERNQSBhcyBhbiBhZGRp
dGlvbmFsIGZlYXR1cmUgb25seQ0KYW5kIG5vdCBhIGRlcGVuZGVuY3kuDQoNClJlZ2FyZHMsDQpB
a2hpbA0KDQo=

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 094305F9E39
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Oct 2022 14:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbiJJMAg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Oct 2022 08:00:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232377AbiJJMAQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Oct 2022 08:00:16 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16A2C20F44;
        Mon, 10 Oct 2022 05:00:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g7e4msU/dT+4ZZZkLO7pdXmAOPTIp1Z2i1m6cQ6d9skdJ5tZHwKe87pjF7loj4OFWe4+NKEh6iE61x3eAfFKlEHx1xJN3jRin/RGboUGc0uO96a31sDBVbXMJPQbmgrRvZTHIEUiZmdkwjbekeB/avzLyIo0aI4SOqnlxsn6wRWTiZfPioAj1YOSVxnQpeEpy8lsIkyi2u+PyqBgOWwtEARJvP695FeOTMjFTrO+1EQVc3XajjaTaR16SIPbvMbGiGr10w5rS+igtxFciXlMxP33YLbc/co+LU9aSrW5/hsh7InRR5tFLEufTgT4eyMyCZtCNfzDYT8txDX+Uyt0Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RnwdftVpYsYrOAPi6E2kCKAWJaaNPZj3OL3gXLCQRWE=;
 b=n676YArPjqZh+jcXSsz1KAyNlX1S+JKahWpboFgt2VtK0JfFKC93NAaufqQgrYNSILga6vYvqGjmD+GFZZ7sgfF9FyUFp0lxuAmr75ZWEdL35aJAWKcnXOiTgGOyiKjizDEoVLHdbtEuq6X0PLkOELgfaTwFrf/m0HQscvh3P+RIf0uVEc63om3fhd91dbKE869+dv0aT+SjV2cuRYV6KuVetWusG7IaQ6pI5VxuP/T4cN4lKm8YERA23rV4RjU5tkpvQq4JRTVavMKmdb/TwYO6ExH7j6sbPo/TYpWX7ABHvqhapfG8kzs2AJu2pfcTQniIAayVQ5TcMD6zCYwzUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RnwdftVpYsYrOAPi6E2kCKAWJaaNPZj3OL3gXLCQRWE=;
 b=M277K4O6LCQnUYxL6Qmi0c1kqU/gfiNT7fQnYCrt//CfYfe1A/DYlAUmWXDEkTg+E+AQ2kxlUWlS2abxcXRkyCZkxqW9Hved1QiKdkJAyvfso6q3ngxPeS3gooRSKhPlphdeoWfz4+S5YLMwGLQR0JPsig7IDgHnvxvIIUZ1W7UjsnmA3P3lz5BKQUa1hMOv91b9ABLymcM+FoSfZ4XUKGcFgH1e8ATF+dtUK6o3QrjyiQw0NGD2e8u2L9d0HyCZGPVQC002qPycX2OrOM8IqUqVzX85Cx7PS75HXUUN/qGOVXcHjhEE1BKsnYpV3M4oLCr2rOF92UNNSsIErD7Taw==
Received: from CH2PR12MB3895.namprd12.prod.outlook.com (2603:10b6:610:2a::13)
 by SA1PR12MB5669.namprd12.prod.outlook.com (2603:10b6:806:237::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Mon, 10 Oct
 2022 12:00:09 +0000
Received: from CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::7129:e05:131a:b109]) by CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::7129:e05:131a:b109%5]) with mapi id 15.20.5709.015; Mon, 10 Oct 2022
 12:00:09 +0000
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     Ren Zhijie <renzhijie2@huawei.com>,
        Khalil Blaiech <kblaiech@nvidia.com>,
        Vadim Pasternak <vadimp@nvidia.com>,
        "wsa@kernel.org" <wsa@kernel.org>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH -next] i2c: mlxbf: Fix unused-variable warning
Thread-Topic: [PATCH -next] i2c: mlxbf: Fix unused-variable warning
Thread-Index: AQHY2+Tu//2R9B6gbUqBJqyM/2dRja4Hh8/g
Date:   Mon, 10 Oct 2022 12:00:09 +0000
Message-ID: <CH2PR12MB3895C3FA56AE40EA043A0BCAD7209@CH2PR12MB3895.namprd12.prod.outlook.com>
References: <20221009133822.254122-1-renzhijie2@huawei.com>
In-Reply-To: <20221009133822.254122-1-renzhijie2@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB3895:EE_|SA1PR12MB5669:EE_
x-ms-office365-filtering-correlation-id: c66fc691-5977-4811-5d7e-08daaab6facb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /HpDlQexZgNYjZmOm6RbiOdKD/ZXmQku0ljNWgwoWK1WtVlEtPP/SWZgR9WcTgtwQ0qzSNQxmJ/AHHpWLEKVhR/s5pCJDHC5qySXL87xVOKp4IWyw299mECQ700b6SYEUHYglD2j3fhaEX6WXIzwCJwF8tRFH8dTjROAblgw5+q2i73MIimsm99pev6VR/y0IprRGIFrvgGW+QrArotlMC2GpLrVLG4GzT+griv2IwUMP/c1xORRTG6YWwgDakBpfS4iScRByyXPoD5fwUX1uBoh3AJaroDVObHHnO46x+/UdJqs7je5oVHR0YrS6nMP3o6dhFB8pvCg4O2GssZpvmy4+8bl7sEg0BjdzUoFEocp0E2zh/0StSg1QB+IbLwlaeyPSpOYjfgTvOeCfpHXinqcdmiCXc+KCuETVfVqbo4VUos2wSAptRIadfy/TYgmYBB1BHP+tNsmvNduniwmuIwMdAW4alqtbA7dVq+1MD/oJdeKuMPkAWpz0V3rfcnHZCVR+xIzeKJxHNoAhodRR5vqPUlbWgKkhmNtZ/4v4hbbaAvm3aROZf+2Nm5Lwpt8B86LQ/lHQYGLwbIL/PKxHa5XakYYZyvCGqNMunFmPAksAg6K0MKEBtOH76fjuRu0bdMHkKVTMdZYAXJP7+r2dZl0cZneCOIFHFG2aL1tMw8zi3UdPFzOzLg0vEAFAHWnHFHc4jZ5gsDOijv6PpdVPeZehWz+i42KBDHdmzS4v8BhNxWeg35fZZVaJb1NGNCyQi6bw+gms7fNPtkDguwkeA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3895.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(39860400002)(376002)(396003)(136003)(451199015)(6506007)(53546011)(26005)(7696005)(4326008)(38100700002)(8676002)(316002)(76116006)(66946007)(66476007)(66556008)(66446008)(64756008)(71200400001)(122000001)(86362001)(38070700005)(33656002)(186003)(478600001)(9686003)(83380400001)(55016003)(2906002)(110136005)(5660300002)(52536014)(54906003)(41300700001)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Sjk5SStHb1BWN3dYUGg4aVR0T2kzVnA0WUI4K2swamJNM3N2OGpVSDR2Nk1z?=
 =?utf-8?B?elllMTEwRTFHUFNSbTErMCtCVjRnalZPTTdwcHV3L3JhK09KRGVjbXR0NTUw?=
 =?utf-8?B?aXY0VE5XR2F1ZVRhYzNPVEtOdHlBYkl3dE1XOFdzTDcveEZ5TGVpVXJhMDZ5?=
 =?utf-8?B?MVI1SENpVVhZVkVEb1c2Vm81Y1ZROURMZjdhaUJmaEFGTFFJa0J1T1dWN0x6?=
 =?utf-8?B?R1RGT08wLzVoY09DWG9DOXIrd2twOWx3ZVZEck1ETDNkL0FlU2xkSll6UmtF?=
 =?utf-8?B?enBxWHFoendxQXN3ZlllZHc4bWFjbDkxcERXeXZQdk9RZlprenhja3d5SSt1?=
 =?utf-8?B?Qzg5V2Faa2VEV1Y5SWJMb2twbGovYm0yQ09GekMzZUdnUWNqVm5WSXVjN0cz?=
 =?utf-8?B?WC9hUWtKRnlxQWFCb043NXpSN3BVWmMzSjNQRU8zdzF1bHo2Wk5uUUQ2UHBm?=
 =?utf-8?B?WWt1VkFaLzluelQ0Z3pEZm1TeHZpNEcwVU4vTnRRRnBtNTlRczR1WUVoVnQ5?=
 =?utf-8?B?TDNaUXJpak95cXNMeEJPeVNUQVZGUHBqM3RyMUMzbzd6UW8rWDlaNWtqZ0Iv?=
 =?utf-8?B?SWFwVVBFVkZCeWsyNUJza0hUT3F5T2grUUVGV3FnOTZpRnBoTFc5ME8wVXlU?=
 =?utf-8?B?aS9UQ05PSnlJdE9JSmpDRkFIWVc5djQ1Y3NkS0NPTTVOQXh5Zk04RFRoY0Zu?=
 =?utf-8?B?OEs4MFpGaENFckVNVXRQUCtIeWMzN0JvOTFtOVBncHNsZ01LNTk3aEJjZy8w?=
 =?utf-8?B?TTZoTlZzQ0FvUzhJYTM5VmxNdG43cGlUYzgzRjVPWWhPeXZCenp3YjFSREV6?=
 =?utf-8?B?ZEUzY0h2OXlTeG43OS8yYU9yOG9hVUp0MFBFcHhLRUNxY3RhemFkbU1zSFhS?=
 =?utf-8?B?MjAxRDlDOEpJTTcxc3NPb0w5WXI3bjU5TnFOK2dHZU9MVVpLbzlNVVlGb0Ro?=
 =?utf-8?B?SHEvMEU0RmQwaE5HTFgrS2N0WWFMUDcyR3ZXcXpFMWVLMExqcTVhQ3hoOE1v?=
 =?utf-8?B?RE51ZzlRall0UEdtT1Q1WkltZE5mSFVoRnltSmVQU3JleXNrd2hEZ2xOSkNz?=
 =?utf-8?B?MlpmWmVlMnIvTWV2Kzc2enowSDN6WDd0Y05BL0xtRStjZFozUCtkdGlETXJ4?=
 =?utf-8?B?VUZWWG11b1dHb1dxb1BZK2dhR1Qwby9XNkZKNHU2Q1dlN2tjdE1JNVJPY1pl?=
 =?utf-8?B?cXhXZlhZOXExZWxxenJMMjZNdnJiV0hpUEhJQjcrRzlLSEtucFFmWXV6RmZG?=
 =?utf-8?B?WWYwSVE5dHVsMDE5anJTQXQ4TEJKN1FFYUtBTXBGODdtejJ3S1hXd2RDenFW?=
 =?utf-8?B?cHliQ0hCb3pNM3c3L0FDMFRjcmV0ZStoYjEyZVBGd29nemlEdXIydjJERHkw?=
 =?utf-8?B?Ri9HeVlWbmwxVmFNVWk1cE03ZHRjT29Va0c4R1VnODdTdUhHdFZFcWxha0JL?=
 =?utf-8?B?dnYrK1lYUGUxd0VPVXVkREljM09nRDVFM0FGQUtZSmU4TmphQ0pXT0hKVWFB?=
 =?utf-8?B?TjF2ak5QRDFQMHgrZENoeXRGRGQ3Y2dsallUaVd3aDNpWnVFeGxFK0dUUzNH?=
 =?utf-8?B?YWxpU2RFQ0tZdDc0QTVQcEhsa2hVV1lzQWRXWnE4QjZhdmNYWnE2M0h3cHox?=
 =?utf-8?B?VTJEVCtzNThiT1NDZDVEYmhER1pYV3VOeFZtbVJpbE9EMkFXa0o2L0sxT01V?=
 =?utf-8?B?bUlEK0ZYZENRaXlxNWJXRjNQWTBzY2tWN21pNU5ZSEFySzNRRWtmWkplUk9X?=
 =?utf-8?B?bGFXc1BscHh1WkErOHg0Sy9sZEE4SGFIWGw0cmg2dUNCcXZFZVByT29GSXNn?=
 =?utf-8?B?ZGtiOEZLeGhBbVhpNUVBTnpSZ3gyOXBKS3J0cGJGQ2xtZndmZk04THRaZnQ5?=
 =?utf-8?B?M2wyV282TXZLNG9XY3lLZE5ENDhEbTFoekMzZWRRdWhwQTdXamowUU1sQ0Qv?=
 =?utf-8?B?elo5TGpsbFJEeFJLaFlpd0E3K0JLekNwZmZFNDFTbHVCYTJITG0rQjdUTVY3?=
 =?utf-8?B?dndTZnZuc3lzSFZPck02MVh4NWNvWU5ESlFSdkszQmtFYWMzekxCcTNRc2pm?=
 =?utf-8?B?eCtrOERkUk1mRGcrN1VDeDV1YXBldjB1SWswc0ZtSHFKV01iMGo1bDErQmth?=
 =?utf-8?Q?jpqU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3895.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c66fc691-5977-4811-5d7e-08daaab6facb
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2022 12:00:09.4279
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y48drccwoG8lCInlC4it55KbeAiIwsmnU5KilkEN6Uj5yU00KJQNV235rZqKPZq9NC8FtQm919XgLxix9uQl6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5669
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

QWNrZWQtYnk6IEFzbWFhIE1uZWJoaQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJv
bTogUmVuIFpoaWppZSA8cmVuemhpamllMkBodWF3ZWkuY29tPiANClNlbnQ6IFN1bmRheSwgT2N0
b2JlciA5LCAyMDIyIDk6MzggQU0NClRvOiBLaGFsaWwgQmxhaWVjaCA8a2JsYWllY2hAbnZpZGlh
LmNvbT47IEFzbWFhIE1uZWJoaSA8YXNtYWFAbnZpZGlhLmNvbT47IFZhZGltIFBhc3Rlcm5hayA8
dmFkaW1wQG52aWRpYS5jb20+OyB3c2FAa2VybmVsLm9yZw0KQ2M6IGxpbnV4LWkyY0B2Z2VyLmtl
cm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IFJlbiBaaGlqaWUgPHJlbnpo
aWppZTJAaHVhd2VpLmNvbT4NClN1YmplY3Q6IFtQQVRDSCAtbmV4dF0gaTJjOiBtbHhiZjogRml4
IHVudXNlZC12YXJpYWJsZSB3YXJuaW5nDQoNCklmIENPTkZJR19BQ1BJIGlzIG5vdCBzZXQsDQpn
Y2Mgd2FybnMgYWJvdXQgdW51c2VkIHZhcmlhYmxlOg0KDQpkcml2ZXJzL2kyYy9idXNzZXMvaTJj
LW1seGJmLmM6MjIwNjozNTogZXJyb3I6IOKAmG1seGJmX2kyY19jaGlw4oCZIGRlZmluZWQgYnV0
IG5vdCB1c2VkIFstV2Vycm9yPXVudXNlZC12YXJpYWJsZV0gIHN0YXRpYyBzdHJ1Y3QgbWx4YmZf
aTJjX2NoaXBfaW5mbyBtbHhiZl9pMmNfY2hpcFtdID0gew0KICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fg0KY2MxOiBhbGwgd2FybmluZ3MgYmVpbmcgdHJl
YXRlZCBhcyBlcnJvcnMNCg0KTWFyayB0aGVzZSB2YXJpYWJsZXMgYXMgX19tYXliZV91bnVzZWQg
IHRvIGZpeCB0aGlzLg0KDQpGaXhlczogYjViNWIzMjA4MWNkICgiaTJjOiBtbHhiZjogSTJDIFNN
QnVzIGRyaXZlciBmb3IgTWVsbGFub3ggQmx1ZUZpZWxkIFNvQyIpDQpTaWduZWQtb2ZmLWJ5OiBS
ZW4gWmhpamllIDxyZW56aGlqaWUyQGh1YXdlaS5jb20+DQotLS0NCiBkcml2ZXJzL2kyYy9idXNz
ZXMvaTJjLW1seGJmLmMgfCAyICstDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW1seGJm
LmMgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW1seGJmLmMgaW5kZXggZTY4ZTc3NWYxODdlLi4w
ODdkZjFhNTM3OTcgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW1seGJmLmMN
CisrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbWx4YmYuYw0KQEAgLTIyMDMsNyArMjIwMyw3
IEBAIHN0YXRpYyB1MzIgbWx4YmZfaTJjX2Z1bmN0aW9uYWxpdHkoc3RydWN0IGkyY19hZGFwdGVy
ICphZGFwKQ0KIAlyZXR1cm4gTUxYQkZfSTJDX0ZVTkNfQUxMOw0KIH0NCiANCi1zdGF0aWMgc3Ry
dWN0IG1seGJmX2kyY19jaGlwX2luZm8gbWx4YmZfaTJjX2NoaXBbXSA9IHsNCitzdGF0aWMgc3Ry
dWN0IG1seGJmX2kyY19jaGlwX2luZm8gX19tYXliZV91bnVzZWQgbWx4YmZfaTJjX2NoaXBbXSA9
IHsNCiAJW01MWEJGX0kyQ19DSElQX1RZUEVfMV0gPSB7DQogCQkudHlwZSA9IE1MWEJGX0kyQ19D
SElQX1RZUEVfMSwNCiAJCS5zaGFyZWRfcmVzID0gew0KLS0NCjIuMTcuMQ0KDQo=

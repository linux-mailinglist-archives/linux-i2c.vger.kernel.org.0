Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 635E46C49D4
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Mar 2023 13:01:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230370AbjCVMBD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Mar 2023 08:01:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230387AbjCVMAr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Mar 2023 08:00:47 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2049.outbound.protection.outlook.com [40.107.243.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E5C45F6D7;
        Wed, 22 Mar 2023 05:00:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ftHyDtZsd5/iZhAratL263ExrOfDVUYu1yMtVlsbg/OSnO6nq9P6zIw01wLwdkKGmj/0UG0HNlxuRI3VeTO2Z1giA4FZWPdz4JlJn+mZA1yG5KyW/oZj2sTd43ws2902fjkc62mJ8Owybsz2njNZRZR53h9K8h8KZ2vvm3Yk/s08KB5w14ZMA6shhD49hWfiQje8gEPvqZ6ipoujjgq4RwgUFMz2JFWtjKpSTfRpYeJHfnMSDvAGI93zuDcvoQmrK79vLsalb58V6YTBuJkZuKWKXenXX+w1rkKxjV5MPakWslXnPdb+HY04ziMx6oZxeu9h4iZiWkxW4SPnIijpwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u0mfYOBTYC8NfE3z/0i0DrsaL/72rRF5Ap/agNgZavk=;
 b=IOaithMCvLU8Oiia236FKqEzcxnydUjbA7R1ndp7L/HhRRHG8h/xK2MOJjF389eN5FM3aysYHgW9Su7tZXLPLpAkSlkt6J5112hmZILUurKthTHaIzHWol5OAEZZBT1hQA8R+GEK3QMxwLG8c8QRkTx2jK37V7pMjDsD6DMszTWSCZvZqYBqeA9aF73R33n5ChS5yiyYONAWltcukSF4deFIK5nhH/1Tn1Vgr8RpffGT3D8mPRdbH/vQRKrgT3MFTu8IsDI/oeeIgmxJxqCKKZpwxPL/7fTBpgART+Kz0z4DbLh+itnzUi3ywnbBoVRP7SmZVEqAZTyxPXMKRCJeNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0mfYOBTYC8NfE3z/0i0DrsaL/72rRF5Ap/agNgZavk=;
 b=pnO9G+5DoOVgdELpSG+TRmdX5s28xVoz6Xil3xJf9jMVitSRg9J3JnZg8ZMVbIlY9/9sJ/8CLdW53Tih4ZIl9ZnnLYvweWUzbWubyd4hCMAZdLeQEcDH3/r9zqa5/kmXA0EP/K//20TPys69pMJbdsJAgoKea2QnRQSELWjTKTUDkCuNyaL2atMEQyYaUizMrEIU4KgyIt/mjFZT5wx504kfBCEalXPk8u/xKPj6yq2uHzzrUnylkjpTa0AZJ3k4Oa70nNIRXl700DwTg5GDZn1QAtPPYXIjYLpgPviZQXZTWrV6yx4AsRNaZodSEcIsCFvsV/gVvlqmE8JXtHwBUg==
Received: from SJ1PR12MB6339.namprd12.prod.outlook.com (2603:10b6:a03:454::10)
 by MN2PR12MB4208.namprd12.prod.outlook.com (2603:10b6:208:1d0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 12:00:36 +0000
Received: from SJ1PR12MB6339.namprd12.prod.outlook.com
 ([fe80::2328:92c1:425b:1ce5]) by SJ1PR12MB6339.namprd12.prod.outlook.com
 ([fe80::2328:92c1:425b:1ce5%8]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 12:00:36 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     Jonathan Hunter <jonathanh@nvidia.com>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "digetx@gmail.com" <digetx@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "wsa@kernel.org" <wsa@kernel.org>
Subject: RE: [PATCH v3] i2c: tegra: Share same DMA channel for RX and TX
Thread-Topic: [PATCH v3] i2c: tegra: Share same DMA channel for RX and TX
Thread-Index: AQHZXKiO0wuILl0TEke/Rc5CABJgTK8Go5mAgAALdQA=
Date:   Wed, 22 Mar 2023 12:00:36 +0000
Message-ID: <SJ1PR12MB6339FC0B9BB57D1D2300D46CC0869@SJ1PR12MB6339.namprd12.prod.outlook.com>
References: <20230322102413.52886-1-akhilrajeev@nvidia.com>
 <db870e74-9d97-740a-9829-5fafc0bb0559@nvidia.com>
In-Reply-To: <db870e74-9d97-740a-9829-5fafc0bb0559@nvidia.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR12MB6339:EE_|MN2PR12MB4208:EE_
x-ms-office365-filtering-correlation-id: b699c990-586f-40c0-2548-08db2acd0c05
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BW3jxtTD6RKMIe+WuFqBQT+WdNBilzRM4C1zDr8H6KA1/ZS55El6Ir5ZRhcbuZh5AqbjahPUkb2y5iQXH56j7uUypOZkDsfUbI6AfhbdMsRPgRhcxbHImpBiXYbHB2ovgNMUKA+W5q20igpeF2SHQreZMwG1nwvaqI2Ikbfvwcx7x40HIrUm5i7d4rAWkF/Wpnqzco5rShtwnTF7RBFpf30tKU0bYQYsnqgedSmmn84yygus443SG+K4oKJ9X/gltjYgLJam8cILVAncr7ueE0pwVelRyFvU3Hd25FwEjwh2XPWzEEQy/W7m2LdFCSnB7gMqeJct16RlcDfCebWLX/IKjEXKkolLfSRAyb1ois4pnkOmmWNysReGFM1PjqzqSFuUURam24Qes/H2pd3qGdQ9mdWzA5wOcYK88qmhi5PoacUwMk5VHFOV1Jb4ZcAj9divtkylhOLVE+JoFY08HTG/H2ZFoQRtLo3ovMzvd0UlZScKT31aAV1R5sbN04ttyYbOvG3EpXwxcvdtIVsFMifc+yH63lo3epL9UuKOhMhF8Zo2a6ZyplOXUIyy8DPJgTHf0CvFXXiUncDdLd+1jBIkL9RaDc08jCPejoM9ZGewIX9eKEWhsXSH+lFUNzsm+XK2VSimZtyu9owYANg8TFrLFDnmQezHZUtli+Emhu5iAa+FBx2YH/eI0mhNqmoH9FSDEZ6i6zHrmx//956a73rXWnb9A9nQeigaFk3vLac=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6339.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(451199018)(921005)(38070700005)(53546011)(26005)(9686003)(186003)(6506007)(71200400001)(55016003)(7696005)(86362001)(38100700002)(2906002)(478600001)(83380400001)(122000001)(8676002)(64756008)(316002)(33656002)(110136005)(4744005)(66476007)(41300700001)(8936002)(52536014)(76116006)(5660300002)(66446008)(66946007)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y3RTV1ZCTWFvOStmQlZIT29DWk5tMm5DY0NwNzczdzVTamVJeVZJRjlBQ293?=
 =?utf-8?B?aU1CSjV4S0gwb1MxUnRaTGVDbG0xMVlub0N0Um1TR1pTTXlxUFRFVjhsM2dL?=
 =?utf-8?B?Q3B2YmNTbXBBdkpwK2ZNRi8wK3ZOVklTTUlncUk5RDVJOWpOdFJCWlBjUEt5?=
 =?utf-8?B?Q1oyb0V6NVBkU3RHa0FNMEdxaUtCQTdHWE1Oc0RBOFBqMzlvcW5sQm1nRzJ3?=
 =?utf-8?B?TDZjVUpDTjI0aVJ3YVFmb0Y0V1d2WmZRUTBUTW5DUXRHK09VbmFQQTdFeVF4?=
 =?utf-8?B?cnl3L1o4L2c3aTB0QnlMK1pRMTBGeWE3RjBqa3FHSzhOdFZnWWdVV3BHV0tJ?=
 =?utf-8?B?d3JXUXZubUVjQ0RWNVBSWW80NllZcDhBUmFjZVVRMW9FdWF0MUd3TllPNTZT?=
 =?utf-8?B?YUlrNVNkQ2VOcm42L1FMaXFQd2xIKytzdjJINFpvUGVQd0lEamFQRUdpVGY4?=
 =?utf-8?B?U1A0M0tPOGNLb3NSVkd3T3F5Y0ZYaTZYY0owV2lPRDcrcFMxamkrZVl0LzZN?=
 =?utf-8?B?V1hkUU5Pdll4dHhiNVVxTGtYMjh6OC81VUYwdHpKV3NkZ0loUHJUNUVrTkVh?=
 =?utf-8?B?aHR3eXU1SEdvN2VueW9lSmhia2t1TkdscHU5cjRRVmQ0dWRXK0pGNHVMSmNu?=
 =?utf-8?B?NmU2TXZrQW5nZktlZElYY1JwZ0FHQVU0Qyt3SGNEelFadng4RTA5aXhJOFJR?=
 =?utf-8?B?ZERqSUxOSVZlam10WlBhWXhwc2U5UFpya3pOLy9TdEpXd2RkRjkzU3NtMjN1?=
 =?utf-8?B?MXVOUjAvSERZUWFTOXdyN2RKYTRHK2JHSXlBc1I1UUkva0lYZGIzVTlkWUdG?=
 =?utf-8?B?c0N4TVhkeUc3dDZyU0tSMlF0aVBpT0FxUFh4ODV2THZjejhXV2JLaXpmdWN6?=
 =?utf-8?B?aUdpRFduY1NoRGs3OEUzYkdXbVQyeUtUMHBBRHJWWkE4cXFlV3lPM21EQ3Bj?=
 =?utf-8?B?WW1wZlduZUVlM0xpOWs0WTRocjJZZk42U29wMjg5WWhCS2p2STN5dWowYVgr?=
 =?utf-8?B?QWNyRkFodC9HTDUxSjkvbnM1ejNGd2sydVJBYTNOdW5iR04wWVVIZnVnMlZz?=
 =?utf-8?B?YWdrcDkrMFJWTlZwZlB6eU1IcS8zaDdNSzZlb0hXWjFGYWxhd0V2b3pVcVJX?=
 =?utf-8?B?ZCttcDdwZHN3YlF4M2g1UTd4eEQvQVdoZnYwTnlkak9veDYybDFWYk9Gb2pn?=
 =?utf-8?B?Rk5qVWZRaDVJcTQwUjNuNzltaHNDb0RNVGh5Y3hqdmttbzU0LzNycVBsMTJJ?=
 =?utf-8?B?UWxHL3BhT2VQMlVNd2dCRnFxL2pyMlhzK2ZpMDE5S01RQ2FmUmdsQVVKYllw?=
 =?utf-8?B?QkdxT3l3NEVtZ2Rtakh4MTZUcWczQmZpUTFVZmprUHRyS0V5MkdWcjRjd216?=
 =?utf-8?B?TURiR01tb3JycGdUYmdLU2U2bU5FUlZOY3grMHJZaDZOajJvYnVRRi9yRGpB?=
 =?utf-8?B?VjBLVEtnTnhtd0xRaFp6VFp2M3ArL0pQL2RZK28zOVRJL2gzVW5VcHUvZ0RU?=
 =?utf-8?B?aGdNTTExSko0NGpEODNZTGMzcXRGME82SURaNEdMaHVoK0RiNUVWSmpXOFd4?=
 =?utf-8?B?WXNzeGRRenp6S1VjN29ZV0JvZERrdDZPYTFPeit0eU1pUm5lSjNNaVNybXJI?=
 =?utf-8?B?UlBHUnNBc09oc1g2QkF5eW0zNm1TRUM4MWNFR3FUTWIzMTA4N1p0dWthbEtO?=
 =?utf-8?B?bUFnd2kxRTdnaS83RGdyZERLVkk1dm10T0JWbCtnQWxqV1BOdVAxVHo1OWxr?=
 =?utf-8?B?RmJJR2g4MDI5UkZXZEN5bTdzUDBvN2ljUkh2VTJFYU1kYTA2ZFN5L0VvL3JE?=
 =?utf-8?B?V3JpZ01MUFhhWWRiQ2kvVXErWkprdkprUUFIZlZVbU5rdHg1UDNuNVE0bDJS?=
 =?utf-8?B?Nkl4K3U2VnlwR1ZrVXFqblBXcXFtb0pZZ2J5c3FLbEljeWZGQ2h0WWc0TXdI?=
 =?utf-8?B?UEdFUzU2NlhLdktMTjI0dldyZHEvbFBpVyt1RlhIb3lXQUFNNzJPYVFNMERC?=
 =?utf-8?B?SzZpT0VqckdINWFMaGtqamlLcE1LcHZMaHFKQXZRcXdMYUJuZTB6Uk1wbTFO?=
 =?utf-8?B?NXBibmE5VmNDNXBCN3kwZ0c2QkdidnErQktWMUs5VFRpcHptcFhQVzJhWDBW?=
 =?utf-8?Q?kWXlqnXwdrz+imDBt0934xQPH?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6339.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b699c990-586f-40c0-2548-08db2acd0c05
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2023 12:00:36.0758
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l6NkidClQbjf2KL7R2qjeX8ymvL67MyYEqFAiPZLR9K5NbbZdiGG5saQMGakxre/Nc7stVNzlIt7n7idzQ9mhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4208
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBPbiAyMi8wMy8yMDIzIDEwOjI0LCBBa2hpbCBSIHdyb3RlOg0KPiA+IEFsbG9jYXRlIG9ubHkg
b25lIERNQSBjaGFubmVsIGZvciBJMkMgYW5kIHNoYXJlIGl0IGZvciBib3RoIFRYIGFuZCBSWA0K
PiA+IGluc3RlYWQgb2YgdXNpbmcgdHdvIGRpZmZlcmVudCBETUEgaGFyZHdhcmUgY2hhbm5lbHMg
d2l0aCB0aGUgc2FtZQ0KPiA+IHNsYXZlIElELiBTaW5jZSBJMkMgc3VwcG9ydHMgb25seSBoYWxm
IGR1cGxleCwgdGhlcmUgaXMgbm8gaW1wYWN0IG9uDQo+ID4gcGVyZiB3aXRoIHRoaXMuDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBa2hpbCBSIDxha2hpbHJhamVldkBudmlkaWEuY29tPg0KPiAN
Cj4gSnVzdCB0byBjb25maXJtLiBUaGlzIGltcGFjdHMgYWxsIFRlZ3JhIGRldmljZXMgZnJvbSBU
ZWdyYTIwIHRvIHRoZQ0KPiBsYXRlc3QuIERvZXMgdGhpcyB3b3JrIGZvciBhbGwgVGVncmEgYW5k
IHRoZSBkaWZmZXJlbnQgRE1BIGNvbnRyb2xsZXJzDQo+IHRoYXQgdGhleSBoYXZlPw0KPiANClll
cywgSXQgc2hvdWxkLiBJIGNvdWxkIHNlZSBpbiB0aGUgQVBCIERNQSBkcml2ZXIgdGhhdCB0aGUg
c2FtZSBjaGFubmVsDQpjb3VsZCBiZSB1c2VkIGZvciBUWCBhbmQgUlggYW5kIHRoZSBkaXJlY3Rp
b24gaXMgY29uZmlndXJlZCBvbmx5IGR1cmluZw0KZG1hX3ByZXBfKigpIGNhbGxzLg0KSSBkaWQg
bm90IHRlc3QgaXQgb24gYSBUZWdyYSB3aXRoIEFQQiBETUEsIGJ1dCBzaW5jZSBpdCB3b3JrcyB2
ZXJ5IHNpbWlsYXINCnRvIEdQQyBETUEgdGhlcmUgc2hvdWxkIG5vdCBiZSBhbnkgaW1wYWN0Lg0K
DQpSZWdhcmRzLA0KQWtoaWwNCi0tDQpudnB1YmxpYw0K

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 999977BEE1E
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Oct 2023 00:10:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378321AbjJIWKs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Oct 2023 18:10:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232390AbjJIWKr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Oct 2023 18:10:47 -0400
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05B2A99;
        Mon,  9 Oct 2023 15:10:44 -0700 (PDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 399M4kfw003111;
        Mon, 9 Oct 2023 22:10:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=pp1;
 bh=hUkM9mUTN+qbNA3OAy0sSYSH8lrnV+IoDI/uSrqTHyw=;
 b=rIHhxdUh90M+c2/pye2lN2Bsq7U2edtXtGyo2TjlSipWfE4Q5dn+qA+yIOefVm4totkV
 oiShV9JoubTQAigDHrMvFfXtBBth6PJc4K9SJap7N0xjZ0lqoFGqAuMEZN0XTRl62z5O
 2A8WXzOMpP635Y29IHh9E8vXMrHrXhTYsyqR+ru9ygHpuJXNbaZeokr+gVJCXJxz95U0
 TYheeTqbTt+1eMxOyNM9SZACsKxZNKKrGi3tcH6Rj1JXXND9fP5LGi2tBmh6f31y3TIM
 DQnsEW8leRctHRABdGxWQvPMbocmr4LFelT+Feul+gMR9m2SMgaQwpxKGbflqSSoFlvh Sw== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tmssg8b5p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 Oct 2023 22:10:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FJPypBAx01TmDtE+r4Mtz4mcyB28MVJlmDyF5wmzk2oB1O/8mQRvNYDf90Rg+hvFf3yhyuVauJbMpzAIZ+9szUVmi/n2i4VF5uxif1g3m9dULXMxLyeNrCtaGKW2DG+LmDZjzEUkZhjGxOFQqr6g//d+xOJCx0JMtFpZLUFlggwka6APDGj3qLP633aw0vDV/M6eG/TNQu35jEQb5gDWfn50ItOyrJ8bDLmZIwQmm1tIqB3NOaNBy+GPrNDhAbPJao9YU1oTNDtyOvlqZJZ+VChFdP8ubkZyVLOyGpoFhIIrX7TgyxYsOa/goCglSlbicfkfvScsDPX6HBYHaMvFiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUkM9mUTN+qbNA3OAy0sSYSH8lrnV+IoDI/uSrqTHyw=;
 b=Vd4iCvUXJuWwyY5MJ4XZkkwsyqFllkBFC2MP4FYydkhucKVCWWdpj8prwF+dnD2HNUI0rKnIBY447AVl2GXiH5N0D7z5vI1Z+fSYGVMcDfk9WBfKefOtiXP0K87JF9LknbizlJ/raL9wORMPu2SthMs9xKQzmSgG36Lx5pAKOS94nPzkkQHRUDzEbtCBl9kELKaRnKn3EOX+AuEG65Kx+9UkOdHySuYSy6B1J9h4aGHj0MsfRWroYZakRwGbGKbpvD7OfptQ84uoV9Mid1YdNa5av4xt2CgiWA1ixRZx1MeltdP754g0TwHWty/ODjyZ0ConLtkqHtDiAaL0N+ka3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=us.ibm.com; dmarc=pass action=none header.from=us.ibm.com;
 dkim=pass header.d=us.ibm.com; arc=none
Received: from SA0PR15MB3901.namprd15.prod.outlook.com (2603:10b6:806:8f::16)
 by PH0PR15MB4877.namprd15.prod.outlook.com (2603:10b6:510:c0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Mon, 9 Oct
 2023 22:10:12 +0000
Received: from SA0PR15MB3901.namprd15.prod.outlook.com
 ([fe80::3e24:9363:57f1:2fd9]) by SA0PR15MB3901.namprd15.prod.outlook.com
 ([fe80::3e24:9363:57f1:2fd9%7]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 22:10:12 +0000
From:   Lakshmi Yadlapati <lakshmiy@us.ibm.com>
To:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "joel@jms.id.au" <joel@jms.id.au>,
        "andrew@aj.id.au" <andrew@aj.id.au>,
        "eajames@linux.ibm.com" <eajames@linux.ibm.com>,
        "ninad@linux.ibm.com" <ninad@linux.ibm.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v1 0/2] [PATCH] hwmon: (pmbus/max31785) Add minimum delay
 between bus accesses
Thread-Topic: [PATCH v1 0/2] [PATCH] hwmon: (pmbus/max31785) Add minimum delay
 between bus accesses
Thread-Index: AQHZ+vaWnZ96qVr1n06n6O+OvSfbNLBBsQAA
Date:   Mon, 9 Oct 2023 22:10:12 +0000
Message-ID: <D404E8C2-E31A-4076-8E9E-9F9793B3EFA2@us.ibm.com>
References: <20231009211420.3454026-1-lakshmiy@us.ibm.com>
In-Reply-To: <20231009211420.3454026-1-lakshmiy@us.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA0PR15MB3901:EE_|PH0PR15MB4877:EE_
x-ms-office365-filtering-correlation-id: 3d2d50cf-b242-40d7-7b8d-08dbc9148263
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B/mN9rAV0i4nezrMjkVRJjYUw+IBWvMdhb0Pu/1IeWHILfaaR/BB4X1Sc+aGtFheMO2I2HQNDlM6UDD11YVvXyg1OARrcxyQICLpnr4N+8QscjY2AFWAoLo5ap9Ms29wEMBhNr8bja0wFC5Fzs9iP7XHFdYWCt4yn3QTyP/M5Pyd253PrsnAvDZwbSCURzibux9ZA/NMETP/PVSA7wKGn+EFxH7uuogqijrAiywBHRbZMVgchYaqn5/oUhe91sahHFuU/Et2vNlGOIAbY89esf7889wA0wvsq4bzaYyKF93EyHVf8S8hyGSl9H7aYFyC1l7tNxr1gzwMT5wJSiIfyWEjtBVlPS+TMt2YtnAXc7PChb0EUqBkU18faUButRvvTwSgSHRtddTqgeug5w2VAx/aLwfJxF+H/RtURt8/ON+YRPxdmOP1Aaih/StZLORHOfGyCZinwFSCQF/2xSLHumhP5/0v5wjVJdNq28cGFzhmUzVN3hzSJ1PvXqf8+DkEtcLJYJLFcp9t1Q3B241REWU8jQcAsYCavyLSy/m9stJunTg8t775fhVFF5RyHLdA5ICIn1VdoJcZyVRh+Ydunk0pM9ut/is+lEpyY8hw6HSgjNJLhzGxXQevBVOm6NSQwityFWZl5iPtJ+gN9Aje6g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR15MB3901.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(366004)(376002)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(2616005)(83380400001)(66946007)(54906003)(66556008)(66476007)(7416002)(316002)(76116006)(110136005)(66446008)(64756008)(8676002)(4326008)(71200400001)(6506007)(8936002)(5660300002)(2906002)(6486002)(41300700001)(6512007)(478600001)(966005)(33656002)(86362001)(122000001)(38070700005)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2VmemVRMUhjc2VNZ3NvaFlVek5OcDNQUzF1MVliOEF4ZEtsaGxKNDk3Z2hz?=
 =?utf-8?B?Yzh6dVpxVXRqc1hSVlpyUVQ5a0NPYUF0MmV3R2l3NklsOEljMkl1Rk9jSTdE?=
 =?utf-8?B?ZXkvV08yTHpoL0duVFRFQ3RYUlIySWJ6L3FxMTJuTVkxOWMwYXVYK2dTQXFM?=
 =?utf-8?B?Zno1Uzk4Z05DU29MN2lvT2I4ajhlcWN2Uy82Y3JWamJGZlc0MlFjZHoxbzAx?=
 =?utf-8?B?ZEtRa0plM3o4U3RWY3QzbVZGUFdONit5UDVLRE5kUyt6bW8yc0MwbHIzWjUx?=
 =?utf-8?B?bmRYcUtPSG1OeEdVdHVST2JRT2VGT0tDM2d5UXVNaDFFOFpNbHFEeldHV1dM?=
 =?utf-8?B?cVFmQlk0TS9aMnhBKzRnTkdiTVcwQWpNdHhlZk9VNDEydHV6NnhnMDRWYmto?=
 =?utf-8?B?RVp6OEZGN1d2djdvb1VWTDc2Q0t6UU9tdDlFcDJFWngvaWhvZXpJemxOVDA5?=
 =?utf-8?B?ckJuakZrTTJJZXdYbzRVZjVZaGZFa2lrZTBGMEx0cjRGbDhwdkJTVW5xUFJT?=
 =?utf-8?B?V2RHaTVwQ2VlL2ZOV2ZuMThKS0Rncnh1RmlWNENndWJHVGdPeG1IZ3BrbW5D?=
 =?utf-8?B?NDUvUWdFMkdRMjVpaXJuazB1T016dGVYSzhpVFU2K2txZ3ZWUXBDWHF1WFdu?=
 =?utf-8?B?d2x5QmkvbFdtcmhFQmRjOVRIV3RWNEZXRjBKRHcxK2lQdllDcGowdjRXNmJQ?=
 =?utf-8?B?QnMwbEtDR3d6S1RvZXZYK3lsWDV0ci9CVVhEMVZLcnNFeUNmcUs4TW10cWxo?=
 =?utf-8?B?NzFENDhJQkJDN3NoT0M2SVNYWE5xNnZLcGowaVBlUmJhQjlWL20rN3R3U21a?=
 =?utf-8?B?OU5obnNlazUybzJtb2NNWll6WElpNHdIL3B4NjhoNmNsM3RJYTgvQXVJZnMw?=
 =?utf-8?B?MWNPWHZCcUJHZEJWbUZycTdhT1NpWnAwKytwWk1GNnk1RlJzcDVMQWJPU1Jp?=
 =?utf-8?B?RUlZOGNralZRWFZmdUIrYit3a2xKMkdiM2MwYzdiR3hmbGhWbzdUTXVlVHRz?=
 =?utf-8?B?UTlONWJBRG9pSUI4eXRKbzV6aDhKSkFkNWk0dVBBSnN6ZFdEekp4QmZrdzlY?=
 =?utf-8?B?cmF4VGNwRVY5Wm5GSnZyZTBnUGsyRkRmeHhCWFJzK1laRkIraGNRUVdLY3Zw?=
 =?utf-8?B?dlhISnRoUkdJMUFjcEdwZEl4YlVlc3VLZ1ByU2ROVVRUWmNPRUVLbmZKSEpr?=
 =?utf-8?B?MzB1NVVEdW9XZWU2VkZaTHFhQ09PUkFseXl4ZStaYkxjREkxL2xmbDZqeEdw?=
 =?utf-8?B?d216NFZnVjdLSzAwNnNSR3Uxd0pndllPY0xMc1dNekhnc3ByT0tHVk9ScjdR?=
 =?utf-8?B?QVByL0gvMUxTYmVYV3dySUtXYW1LbUx6WnVxM1AvaWNJMVR1TnNrbkVIalJy?=
 =?utf-8?B?cGtNQmZHTEZIZWJGNGRQNWRlZzlyUisrSzZiK3BmaDVEMmFLS1FRb0IxS2lo?=
 =?utf-8?B?UittaERqd0c3NW5BS0JzSDljYmx3akhUSFRQZ3RUOTYxMEQyaVc5aG1tRDVk?=
 =?utf-8?B?Nmd4L0lGNEpUSHp4Nm5OeUtSRUpUaSs2WnlVUXh2YWRFMVpwL1MwM0JRcitM?=
 =?utf-8?B?K2kxTHdTbTJ1U0VtaGE5U0k0emJFanAxTkxNdjZaTEo0QnY4VkJGaHQrc2Qr?=
 =?utf-8?B?WFBPWVAvcUYrbEpGcjZWaVZUeW1xS3gzSis4QjdPa1JibDhzMVZ4ME00MTFo?=
 =?utf-8?B?MnFlbUVEUFAzUzBrSm5UbExFbjlzZnJ6eEFYUTJmRUlkdG90TGlWbDg0Vk0r?=
 =?utf-8?B?TXNxRWlaSThGN1lkR0NTMjNxNnNHL2NFWGluUmxWc2p0Z3JrQWowd0xIa3pV?=
 =?utf-8?B?dXk5Vkt3QzdkL3g1d3QzMW1UY1ZuS3gvTzhLOHp3bElWN1AyL0dKOVhGcnAw?=
 =?utf-8?B?U1FvRjFDLzA4TlhYZGJwVU5wNkJDM3dIWEJ3UFl1b3BZT1NkVDd0VVJwaXVl?=
 =?utf-8?B?UlF3Qnp5ckVlQ2VLWTVFQ1JkV0FqWjcrRlhDN252MjIxaXc4SHJKbjRvcUxC?=
 =?utf-8?B?Y2J0blpNUnphQlZmSEMrSkZvZ1I4Y09wL01mVUdPVGVhK1BaK3BBL2ZTWndi?=
 =?utf-8?B?clBOWHFQbEN1NDV4bk5CWEoxVkNCOVdEQVl6UVA5YnRZeVJtaHU5NGFmSmh0?=
 =?utf-8?B?Z1FMWXdKamJFdU9YSDVNaDkyUHVleXZJWnJBZUFqMzRTN05RdEN1L0d4Nnc1?=
 =?utf-8?B?NEV5MnVrd2V4L0tiR0pCakhGbVM4aG8zOG5JR1BQd3Eycnp1QTVjbWtSTHI0?=
 =?utf-8?B?YkQ0VWw4MW4rdDFzVHprRHA3d2JnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6B570CD0B3BB0842A8041E50DD6BF8C6@namprd15.prod.outlook.com>
X-OriginatorOrg: us.ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA0PR15MB3901.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d2d50cf-b242-40d7-7b8d-08dbc9148263
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2023 22:10:12.6725
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N7+dq8yQrKaHMatAc7Au5Qx+y8FBtsPOP47FGwioCa2qRloAl0h5hxd8D1GfcuDFuW7wFgjfoDNFaN6Kh9LVCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR15MB4877
X-Proofpoint-ORIG-GUID: w3jM1NFF8gEgpRbUF1BuEx6tNbVwvQz5
X-Proofpoint-GUID: w3jM1NFF8gEgpRbUF1BuEx6tNbVwvQz5
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_20,2023-10-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 mlxlogscore=999 bulkscore=0 malwarescore=0
 impostorscore=0 phishscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310090175
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Q29ycmVjdCBMaW5rIHRvIEFuZHJldydzIHByZXZpb3VzIHByb3Bvc2FsOg0KaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsLzIwMjAwOTE0MTIyODExLjMyOTU2NzgtMS1hbmRyZXdAYWouaWQuYXUv
DQoNCg0K77u/T24gMTAvOS8yMywgNDoyMSBQTSwgIkxha3NobWkgWWFkbGFwYXRpIiA8bGFrc2ht
aXlAdXMuaWJtLmNvbSA8bWFpbHRvOmxha3NobWl5QHVzLmlibS5jb20+PiB3cm90ZToNCg0KDQpS
ZWludHJvZHVjZSBwZXItY2xpZW50IHRocm90dGxpbmcgb2YgdHJhbnNmZXJzIGZvciBpbXByb3Zl
ZCBjb21wYXRpYmlsaXR5Lg0KDQoNClNvbWUgZGV2aWNlcyBoYXZlIGV4cGVyaWVuY2VkIGlzc3Vl
cyB3aXRoIHNtYWxsIGNvbW1hbmQgdHVybi1hcm91bmQgdGltZXMgd2hlbiB1c2luZyBpbi1rZXJu
ZWwgZGV2aWNlIGRyaXZlcnMuIFdoaWxlIGEgcHJldmlvdXMgcHJvcG9zYWwgd2FzIHJlamVjdGVk
IGR1ZSB0byBjb25jZXJucyBhYm91dCBlcnJvci1wcm9uZSBvcGVuLWNvZGluZyBvZiBkZWxheXMs
IHJlY2VudCB1cHN0cmVhbSBjaGFuZ2VzIGZvciBzaW1pbGFyIHByb2JsZW1zIGluIEkyQyBkZXZp
Y2VzIChlLmcuLCBtYXgxNTMwMSBhbmQgdWNkOTAzMjApIGFuZCBub3cgbWF4MzE3ODUgbWFrZSBp
dCBzZW5zaWJsZSB0byByZWludHJvZHVjZSBBbmRyZXcncyBnZW5lcmljIHNvbHV0aW9uLiBUaGlz
IGNoYW5nZSBhaW1zIHRvIGltcHJvdmUgY29tcGF0aWJpbGl0eSBmb3IgYWZmZWN0ZWQgZGV2aWNl
cyBhbmQgbWF5IGhlbHAgYXZvaWQgZHVwbGljYXRpbmcgaW1wbGVtZW50YXRpb25zIG9mIGhhbmRs
ZXJzIGZvciBJMkMgYW5kIFBNQnVzIGNhbGxzIGluIGRyaXZlciBjb2RlLg0KDQoNClJlZmVyZW5j
ZSB0byBBbmRyZXcncyBwcmV2aW91cyBwcm9wb3NhbDoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC8yMDIwMDkxNDEyMjgxMS4zMjk1Njc4LTEtYW5kcmV3QGFqLmlkLmF1IDxtYWlsdG86MjAy
MDA5MTQxMjI4MTEuMzI5NTY3OC0xLWFuZHJld0Bhai5pZC5hdT4vDQoNCg0KTGFrc2htaSBZYWRs
YXBhdGkgKDIpOg0KaTJjOiBzbWJ1czogQWxsb3cgdGhyb3R0bGluZyBvZiB0cmFuc2ZlcnMgdG8g
Y2xpZW50IGRldmljZXMNCmh3bW9uOiAocG1idXMvbWF4MzE3ODUpIEFkZCBtaW5pbXVtIGRlbGF5
IGJldHdlZW4gYnVzIGFjY2Vzc2VzDQoNCg0KZHJpdmVycy9od21vbi9wbWJ1cy9tYXgzMTc4NS5j
IHwgOCArKw0KZHJpdmVycy9pMmMvaTJjLWNvcmUtYmFzZS5jIHwgOCArLQ0KZHJpdmVycy9pMmMv
aTJjLWNvcmUtc21idXMuYyB8IDE0MyArKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0N
CmRyaXZlcnMvaTJjL2kyYy1jb3JlLmggfCAyMyArKysrKysNCmluY2x1ZGUvbGludXgvaTJjLmgg
fCAyICsNCjUgZmlsZXMgY2hhbmdlZCwgMTUzIGluc2VydGlvbnMoKyksIDMxIGRlbGV0aW9ucygt
KQ0KDQoNCi0tIA0KMi4zOS4yDQoNCg0KDQoNCg0K

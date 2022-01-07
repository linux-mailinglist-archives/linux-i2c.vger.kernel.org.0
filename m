Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 756B5487EF4
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jan 2022 23:33:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230427AbiAGWdl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jan 2022 17:33:41 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:33631 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229626AbiAGWdl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jan 2022 17:33:41 -0500
X-Greylist: delayed 536 seconds by postgrey-1.27 at vger.kernel.org; Fri, 07 Jan 2022 17:33:40 EST
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 207M4lgf029428;
        Fri, 7 Jan 2022 17:24:41 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2055.outbound.protection.outlook.com [104.47.61.55])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3de4vqgqg0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 07 Jan 2022 17:24:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WEumb+WVXb+eQTTMvXdEAAPCznONyLBonJzyfF6Y3LgJ3n2lhdVIAgz78JKucSgNJMXHleHP95CBMjVUk4VtTuIiNDitqLhRX1mgk/4CHDNUoKFzIY5++KxqvnK4dk2l/lZXTS25YY1oJoNnHoDkFvDN4OaWecH1UvkbrapJKPzLMmgPrhhaqLIDqZO9c35o/vmuiAOKAuwgSVUvdlGauWPhuISmIQIldUYRcDzVbZBOVL0MKeLxyv6X1pJriRN5h8ENXoXLOQyFZCdueKXl2Xk6wyjXd5h9/7j8dQoWUaqMeI7MGQ3Ibh3vdaqomcuSH8FWAl2uv+mqsthX0i5kfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fzj/rwpewXAWF3Bnx9Aod/cHdoxsfMJm6q5PDDE1DzA=;
 b=jVUcrnxLvpizo7PQ0rh3xNPELR4mX3lq5GQ2Lukgp8VdIYPQ8BTTVEpGR/5wMD+6cAgpjI5wnuDkICzP5JvZiAbXCd6bsActlSZa5WFB0wn99A085nhsnuZ/Q777HL9AfR8NAHpwhrGnyKoQHfwx58zFnkQJE0X00wuIeNLQEmcGwTnioiersU782z8FXeb6tixr3t13whtNPECj7MKsJ0Hgip0CUzqoJnqgTUS5DSIUITjxLRvdCkAVSLQfQbZ7r6qLQEB3KqauvhzqDKag2/OWV3r1lOE4i1DBLGV996ihrVZhI9lYIkZhMIjSlO6b9gvBrct7jL6P7Tv2+INkLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fzj/rwpewXAWF3Bnx9Aod/cHdoxsfMJm6q5PDDE1DzA=;
 b=ArxJOZvR1f7AoJ1Tp/R+x2noqCEMKowlbPLNtQxM0AoLc8bxOvHEx2w05h4dIrkX4ZGOdlJZdE+gJMKLjjZkFgI6ZgS70zfgXlTyUCYN6zXrYzsBa8FtUf/uOS2KBM42MNUjwv2eJXsLl+IOCwBohIYngyGjsndmR2pe0gb3uRA=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YT2PR01MB5775.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:57::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Fri, 7 Jan
 2022 22:24:40 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76%5]) with mapi id 15.20.4844.016; Fri, 7 Jan 2022
 22:24:40 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     "shubhrajyoti.datta@xilinx.com" <shubhrajyoti.datta@xilinx.com>,
        "wsa@kernel.org" <wsa@kernel.org>
CC:     "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "chiragp@xilinx.com" <chiragp@xilinx.com>,
        "git@xilinx.com" <git@xilinx.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: cadence: Add standard bus recovery support
Thread-Topic: [PATCH v2] i2c: cadence: Add standard bus recovery support
Thread-Index: AQHX5P+6gbR74OgF70aSoGIQLQRQvKwaZ18AgD35WYA=
Date:   Fri, 7 Jan 2022 22:24:40 +0000
Message-ID: <3d326b8430017ef67f5e0f99bb708e00113e0bc7.camel@calian.com>
References: <20211129090116.16628-1-shubhrajyoti.datta@xilinx.com>
         <YaTA1j/yrCe1gGOv@kunai>
In-Reply-To: <YaTA1j/yrCe1gGOv@kunai>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5 (3.28.5-18.el8) 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 536ce500-8df6-4a45-6c26-08d9d22c7efd
x-ms-traffictypediagnostic: YT2PR01MB5775:EE_
x-microsoft-antispam-prvs: <YT2PR01MB57759655EC989DB11DD512F6EC4D9@YT2PR01MB5775.CANPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IdRceIIrz//aVxrjXVW0/Y2ZoFTVrlT1xmmnbvTuHJyGxeYs1TD0OtEUCAJ7NLgFklYZRlDa478w9v9nNDTvGM8a/LlBlaA/uUh+sBLbKYmixXaevpTV/F07LS7oJw3UA6U6OG2F1FZ4vt9xMljbmnJ2mt1DmPSkv4C/ZeMNVauJG17Sn3ae1Y9G9Xvq/0JcO7pG1MIhk3oup/Pbo75sPDTxN50e7dWfnq989aWkjwgsgRVi0fcv9KrvWuc2PDVjKhKGKKJdCHDA8G648genj7Uex7jgJyv0yrxtXyiVlDGB70YpBnIgY8qZ3PjitemmqyFz3S3Jx33fRNMRrMuO7Jh1g3bgILgL4kH/0nlXZ8ZHh1nJ8aXgDMgkdEPlMb/BM4LdZCta59JkRwHx9onSHkBohfOW/S3FzqDVkwtRDI3O9b1v3RkaX5DyLyy0m2FPRJbSeNj3uw2nxj32tpMll6JigvlsmHveqMmDs26/8OHdy13MKfBN5P1jM4q1HMwWQsIOPsMTn8pfpeDZ8PmAUyba8LORKdN0sU40hPLhLWlj3LbzPMLXZjJd1OZGbGXpzNbWwz2N8zjcw4uNIDusheSiu/TDt03IoSk/nq6kqDXFX4gca3gQ86vxv7UlqB2VykG3RpsvpUf79kFUs6pakoIQLTnfTPN4vn8aZQcjRoqwzMdxLI/nIAiuZUnIFbj0iK10ZchDK1auU99Lz5IQANpEbQ1P9GnxF7LesK2CUZNe6xjCYSRlDH8cTlgNLxWOAj1SpZ7gxTlv+V1Wt1EFA/7DnKs8RqwTJjyK1R+GJzeHTQ9/Vmed0VWuFqS8N7AxxwprNs50Jb3lM95cnDgkbw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(122000001)(316002)(76116006)(66476007)(64756008)(2906002)(66556008)(66946007)(6512007)(6486002)(26005)(36756003)(38100700002)(38070700005)(4001150100001)(71200400001)(186003)(91956017)(8676002)(83380400001)(44832011)(4326008)(8936002)(66446008)(2616005)(5660300002)(508600001)(110136005)(54906003)(86362001)(15974865002)(6506007)(99106002)(18886075002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WTcwTzJEc2VWbkZzY2FEZ0l3K2dPRmRlRXgrL2V2clBnVjhRVjJheWMrUkN2?=
 =?utf-8?B?K1RRVFJVVHBPNlcwejNSS1gxbE1OZ2FoL3hhZVdjSUxlbjIzWlNkZE16SWw5?=
 =?utf-8?B?QzhudTVGaTZsbENCLzBXa1hsUHdwTFFIcThPR2hsZWYxTy9GVXRTdnNhdG84?=
 =?utf-8?B?dmRzb1hJSjVmUE9IVWFHdkxrOEFvK0pvYWRIRVN0RzBrMzhBRDFwZE9qTktJ?=
 =?utf-8?B?VVVuNEVidTRMMDVYdEhON3dYQUtoVjZmd1M5bjhhb3MvaEF6dGlQTDZ1ZVNL?=
 =?utf-8?B?UGwwbGQzQUxzWVRFd1o5WGoxRFIxS0xjS0g3WGtTRFRrK2FIZXlqdzJZSlAr?=
 =?utf-8?B?MHVPWGt2VVJ0cTVHVmNCZ2hpdE45NDlYWnpnQlV4bmRRdVBwVEhUVmhJM1BH?=
 =?utf-8?B?THM2Tncxa0Q5WTF3RzdOd2hJUFNUV2VHZ1d1T1c2RENaNDd2Ymx4ZVV6d29o?=
 =?utf-8?B?bWNralRVWDdnTVJmVlVZYVUxQzF4T1JhNGFHSlErSFRUdEhwTmpQSG9VbnRu?=
 =?utf-8?B?MjY5Q2ZUK2FNYjdkdkVrZ3l3dXFndEMrVnhrWThmM2RvRzlEdmU5SG1WN01K?=
 =?utf-8?B?elZmdDVoYTdxRnNPM2M3UlBGUDhVTkxkWFRuSEdTQklUaUdlWTRLaVdjaFJX?=
 =?utf-8?B?NjB3cHYycjNxZTZJT3ZVWUR2U05sMldGWEgwb3ZoUjJOOW1zb1RPZnpiR2Nu?=
 =?utf-8?B?QS92N0V4emxyU1dRalBvaDBOYmRoeWlzYUF6WHpLa096MFUzRnRMN1l3WmtZ?=
 =?utf-8?B?TDZJZEFYYWJxbnhENTRHZERDYjFDbFhXcTBDdU9KaVpTbkhEZUh0aytJVW9z?=
 =?utf-8?B?OUtJZHc0VjBXS3pSWEhPU2Jsa2xUZHNOK0dKbGZicW5FT2Q4TXAzVnhiQXlx?=
 =?utf-8?B?dmdvQUJaZ2J5TnlBZ2krVmk3U3pxYytrbTNDeUszQ3QxYWdRakVXLzh3d244?=
 =?utf-8?B?NGFzTFVES1haN1hUUHBSelV6TDdQOExTcnh1MnBseWRFdkVxLzFaZ045TUF3?=
 =?utf-8?B?eG8ybVQrWkV6K3pyNjh5QWVLdDF0c1E0Qkc5YnhTNUZHRTJhdU1wcFp5Mlh2?=
 =?utf-8?B?UWZLV0ZiWC9teUhCWndnUDBrZVB5NFhrREdUcHhoamJqOGwyYWttOTdCRlBR?=
 =?utf-8?B?R1lhaWdyNjE2Zm4rWGlTcDNVMU43UWJOdzVHNFpueFhwWkZNR3RGOUczMXh3?=
 =?utf-8?B?eWZIdE0wajVXTWNsaHIrb3c4NkJxaGRFYlZ5TTNUekJNWFlLWmlvVjNBSEFM?=
 =?utf-8?B?TlpZZXdoUGw0bUNqOXcwYkcwMlk0QkVuR3JPQ054MVg0VnhTUE9ZYldibHBj?=
 =?utf-8?B?VHE0VVRCMmhsRmJkTk93SUZXTW1WMnBNbU9qWTZHTnB4blREVnU5Ukl2UkRH?=
 =?utf-8?B?TUt6Y2JDQ29KK3NpdDh6S2wvb205VjlrSzZZT2tsUlR6WFk3ZEhQcEdXNzRB?=
 =?utf-8?B?Y2JmTU16amloSDIzZEQ4M282NkNpenpYVmNNbGw4MjRZc3dkc3hjTzJ2MGcx?=
 =?utf-8?B?OCtubFVJMUZXM1BuZjlkQmxzd21JQnovYytUV0tobWR1THFYRmFZRjV3THkv?=
 =?utf-8?B?dXo3R1NBVGNqL213Q05kYno4TjhNWVZ0cHVZQUNiakJYL29mVFgxNmlhaGZq?=
 =?utf-8?B?c2JzNmhUSHlIa0lLbU8rOFNnV0dLdEU1bjRpMW1WSUtwSUZ4VTFvN09oRVNy?=
 =?utf-8?B?SVl3UFM4YjRFb1hoMkFvRWQ2Y1ltditEV05WdWdkakExOU5CSnJXT1JhVjRU?=
 =?utf-8?B?bS9KZW04RHY3VnNrakg2dVd6Qm1FUDduMVVUUi9FVHRYMjBWbVRuemNQWFph?=
 =?utf-8?B?bFRTMDBVUXY2SnJHK2laWWc1eUR4RUZSaVo0VVRmQUhON2QyY085RUNCUyt5?=
 =?utf-8?B?QnJtR0pQZ0FxNGw2YkJWNzRzelMrZmc2by85ZzhlM1Q3NU9oV0dFRm5FanNG?=
 =?utf-8?B?WVQ5MGt0dG4rVDFVYmlOMkF3OXozV2lVYWxJd3o0dmI0RFBlYVlGYW1VVVcx?=
 =?utf-8?B?MGhyaXNSS0g3Tkgzd2w5YjYzT3BjdVRZVUdOWktoLzltSWZpL3R3N1JyT1Rx?=
 =?utf-8?B?UjFrelFVbW1CT2lnZjZySFVCMkFBYTFrWkpaSTRtbEpWK3pqRlczSE1nWXl0?=
 =?utf-8?B?aktlcWZxVXpDZDNUeTlLcGRUZUhvcll6RXlQRWtDNTRGN1lzQ0NlMytpcVlT?=
 =?utf-8?B?dk5wOVpETHBsWVdSOCtPanUwSUF6L1hMUkp3ZUxzU0F6OXpMTVppS2JybXBD?=
 =?utf-8?Q?vGBBIiWVBXxQUcp8Nt3v2uS1l+cMDH9NWi1/8M6E1I=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6050204E8782E24AB1415BEBD07BBDC8@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 536ce500-8df6-4a45-6c26-08d9d22c7efd
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2022 22:24:40.0255
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RrFFwsL180xUzuN2MSSOPCHck772HIN2Pyqt2fZtxX+iDsbL13ogbvEar7xc0xBDsa9rOjSMlrlNro6RWBgWAUMjNXbyQk5TZRjNQHkzFCU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB5775
X-Proofpoint-GUID: i1dHMthHGE7qsliDv2MGGXrFfoMqZd70
X-Proofpoint-ORIG-GUID: i1dHMthHGE7qsliDv2MGGXrFfoMqZd70
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-07_10,2022-01-07_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=510 spamscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 clxscore=1011 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201070132
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gTW9uLCAyMDIxLTExLTI5IGF0IDEzOjAwICswMTAwLCBXb2xmcmFtIFNhbmcgd3JvdGU6DQo+
IE9uIE1vbiwgTm92IDI5LCAyMDIxIGF0IDAyOjMxOjE2UE0gKzA1MzAsIFNodWJocmFqeW90aSBE
YXR0YSB3cm90ZToNCj4gPiBGcm9tOiBSb2JlcnQgSGFuY29jayA8cm9iZXJ0LmhhbmNvY2tAY2Fs
aWFuLmNvbT4NCj4gPiANCj4gPiBIb29rIHVwIHRoZSBzdGFuZGFyZCBHUElPL3BpbmN0cmwtYmFz
ZWQgcmVjb3Zlcnkgc3VwcG9ydCBmb3IgdGhpcw0KPiA+IGRyaXZlci4NCj4gPiANCj4gPiBCYXNl
ZCBvbiBhIHBhdGNoICJpMmM6IGNhZGVuY2U6IFJlY292ZXIgYnVzIGFmdGVyIGNvbnRyb2xsZXIg
cmVzZXQiIGJ5DQo+ID4gQ2hpcmFnIFBhcmVraCBpbiB0aGUgWGlsaW54IGtlcm5lbCBHaXQgdHJl
ZSwgYnV0IHNpbXBsaWZpZWQgdG8gbWFrZSB1c2UNCj4gPiBvZiBtb3JlIGNvbW1vbiBjb2RlLg0K
PiANCj4gR3V5cywgc29ycnkgZm9yIHRoZSBsb25nIGRlbGF5Lg0KPiANCj4gPiAgCWlmICh0aW1l
X2xlZnQgPT0gMCkgew0KPiA+ICsJCWkyY19yZWNvdmVyX2J1cyhhZGFwKTsNCj4gDQo+IEFjY29y
ZGluZyB0byBJMkMgc3BlY3MsIHJlY292ZXJ5IHNob3VsZCBiZSBkb25lIGF0IHRoZSBiZWdpbm5p
bmcgb2YgYQ0KPiB0cmFuc2ZlciB3aGVuIFNEQSBpcyBkZXRlY3RlZCBsb3cuIEkgdGhpbmsgdGhp
cyBtYWtlcyBzZW5zZSBiZWNhdXNlDQo+IG90aGVyIGlzc3VlcyBtYXkgaGF2ZSBzdGFsbGVkIHRo
ZSBidXMgYXMgd2VsbCAoZS5nLiBicm9rZW4gYm9vdGxvYWRlcikuDQo+IE1ha2VzIHNlbnNlPw0K
DQpJdCBsb29rcyBsaWtlIG9uIHRoZSBzdGFydCBvZiBhIHRyYW5zZmVyIGluIGNkbnNfaTJjX21h
c3Rlcl94ZmVyLCBpZiB0aGUNCmNvbnRyb2xsZXIgcmVwb3J0cyAiYnVzIGFjdGl2ZSIgaXQganVz
dCBiYWlscyBvdXQgd2l0aCBFQUdBSU46DQoNCiAgICAgICAgLyogQ2hlY2sgaWYgdGhlIGJ1cyBp
cyBmcmVlICovDQogICAgICAgIGlmIChjZG5zX2kyY19yZWFkcmVnKENETlNfSTJDX1NSX09GRlNF
VCkgJiBDRE5TX0kyQ19TUl9CQSkgew0KICAgICAgICAgICAgICAgIHJldCA9IC1FQUdBSU47DQog
ICAgICAgICAgICAgICAgZ290byBvdXQ7DQogICAgICAgIH0NCg0KSSdtIG5vdCBzdXJlIGV4YWN0
bHkgd2hhdCB0aGUgQkEgZmxhZyBpbmRpY2F0ZXMgKHRoZSBYaWxpbnggZG9jdW1lbnRhdGlvbiBq
dXN0DQpzYXlzICJvbmdvaW5nIHRyYW5zZmVyIG9uIHRoZSBJMkMgYnVzIiksIHNvIHdlJ2QgaGF2
ZSB0byBkaXN0aW5ndWlzaCBiZXR3ZWVuDQp0aGUgY2FzZSBvZiBhbm90aGVyIG1hc3RlciBkb2lu
ZyBhIHRyYW5zZmVyIGFuZCB0aGUgYnVzIGFjdHVhbGx5IGJlaW5nIGh1bmcgdXAuDQpJJ20gbm90
IHN1cmUgaXQncyBjbGVhciBmcm9tIHRoZSBwdWJsaWMgZG9jdW1lbnRhdGlvbiBob3cgdG8gZG8g
dGhpcz8NCg0KVGhhdCBtaWdodCBiZSBhbm90aGVyIGltcHJvdmVtZW50IHRoYXQgY291bGQgYmUg
YWRkZWQgaW4gb25jZSB0aGUgYnVzIHJlY292ZXJ5DQpmdW5jdGlvbmFsaXR5IGlzIGluIHBsYWNl
Pw0KDQotLSANClJvYmVydCBIYW5jb2NrDQpTZW5pb3IgSGFyZHdhcmUgRGVzaWduZXIsIENhbGlh
biBBZHZhbmNlZCBUZWNobm9sb2dpZXMNCnd3dy5jYWxpYW4uY29tDQo=

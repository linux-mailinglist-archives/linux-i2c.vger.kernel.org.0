Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8CAD3B874A
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jun 2021 18:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbhF3Q6J (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 30 Jun 2021 12:58:09 -0400
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:18247 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229510AbhF3Q6J (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 30 Jun 2021 12:58:09 -0400
X-Greylist: delayed 934 seconds by postgrey-1.27 at vger.kernel.org; Wed, 30 Jun 2021 12:58:09 EDT
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 15UASaeA002486;
        Wed, 30 Jun 2021 12:40:06 -0400
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2058.outbound.protection.outlook.com [104.47.61.58])
        by mx0c-0054df01.pphosted.com with ESMTP id 39g3ve0q85-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 30 Jun 2021 12:40:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqj0yJpZRNUVlkaOVEsLouPto0bXPm7k3oA45oaZEk3qBKTjtZUUI+9Z8R2G9bA2Lg+hgEVgOKNZc0FkFgN+OkEubxpOq3p0yO3t7tx2iKmCOC1RvwS9JAMI2NHdQGtdziLYwzyremdc1kCesJP6FJLZJ/nQRwuxOkqlwO+4Qfkum6SnVwBlUN7L9Pnq/t0TvHpS1LuXJBumL2dpDqfUz4PKuMgHxuLIF4dURYFgxPsC7hz/a6VPz64J/QIy/jKoUt+TDShuYMEBqZj9uETgOK4gKLHrZT6iUbOb+amDxSlRvJkUYER1Ri593fKDpvvv006DrNkBTOjw7hCZn7wh+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q532oxjEMuSNzsS7sGeyICtwMwHiKuXA8x4meRqhrzA=;
 b=fdDHORsrChT9TcWiM1CYxUWB1qXUq/EaU26+xBg1FIqO8uFrQEe1EzYgJH+hFg4zPyoGooPuboCl6QHEBCqxU3V3CmM7c0PTB3VIz/SNkUMwN5tFeLNhAa7d76HxlBn42OT3vs2ITL/f/uY3Sdt4V5II7TK3+o/5fq6I5Nc2fDhJAeBxUM5MI+Aj7KKQwA9QsCOWyjfdZJBhyYDEjHCVjYAcQONDmQTzuDVghURImkN5B6g5N5G4UBUgpQE7KBAi3deX5GOAYiEXf7UM9qTBiIv+Ho5TmqNehuG7oElCKqlZ8KGRS0jPmhHx/rAKqDoxdwz0mVKAzQyQpbfw4qNtGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q532oxjEMuSNzsS7sGeyICtwMwHiKuXA8x4meRqhrzA=;
 b=aZvDBWoNHTasRmKypBJpSZc8fWZMJ2BdG8mA7LexGfKCKdp3KOm/pxrv8FJ4WKLo9/IMoGCuj6YmbgeuXv2yHDlCAy9KREWdkEhmLRimWxVGb8yO2OfpLdThvMgF5zQdJsyg2o+drnXTkWI3e3jjb+5JU2hRWcmvVpxCCoqwQ9Q=
Received: from YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:27::23)
 by YQXPR01MB3957.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:4b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Wed, 30 Jun
 2021 16:40:04 +0000
Received: from YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::88bb:860e:2f3a:e007]) by YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::88bb:860e:2f3a:e007%5]) with mapi id 15.20.4287.023; Wed, 30 Jun 2021
 16:40:04 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     "michal.simek@xilinx.com" <michal.simek@xilinx.com>
CC:     "chiragp@xilinx.com" <chiragp@xilinx.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: cadence: Add standard bus recovery support
Thread-Topic: [PATCH] i2c: cadence: Add standard bus recovery support
Thread-Index: AQHXMk6zStgz0Hk5YUKH6Z19NJnhaKq9bBwAgG/MbgA=
Date:   Wed, 30 Jun 2021 16:40:04 +0000
Message-ID: <021589cf97b5bf3031d0c72e2ba22b921e504854.camel@calian.com>
References: <20210415232532.4070366-1-robert.hancock@calian.com>
         <33112554-474c-0740-27b4-42b2f8755daa@xilinx.com>
In-Reply-To: <33112554-474c-0740-27b4-42b2f8755daa@xilinx.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5 (3.28.5-17.el8) 
authentication-results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=calian.com;
x-originating-ip: [204.83.154.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b81acc3b-fb9d-45a2-4ca8-08d93be5b69c
x-ms-traffictypediagnostic: YQXPR01MB3957:
x-microsoft-antispam-prvs: <YQXPR01MB3957E0972B2D6C71E457A485EC019@YQXPR01MB3957.CANPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E/3US1o8ayNMiYOo2bFKxuPNtshxW3Xbdl+pXZqIvbLm5m1mXSiinqK7ExltV2MJLXR8unDd2a36WZ3ea2vdMGDfOt1Y+yExB5qhyV0P09M+aRcsM93q6g7fe00VMpP56+FfxDF9y8HdVXfZfjINg9+WSrPZnEJ2eaMP0sE+IIP3uy6w3rA6mDWDpnT+Eu7tkigan/S8kKUzXb1WVHy76zME6jfrcXHuVKC6sJ6oG8LeZ1Z5WxjxMf2gIBBGRojHDZ8h3CJIBM39UJEdcvdTPRMRD9PGfiIAGOjMbBPKW0ZzeO2lBmyYQtBU/e2ZU+/FR7MkhYed11s+P+8L/2hPJjMUCxAOyQlx9PW1y4KxcYK47ap1DARltb00AdTt9MYODeEwfzEk06uq4VKtsMwoAZz7tXhfspCCUejCA/3ZMqdtqL0JQ1BqMR2F2KrMXox5AL9uz4SmHtIMS1K2zHkooAe49CWg7mMW3m+3bEiFCD3h9QFFVGevuuo0Te+KAHtFcVDxZZz90EJjXWExr+AxFiC8dWa22/ghE0BLqpwi5/y3O6uiL7J+va7Wj8EsFXNI7iEuEmfaCfCYtz3W85mLb5pmUDwu+VfmeVJ9ckMD42r/z3PBd/iYl+VOA3sg8Lnu0A68ez7U1pTwOJd++WBZEOq0LGdVODclrzZmrnRl6/94aWmOuwWq4i7vuqzGyHEvfMMBZOzm0U7XhRRZDNXTxyB9kcSl3UYPI3GhvL30jb1ucrFYFDghrpHlJxQgJgKLbLDsKOdaQyPRiCzn5/l31Hy7IH4Z32Nu2p6IUwcj3fB+mZb9D2HHtkvvpTbzIpSGtIJ1FOe49Ubx/MWDsTyZmBjnra9anWk/s4qe8OhNQKo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(346002)(39840400004)(366004)(83380400001)(6512007)(2616005)(71200400001)(6486002)(6916009)(44832011)(478600001)(4326008)(66946007)(86362001)(122000001)(91956017)(66446008)(64756008)(66556008)(66476007)(2906002)(38100700002)(26005)(53546011)(6506007)(186003)(36756003)(15974865002)(8676002)(5660300002)(54906003)(8936002)(316002)(76116006)(99106002)(18886075002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MERZN2cwZXlxTDNFY0pvZjRVdEMweE1uMEF2bzZiUkJVcWtEZ2xTRGRYL2JR?=
 =?utf-8?B?ZnlpOExCQXN1V1hndUFwdFNWVkZCOFhyMUlWd3R3THNROWZhbFdCci92cTQv?=
 =?utf-8?B?WmErMG9oQTdtN3Zxa2Rjcmo3N05Sa0g0S3dHNFdpVTAydVplSElzZGxveno1?=
 =?utf-8?B?aWp6c1F0QmhzcFVMQW9CUTM0WHNCbmJlY3VHVDdXbnE1WlF4TnM4Qld2K09I?=
 =?utf-8?B?ZG1jVHVIOXhTazFXRk5MVXRIbGFqdzlPdjh2VitwWEQ5a2M3VUY5MnhLcFhS?=
 =?utf-8?B?TUx1dzgvRnQ1QW9YeEZhS2luVjZUYjFreWhVTEE2UlJSRXU3c0tzNG9FdlVk?=
 =?utf-8?B?bkNPcnNiR0FBZE1TTGZ2TnZ4U3RBMTYyQlB5aDRoRnVGNW1nSVBLQVRUT0Jz?=
 =?utf-8?B?aFNKQVNZbUdyd0wzTHFUQVh2YVhvZTZSait4WVl5eFQrNUtMSFJ6a2RnNkhL?=
 =?utf-8?B?ZDBYMGo4ang0ZmIyV1paYmE5TXdDWjFJcVpPa0hpTERlLysxbVM5cHR5UGUw?=
 =?utf-8?B?ME9INmlvWUIvQVd5Z0pjM3lnVHVoZ3IwcmxtdktneVZBMzBqUU90c1hla1F6?=
 =?utf-8?B?SnY4Um45ZjFPMHIwdE9zNWZMbGk3RXhXRG5OamZ1d1FGUE5MeUtJSm42L1JM?=
 =?utf-8?B?WDdkNFhpMjlheFp5c0d2YVBabkoyR0xTVTJjUzlid1JMdG5TR0F1WGEzdlZM?=
 =?utf-8?B?d1lnbHVGalZ4M0xFZWZYVitER0J5NzZVZmF3aHFCRVZiejBsVkJBWDJyNUpP?=
 =?utf-8?B?ZStuZVpMWnlkQ0ZYUXBnRUVqbG4rVXV1UWw1dys4QTNlRS96YTVCeTJHSWQx?=
 =?utf-8?B?Q1dyQlRoTHJRZE82Ly96MHlxQWRsS1NJQys0QWFMU0VJY2ZVWFBYOUpiRWVv?=
 =?utf-8?B?SEtnOGpzbGs1bmRmYUJuMG1PODBQaVQwdERkSFNKMTVhN2FObkJ6WmF0bkV2?=
 =?utf-8?B?cnVSMjBwdzN1RFVvcDJSZ1RzNjBRbVlLRWVOM0ZhTG9UbTVMZjQrVUxkei83?=
 =?utf-8?B?VlVIelJnaUNLS0UvQ2tESUtwWHkwc2tXSlNmUTh1STdyVkRRcEZiaEIxdHQ1?=
 =?utf-8?B?NndENllxWm5Sc1dlSndOZENvNmsvT29yamU0MFpQRU9Zb1JyMlZIU0Q3MnZa?=
 =?utf-8?B?dUl3WitSODhpN3doeHBCWkJvak5qUCsvdzNMRSszVHNBSms4Wm5ncThpNzFO?=
 =?utf-8?B?TzNMVzZYV1ZITit2Vzh6T1ZsQVFSSnIxOVlCelZDMi9DQ1dnYWdOVmgrNVZX?=
 =?utf-8?B?SHROUmFaN2F6b24wdzAxU3pNbDc0MXNzeVBLenBKd2FWZzhHSmhUY1pRNUhI?=
 =?utf-8?B?a0cwTXRHTVJRNk0rV01VK1R3U2RYQkJvbEVaYnI5NWpaUnoyWmVKNXdKRFlz?=
 =?utf-8?B?clpLMmE3OGQ1V001K0tvdm0wNVBHeXVOSStzOURjL1JjWmtaN2ZKazY4VVVk?=
 =?utf-8?B?TW5QRVRVaS9wc3piQ1pjeWdibnZGTEJNVlhYV3ZHSzV4bGR5cnZIQTBJaTha?=
 =?utf-8?B?U0ExQkRnMnpaS3ZleEdDbkk5TnVXOGZGQStna1BTb0VPNDlWRUpKdE44RElD?=
 =?utf-8?B?LzFhSG5vQ1JvMjQ0M3piNjdXTnEwMDhCL2dkREF5MEJuenlTNTJPaVZxQ09n?=
 =?utf-8?B?dm9PZWZkRGRSU055b2N1dUIzQk1CdDFrTzhQalJEb0thS1J3VUNGdE9hTUY3?=
 =?utf-8?B?MzdTZW1LQnVOakJNK2NaZmlDbTRVMzJQQjlnZy84dFhubW9xRmpTRENPenlC?=
 =?utf-8?Q?CL8BBMeOL5wbcjACRIMxlh7lSmzB1g2fOD2g+hH?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <E3B97639B8FC2A4F870F45F18036600A@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b81acc3b-fb9d-45a2-4ca8-08d93be5b69c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2021 16:40:04.6025
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B6/j8uBRKo7sGBRN+uh8aRhvuyMs9tmsSWiWlopLAjjS0nkYVhToNhAfYxbybvHsQoYPuXiYLg30PA3rd2Li2SlhMOA5c/dHbfAzDTEjons=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQXPR01MB3957
X-Proofpoint-ORIG-GUID: 2554dlKPNNubr_fFLVPSmdfxMRVfnsmH
X-Proofpoint-GUID: 2554dlKPNNubr_fFLVPSmdfxMRVfnsmH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-06-30_08,2021-06-30_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 mlxscore=0 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1011
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106300095
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gVHVlLCAyMDIxLTA0LTIwIGF0IDE1OjIzICswMjAwLCBNaWNoYWwgU2ltZWsgd3JvdGU6DQo+
IEhpLA0KPiANCj4gT24gNC8xNi8yMSAxOjI1IEFNLCBSb2JlcnQgSGFuY29jayB3cm90ZToNCj4g
PiBIb29rIHVwIHRoZSBzdGFuZGFyZCBHUElPL3BpbmN0cmwtYmFzZWQgcmVjb3Zlcnkgc3VwcG9y
dCBmb3IgdGhpcw0KPiA+IGRyaXZlci4NCj4gPiANCj4gPiBCYXNlZCBvbiBhIHBhdGNoICJpMmM6
IGNhZGVuY2U6IFJlY292ZXIgYnVzIGFmdGVyIGNvbnRyb2xsZXIgcmVzZXQiIGJ5DQo+ID4gQ2hp
cmFnIFBhcmVraCBpbiB0aGUgWGlsaW54IGtlcm5lbCBHaXQgdHJlZSwgYnV0IHNpbXBsaWZpZWQg
dG8gbWFrZSB1c2UNCj4gPiBvZiBtb3JlIGNvbW1vbiBjb2RlLg0KPiA+IA0KPiA+IENjOiBDaGly
YWcgUGFyZWtoIDxjaGlyYWdwQHhpbGlueC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogUm9iZXJ0
IEhhbmNvY2sgPHJvYmVydC5oYW5jb2NrQGNhbGlhbi5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZl
cnMvaTJjL2J1c3Nlcy9pMmMtY2FkZW5jZS5jIHwgNCArKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVz
c2VzL2kyYy1jYWRlbmNlLmMgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLQ0KPiA+IGNhZGVuY2Uu
Yw0KPiA+IGluZGV4IGMxYmJjNGNhZWI1Yy4uZDAxN2JjNjRlNzU5IDEwMDY0NA0KPiA+IC0tLSBh
L2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtY2FkZW5jZS5jDQo+ID4gKysrIGIvZHJpdmVycy9pMmMv
YnVzc2VzL2kyYy1jYWRlbmNlLmMNCj4gPiBAQCAtMTc4LDYgKzE3OCw3IEBAIGVudW0gY2Ruc19p
MmNfc2xhdmVfc3RhdGUgew0KPiA+ICAgKiBAY2xrOgkJUG9pbnRlciB0byBzdHJ1Y3QgY2xrDQo+
ID4gICAqIEBjbGtfcmF0ZV9jaGFuZ2VfbmI6CU5vdGlmaWVyIGJsb2NrIGZvciBjbG9jayByYXRl
IGNoYW5nZXMNCj4gPiAgICogQHF1aXJrczoJCWZsYWcgZm9yIGJyb2tlbiBob2xkIGJpdCB1c2Fn
ZSBpbiByMXAxMA0KPiA+ICsgKiBAcmluZm86CQlTdHJ1Y3R1cmUgaG9sZGluZyByZWNvdmVyeSBp
bmZvcm1hdGlvbi4NCj4gPiAgICogQGN0cmxfcmVnX2RpdmFfZGl2YjogdmFsdWUgb2YgZmllbGRz
IERJVl9BIGFuZCBESVZfQiBmcm9tIENSIHJlZ2lzdGVyDQo+ID4gICAqIEBzbGF2ZToJCVJlZ2lz
dGVyZWQgc2xhdmUgaW5zdGFuY2UuDQo+ID4gICAqIEBkZXZfbW9kZToJCUkyQyBvcGVyYXRpbmcg
cm9sZShtYXN0ZXIvc2xhdmUpLg0KPiA+IEBAIC0yMDIsNiArMjAzLDcgQEAgc3RydWN0IGNkbnNf
aTJjIHsNCj4gPiAgCXN0cnVjdCBjbGsgKmNsazsNCj4gPiAgCXN0cnVjdCBub3RpZmllcl9ibG9j
ayBjbGtfcmF0ZV9jaGFuZ2VfbmI7DQo+ID4gIAl1MzIgcXVpcmtzOw0KPiA+ICsJc3RydWN0IGky
Y19idXNfcmVjb3ZlcnlfaW5mbyByaW5mbzsNCj4gPiAgI2lmIElTX0VOQUJMRUQoQ09ORklHX0ky
Q19TTEFWRSkNCj4gPiAgCXUxNiBjdHJsX3JlZ19kaXZhX2RpdmI7DQo+ID4gIAlzdHJ1Y3QgaTJj
X2NsaWVudCAqc2xhdmU7DQo+ID4gQEAgLTc1Miw2ICs3NTQsNyBAQCBzdGF0aWMgaW50IGNkbnNf
aTJjX3Byb2Nlc3NfbXNnKHN0cnVjdCBjZG5zX2kyYyAqaWQsDQo+ID4gc3RydWN0IGkyY19tc2cg
Km1zZywNCj4gPiAgCS8qIFdhaXQgZm9yIHRoZSBzaWduYWwgb2YgY29tcGxldGlvbiAqLw0KPiA+
ICAJdGltZV9sZWZ0ID0gd2FpdF9mb3JfY29tcGxldGlvbl90aW1lb3V0KCZpZC0+eGZlcl9kb25l
LCBhZGFwLT50aW1lb3V0KTsNCj4gPiAgCWlmICh0aW1lX2xlZnQgPT0gMCkgew0KPiA+ICsJCWky
Y19yZWNvdmVyX2J1cyhhZGFwKTsNCj4gPiAgCQljZG5zX2kyY19tYXN0ZXJfcmVzZXQoYWRhcCk7
DQo+ID4gIAkJZGV2X2VycihpZC0+YWRhcC5kZXYucGFyZW50LA0KPiA+ICAJCQkJInRpbWVvdXQg
d2FpdGluZyBvbiBjb21wbGV0aW9uXG4iKTsNCj4gPiBAQCAtMTIxMiw2ICsxMjE1LDcgQEAgc3Rh
dGljIGludCBjZG5zX2kyY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlDQo+ID4gKnBkZXYp
DQo+ID4gIAlpZC0+YWRhcC5yZXRyaWVzID0gMzsJCS8qIERlZmF1bHQgcmV0cnkgdmFsdWUuICov
DQo+ID4gIAlpZC0+YWRhcC5hbGdvX2RhdGEgPSBpZDsNCj4gPiAgCWlkLT5hZGFwLmRldi5wYXJl
bnQgPSAmcGRldi0+ZGV2Ow0KPiA+ICsJaWQtPmFkYXAuYnVzX3JlY292ZXJ5X2luZm8gPSAmaWQt
PnJpbmZvOw0KPiA+ICAJaW5pdF9jb21wbGV0aW9uKCZpZC0+eGZlcl9kb25lKTsNCj4gPiAgCXNu
cHJpbnRmKGlkLT5hZGFwLm5hbWUsIHNpemVvZihpZC0+YWRhcC5uYW1lKSwNCj4gPiAgCQkgIkNh
ZGVuY2UgSTJDIGF0ICUwOGx4IiwgKHVuc2lnbmVkIGxvbmcpcl9tZW0tPnN0YXJ0KTsNCj4gPiAN
Cj4gDQo+IE15IGNvbGxlYWd1ZSBzZW50IHBpbmN0cmwgZHJpdmVyIGZvciBaeW5xTVAgYWxyZWFk
eS4gVGhpcyBkcml2ZXIgY2FuIGJlDQo+IHVzZWQgb24gWnlucSB3aGVyZSBwaW5jdHJsIGRyaXZl
ciBhbHJlYWR5IGV4aXN0cyB1cHN0cmVhbS4NCj4gDQo+IEl0IGxvb2tzIHF1aXRlIG5pY2UuDQo+
IA0KPiBBY2tlZC1ieTogTWljaGFsIFNpbWVrIDxtaWNoYWwuc2ltZWtAeGlsaW54LmNvbT4NCj4g
DQoNCkFueSBvdGhlciBmZWVkYmFjayBvbiB0aGlzIHBhdGNoPyBJIG9ubHkgc2F3IHRoZSBhY2sg
ZnJvbSBNaWNoYWwuIFRoZSBwaW5jdHJsDQpkcml2ZXIgd2hpY2ggaXMgbmVlZGVkIHRvIG1ha2Ug
dGhpcyB1c2VmdWwgb24gdGhlIFp5bnFNUCBwbGF0Zm9ybSBoYXMgbm93IGJlZW4NCm1lcmdlZCBp
bnRvIG1haW5saW5lIChjb21taXQgOGIyNDJjYTcwMGY4MDQzYmU1NjU0MmVmZDgzNjAwNTYzNThh
NDJlZCwNCiJwaW5jdHJsOiBBZGQgWGlsaW54IFp5bnFNUCBwaW5jdHJsIGRyaXZlciBzdXBwb3J0
IikuDQoNCj4gVGhhbmtzLA0KPiBNaWNoYWwNCi0tIA0KUm9iZXJ0IEhhbmNvY2sNClNlbmlvciBI
YXJkd2FyZSBEZXNpZ25lciwgQ2FsaWFuIEFkdmFuY2VkIFRlY2hub2xvZ2llcw0Kd3d3LmNhbGlh
bi5jb20NCg==

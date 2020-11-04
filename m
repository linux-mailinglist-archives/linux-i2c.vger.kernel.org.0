Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D2E82A6162
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Nov 2020 11:17:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728287AbgKDKRm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Nov 2020 05:17:42 -0500
Received: from mail.vivotek.com ([60.248.39.150]:34998 "EHLO mail.vivotek.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726410AbgKDKRm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 4 Nov 2020 05:17:42 -0500
Received: from pps.filterd (vivotekpps.vivotek.com [127.0.0.1])
        by vivotekpps.vivotek.com (8.16.0.42/8.16.0.42) with SMTP id 0A4AEqtN016487;
        Wed, 4 Nov 2020 18:17:30 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivotek.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=dkim;
 bh=OxCP/q6SKiXzG28NQs4PGiRSEJVVo7+TKVgKwuSTDc4=;
 b=Eu4+rfkU5PJmjmeXYAzwHPQ0z2pSLEk8bTxS8uAvLFal3gh5zkZPuf0WJM/WegIV9/HB
 6YWKdlVvyxOrN1qT6r9R/sfQKyUHNoHXBDTLz5zeJHmTPRsoJS8VX8zRCGI/vf8+YBMP
 uvl+51dSgsKcnEWTEamOSn2uqqk+a6L9V1c= 
Received: from cas01.vivotek.tw ([192.168.0.58])
        by vivotekpps.vivotek.com with ESMTP id 34gtc344wx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Wed, 04 Nov 2020 18:17:30 +0800
Received: from MBS07.vivotek.tw ([fe80::2027:4d67:6c01:78d8]) by
 CAS01.vivotek.tw ([::1]) with mapi id 14.03.0487.000; Wed, 4 Nov 2020
 18:17:29 +0800
From:   <Michael.Wu@vatics.com>
To:     <wsa@kernel.org>
CC:     <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <morgan.chang@vatics.com>
Subject: RE: [PATCH 2/2] i2c: designware: slave should do WRITE_REQUESTED
 before WRITE_RECEIVED
Thread-Topic: [PATCH 2/2] i2c: designware: slave should do WRITE_REQUESTED
 before WRITE_RECEIVED
Thread-Index: AQHWrpNb9HMFwrLvFkOeW57CDSt2oKm2ZmOAgAFYIoA=
Date:   Wed, 4 Nov 2020 10:17:29 +0000
Message-ID: <5DB475451BAA174CB158B5E897FC1525B1295560@MBS07.vivotek.tw>
References: <20201030080420.28016-1-michael.wu@vatics.com>
 <20201030080420.28016-3-michael.wu@vatics.com> <20201103210349.GE1583@kunai>
In-Reply-To: <20201103210349.GE1583@kunai>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.17.134]
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-04_06:2020-11-04,2020-11-04 signatures=0
X-Proofpoint-Spam-Reason: safe
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgV29sZnJhbSwNCg0KPiA+IGRldi0+c3RhdHVzIGNhbiBiZSB1c2VkIHRvIHJlY29yZCB0aGUg
Y3VycmVudCBzdGF0ZSwgZXNwZWNpYWxseSBEZXNpZ253YXJlDQo+ID4gSTJDIGNvbnRyb2xsZXIg
aGFzIG5vIGludGVycnVwdHMgdG8gaWRlbnRpZnkgYSB3cml0ZS1yZXF1ZXN0LiBUaGlzIHBhdGNo
DQo+IA0KPiBKdXN0IGRvdWJsZS1jaGVja2luZzogdGhlIGRlc2lnbndhcmUgSFcgZG9lcyBub3Qg
cmFpc2UgYW4gaW50ZXJydXB0IHdoZW4NCj4gaXRzIG93biBhZGRyZXNzICsgUlcgYml0IGhhcyBi
ZWVuIHJlY2VpdmVkPw0KDQpOb3QgZXhhY3RseS4gVGhlcmUncmUgYW4gaW50ZXJydXB0IHN0YXRl
IG5hbWUgIlJEX1JFUSIgYnV0IG5vIG9uZSBuYW1lZA0KbGlrZSAiV1JfUkVRIi4NCg0KRm9yIHJl
YWQtcmVxdWVzdCwgdGhlIHNsYXZlIHdpbGwgZ2V0IGEgUkRfUkVRIGludGVycnVwdC4gDQpGb3Ig
d3JpdGUtcmVxdWVzdCwgdGhlIHNsYXZlIHdvbid0IGJlIGludGVycnVwdGVkIHVudGlsIGRhdGEg
YXJyaXZlZCB0bw0KdHJpZ2dlciBpbnRlcnJ1cHQgIlJYX0ZVTEwiLg0KDQpJIHRyaWVkIHRvIHVz
ZSBHUElPIHRvIHNpbXVsYXRlIGFuIEkyQyBtYXN0ZXIuIEkgb25seSBzZW50IGl0cyBvd24NCmFk
ZHJlc3MgKyBXIGJpdCB3aXRob3V0IGFueSBkYXRhIGFuZCB0aGVuIEkgZ290IG9ubHkgYSBTVE9Q
X0RFVCBpbnRlcnJ1cHQuDQpJZiBJIHNlbnQgaXRzIG93biBhZGRyZXNzICsgVyBiaXQgKyBvbmUg
Ynl0ZSBkYXRhIGFuZCB0aGVuIEkgZ290IG9uZQ0KUlhfRlVMTCBhbmQgYSBTVE9QX0RFVC4NCg0K
SXQgc2VlbXMgdGhlIGNvbnRyb2xsZXIgZG9lc24ndCBpbnRlcnJ1cHQgd2hlbiBSVyBiaXQgaXMg
VywgYnV0IFIgZG9lcy4NCldoYXQgZG8geW91IHRoaW5rLCBKYXJra28/DQoNClNpbmNlcmVseSwN
Cg0KTWljaGFlbCBXdQ0K

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 242F428DE34
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Oct 2020 11:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728732AbgJNJ71 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Oct 2020 05:59:27 -0400
Received: from mail.vivotek.com ([60.248.39.150]:58824 "EHLO mail.vivotek.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726819AbgJNJ7R (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Oct 2020 05:59:17 -0400
Received: from pps.filterd (vivotekpps.vivotek.com [127.0.0.1])
        by vivotekpps.vivotek.com (8.16.0.42/8.16.0.42) with SMTP id 09E9uik1021664;
        Wed, 14 Oct 2020 17:58:56 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivotek.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=dkim;
 bh=6t584Djr53EQcXcU6K+QSE638Sh/1JOwCPQkAczbV50=;
 b=CsPTuZZ4P12UB8sOdxtDgpGoxlfp+FQYMOxNz8Dj2nCceh0DolRlnR4xlRyL9U82ZEIZ
 KSLAms1U14RiMQkeDTsoRhnFY+kE4pAc/HTqMUexgjppbRA6Bp2vNLAMZGelFjizk/kD
 dGt2Pzx+AowMXanXetgxirpE/FaU8oF7iuI= 
Received: from cas02.vivotek.tw ([192.168.0.59])
        by vivotekpps.vivotek.com with ESMTP id 342yd1auhn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Wed, 14 Oct 2020 17:58:56 +0800
Received: from MBS07.vivotek.tw ([fe80::2027:4d67:6c01:78d8]) by
 CAS02.vivotek.tw ([fe80::157e:3677:ef5b:27a2%11]) with mapi id
 14.03.0487.000; Wed, 14 Oct 2020 17:58:55 +0800
From:   <Michael.Wu@vatics.com>
To:     <andriy.shevchenko@linux.intel.com>, <lkp@intel.com>
CC:     <jarkko.nikula@linux.intel.com>, <mika.westerberg@linux.intel.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kbuild-all@lists.01.org>, <clang-built-linux@googlegroups.com>,
        <morgan.chang@vatics.com>, <dean.hsiao@vatics.com>,
        <paul.chen@vatics.com>
Subject: RE: [PATCH] i2c: designware: fix slave omitted IC_INTR_STOP_DET
Thread-Topic: [PATCH] i2c: designware: fix slave omitted IC_INTR_STOP_DET
Thread-Index: AQHWoeqZ3WHFhjPhe0qk+0HSIl1FPamWMHSAgAAUZoCAAJcqsA==
Date:   Wed, 14 Oct 2020 09:58:54 +0000
Message-ID: <5DB475451BAA174CB158B5E897FC1525B1294238@MBS07.vivotek.tw>
References: <20201014052532.3298-1-michael.wu@vatics.com>
 <202010141551.Y4x2qiN1-lkp@intel.com>
 <20201014085251.GS4077@smile.fi.intel.com>
In-Reply-To: <20201014085251.GS4077@smile.fi.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.17.134]
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-14_06:2020-10-14,2020-10-14 signatures=0
X-Proofpoint-Spam-Reason: safe
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMTAvMTQvMjAgNDo1MyBQTSwgYW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tIHdy
b3RlOg0KPiANCj4gV29uZGVyaW5nIGlmIHlvdSBjb21waWxlIHRoaXMgYXQgYWxsLi4uDQoNCg0K
SSdtIHZlcnkgc29ycnkgdGhhdCBJIGRpZCBub3QgY29tcGlsZSBpdCBiZWNhdXNlIEkgb25seSBo
YXZlIEFSTSBTb0Mgd2l0aCBteQ0KbGludXggNC45LjE3MCwgYnV0IEkndmUgdmVyaWZpZWQgdGhl
IGxvZ2ljIG9mIHRoaXMgcGF0Y2ggaW4gbXkgbGludXguDQoNCkknbGwgY29ycmVjdCB0aGVzZSB0
d28gc3ludGF4IGVycm9ycyBpbiBuZXh0IHZlcnNpb24uIFRoZSByZXBvcnRlZA0Kd2FybmluZ3Mg
b2NjdXJzIGZyb20gZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1kZXNpZ253YXJlLXNsYXZlLmM6MTMg
c2VlbXMNCm5vdCBtYWRlIGJ5IHRoaXMgbW9kaWZpY2F0aW9uLiBQbGVhc2UgY29ycmVjdCBtZSBp
ZiBJJ20gd3JvbmcuLi4uDQoNCj4gPiAgICBpbmNsdWRlL2FzbS1nZW5lcmljL2lvLmg6MTAxNzo1
NTogd2FybmluZzogcGVyZm9ybWluZyBwb2ludGVyDQo+IGFyaXRobWV0aWMgb24gYSBudWxsIHBv
aW50ZXIgaGFzIHVuZGVmaW5lZCBiZWhhdmlvcg0KPiBbLVdudWxsLXBvaW50ZXItYXJpdGhtZXRp
Y10NCj4gPiAgICAgICAgICAgIHJldHVybiAocG9ydCA+IE1NSU9fVVBQRVJfTElNSVQpID8gTlVM
TCA6IFBDSV9JT0JBU0UgKw0KPiBwb3J0Ow0KPiA+DQo+IH5+fn5+fn5+fn4gXg0KPiA+ID4+IGRy
aXZlcnMvaTJjL2J1c3Nlcy9pMmMtZGVzaWdud2FyZS1zbGF2ZS5jOjE4MTo0MjogZXJyb3I6IGV4
cGVjdGVkICc7JyBhZnRlcg0KPiBleHByZXNzaW9uDQo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgZGV2LT5zdGF0dXMgPQ0KPiBTVEFUVVNfV1JJVEVfSU5fUFJPR1JFU1MNCj4gPg0KPiBe
DQo+ID4NCj4gICAgOw0KPiA+ID4+IGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtZGVzaWdud2FyZS1z
bGF2ZS5jOjE5NToyMjogZXJyb3I6IHVzZSBvZg0KPiB1bmRlY2xhcmVkIGlkZW50aWZpZXIgJ1NU
QVRVU19JREVMJw0KPiA+ICAgICAgICAgICAgICAgICAgICBpZiAoZGV2LT5zdGF0dXMgIT0gU1RB
VFVTX0lERUwpIHsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4N
Cj4gPiAgICA3IHdhcm5pbmdzIGFuZCAyIGVycm9ycyBnZW5lcmF0ZWQuDQo+IA0KPiANCj4gDQoN
Cg==

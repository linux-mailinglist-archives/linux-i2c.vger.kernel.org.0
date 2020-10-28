Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56CF929E091
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Oct 2020 02:23:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729911AbgJ2BXE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Oct 2020 21:23:04 -0400
Received: from mail.vivotek.com ([60.248.39.150]:59032 "EHLO mail.vivotek.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729907AbgJ1WEE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 28 Oct 2020 18:04:04 -0400
Received: from pps.filterd (vivotekpps.vivotek.com [127.0.0.1])
        by vivotekpps.vivotek.com (8.16.0.42/8.16.0.42) with SMTP id 09S5NlOi028183;
        Wed, 28 Oct 2020 13:24:26 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivotek.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=dkim;
 bh=XWsKafwoBCMXGPRGJKSVlFm0WD27smvMp+c/m4XjJPU=;
 b=VM4Jak4Cqd64+ksznrNTiMVCTvbSKKYmABWCXqeTfQvkdd55srER9iVx5FpGTu1G3qjd
 JainmNlmKcyQ8CZLoPEWK+jo0D+xkyqzl3W4xh98/oFhHLqOzrdEnwWXh5890V96GatK
 3OUiXzSaaDvFWM8FN+KgLJD25AafDkuWWmA= 
Received: from cas01.vivotek.tw ([192.168.0.58])
        by vivotekpps.vivotek.com with ESMTP id 34c6q13vtv-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Wed, 28 Oct 2020 13:24:26 +0800
Received: from MBS07.vivotek.tw ([fe80::2027:4d67:6c01:78d8]) by
 CAS01.vivotek.tw ([::1]) with mapi id 14.03.0487.000; Wed, 28 Oct 2020
 13:24:20 +0800
From:   <Michael.Wu@vatics.com>
To:     <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <morgan.chang@vatics.com>
Subject: RE: [PATCH v3] i2c: designware: call
 i2c_dw_read_clear_intrbits_slave() once
Thread-Topic: [PATCH v3] i2c: designware: call
 i2c_dw_read_clear_intrbits_slave() once
Thread-Index: AQHWqP8ftBcyz8mHlUeZHq5yT12bhqmkMvSAgAhP5AA=
Date:   Wed, 28 Oct 2020 05:24:18 +0000
Message-ID: <5DB475451BAA174CB158B5E897FC1525B1294F5F@MBS07.vivotek.tw>
References: <20201023054027.13540-1-michael.wu@vatics.com>
 <a44aacbb-fcb4-f83f-b781-b69f52944f09@linux.intel.com>
In-Reply-To: <a44aacbb-fcb4-f83f-b781-b69f52944f09@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.17.134]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-10-28_01:2020-10-26,2020-10-28 signatures=0
X-Proofpoint-Spam-Reason: safe
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGksDQoNCj4gT24gMTAvMjMvMjAgODo0MCBBTSwgTWljaGFlbCBXdSB3cm90ZToNCj4gPiBJZiBz
b21lIGJpdHMgd2VyZSBjbGVhcmVkIGJ5IGkyY19kd19yZWFkX2NsZWFyX2ludHJiaXRzX3NsYXZl
KCkgaW4NCj4gPiBpMmNfZHdfaXNyX3NsYXZlKCkgYW5kIG5vdCBoYW5kbGVkIGltbWVkaWF0ZWx5
LCB0aG9zZSBjbGVhcmVkIGJpdHMgd291bGQNCj4gPiBub3QgYmUgc2hvd24gYWdhaW4gYnkgbGF0
ZXIgaTJjX2R3X3JlYWRfY2xlYXJfaW50cmJpdHNfc2xhdmUoKS4gVGhleQ0KPiA+IHRoZXJlZm9y
ZSB3ZXJlIGZvcmdvdHRlbiB0byBiZSBoYW5kbGVkLg0KPiA+DQo+ID4gaTJjX2R3X3JlYWRfY2xl
YXJfaW50cmJpdHNfc2xhdmUoKSBzaG91bGQgYmUgY2FsbGVkIG9uY2UgaW4gYW4gSVNSIGFuZCB0
YWtlDQo+ID4gaXRzIHJldHVybmVkIHN0YXRlIGZvciBhbGwgbGF0ZXIgaGFuZGxpbmdzLg0KPiA+
IC0tLQ0KPiA+ICAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1kZXNpZ253YXJlLXNsYXZlLmMgfCA3
ICstLS0tLS0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNiBkZWxldGlv
bnMoLSkNCj4gPg0KPiBBY2tlZC1ieTogSmFya2tvIE5pa3VsYSA8amFya2tvLm5pa3VsYUBsaW51
eC5pbnRlbC5jb20+DQoNClRoZXJlIGlzIGFub3RoZXIgbG9naWMgaXNzdWUgYWJvdXQgdGhlIEky
Q19TTEFWRV9XUklURV9SRVFVRVNURUQgcmVwb3J0aW5nLg0KTWF5IEkgZ2l2ZSBwYXRjaGVzIGJh
c2VkIG9uIHRoaXMgY29tbWl0Pw0KDQpNaWNoYWVsIFd1DQo=

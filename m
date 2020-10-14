Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7312A28DF8F
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Oct 2020 13:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727034AbgJNLFW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Oct 2020 07:05:22 -0400
Received: from mail.vivotek.com ([60.248.39.150]:39974 "EHLO mail.vivotek.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725922AbgJNLFW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Oct 2020 07:05:22 -0400
Received: from pps.filterd (vivotekpps.vivotek.com [127.0.0.1])
        by vivotekpps.vivotek.com (8.16.0.42/8.16.0.42) with SMTP id 09EB4vKH021664;
        Wed, 14 Oct 2020 19:05:15 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivotek.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=dkim;
 bh=loiP5p4Z8lVz3NAlPSxdUlH0lFU1MdQmOQMynSrTdYA=;
 b=dk8amPZefGKpp76212ygWr17dYxfzvqGBI8S29iM9CPsLuq0yQ1hBOmu/ia1Yzi+Bsya
 ykZJcAzM8yeFg6EvcNmqDLKqSyqqe0t2QdRRc4XoLiQSbXK1BQN5TxAU0Rhxt0wmtMFt
 y2KmGkCp944xRdtS3V8uDP8WjWpnC09wDxE= 
Received: from cas02.vivotek.tw ([192.168.0.59])
        by vivotekpps.vivotek.com with ESMTP id 342yd1avrw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Wed, 14 Oct 2020 19:05:15 +0800
Received: from MBS07.vivotek.tw ([fe80::2027:4d67:6c01:78d8]) by
 CAS02.vivotek.tw ([fe80::157e:3677:ef5b:27a2%11]) with mapi id
 14.03.0487.000; Wed, 14 Oct 2020 19:05:14 +0800
From:   <Michael.Wu@vatics.com>
To:     <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <morgan.chang@vatics.com>, <dean.hsiao@vatics.com>,
        <paul.chen@vatics.com>
Subject: RE: [PATCH] i2c: designware: fix slave omitted IC_INTR_STOP_DET
Thread-Topic: [PATCH] i2c: designware: fix slave omitted IC_INTR_STOP_DET
Thread-Index: AQHWoeqZ3WHFhjPhe0qk+0HSIl1FPamWY8+AgACIvuA=
Date:   Wed, 14 Oct 2020 11:05:13 +0000
Message-ID: <5DB475451BAA174CB158B5E897FC1525B1294267@MBS07.vivotek.tw>
References: <20201014052532.3298-1-michael.wu@vatics.com>
 <f4ae83cc-b366-71a8-d174-0bb668dc1992@linux.intel.com>
In-Reply-To: <f4ae83cc-b366-71a8-d174-0bb668dc1992@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.17.134]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-14_07:2020-10-14,2020-10-14 signatures=0
X-Proofpoint-Spam-Reason: safe
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMTAvMTQvMjAgNjo1MyBQTSwgamFya2tvLm5pa3VsYUBsaW51eC5pbnRlbC5jb20gd3JvdGU6
DQo+IFRoYW5rcyBmb3IgdGhlIHBhdGNoLiBJIHdhcyB0aGlua2luZyB0aGlzIHRvbyBhZnRlciB5
b3VyIHJlcG9ydCBidXQNCj4gaGF2ZW4ndCBmb3VuZCBhY3R1YWxseSB0aW1lIHRvIGxvb2sgYXQg
aW1wbGVtZW50aW5nIGl0Lg0KPiANCj4gQnV0IHdoYXQgSSB3YXMgdGhpbmtpbmcgaXQgaXMgcHJv
YmFibHkgZ29vZCB0byBoYXZlIHR3byBwYXRjaGVzLiBGaXJzdA0KPiBwYXRjaCB0aGF0IGNoYW5n
ZXMgb25seSBpMmNfZHdfcmVhZF9jbGVhcl9pbnRyYml0c19zbGF2ZSgpIHNlbWFudGljcyBzbw0K
PiB0aGF0IGl0J3MgY2FsbGVkIG9ubHkgb25jZSBsaWtlIGhlcmUgYW5kIHNlY29uZCBwYXRjaCB0
aGF0IGRvZXMgb3RoZXINCj4gbG9naWMgY2hhbmdlcy4gTWFrZXMgZWFzaWVyIHRvIGNhdGNoIHBv
c3NpYmxlIHJlZ3Jlc3Npb25zIEkgdGhpbmsuDQo+IA0KPiBKYXJra28NCg0KSSBjYW4ndCBhZ3Jl
ZSB3aXRoIHlvdSBtb3JlLg0KSSdsbCBzZXBhcmF0ZSB0aGVtIGludG8gdHdvIHBhdGNoZXMgaW4g
bmV4dCB2ZXJzaW9uLg0KDQpCeSB0aGUgd2F5LCBJIGZvdW5kIGEgd2F5IHRvIGNvbXBpbGUgbXkg
cGF0Y2ggYnkgbXlzZWxmIHZpYQ0KCSJtYWtlIG11bHRpX3Y3X2RlZmNvbmZpZyINCmFuZA0KCSJt
YWtlIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtZGVzaWdud2FyZS1zbGF2ZS5vIi4NCg0KSSd2ZSBk
b25lIGFuZCB0aGVyZSB3ZXJlIG5vIHdhcm5pbmdzIGFib3V0DQpkcml2ZXJzL2kyYy9idXNzZXMv
aTJjLWRlc2lnbndhcmUtc2xhdmUuYzoxMy4NCi0tDQpNaWNoYWVsIFd1DQo=

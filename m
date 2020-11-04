Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBBCC2A628E
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Nov 2020 11:52:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729262AbgKDKvs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Nov 2020 05:51:48 -0500
Received: from mail.vivotek.com ([60.248.39.150]:39592 "EHLO mail.vivotek.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729250AbgKDKvs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 4 Nov 2020 05:51:48 -0500
Received: from pps.filterd (vivotekpps.vivotek.com [127.0.0.1])
        by vivotekpps.vivotek.com (8.16.0.42/8.16.0.42) with SMTP id 0A4AnefU031984;
        Wed, 4 Nov 2020 18:51:36 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivotek.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=dkim;
 bh=n17L+VgwUlZONlxnSTqJHNnmc6rjWo7kZxEP07PWD9g=;
 b=DuetMlwGjSBihTI82u39rINBVUZ6qOZDOa+jzh1yxG+xdYhYwtHVk9ionPUnJNfAiqI2
 1sWTENmRUKJEx8ym6TsG1WZT5EpKr2MTWNA50Wts7aimZxt1j1Dv6KDekoThie5m076O
 WpmMSi7/lBZV3wB4+/aqxIlBZ8H+JQUl4aQ= 
Received: from cas01.vivotek.tw ([192.168.0.58])
        by vivotekpps.vivotek.com with ESMTP id 34gtc345p6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Wed, 04 Nov 2020 18:51:36 +0800
Received: from MBS07.vivotek.tw ([fe80::2027:4d67:6c01:78d8]) by
 CAS01.vivotek.tw ([::1]) with mapi id 14.03.0487.000; Wed, 4 Nov 2020
 18:51:35 +0800
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
Thread-Index: AQHWrpNb9HMFwrLvFkOeW57CDSt2oKm2ZmOAgAFYIoD//4qogIAAh8cg
Date:   Wed, 4 Nov 2020 10:51:34 +0000
Message-ID: <5DB475451BAA174CB158B5E897FC1525B129558A@MBS07.vivotek.tw>
References: <20201030080420.28016-1-michael.wu@vatics.com>
 <20201030080420.28016-3-michael.wu@vatics.com> <20201103210349.GE1583@kunai>
 <5DB475451BAA174CB158B5E897FC1525B1295560@MBS07.vivotek.tw>
 <20201104103531.GA3984@ninjato>
In-Reply-To: <20201104103531.GA3984@ninjato>
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

SGkgV29sZnJhbSwNCg0KPiBUaGFua3MgZm9yIHRoZSBkZXRhaWxlZCBleHBsYW5hdGlvbiEgT2th
eSwgdGhlbiB3aGF0IHlvdSBkbyBsb29rcw0KPiBjb3JyZWN0IHRvIG1lIChmcm9tIGEgaGlnaCBs
ZXZlbCBwZXJzcGVjdGl2ZSB3aXRob3V0IHJlYWxseSBrbm93aW5nIHRoZQ0KPiBIVyk6IHdoZW4g
UlggaXMgZnVsbCwgeW91IGZpcnN0IHNlbmQgdGhlIHN0YXRlIFdSSVRFX1JFUVVFU1RFRCB3aGVu
DQo+IHRoZXJlIGlzIG5vIG90aGVyIHRyYW5zZmVyIG9uLWdvaW5nLiBUaGVuIHlvdSBzZW5kIFdS
SVRFX1JFQ0VJVkVEDQo+IGltbWVkaWF0ZWx5LiBJIHRoaW5rIHRoaXMgaXMgdGhlIHdheSB0byBk
byBpdC4NCg0KQmluZ28hISBUaGFua3MgZm9yIHlvdXIgdW5kZXJzdGFuZGluZy4NCg0KSSB0aGlu
ayBJIHNob3VsZCBoYXZlIGEgaGFiaXQgb2Ygd3JpdGluZyBjb21tZW50cy4uLiBYLVANCg0KQmVz
dCByZWdhcmRzLA0KTWljaGFlbCBXdQ0K

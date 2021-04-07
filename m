Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE92B356BDF
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Apr 2021 14:15:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236844AbhDGMPY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Apr 2021 08:15:24 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:49568 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S234694AbhDGMPY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Apr 2021 08:15:24 -0400
X-UUID: 76db66f58fca43c1b72df7c1144820e4-20210407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=sEGKramWmw81gXjpxPU0aY6E3PRKyWdBkq9b+DFD3b4=;
        b=CCPEYSp/BR6OOtOq3NzPo/MsXLx0DFHEGQ/p1vtrD9VPl5bfG0TXtLOunekvqLjO+1VTfYwbL+F9OGvVCUGDFlHQQLzBWTq+b5Pw3gAO4m+7LAJneZRrlO4gbU7EN74QTBgl+SBh64PMQK+uMYGAVZoZUbM92esq7J+X2rZRu88=;
X-UUID: 76db66f58fca43c1b72df7c1144820e4-20210407
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1799540063; Wed, 07 Apr 2021 20:15:11 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 7 Apr
 2021 20:15:07 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 7 Apr 2021 20:15:06 +0800
Message-ID: <1617797706.32076.1.camel@mhfsdcap03>
Subject: Re: [RESEND] i2c: mediatek: Get device clock-stretch time via dts
From:   Qii Wang <qii.wang@mediatek.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>
Date:   Wed, 7 Apr 2021 20:15:06 +0800
In-Reply-To: <20210406194856.GF3122@kunai>
References: <1615622664-15032-1-git-send-email-qii.wang@mediatek.com>
         <20210406194856.GF3122@kunai>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4B9A90AB75786AB472DAB22F2EC572602C5BF8B0252F9FE5E8EC257F3838AAC72000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gVHVlLCAyMDIxLTA0LTA2IGF0IDIxOjQ4ICswMjAwLCBXb2xmcmFtIFNhbmcgd3JvdGU6DQo+
IE9uIFNhdCwgTWFyIDEzLCAyMDIxIGF0IDA0OjA0OjI0UE0gKzA4MDAsIHFpaS53YW5nQG1lZGlh
dGVrLmNvbSB3cm90ZToNCj4gPiBGcm9tOiBRaWkgV2FuZyA8cWlpLndhbmdAbWVkaWF0ZWsuY29t
Pg0KPiA+IA0KPiA+IHRTVSxTVEEvdEhELFNUQS90U1UsU1RPUCBtYXliZSBvdXQgb2Ygc3BlYyBk
dWUgdG8gZGV2aWNlDQo+ID4gY2xvY2stc3RyZXRjaGluZyBvciBjaXJjdWl0IGxvc3MsIHdlIGNv
dWxkIGdldCBkZXZpY2UNCj4gPiBjbG9jay1zdHJldGNoIHRpbWUgZnJvbSBkdHMgdG8gYWRqdXN0
IHRoZXNlIHBhcmFtZXRlcnMNCj4gPiB0byBtZWV0IHRoZSBzcGVjIHZpYSBFWFRfQ09ORiByZWdp
c3Rlci4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBRaWkgV2FuZyA8cWlpLndhbmdAbWVkaWF0
ZWsuY29tPg0KPiANCj4gSSB0cmllZCB0byB1bmRlcnN0YW5kIGZyb20gdGhlIGNvZGUgd2hhdCB0
aGUgbmV3IGJpbmRpbmcgZXhwcmVzc2VzLCBidXQNCj4gSSBkb24ndCBmdWxseSB1bmRlcnN0YW5k
IGl0LiBJcyBpdCB0aGUgbWF4aW11bSBjbG9jayBzdHJldGNoIHRpbWU/DQo+IEJlY2F1c2UgSSBj
YW5ub3QgcmVjYWxsIGEgZGV2aWNlIHdoaWNoIGFsd2F5cyB1c2VzIHRoZSBzYW1lIGRlbGF5IGZv
cg0KPiBjbG9jayBzdHJldGNoaW5nLg0KPiANCg0KRHVlIHRvIGNsb2NrIHN0cmV0Y2gsIG91ciBI
VyBJUCBjYW5ub3QgbWVldCB0aGUgYWMtdGltaW5nDQpzcGVjKHRTVTtTVEEsdFNVO1NUTykuIA0K
VGhlcmUgaXNuJ3QgYSBzYW1lIGRlbGF5IGZvciBjbG9jayBzdHJldGNoaW5nLCBzbyB3ZSBuZWVk
IHBhc3MgYQ0KcGFyYW1ldGVyIHdoaWNoIGNhbiBiZSBmb3VuZCB0aHJvdWdoIG1lYXN1cmVtZW50
IHRvIG1lZXQgbW9zdA0KY29uZGl0aW9ucy4NCg0K


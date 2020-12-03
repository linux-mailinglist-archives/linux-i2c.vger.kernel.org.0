Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31C6A2CCB9C
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Dec 2020 02:26:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbgLCB0Y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 20:26:24 -0500
Received: from mailgw02.mediatek.com ([1.203.163.81]:41493 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725959AbgLCB0Y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Dec 2020 20:26:24 -0500
X-UUID: 76da3a98ce544379bee8a7dbf8cbb144-20201203
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=wK0zfo0dPiyFhQQJ4nzywTR+uMF2OgABw+6Iks5D4mQ=;
        b=CFPToLL0sZWBqroEFBvBnu3C1xB7f2YEQK55TLcFtzT7OOtnD6Umvp1NElNmQh4fAxnaxQnr4oMlgAj8q34YCcJw4kweQzVfP9D/Tn3EfyTYaGS5Vy2/6wxwsPb4bBoyrOE8l/7SZ/ki9l/IJoR2HY2NIsKdWFOxa1AzGA0kXts=;
X-UUID: 76da3a98ce544379bee8a7dbf8cbb144-20201203
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1208836293; Thu, 03 Dec 2020 09:25:37 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 3 Dec
 2020 09:25:36 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 3 Dec 2020 09:25:35 +0800
Message-ID: <1606958735.25719.29.camel@mhfsdcap03>
Subject: Re: [v2] i2c: mediatek: Move suspend and resume handling to NOIRQ
 phase
From:   Qii Wang <qii.wang@mediatek.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>
Date:   Thu, 3 Dec 2020 09:25:35 +0800
In-Reply-To: <20201202153543.GG874@kunai>
References: <1605701861-30800-1-git-send-email-qii.wang@mediatek.com>
         <20201202153543.GG874@kunai>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4EFEE1FEB07A9BE4BDA81639A3A3E1E0EC21718CFC0395F146C8E8461D7B11C22000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gV2VkLCAyMDIwLTEyLTAyIGF0IDE2OjM1ICswMTAwLCBXb2xmcmFtIFNhbmcgd3JvdGU6DQo+
IEhpLA0KPiANCj4gPiBTb21lIGkyYyBkZXZpY2UgZHJpdmVyIGluZGlyZWN0bHkgdXNlcyBJMkMg
ZHJpdmVyIHdoZW4gaXQgaXMgbm93DQo+ID4gYmVpbmcgc3VzcGVuZGVkLiBUaGUgaTJjIGRldmlj
ZXMgZHJpdmVyIGlzIHN1c3BlbmRlZCBkdXJpbmcgdGhlDQo+ID4gTk9JUlEgcGhhc2UgYW5kIHRo
aXMgY2Fubm90IGJlIGNoYW5nZWQgZHVlIHRvIG90aGVyIGRlcGVuZGVuY2llcy4NCj4gPiBUaGVy
ZWZvcmUsIHdlIGFsc28gbmVlZCB0byBtb3ZlIHRoZSBzdXNwZW5kIGhhbmRsaW5nIGZvciB0aGUg
STJDDQo+ID4gY29udHJvbGxlciBkcml2ZXIgdG8gdGhlIE5PSVJRIHBoYXNlIGFzIHdlbGwuDQo+
ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogUWlpIFdhbmcgPHFpaS53YW5nQG1lZGlhdGVrLmNvbT4N
Cj4gDQo+IElzIHRoaXMgYSBidWdmaXggYW5kIHNob3VsZCBnbyBpbnRvIDUuMTA/IE9yIGNhbiBp
dCB3YWl0IGZvciA1LjExPw0KPiANCg0KWWVzLCBDYW4geW91IGhlbHAgdG8gYXBwbHkgaXQgaW50
byA1LjEwPyBUaGFua3MNCg0KPiBUaGFua3MsDQo+IA0KPiAgICBXb2xmcmFtDQo+IA0KDQo=


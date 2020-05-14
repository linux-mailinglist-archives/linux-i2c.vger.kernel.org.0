Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC5DD1D2C5C
	for <lists+linux-i2c@lfdr.de>; Thu, 14 May 2020 12:18:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726056AbgENKSU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 May 2020 06:18:20 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:44342 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725925AbgENKSU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 May 2020 06:18:20 -0400
X-UUID: 5a096f9fd5d644c9aaa6bd81669e159e-20200514
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=ZbYU37rZb9gDHueAY0VNcPPMOrExOy8uaF8KayG70pE=;
        b=ZoCYwPuK1C8e1QD8AiOA8wnAf7SqWCSYGquSwe9toJj8xFkqosCfhW3+Y6XdLITH5unhxQVV63XGSOjU2LF6Xa/UK9Bqn6NulHAQQJ5Q+VP7pTUT4pOX9jzfPS/Mk+j4eQPb8ex0k7J90HnimIu1NswbUVGlfchuBjFhjDcpU0c=;
X-UUID: 5a096f9fd5d644c9aaa6bd81669e159e-20200514
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 654279106; Thu, 14 May 2020 18:18:17 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs07n2.mediatek.inc
 (172.21.101.141) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 14 May
 2020 18:18:13 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 14 May 2020 18:18:11 +0800
Message-ID: <1589451415.25512.14.camel@mhfsdcap03>
Subject: Re: [PATCH] i2c: mediatek: Add i2c ac-timing adjust support
From:   Qii Wang <qii.wang@mediatek.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Date:   Thu, 14 May 2020 18:16:55 +0800
In-Reply-To: <20200514062951.GA1145@kunai>
References: <1585223676-30809-1-git-send-email-qii.wang@mediatek.com>
         <20200512133852.GE13516@ninjato> <1589418905.25512.10.camel@mhfsdcap03>
         <20200514062951.GA1145@kunai>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gVGh1LCAyMDIwLTA1LTE0IGF0IDA4OjI5ICswMjAwLCBXb2xmcmFtIFNhbmcgd3JvdGU6DQo+
ID4gPiBMYXN0IHF1ZXN0aW9uOiBZb3Ugc2VlbSB0byBiZSB0aGUgb25lIGRvaW5nIG1ham9yIHVw
ZGF0ZXMgdG8gdGhpcw0KPiA+ID4gZHJpdmVyLiBUaGFua3MgZm9yIHRoYXQhIEFyZSB5b3UgbWF5
YmUgaW50ZXJlc3RlZCBpbiBiZWNvbWluZyB0aGUNCj4gPiA+IG1haW50YWluZXIgZm9yIHRoaXMg
ZHJpdmVyPyBJIHRoaW5rIHRoZXJlIHdvbid0IGJlIG11Y2ggcGF0Y2hlcyB0bw0KPiA+ID4gcmV2
aWV3IGFuZCByZXBvcnRzIHRvIGhhbmRsZSBidXQgaXQgd2lsbCBzcGVlZCB1cCBwcm9jZXNzaW5n
IGZvciBtZS4NCj4gPiANCj4gPiBZZXMsIEl0IGlzIG15IGhvbm9yIHRvIGJlIHRoZSBtYWludGFp
bmVyIGZvciB0aGlzIGRyaXZlci4NCj4gDQo+IEF3ZXNvbWUhIDopIENhbiB5b3UgcHJlcGFyZSBh
IHBhdGNoIGZvciBNQUlOVEFJTkVSUyBvciBzaGFsbCBJPw0KPiANCg0Kb2ssIEkgd2lsbCBzZW5k
IHdpdGggdGhpcyBwYXRjaC4NCg==


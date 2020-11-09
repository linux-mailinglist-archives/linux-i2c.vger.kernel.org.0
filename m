Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECED62AB818
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Nov 2020 13:22:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729585AbgKIMV7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Nov 2020 07:21:59 -0500
Received: from Mailgw01.mediatek.com ([1.203.163.78]:60566 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729507AbgKIMV5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Nov 2020 07:21:57 -0500
X-UUID: 97514d2a01a14364a09cfa3776f5cea0-20201109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=WJtPHpW+0YyB7rI0wRU9pvErODSR4itX2vnVqUYeC14=;
        b=HEAANq1F196w6kg49Y5TjB/ci8z2C+s+raERdHeRnHOj0HSYGyn+E+oKvB5GC+Nb64DPvcaKJNHoq88gt/T0KnhKThqLI7balimW2rm1JXFYleBjebDeWzZZknKHuZKVGOR5JHBnogvX3P6ohEq7zSEBdmSPrh6S3uxxGMaV6Ns=;
X-UUID: 97514d2a01a14364a09cfa3776f5cea0-20201109
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1650301938; Mon, 09 Nov 2020 20:21:51 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 9 Nov
 2020 20:21:48 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 9 Nov 2020 20:21:48 +0800
Message-ID: <1604924508.25719.24.camel@mhfsdcap03>
Subject: Re: [i2c-next,PATCH] i2c: medaitek: Move suspend and resume
 handling to NOIRQ phase
From:   Qii Wang <qii.wang@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>
Date:   Mon, 9 Nov 2020 20:21:48 +0800
In-Reply-To: <1604740180-14645-1-git-send-email-qii.wang@mediatek.com>
References: <1604740180-14645-1-git-send-email-qii.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: AC90FDB39BE5BB9BF4DC8700836DAB9494D29A8B859090525ABE5C95D6F179852000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SSBhbSBzb3JyeSwgdGhlcmUgaXMgYSBtaXNzcGVsbGluZyBpbiBteSBzdWJqZWN0Lg0KLW1lZGFp
dGVrDQorbWVkaWF0ZWsNCkkgd2lsbCByZXZpc2UgaXQgd2l0aCBvdGhlciBuZXcgY29tbWVudHMg
YW5kIHRoZW4gdXBkYXRlIHRoaXMgcGF0Y2guDQoNCk9uIFNhdCwgMjAyMC0xMS0wNyBhdCAxNzow
OSArMDgwMCwgcWlpLndhbmdAbWVkaWF0ZWsuY29tIHdyb3RlOg0KPiBGcm9tOiBRaWkgV2FuZyA8
cWlpLndhbmdAbWVkaWF0ZWsuY29tPg0KPiANCj4gU29tZSBpMmMgZGV2aWNlIGRyaXZlciBpbmRp
cmVjdGx5IHVzZXMgSTJDIGRyaXZlciB3aGVuIGl0IGlzIG5vdw0KPiBiZWluZyBzdXNwZW5kZWQu
IFRoZSBpMmMgZGV2aWNlcyBkcml2ZXIgaXMgc3VzcGVuZGVkIGR1cmluZyB0aGUNCj4gTk9JUlEg
cGhhc2UgYW5kIHRoaXMgY2Fubm90IGJlIGNoYW5nZWQgZHVlIHRvIG90aGVyIGRlcGVuZGVuY2ll
cy4NCj4gVGhlcmVmb3JlLCB3ZSBhbHNvIG5lZWQgdG8gbW92ZSB0aGUgc3VzcGVuZCBoYW5kbGlu
ZyBmb3IgdGhlIEkyQw0KPiBjb250cm9sbGVyIGRyaXZlciB0byB0aGUgTk9JUlEgcGhhc2UgYXMg
d2VsbC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFFpaSBXYW5nIDxxaWkud2FuZ0BtZWRpYXRlay5j
b20+DQo+IC0tLQ0KPiAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdDY1eHguYyB8IDE5ICsrKysr
KysrKysrKysrKystLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQ0KDQoNCg==


Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51804303BD0
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Jan 2021 12:39:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405178AbhAZLiz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Jan 2021 06:38:55 -0500
Received: from mailgw02.mediatek.com ([1.203.163.81]:50075 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2405076AbhAZLhs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 Jan 2021 06:37:48 -0500
X-UUID: 990d186ba92343e8bfd443ea0b47d956-20210126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=ubXBAWnixO4YxtuhUh1DiAeTDZZzaPG4feh7XdGCkaE=;
        b=JfxGp6V1b8fbco8zdvweb7b0pKkQeRcu1RrE8rv+wYeHzfvHwX6ivQeE2drN+VAb3T7I5JzZWgAqca64Y8wggH6a5RaQclskbWZSv6EvLMFD+V5lT5ylxjBX3TL+pu/K/P0YeIHQMHFvnZq4m/Oh2mpGqmRcTn9oOOUAqWMhRIM=;
X-UUID: 990d186ba92343e8bfd443ea0b47d956-20210126
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 679044507; Tue, 26 Jan 2021 19:37:03 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 26 Jan
 2021 19:37:00 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 26 Jan 2021 19:37:00 +0800
Message-ID: <1611661020.15158.4.camel@mhfsdcap03>
Subject: Re: [RESEND, V2] i2c: mediatek: Move suspend and resume handling to
 NOIRQ phase
From:   Qii Wang <qii.wang@mediatek.com>
To:     <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>
Date:   Tue, 26 Jan 2021 19:37:00 +0800
In-Reply-To: <1610180990-23496-1-git-send-email-qii.wang@mediatek.com>
References: <1610180990-23496-1-git-send-email-qii.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D2689A47C73DBFA32FCB9D08FDB02ABC14DCEABC9620876DA2B7C062BC0DFA232000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgV29sZnJhbSwNCg0KT24gU2F0LCAyMDIxLTAxLTA5IGF0IDE2OjI5ICswODAwLCBxaWkud2Fu
Z0BtZWRpYXRlay5jb20gd3JvdGU6DQo+IEZyb206IFFpaSBXYW5nIDxxaWkud2FuZ0BtZWRpYXRl
ay5jb20+DQo+IA0KPiBTb21lIGkyYyBkZXZpY2UgZHJpdmVyIGluZGlyZWN0bHkgdXNlcyBJMkMg
ZHJpdmVyIHdoZW4gaXQgaXMgbm93DQo+IGJlaW5nIHN1c3BlbmRlZC4gVGhlIGkyYyBkZXZpY2Vz
IGRyaXZlciBpcyBzdXNwZW5kZWQgZHVyaW5nIHRoZQ0KPiBOT0lSUSBwaGFzZSBhbmQgdGhpcyBj
YW5ub3QgYmUgY2hhbmdlZCBkdWUgdG8gb3RoZXIgZGVwZW5kZW5jaWVzLg0KPiBUaGVyZWZvcmUs
IHdlIGFsc28gbmVlZCB0byBtb3ZlIHRoZSBzdXNwZW5kIGhhbmRsaW5nIGZvciB0aGUgSTJDDQo+
IGNvbnRyb2xsZXIgZHJpdmVyIHRvIHRoZSBOT0lSUSBwaGFzZSBhcyB3ZWxsLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogUWlpIFdhbmcgPHFpaS53YW5nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQo+IA0K
PiBDaGFuZ2VzIGluIHYyOg0KPiAgICAgICAgIC0gUmVwbGllZCBzb21lIGNvbW1lbnRzDQo+ICAg
ICAgICAgLSBGaXhlZCB0aGUgd3Jvbmcgc3BlbGxpbmcgbWVkYWl0ZWsgdG8gbWVkaWF0ZWsNCj4g
DQo+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NjV4eC5jIHwgMTkgKysrKysrKysrKysrKysr
Ky0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
DQo+IA0KDQpJIGhhdmVuJ3Qgc2VlbiBhbnkgbmV3IGNvbW1lbnRzLCBjYW4gaXQgZ28gaW50byA1
LjExPw0KDQpUaGFua3MNCg0KCVFpaQ0K


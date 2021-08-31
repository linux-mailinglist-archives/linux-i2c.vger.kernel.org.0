Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E823F3FC263
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Aug 2021 08:05:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239564AbhHaF7E (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Aug 2021 01:59:04 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:58762 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S239555AbhHaF7A (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Aug 2021 01:59:00 -0400
X-UUID: 02da1c849b2246a58eb5ddbe7842bead-20210831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=kKtk8AQex3i9l4tfgwM0zqINIAMrPpVdsHsMQ+zbYOQ=;
        b=tX9Uf21uR9Nsv0iFjr5uilVaX7IG1pFgC9L1TAITZ18VxeCe28857jhD/wmq+U8727KYW01144edEBrCExmA0fd7agG0Xsr36eYh+rsU5jxBEtO74YP6HkXRFD41EvqjxMmdZuD9azjHAkwzpBhYJevRiJG6DtTKYkWFLQnV2bA=;
X-UUID: 02da1c849b2246a58eb5ddbe7842bead-20210831
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1241138892; Tue, 31 Aug 2021 13:57:58 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 Aug 2021 13:57:57 +0800
Received: from [10.17.3.153] (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 31 Aug 2021 13:57:56 +0800
Message-ID: <1630389476.11251.3.camel@mhfsdcap03>
Subject: Re: [PATCH v6 1/7] i2c: mediatek: fixing the incorrect register
 offset
From:   Qii Wang <qii.wang@mediatek.com>
To:     Kewei Xu <kewei.xu@mediatek.com>
CC:     <wsa@the-dreams.de>, <matthias.bgg@gmail.com>,
        <robh+dt@kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <liguo.zhang@mediatek.com>, <caiyu.chen@mediatek.com>,
        <ot_daolong.zhu@mediatek.com>, <yuhan.wei@mediatek.com>
Date:   Tue, 31 Aug 2021 13:57:56 +0800
In-Reply-To: <1630147859-17031-2-git-send-email-kewei.xu@mediatek.com>
References: <1630147859-17031-1-git-send-email-kewei.xu@mediatek.com>
         <1630147859-17031-2-git-send-email-kewei.xu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gU2F0LCAyMDIxLTA4LTI4IGF0IDE4OjUwICswODAwLCBLZXdlaSBYdSB3cm90ZToNCj4gVGhl
IHJlYXNvbiBmb3IgdGhlIG1vZGlmaWNhdGlvbiBoZXJlIGlzIHRoYXQgdGhlIHByZXZpb3VzDQo+
IG9mZnNldCBpbmZvcm1hdGlvbiBpcyBpbmNvcnJlY3QsIE9GRlNFVF9ERUJVR1NUQVQgPSAweEU0
IGlzDQo+IHRoZSBjb3JyZWN0IHZhbHVlLg0KPiANCj4gRml4ZXM6IDI1NzA4Mjc4ZjgxMCAoImky
YzogbWVkaWF0ZWs6IEFkZCBpMmMgc3VwcG9ydCBmb3IgTWVkaWFUZWsgTVQ4MTgzIikNCj4gU2ln
bmVkLW9mZi1ieTogS2V3ZWkgWHUgPGtld2VpLnh1QG1lZGlhdGVrLmNvbT4NCj4gUmV2aWV3ZWQt
Ynk6IENoZW4tWXUgVHNhaSA8d2Vuc3RAY2hyb21pdW0ub3JnPg0KPiAtLS0NCj4gIGRyaXZlcnMv
aTJjL2J1c3Nlcy9pMmMtbXQ2NXh4LmMgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQoNClJldmlld2VkLWJ5OiBRaWkgV2FuZyA8cWlp
LndhbmdAbWVkaWF0ZWsuY29tPg0KDQoNCg0K


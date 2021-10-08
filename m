Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E39442648B
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Oct 2021 08:19:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230011AbhJHGVP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Oct 2021 02:21:15 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:37330 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229654AbhJHGVO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Oct 2021 02:21:14 -0400
X-UUID: 991e0cb2b94c4b64b1361b7e31c0ba4f-20211008
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=DXaYlcXovTi8AVzeCqHB6o3jCTRK2bXcD3iWckAtv/E=;
        b=FFXNRkuW2sVUU64o/3ccYTYeEgQVly/HNW/PlfPmgPDAi51jX3BxSGIhLiwCJx9oaHf5/zQDS5I/OqbUbK1DcoSjHGiSwPcNssnVm9u4RrP4JEZL7fdKHlKgg9xeSxI8TwLdye5x+Lfo1gYZadb2yFuIeQxMfZJ7ZQHcVYyciCI=;
X-UUID: 991e0cb2b94c4b64b1361b7e31c0ba4f-20211008
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
        (envelope-from <kewei.xu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 114358499; Fri, 08 Oct 2021 14:19:16 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 8 Oct 2021 14:19:15 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Oct 2021 14:19:14 +0800
Message-ID: <72d26b0622538bdfda4e64519d34088e8c21656a.camel@mediatek.com>
Subject: Re: [PATCH v7 2/7] i2c: mediatek: Reset the handshake signal
 between i2c and dma
From:   Kewei Xu <kewei.xu@mediatek.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>, <liguo.zhang@mediatek.com>,
        <caiyu.chen@mediatek.com>, <ot_daolong.zhu@mediatek.com>,
        <yuhan.wei@mediatek.com>
Date:   Fri, 8 Oct 2021 14:19:17 +0800
In-Reply-To: <YVf8jQPHoQtbCfth@kunai>
References: <20210917101416.20760-1-kewei.xu@mediatek.com>
         <20210917101416.20760-3-kewei.xu@mediatek.com> <YVf8jQPHoQtbCfth@kunai>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gU2F0LCAyMDIxLTEwLTAyIGF0IDA4OjMwICswMjAwLCBXb2xmcmFtIFNhbmcgd3JvdGU6DQo+
ID4gKyNkZWZpbmUgSTJDX0NMUl9ERUJVR0NUUgkJMHgwMDAwDQo+IA0KPiBIbW0sIEkgZG9uJ3Qg
dGhpbmsgdGhhdCBhIG1hY3JvIHRvIGNsZWFyIGEgcmVnaXN0ZXIgaGVscHMNCj4gcmVhZGFiaWxp
dHkuLi4NCj4gDQo+ID4gKwkJbXRrX2kyY193cml0ZXcoaTJjLCBJMkNfQ0xSX0RFQlVHQ1RSLA0K
PiA+IE9GRlNFVF9ERUJVR0NUUkwpOw0KPiANCj4gLi4NCj4gDQo+ICArCQltdGtfaTJjX3dyaXRl
dyhpMmMsIDAsIE9GRlNFVF9ERUJVR0NUUkwpOw0KPiANCj4gbG9va3MgZ29vZCB0byBtZS4gQW55
aG93LCBpdCBpcyBub3QgYSBiaWcgaXNzdWUuIExldCBtZSBrbm93IGlmIHlvdQ0KPiB3YW50DQo+
IHRvIGNoYW5nZSBpdCBvciBrZWVwIGl0Lg0KPiANCk9LLCBJIHdpbGwgdXNlIDB4MDAgaW5zdGVh
ZCBvZiBtYWNybyBvbiBWOCB2ZXJzaW9uLFRoYW5rcy4NCg0K


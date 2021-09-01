Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27D043FD6C3
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Sep 2021 11:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243593AbhIAJbW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Sep 2021 05:31:22 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:49210 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S242467AbhIAJbV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Sep 2021 05:31:21 -0400
X-UUID: 784632d0a4e74f0293e348cc97810f7a-20210901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=3H7PGSjS1HZq3ytiXyBDn6JR2baQSPIgF5JrLTFj+do=;
        b=ecwU46dF94rgaDgWXB+ndRpDYLTqjs1Em1wlw3G5uoLMLrMuobui7qyMNocATePw+yacbogwgkk4JK5Qds5gyRhtCxte3y96M8av/IWXIhuDWj8SV0sdvGfLlfbzvQ12DjKOTPuAKztDrxg8BVv6wCLcKuu7WjcRkuycYW17RFw=;
X-UUID: 784632d0a4e74f0293e348cc97810f7a-20210901
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 979383038; Wed, 01 Sep 2021 17:30:20 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Sep 2021 17:30:19 +0800
Received: from [10.17.3.153] (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Sep 2021 17:30:18 +0800
Message-ID: <1630488618.11251.4.camel@mhfsdcap03>
Subject: Re: [PATCH v6 2/7] i2c: mediatek: Reset the handshake signal
 between i2c and dma
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
Date:   Wed, 1 Sep 2021 17:30:18 +0800
In-Reply-To: <1630147859-17031-3-git-send-email-kewei.xu@mediatek.com>
References: <1630147859-17031-1-git-send-email-kewei.xu@mediatek.com>
         <1630147859-17031-3-git-send-email-kewei.xu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gU2F0LCAyMDIxLTA4LTI4IGF0IDE4OjUwICswODAwLCBLZXdlaSBYdSB3cm90ZToNCj4gRHVl
IHRvIGNoYW5nZXMgaW4gdGhlIGhhcmR3YXJlIGRlc2lnbiBvZiB0aGUgaGFuZHNoYWtpbmcgc2ln
bmFsDQo+IGJldHdlZW4gaTJjIGFuZCBkbWEsIGl0IGlzIG5lY2Vzc2FyeSB0byByZXNldCB0aGUg
aGFuZHNoYWtpbmcNCj4gc2lnbmFsIGJlZm9yZSBlYWNoIHRyYW5zZmVyIHRvIGVuc3VyZSB0aGF0
IHRoZSBtdWx0aS1tc2dzIGNhbg0KPiBiZSB0cmFuc2ZlcnJlZCBjb3JyZWN0bHkuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBLZXdlaSBYdSA8a2V3ZWkueHVAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCj4g
IGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXQ2NXh4LmMgfCAyNiArKysrKysrKysrKysrKysrKysr
KysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKykNCj4gDQoNClJldmll
d2VkLWJ5OiBRaWkgV2FuZyA8cWlpLndhbmdAbWVkaWF0ZWsuY29tPg0KDQo=


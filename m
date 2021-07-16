Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A763A3CB50F
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jul 2021 11:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230206AbhGPJMz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Jul 2021 05:12:55 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:7184 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229833AbhGPJMz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Jul 2021 05:12:55 -0400
X-UUID: 291337223e924d32bd2189da47e923e9-20210716
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=QJPe5Hrz+Ccs/oSD8OMTuwsvU24MenG6++k0YmRyOu8=;
        b=Z3rjG5ldCmvdR8xfndgP6uRnNJbkrypCkbactu6nJBQF8RUV4Ty76s4qO1KzzIiGGKEWvS1Xa6Har3zJYrfDgjaTJYGhh4KFq4LszK7exkwyiY4yCDik3FnWnM+jRhni+9L9ZQC8/VemurAsAPsqKOvqpHJiQKNcewmRjUsj8nE=;
X-UUID: 291337223e924d32bd2189da47e923e9-20210716
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <kewei.xu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 2134326001; Fri, 16 Jul 2021 17:09:56 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 16 Jul
 2021 17:09:52 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 16 Jul 2021 17:09:52 +0800
Message-ID: <1626426592.29703.2.camel@mhfsdcap03>
Subject: Re: [PATCH 3/8] i2c: mediatek: fixing the incorrect register offset
From:   Kewei Xu <kewei.xu@mediatek.com>
To:     Chen-Yu Tsai <wenst@chromium.org>
CC:     <wsa@the-dreams.de>, Matthias Brugger <matthias.bgg@gmail.com>,
        "Rob Herring" <robh+dt@kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        <leilk.liu@mediatek.com>, <qii.wang@mediatek.com>,
        <qiangming.xia@mediatek.com>, <ot_daolong.zhu@mediatek.com>
Date:   Fri, 16 Jul 2021 17:09:52 +0800
In-Reply-To: <CAGXv+5EOkBvxyigPF8vgnYXfF5Qz472aonPzB-Yw0n=XQU+03g@mail.gmail.com>
References: <1626316157-24935-1-git-send-email-kewei.xu@mediatek.com>
         <1626316157-24935-4-git-send-email-kewei.xu@mediatek.com>
         <CAGXv+5EOkBvxyigPF8vgnYXfF5Qz472aonPzB-Yw0n=XQU+03g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FC0D5B6CA3B4A06A7DB943822C655303E4E0D63BA706CBC4E3367977457C91722000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gVGh1LCAyMDIxLTA3LTE1IGF0IDEzOjIzICswODAwLCBDaGVuLVl1IFRzYWkgd3JvdGU6DQo+
IEhpLA0KPiANCj4gT24gVGh1LCBKdWwgMTUsIDIwMjEgYXQgMTA6MzEgQU0gS2V3ZWkgWHUgPGtl
d2VpLnh1QG1lZGlhdGVrLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBUaGUgcmVhc29uIGZvciB0aGUg
bW9kaWZpY2F0aW9uIGhlcmUgaXMgdGhhdCB0aGUgcHJldmlvdXMNCj4gPiBvZmZzZXQgaW5mb3Jt
YXRpb24gaXMgaW5jb3JyZWN0LCBPRkZTRVRfREVCVUdTVEFUID0gMHhFNCBpcw0KPiA+IHRoZSBj
b3JyZWN0IHZhbHVlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogS2V3ZWkgWHUgPGtld2VpLnh1
QG1lZGlhdGVrLmNvbT4NCj4gDQo+IFRoaXMgbmVlZHMgYSBmaXhlcyB0YWc6DQo+IA0KPiBGaXhl
czogMjU3MDgyNzhmODEwICgiaTJjOiBtZWRpYXRlazogQWRkIGkyYyBzdXBwb3J0IGZvciBNZWRp
YVRlayBNVDgxODMiKQ0KPiANCj4gT3RoZXJ3aXNlLA0KPiANCj4gUmV2aWV3ZWQtYnk6IENoZW4t
WXUgVHNhaSA8d2Vuc3RAY2hyb21pdW0ub3JnPg0KDQpIaSBDaGVuLVl1LA0KDQpPSywgSSB3aWxs
IHJlc3VibWl0IGEgcGF0Y2ggdG8gYWRkIGEgZml4ZXMgdGFnLg0KDQp0aGFua3MNCktld2VpDQo=


Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4232E3B71E5
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jun 2021 14:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233400AbhF2MPa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Jun 2021 08:15:30 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:49507 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S233384AbhF2MP3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Jun 2021 08:15:29 -0400
X-UUID: 1808bfb60d774362bc069ba1ed953987-20210629
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=4SbG1vndPjwBWteOUa61pelj+E3Mh/QyjRjIiC1LL3s=;
        b=kt4DZhFF3c3qEU+rHgUIkRCJ65aiuh9VZPAoBNm0UUHyEc+i9i4qh8107WVX5qavw/gN1w3KZ4XG/XKmEEyr+s5FaRuJiZX8yfeLuny12Bf61yqxQjpk8sJ+pFDV2Mem95Lfi/jUiN5WXQm/YUlI8nEUSOeEq1u8ls5smIZxl4o=;
X-UUID: 1808bfb60d774362bc069ba1ed953987-20210629
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <kewei.xu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1263429074; Tue, 29 Jun 2021 20:12:57 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 29 Jun
 2021 20:12:48 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Jun 2021 20:12:47 +0800
Message-ID: <1624968767.5647.2.camel@mhfsdcap03>
Subject: Re: [PATCH 2/3] i2c: mediatek: Dump i2c/dma register when a timeout
 occurs
From:   Kewei Xu <kewei.xu@mediatek.com>
To:     Tzung-Bi Shih <tzungbi@google.com>
CC:     Matthias Brugger <matthias.bgg@gmail.com>, <wsa@the-dreams.de>,
        <robh+dt@kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>, <qiangming.xia@mediatek.com>,
        <liguo.zhang@mediatek.com>
Date:   Tue, 29 Jun 2021 20:12:47 +0800
In-Reply-To: <CA+Px+wU8qqEDU+bV0QpoJssNOxebutzRGgHo6WpC9VFJwckKKQ@mail.gmail.com>
References: <1623122200-1896-1-git-send-email-kewei.xu@mediatek.com>
         <1623122200-1896-3-git-send-email-kewei.xu@mediatek.com>
         <54301510-e0d5-0762-1979-b194b8fd5eb8@gmail.com>
         <1623206624.14050.10.camel@mhfsdcap03>
         <CA+Px+wU8qqEDU+bV0QpoJssNOxebutzRGgHo6WpC9VFJwckKKQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 99D115C5B010B0D7F3D44B52D5ED0835CC3A0712A95D069472FE4D2D1B8632C52000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gVHVlLCAyMDIxLTA2LTI5IGF0IDEyOjE5ICswODAwLCBUenVuZy1CaSBTaGloIHdyb3RlOg0K
PiBPbiBXZWQsIEp1biA5LCAyMDIxIGF0IDEwOjQ0IEFNIEtld2VpIFh1IDxrZXdlaS54dUBtZWRp
YXRlay5jb20+IHdyb3RlOg0KPiA+DQo+ID4gT24gVHVlLCAyMDIxLTA2LTA4IGF0IDE2OjAxICsw
MjAwLCBNYXR0aGlhcyBCcnVnZ2VyIHdyb3RlOg0KPiA+ID4gSXMgdGhpcyBvZmZzZXQgb25seSBm
b3IgbXQ4MTkyIG9yIGFsc28gZm9yIG10ODE4Mz8NCj4gPiA+IEluIGFueSBjYXNlIHRoYXQgc2hv
dWxkIGdvIGluIGFzIGFub3RoZXIgcGF0Y2guIEVpdGhlciBhIGZpeCBvciBhIG5ldw0KPiA+ID4g
bXRfaTJjX3JlZ3NfdjNbXQ0KPiA+DQo+ID4gVGhpcyBvZmZzZXQgdmFsdWUgaXMgc3VpdGFibGUg
Zm9yIHRoZSBJQyBvZiBtdF9pMmNfcmVnc192MiBoYXJkd2FyZQ0KPiA+IGRlc2lnbiBzaW1pbGFy
IHRvIG10ODE5Mi84MTk1LCBub3QgZm9yIDgxODMuDQo+ID4NCj4gPiBUaGUgcmVhc29uIGZvciB0
aGUgbW9kaWZpY2F0aW9uIGhlcmUgaXMgdGhhdCB0aGUgcHJldmlvdXMNCj4gPiBvZmZzZXQgaW5m
b3JtYXRpb24gaXMgaW5jb3JyZWN0LCBPRkZTRVRfREVCVUdTVEFUID0gMFhFNCBpcw0KPiA+IHRo
ZSBjb3JyZWN0IHZhbHVlLg0KPiANCj4gUGxlYXNlIHN1Ym1pdCBhbm90aGVyIHBhdGNoIGZvciBm
aXhpbmcgdGhlIGluY29ycmVjdCB2YWx1ZS4NCg0KT2theSwgSSB3aWxsIHJlc3VibWl0IGEgcGF0
Y2ggdG8gZml4aW5nIHRoZSBpbmNvcnJlY3QgdmFsdWUsVGhhbmtzLg0KDQo=


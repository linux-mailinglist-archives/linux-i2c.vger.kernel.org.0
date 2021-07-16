Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC5C53CB57E
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jul 2021 11:54:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231386AbhGPJ5A (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Jul 2021 05:57:00 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:12000 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230360AbhGPJ5A (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Jul 2021 05:57:00 -0400
X-UUID: 55162037efd240dcbc606e145f7512df-20210716
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=phqCD4LJR0pNpBe3FK03xbs4bsxYpn9hSfS9hoyXs+k=;
        b=YTvmwYpHJUgH8Gjq3kCIA2uZD3b3ML+6Wwyu2kyXUAXulPxEZWEMPOXTKN2XIMBgFfQxMGfwgiLdE3Lu1hWEB7T5fxkZHjOIgBIi7Is4eVPMA1Y/6kgNr/zWftzXvfUqV4aNhPgV7AAjf4H+qLDRHhCjPj8K13mIfBFKpYLkxYk=;
X-UUID: 55162037efd240dcbc606e145f7512df-20210716
Received: from mtkmrs31.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <kewei.xu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1896142837; Fri, 16 Jul 2021 17:54:00 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 16 Jul
 2021 17:53:57 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 16 Jul 2021 17:53:57 +0800
Message-ID: <1626429237.29703.16.camel@mhfsdcap03>
Subject: Re: [PATCH 8/8] i2c: mediatek: modify bus speed calculation formula
From:   Kewei Xu <kewei.xu@mediatek.com>
To:     Tzung-Bi Shih <tzungbi@google.com>
CC:     <wsa@the-dreams.de>, <matthias.bgg@gmail.com>,
        <robh+dt@kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
        <qii.wang@mediatek.com>, <qiangming.xia@mediatek.com>,
        <ot_daolong.zhu@mediatek.com>
Date:   Fri, 16 Jul 2021 17:53:57 +0800
In-Reply-To: <CA+Px+wWNcSkxvsEoUrgBN73+jhq8qjFJodYjQnY1zW2d0a5yRA@mail.gmail.com>
References: <1626316157-24935-1-git-send-email-kewei.xu@mediatek.com>
         <1626316157-24935-9-git-send-email-kewei.xu@mediatek.com>
         <CA+Px+wWNcSkxvsEoUrgBN73+jhq8qjFJodYjQnY1zW2d0a5yRA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6F46C422B3AC89BA8EF99B33069B7310E2E578E2D00ADFD2BE96F0D5623221F82000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gVGh1LCAyMDIxLTA3LTE1IGF0IDE1OjA5ICswODAwLCBUenVuZy1CaSBTaGloIHdyb3RlOg0K
PiBPbiBUaHUsIEp1bCAxNSwgMjAyMSBhdCAxMDozMiBBTSBLZXdlaSBYdSA8a2V3ZWkueHVAbWVk
aWF0ZWsuY29tPiB3cm90ZToNCj4gPiBXaGVuIGNsb2NrLWRpdiBpcyAwIG9yIGdyZWF0ZXIgdGhh
biAxLCB0aGUgYnVzIHNwZWVkDQo+ID4gY2FsY3VsYXRlZCBieSB0aGUgb2xkIHNwZWVkIGNhbGN1
bGF0aW9uIGZvcm11bGEgd2lsbCBiZQ0KPiA+IGxhcmdlciB0aGFuIHRoZSB0YXJnZXQgc3BlZWQu
IFNvIHdlIHVwZGF0ZSB0aGUgZm9ybXVsYS4NCj4gVGhlIHBhdGNoIHNvdW5kcyBsaWtlIGEgZml4
IHVwLiAgTmVlZCBhICJGaXhlcyIgdGFnLg0KPiANCj4gPiAgICAgICAgIGZvciAoY2xrX2RpdiA9
IDE7IGNsa19kaXYgPD0gbWF4X2Nsa19kaXY7IGNsa19kaXYrKykgew0KPiA+ICAgICAgICAgICAg
ICAgICBjbGtfc3JjID0gcGFyZW50X2NsayAvIGNsa19kaXY7DQo+ID4gKyAgICAgICAgICAgICAg
IGkyYy0+YWNfdGltaW5nLmludGVyX2Nsa19kaXYgPSBjbGtfZGl2IC0gMTsNCj4gVXNpbmcgdGhl
IHdheSB0byBwYXNzIHRoZSBwYXJhbWV0ZXIgImludGVyX2Nsa19kaXYiIHRvDQo+IG10a19pMmNf
Y2FsY3VsYXRlX3NwZWVkKCkgbG9va3MgbGlrZSBhIGhhY2suICBpbnRlcl9jbGtfZGl2IGlzIHNl
dA0KPiBhZ2FpblsxXSBuZXh0IHRvIHRoZSBmb3IgbG9vcC4NCj4gDQo+IFsxXTogaHR0cHM6Ly9l
bGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMTQtcmMxL3NvdXJjZS9kcml2ZXJzL2kyYy9idXNz
ZXMvaTJjLW10NjV4eC5jI0w4MzENCj4gDQo+IA0KPiANCj4gSSBoYXZlIG5vIGRvbWFpbiBrbm93
bGVkZ2Ugb2Ygd2hhdC9ob3cgdGhlIHBhdGNoIGZpeGVzLiAgQnV0IGlmIHRoaXMNCj4gaXMgYSBz
dGFuZGFsb25lIGZpeHVwIHBhdGNoLCBzdWdnZXN0IHNlcGFyYXRpbmcgdG8gYW4gaW5kZXBlbmRl
bnQNCj4gcGF0Y2guDQoNCkhpIFR6dW5nLUJpLA0KDQoxLiBUaGlzIFBhdGNoIGlzIG5vdCBmb3Ig
Zml4aW5nIHByZXZpb3VzIGNvbW1pdCxpdCBpcyBqdXN0IGZvciB0aGUgYmFkDQpzcGVlZCBmb3Jt
dWxhLg0KDQoyLiBJIHdpbGwgZml4IHRoaXMgcHJvYmxlbSBhY2NvcmRpbmcgdG8geW91ciBzdWdn
ZXN0aW9uIGluIHRoZSBuZXh0DQpwYXRjaC4NCg0KVGhhbmtzDQpLZXdlaQ0K


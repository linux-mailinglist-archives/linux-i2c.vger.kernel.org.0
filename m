Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94E0A2EA5ED
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Jan 2021 08:26:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbhAEHZv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Jan 2021 02:25:51 -0500
Received: from Mailgw01.mediatek.com ([1.203.163.78]:12449 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725855AbhAEHZv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Jan 2021 02:25:51 -0500
X-UUID: 00b9807406e44507a71142604aa08bf2-20210105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=iNJ8pMFepiraeDCLGRX8PhqklWQesO7XeNlg6qJmjj0=;
        b=lH+5NPmAaoiplE2yO8HyiAHykaEhlZuVh9S7hkDfCq/Fduj4jBzKmaMy9qQB9IQCFiH0xj2BaR+HbpvY+l68jV/HWCWDrpjCDsV7e3UiFU0YVi0aBO5dxjvL2MuBf0NTPEnep5tWlzGNFZ9z2Ml30moMH0ZdQdwWhrrTTB7umTk=;
X-UUID: 00b9807406e44507a71142604aa08bf2-20210105
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 136633279; Tue, 05 Jan 2021 15:25:01 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 5 Jan
 2021 15:24:57 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 5 Jan 2021 15:24:56 +0800
Message-ID: <1609831496.23685.7.camel@mhfsdcap03>
Subject: Re: i2c: mediatek: Fix apdma and i2c hand-shake timeout
From:   Qii Wang <qii.wang@mediatek.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>
Date:   Tue, 5 Jan 2021 15:24:56 +0800
In-Reply-To: <20210104183202.GD935@ninjato>
References: <1608812767-3254-1-git-send-email-qii.wang@mediatek.com>
         <20210104182959.GC935@ninjato> <20210104183202.GD935@ninjato>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8622BB2201912994D94D12F5823443A0F8E2910C300CEAE4236ECE2AE31BE4892000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gTW9uLCAyMDIxLTAxLTA0IGF0IDE5OjMyICswMTAwLCBXb2xmcmFtIFNhbmcgd3JvdGU6DQo+
IE9uIE1vbiwgSmFuIDA0LCAyMDIxIGF0IDA3OjI5OjU5UE0gKzAxMDAsIFdvbGZyYW0gU2FuZyB3
cm90ZToNCj4gPiBPbiBUaHUsIERlYyAyNCwgMjAyMCBhdCAwODoyNjowN1BNICswODAwLCBxaWku
d2FuZ0BtZWRpYXRlay5jb20gd3JvdGU6DQo+ID4gPiBGcm9tOiBRaWkgV2FuZyA8cWlpLndhbmdA
bWVkaWF0ZWsuY29tPg0KPiA+ID4gDQo+ID4gPiBXaXRoIHRoZSBhcGRtYSByZW1vdmUgaGFuZC1z
aGFrZSBzaWduYWwsIGl0IHJlcXVpcnMgc3BlY2lhbA0KPiA+ID4gb3BlcmF0aW9uIHRpbWluZyB0
byByZXNldCBpMmMgbWFudWFsbHksIG90aGVyd2lzZSB0aGUgaW50ZXJydXB0DQo+ID4gPiB3aWxs
IG5vdCBiZSB0cmlnZ2VyZWQsIGkyYyB0cmFuc21pc3Npb24gd2lsbCBiZSB0aW1lb3V0Lg0KPiA+
ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBRaWkgV2FuZyA8cWlpLndhbmdAbWVkaWF0ZWsuY29t
Pg0KPiA+IA0KPiA+IEFwcGxpZWQgdG8gZm9yLWN1cnJlbnQsIHRoYW5rcyENCj4gDQo+IEFueSBG
aXhlczotVGFnIHdlIGNvdWxkIGFkZD8NCj4gDQoNCkNvdWxkIHlvdSBoZWxwIG1lIGFkZDoNCglG
aXhlczogODQyNmZlNzBjZmE0KCJpMmM6IG1lZGlhdGVrOiBBZGQgYXBkbWEgc3luYyBpbiBpMmMg
ZHJpdmVyIikNClRoYW5rcw0K


Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DA06298552
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Oct 2020 02:31:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1421146AbgJZBbi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 25 Oct 2020 21:31:38 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:45896 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1421144AbgJZBbi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 25 Oct 2020 21:31:38 -0400
X-UUID: d813a77c2ec0400499b3d8f1a6b5064f-20201026
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=vVvfkbUAMLnEGPVp22orf6GiMNv3USdQoc6xNCO1YfM=;
        b=HC7eHEWqrJsZ2BjdniBzyPPGb/8uJ0nKKMfyeF3N/czBIvUUbF1Q3QBT8Htn0m4jpYIo5SZWx/vxIlAzfRUHqmIGcIetQhp1365VUGo+7HfsD18qI2uhSZ233af+zxNO9fb0Xhdaqo82JnCBGmaRjJFvxsJFtnfjM4waUrVQNr0=;
X-UUID: d813a77c2ec0400499b3d8f1a6b5064f-20201026
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 785108375; Mon, 26 Oct 2020 09:31:33 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 26 Oct
 2020 09:31:26 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 26 Oct 2020 09:31:26 +0800
Message-ID: <1603675886.25719.15.camel@mhfsdcap03>
Subject: Re: [PATCH] i2c: mediatek: remove redundant null check
From:   Qii Wang <qii.wang@mediatek.com>
To:     Xu Wang <vulab@iscas.ac.cn>
CC:     <Leilk.Liu@mediatek.com>, <matthias.bgg@gmail.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date:   Mon, 26 Oct 2020 09:31:26 +0800
In-Reply-To: <20200930084233.53085-1-vulab@iscas.ac.cn>
References: <20200930084233.53085-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: C5F9B31DFEC0D8FA081D2D8373472B423FFF94D55D1C916320D7C9D4142E35FF2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

VGhhbmtzLCBpdCBsb29rcyBnb29kIGZvciBtZSwgaXQgd291bGQgYmUgYmV0dGVyIHRvIHJlbW92
ZSBhbGwgdXNlbGVzcw0KbWVtYmVycw0KDQpPbiBXZWQsIDIwMjAtMDktMzAgYXQgMDg6NDIgKzAw
MDAsIFh1IFdhbmcgd3JvdGU6DQo+IEJlY2F1c2UgY2xrX2Rpc2FibGVfdW5wcmVwYXJlIGFscmVh
ZHkgY2hlY2tlZCBOVUxMIGNsb2NrIHBhcmFtZXRlciwNCj4gc28gdGhlIGFkZGl0aW9uYWwgY2hl
Y2tzIGFyZSB1bm5lY2Vzc2FyeSwganVzdCByZW1vdmUgaXQNCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IFh1IFdhbmcgPHZ1bGFiQGlzY2FzLmFjLmNuPg0KPiAtLS0NCj4gIGRyaXZlcnMvaTJjL2J1c3Nl
cy9pMmMtbXQ2NXh4LmMgfCA5ICsrKy0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9i
dXNzZXMvaTJjLW10NjV4eC5jIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdDY1eHguYw0KPiBp
bmRleCAwY2JkZmJlNjA1YjUuLjQ4ZDM3ZGU4MjdlMSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9p
MmMvYnVzc2VzL2kyYy1tdDY1eHguYw0KPiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10
NjV4eC5jDQo+IEBAIC00NDksOCArNDQ5LDcgQEAgc3RhdGljIGludCBtdGtfaTJjX2Nsb2NrX2Vu
YWJsZShzdHJ1Y3QgbXRrX2kyYyAqaTJjKQ0KPiAgCXJldHVybiAwOw0KPiAgDQo+ICBlcnJfYXJi
Og0KPiAtCWlmIChpMmMtPmhhdmVfcG1pYykNCj4gLQkJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGky
Yy0+Y2xrX3BtaWMpOw0KPiArCWNsa19kaXNhYmxlX3VucHJlcGFyZShpMmMtPmNsa19wbWljKTsN
Cj4gIGVycl9wbWljOg0KPiAgCWNsa19kaXNhYmxlX3VucHJlcGFyZShpMmMtPmNsa19tYWluKTsN
Cj4gIGVycl9tYWluOg0KPiBAQCAtNDYxLDExICs0NjAsOSBAQCBzdGF0aWMgaW50IG10a19pMmNf
Y2xvY2tfZW5hYmxlKHN0cnVjdCBtdGtfaTJjICppMmMpDQo+ICANCj4gIHN0YXRpYyB2b2lkIG10
a19pMmNfY2xvY2tfZGlzYWJsZShzdHJ1Y3QgbXRrX2kyYyAqaTJjKQ0KPiAgew0KPiAtCWlmIChp
MmMtPmNsa19hcmIpDQo+IC0JCWNsa19kaXNhYmxlX3VucHJlcGFyZShpMmMtPmNsa19hcmIpOw0K
PiArCWNsa19kaXNhYmxlX3VucHJlcGFyZShpMmMtPmNsa19hcmIpOw0KPiAgDQo+IC0JaWYgKGky
Yy0+aGF2ZV9wbWljKQ0KPiAtCQljbGtfZGlzYWJsZV91bnByZXBhcmUoaTJjLT5jbGtfcG1pYyk7
DQo+ICsJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGkyYy0+Y2xrX3BtaWMpOw0KPiAgDQo+ICAJY2xr
X2Rpc2FibGVfdW5wcmVwYXJlKGkyYy0+Y2xrX21haW4pOw0KPiAgCWNsa19kaXNhYmxlX3VucHJl
cGFyZShpMmMtPmNsa19kbWEpOw0KDQo=


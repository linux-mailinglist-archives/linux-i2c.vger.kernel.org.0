Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9636D35D25E
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Apr 2021 23:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243945AbhDLVJd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Apr 2021 17:09:33 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:38145 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244274AbhDLVJ0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Apr 2021 17:09:26 -0400
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id C04E4891AE;
        Tue, 13 Apr 2021 09:09:03 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1618261743;
        bh=LD/6f2tvm/F2O9bhr6TZiDc0gSD+3rtfedYS7iWSrsg=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=Yu0tNGKX1nM9kQIqpwOps3k4puZNGkzRxfUU6uxxd7LrKd9uG1ZuOiRdGyMajATFb
         IYsgHCgvJNikJRi0QkDwC0c+UJwlXiw1/PSDxf4peScCuAH/GL3VvW08HP9gvsgxVm
         wMmUx1qDm32VzV6U1P7s1i9etuqyP6TbqOmLQqKNcGWVO+fkElZy5+mIdJOgx6lOph
         JnkE15nkSTI04ZmV6Yyw6EBpTv5tPkiwEXNtxM62bXOM7MHPlGtKYAY4t7YMuqpDeN
         +zibV/fGf+KzmCEUDFeR/YxqSm7IlggOlAllsS1Y6Mi06yIafLcpoajN+f9dYAQOIh
         zWlbovYBLPheQ==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B6074b6ef0001>; Tue, 13 Apr 2021 09:09:03 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 13 Apr 2021 09:09:02 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.012; Tue, 13 Apr 2021 09:09:02 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Wei Yongjun <weiyongjun1@huawei.com>, Wolfram Sang <wsa@kernel.org>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "Hulk Robot" <hulkci@huawei.com>
Subject: Re: [PATCH -next] i2c: mpc: drop release for resource allocated with
 devm_*
Thread-Topic: [PATCH -next] i2c: mpc: drop release for resource allocated with
 devm_*
Thread-Index: AQHXL7ObhQQxaGDPA0yl+VE3IF/D8qqwl44A
Date:   Mon, 12 Apr 2021 21:09:02 +0000
Message-ID: <8a14bef8-2c38-cd1d-ad33-6c37030cdd04@alliedtelesis.co.nz>
References: <20210412160026.194423-1-weiyongjun1@huawei.com>
In-Reply-To: <20210412160026.194423-1-weiyongjun1@huawei.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <6DA7AE79CE70F5418A61B43EE4FB84D0@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=GfppYjfL c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=3YhXtTcJ-WEA:10 a=i0EeH86SAAAA:8 a=sZwN78S90g8iCWLGYWoA:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpPbiAxMy8wNC8yMSA0OjAwIGFtLCBXZWkgWW9uZ2p1biB3cm90ZToNCj4gSXQncyBub3QgbmVj
ZXNzYXJ5IHRvIHJlbGVhc2UgcmVzb3VyY2Ugd2hpY2ggYWxsb2NhdGVkIHdpdGggZGV2bV8qDQo+
IGFuZCB0aG9zZSByZWxlYXNlIG1heSBsZWFkcyB0byBhIGRvdWJsZSBmcmVlLiBBbmQgYWxzbyBy
ZW1vdmUgdXNlbGVzcw0KPiBpcnFfZGlzcG9zZV9tYXBwaW5nKCkgY2FsbCBzaW5jZSBtYXBwaW5n
IG5vdCBjcmVhdGVkLg0KPg0KPiBGaXhlczogMDlhYWI3YWRkN2JmICgiaTJjOiBtcGM6IHVzZSBk
ZXZpY2UgbWFuYWdlZCBBUElzIikNCj4gUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBo
dWF3ZWkuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBXZWkgWW9uZ2p1biA8d2VpeW9uZ2p1bjFAaHVh
d2VpLmNvbT4NCg0KVGhhbmtzIGZvciB0aGUgZml4Lg0KDQpSZXZpZXdlZC1ieTogQ2hyaXMgUGFj
a2hhbSA8Y2hyaXMucGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNvLm56Pg0KDQo+IC0tLQ0KPiAgIGRy
aXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXBjLmMgfCA2IC0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCA2IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2ky
Yy1tcGMuYyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXBjLmMNCj4gaW5kZXggNDZjZGIzNmUy
ZjliLi42ZTU2MTRhY2ViYWMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMt
bXBjLmMNCj4gKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tcGMuYw0KPiBAQCAtNzU5LDEy
ICs3NTksNiBAQCBzdGF0aWMgaW50IGZzbF9pMmNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKm9wKQ0KPiAgIAlpZiAoaTJjLT5jbGtfcGVyKQ0KPiAgIAkJY2xrX2Rpc2FibGVfdW5wcmVw
YXJlKGkyYy0+Y2xrX3Blcik7DQo+ICAgDQo+IC0JaWYgKGkyYy0+aXJxKQ0KPiAtCQlmcmVlX2ly
cShpMmMtPmlycSwgaTJjKTsNCj4gLQ0KPiAtCWlycV9kaXNwb3NlX21hcHBpbmcoaTJjLT5pcnEp
Ow0KPiAtCWlvdW5tYXAoaTJjLT5iYXNlKTsNCj4gLQlrZnJlZShpMmMpOw0KPiAgIAlyZXR1cm4g
MDsNCj4gICB9Ow0KPiAgIA0KPg==

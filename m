Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69B651E2297
	for <lists+linux-i2c@lfdr.de>; Tue, 26 May 2020 15:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728513AbgEZNAt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 May 2020 09:00:49 -0400
Received: from spam.zju.edu.cn ([61.164.42.155]:8198 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726325AbgEZNAt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 26 May 2020 09:00:49 -0400
Received: by ajax-webmail-mail-app3 (Coremail) ; Tue, 26 May 2020 21:00:23
 +0800 (GMT+08:00)
X-Originating-IP: [222.205.78.173]
Date:   Tue, 26 May 2020 21:00:23 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   dinghao.liu@zju.edu.cn
To:     "Alain Volmat" <alain.volmat@st.com>
Cc:     kjlu@umn.edu, "Pierre-Yves MORDRET" <pierre-yves.mordret@st.com>,
        "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
        "Alexandre Torgue" <alexandre.torgue@st.com>,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] i2c: stm32f7: Fix runtime PM imbalance in
 stm32f7_i2c_reg_slave
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190906(84e8bf8f)
 Copyright (c) 2002-2020 www.mailtech.cn zju.edu.cn
In-Reply-To: <20200526083400.GC10725@gnbcxd0016.gnb.st.com>
References: <20200521070507.13015-1-dinghao.liu@zju.edu.cn>
 <20200526083400.GC10725@gnbcxd0016.gnb.st.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <7548c995.d205f.1725111d7c4.Coremail.dinghao.liu@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cC_KCgDnX0PnEs1eVcoKAA--.2911W
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgYMBlZdtOUN1wABsP
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJTRUUUbXIS07vEb7Iv0x
        C_Cr1lV2xY67kC6x804xWlV2xY67CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DMIAI
        bVAFxVCF77xC64kEw24lV2xY67C26IkvcIIF6IxKo4kEV4ylV2xY628lY4IE4IxF12IF4w
        CS07vE84x0c7CEj48ve4kI8wCS07vE84ACjcxK6xIIjxv20xvE14v26w1j6s0DMIAIbVA2
        z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIAIbVA2z4x0Y4vEx4A2jsIE14v26r
        xl6s0DMIAIbVA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1lV2xY62AIxVAIcxkEcVAq
        07x20xvEncxIr21lV2xY6c02F40EFcxC0VAKzVAqx4xG6I80ewCS07vEYx0E2Ix0cI8IcV
        AFwI0_Jr0_Jr4lV2xY6cIj6I8E87Iv67AKxVWUJVW8JwCS07vEOx8S6xCaFVCjc4AY6r1j
        6r4UMIAIbVCjxxvEw4WlV2xY6xkIecxEwVAFwVW5GwCS07vEc2IjII80xcxEwVAKI48JMI
        AIbVCF04k20xvE74AGY7Cv6cx26r4fKr1UJr1lV2xY6xCjnVCjjxCrMIAIbVCFx2IqxVCF
        s4IE7xkEbVWUJVW8JwCS07vEx2IqxVAqx4xG67AKxVWUJVWUGwCS07vEx2IqxVCjr7xvwV
        AFwI0_JrI_JrWlV2xY6I8E67AF67kF1VAFwI0_Jw0_GFylV2xY6IIF0xvE2Ix0cI8IcVAF
        wI0_Jr0_JF4lV2xY6IIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCS07vEIxAIcVCF04
        k26cxKx2IYs7xG6rW3Jr0E3s1lV2xY6IIF0xvEx4A2jsIE14v26r1j6r4UMIAIbVCI42IY
        6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73U
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Cj4gT3ZlcmFsbCwgdGhlcmUgYXJlIHNldmVyYWwgb3RoZXIgY2FsbHMgdG8gcG1fcnVudGltZV9n
ZXRfc3luYyB3aXRoaW4gdGhpcwo+IGRyaXZlciwgd291bGQgeW91IGxpa2UgdG8gZml4IHRoZW0g
YWxsIGF0IG9uY2UgPwo+IAoKU3VyZSwgSSB3aWxsIHNlbmQgYSBuZXcgcGF0Y2ggdG8gbWVyZ2Ug
dGhlbSBhbGwuCgo+IE9uIFRodSwgTWF5IDIxLCAyMDIwIGF0IDAzOjA1OjA3UE0gKzA4MDAsIERp
bmdoYW8gTGl1IHdyb3RlOgo+ID4gcG1fcnVudGltZV9nZXRfc3luYygpIGluY3JlbWVudHMgdGhl
IHJ1bnRpbWUgUE0gdXNhZ2UgY291bnRlciBldmVuCj4gPiB0aGUgY2FsbCByZXR1cm5zIGFuIGVy
cm9yIGNvZGUuIFRodXMgYSBwYWlyaW5nIGRlY3JlbWVudCBpcyBuZWVkZWQKPiA+IG9uIHRoZSBl
cnJvciBoYW5kbGluZyBwYXRoIHRvIGtlZXAgdGhlIGNvdW50ZXIgYmFsYW5jZWQuCj4gPiAKPiA+
IFNpZ25lZC1vZmYtYnk6IERpbmdoYW8gTGl1IDxkaW5naGFvLmxpdUB6anUuZWR1LmNuPgo+ID4g
LS0tCj4gPiAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1zdG0zMmY3LmMgfCA0ICsrKy0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXN0bTMyZjcuYyBiL2RyaXZlcnMvaTJj
L2J1c3Nlcy9pMmMtc3RtMzJmNy5jCj4gPiBpbmRleCAzMzBmZmVkMDExZTAuLjYwMmNmMzU2NDlj
OCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtc3RtMzJmNy5jCj4gPiAr
KysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXN0bTMyZjcuYwo+ID4gQEAgLTE3NjcsOCArMTc2
NywxMCBAQCBzdGF0aWMgaW50IHN0bTMyZjdfaTJjX3JlZ19zbGF2ZShzdHJ1Y3QgaTJjX2NsaWVu
dCAqc2xhdmUpCj4gPiAgCQlyZXR1cm4gcmV0Owo+ID4gIAo+ID4gIAlyZXQgPSBwbV9ydW50aW1l
X2dldF9zeW5jKGRldik7Cj4gPiAtCWlmIChyZXQgPCAwKQo+ID4gKwlpZiAocmV0IDwgMCkgewo+
ID4gKwkJcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoZGV2KTsKPiAKPiBDb25zaWRlcmluZyB0
aGF0IGlmIHdlIGZhaWwgaGVyZSB0aGVyZSBpcyBhIHZlcnkgZ29vZCBjaGFuY2UgdGhhdCB0aGlz
IGlzIGR1ZQo+IHRvIHRoZSByZXN1bWUgZmFpbGluZywgcG1fcnVudGltZV9wdXRfbm9pZGxlIHdv
dWxkIHByb2JhYmx5IG1ha2UgbW9yZSBzZW5zZQo+IHNpbmNlIHBtX3J1bnRpbWVfcHV0X2F1dG9z
dXNwZW5kIHdpbGwgbW9zdCBwcm9iYWJseSBmYWlsIGFzIHdlbGwuCj4gCgpBZ3JlZS4gVGhhbmsg
eW91IGZvciB5b3VyIGFkdmljZSEKClJlZ2FyZHMuCkRpbmdoYW8K

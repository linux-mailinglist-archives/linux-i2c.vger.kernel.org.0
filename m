Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 025A257D7F0
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Jul 2022 03:14:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbiGVBO0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Jul 2022 21:14:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbiGVBO0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Jul 2022 21:14:26 -0400
Received: from m1564.mail.126.com (m1564.mail.126.com [220.181.15.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 19A6E78DD1
        for <linux-i2c@vger.kernel.org>; Thu, 21 Jul 2022 18:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=yjlsQ
        1kQ8ZcelreevZqlyUAOxzujaVXGtBwGyQhKekU=; b=iPcJUfODPeTvMI816pw3z
        vs5RXrSu972kwKE2yDZUaalsX6rTJ6wtzIvowlGKEPyHrF+D6euF1bjwxaKqIAdB
        wCB9+hmOQFqiNznzzbHEmjTiNnozh5E2eabL7wCVkSxHFQSPqzshDSmkr7Ljzc3r
        6NGgcI6aEfbaZFQxfsrJsc=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr64
 (Coremail) ; Fri, 22 Jul 2022 09:14:19 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date:   Fri, 22 Jul 2022 09:14:19 +0800 (CST)
From:   "Liang He" <windhl@126.com>
To:     "Peter Rosin" <peda@axentia.se>
Cc:     linux-i2c@vger.kernel.org
Subject: Re:Re: [PATCH] i2c: i2c-mux-gpmux: Add of_node_put() when breaking
 out of loop
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <ccfb8195-7517-aad7-6b59-c0af7652e5a5@axentia.se>
References: <20220721081202.1300071-1-windhl@126.com>
 <ccfb8195-7517-aad7-6b59-c0af7652e5a5@axentia.se>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <54fa5ea2.b3c.18223783e5d.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: QMqowADX33Ps+dli3jBQAA--.37744W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/xtbBGhRGF1-HZilm7QAAsD
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

CkF0IDIwMjItMDctMjEgMTc6MjA6NTYsICJQZXRlciBSb3NpbiIgPHBlZGFAYXhlbnRpYS5zZT4g
d3JvdGU6Cj5IaSEKPgo+MjAyMi0wNy0yMSBhdCAxMDoxMiwgTGlhbmcgSGUgd3JvdGU6Cj4+IElu
IGkyY19tdXhfcHJvYmUoKSwgd2Ugc2hvdWxkIGNhbGwgb2Zfbm9kZV9wdXQoKSB3aGVuIGJyZWFr
aW5nIG91dAo+PiBvZiBmb3JfZWFjaF9jaGlsZF9vZl9ub2RlKCkgd2hpY2ggd2lsbCBhdXRvbWF0
aWNhbGx5IGluY3JlYXNlIGFuZAo+PiBkZWNyZWFzZSB0aGUgcmVmY291bnQuCj4+IAo+PiBGaXhl
czogYWM4NDk4ZjBjZTUzICgiaTJjOiBpMmMtbXV4LWdwbXV4OiBuZXcgZHJpdmVyIikKPj4gU2ln
bmVkLW9mZi1ieTogTGlhbmcgSGUgPHdpbmRobEAxMjYuY29tPgo+PiAtLS0KPj4gIGRyaXZlcnMv
aTJjL211eGVzL2kyYy1tdXgtZ3BtdXguYyB8IDEgKwo+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCj4+IAo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvbXV4ZXMvaTJjLW11eC1n
cG11eC5jIGIvZHJpdmVycy9pMmMvbXV4ZXMvaTJjLW11eC1ncG11eC5jCj4+IGluZGV4IGQzYWNk
OGQ2NmMzMi4uMzBhYjJmZTg4YzhkIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2kyYy9tdXhlcy9p
MmMtbXV4LWdwbXV4LmMKPj4gKysrIGIvZHJpdmVycy9pMmMvbXV4ZXMvaTJjLW11eC1ncG11eC5j
Cj4+IEBAIC0xMTUsNiArMTE1LDcgQEAgc3RhdGljIGludCBpMmNfbXV4X3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+ICAJCWlmIChyZXQgPCAwKSB7Cj4+ICAJCQlkZXZfZXJy
KGRldiwgIm5vIHJlZyBwcm9wZXJ0eSBmb3Igbm9kZSAnJXBPRm4nXG4iLAo+PiAgCQkJCWNoaWxk
KTsKPj4gKwkJCW9mX25vZGVfcHV0KGNoaWxkKTsKPj4gIAkJCWdvdG8gZXJyX2NoaWxkcmVuOwo+
PiAgCQl9Cj4+ICAKPgo+UmlnaHQsIGJ1dCB0aGlzIGlzIG9idmlvdXNseSBpbmNvbXBsZXRlLiBX
aGF0IGFib3V0IHRoZSBvdGhlciB0d28gYnJhbmNoZXMKPmluIHRoYXQgbG9vcCB0aGF0IGJyZWFr
cyBvdXQ/Cj4KPk11Y2ggYmV0dGVyIHRvIGhhdmUgdGhlIG1pc3Npbmcgb2Zfbm9kZV9wdXQoY2hp
bGQpIHN0YXRlbWVudCBiZWxvdyB0aGUKPmVycl9jaGlsZHJlbjogbGFiZWwgKGkuZS4gYmVmb3Jl
IGkyY19tdXhfZGVsX2FkYXB0ZXJzKSBzbyB0aGF0IGl0IGlzIG5vdAo+Zm9yZ290dGVuIGluIGFu
eSBjb2RlIGZsb3cuIGNoaWxkIGNhbm5vdCBiZSB1bmluaXRpYWxpemVkIGF0IHRoYXQgcG9pbnQK
PmFuZCBpZiBpdCBoYXBwZW5zIHRvIGJlIE5VTEwsIG9mX25vZGVfcHV0IHdpbGwgYmUgYSBub3Au
IFNvIHRoYXQncyBzYWZlLgo+Cj5DaGVlcnMsCj5QZXRlcgoKVGhhbmtzLCBQZXRlciwKCkkgaGF2
ZSBmb3Jnb3R0ZW4gYWRkIG9mX25vZGVfcHV0KCkgaW4gb3RoZXIgZmFpbCBwYXRoLgpCdXQgeW91
ciBhZHZpY2UgaXMgYmV0dGVyLCBJIHdpbGwgc2VuZCBhIG5ldyB2ZXJzaW9uIHNvb24hCgpUaGFu
a3MgYWdhaW4sCgpMaWFuZwo=

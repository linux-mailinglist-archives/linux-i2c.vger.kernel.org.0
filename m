Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA2836EE064
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Apr 2023 12:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233692AbjDYKb5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Apr 2023 06:31:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233629AbjDYKbx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Apr 2023 06:31:53 -0400
Received: from hust.edu.cn (unknown [202.114.0.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 39EA37ABF;
        Tue, 25 Apr 2023 03:31:51 -0700 (PDT)
Received: from m202171703$hust.edu.cn ( [10.12.182.0] ) by ajax-webmail-app1
 (Coremail) ; Tue, 25 Apr 2023 18:31:04 +0800 (GMT+08:00)
X-Originating-IP: [10.12.182.0]
Date:   Tue, 25 Apr 2023 18:31:04 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   =?UTF-8?B?5byg572R?= <m202171703@hust.edu.cn>
To:     "Peter Korsgaard" <peter@korsgaard.com>,
        "Andrew Lunn" <andrew@lunn.ch>
Cc:     hust-os-kernel-patches@googlegroups.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: ocores: add missing unwind goto in
 `ocores_i2c_probe`
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20220802(cbd923c5)
 Copyright (c) 2002-2023 www.mailtech.cn hust
In-Reply-To: <20230418053814.117215-1-silver_code@hust.edu.cn>
References: <20230418053814.117215-1-silver_code@hust.edu.cn>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <310e91c6.439bc.187b7f784f3.Coremail.m202171703@hust.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: FgEQrAB3xwjoq0dkDoPjAw--.47379W
X-CM-SenderInfo: rpsqjiqxrxijo6kx23oohg3hdfq/1tbiAQoMAF7Em5QCbwACs9
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
        CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
        daVFxhVjvjDU=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SSdtIHNvcnJ5IGZvciBzZW5kaW5nIHRoZSBlcnJvciBwaW5nIG1lc3NhZ2UuIApUaGUgcmVsYXRl
ZCBwYXRjaCBoYXMgZml4ZWQgdGhlIGlzc3VlIGJ5IGNoYW5naW5nIHRoZSBvY29yZXNfaTJjX29m
X3Byb2JlIGZ1bmN0aW9uIHRvIHVzZSBkZXZtX2Nsa19nZXRfb3B0aW9uYWxfZW5hYmxlZCgpLiAK
VGhpcyBuZXcgcGF0Y2ggb25seSByZXF1aXJlcyBhIG1pbm9yIG1vZGlmaWNhdGlvbiwgYW5kIHRo
ZXJlIGlzIG5vIG5lZWQgdG8gYWRkIGEgY2hlY2sgZm9yIGNsa19kaXNhYmxlX3VucHJlcGFyZSAK
YXMgaXQgYWxyZWFkeSBoYXMgY2hlY2tzIGZvciBlcnJvciBwb2ludGVycyBhbmQgTlVMTCB2YWx1
ZXMuCgpCZXN0IHJlZ2FyZHMsCldhbmcgWmhhbmcKCiJXYW5nIFpoYW5nIiA8c2lsdmVyX2NvZGVA
aHVzdC5lZHUuY24+5YaZ6YGT77yaCj4gU21hdGNoIFdhcm5zOg0KPiBkcml2ZXJzL2kyYy9idXNz
ZXMvaTJjLW9jb3Jlcy5jOjcwMSBvY29yZXNfaTJjX3Byb2JlKCkgd2FybjoNCj4gbWlzc2luZyB1
bndpbmQgZ290bz8NCj4gDQo+IFRoZSBlcnJvciBoYW5kbGluZyBjb2RlIGFmdGVyIHRoZSBlcnJf
Y2xrIGxhYmVsIHNob3VsZCBiZSBleGVjdXRlZCB0bw0KPiByZWxlYXNlIGFueSByZXNvdXJjZXMg
dGhhdCB3ZXJlIGFsbG9jYXRlZCBmb3IgdGhlIGNsb2NrIGlmIGEgbmVnYXRpdmUNCj4gZXJyb3Ig
Y29kZSByZXR1cm5lZCBhZnRlciBwbGF0Zm9ybV9nZXRfaXJxX29wdGlvbmFsLg0KPiANCj4gRml4
IHRoaXMgYnkgY2hhbmdpbmcgdGhlIGRpcmVjdCByZXR1cm4gdG8gYGdvdG8gZXJyX2Nsa2AuIA0K
PiANCj4gU2lnbmVkLW9mZi1ieTogV2FuZyBaaGFuZyA8c2lsdmVyX2NvZGVAaHVzdC5lZHUuY24+
DQo+IC0tLQ0KPiB2Mi0+djM6IHRoZSBmaXJzdCBwYXRjaCBoYWQgaXNzdWVzLiBKdXN0IGRvIGEg
bXVjaCBzaW1wbGVyIGZpeC4gTm8gbmVlZCANCj4gdG8gYWRkIHRoZSBjaGVjay4gY2xrX2Rpc2Fi
bGVfdW5wcmVwYXJlKCkgaGFzIGNoZWNrcyBmb3IgZXJyb3IgcG9pbnRlciANCj4gYW5kIE5VTEwg
YWxyZWFkeS4NCj4gdjEtPnYyOiBjaGFuZ2UgYG9jb3Jlc19pMmNfb2ZfcHJvYmVgIHRvIHVzZSBg
ZGV2bV9jbGtfZ2V0X2VuYWJsZWQoKWANCj4gLS0tDQo+IFRoaXMgcGF0Y2ggd2FzIGZvdW5kIGJ5
IHN0YXRpYyBhbmFseXplci4NCj4gLi4uDQo+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLW9jb3Jl
cy5jIHwgNiArKysrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1vY29y
ZXMuYyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtb2NvcmVzLmMNCj4gaW5kZXggMmU1NzU4NTZj
NWNkLi4xZGYxNDM5MjE4YzkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMt
b2NvcmVzLmMNCj4gKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1vY29yZXMuYw0KPiBAQCAt
NzAwLDggKzcwMCwxMCBAQCBzdGF0aWMgaW50IG9jb3Jlc19pMmNfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikNCj4gIAlpZiAoaXJxID09IC1FTlhJTykgew0KPiAgCQlvY29yZXNf
YWxnb3JpdGhtLm1hc3Rlcl94ZmVyID0gb2NvcmVzX3hmZXJfcG9sbGluZzsNCj4gIAl9IGVsc2Ug
ew0KPiAtCQlpZiAoaXJxIDwgMCkNCj4gLQkJCXJldHVybiBpcnE7DQo+ICsJCWlmIChpcnEgPCAw
KSB7DQo+ICsJCQlyZXQgPSBpcnE7DQo+ICsJCQlnb3RvIGVycl9jbGs7DQo+ICsJCX0NCj4gIAl9
DQo+ICANCj4gIAlpZiAob2NvcmVzX2FsZ29yaXRobS5tYXN0ZXJfeGZlciAhPSBvY29yZXNfeGZl
cl9wb2xsaW5nKSB7DQo+IC0tIA0KPiAyLjM0LjENCg==

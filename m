Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 184DB6EE436
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Apr 2023 16:48:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234306AbjDYOsB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Apr 2023 10:48:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234391AbjDYOr7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Apr 2023 10:47:59 -0400
Received: from hust.edu.cn (mail.hust.edu.cn [202.114.0.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 71749E71;
        Tue, 25 Apr 2023 07:47:56 -0700 (PDT)
Received: from m202171703$hust.edu.cn ( [172.16.0.254] ) by
 ajax-webmail-app1 (Coremail) ; Tue, 25 Apr 2023 22:47:29 +0800 (GMT+08:00)
X-Originating-IP: [172.16.0.254]
Date:   Tue, 25 Apr 2023 22:47:29 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   =?UTF-8?B?5byg572R?= <m202171703@hust.edu.cn>
To:     "Andrew Lunn" <andrew@lunn.ch>
Cc:     "Peter Korsgaard" <peter@korsgaard.com>,
        hust-os-kernel-patches@googlegroups.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH v3] i2c: ocores: use devm_ managed clks
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20220802(cbd923c5)
 Copyright (c) 2002-2023 www.mailtech.cn hust
In-Reply-To: <cf543f92-af0d-4862-bea6-53a358ee9a31@lunn.ch>
References: <fc8ed989-68e6-4fd4-a818-ae077bf5e6aa@lunn.ch>
 <20230422123253.137368-1-silver_code@hust.edu.cn>
 <cf543f92-af0d-4862-bea6-53a358ee9a31@lunn.ch>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <85952de.43bfe.187b8e24612.Coremail.m202171703@hust.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: FgEQrADn7LQB6EdkJp3oAw--.29830W
X-CM-SenderInfo: rpsqjiqxrxijo6kx23oohg3hdfq/1tbiAQoMAF7Em5QCbwAEs7
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
        CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
        daVFxhVjvjDU=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgQW5kcmV3LAoKSSB3b3VsZCBsaWtlIHRvIGV4cHJlc3MgbXkgc2luY2VyZSBncmF0aXR1ZGUg
Zm9yIHRha2luZyB0aGUgdGltZSBhbmQgZWZmb3J0IHRvIHJldmlldyAKbXkgc3VibWl0dGVkIHBh
dGNoLiBJIHVuZGVyc3RhbmQgdGhhdCByZXZpZXdpbmcgY2FuIGJlIGEgdGltZS1jb25zdW1pbmcg
cHJvY2VzcyAKYW5kIEkgdHJ1bHkgYXBwcmVjaWF0ZSB5b3VyIGRlZGljYXRpb24uCgpBcyB3ZSBt
b3ZlIGZvcndhcmQsIEkgd291bGQgbGlrZSB0byBpbnF1aXJlIGFib3V0IHRoZSBmaXJzdCB2ZXJz
aW9uWzFdIG9mIHRoZSBwYXRjaCBJIHN1Ym1pdHRlZC4gCkFzIGNsa19kaXNhYmxlX3VucHJlcGFy
ZSgpIGhhcyBjaGVja3MgZm9yIGVycm9yIHBvaW50ZXIgYW5kIE5VTEwgYWxyZWFkeSwgSSB0aGlu
ayB0aGVyZSBpcyBubyAKbmVlZCB0byBhZGQgdGhlIGNoZWNrLiBTbyBib3RoIHRoZSBmaXJzdCB2
ZXJzaW9uIG9mIHRoZSBwYXRjaCBhbmQgdGhpcyBvbmUgY2FuIHdvcmsgb24gdGhpcyAKYnJhbmNo
LgoKSWYgdGhlcmUgYXJlIGFueSBmdXJ0aGVyIGNoYW5nZXMgb3IgcmV2aXNpb25zIG5lZWRlZCwg
cGxlYXNlIGRvIG5vdCBoZXNpdGF0ZSB0byBsZXQgbWUga25vdy4gCkkgYW0gY29tbWl0dGVkIHRv
IGxlYXJuaW5nIGFuZCBpbXByb3ZpbmcsIGFuZCBJIHdlbGNvbWUgYW55IGZlZWRiYWNrIHlvdSBt
YXkgaGF2ZS4gClRoYW5rIHlvdSBhZ2FpbiBmb3IgeW91ciBzdXBwb3J0IGFuZCBndWlkYW5jZSB0
aHJvdWdob3V0IHRoaXMgcHJvY2Vzcy4KCkJlc3QgcmVnYXJkcywKV2FuZyBaaGFuZwotLS0KWzFd
IGh0dHA6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4LWkyYy9wYXRjaC8yMDIz
MDQxNjA3MTg1NC41ODMzNS0xLXNpbHZlcl9jb2RlQGh1c3QuZWR1LmNuLwoKIkFuZHJldyBMdW5u
IiA8YW5kcmV3QGx1bm4uY2g+5YaZ6YGT77yaCj4gT24gU2F0LCBBcHIgMjIsIDIwMjMgYXQgMDg6
MzI6NTNQTSArMDgwMCwgV2FuZyBaaGFuZyB3cm90ZToNCj4gPiBJZiBhbnkgd3Jvbmcgb2NjdXJz
IGluIG9jb3Jlc19pMmNfb2ZfcHJvYmUsIHRoZSBpMmMtPmNsayBuZWVkcyB0byBiZQ0KPiA+IHJl
bGVhc2VkLiBCdXQgdGhlIGZ1bmN0aW9uIHJldHVybnMgZGlyZWN0bHkgaW4gbGluZSA3MDEgd2l0
aG91dCBmcmVlaW5nDQo+ID4gdGhlIGNsb2NrLiBFdmVuIHRob3VnaCB3ZSBjYW4gZml4IGl0IGJ5
IGZyZWVpbmcgdGhlIGNsb2NrIG1hbnVhbGx5IGlmDQo+ID4gcGxhdGZvcm1fZ2V0X2lycV9vcHRp
b25hbCBmYWlscywgaXQgbWF5IG5vdCBiZSBmb2xsb3dpbmcgdGhlIGJlc3QgcHJhY3RpY2UuDQo+
ID4gVGhlIG9yaWdpbmFsIGNvZGUgZm9yIHRoaXMgZHJpdmVyIGNvbnRhaW5zIGlmIChJU19FUlIo
KSkgY2hlY2tzDQo+ID4gdGhyb3VnaG91dCwgZXhwbGljaXRseSBhbGxvd2luZyB0aGUgZHJpdmVy
IHRvIGNvbnRpbnVlIGxvYWRpbmcgZXZlbiBpZg0KPiA+IGRldm1fY2xrX2dldCgpIGZhaWxzLg0K
PiA+IA0KPiA+IFdoaWxlIGl0IGlzIG5vdCBlbnRpcmVseSBjbGVhciB3aHkgdGhlIG9yaWdpbmFs
IGF1dGhvciBpbXBsZW1lbnRlZCB0aGlzDQo+ID4gYmVoYXZpb3IsIHRoZXJlIG1heSBoYXZlIGJl
ZW4gY2VydGFpbiBjaXJjdW1zdGFuY2VzIG9yIGlzc3VlcyB0aGF0IHdlcmUgbm90DQo+ID4gYXBw
YXJlbnQgdG8gdXMuIEl0J3MgcG9zc2libGUgdGhhdCB0aGV5IHdlcmUgdHJ5aW5nIHRvIHdvcmsg
YXJvdW5kIGEgYnVnIGJ5DQo+ID4gZW1wbG95aW5nIGFuIHVuY29udmVudGlvbmFsIHNvbHV0aW9u
LlVzaW5nIGBkZXZtX2Nsa19nZXRfZW5hYmxlZCgpYCByYXRoZXINCj4gPiB0aGFuIGRldm1fY2xr
X2dldCgpIGNhbiBhdXRvbWF0aWNhbGx5IHRyYWNrIHRoZSB1c2FnZSBvZiBjbG9ja3MgYW5kIGZy
ZWUNCj4gPiB0aGVtIHdoZW4gdGhleSBhcmUgbm8gbG9uZ2VyIG5lZWRlZCBvciBhbiBlcnJvciBv
Y2N1cnMuDQo+ID4gDQo+ID4gZml4aW5nIGl0IGJ5IGNoYW5naW5nIGBvY29yZXNfaTJjX29mX3By
b2JlYCB0byB1c2UNCj4gPiBgZGV2bV9jbGtfZ2V0X29wdGlvbmFsX2VuYWJsZWQoKWAgcmF0aGVy
IHRoYW4gYGRldm1fY2xrX2dldCgpYCwgY2hhbmdpbmcNCj4gPiBgZ290byBlcnJfY2xrJyB0byBk
aXJlY3QgcmV0dXJuIGFuZCByZW1vdmluZyBgZXJyX2Nsa2AuDQo+ID4gDQo+ID4gU2lnbmVkLW9m
Zi1ieTogV2FuZyBaaGFuZyA8c2lsdmVyX2NvZGVAaHVzdC5lZHUuY24+DQo+IA0KPiBSZXZpZXdl
ZC1ieTogQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5uLmNoPg0KPiANCj4gICAgIEFuZHJldw0K

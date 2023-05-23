Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7883E70D2F8
	for <lists+linux-i2c@lfdr.de>; Tue, 23 May 2023 06:50:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbjEWEuS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 May 2023 00:50:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbjEWEuR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 May 2023 00:50:17 -0400
Received: from hust.edu.cn (mail.hust.edu.cn [202.114.0.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E5FA0109;
        Mon, 22 May 2023 21:50:14 -0700 (PDT)
Received: from m202171703$hust.edu.cn ( [172.16.0.254] ) by
 ajax-webmail-app1 (Coremail) ; Tue, 23 May 2023 12:49:54 +0800 (GMT+08:00)
X-Originating-IP: [172.16.0.254]
Date:   Tue, 23 May 2023 12:49:54 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   =?UTF-8?B?5byg572R?= <m202171703@hust.edu.cn>
To:     "andrew lunn" <andrew@lunn.ch>
Cc:     hust-os-kernel-patches@googlegroups.com,
        "peter korsgaard" <peter@korsgaard.com>, linux-i2c@vger.kernel.org,
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
Message-ID: <5572a733.abc0.18846f13b0b.Coremail.m202171703@hust.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: FgEQrADnSHryRWxk3XcyAg--.24551W
X-CM-SenderInfo: rpsqjiqxrxijo6kx23oohg3hdfq/1tbiAQoAAGRrClNO0gAAsB
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

PiAtLS0tLeWOn+Wni+mCruS7ti0tLS0tCj4g5Y+R5Lu25Lq6OiAiQW5kcmV3IEx1bm4iIDxhbmRy
ZXdAbHVubi5jaD4KPiDlj5HpgIHml7bpl7Q6IDIwMjMtMDQtMjUgMTk6NTc6MjYgKOaYn+acn+S6
jCkKPiDmlLbku7bkuro6ICJXYW5nIFpoYW5nIiA8c2lsdmVyX2NvZGVAaHVzdC5lZHUuY24+Cj4g
5oqE6YCBOiAiUGV0ZXIgS29yc2dhYXJkIiA8cGV0ZXJAa29yc2dhYXJkLmNvbT4sIGh1c3Qtb3Mt
a2VybmVsLXBhdGNoZXNAZ29vZ2xlZ3JvdXBzLmNvbSwgbGludXgtaTJjQHZnZXIua2VybmVsLm9y
ZywgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+IOS4u+mimDogUmU6IFtQQVRDSCB2M10g
aTJjOiBvY29yZXM6IHVzZSBkZXZtXyBtYW5hZ2VkIGNsa3MKPiAKPiBPbiBTYXQsIEFwciAyMiwg
MjAyMyBhdCAwODozMjo1M1BNICswODAwLCBXYW5nIFpoYW5nIHdyb3RlOgo+ID4gSWYgYW55IHdy
b25nIG9jY3VycyBpbiBvY29yZXNfaTJjX29mX3Byb2JlLCB0aGUgaTJjLT5jbGsgbmVlZHMgdG8g
YmUKPiA+IHJlbGVhc2VkLiBCdXQgdGhlIGZ1bmN0aW9uIHJldHVybnMgZGlyZWN0bHkgaW4gbGlu
ZSA3MDEgd2l0aG91dCBmcmVlaW5nCj4gPiB0aGUgY2xvY2suIEV2ZW4gdGhvdWdoIHdlIGNhbiBm
aXggaXQgYnkgZnJlZWluZyB0aGUgY2xvY2sgbWFudWFsbHkgaWYKPiA+IHBsYXRmb3JtX2dldF9p
cnFfb3B0aW9uYWwgZmFpbHMsIGl0IG1heSBub3QgYmUgZm9sbG93aW5nIHRoZSBiZXN0IHByYWN0
aWNlLgo+ID4gVGhlIG9yaWdpbmFsIGNvZGUgZm9yIHRoaXMgZHJpdmVyIGNvbnRhaW5zIGlmIChJ
U19FUlIoKSkgY2hlY2tzCj4gPiB0aHJvdWdob3V0LCBleHBsaWNpdGx5IGFsbG93aW5nIHRoZSBk
cml2ZXIgdG8gY29udGludWUgbG9hZGluZyBldmVuIGlmCj4gPiBkZXZtX2Nsa19nZXQoKSBmYWls
cy4KPiA+IAo+ID4gV2hpbGUgaXQgaXMgbm90IGVudGlyZWx5IGNsZWFyIHdoeSB0aGUgb3JpZ2lu
YWwgYXV0aG9yIGltcGxlbWVudGVkIHRoaXMKPiA+IGJlaGF2aW9yLCB0aGVyZSBtYXkgaGF2ZSBi
ZWVuIGNlcnRhaW4gY2lyY3Vtc3RhbmNlcyBvciBpc3N1ZXMgdGhhdCB3ZXJlIG5vdAo+ID4gYXBw
YXJlbnQgdG8gdXMuIEl0J3MgcG9zc2libGUgdGhhdCB0aGV5IHdlcmUgdHJ5aW5nIHRvIHdvcmsg
YXJvdW5kIGEgYnVnIGJ5Cj4gPiBlbXBsb3lpbmcgYW4gdW5jb252ZW50aW9uYWwgc29sdXRpb24u
VXNpbmcgYGRldm1fY2xrX2dldF9lbmFibGVkKClgIHJhdGhlcgo+ID4gdGhhbiBkZXZtX2Nsa19n
ZXQoKSBjYW4gYXV0b21hdGljYWxseSB0cmFjayB0aGUgdXNhZ2Ugb2YgY2xvY2tzIGFuZCBmcmVl
Cj4gPiB0aGVtIHdoZW4gdGhleSBhcmUgbm8gbG9uZ2VyIG5lZWRlZCBvciBhbiBlcnJvciBvY2N1
cnMuCj4gPiAKPiA+IGZpeGluZyBpdCBieSBjaGFuZ2luZyBgb2NvcmVzX2kyY19vZl9wcm9iZWAg
dG8gdXNlCj4gPiBgZGV2bV9jbGtfZ2V0X29wdGlvbmFsX2VuYWJsZWQoKWAgcmF0aGVyIHRoYW4g
YGRldm1fY2xrX2dldCgpYCwgY2hhbmdpbmcKPiA+IGBnb3RvIGVycl9jbGsnIHRvIGRpcmVjdCBy
ZXR1cm4gYW5kIHJlbW92aW5nIGBlcnJfY2xrYC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogV2Fu
ZyBaaGFuZyA8c2lsdmVyX2NvZGVAaHVzdC5lZHUuY24+Cj4gCj4gUmV2aWV3ZWQtYnk6IEFuZHJl
dyBMdW5uIDxhbmRyZXdAbHVubi5jaD4KPiAKPiAgICAgQW5kcmV3CgpIaSBBbmRyZXcsCkknbSBj
aGVja2luZyBpbiBhYm91dCBteSBwYXRjaCBzdWJtaXNzaW9uIGZvciBpMmMgb2NvcmVzIHRoYXQg
d2FzCiJyZXZpZXcnZWQiIG9uIDQvMjUsIGJ1dCBpdHMgc3RhdHVzIGhhcyBub3QgYmVlbiB1cGRh
dGVkIHlldC4KSSB3b3VsZCBncmVhdGx5IGFwcHJlY2lhdGUgaXQgaWYgeW91IGNvdWxkIHByb3Zp
ZGUgbWUgd2l0aCBhbiAKdXBkYXRlIG9uIHRoZSBzdGF0dXMgb2YgbXkgc3VibWlzc2lvbi4gSXMg
dGhlcmUgYW55IGFkZGl0aW9uYWwgCmluZm9ybWF0aW9uIG9yIGRvY3VtZW50YXRpb24gdGhhdCBJ
IGNhbiBwcm92aWRlIHRvIGhlbHAgZXhwZWRpdGUgCnRoZSBwcm9jZXNzPwoKVGhhbmsgeW91IHZl
cnkgbXVjaCBmb3IgeW91ciB0aW1lIGFuZCBhdHRlbnRpb24uIEkgbG9vayBmb3J3YXJkIAp0byBo
ZWFyaW5nIGZyb20geW91IHNvb24uCgpSZWdhcmRzLApXYW5nIFpoYW5n

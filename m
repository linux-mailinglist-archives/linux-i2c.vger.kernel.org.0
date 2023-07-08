Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67C9274BCE6
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Jul 2023 10:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbjGHIqZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 8 Jul 2023 04:46:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjGHIqY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 8 Jul 2023 04:46:24 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4B241FEE;
        Sat,  8 Jul 2023 01:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1688805982;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KFsF/Pchrt/OXl692hOLmaW9S5Y0YPAjhoefyVENWrE=;
        b=cNyI0iSzg4feQmvXL4+llRi81AbJmnTk3f/+th1HW3y6kSTN8bQ69pu6RgL2juKMUbRdbk
        TRqWfJ0DwEPM1/xw4cAlRybyuzY59oI5UCmKgRmEqqRLsrcqICsUFBZeFHam/tHARJ5zof
        DYQbF4C/jneJ0ls5LayOqxjiZmdYtC0=
Message-ID: <445b8b63b75234730a277d091ae02d31c63ed2f0.camel@crapouillou.net>
Subject: Re: [PATCH 10/23] i2c: img-scb: Remove #ifdef guards for PM related
 functions
From:   Paul Cercueil <paul@crapouillou.net>
To:     Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Sat, 08 Jul 2023 10:46:20 +0200
In-Reply-To: <20230706103133.00006b5f@Huawei.com>
References: <20230705204314.89800-1-paul@crapouillou.net>
         <20230705204314.89800-11-paul@crapouillou.net>
         <20230706103133.00006b5f@Huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgSm9uYXRoYW4sCgpMZSBqZXVkaSAwNiBqdWlsbGV0IDIwMjMgw6AgMTA6MzEgKzA4MDAsIEpv
bmF0aGFuIENhbWVyb24gYSDDqWNyaXTCoDoKPiBPbiBXZWQswqAgNSBKdWwgMjAyMyAyMjo0Mzow
MSArMDIwMAo+IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PiB3cm90ZToKPiAK
PiA+IFVzZSB0aGUgbmV3IFBNIG1hY3JvcyBmb3IgdGhlIHN1c3BlbmQgYW5kIHJlc3VtZSBmdW5j
dGlvbnMgdG8gYmUKPiA+IGF1dG9tYXRpY2FsbHkgZHJvcHBlZCBieSB0aGUgY29tcGlsZXIgd2hl
biBDT05GSUdfUE0gb3IKPiA+IENPTkZJR19QTV9TTEVFUCBhcmUgZGlzYWJsZWQsIHdpdGhvdXQg
aGF2aW5nIHRvIHVzZSAjaWZkZWYgZ3VhcmRzLgo+ID4gCj4gPiBUaGlzIGhhcyB0aGUgYWR2YW50
YWdlIG9mIGFsd2F5cyBjb21waWxpbmcgdGhlc2UgZnVuY3Rpb25zIGluLAo+ID4gaW5kZXBlbmRl
bnRseSBvZiBhbnkgS2NvbmZpZyBvcHRpb24uIFRoYW5rcyB0byB0aGF0LCBidWdzIGFuZCBvdGhl
cgo+ID4gcmVncmVzc2lvbnMgYXJlIHN1YnNlcXVlbnRseSBlYXNpZXIgdG8gY2F0Y2guCj4gPiAK
PiA+IFNpZ25lZC1vZmYtYnk6IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0Pgo+
IEkgdGhvdWdodCB0aGUgX0RFRklORSBtYWNyb3Mgd2VyZW4ndCByZWFsbHkgaW50ZW5kZWQgZm9y
IGRyaXZlcgo+IHVzYWdlIGFuZCBpdCdzIGdvb2QgdG8ga2VlcCB0aGUgYWJpbGl0eSB0byBjaGFu
Z2UgdGhvc2UgZGV0YWlscwo+IHdpdGhvdXQgdXBkYXRpbmcgbG90cyBvZiBkcml2ZXJzLsKgIFBl
cmhhcHMganVzdCBleHByZXNzIGl0IGxvbmcgaGFuZAo+IGhlcmU/CgpZZWFoIHlvdSBhcmUgcmln
aHQuIFRoZSAibG9uZyB2ZXJzaW9uIiBpc24ndCBtdWNoIGxvbmdlciBhbnl3YXkuCgpDaGVlcnMs
Ci1QYXVsCgo+IEpvbmF0aGFuCj4gCj4gCj4gPiAtLS0KPiA+IMKgZHJpdmVycy9pMmMvYnVzc2Vz
L2kyYy1pbWctc2NiLmMgfCAxMyArKysrLS0tLS0tLS0tCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2kyYy9idXNzZXMvaTJjLWltZy1zY2IuYwo+ID4gYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJj
LWltZy1zY2IuYwo+ID4gaW5kZXggNGI2NzRjZmJjNmZiLi5hOTJlMzA4MjU0MmUgMTAwNjQ0Cj4g
PiAtLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWltZy1zY2IuYwo+ID4gKysrIGIvZHJpdmVy
cy9pMmMvYnVzc2VzL2kyYy1pbWctc2NiLmMKPiA+IEBAIC0xNDU0LDcgKzE0NTQsNiBAQCBzdGF0
aWMgaW50IGltZ19pMmNfcnVudGltZV9yZXN1bWUoc3RydWN0Cj4gPiBkZXZpY2UgKmRldikKPiA+
IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsKPiA+IMKgfQo+ID4gwqAKPiA+IC0jaWZkZWYgQ09O
RklHX1BNX1NMRUVQCj4gPiDCoHN0YXRpYyBpbnQgaW1nX2kyY19zdXNwZW5kKHN0cnVjdCBkZXZp
Y2UgKmRldikKPiA+IMKgewo+ID4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBpbWdfaTJjICppMmMg
PSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPiA+IEBAIC0xNDgyLDE0ICsxNDgxLDEwIEBAIHN0YXRp
YyBpbnQgaW1nX2kyY19yZXN1bWUoc3RydWN0IGRldmljZQo+ID4gKmRldikKPiA+IMKgCj4gPiDC
oMKgwqDCoMKgwqDCoMKgcmV0dXJuIDA7Cj4gPiDCoH0KPiA+IC0jZW5kaWYgLyogQ09ORklHX1BN
X1NMRUVQICovCj4gPiDCoAo+ID4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyBpbWdf
aTJjX3BtID0gewo+ID4gLcKgwqDCoMKgwqDCoMKgU0VUX1JVTlRJTUVfUE1fT1BTKGltZ19pMmNf
cnVudGltZV9zdXNwZW5kLAo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGltZ19pMmNfcnVudGltZV9yZXN1bWUsCj4gPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTlVMTCkKPiA+IC3CoMKgwqDC
oMKgwqDCoFNFVF9TWVNURU1fU0xFRVBfUE1fT1BTKGltZ19pMmNfc3VzcGVuZCwgaW1nX2kyY19y
ZXN1bWUpCj4gPiAtfTsKPiA+ICtzdGF0aWMgX0RFRklORV9ERVZfUE1fT1BTKGltZ19pMmNfcG0s
IGltZ19pMmNfc3VzcGVuZCwKPiA+IGltZ19pMmNfcmVzdW1lLAo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbWdfaTJjX3J1bnRpbWVfc3VzcGVu
ZCwKPiA+IGltZ19pMmNfcnVudGltZV9yZXN1bWUsCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE5VTEwpOwo+ID4gwqAKPiA+IMKgc3RhdGljIGNv
bnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgaW1nX3NjYl9pMmNfbWF0Y2hbXSA9IHsKPiA+IMKgwqDC
oMKgwqDCoMKgwqB7IC5jb21wYXRpYmxlID0gImltZyxzY2ItaTJjIiB9LAo+ID4gQEAgLTE1MDEs
NyArMTQ5Niw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyCj4gPiBpbWdfc2NiX2ky
Y19kcml2ZXIgPSB7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgLmRyaXZlciA9IHsKPiA+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLm5hbWXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgPSAiaW1n
LWkyYy1zY2IiLAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAub2ZfbWF0Y2hf
dGFibGXCoD0gaW1nX3NjYl9pMmNfbWF0Y2gsCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgLnBtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqA9ICZpbWdfaTJjX3BtLAo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC5wbcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
PSBwbV9wdHIoJmltZ19pMmNfcG0pLAo+ID4gwqDCoMKgwqDCoMKgwqDCoH0sCj4gPiDCoMKgwqDC
oMKgwqDCoMKgLnByb2JlID0gaW1nX2kyY19wcm9iZSwKPiA+IMKgwqDCoMKgwqDCoMKgwqAucmVt
b3ZlX25ldyA9IGltZ19pMmNfcmVtb3ZlLAo+IAoK


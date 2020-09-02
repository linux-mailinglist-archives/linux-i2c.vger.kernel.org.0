Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4AF725B582
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Sep 2020 22:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgIBU5i (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Sep 2020 16:57:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726397AbgIBU5i (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Sep 2020 16:57:38 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AD0FC061245
        for <linux-i2c@vger.kernel.org>; Wed,  2 Sep 2020 13:57:37 -0700 (PDT)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 36A2284487;
        Thu,  3 Sep 2020 08:57:29 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1599080249;
        bh=3Xwnj8kC68rJUBafK7RqG09oXTDbcba7nzlNg1mgKk0=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=NjRZB8Nx8B62W+lZsyIFT3GmE8zozbh1GgABO1zHcfdWwU4h+ZapQepBWZxcIIJed
         B1UU293zHqws9NPj4tacwjcJ01EaGPWQrAAmeJOTbjkNZGblf+wpiseEIA+OaVUwci
         iB0I8tLooJruqoMAxuugdzDePZudbqSjc4/4xDINaUdkO18bubhEfql5a33RsnNG/O
         iOu6Kt2jRYPrdlv6rtDVI0VAuan4zPOSGx+MZKSYdkn9rquC41pA9XXW8VY466JAru
         jeQ9tYJHHqqgZkE5b+Fx0fuwoa/hbLcLNk7T7puWIjCRrwbeUQ0iJ4KQmU8k43SKRv
         JbWno8+F3xZgw==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5f5007380000>; Thu, 03 Sep 2020 08:57:28 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 3 Sep 2020 08:57:28 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.006; Thu, 3 Sep 2020 08:57:28 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Evan Nimmo <Evan.Nimmo@alliedtelesis.co.nz>
CC:     "wsa@kernel.org" <wsa@kernel.org>,
        "jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>,
        "jdelvare@suse.de" <jdelvare@suse.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] i2c: algo-pca: Reapply i2c bus settings after
 reset
Thread-Topic: [PATCH v2 1/1] i2c: algo-pca: Reapply i2c bus settings after
 reset
Thread-Index: AQHWgKVhYr3ZP6ECPkaX1i3nFuj7jKlUP+0AgAAAegCAAMx4gA==
Date:   Wed, 2 Sep 2020 20:57:27 +0000
Message-ID: <51972597-db12-e9f2-235c-f68c7fba0e1d@alliedtelesis.co.nz>
References: <20200901211747.20649-1-evan.nimmo@alliedtelesis.co.nz>
 <20200902084356.GX1891694@smile.fi.intel.com>
 <20200902084538.GY1891694@smile.fi.intel.com>
In-Reply-To: <20200902084538.GY1891694@smile.fi.intel.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <28556501D2370546B38E263E7B698CFE@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpPbiAyLzA5LzIwIDg6NDUgcG0sIEFuZHkgU2hldmNoZW5rbyB3cm90ZToNCj4gT24gV2VkLCBT
ZXAgMDIsIDIwMjAgYXQgMTE6NDM6NTZBTSArMDMwMCwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOg0K
Pj4gT24gV2VkLCBTZXAgMDIsIDIwMjAgYXQgMDk6MTc6NDdBTSArMTIwMCwgRXZhbiBOaW1tbyB3
cm90ZToNCj4+PiBJZiBzb21ldGhpbmcgZ29lcyB3cm9uZyAoc3VjaCBhcyB0aGUgU0NMIGJlaW5n
IHN0dWNrIGxvdykgdGhlbiB3ZSBuZWVkDQo+Pj4gdG8gcmVzZXQgdGhlIFBDQSBjaGlwLiBUaGUg
aXNzdWUgd2l0aCB0aGlzIGlzIHRoYXQgb24gcmVzZXQgd2UgbG9zZSBhbGwNCj4+PiBjb25maWcg
c2V0dGluZ3MgYW5kIHRoZSBjaGlwIGVuZHMgdXAgaW4gYSBkaXNhYmxlZCBzdGF0ZSB3aGljaCBy
ZXN1bHRzDQo+Pj4gaW4gYSBsb2NrIHVwL2hpZ2ggY3B1IHVzYWdlLiBXZSBuZWVkIHRvIHJlLWFw
cGx5IGFueSBjb25maWd1cmF0aW9uIHRoYXQNCj4+IGNwdSAtPiBDUFUgKEkgZ3Vlc3MgV29sZnJh
bSBjYW4gZGVjaWRlIHdpdGggdGhpcyB3aGVuIGFwcGx5aW5nKQ0KPj4NCj4+PiBoYWQgcHJldmlv
dXNseSBiZWVuIHNldCBhbmQgcmUtZW5hYmxlIHRoZSBjaGlwLg0KPj4gRldJVywNCj4+IFJldmll
d2VkLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNv
bT4NCj4gQW5kIGFjdHVhbGx5IHlvdSBmb3Jnb3QgQ2hyaXMnIHRhZy4uLiBCdXQgSSBkdW5ubyBp
ZiB0aGUgbW92aW5nIHN0cnVjdA0KPiBkZWZpbml0aW9uIGlzIHNvbWV0aGluZyB0aGF0IENocmlz
IG1pZ2h0IG5vdCBsaWtlLg0KPg0KRmluZSBieSBtZS4NCg0KUmV2aWV3ZWQtYnk6IENocmlzIFBh
Y2toYW0gPGNocmlzLnBhY2toYW1AYWxsaWVkdGVsZXNpcy5jby5uej4NCg==

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A85CD6B6D38
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Mar 2023 02:53:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbjCMBxd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Mar 2023 21:53:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjCMBxc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Mar 2023 21:53:32 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7469513DE7
        for <linux-i2c@vger.kernel.org>; Sun, 12 Mar 2023 18:53:25 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 15BA32C04A0;
        Mon, 13 Mar 2023 14:53:24 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1678672404;
        bh=Z6a/CTUmcb8tPfzzC26tw0NjBYk4oxAmY7/2LQUDgZM=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=rtI3/6zVxzZ7j2KwJ4L7eLpvkBfDzXKhBFVKrUN/1JdLFubOGh9fPyjur2Q1nQK+U
         F7XP0sGbhfkMCvULflCFCVB8qqw563sC3k0hsC+KIlnwqTtDW2weHF4v2P6jyRRBXL
         MK3QF0cKqcoIpQ5ASNKJFY7RsUDEvP037RCQy/iu0vCG5eu4kLXXLBHU7bw4jnyL11
         BZzTlEbULW1dNiDjWza1EVkWu5WAYEtC0AjlsZo7pWch+Yp0+AkhBfFbHQZqTeFacB
         5uFwqkQ+dUbVjefGkeANnHDsKxw/pp2AYWbzht4aUNXspZ/i9gi/E9Upf3CkgDSCxV
         mCCh4PfScVlrg==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B640e82140001>; Mon, 13 Mar 2023 14:53:24 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.47; Mon, 13 Mar 2023 14:53:23 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.047; Mon, 13 Mar 2023 14:53:23 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Andi Shyti <andi.shyti@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v3 3/3] i2c: mpc: Use i2c-scl-clk-low-timeout-ms i2c
 property
Thread-Topic: [PATCH v3 3/3] i2c: mpc: Use i2c-scl-clk-low-timeout-ms i2c
 property
Thread-Index: AQHZVTuFDX+DgmEDFk23hBmDkBbcm673GMuA
Date:   Mon, 13 Mar 2023 01:53:23 +0000
Message-ID: <f3d6760d-f2cc-c725-d7fb-6056ee555b65@alliedtelesis.co.nz>
References: <20230312233613.303408-1-andi.shyti@kernel.org>
 <20230312233613.303408-4-andi.shyti@kernel.org>
In-Reply-To: <20230312233613.303408-4-andi.shyti@kernel.org>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <F66BACD56264934CA106B4A1804B0779@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=GdlpYjfL c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=k__wU0fu6RkA:10 a=VwQbUJbxAAAA:8 a=wGBd0DG7BR80vmoGwPEA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
X-SEG-SpamProfiler-Score: 0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpPbiAxMy8wMy8yMyAxMjozNiwgQW5kaSBTaHl0aSB3cm90ZToNCj4gImZzbCx0aW1lb3V0IiBp
cyBtYXJrZWQgYXMgZGVwcmVjYXRlZCBhbmQgcmVwbGFjZWQgYnkgdGhlDQo+ICJpMmMtc2NsLWNs
ay1sb3ctdGltZW91dC1tcyIgaTJjIHByb3BlcnR5Lg0KPg0KPiBVc2UgdGhpcyBsYXR0ZXIgYW5k
LCBpbiBjYXNlIGl0IGlzIG1pc3NpbmcsIGZvciBiYWNrDQo+IGNvbXBhdGliaWxpdHksIGNoZWNr
IHdoZXRoZXIgd2Ugc3RpbGwgaGF2ZSAiZnNsLHRpbWVvdXQiIGRlZmluZWQuDQo+DQo+IFNpZ25l
ZC1vZmYtYnk6IEFuZGkgU2h5dGkgPGFuZGkuc2h5dGlAa2VybmVsLm9yZz4NCj4gUmV2aWV3ZWQt
Ynk6IENocmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1AYWxsaWVkdGVsZXNpcy5jby5uej4NCkdh
dmUgdGhlIHBhdGNoZXMgYSBzcGluIG9uIGEgUDIwNDFSREIgc28NCg0KVGVzdGVkLWJ5OiBDaHJp
cyBQYWNraGFtIDxjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+DQoNCj4gLS0tDQo+
ICAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tcGMuYyB8IDEyICsrKysrKysrKysrLQ0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+DQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW1wYy5jIGIvZHJpdmVycy9pMmMvYnVzc2Vz
L2kyYy1tcGMuYw0KPiBpbmRleCA4N2U1YzE3MjU3NTAuLjI4ZjExZTMwYWM1MCAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tcGMuYw0KPiArKysgYi9kcml2ZXJzL2kyYy9i
dXNzZXMvaTJjLW1wYy5jDQo+IEBAIC04NDMsOCArODQzLDE4IEBAIHN0YXRpYyBpbnQgZnNsX2ky
Y19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpvcCkNCj4gICAJCQltcGNfaTJjX3NldHVw
Xzh4eHgob3AtPmRldi5vZl9ub2RlLCBpMmMsIGNsb2NrKTsNCj4gICAJfQ0KPiAgIA0KPiArCS8q
DQo+ICsJICogImZzbCx0aW1lb3V0IiBoYXMgYmVlbiBtYXJrZWQgYXMgZGVwcmVjYXRlZCBhbmQs
IHRvIG1haW50YWluDQo+ICsJICogYmFja3dhcmQgY29tcGF0aWJpbGl0eSwgd2Ugd2lsbCBvbmx5
IGxvb2sgZm9yIGl0IGlmDQo+ICsJICogImkyYy1zY2wtY2xrLWxvdy10aW1lb3V0LW1zIiBpcyBu
b3QgcHJlc2VudC4NCj4gKwkgKi8NCj4gICAJcmVzdWx0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIo
b3AtPmRldi5vZl9ub2RlLA0KPiAtCQkJCSAgICAgICJmc2wsdGltZW91dCIsICZtcGNfb3BzLnRp
bWVvdXQpOw0KPiArCQkJCSAgICAgICJpMmMtc2NsLWNsay1sb3ctdGltZW91dC1tcyIsDQo+ICsJ
CQkJICAgICAgJm1wY19vcHMudGltZW91dCk7DQo+ICsJaWYgKHJlc3VsdCA9PSAtRUlOVkFMKQ0K
PiArCQlyZXN1bHQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihvcC0+ZGV2Lm9mX25vZGUsDQo+ICsJ
CQkJCSAgICAgICJmc2wsdGltZW91dCIsICZtcGNfb3BzLnRpbWVvdXQpOw0KPiArDQo+ICAgCWlm
ICghcmVzdWx0KSB7DQo+ICAgCQltcGNfb3BzLnRpbWVvdXQgKj0gSFogLyAxMDAwMDAwOw0KPiAg
IAkJaWYgKG1wY19vcHMudGltZW91dCA8IDUp

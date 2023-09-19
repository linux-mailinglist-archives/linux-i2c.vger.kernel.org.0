Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 077497A6EA7
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Sep 2023 00:29:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233545AbjISW35 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Sep 2023 18:29:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233482AbjISW35 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Sep 2023 18:29:57 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B223BF
        for <linux-i2c@vger.kernel.org>; Tue, 19 Sep 2023 15:29:50 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 816642C0107;
        Wed, 20 Sep 2023 10:29:47 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1695162587;
        bh=rYLOWSsfRn6gP+N5KE/f/UgN6RQcrMy3pKc/cSQtDRY=;
        h=From:To:CC:Subject:Date:From;
        b=2ra7JRK5YAsJ8i+MzocEyKZ0dBtAaZ6M0VV76UYsDeWW4UvIVBohuxa9I91EFaXIJ
         OjpXVgxC4yFzSPcLUi2XjvEfUeVgA+/+rgwVaSPCR3OKL7wqSdvuRlDtVxR7QPxL3r
         BmZIghMQf1Nhxkw0IHWjHB1UWgvCuPoP1jKkiz2/rF+9acSbK7JaAGnv2WGn+XHa+M
         96NWu3z2snZTPRF5KNdqGvBViRccgAHt3ISwhoMv9JfN7RCJ9/hpms4jXTStVPc9Ze
         0nj37gnh4Wrwum+aYT2CpKewAZZNI6XRpZc8Ncqf78QhHWubuNJoiEx+SN7niGE1Ze
         0y3BYod997gBQ==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B650a20db0001>; Wed, 20 Sep 2023 10:29:47 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.37; Wed, 20 Sep 2023 10:29:47 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.037; Wed, 20 Sep 2023 10:29:47 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
        Andi Shyti <andi.shyti@kernel.org>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: I2C transfer offload on i2c-mv64xxx devices
Thread-Topic: I2C transfer offload on i2c-mv64xxx devices
Thread-Index: AQHZ60jLwH6kgMZqXUe/MKD8RGEpXQ==
Date:   Tue, 19 Sep 2023 22:29:47 +0000
Message-ID: <f494cdfa-38c7-45a1-b511-ea8b2ff0090a@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.22.30]
Content-Type: text/plain; charset="utf-8"
Content-ID: <24D43A2830EBDC45B033374F26EEEF4A@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=YOfhNiOx c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=VwQbUJbxAAAA:8 a=zyePfXnSHG6LjwfmW-sA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
X-SEG-SpamProfiler-Score: 0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgR3JlZ29yeSwNCg0KQXJlIHlvdSBhYmxlIHRvIHByb3ZpZGUgYSBiaXQgbW9yZSBjb250ZXh0
IGFyb3VuZCANCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L3RvcnZhbGRzL2xpbnV4LmdpdC9jb21taXQvP2lkPTZjZjcwYWU5MjhiYWUNCg0KVG8gc2F2ZSB5
b3UgYSBjbGljayB0aGF0J3MgY29tbWl0IDZjZjcwYWU5MjhiYSAoImkyYzogbXY2NHh4eDogRml4
IGJ1cyANCmhhbmcgb24gQTAgdmVyc2lvbiBvZiB0aGUgQXJtYWRhIFhQIFNvQ3MiKSBiYXNpY2Fs
bHkgeW91IGFkZGVkIHRoZSANCiJtYXJ2ZWxsLG12NzgyMzAtYTAtaTJjIiBjb21wYXRpYmxlIGFu
ZCB1c2VkIHRoYXQgdG8gZGlzYWJsZSB0aGUgSTJDIA0KdHJhbnNmZXIgb2ZmbG9hZCBmZWF0dXJl
LiBJdCdzIGFsbW9zdCAxMCB5ZWFycyBhZ28gc28gSSBkb24ndCByZWFsbHkgDQpleHBlY3QgYW55
b25lIHRvIHJlbWVtYmVyLg0KDQpJJ3ZlIGJlZW4gY2hhc2luZyBhbiBpc3N1ZSB3aGVyZSBjZXJ0
YWluIEkyQyBidXMgY29uZGl0aW9ucyAod2hpY2ggSSdtIA0Kbm93IGluamVjdGluZyB1c2luZyBh
bm90aGVyIGJvYXJkIGFuZCB0aGUgaTJjLWdwaW8gZmF1bHQgaW5qZWN0aW9uKSANCmNhdXNlIGEg
c3lzdGVtIHdpZGUgbG9ja3VwIG9uIHNvbWUgTWFydmVsbCBTb0NzLiBUaGUgcmVzcG9uc2UgSSd2
ZSBnb3QgDQpmcm9tIE1hcnZlbGwgdmlhIHRoZWlyIEZBRSBpcyB0aGF0IHRoYXQgdGhlc2UgYWR2
ZXJzZSBidXMgY29uZGl0aW9ucyANCm1ha2UgdGhlIEkyQyBjb250cm9sbGVyIGFzc3VtZSB0aGF0
IGFub3RoZXIgbWFzdGVyIGlzIGFjY2Vzc2luZyB0aGUgYnVzLCANCml0IHdpbGwgdGhlbiB3YWl0
IGZvciB0aGUgb3RoZXIgbWFzdGVyIHRvIGdlbmVyYXRlIGEgU1RPUCBjb25kaXRpb24gDQood2hp
Y2ggbmV2ZXIgaGFwcGVucykuDQoNClRoZWlyIHN1Z2dlc3Rpb24gd2FzIHRvIGNoZWNrIGZvciB0
aGUgYnVzIGJlaW5nIGlkbGUgKFNEQS9TQ0wgaGlnaCkgDQpiZWZvcmUgbGF1bmNoaW5nIHRoZSB0
cmFuc2Zlci4gVGhhdCB3aWxsIGF2b2lkIHRoZSBpc3N1ZSBpZiBTQ0wgb3IgU0RBIA0KYXJlIHNo
b3J0ZWQgdG8gZ3JvdW5kIGJ1dCBkaWRuJ3QgaGVscCB3aXRoIHRoZSBsb2NrdXAgY2F1c2VkIGJ5
IHRoZSANCmluY29tcGxldGVfYWRkcmVzc19waGFzZSBvciBpbmNvbXBsZXRlX3dyaXRlX2J5dGUu
IFRoZWlyIHJlc3BvbnNlIHRvIA0KdGhhdCB3YXMgYmFzaWNhbGx5ICJtZWgsIHByb3RvY29sIGVy
cm9yIi4NCg0KQXMgYSB0ZW1wb3Jhcnkgd29ya2Fyb3VuZCB3ZSBlbmRlZCB1cCBwdXR0aW5nIHRo
ZSBNUFAgaW50byBncGlvIG1vZGUgYW5kIA0KbWFraW5nIHVzZSBvZiB0aGUgaTJjLWdwaW8gYnVz
IGRyaXZlci4gVGhhdCB3b3JrZWQgYnV0IGhhcyBpdCdzIG93biANCmRvd25zaWRlcyB3aGVuIHRo
ZSBDUFUgZ2V0cyBidXN5Lg0KDQpJbml0aWFsbHkgSSB0aG91Z2h0IHRoaXMgYWZmZWN0ZWQgb25s
eSB0aGUgbmV3ZXIgQVJNNjQgb25lcyAoQ045MTMwIGFuZCANCkFDNSkgYnV0IEkgZXZlbnR1YWxs
eSBmb3VuZCB0aGF0IGZyb20gY29tbWl0IGZiZmZlZTc0OTg2YyAoIkFSTTogZHRzOiANCkZpeCBJ
MkMgcmVwZWF0ZWQgc3RhcnQgaXNzdWUgb24gQXJtYWRhLTM4eCIpIHdlJ3ZlIGJlZW4gdXNpbmcg
dGhlIA0KIm1hcnZlbGwsbXY3ODIzMC1hMC1pMmMiIGNvbXBhdGlibGUgc3RyaW5nIG9uIHRoZSBB
cm1hZGEtMzh4IHdoaWNoIGlzIA0KbGlrZWx5IHdoeSBJIGNhbid0IHJlcHJvZHVjZSBpdCBvbiBh
biBBcm1hZGEtMzg1IGJhc2VkIGJvYXJkLiBVc2luZyB0aGF0IA0KY29tcGF0aWJsZSBzdHJpbmcg
dG8gZGlzYWJsZSB0aGUgb2ZmbG9hZCBvbiBteSBBQzUgYmFzZWQgYm9hcmQgYW5kIHRoZSANCkNO
OTEzMC1DUkIgc2VlbXMgdG8gYXZvaWQgdGhlIGlzc3VlIGFzIHdlbGwuDQoNCkkgbmVlZCB0byBk
byBtb3JlIHRlc3RpbmcgYnV0IGl0J3MgbGlrZWx5IHdlJ2xsIHJ1biB3aXRoIHRoYXQgYXMgYSAN
CmNoYW5nZSBmb3Igb3VyIGJvYXJkcy4gSSdtIGFsc28gdGhpbmtpbmcgdGhhdCB0aGUgSTJDIG9m
ZmxvYWQgZmVhdHVyZSBpcyANCm5vdCByZWFsbHkgc3VpdGFibGUgZm9yIGJvYXJkcyB3aGVyZSB0
aGUgSTJDIGJ1cyBpcyBub3QgY29tcGxldGVseSANCnJlbGlhYmxlIChpbiBteSBjYXNlIHRoaXMg
Y29ubmVjdGVkIHRvIFNGUCBjYWdlcyBhbmQgd2UndmUgc2VlbiBhbGwgDQpraW5kcyBvZiB3ZWly
ZCBhbmQgd29uZGVyZnVsIGVycm9ycyBkdWUgdG8gZGlmZmVyZW50IFNGUHMgY2F1c2luZyBzaG9y
dHMgDQpvciBqdXN0IGdlbmVyYWxseSBtaXNiZWhhdmluZykuDQoNCkRvZXMgYW55IG9mIHRoYXQg
c291bmQgbGlrZSB0aGUgaXNzdWUgZnJvbSB0aGUgQTAgQXJtYWRhIFhQPw0KDQpUaGFua3MsDQpD
aHJpcw0K

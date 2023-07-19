Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 928E8758AEC
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jul 2023 03:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbjGSBfy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jul 2023 21:35:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbjGSBfw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Jul 2023 21:35:52 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FF331BCD
        for <linux-i2c@vger.kernel.org>; Tue, 18 Jul 2023 18:35:50 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id F20EA2C034B
        for <linux-i2c@vger.kernel.org>; Wed, 19 Jul 2023 13:35:46 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1689730546;
        bh=nqjEdNP04k09GdRYSCkHya5wPHSKybq9iDjDUlMX+/Q=;
        h=From:To:Subject:Date:From;
        b=m6HrrbYElwRrnOLUFkjzbkm6QrDDKAzuMgyli2bmjuNJYckgUdP2mvVNV7ohZ3hHi
         fow/B4lX6O+sp+hl2Arne1QWZ/pL3RwNlx9DfGc+HIV85rl1uvoM14meby8sj0q0+i
         VPXbJolf2Tbo4wtPCa0IhrVGktwTrNUdyX+hKlGuvX6zyqcX90B/o0Kjgj6ZcaVBBa
         G/cKRVO06bLC8aSF/ukt9CTQOYfdI43XBnNhc1Ea6057fKsbXAP3PhmMmF280HlWNj
         aZFV4bX4qk73FJ47feul8OxrE9/uLkuuz3/+uf0pMVQ3z4TgTTL5M1wgI6By9UOgGX
         ZuaxpwEb3hrBA==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B64b73df20000>; Wed, 19 Jul 2023 13:35:46 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 19 Jul 2023 13:35:46 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.030; Wed, 19 Jul 2023 13:35:46 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Simulating an I2C device
Thread-Topic: Simulating an I2C device
Thread-Index: AQHZueFXrkDjdSD3dkmSq7cstvF7og==
Date:   Wed, 19 Jul 2023 01:35:46 +0000
Message-ID: <405df79f-0c6c-9eed-2635-22a0fa2260d9@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.22.30]
Content-Type: text/plain; charset="utf-8"
Content-ID: <8B6B4A16AA75CA48A84B883A69FDEF1F@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=boIy+3Si c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=ws7JD89P4LkA:10 a=_XVxg8LEKy6U4psh0rUA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10
X-SEG-SpamProfiler-Score: 0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGVsbG8gSTJDIGVudGh1c2lhc3RzLA0KDQpJJ3ZlIGJlZW4gZG9pbmcgc29tZSB0ZXN0aW5nIHdp
dGggdGhlIEkyQyBHUElPIGZhdWx0IGluamVjdGlvbiB3aXRoIGEgDQpSYXNwYmVycnkgUGkgKE1v
ZGVsIDRCKSBjb25uZWN0ZWQgdG8gbXkgYm9hcmQgYW5kIGNhbiBtYWtlIHVzZSBvZiB0aGUgDQpp
bmNvbXBsZXRlX2FkZHJlc3NfcGhhc2UvaW5jb21wbGV0ZV93cml0ZV9ieXRlIHRvIHNpbXVsYXRl
IHNvbWUgZXJyb3JzIA0KYW5kIGNoZWNrIHRoYXQgbXkgYm9hcmQgd2lsbCBkbyB0aGUgSTJDIFNE
QS9TQ0wgcmVjb3ZlcnkuDQoNCk9uZSB0aGluZyBJJ20gaW50ZXJlc3RlZCBpbiBkb2luZyBpcyBj
aGVja2luZyB0aGUgaW1wYWN0IG9mIFNDTCBjbG9jayANCnN0cmV0Y2hpbmcuIEkgdGhpbmsgZm9y
IHRoYXQgSSBjYW4ndCBqdXN0IChhYil1c2UgdGhlIEkyQyBHUElPIA0KY29udHJvbGxlciBJIHBy
b2JhYmx5IG5lZWQgdG8gaGF2ZSB0aGUgUmFzcGJlcnJ5IFBpIGFjdCBhcyBhbiBJMkMgDQpkZXZp
Y2UuIEhhcyBhbnlvbmUgYWxyZWFkeSBhdHRlbXB0ZWQgc29tZXRoaW5nIGxpa2UgdGhpcz8NCg0K
SXQga2luZCBvZiBsb29rcyBsaWtlIGkyYy1zbGF2ZS1lZXByb20uYyBtaWdodCBiZSB1c2FibGUg
Zm9yIHRoaXMgKEknZCANCnByb2JhYmx5IGhhdmUgdG8gZG8gc29tZXRoaW5nIHNwZWNpYWwgdG8g
ZmFrZSBjbG9jayBzdHJldGNoaW5nKS4NCg==

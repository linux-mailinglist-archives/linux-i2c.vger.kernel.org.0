Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57B5E7DAEA3
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Oct 2023 22:47:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbjJ2Vr2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 29 Oct 2023 17:47:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230326AbjJ2Vr1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 29 Oct 2023 17:47:27 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A433D97
        for <linux-i2c@vger.kernel.org>; Sun, 29 Oct 2023 14:47:24 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 33F342C0364;
        Mon, 30 Oct 2023 10:47:22 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1698616042;
        bh=eZXENlaaQ3CIktnuCPH51cVMXhdJRXe+rTUYYumEFLQ=;
        h=From:To:Subject:Date:References:In-Reply-To:From;
        b=dhVIcaMAitFpHdZFl/A0jfIv52brwGbHmfhimwESaeyCgcQ6WbymTuaOu4d1jIlQW
         Zm/IKMeakFfgOHYyfsUnTwYQNXk+/FORhD+NJCS9HXMtcs70ybdz4alHO7RedaXo+i
         9SJ/EqEMWwsJBnKznJ4mTPLPe62retk+Y+jJV32Vo0CiwwKYok1LPOXEWUkSQgXZ7l
         sLWTBKHFGcpITG0ir8RXu7iYAKFgCDS8jBGLo10jXqQ/P1oSX1hPwSQmxlm0ZK2JDJ
         Iy8phT3MAKU6wLk+OnTSbfJORqnm0RNwOGAnTwglMj1EAc+wI2gPevmRZGxaefDZki
         NDcvoixlnLuKQ==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B653ed2ea0000>; Mon, 30 Oct 2023 10:47:22 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.39; Mon, 30 Oct 2023 10:47:22 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with Microsoft
 SMTP Server (TLS) id 15.0.1497.48; Mon, 30 Oct 2023 10:47:21 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.039; Mon, 30 Oct 2023 10:47:21 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Wolfram Sang <wsa@kernel.org>,
        Aryan Srivastava <Aryan.Srivastava@alliedtelesis.co.nz>,
        "rric@kernel.org" <rric@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c:thunderx:Add disabled node check
Thread-Topic: [PATCH] i2c:thunderx:Add disabled node check
Thread-Index: AQHZs7pjS3RbZjoNTE+zaC8ee87FZrBg1J6AgABM/IA=
Date:   Sun, 29 Oct 2023 21:47:21 +0000
Message-ID: <82d9d348-f687-4be9-962a-d7d745236d45@alliedtelesis.co.nz>
References: <20230711054147.506437-1-aryan.srivastava@alliedtelesis.co.nz>
 <ZT6SVZNUT/KPucdI@shikoro>
In-Reply-To: <ZT6SVZNUT/KPucdI@shikoro>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.22.30]
Content-Type: text/plain; charset="utf-8"
Content-ID: <83AF7CF02DEEE5499FF29757B9FC8D4D@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=L6ZjvNb8 c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=bhdUkHdE2iEA:10 a=mEZQYA9_Tu11ni790zkA:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpPbiAzMC8xMC8yMyAwNjoxMSwgV29sZnJhbSBTYW5nIHdyb3RlOg0KPiBPbiBUdWUsIEp1bCAx
MSwgMjAyMyBhdCAwNTo0MTo0NlBNICsxMjAwLCBBcnlhbiBTcml2YXN0YXZhIHdyb3RlOg0KPj4g
QWRkIGNoZWNrIGZvciBkaXNhYmxlZCBub2Rlcy4gVGhlc2Ugbm9kZXMgc2hvdWxkIG5vdCBiZSBw
cm9iZWQuIENhbg0KPj4gcmVzdWx0IGluIGxvZ2dpbmcgZm9yIEhXIHdoaWNoIGlzIG5vdCBwcmVz
ZW50Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEFyeWFuIFNyaXZhc3RhdmE8YXJ5YW4uc3JpdmFz
dGF2YUBhbGxpZWR0ZWxlc2lzLmNvLm56Pg0KPiBJIGFtIGNvbmZ1c2VkLiBUaGlzIGlzIGEgUENJ
IGRyaXZlciwgbm8/IFdoeSBzaG91bGQgd2UgZGVhbCB3aXRoIERUDQo+IHNldHRpbmdzIGhlcmU/
DQoNCkl0IGlzIGEgUENJIGRyaXZlciBidXQgdGhlIElQIGJsb2NrIGlzIGluY2x1ZGVkIG9uIFNv
Q3MgbGlrZSB0aGUgQ045NjcwIA0KYW5kIG5vdCBhbGwgaGFyZHdhcmUgZGVzaWducyBtYWtlIHVz
ZSBvZiBhbGwgdGhlIEkyQyBpbnRlcmZhY2VzIHRoYXQgdGhlIA0KSVAgYmxvY2sgc3VwcG9ydHMu
DQo=

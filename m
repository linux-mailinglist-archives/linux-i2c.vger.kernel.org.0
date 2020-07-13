Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B37321CD4C
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jul 2020 04:39:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbgGMCjc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Jul 2020 22:39:32 -0400
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205]:37936 "EHLO
        smtp2207-205.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725892AbgGMCjc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Jul 2020 22:39:32 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1203083|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.033401-0.000584162-0.966015;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03301;MF=frank@allwinnertech.com;NM=1;PH=DW;RN=32;RT=32;SR=0;TI=W4_5899425_DEFAULT_0A93261B_1594607767001_o7001c677m;
Received: from WS-web (frank@allwinnertech.com[W4_5899425_DEFAULT_0A93261B_1594607767001_o7001c677m]) by e01l07384.eu6 at Mon, 13 Jul 2020 10:39:25 +0800
Date:   Mon, 13 Jul 2020 10:39:25 +0800
From:   "Frank Lee" <frank@allwinnertech.com>
To:     "Maxime Ripard" <maxime@cerno.tech>
Cc:     "robh+dt" <robh+dt@kernel.org>, "wens" <wens@csie.org>,
        "mturquette" <mturquette@baylibre.com>, "sboyd" <sboyd@kernel.org>,
        "gregory.clement" <gregory.clement@bootlin.com>,
        "tglx" <tglx@linutronix.de>, "jason" <jason@lakedaemon.net>,
        "maz" <maz@kernel.org>,
        "srinivas.kandagatla" <srinivas.kandagatla@linaro.org>,
        "linus.walleij" <linus.walleij@linaro.org>,
        "anarsoul" <anarsoul@gmail.com>,
        "tiny.windzz" <tiny.windzz@gmail.com>,
        "rui.zhang" <rui.zhang@intel.com>,
        "daniel.lezcano" <daniel.lezcano@linaro.org>,
        "amit.kucheria" <amit.kucheria@verdurent.com>,
        "lee.jones" <lee.jones@linaro.org>,
        "p.zabel" <p.zabel@pengutronix.de>, "clabbe" <clabbe@baylibre.com>,
        "icenowy" <icenowy@aosc.io>, "megous" <megous@megous.com>,
        "stefan" <stefan@olimex.com>, "bage" <bage@linutronix.de>,
        "devicetree" <devicetree@vger.kernel.org>,
        "linux-arm-kernel" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel" <linux-kernel@vger.kernel.org>,
        "linux-clk" <linux-clk@vger.kernel.org>,
        "linux-i2c" <linux-i2c@vger.kernel.org>,
        "linux-gpio" <linux-gpio@vger.kernel.org>,
        "linux-pm" <linux-pm@vger.kernel.org>,
        "=?UTF-8?B?6buE54OB55Sf?=" <huangshuosheng@allwinnertech.com>,
        "=?UTF-8?B?5p2O5YuH?=" <liyong@allwinnertech.com>
Reply-To: "Frank Lee" <frank@allwinnertech.com>
Message-ID: <5dd1b52a-811d-4837-a048-502dd975ad09.frank@allwinnertech.com>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2MyAwMC8xNl0gQWxsd2lubmVyIEExMDAgSW5pdGlhbCBzdXBwb3J0?=
X-Mailer: [Alimail-Mailagent][W4_5899425][DEFAULT][Chrome]
MIME-Version: 1.0
References: <20200708071942.22595-1-frank@allwinnertech.com>,<20200710142841.7ue3xtracowexjct@gilmour.lan>
In-Reply-To: <20200710142841.7ue3xtracowexjct@gilmour.lan>
x-aliyun-mail-creator: W4_5899425_DEFAULT_LjMTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzU2LjAuMjkyNC44NyBTYWZhcmkvNTM3LjM2TM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SEksCgo+PiAgIGR0LWJpbmRpbmdzOiBpcnE6IHN1bjdpLW5taTogZml4IGR0LWJpbmRpbmcgZm9y
IGE4MCBubWkKPj4gICBkdC1iaW5kaW5nczogaXJxOiBzdW43aS1ubWk6IEFkZCBiaW5kaW5nIGZv
ciBBMTAwJ3MgTk1JIGNvbnRyb2xsZXIKPgo+aXQgZG9lc24ndCBsb29rIGxpa2UgdGhvc2UgcGF0
Y2hlcyB3ZW50IHRocm91Z2g/CgpEdWUgdG8gc2VuZGluZyB0b28gbWFueSBlbWFpbHMgYXQgb25j
ZSwgaXQgc2VlbXMgdGhhdCBzb21lIGVtYWlscyBoYXZlCmJlZW4gZmlsdGVyZWQgYnkgdGhlIG1h
aWxib3gsIGFuZCBJIGp1c3QgcmVpc3N1ZWQgdGhlbS4KCj4KPj4gICBkdC1iaW5kaW5nczogaTJj
OiBtdjY0eHh4OiBBZGQgY29tcGF0aWJsZSBmb3IgdGhlIEExMDAgaTJjIG5vZGUuCj4+ICAgYXJt
NjQ6IGFsbHdpbm5lcjogQTEwMDogYWRkIHRoZSBiYXNpY2FsIEFsbHdpbm5lciBBMTAwIERUU0kg
ZmlsZQo+PiAgIGR0LWJpbmRpbmdzOiBhcm06IHN1bnhpOiBBZGQgQWxsd2lubmVyIEExMDAgUGVy
ZjEgQm9hcmQgYmluZGluZ3MKPj4gICBhcm02NDogYWxsd2lubmVyOiBBMTAwOiBhZGQgc3VwcG9y
dCBmb3IgQWxsd2lubmVyIFBlcmYxIGJvYXJkCj4KPk9uIGEgbW9yZSBnZW5lcmFsIHRvcGljLCB3
aGljaCBib290bG9hZGVyIGhhdmUgeW91IHVzZWQgdG8gdGVzdCB0aGlzPwo+VGhlIG9uZSBmcm9t
IEFsbHdpbm5lcidzIEJTUCBJIGFzc3VtZT8KClllYWgsIHRoZXJlIGlzIG5vIGJyaW5ndXAgb24g
dGhlIG1haW5saW5lIEJvb3RMb2FkZXIgeWV0LgoKSWYgbm90aGluZyBoYXBwZW5zLCB0aGUgbmV4
dCBlZGl0aW9uIHdpbGwgYmUgcmVsZWFzZWQgdG9kYXkuCldlIGhvcGUgdGhhdCBBMTAwIHdpbGwg
YmUgaW50ZWdyYXRlZCBhcyBzb29uIGFzIHBvc3NpYmxlLgoKTUJSLApZYW5ndGFv

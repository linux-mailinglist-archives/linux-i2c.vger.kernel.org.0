Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF3A821CD55
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jul 2020 04:41:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgGMClb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Jul 2020 22:41:31 -0400
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205]:41409 "EHLO
        smtp2207-205.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725892AbgGMClb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Jul 2020 22:41:31 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.2188719|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_social|0.0755836-0.0169961-0.90742;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03306;MF=frank@allwinnertech.com;NM=1;PH=DW;RN=33;RT=33;SR=0;TI=W4_5899425_DEFAULT_0A932640_1594608045491_o7001c853p;
Received: from WS-web (frank@allwinnertech.com[W4_5899425_DEFAULT_0A932640_1594608045491_o7001c853p]) by e01l07382.eu6 at Mon, 13 Jul 2020 10:41:23 +0800
Date:   Mon, 13 Jul 2020 10:41:23 +0800
From:   "Frank Lee" <frank@allwinnertech.com>
To:     "Corentin Labbe" <clabbe.montjoie@gmail.com>
Cc:     "robh+dt" <robh+dt@kernel.org>, "mripard" <mripard@kernel.org>,
        "wens" <wens@csie.org>, "mturquette" <mturquette@baylibre.com>,
        "sboyd" <sboyd@kernel.org>,
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
        "linux-pm" <linux-pm@vger.kernel.org>,
        "=?UTF-8?B?5p2O5YuH?=" <liyong@allwinnertech.com>,
        "linux-kernel" <linux-kernel@vger.kernel.org>,
        "linux-gpio" <linux-gpio@vger.kernel.org>,
        "=?UTF-8?B?6buE54OB55Sf?=" <huangshuosheng@allwinnertech.com>,
        "linux-i2c" <linux-i2c@vger.kernel.org>,
        "linux-clk" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel" <linux-arm-kernel@lists.infradead.org>
Reply-To: "Frank Lee" <frank@allwinnertech.com>
Message-ID: <1ada776b-f313-4444-bcdc-61f16973ea2e.frank@allwinnertech.com>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2MyAwMC8xNl0gQWxsd2lubmVyIEExMDAgSW5pdGlhbCBzdXBwb3J0?=
X-Mailer: [Alimail-Mailagent][W4_5899425][DEFAULT][Chrome]
MIME-Version: 1.0
References: <20200708071942.22595-1-frank@allwinnertech.com>,<20200708074547.GA19609@Red>
In-Reply-To: <20200708074547.GA19609@Red>
x-aliyun-mail-creator: W4_5899425_DEFAULT_LjMTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzU2LjAuMjkyNC44NyBTYWZhcmkvNTM3LjM2TM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBPbiBXZWQsIEp1bCAwOCwgMjAyMCBhdCAwMzoxOToyNlBNICswODAwLCBGcmFuayBMZWUgd3Jv
dGU6Cj4+ICBUaGlzIHBhdGNoIHNldCBhZGRzIGluaXRpYWwgc3VwcG9ydCBmb3IgYWxsd2lubmVy
IGExMDAgc29jLAo+PiAgd2hpY2ggaXMgYSA2NC1iaXQgdGFibGV0IGNoaXAuCj4gPiAKPiAKPiBI
ZWxsbwo+IAo+IERvZXMgYSBwcm9kdWN0IGFscmVhZHkgZXhpc3RzIHdpdGggaXQgPyBJIGNvdWxk
bnQgZm91bmQgYW55Lgo+IERvZXMgYSBkYXRhc2hlZXQgaXMgYXZhaWxsYWJsZSA/Cj4gCgpUaGUg
cHJvZHVjdCBpcyBzdGlsbCBpbiBkZXZlbG9wbWVudCwgQTEzMyBpcyBhY3R1YWxseSBhIGhpZ2gg
cGVyZm9ybWFuY2UgdmVyc2lvbiBvZiBBMTAwLgoKWWFuZ3Rhbw==

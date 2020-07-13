Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC00D21CD3C
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jul 2020 04:32:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbgGMCcr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Jul 2020 22:32:47 -0400
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205]:39925 "EHLO
        smtp2207-205.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726523AbgGMCcr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Jul 2020 22:32:47 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.3801421|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.491549-0.0395456-0.468906;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03297;MF=frank@allwinnertech.com;NM=1;PH=DW;RN=32;RT=32;SR=0;TI=W4_5899425_DEFAULT_0AB1015F_1594607535272_o7001c3r;
Received: from WS-web (frank@allwinnertech.com[W4_5899425_DEFAULT_0AB1015F_1594607535272_o7001c3r]) by e01l07423.eu6 at Mon, 13 Jul 2020 10:32:39 +0800
Date:   Mon, 13 Jul 2020 10:32:39 +0800
From:   "Frank Lee" <frank@allwinnertech.com>
To:     "=?UTF-8?B?T25kxZllaiBKaXJtYW4=?=" <megous@megous.com>,
        "robh+dt" <robh+dt@kernel.org>, "wens" <wens@csie.org>,
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
        "icenowy" <icenowy@aosc.io>, "stefan" <stefan@olimex.com>,
        "bage" <bage@linutronix.de>,
        "devicetree" <devicetree@vger.kernel.org>,
        "linux-pm" <linux-pm@vger.kernel.org>,
        "=?UTF-8?B?5p2O5YuH?=" <liyong@allwinnertech.com>,
        "linux-kernel" <linux-kernel@vger.kernel.org>,
        "linux-gpio" <linux-gpio@vger.kernel.org>,
        "=?UTF-8?B?6buE54OB55Sf?=" <huangshuosheng@allwinnertech.com>,
        "linux-i2c" <linux-i2c@vger.kernel.org>,
        "linux-clk" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel" <linux-arm-kernel@lists.infradead.org>,
        "Maxime Ripard" <maxime@cerno.tech>
Reply-To: "Frank Lee" <frank@allwinnertech.com>
Message-ID: <9e4f4ebf-77ec-4fb5-902f-1e2a7c4b0f1d.frank@allwinnertech.com>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2MyAwNC8xNl0gZHQtYmluZGluZ3M6IHBpbmN0cmw6IHN1bnhpOiBtYWtl?=
  =?UTF-8?B?IGdwaW8gYmFua3Mgc3VwcGxpZXMgcmVxdWlyZWQ=?=
X-Mailer: [Alimail-Mailagent][W4_5899425][DEFAULT][Chrome]
MIME-Version: 1.0
References: <20200708071942.22595-1-frank@allwinnertech.com> <20200708071942.22595-5-frank@allwinnertech.com> <20200709171713.tutnlchji4e6i5pv@core.my.home>,<20200710123718.mrvtk6rzkfuno5kn@gilmour.lan>
In-Reply-To: <20200710123718.mrvtk6rzkfuno5kn@gilmour.lan>
x-aliyun-mail-creator: W4_5899425_DEFAULT_LjMTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzU2LjAuMjkyNC44NyBTYWZhcmkvNTM3LjM2TM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

TWF5YmUgd2UgcHV0IHRoaXMgd29yayBiYWNrd2FyZHMgYW5kIGxldCBhMTAwIGpvaW4gdGhlIG1h
aW5saW5lIGFzIHNvb24gYXMgcG9zc2libGUu

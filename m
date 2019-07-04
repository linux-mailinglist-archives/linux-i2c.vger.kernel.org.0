Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 267FD5FC0A
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2019 18:43:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbfGDQno (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 4 Jul 2019 12:43:44 -0400
Received: from ns.iliad.fr ([212.27.33.1]:40418 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725887AbfGDQno (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 4 Jul 2019 12:43:44 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 1CA612077F;
        Thu,  4 Jul 2019 18:43:42 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id A205820701;
        Thu,  4 Jul 2019 18:43:39 +0200 (CEST)
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Peter Korsgaard <peter.korsgaard@barco.com>
Cc:     I2C <linux-i2c@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: Generic get_something from an i2c_client
Message-ID: <07aa1229-2b67-e191-5740-70e6ed2a8ce3@free.fr>
Date:   Thu, 4 Jul 2019 18:43:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Thu Jul  4 18:43:42 2019 +0200 (CEST)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

In media drivers, TS drivers typically hard-code their front-end (demod and tuner)
init by loading the modules themselves.

I feel this is not a good solution for SoCs, where the TS HW might be on the SoC,
and the front-end be on the board. So we may have different front-ends for
different boards, and the driver would have to hard-code all of them.

Am I making sense?

Here's an example of what I mean:
https://elixir.bootlin.com/linux/latest/source/drivers/media/usb/dvb-usb-v2/dvbsky.c#L466

I've been working on defining the demod in DT, and having a phandle
to the demod in the TSIF node.

I've got everything working like I had hoped, but I have many ugly hacks.

The TSIF driver needs to register the frontend, which is created in
the demod driver.

So I have:

	struct device_node *toto = of_parse_phandle(np, "demod", 0);
	if (!toto) panic("of_parse_phandle");
	struct i2c_client *demod = of_find_i2c_device_by_node(toto);
	if (!demod) panic("of_find_i2c_device_by_node");
	printk("\tdemod=%px\n", demod);
	struct dvb_frontend *get_fe(struct i2c_client *client);
	my_dvb_frontend = get_fe(demod);

The problem is get_fe(). It needs to be a call-back, so that every
demod can implement his own version. But only a few i2c_client's
have a dvb_frontend to return.

Could we have a generic void *get_something() callback in struct i2c_client?
(Seems like the wrong place)

How can I solve this conundrum?

Maybe look above i2c, in struct device?

Regards.


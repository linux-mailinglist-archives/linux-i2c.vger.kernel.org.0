Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D15A2DA55D
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2019 08:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389053AbfJQGOZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Oct 2019 02:14:25 -0400
Received: from mail-qt1-f171.google.com ([209.85.160.171]:43651 "EHLO
        mail-qt1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731726AbfJQGOZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Oct 2019 02:14:25 -0400
Received: by mail-qt1-f171.google.com with SMTP id t20so1904183qtr.10
        for <linux-i2c@vger.kernel.org>; Wed, 16 Oct 2019 23:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=SSycC+6FLXhjLvO+eUNuIjWKaeeqP5Qat7UwzKeLNrc=;
        b=Q+5CxomMgCIuC811bGWVLqai3qJaMmwh0GRCQJhvQ6vVu8IIFArRU0cpmmsnmN/ass
         uhaeYa6PoijW/wlmpLyzkIwDPnypt7XyezWbs3c3AIvUXLkfbGjE+fQfj1dwf6B+Q1s9
         aEbk4TmWXzVivz7KRfiQUdTyY0Hk519+pctLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=SSycC+6FLXhjLvO+eUNuIjWKaeeqP5Qat7UwzKeLNrc=;
        b=cp0o/nWzfR5ossr9YFFkCoJEUjsl0wD8zwWLXMQ1CJ0xGE7tx129rgZMtQjulkOar0
         IPfPvnOEKouM77eK7tTzAOyWwvxq9RZQxwPe2Burrasn2fuqe6963/T5otwfSpqAJkrB
         ZCFeHZ9BT2UmXFESm2ZQDSj/8aZaa/TTbnYuMFMlhAe5SDxf15K51dPCmamMw6/20ALs
         AtUYizOr61hBmraMApK34D1lloA/9AwDUachjfG0VzXHncdfxRt6N4TY+nCffTSJSKvx
         wWgGud1FrqA0Aw0R0OS+bLRDekQon+sStrWLNgSGYE+zoWCqVq2ep+VcQqufybFuTQKp
         JnKw==
X-Gm-Message-State: APjAAAXNWkEvleS5e/9wLVqjJMRN4vD1YgV5amFN/iKV4jPAkukHausl
        LtvzvPFMji+SfQtkZ4PHT+QAszFkBMv/qiGAFjA=
X-Google-Smtp-Source: APXvYqybdSTvJP4mqxmA02QqX34n8BkIiZfZkjF04g5uxjmwq02WKO6wV9i3aSGwmn5+EmR6PpqWfL4/8c2snFqWktU=
X-Received: by 2002:ac8:1207:: with SMTP id x7mr2116697qti.255.1571292863733;
 Wed, 16 Oct 2019 23:14:23 -0700 (PDT)
MIME-Version: 1.0
From:   Joel Stanley <joel@jms.id.au>
Date:   Thu, 17 Oct 2019 06:14:12 +0000
Message-ID: <CACPK8XdqFkPgCQcgpM5C_YwfJ86Lmk=hG5zTcfbCDCMncXCJMg@mail.gmail.com>
Subject: AST2600 i2c irq issue
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Brendan Higgins <brendanhiggins@google.com>
Cc:     linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        linux-i2c@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
        Eddie James <eajames@linux.ibm.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I have been doing bringup of the ast2600. It contains i2c buses that
are register compatible with the ast2500, and I am running them
without buffer or DMA mode. This is with v5.3.6, with no patches other
than adding the compatible string:

--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -938,6 +938,10 @@ static const struct of_device_id
aspeed_i2c_bus_of_table[] = {
                .compatible = "aspeed,ast2500-i2c-bus",
                .data = aspeed_i2c_25xx_get_clk_reg_val,
        },
+       {
+               .compatible = "aspeed,ast2600-i2c-bus",
+               .data = aspeed_i2c_25xx_get_clk_reg_val,
+       },
        { },
 };


I see this behavior:

[   20.981417] aspeed-i2c-bus 1e78a280.i2c-bus: master failed to RX
[   20.988259] aspeed-i2c-bus 1e78a280.i2c-bus: irq handled != irq.
expected 0x00000014, but was 0x00000010
[   22.451265] aspeed-i2c-bus 1e78a200.i2c-bus: master failed to STOP.
irq_status:0x0
[   22.459909] aspeed-i2c-bus 1e78a200.i2c-bus: irq handled != irq.
expected 0x00000010, but was 0x00000000
[   22.470604] aspeed-i2c-bus 1e78a200.i2c-bus: irq handled != irq.
expected 0x00000011, but was 0x00000000
[   29.156951] aspeed-i2c-bus 1e78a280.i2c-bus: master failed to STOP.
irq_status:0x0
[   29.165601] aspeed-i2c-bus 1e78a280.i2c-bus: irq handled != irq.
expected 0x00000010, but was 0x00000000

It happens on boot, and can also be triggered by placing load on the
system. In particular, if I copy a large amount of data to the flash.

The IRQs are being served on one of the CPUs:

 29:          0          0     GIC-0 142 Level     1e78a080.i2c-bus
 30:          0          0     GIC-0 143 Level     1e78a100.i2c-bus
 31:          0          0     GIC-0 144 Level     1e78a180.i2c-bus
 32:     302596          0     GIC-0 145 Level     1e78a200.i2c-bus
 33:     197340          0     GIC-0 146 Level     1e78a280.i2c-bus
 34:     196900          0     GIC-0 147 Level     1e78a300.i2c-bus
 35:          0          0     GIC-0 149 Level     1e78a400.i2c-bus
 36:       2199          0     GIC-0 151 Level     1e78a500.i2c-bus
 37:          0          0     GIC-0 152 Level     1e78a580.i2c-bus
 38:       3407          0     GIC-0 153 Level     1e78a600.i2c-bus
 39:          0          0     GIC-0 154 Level     1e78a680.i2c-bus
 40:          0          0     GIC-0 155 Level     1e78a700.i2c-bus

Following a hunch, I booted the system with SMP disabled (it's a dual
core part). The issue did not reproduce.

This suggests the driver is lacking locking. I am yet to do any
detailed debugging.

Have you seen any behavior like this?

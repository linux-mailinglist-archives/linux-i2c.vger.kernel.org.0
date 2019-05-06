Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D49701472C
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2019 11:06:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbfEFJGY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 May 2019 05:06:24 -0400
Received: from mx1.mailbox.org ([80.241.60.212]:28644 "EHLO mx1.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725890AbfEFJGY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 6 May 2019 05:06:24 -0400
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx1.mailbox.org (Postfix) with ESMTPS id 0D54C4DD90;
        Mon,  6 May 2019 11:06:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de [80.241.56.117]) (amavisd-new, port 10030)
        with ESMTP id o0aMD5JLVLzc; Mon,  6 May 2019 11:06:07 +0200 (CEST)
Subject: Re: [PATCH] i2c: mt7621: Add MediaTek MT7621/7628/7688 I2C driver
To:     Jan Breuer <jan.breuer@jaybee.cz>
Cc:     linux-i2c@vger.kernel.org, Steven Liu <steven_liu@mediatek.com>,
        John Crispin <john@phrozen.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20190503130602.13144-1-sr@denx.de>
 <CAEEQaa87Z1nYVu06AzGKw5+G07AG73LumiaH9oUB26wz6B6V9g@mail.gmail.com>
From:   Stefan Roese <sr@denx.de>
Message-ID: <63e5c143-0803-458d-7e63-57f17f64bd0e@denx.de>
Date:   Mon, 6 May 2019 11:06:05 +0200
MIME-Version: 1.0
In-Reply-To: <CAEEQaa87Z1nYVu06AzGKw5+G07AG73LumiaH9oUB26wz6B6V9g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jan,

On 03.05.19 17:03, Jan Breuer wrote:
> On Fri 3. 5. 2019 at 15:06 Stefan Roese wrote:
> 
>     This patch adds a driver for the I2C controller found on the MediaTek
>     MT7621/7628/7688 SoC's. The base version of this driver was done by
>     Steven Liu (according to the copyright and MODULE_AUTHOR lines). It
>     can be found in the OpenWRT repositories (v4.14 at the time I looked).
> 
>     The base driver had many issues, which are disccussed here:
> 
>     https://en.forum.labs.mediatek.com/t/openwrt-15-05-loads-non-working-i2c-kernel-module-for-mt7688/1286/3
> 
>      From this link an enhanced driver version (complete rewrite, mayor
>     changes: support clock stretching, repeated start, ACK handling and
>     unlimited message length) from Jan Breuer can be found here:
> 
>     https://gist.github.com/j123b567/9b555b635c2b4069d716b24198546954
> 
>     This patch now adds this enhanced I2C driver to mainline.
> 
>     Changes by Stefan Roese for upstreaming:
>     - Add devicetree bindings
>     - checkpatch clean
>     - Use module_platform_driver()
>     - Minor cosmetic enhancements
> 
>     Signed-off-by: Stefan Roese <sr@denx.de <mailto:sr@denx.de>>
> 
> 
> Hi Stefan,
> 
> Thank you for this mainlining affort.
> 
> We are using this driver in production for a while and there is at
> least one issue.
> SDA and SCL should be in open-drain mode and not in push-pull.
> SM0CTL0_ODRAIN bit is inverted in meaning so it should not be set
> during initialization in mtk_i2c_reset to configure output as open-drain.
> Here is relevant part of documentation of this bit from datasheet.
> 
> SM0CTL0 Serial interface master 0 control 0 register
> Bit 31 SM0_ODRAIN Open-drain output configuration
> 0: When SIF output is logic 1, the output is pulled high by outer#
> devices. SIF output is open-drained.
> 1: When SIF output is logic 1, the output is pulled high by SIF
> master 0.

Thanks for the update here. I'll update the ODRAIN bit configuration
in v2 of this patch.

Might I ask you how you detected this issue? Did you experience some
problems in the I2C communication on your target with the push-pull
configuration?

Thanks,
Stefan

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C0E1349B8
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2019 16:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727340AbfFDODV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Jun 2019 10:03:21 -0400
Received: from mx2.mailbox.org ([80.241.60.215]:36496 "EHLO mx2.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727041AbfFDODU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 4 Jun 2019 10:03:20 -0400
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx2.mailbox.org (Postfix) with ESMTPS id 5DB8AA01A8;
        Tue,  4 Jun 2019 16:03:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de [80.241.56.123]) (amavisd-new, port 10030)
        with ESMTP id Hn2ZZs0CSD_D; Tue,  4 Jun 2019 16:03:12 +0200 (CEST)
Subject: Re: [PATCH 2/2 v3] i2c: mt7621: Add MediaTek MT7621/7628/7688 I2C
 driver
To:     Jan Breuer <jan.breuer@jaybee.cz>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        John Crispin <john@phrozen.org>,
        =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20190604113407.8948-1-sr@denx.de>
 <20190604113407.8948-2-sr@denx.de>
 <CAEEQaa9D0cWFNa_MtiGQ5hD4Z+0vG5ftV6etEr-dRMAW2AA1yQ@mail.gmail.com>
From:   Stefan Roese <sr@denx.de>
Message-ID: <0b60c94f-4a06-90f8-cdb7-1cbef090bd3a@denx.de>
Date:   Tue, 4 Jun 2019 16:03:11 +0200
MIME-Version: 1.0
In-Reply-To: <CAEEQaa9D0cWFNa_MtiGQ5hD4Z+0vG5ftV6etEr-dRMAW2AA1yQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jan,

On 04.06.19 15:00, Jan Breuer wrote:
> Hi Stefan,
> 
>> +#define MT76XX_I2C_INPUT_CLOCK 40000000
> 
> This is peripheral clock and should be reachable by devm_clk_get() and
> later clk_get_rate() should give value similar to
> MT76XX_I2C_INPUT_CLOCK.

Unfortunately not (yet) in mainline Linux.

> I don't have currently recent enough kernel to test it or prove it,
> but I see this in openwrt I2C driver for this platform
> https://github.com/openwrt/openwrt/blob/master/target/linux/ramips/patches-4.14/0045-i2c-add-mt7621-driver.patch

Yes, its available in the OpenWRT v4.14 tree, but not in mainline
Linux (AFAICT).

I might try to make some time to add this clock driver for these
SoC's. But I would prefer to use the hardcoded define in this
driver for now, to not block its usage in mainline any longer.

Thanks,
Stefan

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80D1F731243
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jun 2023 10:35:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244638AbjFOIem (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Jun 2023 04:34:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243853AbjFOIe3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Jun 2023 04:34:29 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E80031FEB
        for <linux-i2c@vger.kernel.org>; Thu, 15 Jun 2023 01:34:27 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:673e:8944:bfe9:3a7f])
        by andre.telenet-ops.be with bizsmtp
        id 9LaQ2A0071lHpae01LaQuP; Thu, 15 Jun 2023 10:34:24 +0200
Received: from geert (helo=localhost)
        by ramsan.of.borg with local-esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1q9iQx-008kr0-UL;
        Thu, 15 Jun 2023 10:34:23 +0200
Date:   Thu, 15 Jun 2023 10:34:23 +0200 (CEST)
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
cc:     =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, kernel@pengutronix.de,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: sprd: Delete i2c adapter in .remove's error path
In-Reply-To: <CAHp75VeMO+0VisrQXTGj9yuGz23jMaX8G0PDPUhhD1bMJ4ji2w@mail.gmail.com>
Message-ID: <6df0cbb6-19ed-8a5e-376-9222688d8953@linux-m68k.org>
References: <20230309095819.2569646-1-u.kleine-koenig@pengutronix.de> <CAHp75VeMO+0VisrQXTGj9yuGz23jMaX8G0PDPUhhD1bMJ4ji2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1560378384-1686818063=:2086722"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1560378384-1686818063=:2086722
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

 	Hi Andy,

Just noticed this patch is being backported to stable...

On Thu, 9 Mar 2023, Andy Shevchenko wrote:
> On Thu, Mar 9, 2023 at 11:58 AM Uwe Kleine-König
> <u.kleine-koenig@pengutronix.de> wrote:
>>
>> If pm runtime resume fails the .remove callback used to exit early. This
>> resulted in an error message by the driver core but the device gets
>> removed anyhow. This lets the registered i2c adapter stay around with an
>> unbound parent device.
>>
>> So only skip clk disabling if resume failed, but do delete the adapter.
>
> Still worrisome. I would disable clock independently, but the questions are:
> 1) why the heck we need this dance with PM runtime for disabling clocks;

Exactly. There is no point in calling pm_runtime_get_sync() and
pm_runtime_put_noidle() here, as no hardware is accessed in between,
is it?

> 2) why can't we use devm_clk_get_enabled() or so in the probe;
> ?

Because that helper didn't exist when this driver was introduced ;-)

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
--8323329-1560378384-1686818063=:2086722--

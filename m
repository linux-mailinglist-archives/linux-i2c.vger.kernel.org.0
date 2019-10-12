Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50610D528D
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Oct 2019 23:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729746AbfJLVNC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 12 Oct 2019 17:13:02 -0400
Received: from mail.kmu-office.ch ([178.209.48.109]:34324 "EHLO
        mail.kmu-office.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729169AbfJLVNC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 12 Oct 2019 17:13:02 -0400
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
        by mail.kmu-office.ch (Postfix) with ESMTPSA id 9CF0C5C0D8D;
        Sat, 12 Oct 2019 23:12:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
        t=1570914779;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gIkv0SaPbTuXDwxN5yBGLCHnoOAyhpafhDmeYLdT40M=;
        b=boUGA+1v2P+rA+KnDQnOexuWIq2zHfvhbXSWs9uXg7YEmVwOy3cMB+kjR11NBDpRUGe6wy
        TObFJ7lpopC+pF3O7ZEBCoCZRaqeaaYxM8PkNAI1wu2GCO5abUqPT6SFnaaVyK2I0AbTVG
        gEiCIl6aCPYQgeo+9/7Rz9Tz/GgXIR4=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Date:   Sat, 12 Oct 2019 23:12:59 +0200
From:   Stefan Agner <stefan@agner.ch>
To:     Stefan Lengfeld <contact@stefanchrist.eu>
Cc:     linux-i2c@vger.kernel.org, wsa+renesas@sang-engineering.com,
        linux-i2c-owner@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] Re: i2c: core: introduce atomic transfers
In-Reply-To: <20190415213432.8972-1-contact@stefanchrist.eu>
References: <20190403124019.8947-1-wsa+renesas@sang-engineering.com>
 <20190415213432.8972-1-contact@stefanchrist.eu>
Message-ID: <d9005c72243eff38b6c4223f0199e02b@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Stefan,

On 2019-04-15 23:34, Stefan Lengfeld wrote:
> Hi Wolfram,
> 
> the following RFC patches are based on your branch
> 
>> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/i2c/atomic_xfer
> 
> I have used them to test your changes and my usecase on my available
> hardware setup: an i.MX6 Solo (phyCORE-i.MX6).
> 
> In general: Great stuff! And I vote for inclusion :-)
> 
> Even so this series does not tackle all problems at once, it's a step
> into the right direction to support reboot handlers using an external
> PMIC via I2C.

We have the same problem on our Colibri iMX7 board. Wolfram's patches
made it already upstream, I applied your patches successfully on 5.4-rc1
and rebooting via I2C seems to work fine now! Hence we would like to see
master_xfer_atomic support for the i.MX I2C driver too.

Are you continuing working on this patch set?

--
Stefan

> 
> Some additional comments below and also in-line in your posted patches.
> 
> 
>> a) we decided to respect the current locking scheme and to not give atomic
>> transfers a priority. The code needed for that would have been either
>> incomplete or very invasive. And we cannot guarantee successful transfers
>> anyhow. See [1] for the discussion and other write-ups for design choices.
> 
> Ack. I can just confirm that the mentioned locking issues are a real. I
> could not reproduce them on my single core ARM SoC, but on a multi core
> ARM system, e.g. the CPU frequency scaler is maybe holding the I2C
> transfer mutex, while the system is going to restart.
> 
> Just for reference: I 'solved' this by augmenting, read 'hacked', the
> locking schema, so a single device driver can block the whole I2C bus
> for itself and cause all other transfers to fail at once. See
> 
> https://www.spinics.net/lists/linux-i2c/msg25399.html
> 
> A real and good solution, as you said, is very invasive and must be
> thought out carefully.
> 
> 
> The appended patches are not meant for inclusion or review. They are
> just for reference of my testing setup.
> 
> Kind regards,
> Stefan Lengfeld
>   
> 
> Stefan Christ (1):
>   ARM: dts: phyboard-mira-dl: rely on PMIC for reboot and watchdog
> 
> Stefan Lengfeld (2):
>   watchdog: da9062: avoid regmap in restart handler
>   i2c: imx: implement master_xfer_atomic callback
> 
>  .../boot/dts/imx6dl-phytec-mira-rdk-nand.dts  |   8 ++
>  drivers/i2c/busses/i2c-imx.c                  | 128 +++++++++++++-----
>  drivers/mfd/da9062-core.c                     |   1 +
>  drivers/watchdog/da9062_wdt.c                 |  17 ++-
>  include/linux/mfd/da9062/core.h               |   1 +
>  5 files changed, 116 insertions(+), 39 deletions(-)

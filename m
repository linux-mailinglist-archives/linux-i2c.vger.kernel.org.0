Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B913B8D08
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2019 10:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437539AbfITIj7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Sep 2019 04:39:59 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:46229 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405234AbfITIj7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Sep 2019 04:39:59 -0400
Received: by mail-ed1-f66.google.com with SMTP id t3so5558121edw.13;
        Fri, 20 Sep 2019 01:39:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WCr8CPJIbQdsDFVeXzCBJIO+AejaAKprgzLbff1WJj4=;
        b=QFI7VBX6R3I/OMMPkbocBqhrTtmVDaUtE53gV0kBuMQat9djL0d2B/+ZwrrFD6tAAF
         Bb1JT4yeWewvEjT5w8Cza61Y2NgUuvrKOOCONnoeGphNuZAJljHTkFdLDaRvKbHwXc88
         IH+r/GrrduNfOCzChaKgdOKdDMmA6Tz+ugpfWGP0DR6Vc+QfwyWjBiOlunCnNvU0EKTF
         CKdQdAefh6Yl+CirKqUZiD70l6tEj+7hN397468ftn5trHy0bHhPYpuNTS0SjGfiMDh2
         9Gr+D1SqNeI40z68iHD44jTzDUJ8Wtb7UQhaRCqTjRt8J/8RyRTLSOJS13hcLarq7NE7
         i+Iw==
X-Gm-Message-State: APjAAAVCq79yYjaqe1clYBRwVbW+1gaddDoybbYxk3ODz2G0nEHUS3uj
        ySyToD3ATVPSImtBfD6PrYsQJI4OOEM=
X-Google-Smtp-Source: APXvYqxHOg7mYNanK1Q6V1OXObSCNpb5/HzFmFTJe9VuHAM1pOUWJWMEA2IhZksqCkHF5yKPycwbBw==
X-Received: by 2002:a17:906:2ec8:: with SMTP id s8mr18694368eji.275.1568968794627;
        Fri, 20 Sep 2019 01:39:54 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id q9sm154609eja.31.2019.09.20.01.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Sep 2019 01:39:53 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id h7so5832593wrw.8;
        Fri, 20 Sep 2019 01:39:53 -0700 (PDT)
X-Received: by 2002:a5d:668d:: with SMTP id l13mr11159369wru.279.1568968793107;
 Fri, 20 Sep 2019 01:39:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190920083237.GA11657@plaes.org>
In-Reply-To: <20190920083237.GA11657@plaes.org>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Fri, 20 Sep 2019 16:39:41 +0800
X-Gmail-Original-Message-ID: <CAGb2v65JrZXV9vb6pbCHfJvE3AawBxcWEpQH7C3woxnXpbN7vw@mail.gmail.com>
Message-ID: <CAGb2v65JrZXV9vb6pbCHfJvE3AawBxcWEpQH7C3woxnXpbN7vw@mail.gmail.com>
Subject: Re: [BUG] sun4i: axp209: no atomic i2c transfer handler
To:     Priit Laes <plaes@plaes.org>
Cc:     Maxime Ripard <mripard@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>, priit.laes@paf.com,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Sep 20, 2019 at 4:32 PM Priit Laes <plaes@plaes.org> wrote:
>
> Heya!
>
> I have seen following warning message for few times when shutting down the
> machine (Olinuxino Lime2-emmc) running the mainline kernel.
>
> [snip]
> WARNING: CPU: 0 PID: 1 at drivers/i2c/i2c-core.h:41 i2c_transfer+0xe8/0xf4
> No atomic I2C transfer handler for 'i2c-1'
> Modules linked in: enc28j60
> CPU: 0 PID: 1 Comm: systemd-shutdow Not tainted 5.3.0-rc8-paf+ #28
> Hardware name: Allwinner sun7i (A20) Family
> [<c010ee08>] (unwind_backtrace) from [<c010b5b8>] (show_stack+0x10/0x14)
> [<c010b5b8>] (show_stack) from [<c06bf2b4>] (dump_stack+0x88/0x9c)
> [<c06bf2b4>] (dump_stack) from [<c011e044>] (__warn+0xd4/0xf0)
> [<c011e044>] (__warn) from [<c011dbe4>] (warn_slowpath_fmt+0x48/0x6c)
> [<c011dbe4>] (warn_slowpath_fmt) from [<c051ce20>] (i2c_transfer+0xe8/0xf4)
> [<c051ce20>] (i2c_transfer) from [<c051ce78>] (i2c_transfer_buffer_flags+0x4c/0x70)
> [<c051ce78>] (i2c_transfer_buffer_flags) from [<c046c2a4>] (regmap_i2c_write+0x14/0x30)
> [<c046c2a4>] (regmap_i2c_write) from [<c0468180>] (_regmap_raw_write_impl+0x588/0x63c)
> [<c0468180>] (_regmap_raw_write_impl) from [<c0468b50>] (regmap_write+0x3c/0x5c)
> [<c0468b50>] (regmap_write) from [<c046f554>] (axp20x_power_off+0x2c/0x38)
> [<c046f554>] (axp20x_power_off) from [<c013e8a4>] (sys_reboot+0x14c/0x1e0)
> [<c013e8a4>] (sys_reboot) from [<c0101000>] (ret_fast_syscall+0x0/0x54)
> Exception stack(0xef04ffa8 to 0xef04fff0)
> ffa0:                   00427954 00000000 fee1dead 28121969 4321fedc 16814300
> ffc0: 00427954 00000000 00000000 00000058 bec15c78 00000000 bec15c10 004266f8
> ffe0: 00000058 bec15b6c b6f69d45 b6eeb746
> [/snip]
>
> The enc28j60 module is SPI, so it has nothing to do with the message.
>
> Any ideas where to look?

This looks like it's complaining that i2c-1 (i2c-mv64xxx) does not have
.master_xfer_atomic , which should be used in atomic contexts.

include/linux/i2c.h says:

   @master_xfer_atomic: same as @master_xfer. Yet, only using atomic context
     so e.g. PMICs can be accessed very late before shutdown. Optional.

ChenYu

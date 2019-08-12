Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3100F89C5F
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2019 13:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728145AbfHLLHh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Aug 2019 07:07:37 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:45225 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728108AbfHLLHh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Aug 2019 07:07:37 -0400
Received: by mail-ot1-f66.google.com with SMTP id m24so4207608otp.12;
        Mon, 12 Aug 2019 04:07:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qHM6FDOhsRzjTSd8loKknXcNLEK6jv1Ba3F/sVhpvak=;
        b=V8zbj8r1zNgjNGOFYxEC34ZR4s8pmp4gtsacmjQXVxiXHqJBBN3ExpdMrrAIMpE+Au
         FRbss/YYVh4PcvCGxDTpt3EH8vblP9z2yXtcZVrPytb8poTZhysh53sozNxZ27/HQsd+
         7EuM5JxFeDF0tSqMJF121lGLfCZCbUTez/GMS+BK2jIvvIlb8ADVgLsR99pCByLuMIlg
         coni3sp3jUKISnFxYWly8LBFR7pQfNr3wHhfybF/8iQus1YiWOlUL5SB7MmNVJ8VLnIn
         BFLjlhRTH/WOJN8Jc+vUKK0r5SdNd5mKG+MyWRnATHljN/sgL6pnTE/V3I4tqT42MlLB
         JGww==
X-Gm-Message-State: APjAAAWZEk8+k2lTwjzXYwQwD1usKg2of9aAHUjahZfV6YYJFOZBrdqE
        8XRyHadBfIIabQmruPHw9Ag7SFN2sV2XMdlh1k1Fy9d7
X-Google-Smtp-Source: APXvYqzmaEY+qGiEtJ5HvmGixD/Xz77NLpsNYxYeCejZoLaZ6fsmS4oeCoZJrN9r13ht5HpGdDdIy0RLNV0Px8B6FBY=
X-Received: by 2002:a05:6830:210f:: with SMTP id i15mr29933428otc.250.1565608056546;
 Mon, 12 Aug 2019 04:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190811043253.24938-1-max@enpas.org> <CAMuHMdVJJxjH-gPraW==smrkOOMcGYPKB8BPzrYPU4bstASX3A@mail.gmail.com>
 <fe5cf25f-1804-dc45-7010-01e602b3f3e5@enpas.org>
In-Reply-To: <fe5cf25f-1804-dc45-7010-01e602b3f3e5@enpas.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 12 Aug 2019 13:07:25 +0200
Message-ID: <CAMuHMdUum4Dubx8EOsSakaNfLp4-Yyzsutfkvb_+i5mqtOtkKw@mail.gmail.com>
Subject: Re: [PATCH] i2c/busses: Add i2c-icy for I2C on m68k/Amiga
To:     Max Staudt <max@enpas.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "Linux/m68k" <linux-m68k@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Max,

On Mon, Aug 12, 2019 at 12:43 PM Max Staudt <max@enpas.org> wrote:
> On 08/12/2019 11:37 AM, Geert Uytterhoeven wrote:
> >> +       /*
> >> +        * The 2019 a1k.org PCBs have an LTC2990 at 0x4c, so start
> >> +        * it automatically once ltc2990 is modprobed.
> >> +        *
> >> +        * in0 is the voltage of the internal 5V power supply.
> >> +        * temp1 is the temperature inside the chip.
> >> +        *
> >> +        * Configuration 0x18 enables all sensors on this PCB:
> >> +        *  # modprobe i2c-dev
> >> +        *  # i2cset 0 0x4c 1 0x18
> >
> > What's the reason for the i2cset command?
>
> It sets the sensor modes in the LTC2990 and enables the three sensors listed below. I should have clarified this.
>
> I tried to integrate this in the driver, but ltc2990 only allows reading this configuration out of a device tree. Is there a good way to fake a DT entry in the init function?

You can add platform_data support to the ltc2990 driver, and pass it
through i2c_board_info.platform_data.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

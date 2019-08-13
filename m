Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1664A8B072
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2019 09:04:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725981AbfHMHEc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Aug 2019 03:04:32 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:45155 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725820AbfHMHEc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Aug 2019 03:04:32 -0400
Received: by mail-ot1-f66.google.com with SMTP id m24so15715816otp.12;
        Tue, 13 Aug 2019 00:04:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mXwGBjp9LMHuTvIC7Bhlt7IoJI+c7o2N7HzWrhbwkTg=;
        b=o8yMjMa4T0l0rC3q/fBv0oWHdIleApSVU/C2QREAHdmisaBIOZose3x+V5VhoKCX+g
         lTV+4nW7GL7NkJNrRGJ/LJxNVVFxxHBHGNuX2hSk16ysIijU2M0CmeTnmMGherpKUUil
         n347YZXF4p3xgHztt+3hDOJ2siBpe5X9Zpx+EyJx0WlJcUAM6uUxdMEvk2UNIyV9Ybj8
         NJX/Q7m3VodI+mQxAt9JFMGbtiNdkWwYOb5DCAK4lsLJbKZTYmqi8B5UvBWFBJQLogq3
         W7cac7YJTO8loEFlm0vC7m2Afwd6qn9/PLJMtREQU478ljlKpyNoLYi+WB4AHAPHAOVN
         C41w==
X-Gm-Message-State: APjAAAXT0e+dJyE4Md5cv3/cbBn9RdWM6E+6sW3Xrf2Lj2C1KqKW/E3z
        2GeOXucbqxnA/AdH4I/Z8zuzPTlpyeEXEJiiaHU=
X-Google-Smtp-Source: APXvYqw0yC4CvPrV5JWobKvJRDIsvm1+Y4M3hpoRUEejLxDUS3HCwIjvAuVYG9ij1hRlzveIzL/9HaKCXD2guwuh9gs=
X-Received: by 2002:aca:3bc6:: with SMTP id i189mr502087oia.153.1565679871091;
 Tue, 13 Aug 2019 00:04:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190812235237.21797-1-max@enpas.org> <20190812235237.21797-4-max@enpas.org>
In-Reply-To: <20190812235237.21797-4-max@enpas.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 13 Aug 2019 09:04:20 +0200
Message-ID: <CAMuHMdWZHFPQ7Wt9oD8jiyBsXzoTQsxgr-U5kLsgG82n_gfTzA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] i2c/busses/i2c-icy: Add platform_data for LTC2990
To:     Max Staudt <max@enpas.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>, linux-hwmon@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "Linux/m68k" <linux-m68k@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Max,

On Tue, Aug 13, 2019 at 1:54 AM Max Staudt <max@enpas.org> wrote:
> This enables the three additional inputs available on the 2019 a1k.org
> reprint of the ICY board:
>
>   in1 will be the voltage of the 5V rail, divided by 2.
>   in2 will be the voltage of the 12V rail, divided by 4.
>   temp3 will be measured using a PCB loop next the chip.
>
> Signed-off-by: Max Staudt <max@enpas.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

However, I would merge patches 2/4 and 4/4, and move the result
after patch 3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

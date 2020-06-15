Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06CEB1F93BB
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jun 2020 11:41:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728773AbgFOJlM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Jun 2020 05:41:12 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:42027 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728368AbgFOJlM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Jun 2020 05:41:12 -0400
Received: by mail-ot1-f65.google.com with SMTP id t6so12586701otk.9;
        Mon, 15 Jun 2020 02:41:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kVh6vhGTp4nHIVoitqlfcuyxTAyEUzzJNPdDNlKbwVE=;
        b=Xhd3R6GVQqInANyZhWr91HqDsVDZ/lT5N5+K9tgq+T3xT4u2xwtE/YWd8KXzngUtbn
         McaXGOJeaELh1XGBhLcnz7t7BT8TPwsJF6aMg8JXg+b8+8FPx2Zh9Rb+86eEfOsrZV2C
         IZACZRcNNmk7wmPtyE3XCuFvG6YRA0pzuvwxeqEKhqKtvfRzjBdJhcF4tkGeopoYfThL
         Y+JJk9orJ7yV7RlSCjKaQwMarietc7sAg21jJIlbuxbdlc586Xsbv15DGjz3X82lCwhZ
         0SiexW0d2AJUF0uwwauxeePpo0xiWZ0ceT9c4tjSivT71Hj7NnDV5hNq8fw0qEObjLM1
         2BCQ==
X-Gm-Message-State: AOAM533tJ9q3Yjt0AiA1ak1DSrqEvvmnGM0yWxltOpRZFaBzY29/uktZ
        N27OPg0li46rmwk4oijGDEmcvBvSTiiiejnFyVxmBqM0
X-Google-Smtp-Source: ABdhPJyC5FNeZ+EIHvbT4gnx1gWrA9mUC+COcLHFcLQ3hcaYOMwfxpGzAs5Mz+L182NA/24zxSsPcGCa7fTZ+DKxeOk=
X-Received: by 2002:a05:6830:141a:: with SMTP id v26mr20854920otp.250.1592214071396;
 Mon, 15 Jun 2020 02:41:11 -0700 (PDT)
MIME-Version: 1.0
References: <1591817591-852-1-git-send-email-uli+renesas@fpond.eu>
In-Reply-To: <1591817591-852-1-git-send-email-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 15 Jun 2020 11:41:00 +0200
Message-ID: <CAMuHMdW=WfGNtKo6y1RFPydFeQ-UqFq4ixOTqQzuW7x3oGmHjA@mail.gmail.com>
Subject: Re: [PATCH] i2c: sh_mobile: implement atomic transfers
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Linux I2C <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Uli,

On Wed, Jun 10, 2020 at 10:19 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> Implements atomic transfers to fix reboot/shutdown on r8a7790 Lager and
> similar boards.
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

After removing the first hunk, this works fine on r8a7791/koelsch.
The following warnings are no longer seen:

    WARNING: CPU: 0 PID: 1 at drivers/i2c/i2c-core.h:41 i2c_transfer+0x80/0xf8
    No atomic I2C transfer handler for 'i2c-6'
    ...
    WARNING: CPU: 0 PID: 1 at kernel/sched/core.c:1731 set_task_cpu+0xf4/0x1fc

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA451831BA
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Mar 2020 14:38:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726028AbgCLNii (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Mar 2020 09:38:38 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:37358 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727194AbgCLNii (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 Mar 2020 09:38:38 -0400
Received: by mail-ot1-f66.google.com with SMTP id i12so949534otp.4;
        Thu, 12 Mar 2020 06:38:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LZj5cPIDRAd/O2vyQ2odALBxqPsyj21il1eEEBudhSo=;
        b=ShU8dPnNiYXDf/bWDjNuLmbrWw3Wn8PJusBaeQkkylqUCegHyNeUs1KBROFHALggDh
         2w1hQ6o39GBz8+4pkNltI7wix57d/cX92VPgI9u+dY544j7z5yOe3dL7EgWTm0k7f6ui
         ycMA4gyHyVxob57Z0s2m7el9yCN7ceacixz10qpxk1gttstkP4ecNSTym7hJrvqsSXqO
         uUqxCrLG7IqG6gNRimx57RgpVuKAVT4cWe6+nHL73MJBIeJM1j2twjhhw8UE/uyjn9qW
         AZ0x6+2evAYGmSIkCBCqTHwdDr8W6mrWSnZ2ZFAv8Blb87jB+RT0fjmbtujtd9jgGlQJ
         4e2A==
X-Gm-Message-State: ANhLgQ3QOAOtjY8tTPGOAwUpnD6vHIjDIpvecaUSKkojVMtbq90ZgpbZ
        UVH47OcjgH/vTCklqO5RAeJbDzAtVB6IhEMHG0Y=
X-Google-Smtp-Source: ADFU+vuSh/99ve5kjxmesXn1EBGQ7zk1qjQDub4hZ/WAGoOsllXKp5oQsA09B8Mo6NZKe90UItuDR7/YvIxeTZ9xMXs=
X-Received: by 2002:a4a:e211:: with SMTP id b17mr4052099oot.79.1584020315784;
 Thu, 12 Mar 2020 06:38:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200312133244.9564-1-wsa@the-dreams.de>
In-Reply-To: <20200312133244.9564-1-wsa@the-dreams.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 12 Mar 2020 14:38:24 +0100
Message-ID: <CAMuHMdXUZF3R7TaB6E96DGbb320fD51w0ycJouOEfR-LwoUZQA@mail.gmail.com>
Subject: Re: [RFC PATCH] i2c: acpi: put device when verifying client fails
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 12, 2020 at 2:32 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> i2c_verify_client() can fail, so we need to put the device when that
> happens.
>
> Fixes: 525e6fabeae2 ("i2c / ACPI: add support for ACPI reconfigure notifications")
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

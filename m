Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4611FBDD
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2019 16:48:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726220AbfD3OsF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Apr 2019 10:48:05 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:40822 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbfD3OsE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Apr 2019 10:48:04 -0400
Received: by mail-ua1-f68.google.com with SMTP id u34so2981334uau.7;
        Tue, 30 Apr 2019 07:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8+rRX7GygNe6MDjmpx3rsTWh3phJueY5lQuNv8Fto7w=;
        b=uSQConNMT6RmoBGRLvVWJCsNS+6gCEsfsI4fT1vNvzEyDMd2uwPDsrHvolcEmyERBf
         Tlqb/Zaohgh831KXW3S3KqcB1n7SlbWM6xf2DJfy7GJ0Kfaj3y6hO+PQXmZUY6sT4Dtx
         srUSwPh+FBxW9eTQZ6wUXIDcywr7TgT/gXQvAsJvG1SF7qURAxlVkohBumKHura9w2hT
         i5PIksE1LNjGPfsdki6IVCbcohZxQ4e6bNosV9fmetn3xyhsWA+G+Y10ObWB6vZXaO8w
         6ngZ4eehNJK5OOXDryQ1cYZucroGQbpz83EofYUgY5IImHdgK0xaweGYxB9UiO+qiJpI
         VYiw==
X-Gm-Message-State: APjAAAUWqxLbWRo/Z4KkbKZGCW9eLAjvPQs8G6MGebe4hu6RchfhtyHf
        mJrAkR59B53ICXyyVRd1i6+UZHnBH2OsWOVz4T0=
X-Google-Smtp-Source: APXvYqzlSe8XbOyJS6Sv+jJkkDi9AcK9wNd7rPtLuB7mRS2JI79hJeEa1MtQse82af6LeEI/cjr4Eqmm5JDtiEkAmf4=
X-Received: by 2002:ab0:7797:: with SMTP id x23mr3928188uar.28.1556635683820;
 Tue, 30 Apr 2019 07:48:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190430132309.12473-1-chris.brandt@renesas.com> <20190430132309.12473-4-chris.brandt@renesas.com>
In-Reply-To: <20190430132309.12473-4-chris.brandt@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Apr 2019 16:47:52 +0200
Message-ID: <CAMuHMdVK3AZ2LK0Tz70tnFbBsDC3FOHuSMR9ujU43jr15fZrqA@mail.gmail.com>
Subject: Re: [PATCH 3/7] dt-bindings: i2c: riic: document r7s9210 support
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 30, 2019 at 3:36 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Document support for the R7S9210 (RZ/A2) SoC. Also explicitly document
> bindings for the R7S72100 (RZ/A1) SoC.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

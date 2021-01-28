Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEFF6307568
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Jan 2021 13:05:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231425AbhA1MBC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Jan 2021 07:01:02 -0500
Received: from mail-oi1-f180.google.com ([209.85.167.180]:45283 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231419AbhA1MAH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Jan 2021 07:00:07 -0500
Received: by mail-oi1-f180.google.com with SMTP id g69so5685338oib.12;
        Thu, 28 Jan 2021 03:59:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kAP4N1JvamS8Mu0q+wzDG5MIcLJh8DB6Gbuwj+1o0xk=;
        b=Gfr0N2ENJt5YKMtVKAA0iAP3BwXgJ904EohZVfBzR88ha3zdm3BaMYvJVmwEiatQkX
         VZBqAYqpH0LNMrpKsaTQcRrn7As/QgBSy1gSbRjYQvLizCGuyN8CsASm2i9sLHslvEZh
         vduZy/OzvxrkhZTDUCHt5Px9QDB2CiPXdzEi2nEHigrjp/C22Wu2mol3qLtaO0KTFaVL
         yFcZU6sP95Ukz8J/JvCyDCcnCPd5aSBC1rhqA4eMo7gm+eYAj5UzhHODp1kLNIBZrWB0
         dmHwRMaY1iIEfHtUddjG4YrlvOlQlgxlxkj1QBNuWZz0Snpb4+ruibYEzesbqV0lzklD
         1r7A==
X-Gm-Message-State: AOAM530DPIwZd8jSPr9oXIf62TJXf8LbWVtOZplgfbK0m9DcwBuIs0RE
        Xi4N3ODOT0U3d8Iw50xumlrTWYHaJPcSycqkX0aksWsDs0E=
X-Google-Smtp-Source: ABdhPJzrT+Kg8nyfyKS3C+Z0key3XnUxUjStwPy5R868F5Smv4QzgDQQfF0cXgHDjhCU+QdrsluppxYf9QBXRKwmEz4=
X-Received: by 2002:a54:4e88:: with SMTP id c8mr6196722oiy.148.1611835166537;
 Thu, 28 Jan 2021 03:59:26 -0800 (PST)
MIME-Version: 1.0
References: <20210128111343.2295888-1-geert+renesas@glider.be> <20210128113353.GN963@ninjato>
In-Reply-To: <20210128113353.GN963@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 28 Jan 2021 12:59:15 +0100
Message-ID: <CAMuHMdW--A2bwe==+A35_sLAS2OkXzi2hY0Ky_dwL0n8irHMZw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: eeprom: at24: Document ROHM BR24G01
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Thu, Jan 28, 2021 at 12:33 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> On Thu, Jan 28, 2021 at 12:13:43PM +0100, Geert Uytterhoeven wrote:
> > Document the compatible value for the ROHM Semiconductor BR24G01 I2C bus
> > EEPROM.
>
> What is the difference between those two? Could one also be the fallback
> of the other (just in the highly unlikely case we need "generic" Rohm
> handling somewhen)?

Good question.  The datasheets look similar.
Parametric search on rohm.com says the G-series differs in using
"Cu wire bonding".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

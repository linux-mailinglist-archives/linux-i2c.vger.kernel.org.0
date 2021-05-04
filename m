Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85C88372C88
	for <lists+linux-i2c@lfdr.de>; Tue,  4 May 2021 16:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231690AbhEDOxB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 May 2021 10:53:01 -0400
Received: from mail-ua1-f47.google.com ([209.85.222.47]:36479 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231411AbhEDOxB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 May 2021 10:53:01 -0400
Received: by mail-ua1-f47.google.com with SMTP id x9so3134378uao.3;
        Tue, 04 May 2021 07:52:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ONxxA94L/DFfNepn9scIskMZLJRvjvT6cEz2I+VT/8s=;
        b=WgohuM7Nt6/432eXf59xGO1/oaztYqpM8a++vJd4N+mLIU0bZWKTgO/WIdfN14lrjg
         aME34iukdhRP0FLlfIsAZ9146fwk1YmC+x/BfePVpgFKijNlYDm6IWiBmpuBIOf9VHNb
         h9O79cr3Ka97FhtHLNDt1pIV/heE/RtlUFiVJgc8jpKr/evChjldJZ9bRh4bMdMUbUCe
         WuoNKY0MdjeU6J35vWGqnnxZMRJplENvTt1DmWyJTDpi0/JfQhRJZARxpdB3xA5txV8u
         62Htu/OR0g8QYcYzCHAzq52Rl8V9KKNLCH/527peck7ARTI9MpBVz6wvwDoxfOFCaih8
         /g8g==
X-Gm-Message-State: AOAM5319LUm1qtK/zeGbL1YsLo4+uEhJVWa3aFFijL6D2zcKvBlaXMiT
        4DGPcfSQFbKqgatTzfcN6uY4hi1uLqQQHCRihc4yOMUF
X-Google-Smtp-Source: ABdhPJyCXylNli8GA4LMdFuIZ3G0g+Te6dWV4C/k3adk4lSIon/fWKFdq83BA0LFtrsANaqBFk5scP5KMBEj9T4k43k=
X-Received: by 2002:ab0:3157:: with SMTP id e23mr20150790uam.106.1620139924982;
 Tue, 04 May 2021 07:52:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1620138454.git.geert+renesas@glider.be> <CAL_JsqKTYq0T6RP6oR928HmADSeoJREoF+RMAHNm+YGigiS4AQ@mail.gmail.com>
In-Reply-To: <CAL_JsqKTYq0T6RP6oR928HmADSeoJREoF+RMAHNm+YGigiS4AQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 4 May 2021 16:51:53 +0200
Message-ID: <CAMuHMdU63bHpERqYL7mV1futq6bjCZ9O_N5ymsLQ+RZt1dYPFA@mail.gmail.com>
Subject: Re: [PATCH 0/6] dt-bindings: i2c: renesas: Convert to json-schema
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Rob,

On Tue, May 4, 2021 at 4:42 PM Rob Herring <robh+dt@kernel.org> wrote:
> On Tue, May 4, 2021 at 9:36 AM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > This patch series converts the DT bindings for the various I2C
> > controllers found in Renesas SoCs to json-schema, after a small cleanup
> > to ease the conversion.
>
> You missed the DT list. Can you resend please.

Oops. Thanks for notifying me, done.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

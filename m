Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C0C039C33A
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Jun 2021 00:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230041AbhFDWIV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Jun 2021 18:08:21 -0400
Received: from mail-lj1-f181.google.com ([209.85.208.181]:43603 "EHLO
        mail-lj1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231470AbhFDWIU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Jun 2021 18:08:20 -0400
Received: by mail-lj1-f181.google.com with SMTP id w15so13382264ljo.10
        for <linux-i2c@vger.kernel.org>; Fri, 04 Jun 2021 15:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Lm6qjNOSd7S3ElmBGLAdz/ltzncXw/D1BuDORLixUOY=;
        b=RpZRBAvNmlvbMhdcUNBT1IRUNettfyipNir/0qTLXWWLR9kdY0t6lKvAuh/oaTO45F
         5VYqft+IFQlJmmdwTQoAEFOwopCsUIMwZQlgODEkvQU8f/iH2vIB9Vv95mrSlCqO65kl
         w3P8QlnkZgOEDDR8ulaMR/x/vWmMO0QXEzB2uFKqpthjGimkeTBdq6IOsgSHFlBfFdNV
         afIVLhvu1AVawb5Ojf3Wd+4G2lTKMotrRitIkml6wxZ4ma3jZdfN6BNOWHtSBcSLtjL1
         7ZyK2RFaieTful8M/iFLhhAu+Vmhy6kX2GC1MGVLHjNe8RzhdcF32ZuwkectC9wXalaG
         0Trw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Lm6qjNOSd7S3ElmBGLAdz/ltzncXw/D1BuDORLixUOY=;
        b=XZ2bcMAnVnJ3mohgL0g36a7H6tblVaCkwDZx+IZeEPmUTsU6EgS5Zp6UrK8j/8IidL
         3H4FAyYB+9iM8JXPpUCc/hR9YRjbHmQLfzFbmKGL38feJj8vE+TlKPevBk2EqlOqVAV8
         oJDYoS+KtABALpELqqD4RIObSTrYsaDBcoDlIAAsujvvc/rgo7ZbmEH8s9qYbmxzo378
         s6JFZlqsbCoGib3CJ01diaW63KDBTPdiCzPmsKoMXTQACVgB6Y0TmNVDMeKxfjccfbPZ
         gswZR7XlBPeMYdgbJuMYz7+WGKq7QiLnpJAD6THB75PVP9utHNyPYEenL+QTAY3sIBFd
         6dQw==
X-Gm-Message-State: AOAM533WY2dcvYQZShY6/hD1gpCmspHivIVmTfAIIgl0BjKISbEWUmL5
        mChNQC/JFr1I/m6Dez6oVpFJb54tFmhWFOa9Tua1Z43M/+Y=
X-Google-Smtp-Source: ABdhPJxIEjo220o67L1taBJY3zqlit/QriVesKs4aC6pDmACw4lPvVzV8qVmU/R+jsc82jo3VZQGH3X9ojeu+ohPLmw=
X-Received: by 2002:a2e:22c3:: with SMTP id i186mr5091495lji.273.1622844333120;
 Fri, 04 Jun 2021 15:05:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1622560799.git.geert+renesas@glider.be> <7caa954add90255fc177e5dbabe17d62e0242861.1622560799.git.geert+renesas@glider.be>
In-Reply-To: <7caa954add90255fc177e5dbabe17d62e0242861.1622560799.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 5 Jun 2021 00:05:22 +0200
Message-ID: <CACRpkdbSP2FEkfY74HxSUDse57iRf3MY+-i5ZDk1AeUxd=FSug@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] dt-bindings: gpio: pcf857x: Convert to json-schema
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        platform-driver-x86 <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jun 1, 2021 at 5:25 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Convert the PCF857x-compatible I/O expanders Device Tree binding
> documentation to json-schema.
>
> Document missing compatible values, properties, and gpio hogs.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

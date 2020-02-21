Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8551167A62
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Feb 2020 11:15:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727872AbgBUKPQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Feb 2020 05:15:16 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:45578 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726989AbgBUKPQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Feb 2020 05:15:16 -0500
Received: by mail-oi1-f195.google.com with SMTP id v19so1056614oic.12;
        Fri, 21 Feb 2020 02:15:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nm8XPNj2T3vUB6cqjEXZ7nGfKAwujbY0F04qFgjkmjQ=;
        b=onf6TzsxkuQX0Qdyn7t6WtQrYqrNuphUmDfj1EhNUHjloyJWP22lH44ncf0P+hh1dr
         Mdx1MYQRaPZm4lGmu3+adul7nAcoqOsJlIJf5Xjyya6XDEA+uP1NfD1TD7SBH8EbjeGu
         /xL0VRjLsyIXnH9uG//k5f4XFFlP0dB5ognc6p1/0l90TAV74f+Hujf3S/MJlD56nFNt
         uooyncTA4zQqxeqg1N2AsgEbfnQ8vLGTHy3x6MIgyKgm/Vabl7Yykr/Dd4Gjiw9VoZBx
         g41V1Attidib9h91uUaE8KLjWACWSbAgtIWjL2lIemh+UKNiB4BV60amnxOr0LMPGeEE
         j5oQ==
X-Gm-Message-State: APjAAAWdz85Sz+vezvg3tmP72yvx3XMDH7JGJd3HL4CYYYltf9nWw3ri
        fYNP6ZGtd3WUzi8xImCHmzkGtrWksZzLS49qbLk=
X-Google-Smtp-Source: APXvYqz7WikUrMhKLOm0sNqPcWz6d/IUuDU0jmDC9Xjm9FDq7/MpI0yqLXOdcKkSOPan01jsEb1TTlk2L7zVqUGNO5k=
X-Received: by 2002:aca:c4d2:: with SMTP id u201mr1394043oif.54.1582280115669;
 Fri, 21 Feb 2020 02:15:15 -0800 (PST)
MIME-Version: 1.0
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 Feb 2020 11:15:04 +0100
Message-ID: <CAMuHMdX+SJPTvDqKDwD_3DaAxDT3KcEbcjLNjj4JsbcpRwd92w@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] i2c: of: reserve unknown and ancillary addresses
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-i3c@lists.infradead.org,
        Kieran Bingham <kieran@ksquared.org.uk>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Thu, Feb 20, 2020 at 6:26 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> One outcome of my dynamic address assignment RFC series[1] was that we
> need a way to describe an I2C bus in DT fully. This includes unknown
> devices and devices requiring multiple addresses. This series implements
> that.
>
> Patches 1+2 do some preparational refactoring. After patch 3, we can
> have child nodes with an address, but no compatible. Those addresses
> will be marked busy now. They are handled by the dummy driver as well,
> but named "reserved" instead of dummy. Patches 4+5 are again some
> preparational refactoring. After patch 6, all addresses in a 'reg' array
> are now blocked by the I2C core, also using the dummy driver but named
> "reserved". So, we can have something like this:
>
>         dummy@13 {

Hence should that be "reserved@13"?

>                reg = <0x13>, <0x14>;
>         };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

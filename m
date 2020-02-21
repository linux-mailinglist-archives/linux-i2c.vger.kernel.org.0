Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7725B16798F
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Feb 2020 10:36:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728157AbgBUJgn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Feb 2020 04:36:43 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:34123 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726984AbgBUJgm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Feb 2020 04:36:42 -0500
Received: by mail-oi1-f196.google.com with SMTP id l136so1002702oig.1;
        Fri, 21 Feb 2020 01:36:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l+VSzBk136F0WnmD8vd1UXyUqbIVYbRCZbVzHfV0nCo=;
        b=blhMUVEXZ9uOhLwDwQlHuHHxrIj/Y6JHgjtqgKLmiYMQoxo/ERgEa4ExjFqashOCi8
         66wqmOcIDdg5WVEzTu9Kh366jcebleI+KNuaV/oC/UnQHhpWOjiCEzn5ttCdwqnWk9oA
         yLzGOaCf5xnQJ6Y4f42yVVbt2a1tAWkJcucZfl/IguHJuDAFltf4mTdw+ZohluSwVhXE
         o9Fot4i7Vvpqkv4sepJlBTztU/gz+pM01ND2gwlw/3gELp5RKpv2cR8ls9NVsjIlKuUh
         +Z5u0VfZn6O51wpSwYzv39TG9qoYxDPp1Ptzw9PIqrC6WhAQVQxGFE/V/7+F7IaiaKVS
         AJug==
X-Gm-Message-State: APjAAAXwu04ovSt1iF4Ysp7dv5B6pLxw123ABQ5ZX4sthaYJL73eD6BE
        w/b62JcNuNSARRz7jj+sgWjULqagDJxmn9I4Ox0=
X-Google-Smtp-Source: APXvYqwTLkzdJ7Ea1pHuDDK58bfsunGZ+J2COTT5It/qUAHl0F0jdTOlEjeYhsTaMKlgabM9EKUDnBJ18UmF8kn5mDw=
X-Received: by 2002:aca:48cd:: with SMTP id v196mr1273580oia.102.1582277801696;
 Fri, 21 Feb 2020 01:36:41 -0800 (PST)
MIME-Version: 1.0
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com> <20200220172403.26062-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200220172403.26062-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 Feb 2020 10:36:30 +0100
Message-ID: <CAMuHMdU3WgdV0cqf0Gu=szyNch=QOEK8UbiQyxLjsf+WnS=-ZA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/7] i2c: add sanity check for parameter of i2c_verify_client()
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
> We export this function, so we should check the paramter to make it

parameter

> NULL-compatible.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

And then the check in i2c_acpi_find_client_by_adev() can be removed.
BTW, can the i2c_verify_client() check in that function actually fail?
If yes, it should call put_device(dev) on failure, like
of_find_i2c_device_by_node() does.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

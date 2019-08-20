Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 295A995AA9
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2019 11:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729396AbfHTJJP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Aug 2019 05:09:15 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37293 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728698AbfHTJJP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Aug 2019 05:09:15 -0400
Received: by mail-ot1-f68.google.com with SMTP id f17so4377923otq.4;
        Tue, 20 Aug 2019 02:09:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZIHwa6ihqTOJt1z0IhqMmdXZIDcNIppjjHYyAVGEHXg=;
        b=DgzSD1FLX0W8ZjSibJDNfdt/ElDWiDSIzPln2e0hk6XyY+pJjNMeTxXEPSTdwJ8CXC
         kCivoV6pm5q5dpZYnIHVKFc/X0wolAZkC0rSdjbGs1PJ1oBlEP5G5OZegcMLIXQbkZtI
         FX1LUIl/Ba1nYMOVoSZ7Krqu6aPmQ4SjCoQ9yDrFM5OhtaSsDG5WXNte/nnEsoSaMaoX
         QBtWkNwg4hibFHMBVqtKtVLRoGKHYV7xJLrxkmFmigY5Xn8UIgpFqChEwCwLH9Jm1qvw
         Xg8sA+Ebz1z63rnTBGaGciBKboF+EqxZ9O742z+PjbZBGLX1npuFdJAPnnZ1u3eqV2vY
         xaeg==
X-Gm-Message-State: APjAAAVHczAAN9mP+RmVm6hbiXtEVY573wgGFY76KF/Fe+vpitZ+oFPp
        REao/OjuLEpZwP2w9X5ZvXSex9Ih+/J7i65EedjMWQ==
X-Google-Smtp-Source: APXvYqw30yn1caNh6mh1HQnqWHqS4uD51BXVqcEvPabVcPpcr3fQGtvSjat8N4MLnyLawr1odAUPW3iOqnkiSt5gW/8=
X-Received: by 2002:a9d:459d:: with SMTP id x29mr22524737ote.39.1566292154481;
 Tue, 20 Aug 2019 02:09:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190819121618.16557-1-max@enpas.org> <20190819121618.16557-2-max@enpas.org>
In-Reply-To: <20190819121618.16557-2-max@enpas.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 20 Aug 2019 11:09:03 +0200
Message-ID: <CAMuHMdV6DhgLSj9dyretKRi47QFOAG-b8NW9RT-JPnZWfG_Z6A@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] hwmon/ltc2990: Generalise DT to fwnode support
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

On Mon, Aug 19, 2019 at 2:17 PM Max Staudt <max@enpas.org> wrote:
> ltc2990 will now use device_property_read_u32_array() instead of
> of_property_read_u32_array() - allowing the use of software nodes
> via fwnode_create_software_node().
>
> This allows code using i2c_new_device() to specify a default
> measurement mode for the LTC2990 via fwnode_create_software_node().
>
> Signed-off-by: Max Staudt <max@enpas.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

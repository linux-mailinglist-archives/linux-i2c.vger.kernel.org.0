Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4075B901BA
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2019 14:37:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727182AbfHPMg7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Aug 2019 08:36:59 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34865 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726981AbfHPMg7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Aug 2019 08:36:59 -0400
Received: by mail-ot1-f68.google.com with SMTP id g17so8645362otl.2;
        Fri, 16 Aug 2019 05:36:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yK1aEZGG3mJpB5+d06Zwg7osYcvPBXSyQJ0sboYuiyQ=;
        b=QaxmhXDl+/7xpm1RtvVZKBlfGq6MyeSio1WnzLmwkQoVq3KaRaFfYX/83H7mlE+VhQ
         4i4riwqUEKSPi2Zxh3vZcvsl8xxV7cc+Kbt81hEPCEt32jYuf9ZNw27lX26Pvn07cYV7
         VzcAYeOiJ4jtsG7SX8lCmpksUDsvpTO0ydmSwYwtK6arhfZ8mlpWUoYJ6984FJl/C4vP
         5lr+ygObeqyHFvbY9P0waSCsYm9JzzmsqtUNCtAu/vOwVDeQ/5jdkNuOPiV72gAxkQ4O
         jRT4pLAhpnImRicbm2ETc4nH7tzyo6bFeIMfIKDTpDoYf5h1CPON5nc2VBT8g+kJOKBw
         KZyA==
X-Gm-Message-State: APjAAAUQXaqrw+b8zsSlOxchrKvsbwf0klNmaIZ6dWnQG2GlWl9HiU0z
        TQkN3fEtsofWtcSQk/AgDsWRem/rLYxgBaKU67rA9Q==
X-Google-Smtp-Source: APXvYqyJJuPcydeEzWCT5VtZQq7W2gemn7tQlXikI4dYGisqs6eBrJHj5LnefFQrD8BhE5J9v3soAI0RbDZcFEUnHzM=
X-Received: by 2002:a9d:5c11:: with SMTP id o17mr6756818otk.107.1565959018121;
 Fri, 16 Aug 2019 05:36:58 -0700 (PDT)
MIME-Version: 1.0
References: <5b9b4383-c1e9-91a6-8ab6-8f831b362dca@enpas.org>
 <20190816090731.12809-1-max@enpas.org> <CAMuHMdUE_3UEzOv3pmryMwuMRF7RC9-xTG8sXUbpR=r5fKUjrg@mail.gmail.com>
 <79f1e829-8fd4-6690-e429-f5b3d1a7c0bd@enpas.org>
In-Reply-To: <79f1e829-8fd4-6690-e429-f5b3d1a7c0bd@enpas.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 16 Aug 2019 14:36:46 +0200
Message-ID: <CAMuHMdVBviJgxnzLbJJO8ap+=SiiN+wGOsRg4kvnV6eGpnAxKg@mail.gmail.com>
Subject: Re: [PATCH] hwmon/ltc2990: Generalise DT to fwnode support
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

On Fri, Aug 16, 2019 at 2:25 PM Max Staudt <max@enpas.org> wrote:
> On 08/16/2019 01:07 PM, Geert Uytterhoeven wrote:
> > One minor nit: as the driver no longer uses any of_*() symbols, you can replace
> > #include <linux/of.h> by #include <linux/property.h>.
>
> I should have thought of that, sorry.
>
> Another patch, or will you do it?

As the patch won't go through my tree, I cannot, but the hwmon maintainer
might do.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

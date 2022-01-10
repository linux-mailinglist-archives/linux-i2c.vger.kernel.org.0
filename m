Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20AC348969A
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jan 2022 11:43:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244104AbiAJKnP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jan 2022 05:43:15 -0500
Received: from mail-vk1-f180.google.com ([209.85.221.180]:41576 "EHLO
        mail-vk1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244131AbiAJKmz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jan 2022 05:42:55 -0500
Received: by mail-vk1-f180.google.com with SMTP id i37so2931414vkr.8;
        Mon, 10 Jan 2022 02:42:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7DkOf/RezHhAoR1wNR7F50d5rM5is1Qk6AorSgY7zgE=;
        b=CZP8YROFyYlGtX6xxWnCTStciwq8pBKuNFqkJmrUH7++0T3OKu092oYu4P/krCTl3g
         EaiBxIb8t2j66ilRVkWtiP78yaKwH3IYR+e0WSV8z7N/xEF4SLRCIW2hrcafDJyH1l22
         BFLzxH3yXswNbnjC9S00b1BwKPtyXViVZRAeiWwHtrsHDZ/T9hU0gdcl8B05L3M1+Z6y
         ZV0bl1/9Epp/WXwfFLpvIjiL1eYYCGJyaUneYBT3p2eA04cZaSzjLCO34WLAyVF3t+uj
         WqgxuXrt1MoKqWcQcEmW+w025fr2wcfTnLRh5R9Zatbg7Ozxl8Q5kKYE1wDotYua7qVZ
         25RQ==
X-Gm-Message-State: AOAM5314eVD4ZaMcSmzAEwVY7sGgkDz5SQgFC+wNRNI1xM6VonFvvVZ/
        6hOTND8JZLPy7YgAm3NGIgQK435gBxiifA==
X-Google-Smtp-Source: ABdhPJxF3rHs/4gnq3n2ikfev5UvXpgfTBV6ZfFie5dNfCBmHvAfFe4WbaGu5cc/2o5k3xWW66j/5w==
X-Received: by 2002:a05:6122:c9e:: with SMTP id ba30mr1677223vkb.17.1641811374377;
        Mon, 10 Jan 2022 02:42:54 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id d198sm1418063vke.44.2022.01.10.02.42.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jan 2022 02:42:53 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id r15so22609135uao.3;
        Mon, 10 Jan 2022 02:42:53 -0800 (PST)
X-Received: by 2002:ab0:2118:: with SMTP id d24mr25154304ual.78.1641811373530;
 Mon, 10 Jan 2022 02:42:53 -0800 (PST)
MIME-Version: 1.0
References: <20220108054109.119750-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20220108054109.119750-1-yang.lee@linux.alibaba.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Jan 2022 11:42:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXLPbrjG0LWPEhMrXvcj017EKPt9Wr9HsmkSczRnadbDg@mail.gmail.com>
Message-ID: <CAMuHMdXLPbrjG0LWPEhMrXvcj017EKPt9Wr9HsmkSczRnadbDg@mail.gmail.com>
Subject: Re: [PATCH -next] i2c: sh_mobile: remove unneeded semicolon
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Abaci Robot <abaci@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Jan 8, 2022 at 9:55 PM Yang Li <yang.lee@linux.alibaba.com> wrote:
> Eliminate the following coccicheck warning:
> ./drivers/i2c/busses/i2c-sh_mobile.c:849:3-4: Unneeded semicolon
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 377582E3325
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Dec 2020 23:42:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbgL0Wmf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 27 Dec 2020 17:42:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726194AbgL0Wmf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 27 Dec 2020 17:42:35 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06FE1C061794
        for <linux-i2c@vger.kernel.org>; Sun, 27 Dec 2020 14:41:54 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id m12so20278498lfo.7
        for <linux-i2c@vger.kernel.org>; Sun, 27 Dec 2020 14:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TiUVtK9OeSFWzFQmBANaHzaEsallUsNWzJQS3+gHSHc=;
        b=D7uRdDCCiZZvK3tsg46HWwkADgyhfJn86vrcI1O6PQlHYexIv5nJqbF6uEdLiESZcS
         a4oFmUxOEG95/xkh4j8oQABfCPeOjLPfTYeHCmKWLtgffqT8FHp7EYZ0XbPmfCwpXJK4
         dsKmibMpV9pVYbgaW5jxRuF+D9G7Iq5+Xu5QODr2bVM/kBxnIglZgEGiSHbkRTz8XcCb
         T+3O8FFkjq89Lu613JoCqLFJcHA2ZjT0SJpa+Eou/w/nvzz95Ai0DiL6hVnXLZeGITTN
         KgtYzWAAjOuCtAP4bGl22S7HU9gkio8aVWzCz0Qu+zs7bsKBmZHsTfKJCZII+BO3kvxe
         j4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TiUVtK9OeSFWzFQmBANaHzaEsallUsNWzJQS3+gHSHc=;
        b=Grd/rA4YNyDfUu39GhKraXXPFYdASnx+Lo9LorucEAT8t4weq2xhhifWMWTeKCOxqx
         k97qetRkqJWfSoQ0rx18pBiV9D1BNXcBBwV7rgwXyZjxlycJTu3qJV752JXc/pOZrOzI
         oVJTJSl7YkYdPYDxtfmsS90ZJmilg+MMjFpmDKB33TzLvC455ctzI2lHFRzC3Y2j9ZFL
         0mRBCFDMbnz4fAdMenRzJgeftics9L/rVUO+gN6VcTO3YayPteO414bBsdUpZiqt3nRb
         gS7TilfLBMcbyQm2tGFtjhJskcxcku4l99FfEIiMT48mW0YkBzvnVLhv29u5zca/6vM2
         Cl+Q==
X-Gm-Message-State: AOAM533+Ghl0mjAgwD/tCo7z7koIMk4bXSkCIMt6krPsQX+Y+wo7nWBg
        4Q44Rm4hItbzr7p5zBDJsttX9nEx9j+W1oQI2GB0Bw==
X-Google-Smtp-Source: ABdhPJz5A3h25jIqt2I95JWA2PRAYsrrx0V+vogB1FIORy0QrfPRA1WdNKp2vmyB+DcYS5jEhlvkZI/W1o5Be3E3vwg=
X-Received: by 2002:a05:651c:1312:: with SMTP id u18mr20566799lja.200.1609108913442;
 Sun, 27 Dec 2020 14:41:53 -0800 (PST)
MIME-Version: 1.0
References: <20201221134225.106728-1-hdegoede@redhat.com>
In-Reply-To: <20201221134225.106728-1-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 27 Dec 2020 23:41:42 +0100
Message-ID: <CACRpkdZxMf-QgumQhS8-uhrDZYccfrJN=CATnXZj3HHxKfQ03Q@mail.gmail.com>
Subject: Re: [PATCH] i2c: i801: Fix the i2c-mux gpiod_lookup_table not being
 properly terminated
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jean Delvare <jdelvare@suse.com>, Wolfram Sang <wsa@the-dreams.de>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Andy Shevchenko <andy@infradead.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Dec 21, 2020 at 2:42 PM Hans de Goede <hdegoede@redhat.com> wrote:

> gpiod_add_lookup_table() expects the gpiod_lookup_table->table passed to
> it to be terminated with a zero-ed out entry.
>
> So we need to allocate one more entry then we will use.
>
> Cc: Serge Semin <fancer.lancer@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Andy Shevchenko <andy@infradead.org>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Fixes: d308dfbf62ef ("i2c: mux/i801: Switch to use descriptor passing")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

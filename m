Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C8741E0D83
	for <lists+linux-i2c@lfdr.de>; Mon, 25 May 2020 13:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390145AbgEYLnD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 May 2020 07:43:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390260AbgEYLnC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 May 2020 07:43:02 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE55AC061A0E
        for <linux-i2c@vger.kernel.org>; Mon, 25 May 2020 04:43:01 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id w10so20479272ljo.0
        for <linux-i2c@vger.kernel.org>; Mon, 25 May 2020 04:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t2vxVYv4xVR6U/qYBOPL/Sh6OEV4BvbiXrni8lSYOZU=;
        b=rnyO7kdv8TBjKSCx7gstNM2O47jYUphMQvaC4a0iPu7TBrsyJI3OBVC3dAk8EsVhBN
         jbLU4ohd+DYSB/La1ltq16AHcJz8V4gqI4W44GnxcdsjnO0SqcBjGC+sqdeCAuGCHPXJ
         uI8WVbld2wpCLQ88NiIRvGbzPXk7tC6V0FwTR3diasJgXE3Jm49AG37cTFX1Nf6FuvuR
         4zo/fOAAGODQ7XJbzJC4syUoHdM3V4zQeACVIhBoV19SVkYA8q+nmsk/EuFOK6XEso3L
         z+mw6zMHbuf2gaYUF7dKI1KoyMtFXH/kDONlwmIWX0rYefYg5AiW3JccW4H28PtO0OxH
         Vh7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t2vxVYv4xVR6U/qYBOPL/Sh6OEV4BvbiXrni8lSYOZU=;
        b=Vnq4AKGsWb8qenxhi5x8HWBD5wCWyvlqycm6ZsLacVpwKFHER6oGww+jH3l28ybKkl
         j4awS9tBrG5R3bwqoPg6InXMYKC67AbZ5xQDQsRrk4kGtQ6mQ/mZUbMbYxx+OytSxmLO
         DRddn+BLJkAGiRBseIGcq+yZXrfJdFL7b+eQkgUwITNGAw9h+9oHnLdbrkYLV77ZKroz
         UaF1rCPYNTT+3Ewd22dYz8J4vl+mPWRvhZYvkqtb42MBDNkzf3neeOIj1Ki6cwnJv6lG
         H226RZpCsFnH8WCmB+o+CpIonegFraFcWLZVMqHbLnNCuOh+CBLwmee9jvqih5Z/SSV+
         ApJw==
X-Gm-Message-State: AOAM5300JRz/mwlJzmDVkdk8bhBRnE2Zvjq5xSGJBOPUtoR9NFj6hrFm
        qxUJ7sRdMpHoJMB2JjxU30wlgjluCwyyjaQ9JJpEHg==
X-Google-Smtp-Source: ABdhPJxNx140asgaRv1GueBI/yRu7vpeWmLICpZwaTeVTw9FxTQuEBl8mS1SSnzvGBwKJd/qZDE7HpkvM/4jtg2DzVk=
X-Received: by 2002:a2e:711c:: with SMTP id m28mr13376284ljc.104.1590406980230;
 Mon, 25 May 2020 04:43:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200523145157.16257-1-zhengdejin5@gmail.com> <20200523145157.16257-3-zhengdejin5@gmail.com>
In-Reply-To: <20200523145157.16257-3-zhengdejin5@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 25 May 2020 13:42:49 +0200
Message-ID: <CACRpkdaPRtN3aXA_TB0dCJr2Lb29-kDwcDPTNWePQHJj5rLutA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] i2c: busses: convert to devm_platform_request_irq()
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Baruch Siach <baruch@tkos.co.il>,
        Paul Cercueil <paul@crapouillou.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Barry Song <baohua@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, May 23, 2020 at 4:52 PM Dejin Zheng <zhengdejin5@gmail.com> wrote:

> Use devm_platform_request_irq() to simplify code, and it contains
> platform_get_irq() and devm_request_irq().
>
> I resend this patch by that discussion.
> https://patchwork.ozlabs.org/project/linux-i2c/patch/20200520144821.8069-1-zhengdejin5@gmail.com/
>
> Cc: Michal Simek <michal.simek@xilinx.com>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

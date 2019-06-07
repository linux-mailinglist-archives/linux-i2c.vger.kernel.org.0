Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 616853992B
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Jun 2019 00:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730299AbfFGWzh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 18:55:37 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:32842 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729919AbfFGWzh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jun 2019 18:55:37 -0400
Received: by mail-lf1-f66.google.com with SMTP id y17so2774663lfe.0
        for <linux-i2c@vger.kernel.org>; Fri, 07 Jun 2019 15:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c/T6VjH20uvUa3yYetZY3PpFJLLU5h9EmF7PJycL8Sc=;
        b=kaBIkmemiQ2zpGmxzKK56rGmiZpJQmZWqz3oaLXQCPvA1bhpU26lX4c3AyAE1lFDs7
         x6Gdkxj3ZTOo4korQnFOjeM9rmS1lrAoEwVdxAOqP7XInaIup5UGAcZCBt++Tdab+JIB
         4G9IVix8retd3KUkVCUH7V0iMUsrBcYIYHBboktFECemb4S5gV4HXMdMwqx8VD7OAZwp
         sExLuVNXBYkVuUMeSZkPz5fGWaTmjjF7F13P6LQTcyqi4zflwM2Kg0cWVyaJ70ITtz50
         8+mToRpQMQ9svSPLX6qzz9ah39Cc+MjeE2oMDjH039zZ4wnz4gK10qWAytxI2YQnwjCE
         h7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c/T6VjH20uvUa3yYetZY3PpFJLLU5h9EmF7PJycL8Sc=;
        b=HE+1D1EgnYVejOoEQApdU1r3lGKQjk+O+IX114IcOk772B6YRmCXTeR5BWdV94nGTk
         +vi76mngNv+ryXZwB/I/dNh01gKm+WSB2Uh2OZFNTI4/MvgAj4zoFa0WtU1e0fDwqodx
         divXZoeuHETreMpMGA6g9Ia46d0JkONG1vcSgCBT5hTwpNwuYdMVelFFpAWhC5fJcnrL
         fkRN0p0+qXb7+otxY+fltEpomXaokp9E40ydaXrYCt4rLQ3h5bGLnvMYdaJZZOh7FJFX
         xWu2xx3JqeWXLETK4dYvZ+e5GjnZMsBy2reS73qKx/qG8nY3kUMFKqx/sXwQJ872wGUt
         Zd/Q==
X-Gm-Message-State: APjAAAXASjeSocMDO25vKJ/dTLNqdS3NFX+GQ3e1Exp8+nBAlI8AVoqv
        f7pcYvAPIkyJ5GTeta3M+3f6on6pKIJ0K8KJGUuUNQ==
X-Google-Smtp-Source: APXvYqxRYmUz1dC+xScN//G5lQMyOJKTxG+WVBJjntXZbf34gRGK7ry2Mx77evZPOXtw6qlEVO15Jo2i5c8aG+LnICs=
X-Received: by 2002:ac2:4891:: with SMTP id x17mr16099210lfc.60.1559948135564;
 Fri, 07 Jun 2019 15:55:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190603220819.31701-1-linus.walleij@linaro.org>
 <e992bb50-cedc-74c0-cecd-8cac37ecaf69@axentia.se> <20190604224316.slrrlinhzngdan5o@mobilestation>
 <ee06c942-ad3d-b45b-f067-bbc988595733@axentia.se>
In-Reply-To: <ee06c942-ad3d-b45b-f067-bbc988595733@axentia.se>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 8 Jun 2019 00:55:27 +0200
Message-ID: <CACRpkdYybLgfnFRra6MmY0ckk+3nZcW-3dJtA=Ay8fPd0fcTAA@mail.gmail.com>
Subject: Re: [PATCH v3] i2c: mux/i801: Switch to use descriptor passing
To:     Peter Rosin <peda@axentia.se>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 5, 2019 at 10:15 AM Peter Rosin <peda@axentia.se> wrote:
> On 2019-06-05 00:43, Serge Semin wrote:

>  I
> now have two "competing" pieces of work for the 5.3 merge window.

I had no idea about Serge's patch set, sorry for my ignorance and
overload etc.

Serge, if I just rebase & fix this as soon as your stuff is upstream, can
you test my patches?

> Which
> of these works was sent first has little bearing on my ordering issues.
> I you guys don't sort this out, I will go whichever way I find more
> pleasing.

I'm fine if you apply Serge's patch set first, I can just look over the
result afterwards and see what remains to fix. My only goal is
really to get rid of all <linux/gpio.h> from the kernel in favor of
using the consumer and machine APIs.

Yours,
Linus Walleij

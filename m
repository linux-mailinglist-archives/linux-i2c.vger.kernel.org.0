Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D34DC16F252
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2020 22:57:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726607AbgBYV5s (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Feb 2020 16:57:48 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33093 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbgBYV5s (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Feb 2020 16:57:48 -0500
Received: by mail-lj1-f195.google.com with SMTP id y6so645316lji.0
        for <linux-i2c@vger.kernel.org>; Tue, 25 Feb 2020 13:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PS4ojrLA1zAXeV8epjJFY/JfAj2KlfBznepd1UWU3Rc=;
        b=XPpfNpCg/gM6NBmhrriECcwnc9PD3LNwzHEiOv3JfYb/pujoSNP6uFgIGw9jcTw7sv
         66/beOuAr7KCuGrO9x0oNjl3I0VIukDfoPb66QMaGBeaYofgGgz9YgXindTIhlCFHf/I
         tJCh3BbEhXvCq2FP6R2ljY0Qe4JyN8JfA4XxkjfcN8hrzi89m0EYxk9klPddMeILYbmN
         hgnWPcXRVNVZq+I+UlvYvcd7Arxfvkef6uzKfv85Ilju1vCKB0c7OHv9NnIEiC639un3
         ejeo5vo5NKZcOpzJOT/EG2ZA7zInxw8Bil2S7Zo/omo7YoLqjcL6ybI5nEA+wcZOZ3Qj
         KoRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PS4ojrLA1zAXeV8epjJFY/JfAj2KlfBznepd1UWU3Rc=;
        b=sN3OHPqUe/zs7GWhAFehEtWWIPpBLGhuWCxXBDHsWe76E/gq6VBwSsMsZORfOy1ZGr
         Sadl3K2HMw5+JLZMEva7yUEdfrWV+br9uNkJZgdA7fDgHqayLlNF9MiM4J+DX0c8ChNF
         5T8HNUdOhb1/UPhyejd+zhWjVom7kS5pBSULJ1grGQY4prDi5M7Q0obDqJjwAboZwHqe
         f+qmKmUoW9VK++J0bp1PzzcoYQvgkoZKmGxDlkHs+KFp3fGkWizo8iDOuMGskD5CVGuZ
         vQTAsgh1JiMGP06XZwj31A4KG/0MZWZmf2c5fGqDYSn+Q9kif2NkOd0aH1eKe+ah6Y9K
         DUBA==
X-Gm-Message-State: APjAAAUQ4TX7+XRx0Gb/qVuQ2Aeia+aHaY6S8oHmhEhk+0QrQrob5BHL
        Zkaa2Wf6x0+Wy+3CcussQzs8TfIpTC2NtTHTpL67XA==
X-Google-Smtp-Source: APXvYqwF/iVa1GsHPpZUQYV2tbSg9hSyq2EWQPrve5TZmgKM4ZMGdU6+EMxXYarXJwg2rGdQY+KtJvcpf5sdEaia3Qg=
X-Received: by 2002:a2e:81c3:: with SMTP id s3mr660033ljg.168.1582667866024;
 Tue, 25 Feb 2020 13:57:46 -0800 (PST)
MIME-Version: 1.0
References: <20200224151530.31713-1-andriy.shevchenko@linux.intel.com> <20200224151530.31713-23-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200224151530.31713-23-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Feb 2020 22:57:34 +0100
Message-ID: <CACRpkdY1rWB_FH4-RnFqW7VsevmBCkQeuPkH0QE-xmkP9-GaLQ@mail.gmail.com>
Subject: Re: [PATCH v1 23/40] i2c: nomadik: Use generic definitions for bus frequencies
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Feb 24, 2020 at 4:15 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Since we have generic definitions for bus frequencies, let's use them.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Neat!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

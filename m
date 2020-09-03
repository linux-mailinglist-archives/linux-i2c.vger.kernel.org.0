Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE2F525C526
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 17:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbgICLWZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Sep 2020 07:22:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728344AbgICLHg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Sep 2020 07:07:36 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EFE5C06125C;
        Thu,  3 Sep 2020 04:07:07 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id 17so2036396pfw.9;
        Thu, 03 Sep 2020 04:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eaRhsZ5TWpfGSPdWSz1VTVO/mX4t+F5UcIQtgVoahy0=;
        b=pOAISEGLGapqlDNpjEyrYBaAWWHCLZskiXqlh+HTkbAlUtPGW03AZqfOZ3hYuFyLbk
         lVD/q/IhrFnVi8CGt4+6D+XTK0NJl39HWm95D36dIPjI28fEOhMxhzxAT7rHsQQPAZrt
         smLXj7Pyz+w2tOkyJGqF/AcVBPEadWdkY3CFpTjA4+Fqi6lTgJ/diuVMUl9wZ1mPKrPo
         e3lplG7jjPGbp/idOhPr16vxd7cMzWkeIanwZSbiZ8hUgXr+M92KcbYeOuq18bU9M/A6
         j/sR/JAP8mfnkqspbu7n6oanpUB387x/uLQJ8eq//8xolL9L/CEXsshXX91FvOmzdlQi
         Iqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eaRhsZ5TWpfGSPdWSz1VTVO/mX4t+F5UcIQtgVoahy0=;
        b=kRXRzaoRUuwZmCRJ8VZaAGZV0pexjtmnIeY/YRoE6Fmy6X3t8H7B27BZ4R377bg84j
         WJt7p6q0dAAVa1sDrRDoEvdTUo8PnonwWaocEaKaK9JQHPl3l9ooC4QJSb9tYIWFq1Rh
         tDVA5dQu2BovPG0ZqHj/TG4+l+gx3l1in0qnJaT/JyGDpoy+Ge4YafL+LCbH6pEvM/Ke
         fRi5DDlS6dOs2aB5PnxR9cv6BrWZ4bAjwQqgSRutsLY8hOfeHVmnF0qLgyWkQnbO5Bqv
         22YE4Is01+JK9942PzSoEdIJ0Zu+t/dXRBPXtXB9NOGxcmXX66LhCRH3xPI4AQ44iB5v
         m2KA==
X-Gm-Message-State: AOAM533sBkYheN4TYSGJBIZ0HwUJfjYRbhyg/QNwbNDk0G6vBckvrhw7
        /voV8x6rz7xHQp8GycjD03xkxYocUUBpAFo375s=
X-Google-Smtp-Source: ABdhPJwuGc2+bCg2ErG6/q6jf3bKJSgb0rbju4qg8koUw0SNPYEPIhl4iKY40gX8AZ3+BDdHmV3pB+52drdFpLjXWtA=
X-Received: by 2002:a17:902:ea86:: with SMTP id x6mr3360111plb.131.1599131226890;
 Thu, 03 Sep 2020 04:07:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200903005300.7894-1-digetx@gmail.com> <20200903005300.7894-4-digetx@gmail.com>
In-Reply-To: <20200903005300.7894-4-digetx@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 3 Sep 2020 14:06:49 +0300
Message-ID: <CAHp75VfFZ2bgEqS7cbTfYzxtXk3T5VaoJpum5aiNMpfvhfbuqw@mail.gmail.com>
Subject: Re: [PATCH v3 03/22] i2c: tegra: Clean up messages in the code
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 3, 2020 at 3:53 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> This patch unifies style of all messages in the driver by starting them
> with a lowercase letter and using consistent capitalization and wording
> for all messages.

I didn't look at the rest (yet) but this series has a patch ordering issue.
Why do we first do some little, non-critical clean ups?

The preferred way is to arrange like:
 - fixes that may be backported
 - fixes that are likely not going to be backported
 - features
 - cleanups

In its turn cleanups go by severity:
 - code affected ones (and maybe logical changers)
 - ...
 - commentary / indentation fixes

-- 
With Best Regards,
Andy Shevchenko

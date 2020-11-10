Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D5F52AD331
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Nov 2020 11:10:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgKJKKL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Nov 2020 05:10:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726428AbgKJKKL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Nov 2020 05:10:11 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DAB3C0613CF;
        Tue, 10 Nov 2020 02:10:09 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id 10so10994726pfp.5;
        Tue, 10 Nov 2020 02:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UXw8lANWF+DcYrvXP88miW026AegfOsaawplpvjBxqE=;
        b=cEMrRLXJk4TxfgLHrnJ0KtZ577dLW7PN6qJQObYGQRaea5tulrv+Q+aHNxg2HT7S5W
         5CYUwE8bvpxhx1Ua+KmsO0Mwu4ZBO2VHhjtKRvJcNbYbKheP1D0H/KhEHypkPgPaVWky
         siNtBarPoL1EOVi5TjZ1a944LKC3Dhab9zi58IzRgBtwKxmUdPERFg5Ri65GFYAN0QkK
         2nCQ3EEq5YydCF9rASqVJfrlmgr7552w+yXW54+O/ffksYmfkcsasR11Kj2Wduch4QYI
         IyowkfP3+1wX+jumWTkQevSkJ76eTVhgsZg5PSujtEUY0gS5tUPL4Mjjl6euM87l+1e/
         /zpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UXw8lANWF+DcYrvXP88miW026AegfOsaawplpvjBxqE=;
        b=V6Ub2lu54HPIroQSNObTst6dxSsdScI11JGeNYs5ycEDMQxFErWz6Xl4PFnX5oEenn
         MQvvJBcSnlFQdkKTpTItE3DyaUwTgqIZV8hrFGvlZwY16IuammALlKEtoXhw+jj5yayW
         y0vw4euOSjZKK0EYrDbepj0Wzegd369XmUVz6F8z8qOWTvyQz+30fck1L0+RPYd7UTq5
         WD0igYqWr9qpXBbhINXtZ7jOdqS9f8GNOVy8WpaQreOx6fEBNTBt5DOT6d6peVpdtuvw
         6aAPfFA7rf9z2Nkqi9W7Ytx83EOUUjSfa1qZxhOz4HEbwo2UCT5m++dGNxJz7sH/d7P9
         RX7g==
X-Gm-Message-State: AOAM532sDe0XnztIqVJmGbnPUMXLZ26cJf/aMp5C8qfxt/MyIP1mEqWl
        25DcZ5uG9LuGgT38BEfc1EDnEQBsBZHvgkt4Oso=
X-Google-Smtp-Source: ABdhPJx881zO2y+CaAaDgUOKp/Hn8wFf1KCQnm0amakLKef7zPJ3yRQ4utVIclEmizF+k3sh7fxjXfwqVCQfUKeyvRc=
X-Received: by 2002:a17:90a:4816:: with SMTP id a22mr4416818pjh.228.1605003009064;
 Tue, 10 Nov 2020 02:10:09 -0800 (PST)
MIME-Version: 1.0
References: <20201105080014.45410-1-hdegoede@redhat.com> <CAHp75Vdm4PuQpAMj98wJZoNMwV2tFGPj-r9ezvXyWCYj2cSuaA@mail.gmail.com>
 <81343662-aaac-a5e8-af86-1370951ff646@redhat.com>
In-Reply-To: <81343662-aaac-a5e8-af86-1370951ff646@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 10 Nov 2020 12:10:57 +0200
Message-ID: <CAHp75VdbHPwnOAUWjSN+HuVsWVb=8EUwfWNR1onL9QNrX8yU0w@mail.gmail.com>
Subject: Re: [RFC 0/4] platform/x86: i2c-multi-instantiate: Pass ACPI fwnode
 to instantiated i2c-clients
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 9, 2020 at 1:33 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 11/5/20 11:38 AM, Andy Shevchenko wrote:
> > On Thu, Nov 5, 2020 at 10:00 AM Hans de Goede <hdegoede@redhat.com> wrote:

...

> >> But before coming to the conclusion that i2c-multi-instantiate
> >> would not work I had already written this series. Since this might
> >> be useful for some other case in the future I'm sending this out
> >> as a RFC now, mostly so that it gets added to the archives.
> >
> > I think they are in pretty good shape (only the 4th required a bit of
> > attention).
>
> FWIW I agree with the changes which you suggest for the 4th patch.
>
> > Please, send as non-RFC and also Cc Heikki (just in case if he has
> > comments wrt INT3515).
>
> But do we really want to land these changes, while ATM we do not
> really have any need for them ?  Esp. the
>
> "platform/x86: i2c-multi-instantiate: Pass ACPI fwnode to instantiated I2C-clients"
>
> Change is not without a chance of regressions. The acpi_device_is_first_physical_node()
> behavior surprised me a bit while working on the BOSC0200 changes. So I'm not
> 100% sure I have managed to see / think of all implications of this change.

I think in general the direction to switch to fwnode is a good one. I
was thinking about moving i2c core to use swnodes in which case they
will utilize fwnode pointer. But it might have complications, you are
right.

> Heikki do you now (or in the near future) need access to the fwnode for
> the TypeC controllers handled by the i2c-multi-instantiate code ?
>
> Note that if we do decide to move forward with this set, it should probably
> be merged in its entirety by Wolfram as it also makes i2c-core changes
> (or Wolfram could just merge the i2c-core change and provide an immutable
> branch for me to merge into pdx86/for-next.
>
> And then your (Andy's) cleanup series can be applied on top of this once merged.

Fine to me.

-- 
With Best Regards,
Andy Shevchenko

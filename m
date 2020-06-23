Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89CDF2058BC
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jun 2020 19:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733127AbgFWRfS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Jun 2020 13:35:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733078AbgFWRfR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Jun 2020 13:35:17 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A277C061573
        for <linux-i2c@vger.kernel.org>; Tue, 23 Jun 2020 10:35:17 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id e5so17433238ote.11
        for <linux-i2c@vger.kernel.org>; Tue, 23 Jun 2020 10:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8ZI+FsQ+T9XTOAQXfY1vb8oeMac0yFiRWy8EYUCQ8ak=;
        b=tQLVwQqn53945StArQedcIw1lLetSwzyVAw4kSEeAYsyP8vWV3O/VpzXefRnpzI8uv
         V+52OY3hlZ4GYZpoqy7mo7LI/ehFv2bcP4T5BCPALwe8olCBa0pTK9q5hb9pN66vLZ5H
         gN5Dgq03w8ZQMz2y/46gzd/o+ePQjo0h1hHTyhHzmRfRGImIhdtz1QJCUc3x8dT11RON
         pWrUJQ6Lat9l4S2o3R8eBOQWA17eZ7FAJg5Q5vNj8j7PU8yTCqEXFmFjp1GkmnInHLk3
         /FQ+KTINkgjxsvHUL4wN0vhEouiXm0/RcukH+W0WVV0QtB1sKPecG6kKBEBJ4M5SLoc3
         RL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8ZI+FsQ+T9XTOAQXfY1vb8oeMac0yFiRWy8EYUCQ8ak=;
        b=dmWAAWvqZvV3VhJs3nzw6kj+fkDfHqpjjpHxn6INoVk0aD9n2ROpU1hbcOynNS8vVj
         2vncsPIaSr35u1ZjmOwUZGWKwWKWqibeDFJNnxiVdADGj4HZKlzyELXCYxq5fS/PNjXb
         HG7sdU0fYYWf27h+8pgAk5e/96F3r4oqdQoTjvxY1u1Q+HbGhKOtovcTCet1TCOs+f1m
         1+SWImIiBbttbf1eWLdBR+kKq1/NsRzZYsZXisczHa2kBkrumchDgGpuerILWlkd7Xf5
         k6PBLEqlBIx97aSjzQU5jEDEHFwaqVPTEQ638EBzI4wN6wMqKxX/K43zsq2AxJs51LXt
         FNcw==
X-Gm-Message-State: AOAM532oudVxpjZBPQymV4qimLAC/Q8JKg1kxV+4VrhON/nEJ0REqS0B
        nnCgq/JGjdiw5jo53BWpEjYGsnPzJ2i+b1ABB0M+Yg==
X-Google-Smtp-Source: ABdhPJxhaSKlaqDctIqXMMFF1FWvlE4xL19gASPKUIDUzwEdrLbm9bBP/Gae5VL5HJNnhCxSl1Vbq2SUOrZLeIoiQ0Q=
X-Received: by 2002:a9d:67d6:: with SMTP id c22mr18461806otn.221.1592933716517;
 Tue, 23 Jun 2020 10:35:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200623091501.50070-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200623091501.50070-1-andriy.shevchenko@linux.intel.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 23 Jun 2020 10:35:05 -0700
Message-ID: <CALAqxLX_d3UencbsLZYw==FeZZjT5krf2NtwX7QxQKAt2aYS+Q@mail.gmail.com>
Subject: Re: [PATCH v1] i2c: designware: Adjust bus speed independently of ACPI
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jun 23, 2020 at 2:15 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> John Stultz reported that commit f9288fcc5c615 ("i2c: designware: Move
> ACPI parts into common module") caused a regression on the HiKey board
> where adv7511 HDMI bridge driver wasn't probing anymore due the I2C bus
> failed to start.
>
> It seems the change caused the bus speed being zero when CONFIG_ACPI
> not set and neither speed based on "clock-frequency" device property
> or default fast mode is set.
>
> Fix this by splitting i2c_dw_acpi_adjust_bus_speed() to
> i2c_dw_acpi_round_bus_speed() and i2c_dw_adjust_bus_speed(), where
> the latter one has the code that runs independently of ACPI.
>
> Fixes: f9288fcc5c615 ("i2c: designware: Move ACPI parts into common module")
> Reported-by: John Stultz <john.stultz@linaro.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---


This works fine for me as well! Thanks so much!

Tested-by: John Stultz <john.stultz@linaro.org>

thanks
-john

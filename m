Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A7E81811F2
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Mar 2020 08:31:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbgCKHaP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Mar 2020 03:30:15 -0400
Received: from mail-vk1-f196.google.com ([209.85.221.196]:46626 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbgCKHaO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Mar 2020 03:30:14 -0400
Received: by mail-vk1-f196.google.com with SMTP id s139so240336vka.13
        for <linux-i2c@vger.kernel.org>; Wed, 11 Mar 2020 00:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verdurent-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=58gY/snG1zfsmEZwfxQ5qaU+C0JmXrHYD5/aDq4nrYQ=;
        b=FLAgdxR84+bL2lLAlWAAEFw9D/rrFsKwBW3NqU3pB7Sd3LlMlfWJGGwFDELCQ8nba6
         w08dOuNNjL7cSbUkm+r68e74x7KnCX5SuV3O72x+b16ktxO7Bqnpn2WZjSapQ3n65h0C
         kO9aFSFDG4lnTOGlHQUzYx7P+xmsnTy28GZuzZGMKuX0GfZqokjoLYbSdcgyOltE2XnW
         /U6V91Dm0YwZKsEHsjSAEUjVbpOjOMTzZfijDt59h5x8kIYg9YjjLrSMfJEZJE2tjub4
         9Ed2hzEM1e6Ayykz4Or5XDKHdh+/GvRD8XzVWt9/kD5HATSLtWSpOWwVeyaxKifercaZ
         f9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=58gY/snG1zfsmEZwfxQ5qaU+C0JmXrHYD5/aDq4nrYQ=;
        b=FHvVnNcqiwLe1ar6RziBgGCixR/bqZJRib2Pnr5bD2GkpsIyI6gVLa26iVgqVc3jI/
         PIwCzxmVxnKiHdMt7hEojPLSi0L9WQm3urmI5vYPDw+gC/3BlnfWDyEV8OuR1s7ZEwrZ
         N4no7+ZkC5PZ+xr9V8LmGlHo3HK0pdWfa5vD5tb4lidi9Bp8lf51XFMK5ewyZn2WJ+jP
         BBqs+Pz4EYRIJAjHpALYPgOgVHzrnuYxDXSDRY1VCytOfp2q7FiN/p3a4O6bf7cBa3WT
         aOhnzJGhsPnEWjFxjhbYvvlN5A2SWqF9CXbA+tKhsqVc9IMs4nJ7Ac/j4Hj8f/2wcgJL
         f9Og==
X-Gm-Message-State: ANhLgQ3TG1DWMDBOYgNqlQ+mKOpyUqZ6cQjpi7hYsUJSkqS2hRfzodmt
        iOnI3Z0qontshJ3x/ppBx2YMuwrAMTyXUsxK1FACdQ==
X-Google-Smtp-Source: ADFU+vssJBpId4km4y7xMSEYOl8Z2O97oRKgr/2SAIkTHcB/axtJtiIDB0e8r9ITlvulJ0M4u7XGQfFVYlOgl3EgQ1U=
X-Received: by 2002:a1f:cbc1:: with SMTP id b184mr1095491vkg.73.1583911811319;
 Wed, 11 Mar 2020 00:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200310154358.39367-1-swboyd@chromium.org> <20200310154358.39367-4-swboyd@chromium.org>
In-Reply-To: <20200310154358.39367-4-swboyd@chromium.org>
From:   Amit Kucheria <amit.kucheria@verdurent.com>
Date:   Wed, 11 Mar 2020 13:00:00 +0530
Message-ID: <CAHLCerM8XT_SwpqDAHrRJTy8T_74ASM6cedo_4gwLxvBOo32rQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] i2c: qcom-geni: Drop of_platform.h include
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-i2c@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Alok Chauhan <alokc@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 10, 2020 at 9:14 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> This driver doesn't call any DT platform functions like of_platform_*().
> Remove the include as it isn't used.
>

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>


> Cc: Alok Chauhan <alokc@codeaurora.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 2f5fb2e83f95..18d1e4fd4cf3 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -10,7 +10,6 @@
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/qcom-geni-se.h>
> --
> Sent by a computer, using git, on the internet
>

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75EFD260E10
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 10:51:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730061AbgIHIv4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 04:51:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730054AbgIHIv4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 04:51:56 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8275C061573;
        Tue,  8 Sep 2020 01:51:55 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id d9so4117785pfd.3;
        Tue, 08 Sep 2020 01:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rbIICoIBBZ5GNj9XF7FvYyv62Fc59HG0vpn/olGWwH4=;
        b=G6fK6CUzeTZ4EOsL2aQLd7TiWXtS19culOtXYNIy5V2cg/RT4hS+92jOKdhafB9kjG
         pOZ7O8xnirjsXoUjdqeTJVvA6kVXaGY6Nvn8csW7nMsqJI3+zTZYrwqDGAkC9HGsmiAF
         3yCTI/ahUgKoi94Coa05G1lr9yM4bk6vsYTWEQuCUAfKJmyh7DyN/ObeR7hA5CSAUQE0
         DEYxBKAYBd0zNk1Qea59f8IqxiN72cydOyYqwKYbShGuSWWCo2MiHQB47r1tjyRTvaT0
         qmDw2AGfS1XC2cR5yp88ZC5lh6q17LePP0bE0F3AEUc/AcspGPgIUSqZymOXVJkYOX/v
         RyVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rbIICoIBBZ5GNj9XF7FvYyv62Fc59HG0vpn/olGWwH4=;
        b=CL2nzLbXwXRBGnB9vpCI9Fj9EtZDAxkEC7bW7nuqBDA05ZbmKuAJf3wCg4rDh/Adr0
         7D57Sr1LhF7q8AmqDEYBI6KTp630iWNyFyvlyrw+caJndMbIz8YefYtD2hUz5doaFPvP
         O+QR0Pw/3vn8vCC8ZN++dYmVdPDuNg3jhe+FchjfIa9M0I26zfqW7MqFHeXmFwta5NhF
         MK1zyGUIDLt4zsmXu1yXGhC5rkmv5kXyp794e7xBpDcin3sWwOPk14nhVQHoWfwsVQ1x
         eaJ13OrS+1UsJULThFWiJfMCuJVH052V5ZZKujS8DZ19SAVNuzhs3gP0fXhAzLk+xGhZ
         4cOA==
X-Gm-Message-State: AOAM5336VJ+0jZMndclc6t+nQm11xJf8Zya+feZw507WcNp09EF1tjws
        uN01icj422niwoq1KcsFFnW9g8A5tSJGd3znESE=
X-Google-Smtp-Source: ABdhPJyO2SAle5+IZyYDqfFOgNEwCXJ4lPQkEuklkNnNAIux8iHnnhoHlYtGoxZ1/EJONsStIacrzU1LrXQMi8aUcoE=
X-Received: by 2002:a17:902:6bc1:b029:d0:cbe1:e76e with SMTP id
 m1-20020a1709026bc1b02900d0cbe1e76emr226751plt.21.1599555115180; Tue, 08 Sep
 2020 01:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200908021021.9123-1-digetx@gmail.com> <20200908021021.9123-28-digetx@gmail.com>
In-Reply-To: <20200908021021.9123-28-digetx@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 8 Sep 2020 11:51:38 +0300
Message-ID: <CAHp75VeMZhVvysVHZawutvPpO4MPeTit5OqOJQxqRW3RL_iE-Q@mail.gmail.com>
Subject: Re: [PATCH v6 27/35] i2c: tegra: Factor out register polling into
 separate function
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

On Tue, Sep 8, 2020 at 5:12 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Factor out register polling into a separate function in order to remove
> boilerplate code and make code cleaner.

I'm wondering if you can make it before the patch that touches one of
these conditionals.

-- 
With Best Regards,
Andy Shevchenko

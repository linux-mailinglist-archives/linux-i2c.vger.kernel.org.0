Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E03725F4EC
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Sep 2020 10:21:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727874AbgIGIVV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 04:21:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726997AbgIGIVT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 04:21:19 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39261C061573;
        Mon,  7 Sep 2020 01:21:19 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id u9so300133plk.4;
        Mon, 07 Sep 2020 01:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WnINdwzH4XUyWBDxrvppFurUIcPBawpPrLgxVohQkcs=;
        b=f+kq2+jmyPZ1rQBWeFGXLXxXUewdkODNiEBNEPVpdPl7ci/cwZGp2BZPC9VdSQKN5Z
         Ee0Ra69yryupyiGUa93p3UbA9mMq1RHG9aC918wmJNvFdaBTNWmA6E4kRp/dGfFOpBVh
         vtC61JKQwzaUjvguhBiSqgc7ryfwRB5kcqZsXr3XvofCuDpDo8I5JW5704LbB4z7bWT+
         Rrcre0SVE8DDaYw6zSxy823meMzcvWKIx/H+9IpOjgC/ZY+hnQIviM6uqBhS0jEMqbWI
         HSYZ3FeV+RJwaiYeQjtwP4JJ7Ig/mw0QGyiyD1ux44DfBFd5X29I9zAEHFv3k0oxE4yF
         BrLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WnINdwzH4XUyWBDxrvppFurUIcPBawpPrLgxVohQkcs=;
        b=VPpHJahedYMAjiRvmEiuH8TI0G2i/9c/qAg3mrvD2wy4/mu1ZI5tD5CEis1NBxZppM
         l5336rPEyRL4+k2hzX3Fihr1ccEW/zwnlIzs9SyfIWpixEKvT09ugKxVHNg0jGdBK2/t
         A3TTj2ZCQmrVtaBdKkjzunHLcUFVSX2KuwAHHB7xocH9sUP7LxIXlAgNFAjV1j+a9zeO
         +F1Md85XKCniguU1sx4/VLWFm9zEzYYUcPzpl3y7rPwNmY5UmI8lnpRBFL+wHvSilCTh
         mRsg9M8UyVYrgkp+N30EWb9sEZ3GcfraC4AQ6Wq3eEg0vBri08nztB34ext5/0GbDh9e
         K9DQ==
X-Gm-Message-State: AOAM530g0q2X66bxSj2HbVTfnieCmaRnVZTT+vyssxkcjMEtdoE+xVqU
        RleO0YqrslXsiGjqDMhzZtyeRIz4IWMWr6j2g5vuUXhf0lsReQ==
X-Google-Smtp-Source: ABdhPJyEM5DkqNVfZ9UAM3aRAKO6QNkzmb2KiUjI3nyh7+9hBvEYBZLW1+rq11WWOV/5pGl4t4YY/DxDKPoTKfmc6G4=
X-Received: by 2002:a17:902:b289:: with SMTP id u9mr18700073plr.226.1599466878796;
 Mon, 07 Sep 2020 01:21:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200906185039.22700-1-digetx@gmail.com> <20200906185039.22700-12-digetx@gmail.com>
In-Reply-To: <20200906185039.22700-12-digetx@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 7 Sep 2020 11:21:01 +0300
Message-ID: <CAHp75Vfo1L4yi9icV=_NEDVcTqxNbCe0uVPSZUhwKJNj9SYjYg@mail.gmail.com>
Subject: Re: [PATCH v5 11/36] i2c: tegra: Use clk-bulk helpers
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

On Sun, Sep 6, 2020 at 9:51 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Use clk-bulk helpers and factor out clocks initialization into separate
> function in order to make code cleaner.

Suggested-by? (If you consider it appropriate)

-- 
With Best Regards,
Andy Shevchenko

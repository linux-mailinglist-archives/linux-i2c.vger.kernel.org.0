Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 794D125F4C7
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Sep 2020 10:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726928AbgIGIOD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 04:14:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726978AbgIGIOC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 04:14:02 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CACAC061573;
        Mon,  7 Sep 2020 01:14:00 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id w7so8249517pfi.4;
        Mon, 07 Sep 2020 01:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z/owo2LiY5pCBUjFzlQoFYkmB1t53TMR60gw4kWIvCM=;
        b=sBs9na7HipP6TCwdsifrxcLkPXiEOSidHyIhfh2X1fuz4VOtNYWbZ2iAz+V0xriDOW
         Bq0+/OS5TSAU0shKujU6s2OGcSO9oLkT2r60+PT6nMojaMIbqubI7yHu06xLuKKzH0Cy
         Uv7JsT8crx3ulmzOumniEprFe1s4OL2+Z4NvLwQS9qaWzdegQAWiBNDqIsDHS6qbUBn3
         rCdiTpplnaoIPGkQYYpd222QfZOLRa4G/xBSzmQ3ltBeSholAKEKceOZA/d6NzFcaOyW
         9HAxRoTcXp6yf2mjnlC4z6wKJVNwmySjDY9PUYaJl60Fa1sF0aplbsK1TUzMaaEPNCs7
         22SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z/owo2LiY5pCBUjFzlQoFYkmB1t53TMR60gw4kWIvCM=;
        b=lWWRYRon6hLv+Hee2KQLHVjveVA/VXm84Z+Jml59MbzgJAvpAtTn565EHFBwsdBi95
         NJ9sHPzN4XlUd4E3F3ef9jHQA1KfVg4qe9ihgyXtEUVJF4DuacHA/SkD7nluoIUaj39O
         qnLT/CikZhiiWNFKisp4DnimzrEggWGN/CGytcp+yIRwpckK3NfHaSJfTpxagDbs6IEu
         wuxPLNAbhMITd4dN5sjZNX1q8Uvth8dKWbzxCN0xjFYvMJlwDI6zo3O2D82E99JmS+Fb
         OVVDcwL4nsGsbD/UQ9UwL90VY6KDFORQKolAfbkRqr8UEtDGA+y+aVQY8s9aw9sDjVlR
         EumQ==
X-Gm-Message-State: AOAM530BQBkpeHcQfPctzU/edrFqvFfzCu4bTlO2QQfNUXJ8o4RqsTch
        uvbq9rOfALQI82bVxq74iTv7CxFi1rnGL6u6t04Jb8MoHC+EDw==
X-Google-Smtp-Source: ABdhPJwHVaFMdA0ujHkXzjXMfKDwkw+TUxilMHeTMNVcirEXOC5t7cyh3fOSpUwWF3vcWqwXk1WNjIVoYrd7abjwUU8=
X-Received: by 2002:a62:6083:0:b029:13c:1611:66c4 with SMTP id
 u125-20020a6260830000b029013c161166c4mr17988328pfb.15.1599466439808; Mon, 07
 Sep 2020 01:13:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200906185039.22700-1-digetx@gmail.com> <20200906185039.22700-9-digetx@gmail.com>
In-Reply-To: <20200906185039.22700-9-digetx@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 7 Sep 2020 11:13:42 +0300
Message-ID: <CAHp75VfeXqmc-YVk1tTHEPPXBPOZfDy9pKvW9QXom50dibkg8g@mail.gmail.com>
Subject: Re: [PATCH v5 08/36] i2c: tegra: Use reset_control_reset()
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
> Use a single reset_control_reset() instead of assert/deasset couple in
> order to make code cleaner a tad. Note that the reset_control_reset()
> uses 1 microsecond delay instead of 2 that was used previously, but this
> shouldn't matter. In addition don't ignore potential error of the reset
> control by emitting a noisy warning if it fails, which shouldn't ever
> happen in practice.

Still it's not clear if you check the datasheet or not. Some
elaboration would be good to have.

...

> +       WARN_ON_ONCE(err);

Why screaming here? Wouldn't be dev_warn() enough?

-- 
With Best Regards,
Andy Shevchenko

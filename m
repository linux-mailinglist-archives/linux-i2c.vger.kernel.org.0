Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD84025F54A
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Sep 2020 10:32:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727874AbgIGIce (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 04:32:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727807AbgIGIce (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 04:32:34 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A665C061573;
        Mon,  7 Sep 2020 01:32:32 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id mm21so6380739pjb.4;
        Mon, 07 Sep 2020 01:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0kLW5Y5jxw0TW/g+38xiE8cSYLcd3/NtwgT6Jz0KRbE=;
        b=pWYuDWDKai3qEj3Nc14HE/TxyW1+/AuFPIGTiJ1QDkh2VVsZgpCqPXdqS+sAf5ekb0
         5xLdrdhOtZ46JLYEzOH2gei7RY9T2GEqJ3zuYE3M9mti3tdt8UHnaMHg+7VtnIo0LdxI
         TVyC1QpioAuL0TfyJQCL2/++wL+9j8EExzXwcqm2ZHaphq09C3do7QaH90XgPrt3OZMd
         WXNpbHJrmqZ+JdHkQJJTq7rP8RCjO+096tm3yJKB+qMn3usqGEuwWla9XSaObDdJU2sE
         OWVNbJNoyGtCa0PXndUWWSYdI/9YbQUPXRXSJdQJ6P5tjJgfrtR/s2ccVGiGHIja8akt
         Zwxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0kLW5Y5jxw0TW/g+38xiE8cSYLcd3/NtwgT6Jz0KRbE=;
        b=ZyanaTwD05EBnxnOzM6PIcnVSkk5dGZ41QnbS0bqfaOWrYw4IlXBGTwMxBXeOU4w76
         FMxcw+etV3HUsfebXDyCd9xQ5iuxXyRIr4Yq7Bp66U300NDrJdU8ilCAZCMjknyB7Nts
         7YKx/20xfBN8uJaE2WN7+IjByfMqhKc2YzcaJABK64EYRYhAh0pFi3iXSUBeXAtWt7va
         z+5g8mpiZrT8UX4AvuGSaXETDrGfIKTg7lkp2LJAFXXDfdXD8LibyP1mJJGrFIO+D9eQ
         rbzt9PdOMwjaDo6Y3esz/tBbdeNc/6obZ8cw/y67c8pKAufee6drTdXigUoz69VZdIJu
         a3pQ==
X-Gm-Message-State: AOAM531xgRx0P4J5spxL6FfHyG3pwPv1jZEX8JLN3qXT9rZVpfA68xQQ
        ixTCV1yPWF7C7hTvUiqlzyW/E9woDM9VozkzlaQ=
X-Google-Smtp-Source: ABdhPJw4D3rglgLu0nrgT52NBe8Iw7n02nwj88iERjQUIsyt5l54rmTLp600wtYn80naTZ1gaa2MDrp844BfQZfzBDc=
X-Received: by 2002:a17:90b:fc4:: with SMTP id gd4mr13392870pjb.129.1599467552145;
 Mon, 07 Sep 2020 01:32:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200906185039.22700-1-digetx@gmail.com> <20200906185039.22700-37-digetx@gmail.com>
In-Reply-To: <20200906185039.22700-37-digetx@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 7 Sep 2020 11:32:15 +0300
Message-ID: <CAHp75Vdgc9HPQ5JYRoTa4Xt0-UngLiqGNXi_SPJh3PZeT81EsA@mail.gmail.com>
Subject: Re: [PATCH v5 36/36] i2c: tegra: Improve tegra_i2c_dev structure
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

On Sun, Sep 6, 2020 at 9:52 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Rename, reorder and change type of a few members of the tegra_i2c_dev
> structure in order to improve readability of the code and have consistent
> typing of the variables.

Again ping-pong.
Should go before kernel doc changes.

-- 
With Best Regards,
Andy Shevchenko

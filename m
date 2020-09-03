Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 328C825C529
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 17:23:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728129AbgICLVu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Sep 2020 07:21:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728330AbgICLLX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Sep 2020 07:11:23 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE974C061247;
        Thu,  3 Sep 2020 04:11:22 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id e33so1876952pgm.0;
        Thu, 03 Sep 2020 04:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=AobGiMqA/cDFWY4Oywceftiem4qTQGg8aRmvx/rxcd0=;
        b=BVbRyPosrveWpQahdCcvHTRppfLuXeS3v+eTlwJFCAoPh3ntC5bQROHsHpugizKvdt
         cgiVCHDYUMP2nZhqAJQ2AwdrW5nAlLjnuHxc0fJ6bI++ZNnXBR9M7kwi0c/EFdYcLE+n
         eVS/idRookFVOKqrMSubmrwXX78cnmETb/5mzEytvnmtbeZzrYWW+Aof+CdKtOeYg4ki
         m2Dz1IqrkAekl4/M1WuGF3G3YiD6iY+szu8L1BWFHDoGJb2sDSQa7rtzf+UN3Kb9eIev
         Fa5y4hisZyBqoUEwy/vvxR/G5zL2YREMY+GOHwV8bLPX6rZJIL3zlR84yfhExQPYVKKT
         HrrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AobGiMqA/cDFWY4Oywceftiem4qTQGg8aRmvx/rxcd0=;
        b=Q811y2WVOb0yIp1iubyTRyVHQ1D6FbE+OGeS6vqu0uXbFm6aJtV/buwIcR82eeE2JH
         IJ7EbFurxD06k2fq6RbtaCQMNV8spElpzFkFs5RAAVXNKXOzCa4m1gY6oeH0KdRKJB7X
         X8raWCZT0MxV/MllHyUIKmhRqsd6AE4AzxI7TdkA6elRfUAJwpceBOryXMD4j0ctco1q
         pNZjP2VDmmvBP3Ihmc6JQ5U57TZ6banpWJF2zTWKs0UwBDxrcwIGsw0Tj5XqkY1MIhJG
         JSSoQzU/7kKBZ8mb4G7uU4WGtH6OJum40F2c+fWHUeYaPwVSIc8pNn6R6uAnqIZl96e2
         2Afg==
X-Gm-Message-State: AOAM530KhF0tAEjHUgJFulOCHzWGO/JfrBwD/ph0v53QtPBMNDZ9h8Sw
        A+xSMF18uj7zQljsiyytUYcECn5Y38pxrHsRGqQ=
X-Google-Smtp-Source: ABdhPJxPIuRSAkooAyor+9Sgh8QhWpV5z/djl4ilpRF9DBd6NzbYPrgG14FAx4hP0rBWt6RkZN7TL/RDa5wxsr+Fh7g=
X-Received: by 2002:a17:902:56a:: with SMTP id 97mr3453206plf.130.1599131482530;
 Thu, 03 Sep 2020 04:11:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200903005300.7894-1-digetx@gmail.com> <20200903005300.7894-6-digetx@gmail.com>
In-Reply-To: <20200903005300.7894-6-digetx@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 3 Sep 2020 14:11:03 +0300
Message-ID: <CAHp75VefJMxAoGxN8muTxLUJ=bwcMyjzX4uEGvYdckE6xYJvjw@mail.gmail.com>
Subject: Re: [PATCH v3 05/22] i2c: tegra: Use reset_control_reset()
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
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 3, 2020 at 3:53 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Use a single reset_control_reset() instead of assert/deasset couple in
> order to make code cleaner a tad.

> Note that the reset_control_reset()
> uses 1 microsecond delay instead of 2 that was used previously, but this
> shouldn't matter.

What datasheet says about this delay?

> In addition don't ignore potential error of the reset.
>
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>


--=20
With Best Regards,
Andy Shevchenko

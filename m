Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0387625C05C
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 13:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728629AbgICLcM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Sep 2020 07:32:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728372AbgICLby (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Sep 2020 07:31:54 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF00EC06124F;
        Thu,  3 Sep 2020 04:20:07 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id u128so2067209pfb.6;
        Thu, 03 Sep 2020 04:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jaMby09cIkH4uMnP/QGnY16JaDZOahjJy8+IAE25qQI=;
        b=Ay6T3o5VYcusUis3uZZWyVXgWIF+mUScyEZqpgOBAkCyeAtQEi02m/lV4Zjp+2Up8b
         P5HHxCYax2aeFuBIwfE9vkRx+6TvW+6Vm6kyHFEN+E0yPgD5XiR+0wm/OTIU0SzU/fxi
         Ue9xgqsFhxucu35ddMNJ8f4Q6q54cRwQrjfL/k6HLl1SPz6T+fbW/FmMrOS+RK36o/yp
         eot8QtHOU5p+dCS+zlE3nZhSqjlSVjngrXrtxqf5zpErPMvK9E0ttthZbQkeRjyeCJbP
         /tFH53iy1swTu3Hn7XMqUQr0q0G0d7FrrluY8wXxb79FPdK7DrwvMR67Em48j4RsAzPo
         b8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jaMby09cIkH4uMnP/QGnY16JaDZOahjJy8+IAE25qQI=;
        b=K4bnAdFR5RNJd4H+3kv+PiZvxbn4Oey3V1ELfQOipME9NkJKj4kvCPEeu0mcaTl3jJ
         zLVU5K6Cqv5/v3imYm4017X7hjIIeznCGGXkOv3xKPI2N/JTmJgUu6woiaH2EOgcNDXu
         Vh5fGiPbkMy1+KlXU9uKqqHuRXEFUnT9G0SEdZDePblkLOTJadAD78DYt8POoOnHq6vL
         W695p60fIJEXhurFhSXpFRIWqgv13fZvcxoWysg0pD3nb1UOG3NuzW0rLKZ8d9aMXIib
         EAdPVHzaj+HeLRE3QlpkvobFv9E4j4qVUS3/5jCQvwz/ft8kx+E8nSfRU/sF5OmI1GIn
         2vLQ==
X-Gm-Message-State: AOAM532E1o9B5l3UHQbUm0oVYbnsF7fa7fewayHxxUe73qc+AhqxR+3f
        NJgjRm84i5BDPBrrHnGVEYeYtEChceptxZPyhvE=
X-Google-Smtp-Source: ABdhPJySXMx2fPHPuW2rKM86f6gT94qFOY5VNUlJ0a6oRyW8MpyDO7nrdRSyyg9cHogg5ipMhKUgG8PyRMoTMDYaaR8=
X-Received: by 2002:a63:c543:: with SMTP id g3mr2587849pgd.203.1599132007489;
 Thu, 03 Sep 2020 04:20:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200903005300.7894-1-digetx@gmail.com> <20200903005300.7894-14-digetx@gmail.com>
In-Reply-To: <20200903005300.7894-14-digetx@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 3 Sep 2020 14:19:49 +0300
Message-ID: <CAHp75VcX0=WTKWB+W2NoCzDJbL+axd9D27nJ6OMCgL_m_4=PHw@mail.gmail.com>
Subject: Re: [PATCH v3 13/22] i2c: tegra: Check errors for both positive and
 negative values
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

On Thu, Sep 3, 2020 at 3:54 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> The driver's code is inconsistent in regards to the error values checking.
> The correct way should be to check both positive and negative values.
> This patch cleans up the error-checks in the code. Note that the
> pm_runtime_get_sync() could return positive value on success, hence only
> relevant parts of the code are changed by this patch.

Yeah, fix the order of the series. Now it seems like arbitrary mess.

-- 
With Best Regards,
Andy Shevchenko

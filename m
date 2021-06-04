Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4060E39C3B7
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Jun 2021 01:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbhFDXMI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Jun 2021 19:12:08 -0400
Received: from mail-oi1-f182.google.com ([209.85.167.182]:33631 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbhFDXMI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Jun 2021 19:12:08 -0400
Received: by mail-oi1-f182.google.com with SMTP id t140so6079984oih.0
        for <linux-i2c@vger.kernel.org>; Fri, 04 Jun 2021 16:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=du6aRGfX4SI86kYShqUWR1TDu1w5UdQuTWF6MyIxIRY=;
        b=NbrraKsJQeXPFVM7Eorm2jhGhe/xf/js0Fuy/gLvHQA/P57w7ccteCjE4aGRLEnr2Z
         dlI0ptIoyfAJutgfWZj13qCquhp/o/It7Ky8uQ7O3DJLqdIOrDHVDKXEn5BBxLwtz76j
         pRYW3LQAEXydTU36si0M/QHWzem//g1AG6lmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=du6aRGfX4SI86kYShqUWR1TDu1w5UdQuTWF6MyIxIRY=;
        b=QFnAe/g2lTKUjtnqt9/AJ6+3eIlRFMLWH8e8nQ8c5UjcJCVlVuCYyEASrU++R49tW6
         2Fvb6Y7WG2PyISkFd4A18907H0m3Qz0jMNAyglCvEJgBmswb1zfkLUI2u2gcbUq5VRZQ
         CSEPHeUaR/c0A5F1Msqn9kBF0I7XbP2d1X4FS3mLV2i/XtNetFCoDYQgQHJ+PHD5wO+M
         OrPgJf6y/FDfprcZjHo2Ecb0WZsgSBpRFX0OqzOM4GKgFqQGaR1BqQ86OTlRULEEpSxS
         jhCdl2AcB4GwX1IaTN/c5VTxwW8DTFlvvHM1Oyo7gLptRiJNpWTNfaglrLgn7DU74NYM
         TTIg==
X-Gm-Message-State: AOAM531fe8SLe63GahybPb/Vh4OCdKkYgc9XQ3UhxQKMJtsFMXNqD2UQ
        fz5c9vyz+ofJRESrABDY6kwCLGIo4brJg/H0Ih4FaA==
X-Google-Smtp-Source: ABdhPJzshQRhetJ7fG/nA9zbn3qMtWPZUUgQnF9azZgf7YfHohZsKcLRZN75T8UorNN3FrOy5Y8IGzU4bgnYkfqaWUg=
X-Received: by 2002:aca:654d:: with SMTP id j13mr12631266oiw.125.1622848161433;
 Fri, 04 Jun 2021 16:09:21 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 4 Jun 2021 23:09:21 +0000
MIME-Version: 1.0
In-Reply-To: <202106050612.FyaqyhTf-lkp@intel.com>
References: <20210604212752.3547301-1-swboyd@chromium.org> <202106050612.FyaqyhTf-lkp@intel.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 4 Jun 2021 23:09:21 +0000
Message-ID: <CAE-0n50aeyb4g8f4aGhFWB4JFNue__CL8OPM0m3bUdEhMV1UCw@mail.gmail.com>
Subject: Re: [PATCH] i2c: core: Disable client irq on reboot/shutdown
To:     Wolfram Sang <wsa-dev@sang-engineering.com>,
        kernel test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Quoting kernel test robot (2021-06-04 16:01:32)
> Hi Stephen,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on 8124c8a6b35386f73523d27eacb71b5364a68c4c]
>
> url:    https://github.com/0day-ci/linux/commits/Stephen-Boyd/i2c-core-Disable-client-irq-on-reboot-shutdown/20210605-052848
> base:   8124c8a6b35386f73523d27eacb71b5364a68c4c
> config: nios2-randconfig-s031-20210604 (attached as .config)
> compiler: nios2-linux-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # apt-get install sparse
>         # sparse version: v0.6.3-341-g8af24329-dirty
>         # https://github.com/0day-ci/linux/commit/2fb1417bc9d82a335db5ed8a1446be74bffae440
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Stephen-Boyd/i2c-core-Disable-client-irq-on-reboot-shutdown/20210605-052848
>         git checkout 2fb1417bc9d82a335db5ed8a1446be74bffae440
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=1 ARCH=nios2
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    drivers/i2c/i2c-core-base.c: In function 'i2c_device_shutdown':
> >> drivers/i2c/i2c-core-base.c:631:3: error: implicit declaration of function 'disable_irq'; did you mean 'disable_srat'? [-Werror=implicit-function-declaration]

Must need interrupt.h, which I must have got implicitly somehow.

>      631 |   disable_irq(client->irq);
>          |   ^~~~~~~~~~~
>          |   disable_srat

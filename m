Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B05881323BD
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 11:36:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgAGKgS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 05:36:18 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35862 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727177AbgAGKgR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jan 2020 05:36:17 -0500
Received: by mail-lf1-f66.google.com with SMTP id n12so38513951lfe.3
        for <linux-i2c@vger.kernel.org>; Tue, 07 Jan 2020 02:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sG/kXuqLeJvqG1lAcs804RB5cd4ar5VVtWwgAsRdZ/s=;
        b=GtBPym2vWmXC28LTMAxnKxk7zjFcA0gTofCfYp/e1hRMRUzc/l8OWm9FZJZ6TDraA2
         q4bBSbz5y+eUEcdjmWNedK3ESN4gfVo8PNP7tyo830m/EXIkvN1LvV6g5cu8IzmZufSV
         z0Nagz0pJgHNuua3MtsiJsbWnaFNeNuD9wevv9jvuPn68bVazL3RAwXefpB3OPj5CrXh
         4/5bEiBbEQ0fKbcZ5BrnqRAHjAqdP0ALSVrbLbL7Mpum3/cQG9wIzWYkzMCXi3qgMAO3
         362Lw4Cj5hzHVXE85YnlCuF5u8wufzrOhJY+WEL03UrbpyzNNgJ3CKci3Yr256HLyHmU
         XaAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sG/kXuqLeJvqG1lAcs804RB5cd4ar5VVtWwgAsRdZ/s=;
        b=n0sdTU0xpS+s4SRQbPE8Oh1xDeeQAuqkS5jY+O3p/cj0UArmijEwpZXv2uzzU+Khq9
         4P6akhgPKNO145z2UzUYN2R9pONFUrRtrhclnQcdh9PuRro/c/A+fx20SegYA5EfO486
         DeKO7dvoLTXk1UBlUC8A6zd76+zDZAk2D0MoWe0vVLVXu8FRMcZSFUQkJjfWMWLGmaye
         RifhABfFECFcaSmu4cFTaW0T2wlKHr+MxAqZHqqkI0W6PQAzlP2TshHODFWaT8y9Rxac
         Nq51HTNfzaugfZRUeUWhoiP/OVg4UYamJ0bWiGLvYv6Yi6SfEGlzetsgX1SKbhlraJht
         06Ng==
X-Gm-Message-State: APjAAAXkp6wHUqPJQoo0rSNo15xGcZ7eMMkJ7xyvuwVpdHOQHQjsbpah
        3Te5fhlR/PPEH6JPeQWyuZ2mWdqSkmY0BZ4dbTQKoA==
X-Google-Smtp-Source: APXvYqwtSih7jQpztMo/SWJRjyemZlwG1+gqydx7vYHxxHiA9/nJ8znZ/8sEt3hdZ1WVHXFNFrrCHonuUSWxZhzsjpg=
X-Received: by 2002:a19:8a41:: with SMTP id m62mr58979605lfd.5.1578393374908;
 Tue, 07 Jan 2020 02:36:14 -0800 (PST)
MIME-Version: 1.0
References: <20191230172751.17985-1-krzk@kernel.org> <20191230172751.17985-4-krzk@kernel.org>
In-Reply-To: <20191230172751.17985-4-krzk@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 11:36:04 +0100
Message-ID: <CACRpkdaKPWott93XQp1iWMO6m6TqqW+iuN33PnSDOnOMMdCEbg@mail.gmail.com>
Subject: Re: [PATCH 4/5] i2c: stu300: Use proper printk format for iomem pointer
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Max Staudt <max@enpas.org>,
        Juergen Fitschen <jfi@ssv-embedded.de>,
        Elie Morisse <syniurge@gmail.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Dec 30, 2019 at 6:28 PM Krzysztof Kozlowski <krzk@kernel.org> wrote=
:

> iomem pointers should be printed with pointer format to hide the
> actual value and fix warnings when compiling on 64-bit platform (e.g. wit=
h
> COMPILE_TEST):
>
>     drivers/i2c/busses/i2c-stu300.c: In function =E2=80=98stu300_wait_whi=
le_busy=E2=80=99:
>     drivers/i2c/busses/i2c-stu300.c:446:76: warning:
>         cast from pointer to integer of different size [-Wpointer-to-int-=
cast]
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

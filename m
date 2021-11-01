Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37D11441C95
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Nov 2021 15:25:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231493AbhKAO22 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Nov 2021 10:28:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229826AbhKAO21 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Nov 2021 10:28:27 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBB3EC061714;
        Mon,  1 Nov 2021 07:25:53 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id f4so6731768edx.12;
        Mon, 01 Nov 2021 07:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U8dGpHr2LbqeeAeL0rdMryoAEIzzb9ek644l/wYoSc0=;
        b=qfPfuUyKZZiLcmVeHl4aZMPpfyaRykfYCtocxIUEaKcP1sB2WeHuRpeSenxfRhzVaJ
         1VToEAmhDVB5dUVFxg4K9ZVhi1cSVQbk/SummxncNmrLuKtvht+NCy73ZODXPf0WpRUC
         OlsvB2pbLI0s5s2DL5dB9MUj3UxOO05PLIzMGuKr92Wtv+CDEKAvF+UdX2zJ9N+auyUx
         cdTKbekFXwzb9hHd0RJpv2JbV+fMSvTLlYDQf658hcmLLUWifohDy7PLV1yu3nYzAwVi
         jS7+wCXEVlP2VUrf350Mk2gwzhAZiT7P9w41C2y47tSEs/7Vbz1lSjdIV3eCwjr4RBQX
         2APw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U8dGpHr2LbqeeAeL0rdMryoAEIzzb9ek644l/wYoSc0=;
        b=yD4D/vX1Wlx/bwizGp1iTt7Tq74zg4QMBnlg90G+nxYIRiw7CbgWAfTq5FdylhpNoX
         JHuKLUahKvKV5yERDLpcqYdqjQx6EXbqfv8ruQHsBkf9jI1Z9p0cDLHF+7fbSLeuNxD9
         qMyvqRJxAOmWCzV7rWovsVkEQPb0Fiwe0EjhN4ZbX8u56ASSUGIjjCFcFIlFYxzH66d2
         x9DED/LZb+N1zjEShIDu9BA6DE71zjjpl4H11b4xPrwhozaRLVhrA9pTgXnMWCpM8bja
         +DmH8gtgcMmxgrSW6FyQ4zjVXTTo9seywwVIOFPFnb77e2Fs8meCdjUk2DOMCw+6VPFv
         eRqw==
X-Gm-Message-State: AOAM530tLeVXc0Cwp/DLy96fJ+dqAwzoKKMd8fVr+KzY5lPO5ciE+LfR
        oTVMueDUwRJK4BWUPSJBxPlDcuxqEP2GXRWeOMIbtrfXLCk=
X-Google-Smtp-Source: ABdhPJzWM6VCDa5ZmF2ZKjZ1DdhV+AAGA9EqR2F/VhuTDDoFuYjeq48tl6QyW1NBKDlXUB980wqbufQ1zQVeZg6M+74=
X-Received: by 2002:aa7:c44b:: with SMTP id n11mr20384013edr.238.1635776752332;
 Mon, 01 Nov 2021 07:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <20211025094119.82967-1-hdegoede@redhat.com> <20211025094119.82967-11-hdegoede@redhat.com>
 <CAHp75VdC8i1YWZh_KXNqz_hHgHFoXQ57cce4-x3e6Ha0ZVPQag@mail.gmail.com> <08a94895-ad57-c8f2-fcb5-ff1c1637dc0d@redhat.com>
In-Reply-To: <08a94895-ad57-c8f2-fcb5-ff1c1637dc0d@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 1 Nov 2021 16:25:02 +0200
Message-ID: <CAHp75VfYMEZKtR5HZTazSSZ1qgz5iV7Nk9JFHgFmtUuWGqQabg@mail.gmail.com>
Subject: Re: [PATCH v4 10/11] platform/x86: int3472: Pass tps68470_regulator_platform_data
 to the tps68470-regulator MFD-cell
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 1, 2021 at 1:32 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 10/25/21 13:38, Andy Shevchenko wrote:
> > On Mon, Oct 25, 2021 at 12:42 PM Hans de Goede <hdegoede@redhat.com> wrote:

...

> >> +       board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
> >
> >> +       if (board_data)
> >
> > IIRC it's a dup. Below already incorporates this.
> >
> >> +               gpiod_remove_lookup_table(board_data->tps68470_gpio_lookup_table);
>
> Not sure what you mean here? This line *dereferences* board_data, so even if
> gpiod_remove_lookup_table() already contains a NULL check for the table pointer,
> we still need the board_data check to avoid dereferencing it to get
> the tps68470_gpio_lookup_table member.

Oh, I see now. Nothing needs to be changed here.

-- 
With Best Regards,
Andy Shevchenko

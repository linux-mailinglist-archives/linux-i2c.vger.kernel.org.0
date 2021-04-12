Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C887935D401
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 01:35:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239135AbhDLXex (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Apr 2021 19:34:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237567AbhDLXeu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Apr 2021 19:34:50 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92EF3C061574;
        Mon, 12 Apr 2021 16:34:29 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id kk2-20020a17090b4a02b02900c777aa746fso8000268pjb.3;
        Mon, 12 Apr 2021 16:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wqp74zPj+0qXMPJcKJTmn90vgijZiCnI9bUJurDvp7w=;
        b=ce5BIXG4IMzQwiHi+rCU2kmqs05VRlYn3YcNiuwoPZuRnlpjSTPaOMWbAIm6wn89t+
         ILuJMfW/fNap0sZD5s5VcAPgLwATM+vZJqpiMzzWbwO3ToKyeDU1KP1P87zAJM0LHK99
         x6WG6sKuOXvA6M9DkUPlEMh4JvH6xe/+/QuUiGUCVyRJlBAvR+zzzvzrCJN8O4Oq1c+M
         n4JO/W1omlc8sqlTfsEBhdJ+UitFVSmsg94RCRpHDodwDyKgN0h64LJVbR/Ht4+87t6v
         R+UJjOXa2bS3OpKrMNtTYxdFpXDg7XIqsP6+k6r5x7q1WJShuur4EdnumSHK1+xr/wg8
         1uYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wqp74zPj+0qXMPJcKJTmn90vgijZiCnI9bUJurDvp7w=;
        b=YmCmhofWViSac3rIzabEPLIzktk3QxBQ0ELiXtVX+IO5GD1y5YDjVb7bb0/cj21InG
         AcmMTtRa6FyNvXAKsT/5VhbG+ZngxEKFVWrr6pzh3ABZmNKVcOovDNZxT6WG3PHskirH
         5ocO5DVTPialIeTfmoRvY+s2lM7ih1ox6n8xYDnR5D/m/ywyEiOuuLV3G/FrfdKvVO/4
         6RQU9xA5Xy8i0DdEia90wNipFaSX+nyVmGA8YDHBNqcijjzFO04g3j5QbP/vI1IqDBlM
         ylLnaY1cO3ZEC0ZF3O0oj3HTrrnl5/wWTmeuDBoS39gQMl9lCU+cIfQyPLJOlg/oMks2
         8t9A==
X-Gm-Message-State: AOAM5327KyGzr/Vsqq0lrJCRhK2dWD4MDMCMF/hq/cKyem9zFffR0U0E
        5WhZ6dvcpE+7SqqNeheeiYpWQVwkXkf04Vd524c=
X-Google-Smtp-Source: ABdhPJxhYJnqgy/3ENdN0JcSOueLcv2r8UBBDsaWLgJp7Ajg0HSucFgYgWFA6QEHEwZJOBW7fxvCbQQA3jhq1ZZc3xk=
X-Received: by 2002:a17:902:f545:b029:ea:c657:e307 with SMTP id
 h5-20020a170902f545b02900eac657e307mr13484412plf.0.1618270469044; Mon, 12 Apr
 2021 16:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210329015206.17437-1-chris.packham@alliedtelesis.co.nz>
 <20210329015206.17437-6-chris.packham@alliedtelesis.co.nz>
 <CAHp75VfRXeeP0uQFDBUS6=n2TvG+_5=pe8rWp6BpbDNMz6=OSg@mail.gmail.com> <c9af3c98-7680-b7d1-a23b-f09c90e19b91@alliedtelesis.co.nz>
In-Reply-To: <c9af3c98-7680-b7d1-a23b-f09c90e19b91@alliedtelesis.co.nz>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 13 Apr 2021 02:34:12 +0300
Message-ID: <CAHp75Vfq38EqN4qQQnZB_m71sE=uj5vWbDdkdXX7C8kNoLwwOQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] i2c: mpc: use device managed APIs
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 13, 2021 at 2:21 AM Chris Packham
<Chris.Packham@alliedtelesis.co.nz> wrote:
> On 13/04/21 10:52 am, Andy Shevchenko wrote:
> > On Mon, Mar 29, 2021 at 4:54 AM Chris Packham
> > <chris.packham@alliedtelesis.co.nz> wrote:
> >> Use device managed functions an clean up error handling.
> > For the god sake how have you tested this?
> > The patch is broken.
> I've clearly missed the remove path in my testing. I was focused on the
> interrupt bevhaviour not the probe/remove which I'll make sure to check
> for the next round.

Thanks. And you may also remove forward declaration of IDs and
probably some other leftovers (Cc me for the next round, I'll help to
review).


-- 
With Best Regards,
Andy Shevchenko

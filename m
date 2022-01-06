Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCBE348655A
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jan 2022 14:38:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239604AbiAFNi5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jan 2022 08:38:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239600AbiAFNi5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jan 2022 08:38:57 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F160C061245
        for <linux-i2c@vger.kernel.org>; Thu,  6 Jan 2022 05:38:57 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id v11so2582323pfu.2
        for <linux-i2c@vger.kernel.org>; Thu, 06 Jan 2022 05:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=873ZUMnhbLM7PFhly5hnZRBhmv4y5FjsnFYI2et095o=;
        b=QBRWD54PlCzDG+JdbpPkraRHiRiGvWb0ef41OiH9WrpmVJdp9LI/a+5qZhD7avkbs/
         Yc+h0ikqCy0LGxENcvkQ3iGUxboKfhjXqKlpFSARgxEQ/TC1HeCzuUcVftb9yJiJDg0l
         8rFevC6CKFloGe+8HsLt9aUDxw9NxDyNVwkegK8rX98pKLWja7ImJnbqSHgcseWBD6ik
         Knd0mVbms+X4FfBRqA8cIrWWqeZnAosnWMqmO/gNzUfu+W1crxVf8fEfXpYTtj/YFjvd
         UWav/kgr3iMy08f4ybHMQghosr74UUcJsvavrhjt5NqiEHyBkdNriVSQFCBiKNqu7UI8
         aEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=873ZUMnhbLM7PFhly5hnZRBhmv4y5FjsnFYI2et095o=;
        b=4LAUHaOySnOdAJY8I3GIE94WnaVCXnGuw2eNfr/cfrTbf5XHtgPZQmYYZE+B+nmGvJ
         mFYCULiPbSC5tLaXR0WfsIBVegNqWHJeydnU7tDAQUjjRV2oRtC0NICzdfNL82PtY5Bj
         5H+bwp9cmxj+46PgW/SF3tkE1D5WxqV4F6duWp26ZjyDOue8F6thGSAD72KlSS8G+oPR
         AEWcobUe4uw5UU0IIdttNPOGD1SULMHr1UaP3F+WcAffawsQMGYr6hwzz4SOYCJi2GZZ
         7n8CgdxLcgxjRlkJe8vf3naCx6w2+YtwVoA2WW/YW1ZE7qBJ29gqb96uMMS5QcFfgEp/
         794g==
X-Gm-Message-State: AOAM5336+npq5Wk6oJ6ja2oSkKAZAQAinD15tIuQxcqw+Z054FPc+XYz
        SG6IzLZuEhljzV+r+e3dJ9mp8wOL3Q6vQne9MsA=
X-Google-Smtp-Source: ABdhPJwXP9E18QfWGbCFUqfGKVuPa7XIuVwD6eQWEGICsgFg5hPekAOZSzIzDZM6NTDiMBzNx66c8sFy4YA8zvLPAlY=
X-Received: by 2002:aa7:9713:0:b0:4bc:b10f:b784 with SMTP id
 a19-20020aa79713000000b004bcb10fb784mr17553167pfg.43.1641476336636; Thu, 06
 Jan 2022 05:38:56 -0800 (PST)
MIME-Version: 1.0
References: <CAGhUXvAPb6KXbs3ux+NUvH2v0N5k3nqz_kNcNLuOco=oHQhzVQ@mail.gmail.com>
 <YdbsXkRuysOQLT9s@ninjato>
In-Reply-To: <YdbsXkRuysOQLT9s@ninjato>
From:   Andrea Ippolito <andrea.ippo@gmail.com>
Date:   Thu, 6 Jan 2022 14:38:20 +0100
Message-ID: <CAGhUXvD-jJqR84r8Avzn4BV2aGpXsBiE=LngQYJ4rjJgtX9oFQ@mail.gmail.com>
Subject: Re: Touchpad bug affecting several laptops
To:     Wolfram Sang <wsa@kernel.org>,
        Andrea Ippolito <andrea.ippo@gmail.com>,
        linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Thanks a lot Wolfram (and Miroslav, in advance :) )

Kind regards,
Andrea IPPOLITO

Il giorno gio 6 gen 2022 alle ore 14:19 Wolfram Sang <wsa@kernel.org>
ha scritto:
>
> Hi Andrea,
>
> > I have reported an issue here:
> > https://bugzilla.kernel.org/show_bug.cgi?id=214597
>
> Thanks for doing that!
>
> > But it seems like it has not been inspected by any i2c expert yet,
> > hence many users see their Linux experience on a laptop completely
> > spoiled for months now.
>
> It is still like Hans mentioned the last time you reported it:
>
> https://lore.kernel.org/r/70cbe360-6385-2536-32bd-ae803517d2b2@redhat.com
>
> It is complicated and someone needs to tackle it. I have hopes that
> Miroslav Bendik is that brave hero because his issue sounds similar to
> the one you have:
>
> https://lore.kernel.org/r/CAPoEpV0ZSidL6aMXvB6LN1uS-3CUHS4ggT8RwFgmkzzCiYJ-XQ@mail.gmail.com
>
> Let's hope for the best there!
>
> Kind regards,
>
>    Wolfram
>

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0B6868C554
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Feb 2023 19:01:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230207AbjBFSB0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Feb 2023 13:01:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230193AbjBFSBZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Feb 2023 13:01:25 -0500
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF0B52BF35
        for <linux-i2c@vger.kernel.org>; Mon,  6 Feb 2023 10:01:23 -0800 (PST)
Received: by mail-vs1-xe2b.google.com with SMTP id k6so13563254vsk.1
        for <linux-i2c@vger.kernel.org>; Mon, 06 Feb 2023 10:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AovKaYugu50S/f2B978nfmPElm2qMfvoOhokNIP847U=;
        b=Ops+BJewCRfpBNkWE2t9Nd5h3no2SfuN3xwaX1TPK17nLkUHjJ3d6qCUhmeR6TLOvl
         KA54u85d7dGY47W0sc1bbgfNIoJdTUXmNTtAPVGRmpeebPedSU5vbnPrvFGWrjDsGQj6
         51RKB7l7V3IkE4HUiCwKYm54PVbKp4yKd2nrVDaYfVQfZ76abEKE7a57EH6YHOwAA1oK
         Blh1XWA+FDzOHH5AYRImKlyKFzaQYVx1YS/A7rkygkrXiQzufHKC//xyDzr8/sNqtStU
         YOBsUyQ6ODVeEnwY8aR3gy0QByrfgxsVbH4vO1bM3hyfrLYrLp5QKSdBosSKs8Z+YY5o
         hYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AovKaYugu50S/f2B978nfmPElm2qMfvoOhokNIP847U=;
        b=70K3X8I5/sC7QY1igb00fEhoLMmr97WZQpmv6J5cRBG/3xO37RDISFkWsOYGulSXoj
         x9lvX/90ynK0oewAaCXbPr05Qga/nnDVd9qEwx/uVNlyn2SB2dkA7TB0fRJ+TbMzD0ST
         4czDFdvaGQsiDXYHZpliQI9M4GIXPIKn/gSe58bHfpvMvGHCde1OlUFG62yIACOSPqtr
         u/en928plmw/LJ4j/cZgTMCgJtMWsX5/5U/RPReshv247m40q3LYBP6t/c+UovJWjlLD
         3oGsUlkdmZBPUp03tOWIZAFVrSOsjWGXAIWbMoSd2m5+xQ4Foqgn5sqtdqnhEuBcxY+p
         lxWA==
X-Gm-Message-State: AO0yUKV9Bxh5cvbk+//ucvO+L54QryIWFL8QsAgAPlrNGroFXCaGd5T4
        6BKm6LPf5o0uztHCRQaInEUnwYvI1zhuR9MazRrs1w==
X-Google-Smtp-Source: AK7set+9Li15tr3aRCwXnHOJLd/UXJaDEEQSZ2h6RaR4pJm9jBZirB4qGtMmATBxRr5/jYOOz8wpY/MDTGP5DA9dKGk=
X-Received: by 2002:a67:c908:0:b0:408:6a8f:d1c6 with SMTP id
 w8-20020a67c908000000b004086a8fd1c6mr97061vsk.73.1675706482791; Mon, 06 Feb
 2023 10:01:22 -0800 (PST)
MIME-Version: 1.0
References: <20230118134940.240102-1-brgl@bgdev.pl> <Y9DpbChLZfDONHPz@ninjato>
 <Y9GpL9RBNM8H2ZSL@shikoro> <20230206155107.qwf5tbrqsbvv4hln@pengutronix.de>
In-Reply-To: <20230206155107.qwf5tbrqsbvv4hln@pengutronix.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 6 Feb 2023 19:01:11 +0100
Message-ID: <CAMRc=Mdz_+_MDJAjkXWa2P8FM8i6XPMAVQ-xTUtZDXfD-RBo_w@mail.gmail.com>
Subject: Re: [PATCH v3] i2c: dev: don't allow user-space to deadlock the kernel
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URI_DOTEDU
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Feb 6, 2023 at 4:51 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> Hello,
>
> ah, this is the mail I missed before.
>
> On Wed, Jan 25, 2023 at 11:11:59PM +0100, Wolfram Sang wrote:
> >
> > > So, this code handled all my stress-testing well so far. I'll try to
> > > think of some more ideas until this evening, but likely I will apply =
it
> > > later. Nonetheless, more review eyes are still welcome!
> >
> > Ah yes, I now recalled why I had the gut feeling that this solution is
> > not complete. See this mail thread from 2015:
> >
> > https://lkml.iu.edu/hypermail/linux/kernel/1501.2/01700.html
> >
> > There are still drivers using i2c_del_adapter()+kfree(), so removing th=
e
> > completion could cause use-after-free there, or?
>
> There is also a strange construct in spi that I understand at one point
> in time, but I failed to swap it in quickly. It's about commit
> 794aaf01444d4e765e2b067cba01cc69c1c68ed9. I think there should be a
> nicer solution than to track if the controller was allocated using devm,
> but I don't remember the details. But before addressing the i2c problem
> it might be worth to invest some time into that spi issue to not make
> the same mistake for i2c.
>

Yeah, I've seen these constructs before elsewhere... Sadly, we have
workarounds upon workarounds within workarounds chased by other
workarounds due to this issue.

Bart

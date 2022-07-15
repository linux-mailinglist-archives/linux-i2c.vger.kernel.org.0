Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B602A5762D1
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Jul 2022 15:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233196AbiGONcn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Jul 2022 09:32:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbiGONcm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Jul 2022 09:32:42 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AED1E7AC12;
        Fri, 15 Jul 2022 06:32:41 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id w185so4683839pfb.4;
        Fri, 15 Jul 2022 06:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YNVoyk6kiyretWQCyGpRkYDTZtsDnNVuxvv1fAqYuPs=;
        b=PH9Z8js+1KWPw9blh6biuBKaZU4U9c/q7QE6pD/DuC7HiDYxb0cDNl5J9kcU7Mi/NN
         bO848GLeit613u8Z1HDGybzA+nrLeI1Creo85O/hHYzXHcSSdOV0w9fOcTJgeI5kLGtF
         xEdYH+zonmkjUveEg488iTt5p/mefF2yVarVPesCdc660dFfHXugpe2F7xdfLJQRhVoX
         aj4XcN2KP/ZMFJUuRsc6K8mVStKRjvK4gCZbhunLQ7cHe5SfWnPZVLQZGQUaYIuktt5z
         I9rXXxX0+fcQ7hTseXzSOhPM2n+PsVYnEknHOzkHUKARjIP0WEw1hoAYiLGeN5o6pZFD
         h9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YNVoyk6kiyretWQCyGpRkYDTZtsDnNVuxvv1fAqYuPs=;
        b=yu/h2B8vtFdCILsVnAhnzAAXmm9+MjIoFX0hSEsS1GzkMse/Goykj3ShikHA1MLQIK
         9Xjw1NAnYkcxY+IUDNVxqWAUh5bDA+tY6DuT8p+6gmy5DkwOmoRcf3lIG5Qh7DjT3neW
         rDcDrGQb5YLfbttef8rUvFavlkZbuQHTlEfL93bvjm8BgGi1viwrnlSA746AwMb58tac
         itwYy4WgAcyPTsZL9MqvuqmBmQHDOKoqqxJh5ZhH32WY79SqA6lvvXyuMFYMwrQ0G3OU
         WfM0wCYuMzmhAvhntU83Deo5Dcve1xemiEf7OHMHKUuRcwDeRYjLJ7nW9yW25u3HTaNr
         i8ag==
X-Gm-Message-State: AJIora8TDZUb2hYosYq5p0eqTxyGtJnEXRszZ/qTQGk9QwTjYYEHmS+i
        EmCQJEh5wbLq8W2mX1pEP0xTbnkA0hlnXghi3V4=
X-Google-Smtp-Source: AGRyM1t9GTp9rdO7SEllee28oAWWLFw6P4+BYyJCJP58heeVXuIAmRpquzkujzH6yilSD1SIVVILhokIZS7uJNMV9hg=
X-Received: by 2002:a62:6d05:0:b0:528:99a2:b10 with SMTP id
 i5-20020a626d05000000b0052899a20b10mr13829247pfc.72.1657891961187; Fri, 15
 Jul 2022 06:32:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220715132816.592657-1-f.suligoi@asem.it>
In-Reply-To: <20220715132816.592657-1-f.suligoi@asem.it>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Fri, 15 Jul 2022 10:32:28 -0300
Message-ID: <CAOMZO5CkiULcUonY5=ry0B1iDP6mv+gnjny8GpbEPeFmsd=qog@mail.gmail.com>
Subject: Re: [PATCH v1] 2c: imx: fix typo in comment
To:     Flavio Suligoi <f.suligoi@asem.it>
Cc:     Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Flavio,

On Fri, Jul 15, 2022 at 10:28 AM Flavio Suligoi <f.suligoi@asem.it> wrote:
>
> to provid --> to provide

There is also a typo in the Subject line: 2c ---> i2c :-)

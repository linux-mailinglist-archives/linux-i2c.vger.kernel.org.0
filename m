Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F48F504856
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Apr 2022 18:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234404AbiDQQfp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 17 Apr 2022 12:35:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234403AbiDQQfo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 17 Apr 2022 12:35:44 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 635B233E94
        for <linux-i2c@vger.kernel.org>; Sun, 17 Apr 2022 09:33:08 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id q14so14523594ljc.12
        for <linux-i2c@vger.kernel.org>; Sun, 17 Apr 2022 09:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=EzHT4bjn+XF/AaUOpciq4qGv6/YksgSdEhZzkeKjcvo=;
        b=e+OYMo3kxvENVv8OuYHnr/PMfrf41QlQfF/zz3+oCdT1na1kGstke0S5ZPB63i3aYe
         2Zdz2IVdCpdVb1N2aJzO9JeInwOyzB2Xc1T0Bt7vPbCHdZTJmCxnSFtTChwTvo5HCSVC
         34j2qNKoVWR2I8SrPrj7Qef//KoRIa+hP7TXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=EzHT4bjn+XF/AaUOpciq4qGv6/YksgSdEhZzkeKjcvo=;
        b=xLhYB2JtKGuUOVbGlfNLqSyHfo/TXr6Neb0Vdn1Gpz/T8A+/rUge6CCaP6BQQUHrFI
         mcv1JW8ZoFu9W9az8QM9F0X1qbjB3VxWbzWA6M6iQwzVFwWgvjou+VTHjU3lmLW3mnd3
         Gue+yhmRwF6tqBfd2apHVvATHilqu5L7SwF0SJI+jcA8VADkFprhjyE9jhlym/bNIjE6
         80iAOuStTuJUwe1gwWgLfIl8XQpb+SdMNtSaUOOl94F3IimIuH1Zc8Q8PujheusWNQ3h
         aeQ4b8SrYdRg3DwqWaamevGYNCenHosmXSZ5BVu0LyipomL/OszvolsnRTnMOVGU2lqZ
         IusQ==
X-Gm-Message-State: AOAM530g8B0nDA6TsDslWifdBt84X9CMlJKZ/7k/s7tMPeaPnU4VO64K
        FbDCSjFDCdv9nXmhDmOGDfnIsXq6FpYNw+CeV2Q=
X-Google-Smtp-Source: ABdhPJykzII/rPWLNYV9toATESToiHeJ+IMRCquj7sRxREB3VmRGocYWOnfiTylMBYIhUxS6NKAWMg==
X-Received: by 2002:a05:651c:50d:b0:249:8a0e:cecc with SMTP id o13-20020a05651c050d00b002498a0ececcmr5014254ljp.402.1650213186432;
        Sun, 17 Apr 2022 09:33:06 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id x11-20020a056512046b00b0046bbe5d2eabsm979542lfd.75.2022.04.17.09.33.03
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Apr 2022 09:33:04 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id o2so21052590lfu.13
        for <linux-i2c@vger.kernel.org>; Sun, 17 Apr 2022 09:33:03 -0700 (PDT)
X-Received: by 2002:a05:6512:3055:b0:44a:3914:6603 with SMTP id
 b21-20020a056512305500b0044a39146603mr5562738lfb.435.1650213183288; Sun, 17
 Apr 2022 09:33:03 -0700 (PDT)
MIME-Version: 1.0
References: <YluC7rAj5syHOYWi@shikoro>
In-Reply-To: <YluC7rAj5syHOYWi@shikoro>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 17 Apr 2022 09:32:47 -0700
X-Gmail-Original-Message-ID: <CAHk-=whbEOBMSUkCRc+0dhRWrzJ1=2UsTLxNm=jW+u8Sc-n7Aw@mail.gmail.com>
Message-ID: <CAHk-=whbEOBMSUkCRc+0dhRWrzJ1=2UsTLxNm=jW+u8Sc-n7Aw@mail.gmail.com>
Subject: Re: [PULL REQUEST] i2c for v5.18
To:     Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Apr 16, 2022 at 8:01 PM Wolfram Sang <wsa@kernel.org> wrote:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

Can I ask for signed tags, please?

I've pulled this, but I'd be happier if everything I pulled was signed.

                 Linus

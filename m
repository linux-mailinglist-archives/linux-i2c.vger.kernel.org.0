Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 268C04E8478
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Mar 2022 22:46:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232959AbiCZVsF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 26 Mar 2022 17:48:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235562AbiCZVr5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 26 Mar 2022 17:47:57 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFF3717060
        for <linux-i2c@vger.kernel.org>; Sat, 26 Mar 2022 14:46:12 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id q5so14496982ljb.11
        for <linux-i2c@vger.kernel.org>; Sat, 26 Mar 2022 14:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=Wecc5j7c4wVZma/apTGD5QjsKB46TCKMRU6s27RNQDc=;
        b=AkKPV1lP4La9ZTPpeVBbqgxbp0caLs2sAFbSlyJXAbtt1RK8mPPfMUaWlq3p8aAyhB
         L/DO0PIWZW1OZL4xW0eNiVJ9se6FAbR/dWKy4kPRZXyaBzXSCKFYGNHuEb6cPgLgv1fD
         jVkR1KEzWsvAk1/jVlMCnZ/5fC6VWvLpXP2so=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=Wecc5j7c4wVZma/apTGD5QjsKB46TCKMRU6s27RNQDc=;
        b=sFjEj/DoVoRgFcEn9WMq1p4sPptTojmkwJSUKXwPw6wzqRTzSwF7XMHXCZ7+wKTHVu
         3j/J3K89Af40vuWkv42n5EIJ18PoShHS48/pTsn8cg++zens3NgetOzs7CndP9RzFlcM
         iqg028kabuMq5tkCVU/neekLo+isyXkA75Io43z9U5Do1pqvYVyhhvwMDrIBrjExhAb9
         71rfr7woJqWNTSOMp0emO4+gvWH0fJeKnIaSXLi6p4P6opB8mfziyRk96EAArX6/FLC+
         5d+JZbdV4Nl4xFbc8vkOEK19y0n7+IBklyCirq/WAt0ctKdvw6g7tyI1xZoJYJiyvqPV
         wMBw==
X-Gm-Message-State: AOAM531uaV7fD+qJazEM8VgKj0OyUb3A+TCwA4j+XGgU4ZXCnx5qjDBB
        9D23w9F7rZFToqIiPV7LqLXLbV6tGbgvZEcTuWQ=
X-Google-Smtp-Source: ABdhPJwbY5mA05EDIcq5KMsqJCzGUp9LXrNTXHjOZu7NWTlxCEFykXDocYYAdh3xcGbNvnP4qshbuA==
X-Received: by 2002:a2e:9dd4:0:b0:249:83e5:8f2a with SMTP id x20-20020a2e9dd4000000b0024983e58f2amr13620856ljj.5.1648331170778;
        Sat, 26 Mar 2022 14:46:10 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id t27-20020a2e8e7b000000b00247f32b572asm1131132ljk.19.2022.03.26.14.46.08
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Mar 2022 14:46:10 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id b43so9984520ljr.10
        for <linux-i2c@vger.kernel.org>; Sat, 26 Mar 2022 14:46:08 -0700 (PDT)
X-Received: by 2002:a05:651c:1213:b0:247:e2d9:cdda with SMTP id
 i19-20020a05651c121300b00247e2d9cddamr13953866lja.443.1648331168418; Sat, 26
 Mar 2022 14:46:08 -0700 (PDT)
MIME-Version: 1.0
References: <Yj19RH3qpzQsIV/O@shikoro>
In-Reply-To: <Yj19RH3qpzQsIV/O@shikoro>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 26 Mar 2022 14:45:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh0M10owjNcKvw3Vgdv7_SwJch4d0HEjBXYj3nPfrJ-UA@mail.gmail.com>
Message-ID: <CAHk-=wh0M10owjNcKvw3Vgdv7_SwJch4d0HEjBXYj3nPfrJ-UA@mail.gmail.com>
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

On Fri, Mar 25, 2022 at 1:28 AM Wolfram Sang <wsa@kernel.org> wrote:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-mergewindow

Oh, and another comment about this pull request: you are one of five
people whose pull requests remain unsigned.

So you're not exactly alone, but it's a (happily) shrinking group of
kernel maingainers that don't use signed tags for pulls.

Of course, I haven't checked the ones that are still pending in
linux-next, but I've done 127 merges so far this merge window, and 93%
of them have been using signed tags (and three of them have been the
Andrew Morton email patch-bomb merges).

Yes, that's a good percentage, but it could be even better. Hint hint.

               Linus

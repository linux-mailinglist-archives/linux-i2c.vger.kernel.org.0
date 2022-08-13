Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3ED8B591CBF
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Aug 2022 23:38:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240981AbiHMViK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 13 Aug 2022 17:38:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240985AbiHMViJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 13 Aug 2022 17:38:09 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4EB127B10
        for <linux-i2c@vger.kernel.org>; Sat, 13 Aug 2022 14:38:08 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id o22so5198093edc.10
        for <linux-i2c@vger.kernel.org>; Sat, 13 Aug 2022 14:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=pJARGpYDRG1Jl/rpwzXhVmN1AU3CPPfwsaLJnAGsXAU=;
        b=cGbBvlx6n7XyT6C3og9s4r5BWLakWyXg0ooz0frMES8mhFJIpDwHSlooUIsagfxrFh
         a/EXAPLQOjke/H1apCB4rNCjDu+y5KJk5Bad7OIB5a94D2pKbjoVtNy+WnZdRypOiTIE
         +6PewrzivrtgxLIhNx5Cjrs+lkgEKK89hWFC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=pJARGpYDRG1Jl/rpwzXhVmN1AU3CPPfwsaLJnAGsXAU=;
        b=ISLns/N9hRe6r+sWATKwogDbIS2p3o7IC5OtiSB5f0jruumuWTmwd2M1EoSD/RkA/u
         DlieBn5lv3Qf6phNn6r9qfTh4Y6yHqq0e1Xim2lHkHl73mnz7eaMSguXNl8y3R3Z2icE
         o+QXorV2REzo05p1lKifmXBbbFajYGPjAx6jwhmfmPVVdnyJZ1l7OU/zp5mh7wFvcQkH
         HhF2kcdp023Q/GTBefanuUBCcv4tsl7CjZsN2cxQN+iWsyrWy1rFj20qeIARwSGJ944k
         9e7sFPzr/f03HFBhNnnmYgK9htWJxJ9sg6l/aS4Q96zQOWbssEoXupoUdht0NSHZdG94
         5R6A==
X-Gm-Message-State: ACgBeo2737ZhdWPsLUj74MC7l6vGxKyI9t2UmTFm3p+tlkDMxwMosokv
        KDCKCzhUfojt3qmfb/2TOFqf/3KciAUuJ+v9
X-Google-Smtp-Source: AA6agR73G9HRHWlZh3Hhf4ZpKsCer49ZFSItExefbie+IpqqKs/jSLrWevra/75AMp65mc3dVG3aZQ==
X-Received: by 2002:a05:6402:11c8:b0:440:6513:be2c with SMTP id j8-20020a05640211c800b004406513be2cmr8471901edw.45.1660426687090;
        Sat, 13 Aug 2022 14:38:07 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id u4-20020a50eac4000000b0043ba7df7a42sm3577444edp.26.2022.08.13.14.38.06
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Aug 2022 14:38:06 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id az6-20020a05600c600600b003a530cebbe3so2127220wmb.0
        for <linux-i2c@vger.kernel.org>; Sat, 13 Aug 2022 14:38:06 -0700 (PDT)
X-Received: by 2002:a1c:f603:0:b0:3a5:23ca:3e7c with SMTP id
 w3-20020a1cf603000000b003a523ca3e7cmr6229444wmc.38.1660426685890; Sat, 13 Aug
 2022 14:38:05 -0700 (PDT)
MIME-Version: 1.0
References: <YvfGY2qnl2YXrUgX@shikoro>
In-Reply-To: <YvfGY2qnl2YXrUgX@shikoro>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 13 Aug 2022 14:37:49 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjGmhaE-Y8GqWKPtWYOi=bOarFgo7UkzHNoOVEKnkXXrQ@mail.gmail.com>
Message-ID: <CAHk-=wjGmhaE-Y8GqWKPtWYOi=bOarFgo7UkzHNoOVEKnkXXrQ@mail.gmail.com>
Subject: Re: [PULL REQUEST] i2c-for-5.20-part2
To:     Wolfram Sang <wsa@kernel.org>, Julia Lawall <julia.lawall@inria.fr>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        cocci@systeme.lip6.fr
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

On Sat, Aug 13, 2022 at 8:42 AM Wolfram Sang <wsa@kernel.org> wrote:
>
> * subsystem-wide move from strlcpy to strscpy

Hmm.

Looking around, we still do have a lot of those 'strlcpy()' users, but
99% of them don't use the return value.

And since 'strlcpy()' is complete and utter garbage exactly *BECAUSE*
of the bad return value (it returns the length of the source string -
but an untrusted and possibly unterminated source string is often the
*problem* in the first place), that would make it fairly easy to
convert the rest.

I see two possibilities:

 (a) fix strlcpy() by making it return 'void', and leave all those 99%
of users alone, and convert the (few) cases that actually look at the
return value to strscpy

 (b) auto-convert (with a coccinelle script) all the 'strlcpy()' users
that don't care about the return value, and leave a few broken users
of strlcpy around

I think (b) is the simpler thing, but I have no idea how to write a
coccinelle patch that basically does "if return value of strlcpy is
not used, convert the strlcpy to a strscpy".

I'd love to get rid of strlcpy() entirely, since it's such a horribly
badly designed thing.

                  Linus

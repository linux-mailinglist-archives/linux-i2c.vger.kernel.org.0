Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9CE956AEF5
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Jul 2022 01:18:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236128AbiGGXSR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Jul 2022 19:18:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236945AbiGGXSL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Jul 2022 19:18:11 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A83B66EE91
        for <linux-i2c@vger.kernel.org>; Thu,  7 Jul 2022 16:18:09 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-31cf1adbf92so57613967b3.4
        for <linux-i2c@vger.kernel.org>; Thu, 07 Jul 2022 16:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=getcruise.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=6CFELXvtxAlt8nPIErk7+fEF/LsHr983328QLow/hHI=;
        b=da4FqqwHQyqpE4K+70oxHQ5bOAB5codDp1SyDmvelbFbovcb6r0xotZItHLdeIoBlX
         Dd3+Gu2omT7kH6EmVFnh0Y168v4B1Q8crm4fuQkQStiXGJrAmOGwxGpH1e5dEvIGYiWf
         KCT+JSva5sWZSQAJKHap63tUJfAt6Gw9VArO+tKknQoSgz2YzKekeecBvrCKnl94/sxK
         22pbjBDtdQvwtsgLChl+Q4Vc7jMFj4EhJ9nWj7P1+bUXcJvwEn6cIRvuwWJl0fwsMd3+
         SnM0OyMaFysFi2cz1FceD1V3wzKzR96HGildeiAteLiZsMqeoCvXaPiAqJCYzNiNOt4B
         pwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=6CFELXvtxAlt8nPIErk7+fEF/LsHr983328QLow/hHI=;
        b=sdLIsidJxkjD/llKHN4veeFCAia9p8gTwqLWLW1+9AApZD2ujWhbKTW9Ej42x48xTs
         F101HnUI8u0q1GGBQ3R0q1jq5X+qU7g30NLZDu1IhqP+mUIkVfe1eEmZceqXkocBRxqu
         +ZeUD6hi8rIiEu+T8RLR1PdAEfm1MWstA06CmVYi2kMuKUgsKVwuJkl9uAB7HsO+wAWO
         Jjvjkx2M74lgOStCNLvMbsK49BceDvy1WeeRlvWnlYrO0nKirTbhTqyWFnKpHLouSTkR
         k/csZEZIG6jnJUZjFKxNXCzd76h/hXUjKD/GwTb8J+ddMDsrUy84km8zF3CoQ/DdsAHn
         xVWw==
X-Gm-Message-State: AJIora+Gbd2jqn/QLg+LrDYMCGCTmGSaj5Tb7gBhO3EaeVmDCWBlb9pM
        5gZg222W+EPJ2f4l+xGRxr+JWsCHGJPt9enMJpDqUg==
X-Google-Smtp-Source: AGRyM1sjkqac9MrjU56c4edaLIVbmEEqdA1go/nutn1J+GW3wxv2gw+18UW9maAsXvb2ygaUkx50Lv+2kG4nsP58I0M=
X-Received: by 2002:a81:54c5:0:b0:31c:7731:e1ac with SMTP id
 i188-20020a8154c5000000b0031c7731e1acmr795992ywb.190.1657235888590; Thu, 07
 Jul 2022 16:18:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220628191216.39459-1-satish.nagireddy@getcruise.com> <YsdLLKh8K0UDsJMu@shikoro>
In-Reply-To: <YsdLLKh8K0UDsJMu@shikoro>
From:   Satish Nagireddy <satish.nagireddy@getcruise.com>
Date:   Thu, 7 Jul 2022 16:17:57 -0700
Message-ID: <CAG0LG97sCyfAi-XLGF_=U9aGJEYjjfd4cof2Ftgy2SoM+hsN-g@mail.gmail.com>
Subject: Re: [EXT] Re: [PATCH] i2c: cadence: Unregister the clk notifier in
 error path
To:     Wolfram Sang <wsa@kernel.org>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        michal.simek@xilinx.com, lars@metafoo.de
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jul 7, 2022 at 2:08 PM Wolfram Sang <wsa@kernel.org> wrote:
>
> On Tue, Jun 28, 2022 at 12:12:16PM -0700, Satish Nagireddy wrote:
> > This patch ensures that the clock notifier is unregistered
> > when driver probe is returning error.
> >
> > Signed-off-by: Satish Nagireddy <satish.nagireddy@getcruise.com>
>
> Applied to for-current, thanks! I added a Fixes: tag. It would be great
> if you had the time to provide it next time with the patch.
>
> Happy hacking!
>

Sure, thank you!

Regards,
Satish

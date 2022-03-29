Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E5164EB5A4
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Mar 2022 00:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236149AbiC2WMf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Mar 2022 18:12:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236048AbiC2WMe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Mar 2022 18:12:34 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1640518461B
        for <linux-i2c@vger.kernel.org>; Tue, 29 Mar 2022 15:10:51 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id v12so12576369ljd.3
        for <linux-i2c@vger.kernel.org>; Tue, 29 Mar 2022 15:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5NszAzyCxeqCYVF4rcK1etWk+lEs38VK5zvRzeDlGh0=;
        b=KQCd+gO4PoDRepPTc/MgjHeabBWTTOlSRI+8rzh47UsJNwJP7SFfBYTTvHx+cKjOOd
         p03PYtz4rTHsrzEpQTzkyaguV5RxijqsK56lFbbMBqKt2a7k7JnkkaG/F1bNe0YGVTDC
         3vc3jh+wUG1YiwvUk0ww6Wo9c1zmM0yvafCWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5NszAzyCxeqCYVF4rcK1etWk+lEs38VK5zvRzeDlGh0=;
        b=UGaDDMq/hjsbZRu7Du0NdMytcyWN9aAkyr9bMe/jD8L9Jn1rX+RnYgXXW9LdVDNgpd
         IbwoDfbgs5SC3WgRG16/DXAs3lQGH9tqNxb0rPA5pIIe+234pJFR3FQdAXVDu0ZGSlpK
         PxWA3P3GapmMWSnQ1+dsVnNuXcXNjWDtOP6chfGRqJKATsBO8kVBklRSuHvIHhZn9DmY
         40xiZ4+njjc57DBNGNwMFayVQHkD6MWRdloyKwD7P0xFXK4EXPdISNC7JE8e2sSUhvL6
         v34gUTzvp2IJWHFXofXpU4uDEE7o+gKIkakn/weYHj9xspR9MhBH7/5L4TaK4JiZyv7U
         jYag==
X-Gm-Message-State: AOAM532wlext4IKRacTus455cqKkS9R3qwAtJ8VVvARFljeCB1HFqAcB
        wY0A1F2oyCZds0KbeiMDgd0+5SDGx5On7onW
X-Google-Smtp-Source: ABdhPJzQd5fXdf6aneg9XYp7vkG6MEJQ2agpjBMb7BKqy69k3G6qkJm36GWeSX44JPzIQ8F2mvYVng==
X-Received: by 2002:a05:651c:1542:b0:249:a87f:8a34 with SMTP id y2-20020a05651c154200b00249a87f8a34mr4451795ljp.442.1648591848224;
        Tue, 29 Mar 2022 15:10:48 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id l8-20020a056512332800b0044a379f58fcsm2114869lfe.55.2022.03.29.15.10.46
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Mar 2022 15:10:46 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id t25so32668903lfg.7
        for <linux-i2c@vger.kernel.org>; Tue, 29 Mar 2022 15:10:46 -0700 (PDT)
X-Received: by 2002:a05:6512:3055:b0:44a:3914:6603 with SMTP id
 b21-20020a056512305500b0044a39146603mr4470007lfb.435.1648591846330; Tue, 29
 Mar 2022 15:10:46 -0700 (PDT)
MIME-Version: 1.0
References: <Yj19RH3qpzQsIV/O@shikoro> <CAHk-=wgoeUc15-8Wu8U=4FnwhgmyU3C13R107oigbmJRpi_sZA@mail.gmail.com>
 <YkIF9OqbZQ8yinz8@ninjato> <20220329142642.11692e8f@endymion.delvare>
In-Reply-To: <20220329142642.11692e8f@endymion.delvare>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 29 Mar 2022 15:10:30 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgqC1OU_a_r80-1EdwSc2SFY0m-V9u6XXr24_C3_XaNcw@mail.gmail.com>
Message-ID: <CAHk-=wgqC1OU_a_r80-1EdwSc2SFY0m-V9u6XXr24_C3_XaNcw@mail.gmail.com>
Subject: Re: [PULL REQUEST] i2c for v5.18
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Terry Bowman <terry.bowman@amd.com>
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

On Tue, Mar 29, 2022 at 5:26 AM Jean Delvare <jdelvare@suse.de> wrote:
>
> And this is how I came to the conclusion that, despite the weird
> feeling that there are too many conditionals in the i2c-piix4 driver,
> there's nothing smart that can be done to get rid of them, and we just
> have to live with them.

Thanks for the very complete response. Color me convinced.

              Linus

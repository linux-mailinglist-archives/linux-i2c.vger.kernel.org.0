Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 217E07AF893
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Sep 2023 05:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbjI0DXL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Sep 2023 23:23:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231960AbjI0DUs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 Sep 2023 23:20:48 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD683158B4;
        Tue, 26 Sep 2023 19:42:59 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c131ddfc95so159430801fa.0;
        Tue, 26 Sep 2023 19:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1695782578; x=1696387378; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VMinxs6nfn6iZUfMzZa2WeT44I91Ws9Lj88tZvpoGtU=;
        b=DnQ0O7TxSFeJaq/njn8sQ8a1nLF38MLqJIXu2k/JomimIGFmuLaz7pci0w7/XGu8+I
         Iq9nKckfkQpySiEqIFH9PM6ao+Svi/sziBju5qo4a/LdkqkC4PAPlc3qgWlKosWFkwaA
         o9VcQnThDB6+FJI5QL4qqMHqlUOIBrCDNuo4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695782578; x=1696387378;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VMinxs6nfn6iZUfMzZa2WeT44I91Ws9Lj88tZvpoGtU=;
        b=DkbBTQx0fGO1Ao7E9JQdIXsbSMci8ydNr9H8/oOrAgAq9XOS4Nzg08lymabaN2sryO
         7NqRzNaX5sg62pGSSTCR86pMarTqUEvvaYGW9kF0Sage3HcvNvyiDyELdIGW3UEmduOw
         5KVKTKh0WEbqfQyRRzJzXFjBdrc/eGik1Jd81vdv5M0jBrZs49c33W8cP2Nx/e334Egs
         LGAszw5pJ9h7PURtz9e8dlxPCFobSo7lsA9woUtgvH5dl+63KFV7yW7phVH6Bj+Tu86p
         0FpnbBwnnlOebfRo9DUT8U3WzDJi7bBTgOwLZgCa63+d6ScibkeWF20U+G8OhV5Ndsz9
         mNVA==
X-Gm-Message-State: AOJu0YyOrmkTnXNl1pv6G9qBWxYJMZMjejSHxMym/85FlhkyGVN3wrSi
        dCREO8PNjnr87OGzrg4KSpHac3NlChxeK91RDvo=
X-Google-Smtp-Source: AGHT+IEoGxjFIivq3ZMXhL6ZTDxnLdVcOLOzUHrNnMa0KFIxb8uxpmFj3uJhgYHyG7vXKUM/QD4YPpVc0zYFqvug4qM=
X-Received: by 2002:a2e:808d:0:b0:2bf:f599:be63 with SMTP id
 i13-20020a2e808d000000b002bff599be63mr681593ljg.41.1695782577775; Tue, 26 Sep
 2023 19:42:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230810072155.3726352-1-zhangjian.3032@bytedance.com>
 <CACPK8XfWKLS_4nBC+NCSw=21iQeaHzBXOROmz9T+S0qZHCBKeg@mail.gmail.com> <CA+J-oUtxiQBOT+VM3fbOUM8HL5TX-C4HqtbbT__b4_KsGAJy1w@mail.gmail.com>
In-Reply-To: <CA+J-oUtxiQBOT+VM3fbOUM8HL5TX-C4HqtbbT__b4_KsGAJy1w@mail.gmail.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Wed, 27 Sep 2023 02:42:46 +0000
Message-ID: <CACPK8XeO404ok+B+k4U_bdFE3yYebzT-UNcTqcHStJfEnDh6jg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] i2c: aspeed: Fix i2c bus hang in slave read
To:     Jian Zhang <zhangjian.3032@bytedance.com>
Cc:     Tommy Huang <tommy_huang@aspeedtech.com>,
        brendan.higgins@linux.dev, benh@kernel.crashing.org,
        andrew@aj.id.au, zhangjian3032@gmail.com, yulei.sh@bytedance.com,
        xiexinnan@bytedance.com,
        "open list:ARM/ASPEED I2C DRIVER" <linux-i2c@vger.kernel.org>,
        "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 22 Sept 2023 at 14:39, Jian Zhang <zhangjian.3032@bytedance.com> wrote:
> >
> > Tommy has submitted a similar fix:
> >
> >  https://lore.kernel.org/linux-i2c/20230906004910.4157305-1-tommy_huang@aspeedtech.com/
> >
> > His change is very heavy handed; it reinitialises the bus including
> > re-parsing the device tree (!).
> >
> > Should we have merged this fix instead? If not, are you able to
> > confirm that his change fixes your issue?
>
> I feel it's for solving the same issue, but I think this patch is
> missing the action
> `bus->slave_state = ASPEED_I2C_SLAVE_INACTIVE;`,
>  which means it can't resolve my problem. @Tommy, can you help confirm this?

You're right, it doesn't change the slave_state at all.

Unfortunately, despite no acks from the maintainers, this patch has
now been merged and backported to stable. We should complete the fix,
or revert it asap.

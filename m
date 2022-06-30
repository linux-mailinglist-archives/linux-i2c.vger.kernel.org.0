Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F4188561FBE
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jun 2022 17:55:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236154AbiF3PzP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Jun 2022 11:55:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235669AbiF3PzN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Jun 2022 11:55:13 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DEA437AA2
        for <linux-i2c@vger.kernel.org>; Thu, 30 Jun 2022 08:55:12 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-31780ad7535so183486377b3.8
        for <linux-i2c@vger.kernel.org>; Thu, 30 Jun 2022 08:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9MsOAXMM8WKUtsVZMX5faoN+Hi36yJwlfFDIhg/V434=;
        b=hVorlyqC4Gg6wtlkefwenISG3UysivY4rAI4vG2zTgsoRqJBoxbkg7fPZGE1KdNPTK
         xUy09dtkRe1inmjdXPDfgKvgdaypXxHGGxlR+VRdB7TZoc2A1NkGZ5Hr1kpzRr6/6B7q
         JBloQzKkNbKx5rVzjaPGNbDa2byu2wVVP9VTMctgGbD40soOfNzPsD4hTcWkj3zio9LH
         UHtI0WgJH+1LO8KZy1zkKiO4l65Ey3CRF07/dTcs7dZm9ApHI2zDn4SNltnbyCdnARl2
         ck3dMOBKMaxOh18WnHPhv7JhcbuJBB8iq0VausjHMcrp7PITeW5f6oTrtGJVfNzW3q7y
         M5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9MsOAXMM8WKUtsVZMX5faoN+Hi36yJwlfFDIhg/V434=;
        b=GSeqy9KRYdBxJ9BqnYYTKEXEHl5Ok5S1He7tftXUn7c/ozyjfwz6Zt26bkTFecara3
         ceBod5BihDHv9+SbvHbLB4po0Dylu2yZG+RgV4RCZfp6hFnx0vFgRO5ICcsavw5ou6q5
         yd5pZkXrgglZr+JIFpZRQ1CAQW8YK+rxg0nq8ghCGFOxbK1oVthYKkNd9xR1JI5dG9fH
         RC63Eza8FvYneJOhl3s0hBGpCaQcxMS8lF5szFnzaKSNZ17An6Hs1lW7aTGZvSf2q3jn
         Na/Je9HIrg///WljECIDoxMsRQYmzMTBf5EtWnrQ/8X/loteellt1FC0/dU4nnp3vzRG
         QoJQ==
X-Gm-Message-State: AJIora9qi172Yt9cAyGOzdxMoyAgaBpEzlDdHz0bT2CukOevTRd/CPiO
        WTrrVZWA9nlxPAqpY0s3ouyNgRoKb+cB4A/4ziDzwg==
X-Google-Smtp-Source: AGRyM1vyLbutq6DGhdX0e5gvJO0C7mY5yjShHPVn67Um7bh+PIAJZJxEV/hYLdXcWOGcHyRKWKCJ+ZG6S5VqhOiAuYM=
X-Received: by 2002:a81:68d7:0:b0:318:11df:a40d with SMTP id
 d206-20020a8168d7000000b0031811dfa40dmr11273981ywc.196.1656604511584; Thu, 30
 Jun 2022 08:55:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220628024155.2135990-1-zhipeng.wang_1@nxp.com> <Yryn8PdQIH7RaUwO@shikoro>
In-Reply-To: <Yryn8PdQIH7RaUwO@shikoro>
From:   Sami Tolvanen <samitolvanen@google.com>
Date:   Thu, 30 Jun 2022 08:54:35 -0700
Message-ID: <CABCJKud+iQ=Mo_-78hh-KsPAe9gtjqR0kxCTc3GOhkQd_F0GHA@mail.gmail.com>
Subject: Re: [PATCH] i2c: core: Disable i2c_generic_scl_recovery callback
 checks with CFI
To:     Wolfram Sang <wsa@kernel.org>,
        Zhipeng Wang <zhipeng.wang_1@nxp.com>,
        Kees Cook <keescook@chromium.org>
Cc:     linux-i2c@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 29, 2022 at 12:29 PM Wolfram Sang <wsa@kernel.org> wrote:
>
> On Tue, Jun 28, 2022 at 10:41:55AM +0800, Zhipeng Wang wrote:
> > CONFIG_CFI_CLANG breaks cross-module function address equality, which
> > breaks i2c_generic_scl_recovery as it compares a locally taken function
> > address to a one passed from a different module. Remove these sanity
> > checks for now.
>
> Can't we better fix a) the code or b) CFI?

Yes, we're working on fixing CFI:

https://lore.kernel.org/lkml/20220610233513.1798771-1-samitolvanen@google.com/

In the meantime, the possible workarounds are all more or less hacky.
Perhaps a slightly less intrusive alternative would be to add a
__cficanonical attribute to i2c_generic_scl_recovery and use the
function_nocfi() macro when referencing it elsewhere?

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index d43db2c3876e..dda93c5471f0 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -197,6 +197,11 @@ static int i2c_generic_bus_free(struct i2c_adapter *adap)
 #define RECOVERY_NDELAY                5000
 #define RECOVERY_CLK_CNT       9

+#ifdef CONFIG_CFI_CLANG
+#undef i2c_generic_scl_recovery
+#endif
+
+__cficanonical
 int i2c_generic_scl_recovery(struct i2c_adapter *adap)
 {
        struct i2c_bus_recovery_info *bri = adap->bus_recovery_info;
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index fbda5ada2afc..7310cbdbd940 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -663,6 +663,10 @@ int i2c_recover_bus(struct i2c_adapter *adap);
 /* Generic recovery routines */
 int i2c_generic_scl_recovery(struct i2c_adapter *adap);

+#ifdef CONFIG_CFI_CLANG
+#define i2c_generic_scl_recovery function_nocfi(i2c_generic_scl_recovery)
+#endif
+
 /**
  * struct i2c_adapter_quirks - describe flaws of an i2c adapter
  * @flags: see I2C_AQ_* for possible flags and read below

Kees, any thoughts on the least terrible path forward here?

Zhipeng, if you want to test this on an older kernel, please note that
you'll also need to cherry-pick commit
e6f3b3c9c109ed57230996cf4a4c1b8ae7e36a81.

Sami

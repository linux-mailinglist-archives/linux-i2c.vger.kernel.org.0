Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2633853C972
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jun 2022 13:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232699AbiFCLed (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Jun 2022 07:34:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244062AbiFCLec (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Jun 2022 07:34:32 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00E3131DEA
        for <linux-i2c@vger.kernel.org>; Fri,  3 Jun 2022 04:34:30 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id t6so10052347wra.4
        for <linux-i2c@vger.kernel.org>; Fri, 03 Jun 2022 04:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=PaEzrm9U0WjJMxkE+zbw8yGRv0uhjcRl9sFl9vmbKpk=;
        b=T+4giNeTLeF1/mm+/drZS7iypd5iIbIoEMNCPmDdegG7CLAQn/dwDqFocbXQGy6mH8
         xwuN4dKor2DbOqzXP/TI0BejsMDAwshVYY33D3Jk1zMFoQ3vG8XEJpHNxtIjemoF/c8V
         5wnQVEuTcuj6awGXFe1YChyo/2tpiTHTxvowyHt+lKQH9F0xiOR/0wf7dBKJE2l+JIsd
         P8zLd8gACF3ub7q5w/IGWiCJYR9wUyL3h8vUkw+2a8pXxoWgset2qlT9F/luJYjEHFGa
         MjSewAko46Abp+N/unTwSEJ8clegZ0F/yWfOaiNbulhq+Slz8XkYZUBZkcC41snwoIOW
         8iUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=PaEzrm9U0WjJMxkE+zbw8yGRv0uhjcRl9sFl9vmbKpk=;
        b=vVb7nhOe7WdNq3AQ24HPZILdCqXwLXnZjtk0an975nH6uZdgwC1guiKBhrbvEItpL5
         e0V7j5qmR5kpMc58Qi0gNMnEvZl6kBPwazo8pkxvkS+0GkLWev7SrzbjA4Ak30S+jZbD
         A8zqQf3zEWke1rfHJEFHjPV27Zl8088eDzrTU8KLfhRB0KP8GF2PDHfu91E2AyuxP9QX
         PfPN7jmNKGH1B87wyf1RC9ObjKNWEsz+Mcmk2Jhde74dutpc64J5eirdkyL0Sj3GiqYL
         T+OR+ieCrQVMwhHwUZdVIz42qM9TffS2+O8yikkZYhjacGdBjqWYnHH5vuesopoegf7Q
         3waQ==
X-Gm-Message-State: AOAM5315XK4BSAB20hoK+uZ60pNhbJrscGzAx78LzJ/dc0ujxDfU2lOk
        NeEYbOfKts3iOO2Vpw/j7ydopm40kGSDPR78cElWqT6O7LGN9Q==
X-Google-Smtp-Source: ABdhPJzp8Txf4Cvwb+HWD8wNnskNZFMEwQZzh3d3t9TeZZ1mnN/IFjxjjbX5GYmxPBVs+1YquA2uNaCXmZRJCj71mQs=
X-Received: by 2002:a05:6000:1815:b0:210:dd9:a9c2 with SMTP id
 m21-20020a056000181500b002100dd9a9c2mr7869709wrh.385.1654256069370; Fri, 03
 Jun 2022 04:34:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5d:64ed:0:0:0:0:0 with HTTP; Fri, 3 Jun 2022 04:34:28 -0700 (PDT)
Reply-To: markwillima00@gmail.com
From:   Mark <mariamabdul888@gmail.com>
Date:   Fri, 3 Jun 2022 04:34:28 -0700
Message-ID: <CAP9xyD0L3JNRjpSncYg2fGkKkxN9PzdDiB0CdjLTU6NxYe--_A@mail.gmail.com>
Subject: Re: Greetings!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

Good day,

The HSBC Bank is a financial institution in United Kingdom. We
promotes long-term,sustainable and broad-based economic growth in
developing and emerging countries by providing financial support like
loans and investment to large, small and
medium-sized companies (SMEs) as well as fast-growing enterprises
which in turn helps to create secure and permanent jobs and reduce
poverty.

If you need fund to promotes your business, project(Project Funding),
Loan, planning, budgeting and expansion of your business(s) , do not
hesitate to indicate your interest as we are here to serve you better
by granting your request.


Thank you
Mr:Mark

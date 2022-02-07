Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8042C4ACAEE
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 22:09:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233417AbiBGVJm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 16:09:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236701AbiBGVJl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 16:09:41 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4F71C061355
        for <linux-i2c@vger.kernel.org>; Mon,  7 Feb 2022 13:09:40 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id a11-20020a17090a740b00b001b8b506c42fso365286pjg.0
        for <linux-i2c@vger.kernel.org>; Mon, 07 Feb 2022 13:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vt/gagpi7Nz77MS3nqN6S2xR9wgWfKEo67s2ikFquW4=;
        b=lUAS4STJmlb/kIZM8SF/4Ryb9okSY9EZuOgQ7Qgf/kt49L1yBAxGZZpoMMOHU0PTwj
         dUF3bKwsAG05zkWeWa0OF0b+4/xt3OeGMo29X8XI3scOaxnujmB8mQSj4ImH+1oPWrwn
         iSyTQd3SC6MzallyVG1Yu1kiTa++JJNE4x2SP9NzDkvYHgOJMAdr4hUSccI2dZ5gJREH
         JdGAJn+3n8F7sPz4vT0u2yCv7x/ZgbRlpzMHeASp82RIxffKxfJtpTq4CozVy9cb6BYk
         epZo2mtaEE+BpGCRbNGynkD7HNrcMOfanCDZrF+cMCaMCpA0AKDC4g4DrTmwJpuhfkZW
         Mjtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vt/gagpi7Nz77MS3nqN6S2xR9wgWfKEo67s2ikFquW4=;
        b=JgsXqY2NFhku2eQFe2WlpmUTv5tbQU7VIKTeU3mi0VdzVeBxUb3S7yaQkLJdQm2TDj
         kojT5TfDq7QcbR70awDK3ltGABEMzGEoh8QcxdL0jtsgFzcJW/93jYYfama4uCKF/Rq5
         WFUp2wMIPFPgFIxf4LVqcodJQF/HTbGGan4Ix6d7UoGSE/YN8bXFTY1q4JlD2+C+sIMo
         mR2otwkQeWAs1+z7t4NRC+nUqNr9GcVdYKdh3XTWcoaeWufMwejUEK2PivPx/mEISysF
         e9FoII8AHqrYFpklqMc5tlkgGzMhQQvfBM/6+fFzoyLnm5hUJ1QyuU7fNeonR6zLK86J
         awZg==
X-Gm-Message-State: AOAM531/gseWKWrVeyxF88OSyhxCovR0gmndifyR8AmubKkBFolsowzd
        Ki3Kzq6q3m6B0JE3rw95Nywt81pHyny+bpZZIFep4Q==
X-Google-Smtp-Source: ABdhPJyXwV9H+NtpauAxHKT7z6HwfxkbmYoeISVisNYqiuhPxJO/ybL6mgLUAaqhx+bESls2oFS0tHwE3yHQUxUC8Yc=
X-Received: by 2002:a17:90a:348f:: with SMTP id p15mr824119pjb.173.1644268180043;
 Mon, 07 Feb 2022 13:09:40 -0800 (PST)
MIME-Version: 1.0
References: <89456fcd-a113-4c82-4b10-a9bcaefac68f@google.com> <YgF/0QGFN4SppLKg@shikoro>
In-Reply-To: <YgF/0QGFN4SppLKg@shikoro>
From:   Rajat Jain <rajatja@google.com>
Date:   Mon, 7 Feb 2022 13:09:03 -0800
Message-ID: <CACK8Z6Etj-gq1VKpkUBstiXEETekPWG9p9gKBtuFaZF05pQEvQ@mail.gmail.com>
Subject: Re: 5.17-rc regression: rmi4 clients cannot deal with asynchronous
 suspend? (was: X1 Carbon touchpad not resumed)
To:     Wolfram Sang <wsa@kernel.org>, Hugh Dickins <hughd@google.com>,
        Derek Basehore <dbasehore@chromium.org>,
        Rajat Jain <rajatja@google.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Thorsten Leemhuis <regressions@leemhuis.info>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>
Cc:     "loic.poulain@linaro.org" <loic.poulain@linaro.org>,
        Andrew Duggan <aduggan@synaptics.com>,
        vincent.huang@tw.synaptics.com, cheiny@synaptics.com,
        "Rafael J. Wysocki" <rafael@kernel.org>
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

+Rafael (for any inputs on asynchronous suspend / resume)
+Dmitry Torokhov (since no other maintainer of rmi4 in MAINTAINERS file)
+loic.poulain@linaro.org (who fixed RMI device hierarchy recently)
+ Some Synaptics folks (from recent commits - Vincent Huang, Andrew
Duggan, Cheiny)

On Mon, Feb 7, 2022 at 12:23 PM Wolfram Sang <wsa@kernel.org> wrote:
>
> Hello Hugh,
>
> > Bisection led to 172d931910e1db800f4e71e8ed92281b6f8c6ee2
> > ("i2c: enable async suspend/resume on i2c client devices")
> > and reverting that fixes it for me.
>
> Thank you for the report plus bisection and sorry for the regression!

+1, Thanks for the bisection, and apologies for the inconveniences.

The problem here seems to be that for some reason, some devices (all
connected to rmi4 adapter) failed to resume, but only when
asynchronous suspend is enabled (by 172d931910e1):

[   79.221064] rmi4_smbus 6-002c: failed to get SMBus version number!
[   79.265074] rmi4_physical rmi4-00: rmi_driver_reset_handler: Failed
to read current IRQ mask.
[   79.308330] rmi4_f01 rmi4-00.fn01: Failed to restore normal operation: -6.
[   79.308335] rmi4_f01 rmi4-00.fn01: Resume failed with code -6.
[   79.308339] rmi4_physical rmi4-00: Failed to suspend functions: -6
[   79.308342] rmi4_smbus 6-002c: Failed to resume device: -6
[   79.351967] rmi4_physical rmi4-00: Failed to read irqs, code=-6

A resume failure that only shows up during asynchronous resume,
typically means that the device is dependent on some other device to
resume first, but this dependency is NOT established in a parent child
relationship (which is wrong and needs to be fixed, perhaps using
device_add_link()). Thus the kernel may be resuming these devices
without first resuming some other device that these devices need to
depend on.

TBH, I'm not sure how to fix this. The only hint I see is that all of
these devices seem to be attached to rmi4 device so perhaps something
there? I see 6e4860410b828f recently fixed device hierarchy for rmi4,
and so seemingly should have fixed this very issue (as also seen in
commit message)?

>
> I will wait a few days if people come up with a fix. If not, I will
> revert the offending commit.

While I'll be sad because this means no i2c-client can now resume in
parallel and increases resume latency by a *LOT* (hundreds of ms on
all Linux systems), I understand that this needs to be done unless
someone comes up with a fix.

I wanted to confirm that the following patches shall continue to stay?

d320ec7acc83 i2c: enable async suspend/resume for i2c adapters
7c5b3c158b38 i2c: designware: Enable async suspend / resume of
designware devices

Thanks & Best Regards,

Rajat


>
> All the best,
>
>    Wolfram
>

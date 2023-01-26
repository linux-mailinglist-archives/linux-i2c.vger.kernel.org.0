Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0C6C67C6A7
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jan 2023 10:11:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236664AbjAZJLW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Jan 2023 04:11:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236296AbjAZJLW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Jan 2023 04:11:22 -0500
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66D3C3EC40
        for <linux-i2c@vger.kernel.org>; Thu, 26 Jan 2023 01:11:19 -0800 (PST)
Received: by mail-vs1-xe32.google.com with SMTP id t10so1296907vsr.3
        for <linux-i2c@vger.kernel.org>; Thu, 26 Jan 2023 01:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8SNsEiTCGlF2kxvhKH3RS9fyCJmlnEC5RQ9QnmfE1VQ=;
        b=RmdA+GKDIbOYkibt2Hs4G/Ajp6ngHqBedoH0v8wYpYr62SYcuuUjvA1Af4C/sSWOFW
         +eLQIS9ahzM9XXkbLXbZFO0Slwmhmr8Bccdvrq8b5ruN5kOUTnAPDK/w2GsXGVLICGFX
         l5Qutisu7Y1gjSH8l8zb3pdAchm8arCRQ1wG0gUyOFHYnzeno3EBkbsjip3EsHVb5UeX
         SH+k2cboFgvYIvg7+LQ/jeSyNmbK6vpUv+gzWMP5cQfZPXLvcqcN0x5405dB1u5iQqkN
         WQHISYPBySBW2eMmHz3ZZ5RBmTNQVVr5oWP1Jvt5JwMkNzc2QQGYyAnIWxY1RCYCercO
         EuUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8SNsEiTCGlF2kxvhKH3RS9fyCJmlnEC5RQ9QnmfE1VQ=;
        b=wN+BMKACFpmZC69uxM3ZuuDQJLugApIOyUtdDdENU2h7uLoapHWxQ1115Dx+8o2mrO
         jzEzf+cNLlGKKfrj2UhI/voh/vpfDZNA7eJdXeFHZ6E9rtf1lEBUd8NNyq6wC5C9fXF0
         H1D58uFZ5BD8wn7P5ddJPKF6ef4Mu0T+ff1WTdldAZavBGSUQdb6hJroJVURD5Rrob08
         cSuhVOgq4uBsRXO5+f2SyOG/tbJTW529Xo/P7hV51IfPZgguBe9KDcRCHYlVB2eTj1Ra
         uW2U/B5Z9R17jiBP7anuIKgi2KRwXC7C7dwrwjl89iO1domN9naVzgWqaLBXjPrnHBWv
         9Upw==
X-Gm-Message-State: AFqh2koBhi96IE3xjChm2UXvUBK4kHUZz33O1+CNZEkRuCI1ZlnHs1bZ
        8XllOiPtIQl3QTUX+tfOIWgxnl1myrxFcj8mbKhRMw==
X-Google-Smtp-Source: AMrXdXtwW1E/r8kShMxieiJt2HZn9ZtIcNFEbyz4hLe6tsg1Wy08G9QeNw++duG4V/VAU3KXoaGXwvIkdWYo4NPyE8Y=
X-Received: by 2002:a05:6102:3e08:b0:3c5:1ac1:bf38 with SMTP id
 j8-20020a0561023e0800b003c51ac1bf38mr5288497vsv.78.1674724278436; Thu, 26 Jan
 2023 01:11:18 -0800 (PST)
MIME-Version: 1.0
References: <20230118134940.240102-1-brgl@bgdev.pl> <Y9DpbChLZfDONHPz@ninjato> <Y9GpL9RBNM8H2ZSL@shikoro>
In-Reply-To: <Y9GpL9RBNM8H2ZSL@shikoro>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 26 Jan 2023 10:11:07 +0100
Message-ID: <CAMRc=McHowkYJBckM1eikcrBUoXXZN+OkozA-dNXZc1Zgd+Kfw@mail.gmail.com>
Subject: Re: [PATCH v3] i2c: dev: don't allow user-space to deadlock the kernel
To:     Wolfram Sang <wsa@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URI_DOTEDU
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jan 25, 2023 at 11:12 PM Wolfram Sang <wsa@kernel.org> wrote:
>
>
> > So, this code handled all my stress-testing well so far. I'll try to
> > think of some more ideas until this evening, but likely I will apply it
> > later. Nonetheless, more review eyes are still welcome!
>
> Ah yes, I now recalled why I had the gut feeling that this solution is
> not complete. See this mail thread from 2015:
>
> https://lkml.iu.edu/hypermail/linux/kernel/1501.2/01700.html
>
> There are still drivers using i2c_del_adapter()+kfree(), so removing the
> completion could cause use-after-free there, or?
>

Ugh, what a mess... I was mostly focused on the character device side
of it but now I realized the true extent of the problem.

It's not like there are just *some* odd drivers that delete the
adapter struct at .remove() - it's literally all of them one way or
another.

It's all because the adapter struct really should be allocated by
i2c_add_adapter() and bus drivers should only really provide some
structure containing the adapter description for the subsystem the
lifetime of which would not affect the adapter itself. This way the
adapter (embedding struct device) would be freed by device type's
.release() like we do over in the GPIO subsystem. Instead the adapter
struct is allocated by drivers at .probe() meaning it will get dropped
at .remove().

I wonder how many more subsystems do that. No wonder people blame
devres for these user-space device node crashes...

I don't have a good solution. I've been thinking about it for an hour
and every solution requires sweeping changes across the entire
subsystem. Or else we'd introduce a parallel solution that would do
the right thing and wait in perpetuity until all drivers convert -
like with i2e probe_new() which is after all much simpler.

Anyway, that's all I've got. We probably need to drop this change and
live with what we have now.

Bart

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DCDD666D67
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jan 2023 10:06:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239982AbjALJGp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Jan 2023 04:06:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239966AbjALJGN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 Jan 2023 04:06:13 -0500
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CB6943A03
        for <linux-i2c@vger.kernel.org>; Thu, 12 Jan 2023 01:01:12 -0800 (PST)
Received: by mail-vs1-xe36.google.com with SMTP id d66so5954455vsd.9
        for <linux-i2c@vger.kernel.org>; Thu, 12 Jan 2023 01:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N5Gv/lkMhRvVTTzKOnvOJgbWmrD30nth3OhwfwhuF0c=;
        b=rgyOuGyIKW8ztIWxndMNGNuxo2ku5Up56NMfudn60ePDqw4IWf9z8QhQGGfe8stiNf
         k7u6I5JyOE0W/rGj1Rr4uw3B9xIg9V0helQJ2queK/+SSwphzXnuKEcESlVQgFEdiAsD
         TFy6+O3nrWght+Nyz+lowkLFaGmIcnzQ0O2WcRCnpLX8QQXnye8FCU3I1ZwkA7Zb7Jj3
         nqo+WSGU0xfHPxP+JE+cPpQ8r8hvunUPbybetXaxd2XTmeOtMSwfA8FfL95reG6G8X1o
         FGfEeBCWguiHezJDFgiID4GjtkkIZn2wPzw9mbELn7SdOLMvl1u+ZD4Yuo/7uR1nQkRh
         TOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N5Gv/lkMhRvVTTzKOnvOJgbWmrD30nth3OhwfwhuF0c=;
        b=MvwRsgMy2qw8mR7ba20/+8mdMiFse/0mknd0hSdCMtDgXIvGD+6Pg/pM1FxfoHfqZX
         6QKJVIcPptjxaJQRh0YMYqYgczpYKjYQMkuKzyAiXXgD8E5J0I8BMzbDQgAxy3nsF6zx
         dhpVEWgiKthphsxwVYOOY/cjCDsdcjuB3BE3GcYd+cUEgsx/VE2IEBrBCCzcLZFxBAnZ
         yX3APRi7xSPztQ1xrW3rXU0jRX3jQMWwMkFL+Um74kcNJ9RpOOo1B1HR5IvS3snnI7cz
         YJYItlW5bNhkO33MJoPq+fnHE1bxg5Xi66vI4xgmmuWKnIK5Kl4sKgmjexctL5RhBwVC
         Hgwg==
X-Gm-Message-State: AFqh2kop1hBGE7XIINLC5GUh2bTxWOdoLvWffAp84Wy64WIA9mA5lYcz
        bo+/cPdlwGhU9vHMNHhaE6cAG5XVMs6DKSFgVqQGqI5b604EYg==
X-Google-Smtp-Source: AMrXdXuKrMjZzazH/V8044nUHDbfstac7kmyFgkTM2ptq6li+V+WfJ7w5YPk4bHZAsEyrEMAgFPMgntxF6o9ghBI2tk=
X-Received: by 2002:a67:df8c:0:b0:3c5:1ac1:bf38 with SMTP id
 x12-20020a67df8c000000b003c51ac1bf38mr10977120vsk.78.1673514071171; Thu, 12
 Jan 2023 01:01:11 -0800 (PST)
MIME-Version: 1.0
References: <20221229160045.535778-1-brgl@bgdev.pl>
In-Reply-To: <20221229160045.535778-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 12 Jan 2023 10:01:00 +0100
Message-ID: <CAMRc=MfhVVN+W0Th8jdzTBHu6reFNpkm_cst3jMQZij0bDD=jQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] i2c: fortify the subsystem against user-space
 induced deadlocks
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 29, 2022 at 5:00 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Several subsystems in the kernel that export device files to user-space
> suffer from a bug where keeping an open file descriptor associated with
> this device file, unbinding the device from its driver and then calling
> any of the supported system calls on that file descriptor will result in
> either a crash or - as is the case with i2c - a deadlock.
>
> This behavior has been blamed on extensive usage of device resource
> management interfaces but it seems that devres has nothing to do with it,
> the problem would be the same whether using devres or freeing resources
> in .remove() that should survive the driver detach.
>
> Many subsystems already deal with this by implementing some kind of flags
> in the character device data together with locking preventing the
> user-space from dropping the subsystem data from under the open device.
>
> In i2c the deadlock comes from the fact that the function unregistering
> the adapter waits for a completion which will not be passed until all
> references to the character device are dropped.
>
> The first patch in this series is just a tweak of return values of the
> notifier callback. The second addresses the deadlock problem in a way
> similar to how we fixed this issue in the GPIO subystem. Details are in
> the commit message.
>
> v1 -> v2:
> - keep the device release callback and use it to free the IDR number
> - rebase on top of v6.2-rc1
>
> Bartosz Golaszewski (2):
>   i2c: dev: fix notifier return values
>   i2c: dev: don't allow user-space to deadlock the kernel
>
>  drivers/i2c/i2c-core-base.c |  26 ++-------
>  drivers/i2c/i2c-dev.c       | 112 +++++++++++++++++++++++++++++-------
>  include/linux/i2c.h         |   2 -
>  3 files changed, 96 insertions(+), 44 deletions(-)
>
> --
> 2.37.2
>

Hi Wolfram,

It's been two weeks without any comments on this series and over a
month since v1 so let me send a gentle ping on this.

Bart

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1DB2450A69
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Nov 2021 18:01:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231374AbhKOREk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Nov 2021 12:04:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230385AbhKOREe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Nov 2021 12:04:34 -0500
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A32CDC061714
        for <linux-i2c@vger.kernel.org>; Mon, 15 Nov 2021 09:01:37 -0800 (PST)
Received: by mail-il1-x12c.google.com with SMTP id l8so17444593ilv.3
        for <linux-i2c@vger.kernel.org>; Mon, 15 Nov 2021 09:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mHYUc1wY+XMa4sqcWEtA/HMvxlAjaod7I7i3bx8oN/U=;
        b=ME3F1CzdIJN0UcKqKbpvONGd5csvj2s7zS3j9uI2pJ8f38CiPlc8nGUTErUKNCyzDW
         +jdwqK+nDQ4osS1zH1q2FzYO5iz+SCXbtmHzN6pwG1aBIgLHi5FnBqfY01Hdc7vIfvrf
         gewh4aE6dk3mvwhfcW+gLqHtAiuDmruJCwHG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mHYUc1wY+XMa4sqcWEtA/HMvxlAjaod7I7i3bx8oN/U=;
        b=0mxuFBNXySlwrQmIvE20Edla/st8WeSiVbRQXKDdSz9CnYUOst8V6q/jnYRDDzPWML
         0Vdg+9BnAZNQSxxeI1cbNZGMTepYwz24v/lr9OvbeSLpM+Rnaw8O78OcvNbXUJqB+tSl
         GBWeVE0RSebBtjkkka03oMquRaHOH2Um1zLuziQ6U+txhB1+ecD20UH0ajblV+VTBStP
         QsEOiAjtg/lB8IwyR2vNUGo0n0upvbLeM25eKjG/+mErqJmNd6Jj1wcnphyGjTAhVdSi
         cwkpYkQ6xqKCVtcuF3ISIFFvOZWtCWwgs0RmCoTaj1dlcplhPnU89utof+3wH72OZ9GW
         immg==
X-Gm-Message-State: AOAM533yi5JxgQ2yAKXcS97ORkrFLkkD7xeicfPJnsf1NVvCU2IeswnI
        vpP10HFuqBrVGBm+pwBIPyIEz4ECJKodQQ==
X-Google-Smtp-Source: ABdhPJxjKyphlap1wqkw5et5y/0wk7Ry1m7HnLfQXWuMWunOeVSu1Nd0h+Yv/ccoPG2tvgRa9O+CyQ==
X-Received: by 2002:a05:6e02:19cb:: with SMTP id r11mr211441ill.151.1636995696846;
        Mon, 15 Nov 2021 09:01:36 -0800 (PST)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com. [209.85.166.50])
        by smtp.gmail.com with ESMTPSA id h15sm10490511ili.26.2021.11.15.09.01.36
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Nov 2021 09:01:36 -0800 (PST)
Received: by mail-io1-f50.google.com with SMTP id k22so22231439iol.13
        for <linux-i2c@vger.kernel.org>; Mon, 15 Nov 2021 09:01:36 -0800 (PST)
X-Received: by 2002:a6b:d904:: with SMTP id r4mr245251ioc.52.1636995695808;
 Mon, 15 Nov 2021 09:01:35 -0800 (PST)
MIME-Version: 1.0
References: <20211115154201.46579-1-andriy.shevchenko@linux.intel.com> <20211115154201.46579-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211115154201.46579-2-andriy.shevchenko@linux.intel.com>
From:   Evan Green <evgreen@chromium.org>
Date:   Mon, 15 Nov 2021 09:01:00 -0800
X-Gmail-Original-Message-ID: <CAE=gft4uiP8fVyE-+KDM_LQBKTwPMOb51JWU7=Jt=ggJV9dSFA@mail.gmail.com>
Message-ID: <CAE=gft4uiP8fVyE-+KDM_LQBKTwPMOb51JWU7=Jt=ggJV9dSFA@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] i2c: mux: gpio: Don't dereference fwnode from
 struct device
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 15, 2021 at 7:42 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> We have a special helper to get fwnode out of struct device.
> Moreover, dereferencing it directly prevents the fwnode
> modifications in the future.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Evan Green <evgreen@chromium.org>

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 045071F8908
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Jun 2020 15:50:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725815AbgFNNuY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Jun 2020 09:50:24 -0400
Received: from mail-oo1-f53.google.com ([209.85.161.53]:43150 "EHLO
        mail-oo1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727044AbgFNNuY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 14 Jun 2020 09:50:24 -0400
Received: by mail-oo1-f53.google.com with SMTP id i4so113298ooj.10;
        Sun, 14 Jun 2020 06:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RuiMPD/925GRUxPIwh/HAFgyStseOa7F2neLPlWYn2M=;
        b=XhMDUcz/HYfUzDKB2ncaGtD6418+PLhlwYfgSS7RBe/u2hOS/f5H/GDY24me0JE6a3
         Ai2tTl6aq4OCs54d0bTiVVM6qof/DzlunQrp4pZUF9ykRKBNiddZ6xhtzlg1uZQ0NEJl
         yuTQ+qHO0t9XPSPiCxmUBCgbkk3w2vC/YOx5nIKmMXiSK29Iv7PG/9DAPixbkzFs64L6
         9ey+iIqCoQL7uwkdOOgHOEE2yrHsJDn99CdO7isPj8UW82gIy4CD0rTg0pe9KG9vs18C
         CFwzPoIzw5S10qUcMpQmiY/4R2O7FQ7/dPe/lhIkHF8ocuFNXaPIzrLjXPsUzXK0OeGy
         hD1Q==
X-Gm-Message-State: AOAM5323FMl+VDkO5AE1YGMGOpnLa9bdynFGbwxSRCDry+ni9R/p6FXI
        92XqBOl7xbe4ym7/L22Ypn2tLbHm7yw5xvGs8XVMZdy1
X-Google-Smtp-Source: ABdhPJzqVXu3vZeyVx1Kak6I0WdkwzIvuP8xTo0QW9K5ObbGwLsZAg3/DTHY2haRqgzA7QEnnq4LD9MXtNB2Qx0IpmY=
X-Received: by 2002:a4a:5744:: with SMTP id u65mr17737133ooa.1.1592142623019;
 Sun, 14 Jun 2020 06:50:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200614090751.GA2878@kunai>
In-Reply-To: <20200614090751.GA2878@kunai>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Sun, 14 Jun 2020 15:50:11 +0200
Message-ID: <CAJZ5v0g0qJDrEvRrxEboc1Bs_9dgqpV47rFOZrJQLvOS44nAXg@mail.gmail.com>
Subject: Re: RFC: a failing pm_runtime_get increases the refcnt?
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linux PM <linux-pm@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Jun 14, 2020 at 11:08 AM Wolfram Sang <wsa@kernel.org> wrote:
>
> Hi Linux-PM,
>
> both in the I2C subsystem and also for Renesas drivers I maintain, I am
> starting to get boilerplate patches doing some pm_runtime_put_* variant
> because a failing pm_runtime_get is supposed to increase the ref
> counters? Really?

Yes.  Really.

pm_runtime_get*() have been doing this forever, because the majority
of their users do something like

pm_runtime_get*()

...

pm_runtime_put*()

without checking the return values and they don't need to worry about
the refcounts, which wouldn't be possible otherwise.

> This feels wrong and unintuitive to me. I expect there
> has been a discussion around it but I couldn't find it. I wonder why we
> don't fix the code where the incremented refcount is expected for some
> reason.
>
> Can I have some pointers please?

The behavior is actually documented in
Documentation/power/runtime_pm.rst and I'm working on kerneldoc
comments for runtime PM functions in general to make it a bit more
clear.

Cheers!

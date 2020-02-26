Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B425716F644
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Feb 2020 04:54:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbgBZDyP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Feb 2020 22:54:15 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:39729 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbgBZDyP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Feb 2020 22:54:15 -0500
Received: by mail-pg1-f193.google.com with SMTP id j15so611564pgm.6
        for <linux-i2c@vger.kernel.org>; Tue, 25 Feb 2020 19:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mC0AUbuGwzzXNh/0mL7mit/Jd6XtaI0kBBKvzGRcl3o=;
        b=XIvwCkDBWVuMnLt7O7sMQOxGwASjWFaBf/eW/4reQxMLDoVNJEqMZ4FiDBeoY0DMch
         /KtlLDOvNqNxOxK07ZHZYefKDWtP6HkbgjKWOPNRHRKROUsADRwk1cw0qMGGDkX3rt3U
         fyCzvB1I0XkuzTWirC1nBnNF4FkIk7Jjp1wro6iE88xt8NyEujbF1npB/Pj2ci0pVgkf
         q9JvxkQXuYNg2XPmaI1c1a6YGd46PhhCnMmQ28ZK5iJwiDkyBOLjdXBN3cywdxByCY+S
         OmdC0yDQjXPdTFqv80Rigr4sJW1k0tV6DNN78Ij9Qp5wmfgz+a6jgTaQnYS6YloHBWqO
         aRNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mC0AUbuGwzzXNh/0mL7mit/Jd6XtaI0kBBKvzGRcl3o=;
        b=RsAV/AZAkt+/P/wXDAS+0Ppjl3XP4MQSwSRuMTMH7QvP0enEEJsyiSzPWMtazSWW++
         cxLPvJ0+BoWrBUb8FCkJ1LkywruoVvHHpt3LQ+MgNS8A2TQeyC8ahTTFO2DwHrYKtD6b
         IxKzo4V35hbBdt8wlcCtjJWDs5FD/IyKZVwfwdqqj1IHGnwXsAenhNngnzd2bfagapA/
         b1fHWwW7Bl1+uMg44fm+DJkceEtbLxs6BZ3+POpaiWZd6O6BWHnPAcRcjCHfubSo6SJu
         7ab2Ei4O45ouECX552QfOyEpU2SEVUvEoeiueYBaO38GmLMkPdueZzARSSKwF1vQ2L72
         1W2A==
X-Gm-Message-State: APjAAAUA/TRUfOyCxZiXgoIDJGbH7eSXZB91bGoab5U+tEzUJzeW0vwg
        rCL81VYCEt3IlpNUvwJaI81W/CcOM2OJysqvl3FXFw==
X-Google-Smtp-Source: APXvYqw1hZXdgCT2Dr/Ox3rRVbClSYWNgRYm9NrkhZk3AQSl8CGNu9efjtzdr1B/Zpvn8bnuGtmgFN2C85IAZ9pqqRY=
X-Received: by 2002:a62:6842:: with SMTP id d63mr2133117pfc.113.1582689253548;
 Tue, 25 Feb 2020 19:54:13 -0800 (PST)
MIME-Version: 1.0
References: <20200224151530.31713-1-andriy.shevchenko@linux.intel.com> <20200224151530.31713-6-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200224151530.31713-6-andriy.shevchenko@linux.intel.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 25 Feb 2020 19:54:02 -0800
Message-ID: <CAFd5g46rCUno1oFaGy2HmA0i3iUkpZCN5kz7=Qoq+Mc5KixufA@mail.gmail.com>
Subject: Re: [PATCH v1 06/40] i2c: aspeed: Use generic definitions for bus frequencies
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Feb 24, 2020 at 7:15 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Since we have generic definitions for bus frequencies, let's use them.
>
> Cc: Brendan Higgins <brendanhiggins@google.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>

Thanks!

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6123126DD2F
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 15:53:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727098AbgIQNxi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 09:53:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726783AbgIQNut (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 09:50:49 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3DD9C061D73;
        Thu, 17 Sep 2020 06:50:24 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id f18so1239780pfa.10;
        Thu, 17 Sep 2020 06:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KPaE7MzGUy8EbIKncE+ieqkHzqJTXMjDit15B2UGepg=;
        b=a7Tbc5qCqZH1fluejWr2MXblRtsb9a2CqU2gJzpaLB9c9UMzc+C1vVA3c41+7EzAZN
         xqsUgvC68sxJhZSg5G87dmdsSWmfyB7XBEgTunHAWWdnBPsWSSCXjfTvLVbvju9OINYU
         emefOm/lLYe7UdeEL3G8G+bcX7vb0Jw+6sitSGEpAhGnkoNHCCQ3C4+Hc2j/V8WSZA+E
         QJ9XIZDpo/soa+7C1+SrBzWjcPrz8wdqJN2OxJIsnP+V8uzVhUVJdfq+uj2JlJh7wNtZ
         GRWKYwwEIoRe9SETYWdUoYKEhdQG8mdstglf9vkeQSQi1QtAoN8M92aJywoZXAxTbw63
         DMNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KPaE7MzGUy8EbIKncE+ieqkHzqJTXMjDit15B2UGepg=;
        b=rOQr+74F1vP0ToiGnp7GDUSJTa8Ok3dizlVdL3YJIME8ZEyG3NwS4t5KmBYZqkg6Nu
         gzTm1TAuNSidyO7zWcgbxPMcgiLx7jUJvQ88pjNTnhsXPN1JNdVxd+Vrv0VKqeGzkZi0
         zem1g2hU02MwGSzpkkEWjUb1HXAFSVgeI7NtAcrbudusznGPIPKNUE4OUcFVRGI6yvb8
         yBJMah48/wLyy4Sd8xKkbfd3KxP/FDlBPsF4I6u0JTJcacVffmgbE6KFlN7fzUZfOJq7
         3LSFbu4mydes5Jxhlpe8IJSNlIKtwjedDjyfpqDrwi1GXdO4ihZpSj0T2Yb41fOqlEjt
         SJvQ==
X-Gm-Message-State: AOAM530lES8lacUwTdHCdPbVW4P5mWHHCT5NVLwtt5QyFuqZLcxuRjvk
        OIbDr8NxPJq0BiENy9kLtz7her0geih5l54yU/o=
X-Google-Smtp-Source: ABdhPJxMxXTy2uCYupbtrxsmgKQ11wUvjaFj0XA2C+8VDhh7rl8J6tQJs14Up25DkPThBFF4YdLE5wdSJQ+X85PmC6k=
X-Received: by 2002:a63:d648:: with SMTP id d8mr22534746pgj.4.1600350624302;
 Thu, 17 Sep 2020 06:50:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200908224006.25636-1-digetx@gmail.com> <20200908224006.25636-28-digetx@gmail.com>
 <20200917120955.GF3515672@ulmo>
In-Reply-To: <20200917120955.GF3515672@ulmo>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 17 Sep 2020 16:50:06 +0300
Message-ID: <CAHp75VdEoLAMvQWb1_p8ydROmY9p7KCqFGarRsgM8p8nDhyY7g@mail.gmail.com>
Subject: Re: [PATCH v7 27/34] i2c: tegra: Check errors for both positive and
 negative values
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 17, 2020 at 3:09 PM Thierry Reding <thierry.reding@gmail.com> wrote:
> On Wed, Sep 09, 2020 at 01:39:59AM +0300, Dmitry Osipenko wrote:

> Why? All of these functions "return 0 on success or a negative error
> code on failure", don't they?

And what is the point of having ' < 0' in all those cases?

-- 
With Best Regards,
Andy Shevchenko

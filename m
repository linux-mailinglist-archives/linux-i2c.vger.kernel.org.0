Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5038CD0319
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2019 23:54:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725879AbfJHVyg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Oct 2019 17:54:36 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:38830 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726062AbfJHVyg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Oct 2019 17:54:36 -0400
Received: by mail-pg1-f193.google.com with SMTP id x10so26859pgi.5
        for <linux-i2c@vger.kernel.org>; Tue, 08 Oct 2019 14:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V1+lJqves7ucGJOP/Nkkia3hCPKmcD+/qXX6Owgsp9Y=;
        b=jMmx7myYY7/SnDMBF8ju9UVZHQALm1OwuJ9FChPOq4Vb5YNwgNbqblnumipDlA8sjC
         VGxSI8MJw/wpOZPJQZkPHmIyJDMn/TSZJtD+wNPpzwTk6igGcgC3hIT07DU+et0T0WqQ
         04ICCnAMSPH0bl5+rnoko5GsX0p1DAp1cfNL35R6fxEzfubIjCmks/djSOWtu5QoIt/n
         t4xz9B2AtHRU0akas7NOwuBhOV18XnXAVZlaUD9/ejc+sbksFKfgnbh6rNc3KtFI0g3o
         LVOr/Y3v4esmPZO2zxJSqsGAu3JSs0X7eFKgyjXRVq7sp1olZi2RdOGJ9kr0/oT17cPX
         37nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V1+lJqves7ucGJOP/Nkkia3hCPKmcD+/qXX6Owgsp9Y=;
        b=CBCM2p3OjneqlixbUFAtVQiiXwIyUJZh/FHchKq3sKdoDGxgvBpYILHQpNfFMk2PfT
         rigJPug8nK0SI06oSjTlvsw4IXOX6LqpUjLXWbkIOJJUiyd5Sy6/YfCjPLiive5lUiZh
         u2AsviW9s384dQUH5/T6Gl3JW+1oKRFzncqfehgxNWcA9quEhDJKHAhHVStkQysgSUib
         1pfdRSNvTFmc1VsIEfztDBZ8r5OLhCn4Bvoeu3kZ/llMnN5Mgvg/CmuG0OT+tpH4efBZ
         p9QSsvt/CgX9yr/dI5Mz6WaCv0lro8IxNKhJHahVRY2btHoN5/JcKG3rJYF5+16k3x4g
         00Ew==
X-Gm-Message-State: APjAAAW4yEknq9Axk8rSpkzFVoRyrK+r4fown2JHuMwvnjUMW2NQSthn
        BJtszLaES2N0w3jljIS/THbJDx1P9DmLHG59eakxmQ==
X-Google-Smtp-Source: APXvYqwhkBSeIrfZPsL7ZK9LW5v5HqGqG3I9HK6n3n5INpZAPcE00GaqUqIyBYMJT+42oLmz1YYH0DQmqXq2qu0HNgI=
X-Received: by 2002:a62:3387:: with SMTP id z129mr89443pfz.185.1570571674841;
 Tue, 08 Oct 2019 14:54:34 -0700 (PDT)
MIME-Version: 1.0
References: <20191007231313.4700-1-jae.hyun.yoo@linux.intel.com>
 <20191007231313.4700-4-jae.hyun.yoo@linux.intel.com> <20191008203157.GA184092@google.com>
 <ac256b3f-2a06-6fa5-72ab-d8f8014d253e@linux.intel.com>
In-Reply-To: <ac256b3f-2a06-6fa5-72ab-d8f8014d253e@linux.intel.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 8 Oct 2019 14:54:23 -0700
Message-ID: <CAFd5g47vLN6NyZR73+EqOqfOPnM7CkGGsCwEn3udnJt99d8KCg@mail.gmail.com>
Subject: Re: [PATCH 3/5] i2c: aspeed: fix master pending state handling
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Joel Stanley <joel@jms.id.au>, Wolfram Sang <wsa@the-dreams.de>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Jeffery <andrew@aj.id.au>, Tao Ren <taoren@fb.com>,
        linux-i2c@vger.kernel.org, devicetree <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed@lists.ozlabs.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Oct 8, 2019 at 2:13 PM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> On 10/8/2019 1:31 PM, Brendan Higgins wrote:
> > On Mon, Oct 07, 2019 at 04:13:11PM -0700, Jae Hyun Yoo wrote:
> >> In case of master pending state, it should not trigger the master
> >> command because this H/W is sharing the same data buffer for slave
> >> and master operations, so this commit fixes the issue with making
> >> the master command triggering happen when the state goes to active
> >> state.
> >
> > nit: Makes sense, but can you explain what might happen without your
> > change?
>
> If we don't use this fix, a master command could corrupt data in the
> shared buffer if H/W is still on processing slave operation at the
> timing.

Right, can you add that to the commit message?

Is this trivially reproducible? We might want to submit this
separately as a bugfix.

Actually yeah, can you send this separately as a bugfix? I think we
might want to include this in 5.4.

Wolfram and Joel, what do you think?

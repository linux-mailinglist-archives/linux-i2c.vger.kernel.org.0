Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02B492918EF
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Oct 2020 20:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727484AbgJRS6k (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 18 Oct 2020 14:58:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727427AbgJRS6k (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 18 Oct 2020 14:58:40 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08638C061755;
        Sun, 18 Oct 2020 11:58:40 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id n9so4674600pgt.8;
        Sun, 18 Oct 2020 11:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wCGvp1lZoKivDM/KnoyXas7xQDZTM6HGU0wR9u0o5c8=;
        b=U25izBtm6G/XPQ5QdXw32U0nLZSACEKKvJh2FufvPOB4dWVp0ICdyY/mmRsx6JwgJV
         3R0zuGpyWpY1joPy/BBXdE5/GAOHWNmaympu6pQZ/HN8kQTTj2L8tgQUTN8ZWS+A3p+X
         J9b3ajmEejrST0iiVq4LHNAj15D7RM9Zdt2lrO0nqEVLi7qAxLmjO6E1aqPa7OkpO4h4
         QDYWIE5qlW1OjKNzjimEbsQajHt0Hv3OxLnyJTdyXwFTDpYNWaynye0n31EvpAnWwJIX
         tR0uPmXeJnmjKlFH2UgrHyUw4pw35VPrdkc1sK19IicwZFa4pPOSCNXHMP6x8LwVg4fb
         LTUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wCGvp1lZoKivDM/KnoyXas7xQDZTM6HGU0wR9u0o5c8=;
        b=KZNB2Mi9+diEor3AUdgBe26DUVqq35ESjEoVqWSghHJrZxYOtQygUAHRabiSOqVWJa
         5xm1TmlABJ3W/kX60r8Skxg76StiToLKYH+KoVtTXrkXvrMszepq9ECjBeG5VIJk5juA
         bvxxph3/kFrL5WnyOsCBqORcOQJTdglvId7kA8P2rASPP5VqyM5/G0HpKVOf21dNjn4y
         FGp6o1eoxZHMsZyi6JdWcNXdoBQvT3tAYlSdnoi4RQr6ANUfOV1MaUFD67FqQv7g2HpK
         zH/wdFbhoOL56BNh4mzGOdEVKyKReVQ0I308toPtRW/H1EaVzdKTv2uaefiZlzCSmq+4
         eoDA==
X-Gm-Message-State: AOAM530qslqLFOHhciGYaB2igwfPm2lWbQ0oB9nFWEfGyw/3VhW1qlxk
        o9T1MrbS754SEk5zyiqfl+i9Kw4dOTStsZBKUjJQTM5V8KPhDjAg
X-Google-Smtp-Source: ABdhPJynwuBfvCQooMltLQGGISlNyAYzKFM6qT83Eq2l1RegvXxm5BwhMAJqpQU3eA7s5O1TZKPP8oxcnzTh5yP2vi8=
X-Received: by 2002:a63:f908:: with SMTP id h8mr4355953pgi.203.1603047519250;
 Sun, 18 Oct 2020 11:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <20201016222523.364218-1-evgreen@chromium.org> <20201016152454.v3.2.Idef164c23d326f5e5edecfc5d3eb2a68fcf18be1@changeid>
In-Reply-To: <20201016152454.v3.2.Idef164c23d326f5e5edecfc5d3eb2a68fcf18be1@changeid>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 18 Oct 2020 21:58:23 +0300
Message-ID: <CAHp75VfsM+ysz_tr_h0rJpspcZAToiV+H5KDCi7J=LCEO0sFxQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] i2c: i2c-mux-gpio: Enable this driver in ACPI land
To:     Evan Green <evgreen@chromium.org>
Cc:     Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Oct 17, 2020 at 8:30 AM Evan Green <evgreen@chromium.org> wrote:
>
> Enable i2c-mux-gpio devices to be defined via ACPI. The idle-state
> property translates directly to a fwnode_property_*() call. The child
> reg property translates naturally into _ADR in ACPI.
>
> The i2c-parent binding is a relic from the days when the bindings
> dictated that all direct children of an I2C controller had to be I2C
> devices. These days that's no longer required. The i2c-mux can sit as a
> direct child of its parent controller, which is where it makes the most
> sense from a hardware description perspective. For the ACPI
> implementation we'll assume that's always how the i2c-mux-gpio is
> instantiated.

Can you tell me if the following is relevant to what you are looking for?
https://elixir.bootlin.com/linux/latest/source/drivers/i2c/i2c-mux.c#L393

-- 
With Best Regards,
Andy Shevchenko

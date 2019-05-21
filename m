Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F410D24AF6
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2019 10:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbfEUI6H (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 May 2019 04:58:07 -0400
Received: from mail-ua1-f67.google.com ([209.85.222.67]:39615 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726705AbfEUI6G (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 May 2019 04:58:06 -0400
Received: by mail-ua1-f67.google.com with SMTP id 79so6331006uav.6
        for <linux-i2c@vger.kernel.org>; Tue, 21 May 2019 01:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ASCK5QEsgPSM1g1u7FGizuNcDI5mfe6ouhE1b8rzrSY=;
        b=OGaKD9fkwz/Uh1otcyfhnq5/11wcGhDIMBsJWSCFGVzL84pS/hohwFfTIPr0f3C7Ss
         TCzV+PrZ/UE1xdmLWaFz6PlGI/iF3RtRcVfLUtdvGvPDcDjQ6ZWUuw7/hqHnzw4aVDq1
         T+TY5Hf5SwxBmY4jlUIN7MgSgWIeGv9WeCgHuKRb6Ws8uWAfz87GnLQtfCKnhwCm5Ijl
         7AT6oOuPUrKCta8mX1J86JEXXy7ICqIg+BDY8PRPDNIGX4oA5flVrgmU0Joi7mCEt2Wr
         R+xJmID9TmfovxsKCZZJ9RzeZZ/7PNIBdrrTxN3UIyhoLQvh5nHJEXpJfG6LmHecnXdD
         QFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ASCK5QEsgPSM1g1u7FGizuNcDI5mfe6ouhE1b8rzrSY=;
        b=gtiKE76ecbFYYf8ws0ld6ipn1XE0pbpijZYGFLitz8ddvIawa6BNIJ0YW3vgXx00Sc
         Ypz68tvPiSIF+N9Zg8w95jv+Fjujqf+Z4m+rMS8Fs2QwKOUl3t84TVrvJSfcsaq5PAh8
         cFesouo0nglh1A0TIAms+fNv/sS0xaQNPyQfqD1Ih+B2qUm7hlupTP+v9JhaESoSetKJ
         Xxv3Zsv3ST+KMeoMUsmqeMEVZmsFmghHKHt5yrf8glBmYyBDSNQdqbQBhIWjn4xEoG+q
         6KTW0U9gvXVqnNduXEikCNjvL1VoIjGDkY0XgI7KiKAF89Ka1yxLf04qa/IcJSnNJWun
         hqtA==
X-Gm-Message-State: APjAAAX+bUyTzOG0n2+g48/RqTRJIDNU3Q5tzsJ5mBhtFAz9VAMY/1aw
        zXlbKaQv3enqnr1Qp7crsVXBlhhY1POZsupdLQzgPQ==
X-Google-Smtp-Source: APXvYqzkKcNaCd+xd63rL6haTKxCeW8/LcqpqGKBrmCWjM1IJegwyk74C67ww1GqqytfFzxidHgluiDjyzYYhL10aqk=
X-Received: by 2002:ab0:45e9:: with SMTP id u96mr17987279uau.75.1558429085797;
 Tue, 21 May 2019 01:58:05 -0700 (PDT)
MIME-Version: 1.0
References: <1558361478-4381-1-git-send-email-sagar.kadam@sifive.com>
 <1558361478-4381-4-git-send-email-sagar.kadam@sifive.com> <mvm7eakjjf7.fsf@suse.de>
In-Reply-To: <mvm7eakjjf7.fsf@suse.de>
From:   Sagar Kadam <sagar.kadam@sifive.com>
Date:   Tue, 21 May 2019 14:27:54 +0530
Message-ID: <CAARK3Hn4-amRV-knDa5UR8J68DKxWaBnC3O98KvciNpbwbsAGA@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] i2c-ocores: sifive: add polling mode workaround
 for FU540-C000 SoC.
To:     Andreas Schwab <schwab@suse.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, peter@korsgaard.com,
        Andrew Lunn <andrew@lunn.ch>,
        Palmer Dabbelt <palmer@sifive.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Thanks Andreas,
Yes, I rebased to v5.2-rc1 and observed that there have been changes
in polling interface, and i2c->flags is not longer being used for
setting the polling mode. I am working on a way to hook in the fix for
broken IRQ and will submit it in v6.

Thanks & BR,
Sagar Kadam

On Tue, May 21, 2019 at 2:03 PM Andreas Schwab <schwab@suse.de> wrote:
>
> On Mai 20 2019, Sagar Shrikant Kadam <sagar.kadam@sifive.com> wrote:
>
> > The i2c-ocore driver already has a polling mode interface.But it needs
> > a workaround for FU540 Chipset on HiFive unleashed board (RevA00).
> > There is an erratum in FU540 chip that prevents interrupt driven i2c
> > transfers from working, and also the I2C controller's interrupt bit
> > cannot be cleared if set, due to this the existing i2c polling mode
> > interface added in mainline earlier doesn't work, and CPU stall's
> > infinitely, when-ever i2c transfer is initiated.
> >
> > Ref:previous polling mode support in mainline
> >
> >       commit 69c8c0c0efa8 ("i2c: ocores: add polling interface")
> >
> > The workaround / fix under OCORES_FLAG_BROKEN_IRQ is particularly for
> > FU540-COOO SoC.
>
> After commit dd7dbf0eb090 this no longer fits.
>
> Andreas.
>
> --
> Andreas Schwab, SUSE Labs, schwab@suse.de
> GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
> "And now for something completely different."

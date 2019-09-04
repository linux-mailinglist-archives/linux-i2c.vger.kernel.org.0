Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AF7CA7C67
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2019 09:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729010AbfIDHOl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Sep 2019 03:14:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:33826 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728870AbfIDHOl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 4 Sep 2019 03:14:41 -0400
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0DF082339D;
        Wed,  4 Sep 2019 07:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567581280;
        bh=UhKM6/sWm4oQ05BpJZZNfaTF3lBq/9uJJ37RvJbgKNA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=wNEFVb2c/g+ykWCBmkZamGkOWzaUvbGvyPmgOPxGMePQEBhaOFq9fY8f+If5gshQE
         9NAGOzlQZWgBKTE2frob0xLpTaSpl7esKEt+oD95+yXa1paVzuvnmJy8uI5zquUWjP
         AIgAOpwJkEX9ZjTrB0Dn2buHg1y0NQTDqnAEG8C0=
Received: by mail-lj1-f179.google.com with SMTP id e17so7549751ljf.13;
        Wed, 04 Sep 2019 00:14:39 -0700 (PDT)
X-Gm-Message-State: APjAAAUqhRmD97+b1I9w0Wj5oOZXWj3OKK+Q9u9ZkyQr09cCtwO4i6f7
        8K+IfPIxXn4W0EmTEyG7GpGpm4X64HfEuwtdemQ=
X-Google-Smtp-Source: APXvYqwxEBbZCCVd3db7t9OIjWZpPH3cyrgsdKPFj5Qw8NbbsvAzzdtj4ChTa6fbl5DfphaeeFB0p+kMXhysueftJZo=
X-Received: by 2002:a2e:8091:: with SMTP id i17mr15253351ljg.13.1567581278186;
 Wed, 04 Sep 2019 00:14:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190813115555.10542-1-bigeasy@linutronix.de> <20190813115555.10542-2-bigeasy@linutronix.de>
 <20190903175449.GF2171@ninjato>
In-Reply-To: <20190903175449.GF2171@ninjato>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 4 Sep 2019 09:14:26 +0200
X-Gmail-Original-Message-ID: <CAJKOXPfnu2aJHWkxSecH6YZZ7t5-8528LsCaQtk5sSH0L+ayYA@mail.gmail.com>
Message-ID: <CAJKOXPfnu2aJHWkxSecH6YZZ7t5-8528LsCaQtk5sSH0L+ayYA@mail.gmail.com>
Subject: Re: [PATCH 1/2] i2c: exynos5: Remove IRQF_ONESHOT
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        linux-i2c@vger.kernel.org, tglx@linutronix.de,
        Benjamin Rouxel <benjamin.rouxel@uva.nl>,
        Kukjin Kim <kgene@kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 3 Sep 2019 at 19:54, Wolfram Sang <wsa@the-dreams.de> wrote:
>
> On Tue, Aug 13, 2019 at 01:55:54PM +0200, Sebastian Andrzej Siewior wrote:
> > The drivers sets IRQF_ONESHOT and passes only a primary handler. The IRQ
> > is masked while the primary is handler is invoked independently of
> > IRQF_ONESHOT.
> > With IRQF_ONESHOT the core code will not force-thread the interrupt and
> > this is probably not intended. I *assume* that the original author copied
> > the IRQ registration from another driver which passed a primary and
> > secondary handler and removed the secondary handler but keeping the
> > ONESHOT flag.
> >
> > Remove IRQF_ONESHOT.
> >
> > Reported-by: Benjamin Rouxel <benjamin.rouxel@uva.nl>
> > Tested-by: Benjamin Rouxel <benjamin.rouxel@uva.nl>
> > Cc: Kukjin Kim <kgene@kernel.org>
> > Cc: Krzysztof Kozlowski <krzk@kernel.org>
> > Cc: linux-samsung-soc@vger.kernel.org
> > Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>
> Krzysztof, are you okay with this change?

I do not have a clue what the original author back in 2013 had in
mind, but change itself looks reasonable. I also gave it a try and it
seems it works fine:

Tested-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

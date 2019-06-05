Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAD103587E
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2019 10:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbfFEIZw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jun 2019 04:25:52 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37477 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726554AbfFEIZw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jun 2019 04:25:52 -0400
Received: by mail-pg1-f196.google.com with SMTP id 20so11996479pgr.4;
        Wed, 05 Jun 2019 01:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rhYnBQKzzjpsWttGzlyRthUCGzSdV8WWDcXlaXIYhD4=;
        b=YOs1cweicWv8OrM2y6u2h2AujaDW8F5RqoCD8CKvAsXfodopZLHrv4Y4CGe2PrPQxI
         fX0Q+tLN0SHAhZd8FGpep73n8znvJbqq9sVzrSNTkw/tqAzE9vovyUv/BQEo4YnjACqG
         Jjo626rBQs5P5TaeY1b9mJXLiFhue4Wv0Icy1/qG31TQkxIqXW4gOeHnLePcYgGEJFY5
         PfcldvgBrBeKUSD+/EJaEN5XqcEbxIDdDnHVNJmccANRIDcs9lxNrIQC2uwFPO9Ne5Ge
         UaqMiPg5GyR8q59yFu7qr9mTR+AaivJpl1ezgLE2FDoi0k14VundKfd1yy47h0KH5PFp
         ynPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rhYnBQKzzjpsWttGzlyRthUCGzSdV8WWDcXlaXIYhD4=;
        b=Su8WWGx6GixfNizLuZgO8IEtAk7uXd0UEiLNJz79M2jY66Sm5VWUkBRNDab6wMOnen
         k+q2rJEVoEzmoZCVX59tjPpYZ+bPNsB3drW/wDrF24kGQv4UEAjRkziusR2h2sn7GzPG
         ADL1ohZbRG8yBD9hV209aYcFBNWQcznB57lXnB+sV0MrXGSESLTTL0QL2peL0bJRLk1y
         AGG7+DeuXaRUGTl5zkBjxI7C2WF8ck4xFkeTjGKWk+SrBEUIZEzmK654BRkYc24NHGf7
         bdZ/9So6VeG6ZHCG4XdROBsvn21KfeSm640ehHi4MCP0kwQAPIeHI9mVw9rIDUreJTFd
         zBDw==
X-Gm-Message-State: APjAAAUE5Seu3JdfOtWsq9e3GrhZuApbXLEQ7aUOvBDJT391nH6zPaar
        wNtwSYrx4n9vblAhMI9VKdKcm8vQaaPpiiGNKTaodsjoOJQ=
X-Google-Smtp-Source: APXvYqypkHzrK2McuPMDdJoFuMEnosiU+wPsyvPVIpv/QwbkVemXD4cNR6zXZnQcyhvaID0UiX3o/IidXwX81t9oYBg=
X-Received: by 2002:a63:fb05:: with SMTP id o5mr2858955pgh.203.1559723151256;
 Wed, 05 Jun 2019 01:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190531043347.4196-1-eduval@amazon.com> <20190531043347.4196-3-eduval@amazon.com>
 <20190604171611.GS9224@smile.fi.intel.com> <20190605032709.GA1534@u40b0340c692b58f6553c.ant.amazon.com>
In-Reply-To: <20190605032709.GA1534@u40b0340c692b58f6553c.ant.amazon.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 5 Jun 2019 11:25:39 +0300
Message-ID: <CAHp75Vdaeprj0hFXukMqDi_dnK9-vA-O-OTRiGY6y3aGrNHUjQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] i2c: slave-mqueue: add a slave backend to receive and
 queue messages
To:     Eduardo Valentin <eduval@amazon.com>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Haiyue Wang <haiyue.wang@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 5, 2019 at 6:30 AM Eduardo Valentin <eduval@amazon.com> wrote:
>
> Hey Andry,
>
> Long time no seeing :-)

True!


> > > +#define MQ_MSGBUF_SIZE             CONFIG_I2C_SLAVE_MQUEUE_MESSAGE_SIZE
> > > +#define MQ_QUEUE_SIZE              CONFIG_I2C_SLAVE_MQUEUE_QUEUE_SIZE
> >
> > > +#define MQ_QUEUE_NEXT(x)   (((x) + 1) & (MQ_QUEUE_SIZE - 1))
> >
> > Also possible ((x + 1) % ..._SIZE)
>
> Right.. but I suppose the original idea is to avoid divisions on the hotpath.
>
> So, I am actually fine with the limitation of only using power of 2.

The original code implies that anyway, so, my proposal doesn't
restrict it any farther.
> > > +   {
> > > +           .compatible = "i2c-slave-mqueue",
> > > +   },
> >
> > > +   { },
> >
> > No need for comma here.
>
> It does not hurt to have it either :-)

It's just a protection against some weird cases of adding entries
behind the terminator.

> > > +           .of_match_table = of_match_ptr(i2c_slave_mqueue_of_match),
> >
> > Wouldn't compiler warn you due to unused data?
> > Perhaps drop of_match_ptr() for good...
>
>
> Not sure what you meant here. I dont see any compiler warning.
> Also, of_match_ptr seams to be well spread in the kernel.

If this will be compiled with CONFIG_OF=n...
Though I didn't check all dependencies to see if it even possible. In
any case of_match_ptr() is redundant in both cases here.
Either you need to protect i2c_slave_mqueue_of_match with #ifdef
CONFIG_OF, or drop the macro use.

P.S. Taking into account the last part, I would wait for v7 with that
fixed followed by fixing other nits.

-- 
With Best Regards,
Andy Shevchenko

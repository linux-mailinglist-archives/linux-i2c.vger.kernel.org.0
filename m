Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D4AC360A8
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2019 17:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728255AbfFEP7G (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jun 2019 11:59:06 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36441 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728250AbfFEP7F (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jun 2019 11:59:05 -0400
Received: by mail-pg1-f195.google.com with SMTP id a3so5231288pgb.3;
        Wed, 05 Jun 2019 08:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LNpmK93zAJJ5Un4fIjDsW9Sm00BMyg+B0/rMr5+eS3I=;
        b=Z8V1Q9wNaBBgS8izidARY2/sgDSHaOj4/Czitv6F4qDQnhnb7sqjBRAaaXnFIP1iEk
         TgQGWcMA0ELuDMVa8ssA3C0yT0Kxv2K9BEAbYX9ao1B8hJ1EQVo8c+4wZLMR7JqjfYi9
         PHdLzxZrBLZTveZHgYpYcl4KJwgOJTCmL8YUFt8sytSx0t1xKYtxw5hrdQYFwauoGvOP
         4vFRjOHeXu7t7pSXRcJsqxJjO92kdB58VlVC0lKCGgH7UNsFVKFCCeVhm2bt6+UFkY3A
         tsGKM5RLX/Zcy3hpW91oMzGFVBhuxLkHmR1yrVew2tSiOi+At6lnfO1LOI6hjgv6F54I
         WhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LNpmK93zAJJ5Un4fIjDsW9Sm00BMyg+B0/rMr5+eS3I=;
        b=eGCN9jXnyhH13t9h7wtgmkrszusR/Vl5vyZe4RBx7vqJ6LxR2MnU/X6A5ej1a3r8V1
         UhAu7dKbKm7Foed+KN8IeuOkVjXuusDjMb0Da2PhSXiP34z6WOQgsHmjebprWhaAjvg2
         bTIFCliXvNzhjpnVypxPjcmlMGslOi83txyzLKJmPzJgFxdZmWRMn4vLQX5eAxeCVeCQ
         /uBvhvWfjRL5hgMUzhp0E/Ge5iv+fHHy0g63vEGYMxox1x7Qd5Yap3JEFOKDq+15T/Kv
         WNEesNqt+9iQm3yD75o012ZBpn/6P56l03Q6mmD60/xASrBNFK4Vx4SZZNqJQT6Qw7sO
         RivQ==
X-Gm-Message-State: APjAAAXqe9n+eK+/3pFLpqeHQ1/RB48xfFLJrK8zteQE5AjsBgxBHgAB
        z0g/NrQ1K4Ik1gI7NuIiZjmbLtusu2Y+cLuL6GM=
X-Google-Smtp-Source: APXvYqzrE24tcSHeSl0Iq6cMLIC9Q7zXjX4LH11vq0zHI8Mi3Q4o/Ftd6HoJo5XDcWPqWql761Gtdt2RKti3EFtuj8c=
X-Received: by 2002:a63:fb05:: with SMTP id o5mr5560744pgh.203.1559750344896;
 Wed, 05 Jun 2019 08:59:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190531043347.4196-1-eduval@amazon.com> <20190531043347.4196-3-eduval@amazon.com>
 <20190604171611.GS9224@smile.fi.intel.com> <20190605032709.GA1534@u40b0340c692b58f6553c.ant.amazon.com>
 <CAHp75Vdaeprj0hFXukMqDi_dnK9-vA-O-OTRiGY6y3aGrNHUjQ@mail.gmail.com>
 <20190605143158.GB1534@u40b0340c692b58f6553c.ant.amazon.com>
 <CAHp75Vc2us0UDmGnzjF0vkzWM_9KqRa0AZKnRsUYmFRTsgwEyg@mail.gmail.com> <20190605153120.GC1534@u40b0340c692b58f6553c.ant.amazon.com>
In-Reply-To: <20190605153120.GC1534@u40b0340c692b58f6553c.ant.amazon.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 5 Jun 2019 18:58:54 +0300
Message-ID: <CAHp75VfPYC7xDfsGRZsSy8eV1xoMANsVmyuU_yF0kPG0fMtLCQ@mail.gmail.com>
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

On Wed, Jun 5, 2019 at 6:31 PM Eduardo Valentin <eduval@amazon.com> wrote:
> On Wed, Jun 05, 2019 at 06:20:37PM +0300, Andy Shevchenko wrote:
> > On Wed, Jun 5, 2019 at 5:32 PM Eduardo Valentin <eduval@amazon.com> wrote:
> > > On Wed, Jun 05, 2019 at 11:25:39AM +0300, Andy Shevchenko wrote:
> > > > On Wed, Jun 5, 2019 at 6:30 AM Eduardo Valentin <eduval@amazon.com> wrote:

> > > > > > > +           .of_match_table = of_match_ptr(i2c_slave_mqueue_of_match),
> > > > > >
> > > > > > Wouldn't compiler warn you due to unused data?
> > > > > > Perhaps drop of_match_ptr() for good...
> > > > >
> > > > > Not sure what you meant here. I dont see any compiler warning.
> > > > > Also, of_match_ptr seams to be well spread in the kernel.
> > > >
> > > > If this will be compiled with CONFIG_OF=n...
> > >
> > > I see.. I obviously did not test with that config..
> > >
> > > > Though I didn't check all dependencies to see if it even possible. In
> > > > any case of_match_ptr() is redundant in both cases here.
> > > > Either you need to protect i2c_slave_mqueue_of_match with #ifdef
> > > > CONFIG_OF, or drop the macro use.
> > >
> > > I will wrap it into CONFIG_OF..
> >
> > Would be this expected to work in the case of CONFIG_OF=n?
> > If no, why to introduce ugly #ifdef:s and additional macros?
>
> I do hate those too...
>
> > Wouldn't be better to have
> >   depends on OF || COMPILE_TEST
>
> Well, technically, the original author had a case for using this
> without CONFIG_OF. That is why I did not force here to be a strong
> dependency on CONFIG_OF. So, I guess in this case the driver will
> work properly in both cases if we:
>
> +#ifdef CONFIG_OF
> +static const struct of_device_id i2c_slave_mqueue_of_match[] = {
> +       {
> +               .compatible = "i2c-slave-mqueue",
> +       },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, i2c_slave_mqueue_of_match);
> +#endif
> +
> +static struct i2c_driver i2c_slave_mqueue_driver = {
> +       .driver = {
> +               .name   = "i2c-slave-mqueue",
> +               .of_match_table = of_match_ptr(i2c_slave_mqueue_of_match),
> +       },
> +       .probe          = i2c_slave_mqueue_probe,
> +       .remove         = i2c_slave_mqueue_remove,
> +       .id_table       = i2c_slave_mqueue_id,
> +};
>
> The above is a well stablish pattern across the drivers.

My point here that you may achieve the same by simple dropping of_match_ptr().

P.S. Many of the drivers just old enough and not being simplified due
to pointless churn there, but for new drivers we may avoid it.

-- 
With Best Regards,
Andy Shevchenko

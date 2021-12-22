Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63ADA47D627
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Dec 2021 18:56:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234956AbhLVR40 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Dec 2021 12:56:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234161AbhLVR40 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Dec 2021 12:56:26 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5061C061574;
        Wed, 22 Dec 2021 09:56:25 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id v15so5273716ljc.0;
        Wed, 22 Dec 2021 09:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8Qi/O7lIyvFx6HdoJVbT/DApgKxTLrXk+chsL3MpNkU=;
        b=DEOCcPYN7PZ2FPgKRMZHcsZQiSdTPq4/xgiMp2cbzow5jL4s7USkkXAqHqs5+qhgXi
         3NFjZ9p/vVLUe8Mfhmt85ggm7ysgINjpbw4wXwyPBC8fY6osk2xd6xzLtanGhWIDI4sP
         2IcU7HvWz2PoNAroVfPrkp8NquIv6HcLcIFrZ45j0wG1jWJo8zg4gWb0VqebT7Rff/6G
         fzfVLf1JC7hDL07YYxK0WaQX+NI8hiWYNhXmfkRESdk/Ur8qK9BXMJxQ5AZtdGdMXcEQ
         6FnLx62xw+oTUAWhZKXPbf3nlCWtoW+2qbRDvHntMcCyApWb3+vw6EUI84ElmXNF0Rbd
         t0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8Qi/O7lIyvFx6HdoJVbT/DApgKxTLrXk+chsL3MpNkU=;
        b=yDAAaa5P1P+1py6yGP/xZE/CTCOiUhCFDqzBBg7LFEL2iRT6Z5JWolmDiOXO5xBmLr
         ZOswaQ2vCVwOQNjaO3+vd6mmGHbVVuwm+Y8hkJTaNc+jd3bo/sUwBMEyGpo34cYOWklc
         wp12jx4XzfMpC89YYKsp4iF5Bl2jnzSQDtMNcRlS+vrMuKfNH2UXhGLR94pt00x1583/
         QV3A4PNbIFZ7LJJmAh0/0BTjMpU5RZD69LKzbdIxjmbb/YtZYo4WDcE0Mai9b3x0ggAP
         6cVL2Cchz5PuSOvpnbLrlVBrcTvGIFEWeEJMlBVPlQJiu1815j+A8mHdSKkvKBtOwhwr
         iGXQ==
X-Gm-Message-State: AOAM5327kd3iew97qQvndimA1Uc0uhTTdgkV9XpnFJQYS5kAiZneRDpQ
        5RWKKr/fSJ/qTOrtrRZpqME=
X-Google-Smtp-Source: ABdhPJz6M6i+H43r9ZMhVG80++2xYfDG3a7PHVDiFwBl1IQH6jVMeO47yuMn+oGjh06TlTSwnJuRoQ==
X-Received: by 2002:a05:651c:1548:: with SMTP id y8mr2781458ljp.458.1640195784086;
        Wed, 22 Dec 2021 09:56:24 -0800 (PST)
Received: from mobilestation ([95.79.218.126])
        by smtp.gmail.com with ESMTPSA id e13sm275141lfs.306.2021.12.22.09.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 09:56:23 -0800 (PST)
Date:   Wed, 22 Dec 2021 20:56:21 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jan Dabros <jsd@semihalf.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, jarkko.nikula@linux.intel.com,
        mika.westerberg@linux.intel.com, wsa@kernel.org,
        rrangel@chromium.org, mw@semihalf.com, jaz@semihalf.com,
        upstream@semihalf.com
Subject: Re: [RFC 0/2] i2c-designware: Add support for AMD PSP semaphore
Message-ID: <20211222175621.7gikyvqu7xvc2qxb@mobilestation>
References: <20211222094558.2098791-1-jsd@semihalf.com>
 <YcMP/9ATna3/yckC@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YcMP/9ATna3/yckC@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy, Jan

On Wed, Dec 22, 2021 at 01:46:07PM +0200, Andy Shevchenko wrote:
> +Serge
> 
> On Wed, Dec 22, 2021 at 10:45:56AM +0100, Jan Dabros wrote:
> > This patchset comprises support for new i2c-designware controller setup on some
> > AMD Cezanne SoCs, where x86 is sharing i2c bus with PSP. PSP uses the same
> > controller and acts as an i2c arbitrator there (x86 is leasing bus from it).
> > 
> > First commit aims to improve generic i2c-designware code by adding extra locking
> > on probe() and disable() paths. I would like to ask someone with access to
> > boards which use Intel BayTrail(CONFIG_I2C_DESIGNWARE_BAYTRAIL) to verify
> > behavior of my changes on such setup.
> > 
> > Second commit adds support for new PSP semaphore arbitration mechanism.
> > Implementation is similar to the one from i2c-designware-baytrail.c however
> > there are two main differences:
> > 1) Add new ACPI ID in order to protect against silent binding of the old driver
> > to the setup with PSP semaphore. Extra flag ARBITRATION_SEMAPHORE added to this
> > new _HID allows to recognize setup with PSP.
> > 2) Beside acquire_lock() and release_lock() methods we are also applying quirks
> > to the lock_bus() and unlock_bus() global adapter methods. With this in place
> > all i2c clients drivers may lock i2c bus for a desired number of i2c
> > transactions (e.g. write-wait-read) without being aware of that such bus is
> > shared with another entity.
> > 
> > Mark this patchset as RFC, since waiting for new ACPI ID value. As a temporary
> > measure use "AMDI9999". Once proper one will be ready, will re-send this CL for
> > review & merge.
> > 
> > Looking forward to some feedback.
> 
> If I am not mistaken something similar happened in Baikal T1.
> Perhaps Serge has something to share.

No, Baikal-T1 doesn't have such specific interface sharing since it
doesn't have any co-processor (though a scenario of booting different
kernels on each CPU core was at consideration by some our customers).
So the only peculiar things the SoC has got are two interfaces with
non-standard access:
1) DW SPI controller with memory mapped 16MB direct EEPROM access. DW
SPI CSR/EEPROM mapping are switched by a multiplexer (basically just a
flag) embedded into the system controller.
2) DW i2c controller with indirect registers access. Originally it was
supposed to be used by the system bootloader for some bootloading
stuff, but the actual usage scenario wasn't described by the SoC
engineers. The chip initially loads the code from the SPI-flash only,
which can be of up to 16MB size. It's more than enough to start pretty
complex systems, so an additional i2c interface turned to be not
really needed. Anyway other than having an indirectly accessible
CSRs it's pretty much normal DW I2C controller.

But you are right in a reference to another BE-chip - Baikal-M1. The
i2c/spi/gpio/uart interfaces sharing support might get to be needed
for it since aside with four 2-cored Cortex-A57 clusters it has got an
embedded SCP co-processor which can access the same SoC interfaces as
the CPU cores. Though Baikal-M1 isn't supported by the mainline kernel
at the moment. We are going to start working on it on the next year.
Then we'll most likely need to implement the interface sharing feature
like the one introduced in this RFC. But for now alas I can't be much
helpful.

-Sergey

> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

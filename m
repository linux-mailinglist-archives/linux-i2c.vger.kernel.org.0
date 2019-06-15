Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A16947285
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Jun 2019 01:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726434AbfFOXYM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 15 Jun 2019 19:24:12 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40019 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726214AbfFOXYL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 15 Jun 2019 19:24:11 -0400
Received: by mail-lf1-f65.google.com with SMTP id a9so4053223lff.7;
        Sat, 15 Jun 2019 16:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=x7rExcH1kU2EpvYeuDS7M66fY+J816ZSVv9MUtqFHHo=;
        b=Bqqte53b9wG82aO7hOFbzApIPnUca+l6KDXRPlriiNsM9qVbBCwlHEPbsfaJAi6X2V
         5S9w8LbRbEvJnjw6tXFe0Nf734hY03Qux3khfuhXuxlqYt8lGhbhuDMhlOWL00vzZWwh
         nchDZiL54I4CtbOPJCFAsLmUseE30x9Nc/0VAWPbmTZD9TXthaGBuOLPnvueaDjhHXMi
         4CCRGYBVPTJpb3erjPCmrP/QDszNTo5RSeR48utJogs6/7ZhOL79pYaKGs6b2YPz6YB2
         GYvEZlrafuXbD2OiV51bU5Hp8lUSfCCTy+ETpddkxTs6eEhh0klOZlqjghWEVpcZUUKv
         QWbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=x7rExcH1kU2EpvYeuDS7M66fY+J816ZSVv9MUtqFHHo=;
        b=gBdfQ5u2volRH2oiugSumA/w708oXeJw8FJ/BMNoS/TGTQ+UaHcvV5uQ3diIevqd8G
         T5yFZcHBV+9p6CMzUnprRn+xtOkaIv3taMI0oxqxwtyLS6i39j0Sb1Dj/K8v6n9j6x6s
         ee9yCGFEU6LUWNJnYHoGBNwbxw8Y9YsWfvkRjYcGJ0tBLGoqYIBtibGoaPMSWXGgJVX2
         rvC6la0Dscg5px/vifdjZzSNl5DpIyLfXzF8iXnCP3BPowGN+Fa8A1CI3RPzBgciLmZJ
         MmR6tnLxjJuYxvlSvqsdb3VxrYWpXKqP6S7/zSjCPdfjfWRPp3AUCri4YgRZxk5fNSOI
         APLg==
X-Gm-Message-State: APjAAAWa8Onx6K7md9F0HiiDUelszj2oYNbfuZKjMHI4EEc4vAol010s
        HCoZHeCejFSXq2LZSa6dB0msIqo3c04=
X-Google-Smtp-Source: APXvYqyPW6XKnudCPRO7/Lrh73fTLhfjLycoQAJmLj6OIG5tPuGxeoBEHDURBHVNE77zyo5ftRI7Xw==
X-Received: by 2002:a19:8cc:: with SMTP id 195mr16412515lfi.150.1560641049574;
        Sat, 15 Jun 2019 16:24:09 -0700 (PDT)
Received: from mobilestation ([5.164.217.122])
        by smtp.gmail.com with ESMTPSA id r84sm1425813lja.54.2019.06.15.16.24.08
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 15 Jun 2019 16:24:09 -0700 (PDT)
Date:   Sun, 16 Jun 2019 02:24:07 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        Peter Rosin <peda@axentia.se>,
        Serge Semin <Sergey.Semin@t-platforms.ru>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: mux-gpio: Use "mux" con_id to find channel GPIOs
Message-ID: <20190615232406.ni3ausfjaz5qowib@mobilestation>
References: <20190614214748.2389-1-fancer.lancer@gmail.com>
 <CAHp75VcwP8DzhqfOn=cbcRQtd8WrnuoFPT6GCU754drTZePheg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VcwP8DzhqfOn=cbcRQtd8WrnuoFPT6GCU754drTZePheg@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Jun 15, 2019 at 02:43:09PM +0300, Andy Shevchenko wrote:
> On Sat, Jun 15, 2019 at 12:51 AM Serge Semin <fancer.lancer@gmail.com> wrote:
> >
> > Recent patch - ("i2c: mux/i801: Switch to use descriptor passing")
> > altered the i2c-mux-gpio driver to use the GPIO-descriptor
> > based interface to find and request the GPIOs then being utilized
> > to select and deselect the channels of GPIO-driven i2c-muxes. Even
> > though the proposed modification was correct for the platform_data-based
> > systems, it was invalid for the OF-based ones and caused the kernel
> > to crash at the driver probe procedure. There were two problems with
> > that modification. First of all the gpiod_count() and gpiod_get_index()
> > were called with NULL con_id.
> 
> I always thought that this means "count me all GPIO's for this device
> despite their names" and "get me GPIO by index despite it's name".
> What's went wrong?
> 

No. It's wrong as far as I can see for kernels 4.4, 4.9 and the modern
5.2.0-rcX. dt_gpio_count()/of_find_gpio()will always try to count/request
either "<con_id>-gpio(s)" or "gpio(s)" GPIOs in the device of-node. While
platform_gpio_count()/gpiod_find() will take into account GPIOs with matching
<con_id>'s even if it is NULL.

Regards,
-Sergey

> 
> > Due to this the methods couldn't find
> > the "mux-gpios" OF-properties and returned the -ENOENT error. Secondly
> > the return value of gpiod_count() wasn't checked for being negative,
> > which in case of an error caused the driver to crash. This patch
> > is intended to fix the described problems.
> 
> -- 
> With Best Regards,
> Andy Shevchenko

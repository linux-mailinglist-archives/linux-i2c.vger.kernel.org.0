Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A50710C83C
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Nov 2019 12:54:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726383AbfK1Lyq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Nov 2019 06:54:46 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:38646 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726191AbfK1Lyq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Nov 2019 06:54:46 -0500
Received: by mail-ed1-f66.google.com with SMTP id s10so22514963edi.5;
        Thu, 28 Nov 2019 03:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fJ1qEAjftKv4KFT+qYxhcQRrloDrH252fRzp4v2mOIA=;
        b=HWQcb5fISvzc7dzW/LwSkYoYP72pXvepeXpeq0QChIvEEvJQZMv/9tsCBDDRZIS35Q
         zL3ZMkuWSYUO/EyFXpermAZ9RZWZSkvu0pQto62bpXxuU6PIyE00l3ozUeZ7nIw7zgAB
         g1Ro4CfkyjLTjaRQflNljm5GdxYLQMtvxlIt9yMX98x0ScmyqVc7n1lMfeaoWRLL1DJS
         IhLbu5FosIRb1jQ7RwtCZMAqqJV4tR6TCGaIKnafsf8EmkQYedojHJxSp2XzaaBBgNLs
         YCfHQ5o36094vUyplRqwjbwGQ/JHETvxtHkY5r4y+p084JRDCDIYJSQ0od55wJjU6nuv
         Vafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fJ1qEAjftKv4KFT+qYxhcQRrloDrH252fRzp4v2mOIA=;
        b=mOM8v95NmHoi9doUgX8vK0Fe77y7EbawzY4W5234PLp6W6bpZSGl/JSYISTI698+LL
         gV+azUgqGQenl0TaIbLLOOt2V8JUHw/pVkIUSEBhk0PZ0OUF8l1/yxC7ilC45W5v8Oiy
         tUcDnUUrFGeYSV9MZcrACgvTDX81hfXhS0qdZWtYOVrCXnFEs/2IS789b9zdvGpT5qdp
         u/Rj11LXzgYGmbCnOn6gB4Lhky2Wp4LYkQvOrM+b/L0drac2/TvfOM5s2kfgxtD9FaZU
         fgqNETZCG7WSxFBE6EQfQ1p/oMo7M94MzrRhdU0ISQRCcpP+/u44muPvUsIUXBp4J+WP
         FVnQ==
X-Gm-Message-State: APjAAAXHNH+PV8zIQna/eFbkXwuKGBc/ikrO4dkLa8QKkYzBCTdoGagM
        mU6yuFjNtG6+hNLrEokToOX9tpyaZrLxAs3Ec3s=
X-Google-Smtp-Source: APXvYqyLp6/hXTjbnJ1ipBT5cREkaCmbhUdK6K4O2YMDxHaFUlhpK/aPWwzMePKrShDjywJgigpgYguLM50HKPA9rLM=
X-Received: by 2002:a05:6402:3cf:: with SMTP id t15mr37391787edw.21.1574942084243;
 Thu, 28 Nov 2019 03:54:44 -0800 (PST)
MIME-Version: 1.0
References: <20190131213957.11568-1-alex.williams@ettus.com>
 <CAKfKVtFM1zPb-MjBwY8WREy4xoHW60JrjZ-LnSzBvJ1Yv_zgsw@mail.gmail.com> <CAJZzcDiv8BGDa8pj-2gP+BWiu=CfrsDi15xHr=UUFwCwE-E4zg@mail.gmail.com>
In-Reply-To: <CAJZzcDiv8BGDa8pj-2gP+BWiu=CfrsDi15xHr=UUFwCwE-E4zg@mail.gmail.com>
From:   Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date:   Thu, 28 Nov 2019 17:24:32 +0530
Message-ID: <CAKfKVtE8zaQhcYCOSjO26u9MjTJhLDO_R_L2Nca7_EbzBz8DEg@mail.gmail.com>
Subject: Re: [PATCH] i2c: cadence: Handle transfer_size rollover
To:     Alex Williams <alex.williams@ettus.com>
Cc:     mical.simek@xilinx.com,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Alex Williams <alex.williams@ni.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi ,
Apologies for teh late reply,
Somehow replied only to Alex.
On Fri, Feb 15, 2019 at 8:59 PM Alex Williams <alex.williams@ettus.com> wrote:
>
> On Fri, Feb 15, 2019 at 2:53 AM Shubhrajyoti Datta
> <shubhrajyoti.datta@gmail.com> wrote:
> >
> > HI Alex,
> >
> > Thanks for the patch.
> >
> > On Fri, Feb 1, 2019 at 4:22 AM <alex.williams@ettus.com> wrote:
> > >
> > > From: Alex Williams <alex.williams@ni.com>
> > >
> > > Under certain conditions, Cadence's I2C controller's transfer_size
> >
> > Any help in reproducing the conditions would be appreciated
> >
> >
> > > register will roll over and generate invalid read transactions. Before
> > > this change, the ISR relied solely on the RXDV bit to determine when to
> > > write more data to the user's buffer. The invalid read data would cause
> > > overruns, smashing stacks and worse.
> > >
> > > This change stops the buffer writes to the requested boundary and
> > > reports the error. The controller will be reset so normal transactions
> > > may resume.
> > >
> > > Signed-off-by: Alex Williams <alex.williams@ni.com>
>
>
> One possible related errata is here:
> https://www.xilinx.com/support/answers/61664.html
>
> In our case, we only needed to hammer on i2c to reproduce in a few
> minutes, with a script like this:
> while true
>     do date
>     cat /sys/class/gpio/gpio882/direction > /dev/null
>     cat /sys/class/gpio/gpio883/direction > /dev/null
>     cat /sys/class/gpio/gpio884/direction > /dev/null
>     cat /sys/class/gpio/gpio885/direction > /dev/null
>     cat /sys/class/gpio/gpio886/direction > /dev/null
>     cat /sys/class/gpio/gpio887/direction > /dev/null
>     cat /sys/class/gpio/gpio888/direction > /dev/null
>     cat /sys/class/gpio/gpio889/direction > /dev/null
>     cat /sys/class/gpio/gpio890/direction > /dev/null
>     cat /sys/class/gpio/gpio891/direction > /dev/null
>     cat /sys/class/gpio/gpio892/direction > /dev/null
>
>     cat /sys/class/gpio/gpio894/direction > /dev/null
>     cat /sys/class/gpio/gpio895/direction > /dev/null
>     cat /sys/class/gpio/gpio896/direction > /dev/null
>     cat /sys/class/gpio/gpio897/direction > /dev/null
>     cat /sys/class/gpio/gpio898/direction > /dev/null
>     cat /sys/class/gpio/gpio899/direction > /dev/null
>     cat /sys/class/gpio/gpio900/direction > /dev/null
>     cat /sys/class/gpio/gpio901/direction > /dev/null
>     cat /sys/class/gpio/gpio902/direction > /dev/null
>     cat /sys/class/gpio/gpio903/direction > /dev/null
>     cat /sys/class/gpio/gpio904/direction > /dev/null
>     cat /sys/class/gpio/gpio905/direction > /dev/null
> done
>
> In normal usage, we have code that sets up a number of i2c GPIO
> expanders and pokes them for values as it initializes devices.
> Occasionally, the transfer size register will roll over, and the ISR
> will cause memory corruption, since it doesn't stop writing at the
> requested boundary.
Reviewed-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

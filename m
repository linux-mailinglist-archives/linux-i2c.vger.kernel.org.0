Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13281190C56
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Mar 2020 12:22:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727124AbgCXLWX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Mar 2020 07:22:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:40344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727112AbgCXLWW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 24 Mar 2020 07:22:22 -0400
Received: from coco.lan (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D49CD20786;
        Tue, 24 Mar 2020 11:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585048942;
        bh=zolzcGtPeDYPZk5P04kOJvaUSx/2q5m4bl4JacJYigI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=lUi+8vQDDJQWqsrwcS1qK2QPK5YAwa2FNYsUJQ15rDckI+j59Hfm7ntCHSzDniOOz
         v99eih3V3f9a/aUzF1Ju7tcrwVmXLefcGNpw6j/bxLTr5f9bdkmcDugCcPcpgcYQIc
         JyNWamGXI6XdoBENHWs/d9bX7+5Lh/O9lyCbm4Lw=
Date:   Tue, 24 Mar 2020 12:22:17 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, sean@mess.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: A bit confused on i2c communication between modules
Message-ID: <20200324122217.4ff330b1@coco.lan>
In-Reply-To: <7d82a76f-5165-5e7c-bcde-552f527da0d2@ideasonboard.com>
References: <55204992-9060-6008-31c7-c2855f712e70@gmail.com>
        <20200324082236.2c4d2ae4@coco.lan>
        <bc91be3d-802c-a58c-bd27-740e15516180@ideasonboard.com>
        <20200324095810.GC1134@ninjato>
        <63742e62-d0b6-9d7a-b491-d7969f8ea7e2@ideasonboard.com>
        <20200324102704.GD1134@ninjato>
        <7d82a76f-5165-5e7c-bcde-552f527da0d2@ideasonboard.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Em Tue, 24 Mar 2020 10:49:55 +0000
Kieran Bingham <kieran.bingham@ideasonboard.com> escreveu:

> +cc: linux-i2c@vger.kernel.org
> Moving /this/ to the linux-i2c list ;-)

+cc: linux-media@vger.kernel.org

The discussion of having a virtual i2C bus can be interesting at
linux-media as well, as other virtual drivers could eventually need
it.

Just placing some context here, we're developing a DVB virtual driver,
in order to allow testing Digital TV applications without requiring
a real hardware.

The DVB driver model is that there's a main driver ("bridge" driver)
with creates a digital TV adapter and (at least) two other drivers,
responsible for tuning into a channel and decoding the digital TV
protocols. The output of a DVB driver is a MPEG-TS stream.

A typical TV board looks like this:

	https://linuxtv.org/downloads/v4l-dvb-apis-new/_images/typical_media_device.svg

Those drivers are:

- a tuner driver, usually at address 0x61 (7-bit notation)
- a demodulator driver, usually at address 0x0e (although there are
  other addresses also used by different drivers).

As shown at the picture, the vast majority of devices use I2C. There are
even some chips with have an internal I2C like bus with some internal 
devices, like cx231xx.

As one of the goals of a virtual driver is to serve as a basis for new
developments, we'd like to keep the virtual DVB drivers as close as
possible of real drivers.

> 
> Thanks Wolfram,
> 
> On 24/03/2020 10:27, Wolfram Sang wrote:
> >   
> >> Maybe we should have a whole virtual I2C bus for virtual devices :-)
> >>
> >> (Hrm, that started out as a joke, and now I'm not sure if it's a real
> >> option or not...)  
> > 
> > Just one final thought: I think this is actually the best option. Zero
> > chance of address collisions (which could happen if you have a not
> > perfectly-described real HW bus). No RPM mangling of real and virtual
> > devices. A clear seperation what is real and what is virtual. Plus, you
> > can implement it right away, no need to wait for the dynamic address
> > assignment.  

We don't need dynamic address assignment here. At least for now,
all digital TV drivers we have use fixed I2C assignments.

> Agreed - even better all round! But I presume we don't yet have a
> 'virtual' i2c bus? So it's a patch-set to do first? Or is it already
> feasible?
> 
> I see references to 'i2c-virtual.c' and 'i2c-virt.c', but I can't find
> those files or any config options themselves...

FYI, there are some drivers that have the demodulated device for some
TV standards integrated with the bridge one. that's the case, for
example, of rtl28xx. It may either use its internal demodulator or
an external one (via I2C). Right now, the driver handles its 
internal demodulator using I2C support (as this makes easier for it
to also support external demods, by just changing the I2C address).

So, right now we actually mix "virtual" and "real hardware" support,
at least on some drivers.

So, I'm not so sure if we need any new feature at I2C side.

Thanks,
Mauro

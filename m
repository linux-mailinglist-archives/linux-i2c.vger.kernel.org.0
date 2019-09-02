Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFA90A59F2
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2019 16:57:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbfIBO5Q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Sep 2019 10:57:16 -0400
Received: from mail-ed1-f49.google.com ([209.85.208.49]:44680 "EHLO
        mail-ed1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbfIBO5Q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Sep 2019 10:57:16 -0400
Received: by mail-ed1-f49.google.com with SMTP id a21so15862794edt.11
        for <linux-i2c@vger.kernel.org>; Mon, 02 Sep 2019 07:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lCauSwHPMQ5a7SJ/NBU/3of6I87sJU5ybxll8bYLroE=;
        b=lS5s9B7Qs7SStefaTcAccHuRvv0bUGzrCRs/S8MpSR3/QRvAqCRX6YKQ07XIsRxIRx
         tvapI4DZq0QEOihYAuA69t7Xs2OPuEv3TMhlCQalyelxIHJKVtzIh5hHvHM7x47VG0D6
         8phXANtuHiVSNAZvK3BDCJpRgF7m98liQbFb+7KX84YPoT8oEQssPygnSmI5XYfbiaKD
         CzX56LbCisEJURjRW9zb5q6WUnaS037b1GhETRjvCKoli5a6FtO7cei+per1SWbWNuHI
         uPja0KkcZUB3deYikxHX5FvoQLcLZkprp4VrlNAjLThV22WJtpWQMP0Hpl/KLmjNTl8S
         n4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lCauSwHPMQ5a7SJ/NBU/3of6I87sJU5ybxll8bYLroE=;
        b=SVhV+NFjCrw7zK0BUheVc/5sYRZl5fffvBHS0vkk359TofWTCWN4WfUMRWI33h6IKb
         wKbNnYx/R46F/BVjzAzkU+CWzD5G+vNVw421SYs0SWl56xtL+oyWqUWtoRE+UsNBzT2/
         yntprrQVhmogEUVGElhbi6rPcEOAjsWykMFinYU2ROf4s4ARZtfTRaNp2UOkNpoxGQMK
         2KaWiS0X+IFtpF6nu4ZUCsqz+bzbEXlgXM5qO1Gdp3ia32ED0NfM5UvzhGhgYXaJ5Lby
         qCvoO5YQU40aeiuezwKoJkuxYPEAxMUE5OR3Ueb+YLpXlWgCbza72664Wybss2DU91qJ
         KJuA==
X-Gm-Message-State: APjAAAVwFYfvMWPMjydUf2UishDvfiQU/DD3TksKkHzE9/ZvLmlc3nXs
        O93P64vPDRvqOUHr6xzNTIUhIbgWBWazWaXvWVgEgT54UzU=
X-Google-Smtp-Source: APXvYqyEMkgJV2wrE0e1K7ZPVMJMv/NXtHoWE7Sq+CMvDWR0Gyc6pUEDBfYZQTIo0EaF5T7WAc+mbMIfH2J1Th+/Zps=
X-Received: by 2002:a17:906:3604:: with SMTP id q4mr25014153ejb.102.1567436234681;
 Mon, 02 Sep 2019 07:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAFoRp-PH=Bjs+vSmCvA9i0X3Jw7M6zuUCew7y=A7gxNUSrRZ7g@mail.gmail.com>
 <20190902112902.6b1abf42@endymion>
In-Reply-To: <20190902112902.6b1abf42@endymion>
From:   Hans L <thehans@gmail.com>
Date:   Mon, 2 Sep 2019 09:56:38 -0500
Message-ID: <CAFoRp-MbjNJYmGQ=Sa5htJQFT5n_hEK-_d+nHv7jmF+W=rOkeg@mail.gmail.com>
Subject: Re: Problems with decode-dimms
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Sep 2, 2019 at 4:28 AM Jean Delvare <jdelvare@suse.de> wrote:
> If you have DDR4 memory then do NOT modprobe eeprom. The legacy eeprom
> driver will stupidly bind to ALL devices in I2C address range
> 0x50-0x57, preventing the right driver (ee1004) from claiming these
> addresses later.

OK, I was confused at first because without eeprom I got no data at all.

> Most likely your problems are caused by the eeprom driver. Unload it,
> then manually bind the I2C addresses to the ee1004 driver (see
> Documentation/i2c/instantiating-devices, Method 4), and I think the
> warnings will be gone. I still want to improve the script to properly
> report the problem.

I didn't realize I needed to bind them manually.
I couldn't find this Documentation on my Linux Mint install, but read
it from here https://www.kernel.org/doc/Documentation/i2c/instantiating-devices

So I ended up running:
$ sudo su
# echo ee1004 0x50 > /sys/bus/i2c/devices/i2c-1/new_device
# echo ee1004 0x51 > /sys/bus/i2c/devices/i2c-1/new_device
# echo ee1004 0x52 > /sys/bus/i2c/devices/i2c-1/new_device
# echo ee1004 0x53 > /sys/bus/i2c/devices/i2c-1/new_device
[Ctrl-D]

For some reason which I still don't understand, I couldn't just run
each command directly with sudo:
$ sudo echo eeprom 0x50 > /sys/bus/i2c/devices/i2c-1/new_device
bash: /sys/bus/i2c/devices/i2c-1/new_device: Permission denied

With those properly setup, I was able to run decode-dimms and it
showed that my 2 kits of (2x8GB) are composed of different memory
types, (Samsing and Micron) despite being the same kit model #'s.
Really frustrating.

Anyways, I guess that's the main information I was after, so mystery solved!

-Hans

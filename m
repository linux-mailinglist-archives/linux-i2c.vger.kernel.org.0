Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9E18313A32
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Feb 2021 17:57:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233576AbhBHQzx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Feb 2021 11:55:53 -0500
Received: from mail-oi1-f173.google.com ([209.85.167.173]:33330 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234489AbhBHQz0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Feb 2021 11:55:26 -0500
Received: by mail-oi1-f173.google.com with SMTP id g84so2492855oib.0;
        Mon, 08 Feb 2021 08:55:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KKJBvlRsPdZRwkChztnkpUkvrus3GI2EDM+AmFK5Q8g=;
        b=lTOwI0jzdTpwxiyzIE8CWqHiPNILjcCUfNfaQS373u5NEiRxKc1UEc5V8NEGXHSitk
         niym/B5jecvRmB1IWFUq60oiXxAX90mt+OLYSVMmBRa6MvquDMSzMkCA0gVOjWNv5daJ
         ott0bD7s2bm3EkbPsmEx1EQdiugzEufmTP2DT3A0O4waw/CFG9pPXZ6uuYGs3v9k4vnT
         b1Nb2ZH7VG1Z/kBHaW5cip2G4P4GKgQj4IvVU71Tg2ZO2twCsib9x9Xba/OutDNRMf6P
         uGlCWcjb3X1+SRyI9sE9llPdGCeol9n/F6Q7dc8PoGqgLIb1PzB3Vn/Mn9ojmi/cdAcw
         AFYQ==
X-Gm-Message-State: AOAM531ANnE4ivBibVW5s+NjNW+yw+rak/N67F4dMWoCiRgWz1nbtu+4
        Y+3V/Vvwx5I5o0hqbRXxJ5UoImPNwZrKIvJHCbI=
X-Google-Smtp-Source: ABdhPJxqCWip3hrwxWqdYRtjj3wm7CbBzXkF42iWQtbas6twpBkCVBV++r2PQNyBllxuR7Ca6mtFQpRojgv2Oxyr7sw=
X-Received: by 2002:aca:d14:: with SMTP id 20mr12305483oin.157.1612803284493;
 Mon, 08 Feb 2021 08:54:44 -0800 (PST)
MIME-Version: 1.0
References: <20210205132505.20173-1-sakari.ailus@linux.intel.com>
 <20210205132505.20173-8-sakari.ailus@linux.intel.com> <CAMpxmJU7J9JBSwCN+GLDpuOL=iZ1PH=oZZuGiAyovuf2TQ=o9A@mail.gmail.com>
In-Reply-To: <CAMpxmJU7J9JBSwCN+GLDpuOL=iZ1PH=oZZuGiAyovuf2TQ=o9A@mail.gmail.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Mon, 8 Feb 2021 17:54:33 +0100
Message-ID: <CAJZ5v0jUqtYDpBn-ezsftCrY=9iD3sAKhyyFf_+CMkthLnsZow@mail.gmail.com>
Subject: Re: [PATCH v10 7/7] at24: Support probing while off
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Feb 8, 2021 at 5:44 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> On Fri, Feb 5, 2021 at 2:25 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > In certain use cases (where the chip is part of a camera module, and the
> > camera module is wired together with a camera privacy LED), powering on
> > the device during probe is undesirable. Add support for the at24 to
> > execute probe while being powered off. For this to happen, a hint in form
> > of a device property is required from the firmware.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> > ---
>
> I'll ack this but I still claim that the name
> acpi_dev_state_low_power() is super misleading for this use-case and
> I've been saying that for 10 versions now with everyone just ignoring
> my remarks. :/

Well, the function in question simply checks if the current ACPI power
state of the device is different from "full power", so its name
appears to be quite adequate to me.

If the way in which it is used is confusing, though, I guess
explaining what's going on would be welcome.

> Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

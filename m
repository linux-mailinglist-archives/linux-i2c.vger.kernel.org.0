Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2479331532C
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Feb 2021 16:51:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232428AbhBIPuj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Feb 2021 10:50:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232067AbhBIPua (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Feb 2021 10:50:30 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7511DC061756
        for <linux-i2c@vger.kernel.org>; Tue,  9 Feb 2021 07:49:49 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id t5so24327423eds.12
        for <linux-i2c@vger.kernel.org>; Tue, 09 Feb 2021 07:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VecoGZ4GzWVFIM0otW3JLzPjrBseKAGL1qDTMuL9rhQ=;
        b=CIlh381kw95e85vYr57RlSuDC8kY8uEDiHm3Z8pePwVEf5EWMktOAJ8fGRfI8LyX79
         kO9nexVJp1Drhi5KDy+WElL2nlFVJNS4sVk60qwTKrQjxfmYIaG63VGkNeCsomyiLBGB
         ympVvtXZztYSxkyGsegiNStxZyW3MiGeRjmRTq8b6fYNiohin0XYQA0pMZPKtkC6ecEl
         pQqqwB4hWjBMRzfrJKQiuAT+/W9aP9UU3cFW4cBq8WMuMntzUHQ3LOqpc3+qdriViebo
         S+js95KFw5dV3JIc7xY0dJlwoY/0500CIrFUNNQhH2I2/yOgoOLP3mp7ZpaTltK07skQ
         cynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VecoGZ4GzWVFIM0otW3JLzPjrBseKAGL1qDTMuL9rhQ=;
        b=oZjTdLdZcjlG53c+f11NIBH4xAA5Lx/nPbgfgmz5e7VdpBlGpzVPP9ZWCvkX5plyeG
         xjDHD0dzGJATiYwtzVXR+ntfsga9K6JL52mLmP+3GtYT5SOzX5SsGDq1FaSNYaf9r9ju
         AhS40fuDWFsZcYpmEORNptgzLZpsLFJs9NMpSJRMazVO2SSIwClkR0rgGD1aTqT3DzXm
         fyvPoGmYoXuJJoLWBZYXD20kXgiKBYY3xtciOfQDQkEMSnfMpLvOSPzPIacrALnxdkTe
         12lp+k5IE/CkNo1r1eIfTjFIVdNKJLasli1mZKLr3Ieau5EmARqlM4GrU3v8+e1ts3yU
         z4ww==
X-Gm-Message-State: AOAM532uHWyMpFv0jKGFJLid4SEf2iGhc1azax20VBCMB9gih/Eg7TM6
        fT188K/SqlJMhpWhku1By+tAYEBVEzfuPe+bMsxq2w==
X-Google-Smtp-Source: ABdhPJxY4AjMbkZIQt1FqfH6XSv98lRusycD/W81ImCx2ZhTZq/tiEGg+xyJm+Pfkabf+n79kGMITiS2GYWaVpasTic=
X-Received: by 2002:aa7:c98e:: with SMTP id c14mr20178301edt.213.1612885788168;
 Tue, 09 Feb 2021 07:49:48 -0800 (PST)
MIME-Version: 1.0
References: <20210205132505.20173-1-sakari.ailus@linux.intel.com>
 <20210205132505.20173-8-sakari.ailus@linux.intel.com> <CAMpxmJU7J9JBSwCN+GLDpuOL=iZ1PH=oZZuGiAyovuf2TQ=o9A@mail.gmail.com>
 <CAJZ5v0jUqtYDpBn-ezsftCrY=9iD3sAKhyyFf_+CMkthLnsZow@mail.gmail.com>
In-Reply-To: <CAJZ5v0jUqtYDpBn-ezsftCrY=9iD3sAKhyyFf_+CMkthLnsZow@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 9 Feb 2021 16:49:37 +0100
Message-ID: <CAMpxmJW61Bd1SR3-i6=OV6RgafiEdfp4sNN0M6EYa7NSeOTFKg@mail.gmail.com>
Subject: Re: [PATCH v10 7/7] at24: Support probing while off
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
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

On Mon, Feb 8, 2021 at 5:54 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Mon, Feb 8, 2021 at 5:44 PM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> >
> > On Fri, Feb 5, 2021 at 2:25 PM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > In certain use cases (where the chip is part of a camera module, and the
> > > camera module is wired together with a camera privacy LED), powering on
> > > the device during probe is undesirable. Add support for the at24 to
> > > execute probe while being powered off. For this to happen, a hint in form
> > > of a device property is required from the firmware.
> > >
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> > > ---
> >
> > I'll ack this but I still claim that the name
> > acpi_dev_state_low_power() is super misleading for this use-case and
> > I've been saying that for 10 versions now with everyone just ignoring
> > my remarks. :/
>
> Well, the function in question simply checks if the current ACPI power
> state of the device is different from "full power", so its name
> appears to be quite adequate to me.
>
> If the way in which it is used is confusing, though, I guess
> explaining what's going on would be welcome.
>

Yes, I have explained it multiple time already - last time at v9 of this series:

    https://www.spinics.net/lists/kernel/msg3816807.html

Bartosz

> > Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

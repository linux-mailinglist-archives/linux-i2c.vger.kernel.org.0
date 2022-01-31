Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CF314A478D
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Jan 2022 13:52:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358336AbiAaMv7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Jan 2022 07:51:59 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:54063 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240585AbiAaMv7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Jan 2022 07:51:59 -0500
Received: from mail-ot1-f45.google.com ([209.85.210.45]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MaInF-1miIQ41USz-00WIBv; Mon, 31 Jan 2022 13:51:57 +0100
Received: by mail-ot1-f45.google.com with SMTP id s6-20020a0568301e0600b0059ea5472c98so12819017otr.11;
        Mon, 31 Jan 2022 04:51:57 -0800 (PST)
X-Gm-Message-State: AOAM530aSl64rDwM0S3T4v+1HDFs+tP/96KnJELRen8SN3m5okzwit+f
        otpbEUJMKKBJbxX3+jN6Ao7O9L0s22qayJurwck=
X-Google-Smtp-Source: ABdhPJz2ldEvXPLe4VLrOL1/086VlSYy2rglwDcRc9pP1g6ylCn89+zTCjUanrcBtKVuIDQjRfe7bm1f/mOT8iJR6V4=
X-Received: by 2002:a9d:654f:: with SMTP id q15mr11564588otl.119.1643633515967;
 Mon, 31 Jan 2022 04:51:55 -0800 (PST)
MIME-Version: 1.0
References: <20220127083545.1020423-1-skyostil@chromium.org>
 <20220127083545.1020423-3-skyostil@chromium.org> <YfJovN7clqBZ8NDr@kroah.com>
 <CAPuLczsLSnojXG8zyWBq6P50S8dVN3LcTi+2L0j-zLbwC_cJ0g@mail.gmail.com>
 <YfO5ASQ31vJpnGTC@kroah.com> <CAPuLczsP=VFVYzFjGDj3ysb6C=p4FHMVO3T69P6oN+p0WFQqRw@mail.gmail.com>
In-Reply-To: <CAPuLczsP=VFVYzFjGDj3ysb6C=p4FHMVO3T69P6oN+p0WFQqRw@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 31 Jan 2022 13:51:39 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2hcjLomPg3HmXAEacdzYtgCFvBQoE5AUBgsH+ETTu-ZA@mail.gmail.com>
Message-ID: <CAK8P3a2hcjLomPg3HmXAEacdzYtgCFvBQoE5AUBgsH+ETTu-ZA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drivers/misc: add transfer ioctl for HPS
To:     Sami Kyostila <skyostil@chromium.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dtor@chromium.org>, evanbenn@chromium.org,
        Arnd Bergmann <arnd@arndb.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:2lww1ljEvE8PDOsOjsr8HBwAt7tSndPlDaNL/HnBtKlio2IVRXH
 /fhBq31v7qIhBEJBtetx+bZtiEmWqNR7TZ0kftFnyizWThobN48m3kuVP2323oo9LZmXf2m
 dNy9rsjriXpLI+a/Q6dYZmqYxY4OPQkYVFUXXwpx4l5BsZh/ne2T4yHvXSqVuLBtTqaOBW+
 T8ud3OhDTHTmkU/S5jT7g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:V8ZWlbyuXe4=:YHPUNFf5Mc2iPnUkAflCok
 RnnYO1UNITrcgycKyBaAnPVu4WmwUew5OD45YmhFvAYs2araPqv2GMyyN2ap1bwulxzxWMr0m
 XjxhhiBK1ulUv6uzgxz6agiFPmTSB+wJ2pl2a/t0wiPu8L4JnAjLqS2i1TBqWrRla4MIjguVO
 fnpeLZ/mCUZurO2JXpwAJA88QzPsj91bKyzjn7aSMKpAqrzpesGHFxGUIgG5aEDlleA3RCtbj
 FeGmmbouNlzYzC6Zu92Ky2GwEV85Y/JUvB4vPMRl2arvlZhrsRRNUZxCtkCWlxQY6il7KEtxu
 ZxI59tP+jS83zl2PtJQDCbnl+jANQYzlHSJllGJJDi9tF9OwFNLBMIbB9+9jFFKIUiH+JAbPX
 uACBwKSHS8fWi32/O6g8M880Zp6d2xMyd9iypphqvygqg+XNbWRRj7qSfeKZEznDQymS5fvNw
 Cwimg4jnaAoAuTyNmeWrIIPtHAXAkqQVt/UCwP3UrPra08X3EXQ+Eqgzd2WShpQa3Rw+jYYEI
 6qiA134G5i9+IQxx+WZEcL5aPW8+oaUnDXezx/fkv3nTSEEjZ89bVMG6HzimLBhzZbJaxI+et
 o7R2UOVO29xRcYRt/c5b4iOOG8HLXCrTenek7vVYXNTMNylyJvnOy0d7og8i5kYQU4obwtufg
 o8kCQX0MzNQHTbWhdVbqt7wmB0KmJZnTL4kDUEfoIPjGGAp0avqNEQHXgB9BW5OS9UCPrATlL
 6sLdAnbDlBouYWyAqnKb9c5wX8zQw1V6y1Wrc/nxqzQaFTEvUs++j1BcPNg1QHcjbT1JlQ2DT
 rwIYghOE03Kiujm9XplTqhLMltsok7eCcCjpTfTkr6ySBt2krM=
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 31, 2022 at 9:23 AM Sami Kyostila <skyostil@chromium.org> wrote:
>
> I guess we could add an LSM hook for I2C transfers, but that would
> require baking device addresses into the SELinux policy which seems a
> little unfortunate.
>
> I think that leaves the options suggested by Arnd (thanks!):
>
> a) Add a generic way to expose device nodes for individual I2C devices
> (something like /dev/i2c/by-id/NN?).
>
> b) Make the ioctl interface more fully featured instead of just exposing I2C.
>
> I think I'm leaning toward (a) since it's not yet totally clear what
> the right high level abstraction for this type of device is (e.g.,
> should it be HID, in which case the protocol should probably become
> HID-I2C).

(adding i2c list to cc)

I think the implementation of the character device should be really
straightforward, it can probably just use the exact same ioctls
as the normal device, or a subset of them, and filter out any access
that has the wrong address with ioctl(fd, I2C_SLAVE, ...) or other
commands.

The tricky part is coming up with a sensible way of creating those
character device nodes, as there generic method of knowing what
is attached to the bus. I suppose this could be done either
automatically based on the nodes in DT, or it could be done
with user interaction like a new ioctl command on the normal
device node or some sysfs interface to create the chardev for
a particular slave device.

           Arnd

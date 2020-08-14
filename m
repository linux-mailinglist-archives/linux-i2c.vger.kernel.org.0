Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87E4E244A47
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Aug 2020 15:18:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbgHNNSN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Aug 2020 09:18:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726688AbgHNNSM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Aug 2020 09:18:12 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B148C061384
        for <linux-i2c@vger.kernel.org>; Fri, 14 Aug 2020 06:18:12 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id kq25so9895794ejb.3
        for <linux-i2c@vger.kernel.org>; Fri, 14 Aug 2020 06:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PJVMgjHP6gnp0mjaxlRSS4/pgm74X7VzDgM85iATqFQ=;
        b=lcPg0MJN52u2w8bKn3vXx5YumuLzvS88Y8QDNdQmUluO/C6RRpq77tK1Xdjlr8sO4g
         U0MrYKPh3k1/kYr2wvIjvtqhmwNBrYYYjIxqwMpeB9viturwBe70V7hgWfv6B1zU0ogo
         l8it6e5ob+p2mAFjdDFkDTofZXSN5iBvshjsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PJVMgjHP6gnp0mjaxlRSS4/pgm74X7VzDgM85iATqFQ=;
        b=IbkQ/198Hy7/qzI2bIGIh6WW/11pZVz5F46LscZublclj0ZqvZRjRiqoqMKr02bp6F
         rNjxLWg8HIu7/7mHAxov6GZOoPWVv1JScQm5n99hqKUUvrG2JnTylPwuayHQ9fdlRIgd
         sRuLorpu3AOrW7sX8qPZhSoHNnbpQ+FaZhH276kyGHwiRqYcjtuK3x3Oty8UjfstYh35
         SoyilrlRlH1RpqZ72DV5/6lBI8QJOqKPXFmT3XMz/GBqcJ5mePPGto3Zwa9xAQCChcby
         GWZCJXEXRcA0Cr0pWiVRIysRmWp84l3eEMrVpsG/Z4zBKBQ2BjnSkuHSPPNVfHLKaGDZ
         oiHw==
X-Gm-Message-State: AOAM5313DA+iVsTWaYOOnZOFftF8eAqCa9xv+MiN1bXWek4bNbN9ZUaX
        07wUzcicHB3As6LvU+AlzeesVOcWut7eZg==
X-Google-Smtp-Source: ABdhPJwc7yWP01jESz3IjevCz7SpQY8Tw2C6Wx0i9TvZMMNc8ZO+DqTPzhyGovUvaF2n4mBQXd6bxw==
X-Received: by 2002:a17:906:d92:: with SMTP id m18mr2457424eji.428.1597411090658;
        Fri, 14 Aug 2020 06:18:10 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id fx15sm6606791ejb.1.2020.08.14.06.18.09
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2020 06:18:10 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id f1so8342131wro.2
        for <linux-i2c@vger.kernel.org>; Fri, 14 Aug 2020 06:18:09 -0700 (PDT)
X-Received: by 2002:a5d:6744:: with SMTP id l4mr2915962wrw.105.1597411089399;
 Fri, 14 Aug 2020 06:18:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200810142747.12400-1-sakari.ailus@linux.intel.com> <5353041e-850f-05ad-3b20-35e91fc9501e@linux.intel.com>
In-Reply-To: <5353041e-850f-05ad-3b20-35e91fc9501e@linux.intel.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 14 Aug 2020 15:17:58 +0200
X-Gmail-Original-Message-ID: <CAAFQd5DbMMsxkJAkLm4kQ+cQ0ePG4ME492MxM3vwXws3H_bsTQ@mail.gmail.com>
Message-ID: <CAAFQd5DbMMsxkJAkLm4kQ+cQ0ePG4ME492MxM3vwXws3H_bsTQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Support running driver's probe for a device
 powered off
To:     Bingbu Cao <bingbu.cao@linux.intel.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 14, 2020 at 6:12 AM Bingbu Cao <bingbu.cao@linux.intel.com> wro=
te:
>
>
>
> On 8/10/20 10:27 PM, Sakari Ailus wrote:
> > Hi all,
> >
> ...snip...
> >
> > The use case is such that there is a privacy LED next to an integrated
> > user-facing laptop camera, and this LED is there to signal the user tha=
t
> > the camera is recording a video or capturing images. That LED also happ=
ens
> > to be wired to one of the power supplies of the camera, so whenever you
> > power on the camera, the LED will be lit, whether images are captured f=
rom
> > the camera --- or not. There's no way to implement this differently
> > without additional software control (allowing of which is itself a
> > hardware design decision) on most CSI-2-connected camera sensors as the=
y
> > simply have no pin to signal the camera streaming state.
> >
> > This is also what happens during driver probe: the camera will be power=
ed
> > on by the I=C2=B2C subsystem calling dev_pm_domain_attach() and the dev=
ice is
> > already powered on when the driver's own probe function is called. To t=
he
> > user this visible during the boot process as a blink of the privacy LED=
,
> > suggesting that the camera is recording without the user having used an
> > application to do that. From the end user's point of view the behaviour=
 is
> > not expected and for someone unfamiliar with internal workings of a
> > computer surely seems quite suspicious --- even if images are not being
> > actually captured.
> >
> > I've tested these on linux-next master. They also apply to Wolfram's
> > i2c/for-next branch, there's a patch that affects the I=C2=B2C core cha=
nges
> > here (see below). The patches apart from that apply to Bartosz's
> > at24/for-next as well as Mauro's linux-media master branch.
>
> Sakari, we meet one issue - once the vcm sub-device registered, the user =
space
> will try to open the VCM (I have not figure out who did that), it will al=
so
> trigger the acpi pm resume/suspend, as the VCM always shares same power r=
ail
> with camera sensor, so the privacy LED still has a blink.

It's not always the case, as on some designs there are multiple power
rails to the sensor and one drives the LED, while the other drives the
VCM. That said, it would be still good to solve it in either case.

Perhaps we need some more general discussion on the side effects of
simply opening and querying a device. Most of V4L2 drivers these days
are designed to avoid powering up the hardware until it's absolutely
needed to do so. However, for non-streaming subdevs that are directly
controlled by the userspace, like VCM, it's a common practice to power
up on open and down on release. This is because they don't have a
"streaming" state, so the driver has no way to determine when the
power is needed. I wonder if there is a way to improve this.

Best regards,
Tomasz

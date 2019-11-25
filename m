Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5F9C109351
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2019 19:13:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727960AbfKYSNI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Nov 2019 13:13:08 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:43411 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727741AbfKYSNI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Nov 2019 13:13:08 -0500
Received: by mail-ed1-f67.google.com with SMTP id w6so13597894edx.10
        for <linux-i2c@vger.kernel.org>; Mon, 25 Nov 2019 10:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jnxcpMz5dNB2R0ZiMjMQv7ajBq4qcecqf6LvupZ/sR0=;
        b=Q5xNCOMLxN73mwQWlR3JO4ib7P8cr1bXyAiG/WlEd5AM1cIX0+MgMBFMDnxf57Dl+9
         +8ithnSkyAFcvXriItOzZRDpcOpCeHyNSUWY7er3QW32I8KsRGXkhf9LuRt1lNY7p5oI
         u5lw/tDvjbYLTSBvq/hexPE93yDkO6Yxz+39E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jnxcpMz5dNB2R0ZiMjMQv7ajBq4qcecqf6LvupZ/sR0=;
        b=IJObYKy/rcGbng2DoCWjzQis0LtyJ01l+OcLiLVcywbX0Vixvjh8laXVd/SkTm8fVU
         E+4l1Jad1vU3Um/9zGb+FGOWkHOGQ1jhPHyVPbuDl+S3RN1f8MSsLVHoSqi/7vOjnzrd
         DR6yTnx0e0NMLZIcDFTeZ75KduLXy7ns2UmOJ4hXo0S2voXw5yd/zpcVzJZj6n1vJENN
         mgWvEgCNG7JiJw1/Wgx3+8iez6nSiQ0bE4rPc1XAKaJdNuqXGLz6LzbXqZ6y3LVuGlAQ
         8YbMWIizTng8F3xApi2BL0+YqagKd6Xh74OVkZzzpX/zXXc1Hl0M9BmSO304nLwRbgB/
         KtKQ==
X-Gm-Message-State: APjAAAV0cm73CKpYBQ2PlFxFHPv5AfRjwTeIw0Bk4qze+qSVytJ0JJ3+
        iYOxzAZzLw7RugAz3zr3Cpiv9nk/1MQ=
X-Google-Smtp-Source: APXvYqwtIzyjejDYll+7/HIHKnTad4ExWfVFrDat3M1HE4I6D3IZFY97RYYmrMIrA5BuqQ5q/YRC5Q==
X-Received: by 2002:a17:906:27ca:: with SMTP id k10mr37189907ejc.242.1574705586592;
        Mon, 25 Nov 2019 10:13:06 -0800 (PST)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id e13sm278688edm.29.2019.11.25.10.13.04
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2019 10:13:05 -0800 (PST)
Received: by mail-wr1-f52.google.com with SMTP id t1so19306489wrv.4
        for <linux-i2c@vger.kernel.org>; Mon, 25 Nov 2019 10:13:04 -0800 (PST)
X-Received: by 2002:a5d:5224:: with SMTP id i4mr32943767wra.303.1574705584339;
 Mon, 25 Nov 2019 10:13:04 -0800 (PST)
MIME-Version: 1.0
References: <20191121211053.48861-1-rrangel@chromium.org> <20191121140830.2.I68b9a92ed4def031c3f247d3b49996a2512d762d@changeid>
 <d82806a6-101e-181b-60de-0b32ff153ec6@collabora.com>
In-Reply-To: <d82806a6-101e-181b-60de-0b32ff153ec6@collabora.com>
From:   Raul Rangel <rrangel@chromium.org>
Date:   Mon, 25 Nov 2019 11:12:53 -0700
X-Gmail-Original-Message-ID: <CAHQZ30Dyj18+KQHZ9a5xAqDaGS4+gLAxQ9n8Liusn8eqE6pjFA@mail.gmail.com>
Message-ID: <CAHQZ30Dyj18+KQHZ9a5xAqDaGS4+gLAxQ9n8Liusn8eqE6pjFA@mail.gmail.com>
Subject: Re: [PATCH 2/4] i2c: i2c-cros-ec-tunnel: Fix ACPI identifier
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Akshu Agrawal <Akshu.Agrawal@amd.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Guenter Roeck <groeck@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        dlaurie@chromium.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 25, 2019 at 9:23 AM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> Hi Raul,
>
> On 21/11/19 22:10, Raul E Rangel wrote:
> > The initial patch was using the incorrect identifier.
> >
> > Signed-off-by: Raul E Rangel <rrangel@chromium.org>
> > ---
> > There are currently no boards using the identifier so it's fine to
> > change it.
> >
>
> Right, I don't see GOOG001A being used but also I don't see GOOG0012. Anyway,
> for the CrOS EC side, the change looks good to me. I think this will go through
> the I2C tree?
>
Is you were curious, here is the firmware patch:
https://chromium-review.googlesource.com/c/chromiumos/third_party/coreboot/+/1928674

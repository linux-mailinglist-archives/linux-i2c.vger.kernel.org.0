Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78AEE318780
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Feb 2021 10:56:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbhBKJyX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Feb 2021 04:54:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230176AbhBKJvF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Feb 2021 04:51:05 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDF83C061786
        for <linux-i2c@vger.kernel.org>; Thu, 11 Feb 2021 01:50:24 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id i8so9064224ejc.7
        for <linux-i2c@vger.kernel.org>; Thu, 11 Feb 2021 01:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B7GSnrM7B6crv8pKwIgz6vsLju5oSgUNsyvhwhxtSk0=;
        b=AFqOYKAiQVjfJdddLl3PUYgeUj/DPJbKc+Ks6t7ycM1u3h3esGS8bu+Sb3NNunfKCU
         60quMh3VjgLP/84CnylNGhuEk3SoeQGuE/rAEV56MOfKUc2cYpZVarp5iS/CLaTK0Zib
         2BNXleo2gLc16cMWOdBMmOPUC08pK57eqs19KVIBQCI/MIt7FlopElXB5PVgzd1Jk2BO
         NEcpTxeCT7p/RTt7qcqMkUkfFoq38ypovqbFUrixv3k5FcFLPcmLGhCyy7YZfOAwALzd
         LOm8RJfeasr1tUtO+DHp2B/BTzs69shTTNQWVJ3oxL0fnkqJHQLs3i2gUQ0BIZH2uQAo
         6FNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B7GSnrM7B6crv8pKwIgz6vsLju5oSgUNsyvhwhxtSk0=;
        b=uk2SO8ClmNlihyKKH8AoXf/vaDR0Lrusw62jxGeokquwjEiKVrXCrOUf6vyKe1ocOb
         4p+r1/aiAWrzNL9UIjlAWVRBRM+QxAZvT2eDtT2fOkt3dhrsAHa5bTiiv0xnus2C/DIT
         f3F1YifNHjYqx6nNdenb1vvukTp9uYtKcdyxaLGdO3YgA2+rNECbkkS/8EV0JwLIhSG/
         4ofe/YI4Gd+pByKnWV00+r9qaVI8mOBPz2Lzx2x5m6xH7mH07HwVIg5/gQ4z1yqBM1Pf
         QQF8QyVuHsd3Q9ieN0GeruJXp5f1N3CN9riDKi1RLbhhIglO8JgqoHMZKwM/tFAunVzn
         Y9PA==
X-Gm-Message-State: AOAM5318oS3a+lwPSvUspYDHRfY6UfwnghmOn8colm0ZLbPjrkGt9Zkf
        oRPUvb2Eqeg+AlBIMl+AAs0SGdTwS+Vgwjq9PdCP/Q==
X-Google-Smtp-Source: ABdhPJzqkkQOSYy6alf0j16Q93rb52p9AEJKYyTDVXr843L8/xeXbztnPxJKzF6gVpV2miPa62v4zOn5yQABP5xncsM=
X-Received: by 2002:a17:906:8053:: with SMTP id x19mr7497164ejw.470.1613037023687;
 Thu, 11 Feb 2021 01:50:23 -0800 (PST)
MIME-Version: 1.0
References: <20210210230800.30291-1-sakari.ailus@linux.intel.com> <20210210230800.30291-8-sakari.ailus@linux.intel.com>
In-Reply-To: <20210210230800.30291-8-sakari.ailus@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 11 Feb 2021 10:50:13 +0100
Message-ID: <CAMpxmJVfn034_4NxbhT3xh60vC9HCZpF7fCF4CGJ7-OiC7A6uw@mail.gmail.com>
Subject: Re: [PATCH v11 7/7] at24: Support probing while in non-zero ACPI D state
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
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

On Thu, Feb 11, 2021 at 12:08 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> In certain use cases (where the chip is part of a camera module, and the
> camera module is wired together with a camera privacy LED), powering on
> the device during probe is undesirable. Add support for the at24 to
> execute probe while being in ACPI D state other than 0 (which means fully
> powered on).
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> ---

I like this much better now, thanks!

Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

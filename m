Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25B0D15F729
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Feb 2020 20:51:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387508AbgBNTu5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Feb 2020 14:50:57 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38482 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388678AbgBNTu4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Feb 2020 14:50:56 -0500
Received: by mail-wr1-f67.google.com with SMTP id y17so12278400wrh.5
        for <linux-i2c@vger.kernel.org>; Fri, 14 Feb 2020 11:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=RC5diiaR31GO1rhNQqP799z+UvDMaz6Wswnev5LOZWQ=;
        b=nxT8uiE/z52YUercio9Z5U9t7IR3335+MJiJlP80FZE6VyMExWaZrdmMWfDGExAHJH
         UyKPXipXu0iaHR4UEWlfizHzMWSOaQxyrEdJJR783jkcXSGK9VsyV01m2xMT0Mw8wlbO
         AaGiC16TBHGyAKgukrHgBCtrmcFsmgrF8VJJq46pfS7/biBsMnKlXrp9aIxSIXpEtxtR
         PLM75PKRSTkJnEZE5X9BssKTdQqAQ9xFVsjDPMDtFdM5VT2ICVDPbK3G/1E4QLJcjL04
         PtD8CJCvmor2gmivTA7eV+66UuAsYVEzIRikVpVo0FnB49W3iDElogQ0zRQxZRC0XeSm
         dj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=RC5diiaR31GO1rhNQqP799z+UvDMaz6Wswnev5LOZWQ=;
        b=GCBjKWWkxxLnxeEHlFSl59+iPVc7vTh0FVDue9F1TeiavNIHGGCafgN6R+CHR6MCP3
         xo34vd9BnfCaK4eaOKzirXwmVncr7cVEisSC5aDKCFJn4gBnHXXg6BZMWDlR5dyVDHJF
         tyj8O6LNghvebWNKB93XLgbFTOjT1v+CuyS06cXaQIxpzUb/tVYPY4OEa0BH89Q9CR3J
         X9KrouZ+K7O54NfnDd2+xr2oWinkmMFstNuyYu8SGurjem/FTbM8j0LZLuQ2ov8uJ72k
         2zG1R9gTSoGPSUbQhz5XSv1M5UXbGQ3uA90RGl2nrnns40a8vMHu5yhLBtbq5Fch/Ln3
         K7jQ==
X-Gm-Message-State: APjAAAV4q1yvTKNWJYO87X/TBIBGiBh/mkxlebZFgKtnOUdfkqTxaKdy
        3y5m4zjTTSV7uFp/KIoJvidGUA==
X-Google-Smtp-Source: APXvYqxJ0lDeRgZFQoYhh/V5X69ykQbrkOdOXgABmMtigig5INOR94v2BGam/S6IxkftSmbnVRCbIg==
X-Received: by 2002:a5d:540f:: with SMTP id g15mr5387293wrv.86.1581709854692;
        Fri, 14 Feb 2020 11:50:54 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id 21sm8793510wmo.8.2020.02.14.11.50.53
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 11:50:54 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Jian Hu <jian.hu@amlogic.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     Jian Hu <jian.hu@amlogic.com>, "Rob Herring" <robh@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        linux-amlogic@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4] arm64: dts: meson-a1: add I2C nodes
In-Reply-To: <20200109031756.176547-1-jian.hu@amlogic.com>
References: <20200109031756.176547-1-jian.hu@amlogic.com>
Date:   Fri, 14 Feb 2020 11:50:51 -0800
Message-ID: <7htv3t9cdg.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Jian Hu <jian.hu@amlogic.com> writes:

> There are four I2C controllers in A1 series,
> Share the same comptible with AXG. Compared to AXG,
> Drive strength feature is newly added in A1.
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>
> ---
> This patch depends on A1 clock patchset at [0][3]

Just FYI, due the dependency, I'm waiting on the clock series to merge
before queuing this.  When the clock series is ready, please repost this
since it no longer applies to current mainline.

Thanks,

Kevin

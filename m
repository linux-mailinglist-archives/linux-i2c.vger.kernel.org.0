Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 364493139F0
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Feb 2021 17:46:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234463AbhBHQpV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Feb 2021 11:45:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234147AbhBHQpL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Feb 2021 11:45:11 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1787DC061793
        for <linux-i2c@vger.kernel.org>; Mon,  8 Feb 2021 08:44:30 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id bl23so25903537ejb.5
        for <linux-i2c@vger.kernel.org>; Mon, 08 Feb 2021 08:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F5h9xONdIWO5O+NZW8RLLN3OmuA966870wfg1CztF70=;
        b=GuFBMRbnPQ8pXKUdxj0VtNYSL300l5WkcePJdYmjXzfi7LGaVwJlT6ujKwJLw3kOq/
         C/V/WcVNkp3pWAVyhNBXqtorF/P30JYsm4dBdwnxp50KmlP2HRTEOr/z4BMirtRJfwz9
         19nMSlyffU0AfKRVDXw6wxPd5keybnQB9bQsjKphz4eP7dF+eVQrraIkDDRovjbFVlOy
         Xk6O5m7sAv+fCLWPpRCzX2yNaq2trCh1JLV9bTt3cNJTjQ63yF/DgSY8W8BGDCkAJdse
         BaTxgRiEoLjcs3C7EDhQDW45qEECjjUINMuKJOXySgEIeaIHKhR5uePUog0uldRTvgW6
         8OAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F5h9xONdIWO5O+NZW8RLLN3OmuA966870wfg1CztF70=;
        b=cLySVfiBMEkfzTwGdGHDeKrnBFMPkD1e23/aMyr+C4YSUUraJ4Oo0UNEeXRkcmTAR8
         W3NQWtUAMNROxm9rUu5nLlE8FVc6QZfMiVwX7114TBRQ649MwOxJ9RQ+R0CFRw2mYnNy
         k8QGRPUQHhBJNWT1cmQoTWVgHmE2FY71g2BgBDVRRGAopXUPPx0WKUCPRJXI7glIE8HF
         /tZTf3wTwc7E3EsFdlqB+29B5n5oay81uq+kWLA/oSUWdHcGNfMpfmC/wxQB7xsaEHZ9
         /jv0XJYZDVsCPDxb5fRr198aRKPR53TFb73wT+ojF45IjRkn2sLFHNSEACRjL+nkNMM5
         kS3g==
X-Gm-Message-State: AOAM531vnYltGz38TMYYwTJkMiBo8/bmgVq8CVrCFy+8vqmc7aAO7xgC
        TM44fCg0huQEKRK69EyuPi5uMN45Gw/lzyqeSZpoDw==
X-Google-Smtp-Source: ABdhPJyKqV2vMeSrf8JQ+AtG+5a/mZmdZnTnaSiQz01HCyKyFWXKOg/sJgmNIlk0XZRVJK95ma4QX+ZTc/IXqh3MNsY=
X-Received: by 2002:a17:906:8053:: with SMTP id x19mr17403771ejw.470.1612802668667;
 Mon, 08 Feb 2021 08:44:28 -0800 (PST)
MIME-Version: 1.0
References: <20210205132505.20173-1-sakari.ailus@linux.intel.com> <20210205132505.20173-8-sakari.ailus@linux.intel.com>
In-Reply-To: <20210205132505.20173-8-sakari.ailus@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 8 Feb 2021 17:44:17 +0100
Message-ID: <CAMpxmJU7J9JBSwCN+GLDpuOL=iZ1PH=oZZuGiAyovuf2TQ=o9A@mail.gmail.com>
Subject: Re: [PATCH v10 7/7] at24: Support probing while off
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
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

On Fri, Feb 5, 2021 at 2:25 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> In certain use cases (where the chip is part of a camera module, and the
> camera module is wired together with a camera privacy LED), powering on
> the device during probe is undesirable. Add support for the at24 to
> execute probe while being powered off. For this to happen, a hint in form
> of a device property is required from the firmware.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> ---

I'll ack this but I still claim that the name
acpi_dev_state_low_power() is super misleading for this use-case and
I've been saying that for 10 versions now with everyone just ignoring
my remarks. :/

Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

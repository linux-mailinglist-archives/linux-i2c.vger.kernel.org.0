Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05A0A136BCD
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Jan 2020 12:16:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727825AbgAJLQ1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Jan 2020 06:16:27 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:40182 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727818AbgAJLQ0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Jan 2020 06:16:26 -0500
Received: by mail-io1-f66.google.com with SMTP id x1so1664268iop.7
        for <linux-i2c@vger.kernel.org>; Fri, 10 Jan 2020 03:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=E0kTgke7i7no5YSGmsSsdd4ls6keOfUqGJvkD2ZqyfQ=;
        b=NnePBo6iCOPCCl8M3uUdxEi3EwgCfLxTravxBpRnXZlApT5tkOTYTwa5YdVOdf7Hqr
         InO7lLE8tbhmVGA1ABlD/sztCr/eIMOczIR1fivwLrjTlnuDqqwhfKKtW8tvpugFxWmg
         GNWAbWWujCvRjDbYEgDo7yrXAnrF7U7Hadn/or4/SYCnqQufiOsdeyAjytF9tveiYn+f
         oWbAHJ3uG61eS+jpIPo+RDY2SZBE1Gyzfup2d5vmYkV6IHtdsM+h0vWbki//QJRuoPKr
         t4U9hrqfIvz7+5UwF01sXX3QDVTz5ySaxHMVN8NN3icKAsX7aGNIo9vnQSu1nuFU4vQr
         P0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=E0kTgke7i7no5YSGmsSsdd4ls6keOfUqGJvkD2ZqyfQ=;
        b=gQzW4X8gEfbBlq+rimVxwwNmiBBC7zH3d6CJdU7C3btxj/OmSR7/a/ZRThoG/ymBRZ
         VGg8gsC0V1KUa8hHsk/bxQAPhgsI80NKjLcMb34DsCIA3FB1WrbkuTvnmxvN01I9DVSR
         Y9CMVqLIsb/CBrYfVcykPP/UK4Gv0plFZGB2tLeWQnuhpiwViuXEt8Q7QwahNYcWyb22
         yZ/EMkUQF7eKdZshu49SIW9/FQ1BGrZNW5uvwe21vdfmYF4ps0Ki8A0YIX33mu0d7Wrv
         cYZXt0Ruu3F1abtowF6M2FoiQGPqa4OOLMQFjTZVgApdoBz+uH1ryeea0uSmIXgB52V1
         JQiQ==
X-Gm-Message-State: APjAAAWwPaGD+htgWBul1alJzOlZff8zTab5BtwUd3OYn8XHR3lHsucs
        POOnAcchIE29mQR8CpRxicQVhl10+IEnO/3NMdqu8w==
X-Google-Smtp-Source: APXvYqwPTjV6sa9yurHRzaTSTH6oKZ7TDKuE4ojDTaVsHmqgvbewwCwQ+R1EOsG5qONsmgHQ1T36FBP4nbNDi2uHV78=
X-Received: by 2002:a5d:8952:: with SMTP id b18mr2031946iot.40.1578654985955;
 Fri, 10 Jan 2020 03:16:25 -0800 (PST)
MIME-Version: 1.0
References: <20200109154529.19484-1-sakari.ailus@linux.intel.com> <20200109154529.19484-6-sakari.ailus@linux.intel.com>
In-Reply-To: <20200109154529.19484-6-sakari.ailus@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 10 Jan 2020 12:16:14 +0100
Message-ID: <CAMRc=MfqRqtW=nMuKFcpLrBHYg7wwPboUEvYpj2sBXM8yWEM_w@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] at24: Support probing while off
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Tomasz Figa <tfiga@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

czw., 9 sty 2020 o 16:44 Sakari Ailus <sakari.ailus@linux.intel.com> napisa=
=C5=82(a):
>
> In certain use cases (where the chip is part of a camera module, and the
> camera module is wired together with a camera privacy LED), powering on
> the device during probe is undesirable. Add support for the at24 to
> execute probe while being powered off. For this to happen, a hint in form
> of a device property is required from the firmware.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Why am I not Cc'ed on this patch?

Bart

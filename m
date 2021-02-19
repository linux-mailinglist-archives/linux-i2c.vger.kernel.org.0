Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5011531F48A
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Feb 2021 05:57:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbhBSE45 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Feb 2021 23:56:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbhBSE44 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Feb 2021 23:56:56 -0500
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F5A5C061574
        for <linux-i2c@vger.kernel.org>; Thu, 18 Feb 2021 20:56:15 -0800 (PST)
Received: by mail-io1-xd34.google.com with SMTP id f6so4400701iop.11
        for <linux-i2c@vger.kernel.org>; Thu, 18 Feb 2021 20:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vmsnYjF2Jni0yBtFKj2Qb92BPvghFrEm0bQB7L6qNZ8=;
        b=MU4/dTvfk04RdIlg5Hh5a3m8YON3RCWn4KtwHXp+NZy3lBc7AMZf0XOnv88XDb7C+L
         mLNpAjVk24CEThadLaC/lCzQ27z/EfldCmyOBLriGMZ7ATe0E9b2Y/y3fS9Ufjg8iO4U
         UvG7CO2txS72wXc1bDZz2Syh2PNOEiWv3nxKp+x5UHcAhdfdguKKAbn8TxLwCYjnQK9b
         MOYKJiUlqWMn1jkZv3VEouE+umqa0Q2JcvPUOYh/hC/9v09bcujUIO82sTnRFXHxg4px
         QA7nEueLgM0L97V7UCxUNAn5gx7PDFnqUqJf9x9UiaUcp5TPDuEtGtRwdZLUeWsvn6NU
         XoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vmsnYjF2Jni0yBtFKj2Qb92BPvghFrEm0bQB7L6qNZ8=;
        b=bIc+UPPul+L1q7Z1yQEUga+C3Clm2ANq4yhKUgIZXiKJo0zPSOaGtdXti0Zi95FEnz
         aEyE6OBuGq9RvlSJ3YZ+Eaj3lyGtQ9UBqYpCzGEgdJcAcBcJrbdd+BQp0wm0iGeUXBYi
         7Rus4+nvMvFeV4kHfKyrr6VWsz6wd4yrwK8QqKkda7O7Bx7WrRalAp6H8JiAHJjNoOd2
         sFqMYl98Gp+2TIKMZ86Ouu6Wx04nVfHGQwERJGuVBD78C/bND9JdFYt8I+ox1gZf166L
         nwyCkt+CZkTYRuxtp9HbPwbBNUxoGAMPVbGvr/UZO7v0W+/IltuEWq1YjrZ/RruTUj60
         0GUA==
X-Gm-Message-State: AOAM531K/HYp+mB/k+KPhZ+78Be2IqexFx/UFVF6Oi5Oxk8Z/CCRNG/x
        idWKlPA3uNLFKGq/kwcQzkxDi9xMmEt5/mr0bFZTk++xZuZLrQ==
X-Google-Smtp-Source: ABdhPJylA19VFG7vBg6p1x+VX1OdXgromYXMK1VFZZrbfcJtveOpVuYOHRvD6i6g+TfWteQfCXMfmqVghUHeNHllTWQ=
X-Received: by 2002:a5e:9612:: with SMTP id a18mr2344266ioq.13.1613710574086;
 Thu, 18 Feb 2021 20:56:14 -0800 (PST)
MIME-Version: 1.0
References: <CAA_a9x+ysAxT6T11S_M4pKenq2vDO762nnXUvAuXOCL7S9ozxg@mail.gmail.com>
In-Reply-To: <CAA_a9x+ysAxT6T11S_M4pKenq2vDO762nnXUvAuXOCL7S9ozxg@mail.gmail.com>
From:   Alex Qiu <xqiu@google.com>
Date:   Thu, 18 Feb 2021 20:56:03 -0800
Message-ID: <CAA_a9x+S5x8o=uisQgSSE1m+v863W6nYW7QPMowadpFWGEgbbQ@mail.gmail.com>
Subject: Re: Kernel Doc on Navigating I2C Sysfs for I2C Topology
To:     peda@axentia.se, Wolfram Sang <wsa@kernel.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Feb 10, 2021 at 11:04 AM Alex Qiu <xqiu@google.com> wrote:
>
> Hi Peter and Wolfram,
>
> I'm looking for some documentation online to guide hardware engineers
> on how to find out what logical I2C bus number to use for i2ctools in
> sysfs when they know the physical I2C topology (BMC physical bus
> number and MUX channels). I read through the doc under
> Documentation/i2c/, but didn't find any. I didn't find much on this by
> searching the Internet, either.
>
> Is it some doc that I can add to Documentation/i2c/ or
> Documentation/i2c/i2c-topology.rst? Any suggestions or thoughts?
>
> Thank you!
>
> - Alex Qiu

Another ping. :)

I had the doc drafted and reviewed internally in Google, and I'm going
ahead to create a kernel patch on Documentation at some point. Right
now I think I'm going to add a new page as
Documentation/i2c/i2c-sysfs.rst.

Thanks!

- Alex Qiu

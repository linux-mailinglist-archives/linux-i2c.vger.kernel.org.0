Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD5CE1F4931
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jun 2020 00:01:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728147AbgFIWBP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Jun 2020 18:01:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726992AbgFIWBO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Jun 2020 18:01:14 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F228C05BD1E;
        Tue,  9 Jun 2020 15:01:13 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id h185so170718pfg.2;
        Tue, 09 Jun 2020 15:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MRXZKngqhLb+ar4aO9Lsmg4caWqUFoMOzojN3p3S434=;
        b=gc+jIrTQiLDyd2W9Lb98OOfoARYG5umI69HXDYVWWt1Cpw+gdNZGG/2D7DgU2ja7sQ
         yMxGxEMiojoTc5V7TPAu2+OoP3kX99L4ORobn8zcgI1Bw20NDwLuHrKogWsgjJyccha5
         39sSMtWfiFX4ipSRj7o0FeIKza4ArnEOxQ0kF03JOj7iymPLyptfV/J7oBzrkA0lnz4Z
         B6EYz717JNdNwF3yieCICMKVPLspgN1QfQ7F0UuOMW++lROHoCHBYpIM9Kfq35YmWRa2
         fkCl5q4PPq4R9HLGRZ1nZ1FNvEwbyBNF21HmIGRgYA8PpsJz0+0nR+us74skl3kEs8OK
         KtuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MRXZKngqhLb+ar4aO9Lsmg4caWqUFoMOzojN3p3S434=;
        b=aLIXb4BKcXOFCnumjXLWrKgwa7csJqG+jo05+bvauyazOQmi0tJZVSR96FjFAvoVJh
         3LLD+i4vH53+ty2MQW08A8m/axV6r/VJnRRszxQleyIKYUoCqzjHnBvMBvy9B4Eeo0iM
         fv9QINVc7XzT6iAWgIFQ0WDt3f9Z5rnysAvzFfRpbKQRshH8rRPm4W934LTRROVNwIle
         uAhu1cuIZ2FVDORztHXgI4/hPgQxNmkBCBERKTOij/PUjghEON9CrDSZas4qvkAz0vpu
         K1AOGwEn1V3FALYv9rLDM+ybkgHtl1ZKb1Hm2ECMWynME1NrBCrgDxwJCKLB6znOB51f
         xE5Q==
X-Gm-Message-State: AOAM531ooUcWNZL3NIj+TpTuTpyMVLKbKwSzDJNi/egJhA4DOHPXr7/1
        P+GDEBGoYX4ayYgyZPVQRZe970QCc3XU5S8c4Ls=
X-Google-Smtp-Source: ABdhPJwAcywTeq5QYPmU1nL+2RNn3CEo1ceXk+l+ZyG4B1GFi8+1suYBPRU8EFXECKAdXGpd+6CzZGz8eo0rnbZ4Iqw=
X-Received: by 2002:a63:ff52:: with SMTP id s18mr62377pgk.203.1591740072651;
 Tue, 09 Jun 2020 15:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200609201555.11401-1-eajames@linux.ibm.com>
In-Reply-To: <20200609201555.11401-1-eajames@linux.ibm.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 10 Jun 2020 01:00:55 +0300
Message-ID: <CAHp75Vd32ivnOgenr1q9gd5kJRAQseAhZoiRb80Xv5O7qeBaJw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] i2c: fsi: Fixes for systems with more ports
To:     Eddie James <eajames@linux.ibm.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        wsa@kernel.org, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jun 9, 2020 at 11:15 PM Eddie James <eajames@linux.ibm.com> wrote:
>
> This series fixes a register definition for the FSI-attached I2C master to
> allow all the available ports. In addition, the code to add an adapter for
> each port is modified to require a device-tree entry for the bus. This is so
> that systems with lots of busses that have no devices on them don't add lots
> of unecessary devices.
>

FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Changes since v1:
>  - Remove the check for null device node since that is checked in
>    of_device_is_available
>
> Eddie James (2):
>   i2c: fsi: Fix the port number field in status register
>   i2c: fsi: Prevent adding adapters for ports without dts nodes
>
>  drivers/i2c/busses/i2c-fsi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> --
> 2.24.0
>


-- 
With Best Regards,
Andy Shevchenko

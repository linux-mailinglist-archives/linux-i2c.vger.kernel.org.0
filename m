Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E830222C266
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jul 2020 11:37:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726987AbgGXJhm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Jul 2020 05:37:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726801AbgGXJhm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Jul 2020 05:37:42 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37439C0619E4
        for <linux-i2c@vger.kernel.org>; Fri, 24 Jul 2020 02:37:42 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id k17so4858062lfg.3
        for <linux-i2c@vger.kernel.org>; Fri, 24 Jul 2020 02:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5TQWChaGcld1X+jt6TSrRbT5d69VNh8YdsaNVfKXJuY=;
        b=Ne8qy7BB6Y/7TKH1bliOs0RBd4vcuED8WeR396vymk9sAlufq/RXK9OvvOAOKekoT6
         pXymUgec0ISJT7TxLDIWTVDVglo9UcgR20dy/VLWWRY17kxHMlGG60UdnM0I48wQ9jeu
         fQUfUKlgsF2GuEOdu2DjPttH7ZNLTM7bwMDv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5TQWChaGcld1X+jt6TSrRbT5d69VNh8YdsaNVfKXJuY=;
        b=ewI94qgDrAyy3Mdh5UzEEWjTCtmj9iAQ1l40OFCmxwnUWdbqCjvIEkQH9T35X3teDA
         CbH5Dq9KpnOyHsEtbq9CPyh1i/TW8TNs9IwTO05G4vQSgY29Uv+pTH1Ynjp0MFM2UUf4
         i6vTbzqE2ap44CcQrY7sHqEq3k3MlVgnzVqcMzxaOGB5xZcYZOxRpnMnmO2AJZrD4K4F
         98KdwJ3HZRUTmG0OsDLj8pPhiLEQhBF9Q0EwJK6wk4qkEIplohVoSkfbd1aSPfZwSjTP
         LDuqA0uxkbHOXS+OutMY7rTYGkWWPICFuxnWfH9J8ANvUzXBqxvU8IQTTuRNBxLdKWlM
         ITOA==
X-Gm-Message-State: AOAM531k496sj44ci7rGEzTzPLVXzrcVA7XX/l79Zg66fIm3mrszIAZ0
        yTuA2Db9LIzAkyGrr7hwpSqQ6YDzL4tcPBn/Ztl11A==
X-Google-Smtp-Source: ABdhPJxFM2by9Dsl4Q00h1MKaIBnGcQKERhBxfp23nVMGa9arHxE0+0yVNbsFcgbMzInjHlHpismO9fhP/Cla8ZD8DI=
X-Received: by 2002:ac2:5f81:: with SMTP id r1mr4508456lfe.168.1595583460497;
 Fri, 24 Jul 2020 02:37:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200717090155.10383-1-rayagonda.kokatanur@broadcom.com>
 <20200717090155.10383-3-rayagonda.kokatanur@broadcom.com> <20200723202053.GD908@ninjato>
In-Reply-To: <20200723202053.GD908@ninjato>
From:   Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Date:   Fri, 24 Jul 2020 15:07:28 +0530
Message-ID: <CAHO=5PEeek5EiXk3ZAmXPFRQ4xKF4e3z-pe6Yq9t4iV+7AUJYw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] i2c: iproc: add slave pec support
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        Lori Hikichi <lori.hikichi@broadcom.com>,
        Robert Richter <rrichter@marvell.com>,
        Nishka Dasgupta <nishkadg.linux@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jul 24, 2020 at 1:50 AM Wolfram Sang <wsa@kernel.org> wrote:
>
>
> > +     /* Enable partial slave HW PEC support if requested by the client */
> > +     iproc_i2c->en_s_pec = !!(slave->flags & I2C_CLIENT_PEC);
> > +     if (iproc_i2c->en_s_pec)
> > +             dev_info(iproc_i2c->device, "Enable PEC\n");
>
> Where do you set the I2C_CLIENT_PEC flag for the slave? Is your backend
> code publicly available?

I2C_CLIENT_PEC should be set by backend before calling i2c_slave_register() ie

client->flags |= I2C_CLIENT_PEC;
ret = i2c_slave_register(client, i2c_slave_eeprom_slave_cb);
------
------
------

My backend code is not yet publicly available.

>
> I may need a second thought here, but I am not sure I2C_CLIENT_PEC is
> the right way to enable PEC. Isn't it actually depending on the backend
> if PEC is needed? I.e. is the backend an I2C device or an SMBus device?
>
Yes, it depends on the backend. If backend is SMBUS device and
supports PEC then it should set client->flags |= I2C_CLIENT_PEC,
before calling i2c_slave_register(), so that the slave bus driver will
enable PEC in device.

Best regards,
Rayagonda

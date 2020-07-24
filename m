Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 689DB22C21F
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jul 2020 11:22:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728314AbgGXJWQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Jul 2020 05:22:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726591AbgGXJWQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Jul 2020 05:22:16 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00EC9C0619E4
        for <linux-i2c@vger.kernel.org>; Fri, 24 Jul 2020 02:22:15 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id q6so9269293ljp.4
        for <linux-i2c@vger.kernel.org>; Fri, 24 Jul 2020 02:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UCQgIDH18blhCrSH5b1SQMlBmyksN/2DUs5GSP9E0Fs=;
        b=ekBqfWhOs6f/OybbTE+hPMUjo1rK2jJgBZTMwF44ry2I3iDjmU6xazBuCfmaioC/Mh
         ysHDgfLtYSYDGTTdZlmc5h6Vx58skci0KuNkvpCLoWXkcB1GFQCh9SaAoflBQakN+rMn
         j5gKSITpAQLOfjjO6I/Rk0P2/PEBH6CZiyCE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UCQgIDH18blhCrSH5b1SQMlBmyksN/2DUs5GSP9E0Fs=;
        b=mI36n5KbnTeSxFafWt1ulsU6m21LgiURv0hzal4cnnop0OAWYnMABUAh/12J1XAPxw
         uo2HRoZW2HyLJeic2UwONlNnEnNSmhvSCcTjPGGeyaRUiciwrgHb44qS5e+54cZ7+9pQ
         YXg9je9uMzUjcjW0YJYcOVDJRUXO0wfNNYshjVArz0tc6jJIpaySC49z16Yvpn+P/ho6
         oQib1l6vt3jE3cyl0Y3K1YOWmn6PMyhp7r2ERa3sqBUO2EEvWf1NdYC6AithDKI69DbI
         DoFt4zSd3aa6BcVW1i2EQO87ts8oKbFGF7vRmCc+N3eZXNIVfMapuD+zdh4i8dgbh6W7
         e57g==
X-Gm-Message-State: AOAM532ctJ4+uKaX7S2PxurCY0LcA6aF6jjeVU0MAM+RRka2QXB+CzSI
        zCBy9lU4tYB1fFIH4c0mPjiIGdnB6xLA0lRdVuC8QQ==
X-Google-Smtp-Source: ABdhPJzoTOEerXlAc1lbArZdrW2edXix0eTm6dVqnq+ZUP5496Rfg7Jcvusy8EFJ5uGp02r4AF90kF1NdFDZ91Z6PE8=
X-Received: by 2002:a2e:b4ce:: with SMTP id r14mr4050255ljm.88.1595582534187;
 Fri, 24 Jul 2020 02:22:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200717090155.10383-1-rayagonda.kokatanur@broadcom.com>
 <20200717090155.10383-2-rayagonda.kokatanur@broadcom.com> <20200723201634.GC908@ninjato>
In-Reply-To: <20200723201634.GC908@ninjato>
From:   Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Date:   Fri, 24 Jul 2020 14:52:00 +0530
Message-ID: <CAHO=5PHk=Vozd8ipTp_6tYzTiaS++p7C1XWTRC7QdpjWV6OyCw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] i2c: add PEC error event
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

On Fri, Jul 24, 2020 at 1:46 AM Wolfram Sang <wsa@kernel.org> wrote:
>
> On Fri, Jul 17, 2020 at 02:31:54PM +0530, Rayagonda Kokatanur wrote:
> > Add new event I2C_SLAVE_PEC_ERR to list of slave events.
> > This event will be used by slave bus driver to indicate
> > PEC error to slave client or backend driver.
> >
> > Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
>
> Definately needs documentation in Documentation/i2c/slave-interface.rst.

Okay, I will update the doc.

>
> What is a backend supposed to do? Does 'value' have a meaning?

According to SMBUS spec, during slave receive transfer, it is
encouraged to issue NACK if the received PEC is not correct.
Also PEC errors discovered above the data link layer may also be
indicated with a NACK if the device is fast enough to discover and
indicate the error when the NACK is due.

If a device doesn't support issuing NACK and issuing NACK above the
data link layer is not possible because the device is not fast then in
that case we can send error code (I2C_SLAVE_PEC_ERR ) to the backend
driver. Backend drivers which support PEC should check for this error
code and take action such as discarding the data.

Best regards,
Rayagonda

>
> > ---
> >  include/linux/i2c.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> > index b8b8963f8bb9..e04acd04eb48 100644
> > --- a/include/linux/i2c.h
> > +++ b/include/linux/i2c.h
> > @@ -370,6 +370,7 @@ enum i2c_slave_event {
> >       I2C_SLAVE_READ_PROCESSED,
> >       I2C_SLAVE_WRITE_RECEIVED,
> >       I2C_SLAVE_STOP,
> > +     I2C_SLAVE_PEC_ERR,
> >  };
> >
> >  int i2c_slave_register(struct i2c_client *client, i2c_slave_cb_t slave_cb);
> > --
> > 2.17.1
> >

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAF4412780C
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2019 10:25:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727185AbfLTJZS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Dec 2019 04:25:18 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:38142 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727169AbfLTJZS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Dec 2019 04:25:18 -0500
Received: by mail-ed1-f67.google.com with SMTP id i16so7583793edr.5;
        Fri, 20 Dec 2019 01:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iW+E0xO4cl6Le/pRNkxzyx+ZKt3kccSYLfBkkXeukuc=;
        b=t3WLxxKLD6EyG4OWlTU0Yqy9yEt2NHUh7m7Tfcpbw7RONe59MDpw+50lv3mxZSKIJL
         hFXjbe+NYTJdx7GcAuoatJSZY6X5abT1JOdQPSeCEWlcoXlPh1GUie/idKjswhEvESx4
         LudnV3hZPi1nHjK0Pygnfvj9sb2j3V+bABKTAdFKhIum99YT5vZFibC8tW9eKaYW3A4h
         pgvFSXzcg+g2EtDOFqVXlRazJ6JaX4nhwfbzZzO15sroSIjpOonciRFrLQcir6bPE3nI
         DB3+AKlgjZbWm3Ld/YyVjTquc/MY3eOKrd+Koz6IQCvapMSLU7NlAMNZuxlNS4IyYGpJ
         +8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iW+E0xO4cl6Le/pRNkxzyx+ZKt3kccSYLfBkkXeukuc=;
        b=fts/8h2pDs1uurcVxHu3WOvHVpFwwqV7UV95zjj7rHYOz4aD9XXy/MeZ306LSpvWBg
         bHrM52kP+XUym8mLNIKa/eeQleZASVv7sj4Qs9fn3dOmUJ3hLQF1rocbFqCvGXJq7Qeq
         XFTr0RxUz0GJ7wGrBcPzrQSArlXaQYKVMvS6UKEJbuQa8ygdrjfJk5PF5x7ECaq1gTKY
         s4QeuC6WcFM8GxIkKH9o5e+uzhxPlDQwjG3B/oUbTSYYYceOTIkqeNXy5paqMIQtt34F
         56hfTpxhuyRVpRA7rpBQUKKIeg1Z5KitQU0iSLs5bJeGYG+pOj6w/qtwfs7P3OfvBTAU
         TO9w==
X-Gm-Message-State: APjAAAUeVjiw1GPZ0vv+NLmf9nV+Dg1xLV8rIqa6YTUPSv2ShBlfsMsD
        YkM1TBdKeM2bBJlGdAa3VYuyfgq8Ht6Yr3g/hig=
X-Google-Smtp-Source: APXvYqy/qbLAr14kvPkMt9+niEqKtVDn0hoTqq90t+dQcT6zO67x9oZ4UOtDOv+a63LpLJonq1R9Evt6oB3TgV3dC10=
X-Received: by 2002:a05:6402:12d1:: with SMTP id k17mr14587034edx.291.1576833917042;
 Fri, 20 Dec 2019 01:25:17 -0800 (PST)
MIME-Version: 1.0
References: <20191219124120.53754-1-radu_nicolae.pirea@upb.ro>
 <20191219130501.GA958@kunai> <6504123809effc310ade02dbb8a63f10db6b6c92.camel@upb.ro>
In-Reply-To: <6504123809effc310ade02dbb8a63f10db6b6c92.camel@upb.ro>
From:   Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date:   Fri, 20 Dec 2019 14:55:05 +0530
Message-ID: <CAKfKVtFqbtovQGQuzgCYzTu4bHOmAOmTz-tZMD89iUkMPc8awA@mail.gmail.com>
Subject: Re: [PATCH] i2c: cadence: Added slave support
To:     Radu Pirea <radu_nicolae.pirea@upb.ro>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Chirag Parekh <chirag.parekh@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi ,

On Thu, Dec 19, 2019 at 7:00 PM Radu Pirea <radu_nicolae.pirea@upb.ro> wrote:
>
> On Thu, 2019-12-19 at 14:05 +0100, Wolfram Sang wrote:
> > > +/**
> > > + * enum cdns_i2c_mode - I2C Controller current operating mode
> > > + *
> > > + * @CDNS_I2C_MODE_SLAVE:       I2C controller operating in slave
> > > mode
> > > + * @CDNS_I2C_MODE_MASTER:      I2C Controller operating in master
> > > mode
> > > + */
> >
> > Can't the hardware operate as master and slave at the same time?
> >
>
> Of course, it can. If the driver has a slave registered wait and
> listens and if the subsystem needs to use the controller as master, the
> driver changes the state of the controller to master, sends and reads
> data from the bus and after this change the state of the controller to
> slave.

However that should be done only if no master is talking to the slave right?

> In cdns_i2c_master_xfer is done all the magic.

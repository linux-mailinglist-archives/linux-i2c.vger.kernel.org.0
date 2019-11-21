Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D06F0105C39
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2019 22:50:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbfKUVuH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Nov 2019 16:50:07 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:44838 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726297AbfKUVuH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Nov 2019 16:50:07 -0500
Received: by mail-ed1-f66.google.com with SMTP id a67so4138958edf.11
        for <linux-i2c@vger.kernel.org>; Thu, 21 Nov 2019 13:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=441CDEY7r+jAiyFqGWKYoN/In8wLFWAjU8LoG44hNKs=;
        b=ewatgbtJd/GVsBazwuLbhDVy3ondBBL6YXn7+xys4ddOWJgSkvQyUhlZBIt3D9xmGY
         fvdvmkQS0NxDmjkrips5s3HdM7Jb0R/3Ge4SW9aEdseDuGeFkoxsMgIp8pBLWPw2uC/E
         n6lyziC2b0Cntk9mU4KbVq1dLXGcgZJfUOhXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=441CDEY7r+jAiyFqGWKYoN/In8wLFWAjU8LoG44hNKs=;
        b=rFc87FChs2n9xRc3LLLsXJs4kKuL7hV9Dbm1lKKzYXGciNw9VrEtQPQdr8qC9eZlzk
         8DdCEDXkIIN9hV1ZTYuF2FYBUDy/OGuueZ+c32KUx4NNWYGH7Vdoprq5wjwOkeISnHeS
         cj+uicG2IuYQeKewg29aTtLKPyPVLjwCb7aXENU0LFwQkQUTDOjiuexoNEboiZLuoYpX
         Ie8ttU7acLVWG6Wuuv2PfESxEFRZRD//aVQXAwklH6wQensiyj5Y6EgmkXjzAyuazObK
         cvp6euzLXoakCthhTwZYhEfH8qntzjMYFV62LAzY1if5E+HVN5yByNiZQreuQfI6yli+
         rSUA==
X-Gm-Message-State: APjAAAX/OJbQH5TUHK3PeKqwEFDSfULrvElltFlmxAUUNe4tjDrzKRz9
        bgTvn5jsE0wpl2BByTUu4yWR698bXAQ=
X-Google-Smtp-Source: APXvYqygAZ/dEIqXEBD3q3dGvq70oqlKS3lboYZKHKblI9zr4wdKxFkVMc4ydobeUI2FSosOfKLAmw==
X-Received: by 2002:a17:906:6006:: with SMTP id o6mr16484018ejj.51.1574373004184;
        Thu, 21 Nov 2019 13:50:04 -0800 (PST)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id d11sm183883edr.37.2019.11.21.13.50.03
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2019 13:50:03 -0800 (PST)
Received: by mail-wr1-f54.google.com with SMTP id y11so3163963wrt.6
        for <linux-i2c@vger.kernel.org>; Thu, 21 Nov 2019 13:50:03 -0800 (PST)
X-Received: by 2002:adf:db8e:: with SMTP id u14mr4763385wri.274.1574373002609;
 Thu, 21 Nov 2019 13:50:02 -0800 (PST)
MIME-Version: 1.0
References: <20191121211053.48861-1-rrangel@chromium.org> <20191121140830.4.Iddc7dd74f893297cb932e9825d413e7890633b3d@changeid>
 <CABXOdTeotUnO_7k9UycJ0vJEKV8pdZOjRrepDv5WVo5RmOLnEA@mail.gmail.com>
In-Reply-To: <CABXOdTeotUnO_7k9UycJ0vJEKV8pdZOjRrepDv5WVo5RmOLnEA@mail.gmail.com>
From:   Raul Rangel <rrangel@chromium.org>
Date:   Thu, 21 Nov 2019 14:49:51 -0700
X-Gmail-Original-Message-ID: <CAHQZ30CYQd1-ZHJeVnKi9CMeZGiRJmvfYN5PRrpN26gcEJZXOA@mail.gmail.com>
Message-ID: <CAHQZ30CYQd1-ZHJeVnKi9CMeZGiRJmvfYN5PRrpN26gcEJZXOA@mail.gmail.com>
Subject: Re: [PATCH 4/4] platform/chrome: i2c: i2c-cros-ec-tunnel: Convert i2c
 tunnel to MFD Cell
To:     Guenter Roeck <groeck@google.com>
Cc:     Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Akshu Agrawal <Akshu.Agrawal@amd.com>,
        Guenter Roeck <groeck@chromium.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Benson Leung <bleung@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Nov 21, 2019 at 2:40 PM Guenter Roeck <groeck@google.com> wrote:
>
> On Thu, Nov 21, 2019 at 1:11 PM Raul E Rangel <rrangel@chromium.org> wrote:
> >
> > If the i2c-cros-ec-tunnel driver is compiled into the kernel, it is
> > possible that i2c-cros-ec-tunnel could be probed before cros_ec_XXX
> > has finished initializing and setting the drvdata. This would cause a
> > NULL pointer panic.
> >
> > Converting this driver over to an MFD solves the problem and aligns with
> > where the cros_ec is going.
> >
>
> I thought the mfd maintainer objects to the use of the mfd API outside
> drivers/mfd. Did that change recently ?

The MFD apis are only used in drivers/mfd/cros_ec_dev.c.
drivers/i2c/busses/i2c-cros-ec-tunnel.c just registers as a simple
driver.

Raul

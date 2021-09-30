Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F99D41D45A
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Sep 2021 09:17:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348646AbhI3HS7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Sep 2021 03:18:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348516AbhI3HS7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Sep 2021 03:18:59 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6F20C06161C
        for <linux-i2c@vger.kernel.org>; Thu, 30 Sep 2021 00:17:16 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id bd28so18194489edb.9
        for <linux-i2c@vger.kernel.org>; Thu, 30 Sep 2021 00:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=qJ/ajL0XPBH0mePIQVf+fjWOYAGb/vqwSUqSwxjSc5Y=;
        b=yJfmfqsf13s1blSAlBhi9+Cyp/LlyHLlGEGd+fkZcdSS9GHBfe/cmah5ymG32rH+9Z
         q9AFgptf/yAy2lmEiI2OrwjBd3e362cDvcX1w7E/eeHdhfSEmk16Rsw3+rUH4dWVyB8D
         vBu0gRYbCmPNRBHqRo/grOz5ywVEz37n4PWwCDWuj7vwCs1OZ2dlW/lwayHHgJok3ocQ
         1OcygxpcYeeW+gyB/cCKMhWJcVPohANpNPJKoxlnlul6sAa48AbcmcVs4MdRlIrSAyKp
         cxQmaTJ53jT0FcUbi4dEDZfViOs5lQTk8HXajfOmrs4czjsvaGcGawucZKCcyG/q//gj
         ibIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=qJ/ajL0XPBH0mePIQVf+fjWOYAGb/vqwSUqSwxjSc5Y=;
        b=UTlesAuJr0PgBI0/TL+pXpH/VTjFMEF0CS+6N3RBCPjcStfS078DYeBRmOnNMsi9Nz
         dqUHkXN6vm4vI7eSINrpGOQRxLaApcGQOW55SQ8/OwKpJO4407b+9ox0GDct2rSTE0do
         bTPGhot8sYUaIFRAYZvHN5ZGyQC1XG0ZEMUgRa3oMMYty3P3QHdWJY6bdfk0CKGAearT
         Th2Gka2SyAnJeqkZn4ZYn7Gs/EpS8PzHZKCvxdyJZLGBESnPgVugVQMFm49MZcwEyNsR
         +HtkOm65zpTC/tpw5xr8QlNgxrOz76FTskOHQ7/IDGkGB4nkF3vmDzrKgEfm8SH8DiqY
         mHsA==
X-Gm-Message-State: AOAM531LSA22gmZ1vLqiYgJtywJK4D/mqruTY/SOE7Vly/5MQgpj7MmG
        psq2GBksSswNHNh9CkLiu7eMrUgpyuJLrp2njPomng==
X-Google-Smtp-Source: ABdhPJyb1dxuWcF8p4K/cJ4IiqetxpAiuJwZn0iy4FU1Z3iyrMUiiwU8aFP/XtiUTFCOSjlIanihKFKWkvMaUTaCmfk=
X-Received: by 2002:a17:907:785a:: with SMTP id lb26mr4943268ejc.77.1632986235433;
 Thu, 30 Sep 2021 00:17:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210920072842.30889-1-brgl@bgdev.pl> <YVTUKgXTUVIFPDFw@kunai>
In-Reply-To: <YVTUKgXTUVIFPDFw@kunai>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 30 Sep 2021 09:17:04 +0200
Message-ID: <CAMRc=Me6=87JMc0=aN4=WQ+mrZKOrwYOvtcunC87pjF2EJeMFg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: update my email address
To:     Wolfram Sang <wsa@the-dreams.de>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 29, 2021 at 11:01 PM Wolfram Sang <wsa@the-dreams.de> wrote:
>
> On Mon, Sep 20, 2021 at 09:28:42AM +0200, Bartosz Golaszewski wrote:
> > My professional situation changes soon. Update my email address.
> >
> > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
>
> Shall I take this via I2C?
>

Hi Wolfram!

No need, thanks! I'll send it today with my GPIO PR.

Bart

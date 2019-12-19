Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C35AA125FFA
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2019 11:53:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726725AbfLSKxT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Dec 2019 05:53:19 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:41401 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726681AbfLSKxT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Dec 2019 05:53:19 -0500
Received: by mail-qt1-f195.google.com with SMTP id k40so4661154qtk.8
        for <linux-i2c@vger.kernel.org>; Thu, 19 Dec 2019 02:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IIuROUmiihU5/B8NCkUBw/bfwJUgV5QA6aHceLRcSgo=;
        b=Qk2ztRNJiaZYe5KTp+VkB2+m9oL1jp1wW7zAjyoHaFVvlYN4jQ/Q8FTRopN99xMIzT
         yLpTyqX1NGepLy5dU2nsZkDtQ1JO1T6hj8OEk3OhpBSng97yDWt2qw5Iw6p1G/CG6HGo
         xh4hHeGyQDl2bGMNMz1ZnpW+MBVcw6S59XqWaAEe2dnS0vc6W+t+WdTyiwndoNPOigNZ
         SivAAoG6f/iTyDZ4D9kNRLSuZQ/4NWH94VKETaDOB4RVHSJUrU5gG4WD+OIvWzbVoBzy
         g97zxEnhRIMjm7pj0RgqU+Et31Po9s3iE89+qZ7m9Ovgh223tZnrKZJpJkDAvq9y48Oz
         cQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IIuROUmiihU5/B8NCkUBw/bfwJUgV5QA6aHceLRcSgo=;
        b=dbYv5mlOoxsPNnXFmjRG4+etmHNhnsyRYyDSzNC7bSa9ygAT5X0PaMwaprGP5mgQaH
         xCFKqPFrwyGIdqXwFKc61yyyKc3Fyc6/9o4zfWuRU0ZDVS2/PuOydBGoO8l9u+ZqS6bg
         bI8fqVd1eqsM+7knAx32f+C6ndW8S8Thy7AQRstunM+X4P0dkBuPmWWDIX32FIE0MYLJ
         NHzQiv1EAcZo6WgWvUbAci9bNS9pS9lrCzu2z+qXPVk2VuH3+aVzY0P4k5R8FEi3FDW/
         pvAtERbc+4ISHdNI10wJR8P6uROPcHVhWGyEVlJqp+z6tUqIrZn4xXcTehzo+tRtnNXb
         VxMw==
X-Gm-Message-State: APjAAAUnX5aLQ3OIdnsKufssQW1Ri3ZC+Y3JSykgw/URG8UIvFdLELDb
        eogbjtm37w7uA6ogAA8QzF7fyMp2LBngb9Oz/f/DDg==
X-Google-Smtp-Source: APXvYqwuOZ8jOwab1DPiMEfvgPdn8LVbmJvxmNOywr9VbwLO6NhzWQA0IvMtiPi6RS1ZunYqPuMm710wLMboY4QBOvk=
X-Received: by 2002:ac8:704:: with SMTP id g4mr6314518qth.197.1576752798327;
 Thu, 19 Dec 2019 02:53:18 -0800 (PST)
MIME-Version: 1.0
References: <20191210154157.21930-1-ktouil@baylibre.com> <cd9f342c-5576-57f5-c62d-a78c5876a7fd@linaro.org>
In-Reply-To: <cd9f342c-5576-57f5-c62d-a78c5876a7fd@linaro.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 19 Dec 2019 11:53:07 +0100
Message-ID: <CAMpxmJUM2WWyJyU0MuOu9qObPFr2ghH5LHs8DXo_poMwtZqPNA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] at24: move write-protect pin handling to nvmem core
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Khouloud Touil <ktouil@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        baylibre-upstreaming@groups.io,
        LKML <linux-kernel@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

czw., 19 gru 2019 o 11:51 Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> napisa=C5=82(a):
>
>
>
> On 10/12/2019 15:41, Khouloud Touil wrote:
> > The write-protect pin handling looks like a standard property that
> > could benefit other users if available in the core nvmem framework.
> >
> > Instead of modifying all the drivers to check this pin, make the
> > nvmem subsystem check if the write-protect GPIO being passed
> > through the nvmem_config or defined in the device tree and pull it
> > low whenever writing to the memory.
> >
> > This patchset:
> >
> > - adds support for the write-protect pin split into two parts.
> > The first patch modifies modifies the relevant binding document,
> > while the second modifies the nvmem code to pull the write-protect
> > GPIO low (if present) during write operations.
> >
> > - removes support for the write-protect pin split into two parts.
> > The first patch modifies the relevant binding document to remove
> > the wp-gpio, while the second removes the relevant code in the
> > at24 driver.
> >
> > Changes since v1:
> > -Add an explenation on how the wp-gpios works
> > -keep reference to the wp-gpios in the at24 binding
> >
> > Khouloud Touil (4):
> >    dt-bindings: nvmem: new optional property write-protect-gpios
> >    nvmem: add support for the write-protect pin
> >    dt-bindings: at24: remove the optional property write-protect-gpios
> >    eeprom: at24: remove the write-protect pin support
> >
>
> Thanks Khouloud for this patchset,
>
> I can take this via nvmem tree once we get an ack on dt bindings from DT
> maintainers.
>

Hi Srinivas,

this will conflict with my at24 tree for this release - can you put
those patches (once they're fine) into an immutable branch for me to
merge in?

Bart

>
> --srini
> >   .../devicetree/bindings/eeprom/at24.yaml      |  6 +-----
> >   .../devicetree/bindings/nvmem/nvmem.yaml      |  9 +++++++++
> >   drivers/misc/eeprom/at24.c                    |  9 ---------
> >   drivers/nvmem/core.c                          | 19 +++++++++++++++++-=
-
> >   drivers/nvmem/nvmem.h                         |  2 ++
> >   include/linux/nvmem-provider.h                |  3 +++
> >   6 files changed, 32 insertions(+), 16 deletions(-)
> >

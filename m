Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE671BD5A7
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2019 02:01:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392540AbfIYABT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Sep 2019 20:01:19 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42517 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389588AbfIYABT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Sep 2019 20:01:19 -0400
Received: by mail-lj1-f194.google.com with SMTP id y23so3693664lje.9
        for <linux-i2c@vger.kernel.org>; Tue, 24 Sep 2019 17:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=++qndXxQzk8QL7IV0eU1iWhcJ9dy+lGYkj8qx8Wm+tA=;
        b=b5yrqjyPSrb9d7vVYvfXzo7GJ/ogJAqMywZdTGzH9H0mcbCVu1toedqiNQjiDQlo/m
         Vh45x8MMdIXBXq0Oc3i15on95S7ixogPZMZQdlx4/BxEkjT5ueaJKfbQ2ORCv4h0EJng
         JyEw0v1uhgFQjxEiZb0vWjKt1fS8yJOtAXUvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=++qndXxQzk8QL7IV0eU1iWhcJ9dy+lGYkj8qx8Wm+tA=;
        b=gIyvOs4M5fmHNVxT0lOMLgn6kg+EPDA1k+kWuFViLuhIsSTkGwRNmIJLzhf/jFY9uv
         4Wa84rGfA1/aeWm0tZxHkWEQzxPiHhG6qYskU9ywuPj+90H58FAH/Tae6txwt67D183F
         vJU9luBToW6/xNNdvHAeq9fb00FwnEaf/PG8Qxb19Ly87uNtoDRiHtbg51tIn9YFKO2y
         GVIrrwe/6O5FwuYmvTJG7d4eC22ECdoUgG/dTUM738DI6LhHJzkDtRN7NBa8AyKJtJgp
         aQAkw/LhcFNltSpnGZak2DKfKTRB7+LH5HVlJEjl4qBNj8qyoChZdAGg7Y3epMNdjIBO
         SNTg==
X-Gm-Message-State: APjAAAUnQOpqEv231FotZhOi3qTexKR86qClYew73B11UFxYuclHNSp9
        Y2sfCTbw0XEo3XA2haQA473Y3tP8uMU=
X-Google-Smtp-Source: APXvYqyUAsh9zhBGeR+7JDRSMbMbY5R8sAmc6W8l6xjR6tV0vcFetm3lTJI39tHMb9hKZGsAAccS5g==
X-Received: by 2002:a2e:7c17:: with SMTP id x23mr3695752ljc.210.1569369677074;
        Tue, 24 Sep 2019 17:01:17 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 25sm847173lje.58.2019.09.24.17.01.15
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2019 17:01:16 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id e17so3677302ljf.13
        for <linux-i2c@vger.kernel.org>; Tue, 24 Sep 2019 17:01:15 -0700 (PDT)
X-Received: by 2002:a2e:5b9a:: with SMTP id m26mr3694229lje.90.1569369675432;
 Tue, 24 Sep 2019 17:01:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190924193054.GA2215@kunai>
In-Reply-To: <20190924193054.GA2215@kunai>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 24 Sep 2019 17:00:59 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi1WroG_uZ44au_KdEcujkCvcwz+d05EDR_=6vHb8xQaw@mail.gmail.com>
Message-ID: <CAHk-=wi1WroG_uZ44au_KdEcujkCvcwz+d05EDR_=6vHb8xQaw@mail.gmail.com>
Subject: Re: [PULL REQUEST] i2c for 5.4
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Sep 24, 2019 at 12:31 PM Wolfram Sang <wsa@the-dreams.de> wrote:
>
> - new driver for ICY, an Amiga Zorro card :)

Christ. Will that thing _never_ die?

But the reason I'm actually replying is not to comment on the apparent
death-defying Amiga hardware scene, but to point out that you should
try to fix your email configuration:

> Bj??rn Ard?? (2):
>       i2c-eeprom_slave: Add support for more eeprom models
>       i2c: slave-eeprom: Add comment about address handling

This is all fine in the git repo, being proper utf-8 "Bj=C3=B6rn Ard=C3=B6"=
.

But your mutt setup doesn't seem to be using a proper utf-8 locale and
instead uses

  Content-Type: text/plain; charset=3Dus-ascii
  Content-Disposition: inline

like it was the last century.

I don't know what the proper mutt incantation is to make it join the
modern world, but I'm sure one exists, and then your emails would get
names right too. Even if they are some funky Swedish ones with =C3=A5=C3=A4=
=C3=B6.

(And no, don't use Latin1 - it may cover Swedish and German etc, but
you really want to go with proper utf-8 and be able to handle true
complex character sets, not just the Western European ones).

            Linus

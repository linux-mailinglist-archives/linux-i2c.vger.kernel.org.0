Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D30422BED
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2019 08:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730696AbfETGOe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 May 2019 02:14:34 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:41815 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbfETGOe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 May 2019 02:14:34 -0400
Received: by mail-oi1-f193.google.com with SMTP id y10so9103798oia.8
        for <linux-i2c@vger.kernel.org>; Sun, 19 May 2019 23:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CV65XuoVfWbORLC3QwcYmvS9+lxjCJ2sZGYpo27bAno=;
        b=HueEfz4Z/zw++PW9pR3nsrU/CWPyaFlVR6fCdgfSxL5+jcK7lO95ZWKdm/C4QVxD6v
         EJue1bc7GmXSymsaCMYnpK1tCUeYboF6ZLhqGFkCJZBFTroUWnBy3p5CWA33wDjOOmx5
         6KlUrmx80lOh+8cToVCypfVoWu4CK6Yuz5zC/CNhedkRNAQBAgHEefETQ9EuKml6dKgA
         mB9k7zFhXgCgstTbbkOS5iZgu4HZ9zTune/mPZ1jMBoNFafEzOLHMfUL10uzQgDdniFi
         ZsOgtE6VHc84rjwzkj5z5G0vbnmxxARGKthtWQf4Iveb46/QShcHDVloXo54eqIF+9fh
         XLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CV65XuoVfWbORLC3QwcYmvS9+lxjCJ2sZGYpo27bAno=;
        b=ex2XyYU6qh+1mWm63S4WPRZ4PbredrbJko9+Rfej9BXxIWhjFhPddS3q/NHb5XxFF4
         odJLgOmD/xslWVrGc7hxLxEd6hZnNaMtxPJ6P2g9bT80b9V4L/9GLDm/KDgJ0GzwOH/W
         UM7+GV1jwZnkUZNW4nflxfwKYnWorKg/Zsug+3JYgZFkdEYSfNSYC0htkINlmur7lqqE
         77wazEOwITP/Pan1yO7VqfWLMYEtz2SO9/Z1x27F035oaxnjDWEd+yHNKIZ7namD5Tmb
         pnpumDp7fgP7nEVbIshjxkwMMmR9/7alwrOUy6icj3ldfHL53NoFyf19JiEIsojz4a95
         LjpQ==
X-Gm-Message-State: APjAAAV4dHtH/UQGdTSOX2IA/h+smyal5XRYlDQe4/iM3L+zOocSy0vf
        LImUyXG+/JJr0UVw3AF6Duehh1vs26W7UO0zm6BhIA==
X-Google-Smtp-Source: APXvYqxbOWPOYc25RZ36r6MymGsjn39y3QN/YIPqJ/vvjkpawijs2NHIawt73y9OXcjn81v92e3BJacv4Ascn8W1fUA=
X-Received: by 2002:aca:5704:: with SMTP id l4mr21921526oib.21.1558332873902;
 Sun, 19 May 2019 23:14:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190519204012.31861-1-brgl@bgdev.pl> <20190519204012.31861-2-brgl@bgdev.pl>
 <20190519205235.GA19630@kunai>
In-Reply-To: <20190519205235.GA19630@kunai>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 20 May 2019 08:14:23 +0200
Message-ID: <CAMpxmJW=T_hZAkyhsE+Wi7qhJBE2bviNfaGCJJta0s8g85+9Pg@mail.gmail.com>
Subject: Re: [PATCH 1/2] eeprom: at24: use devm_i2c_new_dummy_device()
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

niedz., 19 maj 2019 o 22:52 Wolfram Sang <wsa@the-dreams.de> napisa=C5=82(a=
):
>
>
> > Now that it's upstream, use the resource managed version
> > of i2c_new_dummy().
>
> That was fast :)
>
> > -     dummy_client =3D i2c_new_dummy(base_client->adapter,
> > -                                  base_client->addr + index);
> > +     dummy_client =3D devm_i2c_new_dummy_device(dev, base_client->adap=
ter,
> > +                                              base_client->addr + inde=
x);
> >       if (!dummy_client) {
>
> Oh well, the confusion starts already :/ devm_i2c_new_dummy_device()
> returns an ERR_PTR.
>

Ugh, sorry for that, especially since I followed the discussion on
that series. :(

I should not be sending out patches late on Sundays I guess.

Bart

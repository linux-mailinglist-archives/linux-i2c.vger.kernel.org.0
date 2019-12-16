Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 126CA120346
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2019 12:04:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727629AbfLPLDz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Dec 2019 06:03:55 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:37874 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727619AbfLPLDz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Dec 2019 06:03:55 -0500
Received: by mail-qt1-f195.google.com with SMTP id w47so5445973qtk.4
        for <linux-i2c@vger.kernel.org>; Mon, 16 Dec 2019 03:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KyT8iX33k7sFRkYd4RU7rY84Ij+yNZq0ApEE/O2fu+4=;
        b=c+nMPYIjLlikLb2ZpmWU4U9s9hyYGvdF3o6ckh0KkdQWhoWxbaPpDXJjUfQoEjL4hs
         JiqsWAkvw7+QhnYVC6Hm589MhvP5vdsHr/5C7CCmG19vVxIFQ8vQOct17sSzVFBr+E9w
         WFZ53+XrUR+uIO3iN0ibxCexTTT377SJSCEV3v8jLXqTN1pJmxZz6+r8cnSemfqwTKtg
         lN8RVRkPGWkVjY9s7IVZsYQfZ6VNmu+6leKlecJSTaLumd7U5JjtK1V1VzQIyZpbPQE1
         9hXv3CvWDoV2MBW6kEiIztHmOeAZWFr6dl7BYg39nXpZM9umvUJBAdNswAK4F/Jp0GIj
         GNhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KyT8iX33k7sFRkYd4RU7rY84Ij+yNZq0ApEE/O2fu+4=;
        b=D/oyMi0cvllFvTR3WVdCPE1zLbUusJ6MIBtsnqjBKx4kpxUNup5OKLAzixNdd3sMBZ
         ZrLdi9qO6WsHdmUiAWABejMjumHVaCwCFc5EHNFMtroBgHVEtkaipU+tG8aaoqUtps4q
         AuTk3yxxtydaEdtU36QHOUtTdz+je7LQtddXvnQl+ynXDc1AbeYdubQi2RK1AABSqSSe
         d685cJa5EyFu2EqUwK1lvxoJ7iixaLm53P74aUtK1SF5SR4iogeLCli+ZXf8zMn9pUe7
         N0iEB7Yg7us+rSDl0vkeOApC/OqEizsTXek4OZgxtI3uoeS/F15PqinzeSFqm6oRVmwq
         8yQw==
X-Gm-Message-State: APjAAAUvHAQZDq5djGwZ4hdjvMs9fw+5BWXqxcRVFUh3nx6fa35Gr9C0
        QDbTvJyFK+7qOtoVbfnHsiIJeZvLFyuQSLjnUbeH4g==
X-Google-Smtp-Source: APXvYqzw6JZzysee+REdRGrquVmuOvAlaSakT5VJ1hcbEefqMpv5n487ZNnV9cdF1eId5+6AYmJ11V8kLlSsj2qNIv0=
X-Received: by 2002:ac8:5208:: with SMTP id r8mr23685802qtn.131.1576494234130;
 Mon, 16 Dec 2019 03:03:54 -0800 (PST)
MIME-Version: 1.0
References: <20191210154157.21930-1-ktouil@baylibre.com> <20191210154157.21930-5-ktouil@baylibre.com>
 <CACRpkdbHLv2R+XvCjCaEgaztUqpmHWCmSAqHABkkstJREkmfVw@mail.gmail.com>
In-Reply-To: <CACRpkdbHLv2R+XvCjCaEgaztUqpmHWCmSAqHABkkstJREkmfVw@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 16 Dec 2019 12:03:42 +0100
Message-ID: <CAMpxmJWGRskDudwLpzVZKvYb=Gbcxy6s0gCLUUFkgLq-CYEiZg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] eeprom: at24: remove the write-protect pin support
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Khouloud Touil <ktouil@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        baylibre-upstreaming@groups.io,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

pon., 16 gru 2019 o 09:13 Linus Walleij <linus.walleij@linaro.org> napisa=
=C5=82(a):
>
> On Tue, Dec 10, 2019 at 4:42 PM Khouloud Touil <ktouil@baylibre.com> wrot=
e:
>
> > NVMEM framework is an interface for the at24 EEPROMs as well as for
> > other drivers, instead of passing the wp-gpios over the different
> > drivers each time, it would be better to pass it over the NVMEM
> > subsystem once and for all.
> >
> > Removing the support for the write-protect pin after adding it to the
> > NVMEM subsystem.
> >
> > Signed-off-by: Khouloud Touil <ktouil@baylibre.com>
>
> I wonder if this needs to be in the same patch that adds it to
> the NVMEM subsystem, so as to avoid both code paths being
> taken between the two patches (bisectability..)
>
> However that is not the biggest thing in the universe and I'm
> no bisectability-perfectionist, so:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Yours,
> Linus Walleij

AFAIK Khouloud tested it and it's bisectable thanks to using the
optional gpiod_get() variant.

Best regards,
Bartosz Golaszewski

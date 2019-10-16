Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C349D8B33
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2019 10:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391645AbfJPIkU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Oct 2019 04:40:20 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:35880 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389897AbfJPIkT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Oct 2019 04:40:19 -0400
Received: by mail-oi1-f196.google.com with SMTP id k20so19331267oih.3
        for <linux-i2c@vger.kernel.org>; Wed, 16 Oct 2019 01:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=r6Gil0nV1oJlSHhPc8F9mMAK15KjeTWA4dUOWUcVhrM=;
        b=do2vvA8WtatqVlG+eQenz0+AlOmiqZ7N7XRO1ruvISfeyW8O0r3Q7REKkjXdfnHs4Q
         /s0Qolk+yNepA2krhz/dBjXydRi9kLc1KIC7vu+rrHHuobAgmYxczG908pbUqNM15czH
         sBvecNnzmtcd6QuncFCOB+0laahrSg+6I59tqxU/WYYb7iPZpWxo01KJiSRAOZ4cOvV/
         uC4c2zXRMjD4rgE04+kP++GbodfIWLSulU6eoZqb/fSaeSMg5g+zUpqiZ08OUfb6oiF7
         4WjPtEN3rJhdA9JD39bMx/j/rVvmbCmy+pGa+ekO2hojfn2UiHrI09abVYMuLSDnpwwm
         tk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=r6Gil0nV1oJlSHhPc8F9mMAK15KjeTWA4dUOWUcVhrM=;
        b=cWGfnONsHLn9HG4I9nnn5HsScUIzLS0OCDsTqetXWJpRAgKyStbG2ZdDp8wfdzn0O7
         omzE0C8Mil5lsZ5XOcUghkLxHncC1LtaA9RLbA0ZCr6KknppGVYFwHxEOpaNQ6JLinc9
         QLADVIKbz8FQU9UkdE351DjNIlUO4hKrTjUfsyunTneDA/Cfsp4Wh4eAdPICM9LtrcD6
         9au/6oulwHscXmB6/SvNi7bGa1pBGuVvuVXvcuz/CADOKeabKGFN5sudJ0beMM866x6a
         Xx9yzz7xFOJKqKnh9Kf0ps5VqRvMIwE3L6n9ooH8mVwFW3QLXbNlKL64nIitxDnOtJET
         YD7w==
X-Gm-Message-State: APjAAAWyaMIX6bG5yrJQwApEtW28ffLD6NJXweMRVzqkpJ3k0ZIIZX4D
        y7gElJQ2TeQONY2bwwXK9+opkZ6/o2Jbla9LIc1C3A==
X-Google-Smtp-Source: APXvYqxdnjfmifOIHa0R3ggacAc4Q+59Qoeu943dwI/Wb8XKTPXGrysFVnRpa+YhtyCQ44DEc7y6+uzy8n9QT/jf+Pc=
X-Received: by 2002:aca:4584:: with SMTP id s126mr2443772oia.21.1571215217337;
 Wed, 16 Oct 2019 01:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <20191016075110.8240-1-bibby.hsieh@mediatek.com> <20191016075110.8240-2-bibby.hsieh@mediatek.com>
In-Reply-To: <20191016075110.8240-2-bibby.hsieh@mediatek.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 16 Oct 2019 10:40:06 +0200
Message-ID: <CAMpxmJWiSaXiPeDFOZvx5krp31wJmMuRM4iV-O6fHqBN_nQz7g@mail.gmail.com>
Subject: Re: [PATCH v1] dt-binding: eeprom: at24: add supply properties
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

=C5=9Br., 16 pa=C5=BA 2019 o 09:51 Bibby Hsieh <bibby.hsieh@mediatek.com> n=
apisa=C5=82(a):
>
> In some platforms, they disable the power-supply of eeprom
> and i2c due to power consumption reduction.
>
> This patch add two supply properties: power-supply, i2c-supply.
>
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.txt | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/eeprom/at24.txt b/Document=
ation/devicetree/bindings/eeprom/at24.txt
> index 22aead844d0f..71a534577bcf 100644
> --- a/Documentation/devicetree/bindings/eeprom/at24.txt
> +++ b/Documentation/devicetree/bindings/eeprom/at24.txt
> @@ -78,6 +78,10 @@ Optional properties:
>
>    - num-addresses: total number of i2c slave addresses this device takes
>
> +  - power-supply: phandle of the regulator that provides the supply volt=
age.

The pin is called vcc in the datasheet, I think it would be better to
reflect that here.

Bart

> +
> +  - i2c-supply: phandle to the regulator that provides power to i2c.
> +
>  Example:
>
>  eeprom@52 {
> --
> 2.18.0
>

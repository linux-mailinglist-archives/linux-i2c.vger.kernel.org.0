Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5895011FF68
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2019 09:08:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbfLPII3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Dec 2019 03:08:29 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:35034 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726664AbfLPII3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Dec 2019 03:08:29 -0500
Received: by mail-ua1-f66.google.com with SMTP id y23so1770462ual.2
        for <linux-i2c@vger.kernel.org>; Mon, 16 Dec 2019 00:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q6wmtqrWytSgVVPaG+tJiiZU+H7YE7GNP+DoOxtH1VI=;
        b=Q5x+BktaOm2b3vqBHMvP5gzjjoxagKJ79ZZToE4NJrZ47jD69ofO1gQcxdrv3AgM+1
         4OaRDkeeLIr3Qcnzc+ndcMDhKYlIx7NFEDP+nr09xZo+x6EH1CjzS+Gk8yewKOxcXour
         fgsEnvJqJ5ymbKxwAdF9OuuMDz6Za6gzyXqPzxyM/TgAyX4v8M6WRbEbiZVPzGSvmSl2
         w84dXiQJjoT5pZ5r/sxd4bgs1WgI8vTIws4k5w+VAFSZmAyrIanEcKNjEJiraO9TFO8f
         HB3tbj/39d1t/rlYDtNIpWRDpcWcWIG1lsiCQXaOj/XHJcATVvQv8jCdMp1hPNXZM9A2
         8H5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q6wmtqrWytSgVVPaG+tJiiZU+H7YE7GNP+DoOxtH1VI=;
        b=cj+xC1gk5+seUMtTS5JJEvR30LZ6p+SGZdlXVe4TXHv3nIajvj1IS9AB+EOuqHyANO
         iAvDpJ56h5Jicxl4Y/8sKn9JhFZqrqZhbn2aoDUfwePvrhDo9rwo7pInD3g9BVhFOz/P
         xI3pdaLKgVqENOKxblWXsovpSsQkU9VIsAG17XJqcxiRDzG4jzsubYfRExZ2pUCPYl6w
         MTl5ZZ9rYiGbPsxyg5oI+kyxyySpkpTLENvUouUjoi5eY8Cs4OKygxEArR/Fb2UPaIRr
         8xnjKcuKbkb9an5r/JMKHqH2hBMdyhPYGBvlYkVPzUIQAO3+xHS4owwZ9d0Q+G/e3IwU
         E0uQ==
X-Gm-Message-State: APjAAAVWlyD84bdHqtkyUPeiQ2tzNREeQxQVSXEvFns4+UprIwfc9u+n
        /cHo6bitp8gMBstXXuikFrJaF8vStBgubGPfLYMkBA==
X-Google-Smtp-Source: APXvYqwTmNQL9yAF4ysRmXvFWucNUjVzF64EIGjJntMayVn5WjwCpACT1hjuTxdjff5Z5fVgnzInp5q0Ayr6YWbMa9w=
X-Received: by 2002:ab0:2716:: with SMTP id s22mr22593797uao.20.1576483708557;
 Mon, 16 Dec 2019 00:08:28 -0800 (PST)
MIME-Version: 1.0
References: <20191210154157.21930-1-ktouil@baylibre.com> <20191210154157.21930-2-ktouil@baylibre.com>
In-Reply-To: <20191210154157.21930-2-ktouil@baylibre.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Dec 2019 09:08:17 +0100
Message-ID: <CACRpkdZb6OppcdCcaQ9abdkDJMk4escyyEm1TMB75rRxoN5e2A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: nvmem: new optional property write-protect-gpios
To:     Khouloud Touil <ktouil@baylibre.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        baylibre-upstreaming@groups.io,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 10, 2019 at 4:42 PM Khouloud Touil <ktouil@baylibre.com> wrote:

> +  wp-gpios:
> +    description:
> +      GPIO to which the write-protect pin of the chip is connected.
> +      The write-protect GPIO is asserted, when it's driven high
> +      (logical '1') to block the write operation. It's deasserted,
> +      when it's driven low (logical '0') to allow writing.
> +    maxItems: 1

OK I guess we can't get it less convoluted. This section is consistent.

>  patternProperties:
>    "^.*@[0-9a-f]+$":
>      type: object
> @@ -66,6 +74,7 @@ examples:
>        qfprom: eeprom@700000 {
>            #address-cells = <1>;
>            #size-cells = <1>;
> +          wp-gpios = <&gpio1 3 0>;

In the example please use the include for GPIO:

#include <dt-bindings/gpio/gpio.h>

wp-gpios = <&gpio1 3 GPIO_ACTIVE_HIGH>;

You can just put the #include directive right before the
example, it should work fine.

Yours,
Linus Walleij

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB2D8135620
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2020 10:48:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729493AbgAIJsI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jan 2020 04:48:08 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:43777 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729825AbgAIJsH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Jan 2020 04:48:07 -0500
Received: by mail-qk1-f195.google.com with SMTP id t129so5357798qke.10
        for <linux-i2c@vger.kernel.org>; Thu, 09 Jan 2020 01:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kFt5sINwCshN7f9XPeO36FD74hM2+ZVDRrYbGF8loWg=;
        b=MC9xf9MeaTGS0ORWl9iQ4wapynYiCn/Ktx+vvFlfK7odU2KpzoA3/BD2X7r+BBwEUj
         AJ+a/oeCIJjWrmW+5Jkmq9Yz9BZKT3Bmjjfzm56uBKhiMmmYCEBALZMqSORH3orOG9Qe
         TAgbPzK5lBIgc+Er5fKe809mLb5nhY4ThWFYcg73GSGOAZbFnxeBRDy1jP/4ew9PsA3N
         K5n2c3kN97ulvkzH79saWCh2c62itzxld2703wwno5bBSesTGCIUGJHKceWczsTpMIz1
         GFHWXdjGPtiqukwIyrP4OipPnI1rXSeO7ZUlKGAtio6wR4aDkXYfl3sLVndplD62fp2K
         TjWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kFt5sINwCshN7f9XPeO36FD74hM2+ZVDRrYbGF8loWg=;
        b=jBcSlyMcrWcc4re15+RruS2QcctUr28jwVeeImgd+pqPH5snh3AIozsitVFK+PICRB
         rN7OMLpkrYLKMPdGJbhtDCPBG7OppW3a7pg8LGKx3JdszmKZ6Mr7QvxG453uYACXiM2z
         wstYnvwtWt0an7rdJIy1SvgL9DQNSv7smUHQLYIHeefs+b7Pjajq7z6Q+g6lF8NiJbug
         eSC6huHvLM5VvMzM3HaAuKCv/yydIApdMSkRvX+7uGk+LcLrxiDBX/Bz+Su7PsUpwGve
         oOBBo/O7QVmjsDn4Nt3ylBsY9xAwFUMYM/Q8CsMnkuKjSheLSjpn4PHoeCJGg6mK47Gw
         D08A==
X-Gm-Message-State: APjAAAW5A7P0nDJ51Vdl393l2JLMGSBe369HDkbbZjEZa6mcuc19J9OJ
        PnkYfO48Gwa/hhlqedHcnyKr+NWAmKT78Qr5/hNC9h/4
X-Google-Smtp-Source: APXvYqwtJLDiExkWMnInqbVktQr9vDV/d5lmAhlTP7G0mBpb6RfrkdSR6eG91YtmQ+x9YK8qMe3vwS9aE/HYkSbCbkg=
X-Received: by 2002:a05:620a:12cf:: with SMTP id e15mr8766111qkl.120.1578563287029;
 Thu, 09 Jan 2020 01:48:07 -0800 (PST)
MIME-Version: 1.0
References: <20200107092922.18408-1-ktouil@baylibre.com> <20200107092922.18408-5-ktouil@baylibre.com>
 <20200108205447.GA16981@bogus>
In-Reply-To: <20200108205447.GA16981@bogus>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 9 Jan 2020 10:47:56 +0100
Message-ID: <CAMpxmJXffr-S51udNmUyMHz687jAoBKrYspNypfUUqjOD45zxQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] dt-bindings: at25: add reference for the wp-gpios property
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        baylibre-upstreaming@groups.io,
        LKML <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

=C5=9Br., 8 sty 2020 o 21:54 Rob Herring <robh@kernel.org> napisa=C5=82(a):
>
> On Tue,  7 Jan 2020 10:29:21 +0100, Khouloud Touil wrote:
> > As the at25 uses the NVMEM subsystem, and the property is now being
> > handled, adding reference for it in the device tree binding document,
> > which allows to specify the GPIO line to which the write-protect pin
> > is connected.
> >
> > Signed-off-by: Khouloud Touil <ktouil@baylibre.com>
> > ---
> >  Documentation/devicetree/bindings/eeprom/at25.txt | 2 ++
> >  1 file changed, 2 insertions(+)
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Hi Greg,

AT25 patches usually go through the char-misc tree. In this case
however, the change depends on the other patches in this series. Can
you ack this and I'll take it through the AT24 tree exceptionally?

Best regards,
Bartosz Golaszewski

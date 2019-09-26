Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C8B2BF32E
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2019 14:42:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726668AbfIZMmO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Sep 2019 08:42:14 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41558 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726666AbfIZMmO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Sep 2019 08:42:14 -0400
Received: by mail-oi1-f196.google.com with SMTP id w17so1917165oiw.8;
        Thu, 26 Sep 2019 05:42:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AL8G4GaFXXe+EdF1qCUjEYm77B3nhKXRxYcSGeOKIsg=;
        b=al57q/gly2kYnNT680p3iThuFzqbD3gePoCJdvg8sDA0w9fNZ+ssT3/bTeiUEkMJFd
         R0GzCfGiis9IYYkU3ri9Osa3LnqjUGVilFnnmZ3u0R8u+6xS9QbcNER8W1YAm+TIBs7R
         EomsuPuV05vs9O4bZp5KK+nG2opjjWAE8TXoj5mdBpdxU/ED5ezQ3+gRSV6KTIK87/Zz
         eJ31PhwYFM6niYonsgukJdPk4Pwsza5E5whv3O07rqa+5hi1waGM6ogI03nmKQrIucMK
         Eg+C5OXB92ooE/ZvYtASq3Aq9KJPzcOinZK31MzEmPdZjwTCW3UtqVjgcjhiDwaaD5vW
         oWNA==
X-Gm-Message-State: APjAAAVFH898cFE5pCOziUC15S2SiqLdfpBq4eCMG2Qq6NyDA5SKJHa/
        GtFWWlDmzLPGpCxKG07iBfD73oeiK9vjbc2/9Rs=
X-Google-Smtp-Source: APXvYqzsM86yclJ1iukNRZU2cRT0LTl7JSApiE3Oce2aFIWS1x893458nDWFV/G/pbY1c95M28hW2993LfF1WXJrExE=
X-Received: by 2002:aca:b654:: with SMTP id g81mr2318394oif.153.1569501733175;
 Thu, 26 Sep 2019 05:42:13 -0700 (PDT)
MIME-Version: 1.0
References: <1569310377-24976-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1569310377-24976-1-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Sep 2019 14:42:02 +0200
Message-ID: <CAMuHMdXp_u-w9DMbmBZn3G99LexLuQyBR2hRA_0T8Wn130SsZg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: i2c: rcar: Add r8a774b1 support
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Sep 24, 2019 at 9:33 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Document RZ/G2N (R8A774B1) I2C compatibility with the relevant driver
> dt-bindings.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

>  Documentation/devicetree/bindings/i2c/i2c-rcar.txt | 1 +

BTW, this file has been renamed to
Documentation/devicetree/bindings/i2c/renesas,i2c.txt

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

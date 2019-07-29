Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9A778AD3
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jul 2019 13:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387810AbfG2Lqf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Jul 2019 07:46:35 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34292 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387638AbfG2Lqe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Jul 2019 07:46:34 -0400
Received: by mail-wr1-f66.google.com with SMTP id 31so61534814wrm.1;
        Mon, 29 Jul 2019 04:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vOK6hAPIyKIN5T25qCKZRpxZVqNpHvJX+jJCmKFHS6c=;
        b=bAYwW1kC/6XYCm6elvtD+sWeTVSw8JFBJRHe9fD3nun3J1BQSOjPZ3lmR8Y60Q5+7m
         sRCPUi8aHkFP4lC8d+A6s/A+LfF3T1iEgcVdnmTaB3eVAb5hHf+NL7EWrDgQ9m2NvbIH
         qouhwNPiw5rzmUJmkYPfnQnbYJWNGFKhPUw/+/bDmb1CyHrX6yUfHPtWVRC1+8UNqfFu
         seJdxGR1p8l0iZ/aGBcq8fLGsT/QFH6wgwaKIQfLVY/uG9XGQA5FzPLsEKiAe+U2b14f
         3Ezqi/5tAG/qK4194enBDSbGMkMu71Ev08MDTUG6QpFGWsMEcAv6lFOIYVMY8qdC+Qm5
         FGoA==
X-Gm-Message-State: APjAAAVeyF/8uPgcK4mxd1tL53gADPsqhc88zhQrDZf/MW13kW5LddZ2
        b99NPQS5KCLkFPZduIUUXzeYPIwUu6+/swtCpqvF6add
X-Google-Smtp-Source: APXvYqysJniGorIJj1c+0IqS832w1usN1p5zURvg9QGJ0cqow67I5PdsrZn6SaxSvxGiJOFk+K+LujNwcHJfcBAKE+k=
X-Received: by 2002:a5d:630c:: with SMTP id i12mr32357257wru.312.1564400792794;
 Mon, 29 Jul 2019 04:46:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190724121559.19079-1-horms+renesas@verge.net.au> <20190724121559.19079-5-horms+renesas@verge.net.au>
In-Reply-To: <20190724121559.19079-5-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 29 Jul 2019 13:46:21 +0200
Message-ID: <CAMuHMdV1kzOajwZXCkU-=bX1PW4=OUq3wZwbFRAUZuOWWwo=_w@mail.gmail.com>
Subject: Re: [PATCH 4/4] dt-bindings: i2c: riic: Rename bindings documentation file
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Simon,

The subject line is identical to the one for PATCH 3/4.
Probably you intended s/riic/iic-emev2/?

On Wed, Jul 24, 2019 at 3:25 PM Simon Horman <horms+renesas@verge.net.au> wrote:
>
> Rename the bindings documentation file for Renesas EMEV2 IIC controller
> from i2c-emev2.txt to renesas,iic-emev2.txt.
>
> This is part of an ongoing effort to name bindings documentation files for
> Renesas IP blocks consistently, in line with the compat strings they
> document.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

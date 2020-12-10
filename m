Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 553162D5C07
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Dec 2020 14:39:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389475AbgLJNf6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Dec 2020 08:35:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389316AbgLJNf5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Dec 2020 08:35:57 -0500
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com [IPv6:2607:f8b0:4864:20::b44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CFC6C0617A7;
        Thu, 10 Dec 2020 05:35:04 -0800 (PST)
Received: by mail-yb1-xb44.google.com with SMTP id w139so4722883ybe.4;
        Thu, 10 Dec 2020 05:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PruGUtDJdsgm777wkWNoe3vOXDaPQKYGDAojPXnGM3g=;
        b=qr+ZqQ2F4EZQfgdy8K+Kqs+ju2va5nhDTYEtOvAiGmiJX2+U4h7E0rqdX/PQIbTGh+
         CaNBjYsEAXvrBdvcJyqNLGW4vI71xB9Nunla2/S8Xyg076OROcaxIxeqZTo87P3ZrpEK
         Tpyw6ehpSlxTCxW21MgYgUT/F7qeRYG8LkRURerN8L1ZKKDe4UG5A5J53BhFNdTcPG/Y
         CJlzYxOG+uJgGNDy4V8xNEcrr5hALBb9Ini1MUiJq1CqsUQiqthZCmUX5zIc5YHmI0Qy
         OVaNLCOIWBxSV2WCJM383Thx15WG8Z/Tf8K5+nJcmuQC/qSm75GCDSEV190GMIGubzD8
         TUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PruGUtDJdsgm777wkWNoe3vOXDaPQKYGDAojPXnGM3g=;
        b=o2HBbi4xX3Y5yk2R+abvPTSG7UZlSTneSQfqO6Zi6+sJgwbHUMC789NCTtJFgzDd37
         gqO2ZERGrjRc9CMN3cjYpoLE9ptRkDfhecuck/r9Qyyh678W1MajE8tTwsCSby9EPiVy
         UgowOiDSHq9wLtv9LZzJgxL/kEo+8uihoBlYixhEr20g38ZyBhkP1d4NjYXMPvB/4cAd
         Lf2o/DHF3s882Wgr+JxrihdB4M6SsT5IqL6aEYK048Ts9LvpaUDrswx0nVDJ7ADr2u6i
         Ul2/CvikMqJUjaqevajWLEN6tqE+kiAV3SgyK2saPxErJ0vwN43StB62BxQCUhfKlVyX
         cUoQ==
X-Gm-Message-State: AOAM531CZZir3eWC36zsv/7h/3QcXVLSzuJw7MwU+TXKvHas41HISa2Y
        OHo9Jg3Pe0LJ25DiyyNUzTE9T0YKwKJtNhpZNE0=
X-Google-Smtp-Source: ABdhPJwt8733zr6N4yj6FxVSgrph3s9l4oGe3cVPbzqFrVlmw6Xv6Vu14kyHNxg5hkVg18XwvFJU42O68ypfOORJOLs=
X-Received: by 2002:a5b:2c6:: with SMTP id h6mr10931588ybp.306.1607607303436;
 Thu, 10 Dec 2020 05:35:03 -0800 (PST)
MIME-Version: 1.0
References: <1607403341-57214-1-git-send-email-yash.shah@sifive.com> <1607403341-57214-9-git-send-email-yash.shah@sifive.com>
In-Reply-To: <1607403341-57214-9-git-send-email-yash.shah@sifive.com>
From:   Bin Meng <bmeng.cn@gmail.com>
Date:   Thu, 10 Dec 2020 21:34:51 +0800
Message-ID: <CAEUhbmUPvu6bRDSnA4aUNNZRdjzfYSQOVvkN=PrqAxCK5oCngg@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] dt-bindings: riscv: Update YAML doc to support
 SiFive HiFive Unmatched board
To:     Yash Shah <yash.shah@sifive.com>
Cc:     linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        broonie@kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Albert Ou <aou@eecs.berkeley.edu>, lee.jones@linaro.org,
        u.kleine-koenig@pengutronix.de,
        Thierry Reding <thierry.reding@gmail.com>, andrew@lunn.ch,
        Peter Korsgaard <peter@korsgaard.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 8, 2020 at 3:05 PM Yash Shah <yash.shah@sifive.com> wrote:
>
> Add new compatible strings to the YAML DT binding document to support
> SiFive's HiFive Unmatched board
>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  Documentation/devicetree/bindings/riscv/sifive.yaml | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>

Reviewed-by: Bin Meng <bin.meng@windriver.com>

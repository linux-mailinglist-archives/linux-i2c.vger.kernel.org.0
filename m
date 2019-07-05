Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 290B860A22
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2019 18:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728385AbfGEQWD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Jul 2019 12:22:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:48370 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727188AbfGEQWD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 5 Jul 2019 12:22:03 -0400
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 41527216FD;
        Fri,  5 Jul 2019 16:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562343722;
        bh=ATbjWmjsWlgLbhTUpTCILR620NavVCyKfYpuQbpbl84=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=FBCJWWdFQXtWbtOMoOj2q5+jUXHTPF32xImrDH1zexjbEKUggE0NKUpy4BITkBwy+
         B0muOFEngKHqho3Dyb5GPt565KCh1b/iLEexMYkZGkDpUYXRzCLjtbobhZgh94O0XP
         +H5lXTbBv1GXctduENV5+W40B60E2IBai7rRpv1s=
Received: by mail-qt1-f182.google.com with SMTP id w17so8522385qto.10;
        Fri, 05 Jul 2019 09:22:02 -0700 (PDT)
X-Gm-Message-State: APjAAAXBqufBstwYa+fpALYdd1WvItBC6GOvL+G66ZA9Ra7sbFU1ADtT
        rkyzvJfdMAYqyqyTlKLpAFLARduoSKouaSTH5A==
X-Google-Smtp-Source: APXvYqwEgxz3ZTUXS7/pU2MZ31YDa1bWbiRpEGXZe2l1cnJq9TQNDbwzeeFaMXVZH86QMCCrxR+bmcmZ2Q55txzAsf8=
X-Received: by 2002:aed:3fb0:: with SMTP id s45mr3518886qth.136.1562343721556;
 Fri, 05 Jul 2019 09:22:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190703095338.11266-1-maxime.ripard@bootlin.com> <20190703095338.11266-2-maxime.ripard@bootlin.com>
In-Reply-To: <20190703095338.11266-2-maxime.ripard@bootlin.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 5 Jul 2019 10:21:48 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLb6ih7LHVVDZ230TgxrVzhyppEVcK7fZ=n4pcs3E-GcQ@mail.gmail.com>
Message-ID: <CAL_JsqLb6ih7LHVVDZ230TgxrVzhyppEVcK7fZ=n4pcs3E-GcQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: i2c: sun6i-p2wi: Fix the binding example
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jul 3, 2019 at 3:53 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> Even though the binding claims that the frequency can go up to 6MHz, the
> common i2c binding sets a limit at 3MHz, which then triggers a warning.
>
> Since the only SoC that uses that bus uses a frequency of 100kHz, and that
> this bus hasn't been found in an SoC for something like 5 years, let's just
> fix the example to have a frequency within the acceptable range for i2c.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  .../devicetree/bindings/i2c/allwinner,sun6i-a31-p2wi.yaml       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>

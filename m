Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B32A032928
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2019 09:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbfFCHME (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jun 2019 03:12:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:57862 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726383AbfFCHME (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 3 Jun 2019 03:12:04 -0400
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 68C2E27C91;
        Mon,  3 Jun 2019 07:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559545923;
        bh=c8WvhZLOCRa982aWA11WnNSUWAV0NBTazHnlnPgRRJc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=EhzwjuDRJKq5thLsOFmLd+rmK7MR6WgEWJlSm1jFBBLv0HNnOg0nGyhFj9Tw8Wqjf
         jQolmdrMUUXak+dpNAlvFG+zIwsOFQkJaJMPrO5QDLKH5nLgcsZdcvYblrj9F9QDUY
         e3uLeo3/gCOf4kI9a9489EzANPo5d6GssUXOaQZU=
Received: by mail-lj1-f181.google.com with SMTP id a10so11877917ljf.6;
        Mon, 03 Jun 2019 00:12:03 -0700 (PDT)
X-Gm-Message-State: APjAAAVGMQZJBo7WCay/iMmfmv4qOIiBmwzBZ66MdaAu4/aSDJU7xomN
        0i+iSMvirJ6Ml3wQZJmRswpsUsbvoVY6bYVZ4Qo=
X-Google-Smtp-Source: APXvYqzyq6xQlubn/0Q0SU/hL+PbbTEAKqFxtluwxG4OSVlm/Yy7fvtaRD7+POIAxvZgtcgpUshpuxibY26Dq8fBejI=
X-Received: by 2002:a2e:568d:: with SMTP id k13mr12680250lje.194.1559545921672;
 Mon, 03 Jun 2019 00:12:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190530215013.17806-1-linus.walleij@linaro.org>
In-Reply-To: <20190530215013.17806-1-linus.walleij@linaro.org>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Mon, 3 Jun 2019 09:11:50 +0200
X-Gmail-Original-Message-ID: <CAJKOXPfO=t1VCjOcrcgWHM_d-iCVwRF_iSeckV6mO7Th-S3UvQ@mail.gmail.com>
Message-ID: <CAJKOXPfO=t1VCjOcrcgWHM_d-iCVwRF_iSeckV6mO7Th-S3UvQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: s3c2410: Convert to use GPIO descriptors
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        Kukjin Kim <kgene@kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 30 May 2019 at 23:50, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> The S3C2410 does some funny dance around its pins:
> - First try to call back to the platform to get and control
>   some GPIO pins
> - If this doesn't work, it tries to get a pin control handle
> - If this doesn't work, it retrieves two GPIOs from the device
>   tree node and does nothing with them
>
> If we're gonna retrieve two GPIOs and do nothing with them, we
> might as well do it using the GPIO descriptor API. When we use
> the resource management API, the code gets smaller.
>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: linux-samsung-soc@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/i2c/busses/i2c-s3c2410.c | 47 ++++++--------------------------
>  1 file changed, 9 insertions(+), 38 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

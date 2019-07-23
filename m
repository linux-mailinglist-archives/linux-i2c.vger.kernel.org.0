Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D26A471401
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jul 2019 10:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730820AbfGWIaP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Jul 2019 04:30:15 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:44837 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730598AbfGWIaP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Jul 2019 04:30:15 -0400
Received: by mail-lf1-f65.google.com with SMTP id r15so11723515lfm.11
        for <linux-i2c@vger.kernel.org>; Tue, 23 Jul 2019 01:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=syBlnIr3lotOltOc/vZkYQKICHGTlfmAJxr6rc/TPFI=;
        b=IDHd3BlllDzmuMywX3W/Mwaxf9SUAC1ITQAYxVe3EdpVLn9P7ox/KvicZW0H2rn0VZ
         XYMuUIDtUmUgSakwnZqRD1wQNi33jFkVfQ++7gqN+S1bYzcoiZEpYsIYDg+s8PtPW9+K
         MSur3qtEyMptDyPfThqGYsTkPwZI82uma6RJmI3Z3uNyWTSnvQnDub5P482J9AI4exHZ
         MibyDiZFASkBdczzlG82BC7XX9iF5uOdeBkbJ8eNZKBp1/DlcJfWf8owTiKuBkS9Gdhk
         9wVcvG5Pfqbu1AVShyl1gXG5TMkTM9JLUFH0Wfp9eDgJ8oepkWepG/LEbP9vk/XxLltc
         Gs+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=syBlnIr3lotOltOc/vZkYQKICHGTlfmAJxr6rc/TPFI=;
        b=oIKoIo2of5j5X3DZmojOTQ3RrFEh9TM+TCNltHcFBdWfl559H0deLA/YH2cpKTX+uY
         Nqf5kD0PqcoZiQ6i2qbB1OVlimcIXR6L3rSJsGyiDuzjhZYRWmxeZ8+/taTaQVdcU0Gh
         OZv4Ae4sc+wQsfdkqeDWhjbzBdANvi+uaWQiys+eSWcarc156gYrvlWjLEiLo66UPjgB
         3Pep0Bo0VIGaOSV5MxwGT1ujoENMe5x8l7JwnQRz0SaVSLpJq6Sgxe0CBbL3/U38oO9R
         5drA7Z7F2fXW4MTUTVSWsdOKCe9eecoWdGhR3daF4iskiHzz7IGxYsHNndHw3RNVyIM5
         MQQQ==
X-Gm-Message-State: APjAAAXa9Bce4G/SJOhHQRvexPaunSILOaN8pI9tczBXDwlpoyBe6xaW
        TD3euxCgNburkwV+NF2EdB9f9Iud6FL4C+IMWhcOHA==
X-Google-Smtp-Source: APXvYqwWGxao/28Kz2zbNijiOv5Hz8uDmZYEJmaa8ZR+sLnSu5xitdAQqA8b5w1+jLpRJZce7gmX18s/KwwTbJI3EQI=
X-Received: by 2002:ac2:4891:: with SMTP id x17mr35514625lfc.60.1563870614049;
 Tue, 23 Jul 2019 01:30:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190722172623.4166-1-wsa+renesas@sang-engineering.com> <20190722172623.4166-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190722172623.4166-4-wsa+renesas@sang-engineering.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 23 Jul 2019 10:30:02 +0200
Message-ID: <CACRpkdb4CtiiYbSwHEcC4godbRBA3DmABCHpx5_OKUCfxgcUSg@mail.gmail.com>
Subject: Re: [PATCH 03/14] mfd: ab3100-core: convert to i2c_new_dummy_device
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jul 22, 2019 at 7:26 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:

> Move from i2c_new_dummy() to i2c_new_dummy_device(), so we now get an
> ERRPTR which we use in error handling.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

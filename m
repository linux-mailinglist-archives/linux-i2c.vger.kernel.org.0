Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 923B04167B5
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Sep 2021 23:50:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243396AbhIWVwH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Sep 2021 17:52:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243392AbhIWVwG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Sep 2021 17:52:06 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B39C3C061574
        for <linux-i2c@vger.kernel.org>; Thu, 23 Sep 2021 14:50:34 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id u8so31064548lff.9
        for <linux-i2c@vger.kernel.org>; Thu, 23 Sep 2021 14:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=amByutOR2CdEe2l/7fltvF7uV72wJ4yp5wwjDLvRveU=;
        b=w9u9JGtMchfj21KjO1EmCGDxVCq7rqexJLfC4tYxoiGFXLzWAZDs+gbKkWx9BFuMaV
         aXBGXcllqF6ttVgXVmWrpNgzqcDgrEZbhvSLGbEykrhlvxc5YVobC1kWzaS+Cm6a9bq5
         RqFpdQDkqmHRL7BTa9zHoRJF8gj7e7JZM6whBmmqpX3ZaOBYHyBvehzFPBlLKdKg9PhT
         ezR5IDGZ6fvRDg7U33kdv+fWeRJyWG7NDhm5MBf8FooaE8RaTS4+o2GO9t6WWRfrPZrt
         WwRwEoTWqF/s+A0LFXuU5huSI88ZyV5llmzZsb11zteFUUzJM27dap9H/kPzW7cTbkFh
         9/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=amByutOR2CdEe2l/7fltvF7uV72wJ4yp5wwjDLvRveU=;
        b=OqRNvjhahXVoYsB8cy+5CseUXqTzFVANbWLh9oKCu5MdXhyYL2bIqiNhmHj+8HybYw
         u2qB+34sPDq4AgkZeyYFDFpKRI9/YJS5vBOpTD3Nsc+xk10bJOP9JANMxs2SreLwQElz
         UC/MCL14lyGFAGCcDt3bL4ZXY4zDYw/hnsdXYY6PjoiR3ZiSBLfXL+jwzURLJ3Ps63Zi
         xWE+WLdngry/zY8nV7S+DA4eJ4yAlnNcZO/+GdV5CVy5CrFq5KQun/1cowcTDxC5Xdij
         62LoGhn+H5mA1VqERVFaOi9bmNCNkGZv1yv7/63reave3wzTtJoWZcXH5RMo51ndmx/D
         mGPg==
X-Gm-Message-State: AOAM532Rct/JgOXLN06sreaO4Q7kE9BpxLhQ1Ecb/ThiJ7a6DxfZ03K1
        DRPIrZEiiY1xm2V4eRu4d8qc6s2DXGqU1Xj1pNT7TQ==
X-Google-Smtp-Source: ABdhPJwZAdk2Oxl0Vi4AaTLGVlUnWujBeU/2PSlbhwLbFRiKH9Y+MIcrIDZX+4dhRLX9fsmDZ+i57nAnwVu47f6FHq8=
X-Received: by 2002:ac2:4d03:: with SMTP id r3mr6573924lfi.339.1632433832437;
 Thu, 23 Sep 2021 14:50:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210920072842.30889-1-brgl@bgdev.pl>
In-Reply-To: <20210920072842.30889-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Sep 2021 23:50:21 +0200
Message-ID: <CACRpkdZqdUu61n49dqwzy-u=PQ97OF1-eQoOtbZ3101KC=TPWw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: update my email address
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Wolfram Sang <wsa@the-dreams.de>, Sekhar Nori <nsekhar@ti.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Sep 20, 2021 at 9:28 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> My professional situation changes soon. Update my email address.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

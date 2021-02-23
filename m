Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19A7A3233D9
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Feb 2021 23:46:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbhBWWkH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Feb 2021 17:40:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232700AbhBWWfr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Feb 2021 17:35:47 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F1A5C061574
        for <linux-i2c@vger.kernel.org>; Tue, 23 Feb 2021 14:35:07 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id p5so5884451plo.4
        for <linux-i2c@vger.kernel.org>; Tue, 23 Feb 2021 14:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6JxJtLrjQ/Nyr5fh6rK5tg3DDo4mCFKKxTbehSm9m2Y=;
        b=NkdjnqbDYp2asX/uD3vRQ3xJ5e5ui/iQKPk8pI5rD/D8Xtxmw2No/Kz1XWRqhbzLDw
         /SogjrCeHPL9ShRMpoV7QTtOH0mMtZVjDZmnkJrx3UkdwH5o6xAEhNcPWaylu5Jc/ki1
         cimr4KXEHNb4vfdUcsRygiPBdre52VB1satKujeT/rt7IbGM20tSs3Bu3m2Sz3ci1HKY
         yS5DR4R9jvvIbsnU3LUEP+drjhRNdq+W59KLQ/q0n2NVORBtdLSRCq7BhMvMp5jsxos/
         alRRmw+wZa8+VKmvudNcvbBUs8awZRQDY/o+V967jtgxtMd6Vorl11OYs4dza+AmYTAw
         HeKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6JxJtLrjQ/Nyr5fh6rK5tg3DDo4mCFKKxTbehSm9m2Y=;
        b=D0gtrGa3VoKkGSeuYuqXzr3PCRCm5xuSeDB/NeHCNoB4agbSv3QpuHu0iIMh8RAQB6
         vN34luAnLZMCqMgZulSuFRZhTdipSeUG3feSWMOWuZOXtYYw10LCiX8mK9L4YySdn7a8
         Ffh/PC7huL4vj2xozzOglG9CBpc1pCDesag2cJdM1gqVJgW4jTQlT8BU7NHwlNv5r6yj
         HqmZLKQEZZNzZcsQKsc7drCo1DmJKXQIpwEu5C7yA86W967sRmPqrT9GdP7pQZ2AFUkt
         Ticm3YvRKdvwGMQNyQxLHvycruNSmO2OSuPKLhUT3IiGpiJ7y87jEJrcPQCUk5ky3rNL
         oIaQ==
X-Gm-Message-State: AOAM533sQILiDaN8oWqdac3i6YY06FnYdnTqsmlzNcAorAJZ1EPzjMzK
        ktEyzH1zr0dPH6dhBHaT4ezZSU84aIc+kFcwDPXXNw==
X-Google-Smtp-Source: ABdhPJwffvRJctzUSP0CFLJEA0ALFcFH0gt4tYD2lVrQrJ56VkiXvtTQuK2R2zdN2Dtx0ceMdFzSuDeeuKCvkcHDWrI=
X-Received: by 2002:a17:90a:e64a:: with SMTP id ep10mr1093167pjb.20.1614119706521;
 Tue, 23 Feb 2021 14:35:06 -0800 (PST)
MIME-Version: 1.0
References: <20210216182735.11639-1-jae.hyun.yoo@linux.intel.com> <20210216182735.11639-3-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20210216182735.11639-3-jae.hyun.yoo@linux.intel.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 23 Feb 2021 14:34:55 -0800
Message-ID: <CAFd5g46K4=xPLFnvnAKY0MibU9s87Hd_OpYupYQwZ+Yq=W2-mQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] ARM: dts: aspeed: modify I2C node to support
 buffer mode
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Jeffery <andrew@aj.id.au>, Tao Ren <taoren@fb.com>,
        Cedric Le Goater <clg@kaod.org>, linux-i2c@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 16, 2021 at 10:15 AM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> This driver uses byte mode that makes lots of interrupt calls
> so it's not good for performance. Also, it makes the driver very
> timing sensitive. To improve performance of the driver, this commit
> modifies I2C node to support buffer mode which uses I2C SRAM buffer
> instead of using a single byte buffer.
>
> AST2400:
> It has 2 KBytes (256 Bytes x 8 pages) of I2C SRAM buffer pool from
> 0x1e78a800 to 0x1e78afff that can be used for all busses with
> buffer pool manipulation. To simplify implementation for supporting
> both AST2400 and AST2500, it assigns each 128 Bytes per bus without
> using buffer pool manipulation so total 1792 Bytes of I2C SRAM
> buffer will be used.
>
> AST2500:
> It has 16 Bytes of individual I2C SRAM buffer per each bus and its
> range is from 0x1e78a200 to 0x1e78a2df, so it doesn't have 'buffer
> page selection' bit field in the Function control register, and
> neither 'base address pointer' bit field in the Pool buffer control
> register it has. To simplify implementation for supporting both
> AST2400 and AST2500, it writes zeros on those register bit fields
> but it's okay because it does nothing in AST2500.
>
> AST2600:
> It has 32 Bytes of individual I2C SRAM buffer per each bus and its
> range is from 0x1e78ac00 to 0x1e78adff. Works just like AST2500
> does.
>
> See Documentation/devicetree/bindings/i2c/i2c-aspeed.txt for
> enabling buffer mode details.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 296931F1D5B
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jun 2020 18:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730555AbgFHQba (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Jun 2020 12:31:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730432AbgFHQba (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Jun 2020 12:31:30 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49CACC08C5C2;
        Mon,  8 Jun 2020 09:31:29 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id q16so6865660plr.2;
        Mon, 08 Jun 2020 09:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wIttDMsFzg0Uybo26rTW3dMBMtCplzFHrJSWtyJvF5E=;
        b=XZ5ealO1fD+QtN4tv4WOpNvLE7d2hRiRMQXafKppeKT/zyXIAxrhoVDo9LDT5d0GiZ
         zWKM1ObG3YM+2y+caLNg5mOqPn4lk20JANWm2i8zXHh7hfrlLfyuRJdhCoFgkItmRV/i
         L/qnK4csrIEk6hF+qUE4Z54XAFXmYTZiVjlWRlmGtAhmSARZ0IhkOFErDuJBY2vn2AdA
         kh0xrTq54naqRnpxv3zAfEcAOLc8QsosoXmSqZj7okpgIn85VFNTh/l8Sb/6hsy+crTu
         FQt5U9/zjDMqTdM7A7Su5AxF9xFXkhLN5PoAK1caYJrhj/CkG0dIMN/wvWy882BsIvhv
         l7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wIttDMsFzg0Uybo26rTW3dMBMtCplzFHrJSWtyJvF5E=;
        b=meYso+iJV1QI3XevSHyANkN31rnwr4+3DhvJwzOK8LZjaoN+KQtLaPQPIs3rNGxvRJ
         7C/TKHne8TCtw4qfC5jbsO+tScAGNIRd8GzvHDGAdt7a/OFOEeIwElWeh+yCmqUF2j8d
         /qvh3sT831d6Jgfd28NmDR7x+qxKcktPzzqkQ3yxf0mZ1p/kraYqU6w6i54nRzRvVOxY
         zDxhOdzBdo8KxNf2WBQsffm3oU/NlLj8zFDbS+Bzqntj6orT5q7tq0rRK0vxMA4/s67y
         F5983bDMb1HRiiahr7k8iW9Qlu2QDIOlk/gIfJPjjkjpcb0/UWGpBpbFZoO2QA8EN2v/
         8OdA==
X-Gm-Message-State: AOAM5331t1vgdNLxgUCiW4pjSAO84XgBioOeX0LVLYwulwMLsVlRAAi9
        wX1ZoPLfXzBUna1aTY8vSXlydqWRm5jUJgIv7nulXvOMey0=
X-Google-Smtp-Source: ABdhPJzSkfE4mP6reIM2bDln2j8DreEUaJGGwqGyC0RNO9c3oTqacz/ojKqVGZNUMRdgUsY4DCrIr+DUtwXoxLm01mQ=
X-Received: by 2002:a17:90a:ac05:: with SMTP id o5mr171278pjq.228.1591633888654;
 Mon, 08 Jun 2020 09:31:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200608160544.7134-1-eajames@linux.ibm.com> <20200608160544.7134-3-eajames@linux.ibm.com>
In-Reply-To: <20200608160544.7134-3-eajames@linux.ibm.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 8 Jun 2020 19:31:12 +0300
Message-ID: <CAHp75VfRj4kA1yrhkqak9zMJuES8Udk3YuzMKHXyh+hwrB6rSQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] i2c: fsi: Prevent adding adapters for ports without
 dts nodes
To:     Eddie James <eajames@linux.ibm.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        wsa@kernel.org, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 8, 2020 at 7:05 PM Eddie James <eajames@linux.ibm.com> wrote:
>
> Ports should be defined in the devicetree if they are to be enabled on
> the system.

...

>         for (port_no = 0; port_no < ports; port_no++) {
>                 np = fsi_i2c_find_port_of_node(dev->of_node, port_no);
> -               if (np && !of_device_is_available(np))

> +               /* Do not add port if it is not described in the device tree */
> +               if (!np)
> +                       continue;

I believe this is redundant, since below will do the same second time.

> +               /* Do not add port if it is described as disabled */
> +               if (!of_device_is_available(np))
>                         continue;

-- 
With Best Regards,
Andy Shevchenko

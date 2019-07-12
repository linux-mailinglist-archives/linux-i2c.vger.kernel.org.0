Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB9E664EC
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2019 05:25:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729383AbfGLDZc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Jul 2019 23:25:32 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:36552 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729158AbfGLDZb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Jul 2019 23:25:31 -0400
Received: by mail-io1-f67.google.com with SMTP id o9so17388651iom.3;
        Thu, 11 Jul 2019 20:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=915jr1GvJqW/XnIrI3t1cz5Ff5V+KSrPiSwAsvPilYA=;
        b=jDAdGMyUD3QP0hDtMwRDoksOAUXjXCNAb8xrFWjIC6U59Jqn2rzmjAC9TjWKRU3oAg
         YeVglVOpwPTMKgy5jtpuGKFZfPUqG3VV0d6E3gZ2DGhSIyMFRW3vqXK9T/AQiXKhe87e
         hob4i6tNfEf3sW+zdh46mx5EPOz/T36Hw4jBLelr/DNfyZE1VEmjNUdnpHEW5h9NvAgc
         LXgdjZm7sFjWZspS9JToXExMoEMJ6oYou1wt9h/noA3gddJYFT3AAuEBZHrSeDvxXl09
         F2UXKBCcyy+PCTZkylpc+E5OEosTkbvexsGVFeHvC6ufTpgmrHGPbWPEXJ9WK22hekYw
         D7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=915jr1GvJqW/XnIrI3t1cz5Ff5V+KSrPiSwAsvPilYA=;
        b=kmBCsrzosx4qwrK5KEtlbe057+GupOh23ZpcIl3E+Nc4jwtT3IwrBJYf74kH9re7G1
         eF735PVK8qmq93+EU9pw2vExYm/p01xmbpwxADuzlfkO8zybzQLOrzy2n5ksAPrZPu+r
         dfMU4oglVsMqNLTuDcb/0vWleO88EIq0mXGAS027UmLqJeZMi03XV8Tyw9diL3LIdHe7
         iQUm6RkFXjd+u6mkP8zHDel2dsQfamGd7s1mXfxqsCKwmh1soJrnYjzb+JD+m22D8xz7
         RNaoD7Euq/1hQR5NuRU9buChrCV+WuvkcjtS4t7G1t0lLUmLobRqkEKcMjl0cMsNzQV7
         fBVg==
X-Gm-Message-State: APjAAAXQJi0Se1eR8IfamguyM4e5qyuoBw3ezlsbun2FQL6r5pbfZYHK
        uClht3hXTAFjtF+36uYCN+vrOitfYftCDkDIQH4=
X-Google-Smtp-Source: APXvYqza8rWHidcHCCjVSBTPT+5lCJioVNWdyCZbW7cNHRuU9UZiZ+nqv4uprd5V5nvKK7gywSHHdFQ5iv3dyS8WUXM=
X-Received: by 2002:a6b:4107:: with SMTP id n7mr7372020ioa.12.1562901930907;
 Thu, 11 Jul 2019 20:25:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190609055658.3446-1-andrew.smirnov@gmail.com>
In-Reply-To: <20190609055658.3446-1-andrew.smirnov@gmail.com>
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
Date:   Thu, 11 Jul 2019 20:25:19 -0700
Message-ID: <CAHQ1cqG0=_ONFALzqCmsvKU-Lm4TFqjuiNWF=qz-GGm+5EJGag@mail.gmail.com>
Subject: Re: [PATCH] i2c: imx: Initialize DMA before registering I2C adapter
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Chris Healy <cphealy@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Jun 8, 2019 at 10:57 PM Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
>
> Allocating DMA after registering I2C adapter can lead to infinite
> probing loop, for example, consider the following scenario:
>
>     1. i2c_imx_probe() is called and successfully registers an I2C
>        adapter via i2c_add_numbered_adapter()
>
>     2. As a part of i2c_add_numbered_adapter() new I2C slave devices
>        are added from DT which results in a call to
>        driver_deferred_probe_trigger()
>
>     3. i2c_imx_probe() continues and calls i2c_imx_dma_request() which
>        due to lack of proper DMA driver returns -EPROBE_DEFER
>
>     4. i2c_imx_probe() fails, removes I2C adapter and returns
>        -EPROBE_DEFER, which places it into deferred probe list
>
>     5. Deferred probe work triggered in #2 above kicks in and calls
>        i2c_imx_probe() again thus bringing us to step #1
>
> To avoid having this problem, move i2c_imx_dma_request() to happen
> before i2c_add_numbered_adapter().
>
> This problem was encountered on VF610 CFU1 board with
> CONFIG_FSL_EDMA=n.
>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org

Gentle ping. Any feedback on this?

Thanks,
Andrey Smirnov

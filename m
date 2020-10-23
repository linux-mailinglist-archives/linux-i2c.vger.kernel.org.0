Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BD0129722C
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Oct 2020 17:24:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S465725AbgJWPYD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Oct 2020 11:24:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:50270 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S465721AbgJWPYD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 23 Oct 2020 11:24:03 -0400
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 01A3920E65;
        Fri, 23 Oct 2020 15:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603466642;
        bh=5qgI2RWiKVjv95NZAvj/p7B0hV/pd7S6Web09gCE+Ik=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=SM7xnBE7SbN3X/TcILqn96CM6yeMAhBNEw0ndPDhtK7bZGOf0AsZs6HoSb9HH2/Xi
         qDDcWrqN6iuR6dP1qGkkKS9p5vvRCNmwOSa4A5Bqr9c12coA2dO0Flg1AOLEUIMGVw
         +wAarELgWqoPGjstz6GDHHorzP0Ie+0BkCx/QqFI=
Received: by mail-ed1-f52.google.com with SMTP id w25so1936077edx.2;
        Fri, 23 Oct 2020 08:24:01 -0700 (PDT)
X-Gm-Message-State: AOAM533faKnlwuV0ZF7oy2O2NNT+6MD6xTm4sKWCOTgBHFKal8YPbJWf
        lFaU7ZI/RMXQ/Sx47tIYcZY6GIgTsDXSbCxZ8JE=
X-Google-Smtp-Source: ABdhPJzEHBtcSzIjjxTKWZIahZWZ8nKOL6D9w3Hawp3t3vbCdfYH/g/alxDlntIs8FZyNXk236F+xyiPqR6QZpjBEk0=
X-Received: by 2002:aa7:d1d5:: with SMTP id g21mr2756030edp.348.1603466640510;
 Fri, 23 Oct 2020 08:24:00 -0700 (PDT)
MIME-Version: 1.0
References: <1603441103-17735-1-git-send-email-peng.fan@nxp.com>
In-Reply-To: <1603441103-17735-1-git-send-email-peng.fan@nxp.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Fri, 23 Oct 2020 17:23:48 +0200
X-Gmail-Original-Message-ID: <CAJKOXPcPMRYmQURxAX5JPOR7k0JQmzoaX4xkmyZar_HHLX3dkA@mail.gmail.com>
Message-ID: <CAJKOXPcPMRYmQURxAX5JPOR7k0JQmzoaX4xkmyZar_HHLX3dkA@mail.gmail.com>
Subject: Re: [PATCH 1/2] i2c: imx: use devm_request_threaded_irq to simplify code
To:     peng.fan@nxp.com
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 23 Oct 2020 at 10:27, <peng.fan@nxp.com> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Use devm_request_threaded_irq to simplify code
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/i2c/busses/i2c-imx.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index e6f8d6e45a15..ba9d639223ec 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1216,8 +1216,8 @@ static int i2c_imx_probe(struct platform_device *pdev)
>                 goto rpm_disable;
>
>         /* Request IRQ */
> -       ret = request_threaded_irq(irq, i2c_imx_isr, NULL, IRQF_SHARED,
> -                                  pdev->name, i2c_imx);
> +       ret = devm_request_threaded_irq(&pdev->dev, irq, i2c_imx_isr, NULL, IRQF_SHARED,
> +                                       pdev->name, i2c_imx);

Really? You silently revert commit e50e4f0b85be ("i2c: imx: Fix
external abort on interrupt in exit paths"). This is not a
simplification but serious change. NAK. At least without proper
reasoning of why this is suddenly safe.

Best regards,
Krzysztof
Best regards,
Krzysztof

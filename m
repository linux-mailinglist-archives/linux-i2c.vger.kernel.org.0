Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F2E485591
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2019 00:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729344AbfHGWPg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Aug 2019 18:15:36 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45159 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727213AbfHGWPg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Aug 2019 18:15:36 -0400
Received: by mail-lj1-f193.google.com with SMTP id m23so86859701lje.12
        for <linux-i2c@vger.kernel.org>; Wed, 07 Aug 2019 15:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nlob2h1NRWR3NEdOs2oB2kUpwNAP2mCosVz3e0OUuBk=;
        b=S8HuTbjX90nYYbLA7L0BZyA+tq02Ex+/r3X/IEVzE5P13mVT4EjPxLtTxsJcXXB0gr
         3RSKbVzN9Q3TXrLAVIuAMsdf8RQ1S4ZJKS8u/YoPT8y1gZo3A+3KKrScPvhTy+abpw0W
         ysxCzrIfhY0HPZ6i4Md2wPSDnUEGDT2bbVCYoYBljpoFa4qtGLL0EHF7ifeuM44ORSZr
         83OBYSRePLG6MSSGSCdHN0nJui626YlUX+5ERQUJwbw05XIkQi4fLuAwK7YLYf7XrQz8
         1C41rPRjxqeUvmIcYnNpdbPUkWfRvypePecNaoFh0ajJLMPHSxRHPJjaaT68YNu+bA/I
         L9lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nlob2h1NRWR3NEdOs2oB2kUpwNAP2mCosVz3e0OUuBk=;
        b=S5jyCVZPnuHqC1kr2cTtwHKuegCGsmJrZWI+kPqEIpef6pWpcZV8eG2R26rmfTNOs1
         cijdHT3KxNQFwD9aGWUAzVj8yYwV+HKmr3np8GyMPKMG7n1t7GAtbbWD8okI1DK5u02j
         ZejU19f6JU1DPrJZ8FjhXuzPRaQ4oAz6IILO3TsrhITdlOKL6gPG57k+nBApUOMibM3p
         WDwjY+BJSAceKdYxi+RcD+X1JN1SbbhjlVDKFznK4SF96jzaLQxeA4yFSYoFvSCXjQRl
         8YEP3hNHzKMdJVFKvZKMXnUh+m5m75uPoiw6Wm6+ceigxpSBWm5efgARVtPZhXyDY44x
         WmJg==
X-Gm-Message-State: APjAAAXno5YPRkygA/bTMd/QF7P02dvQsIZG9k5Ycvze0bStaf1UjWG0
        BAM3sTNDw6Mf66zhiEm5/DYNuujKPZOnbQWZUBc=
X-Google-Smtp-Source: APXvYqxCex6jIsN+iqJDPPq0nDEB7t5YnQB6Vpg/tIcw6Y3GwTvHpf2gV5TK33u1v+YuRR2vdJRF+bsfjxOl1P/oDYs=
X-Received: by 2002:a2e:a311:: with SMTP id l17mr309871lje.214.1565216134859;
 Wed, 07 Aug 2019 15:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190807203153.11778-1-festevam@gmail.com> <CAOMZO5B_3d2DYMzpchJmM9CnRL0gN6-8zGeB_zorN-0cL8rbKA@mail.gmail.com>
 <20190807211317.GA5193@shell.armlinux.org.uk>
In-Reply-To: <20190807211317.GA5193@shell.armlinux.org.uk>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 7 Aug 2019 19:15:58 -0300
Message-ID: <CAOMZO5BtVL8NZJmAfWhKkmA_xXyut_nHBL8mS7_7f41S=mYkkQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: imx: Fix endlessly clk warnings
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Oleksij Rempel <linux@rempel-privat.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Chris Healy <cphealy@gmail.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Russell,

On Wed, Aug 7, 2019 at 6:13 PM Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:

> Well, the question is what behaviour do we want.  The driver's original
> behaviour prior to it breaking was to ignore DMA if it wasn't found
> (e.g. when the DMA driver is a module.)
>
> Your patch restores that behaviour, which is the safest approach.

Thanks for the feedback.

> Audrey's patch has the effect that none of the I2C buses will be
> registered if the DMA driver is a module, until the DMA driver is
> loaded.  Since an I2C bus _may_ have the systems RTC on it, not
> probing the I2C bus will cause the RTC not to be read by the kernel
> at boot, leading to the system booting with a unixtime of 0.

That's a very good point.

> I haven't checked what the situation is wrt RTCs on the ZII boards,
> whether they do indeed have external I2C RTCs on them.

Yes, they do have external I2C RTCs. Please check this commit for example:
09fc0dacc ("ARM: dts: imx6qdl-zii-rdu2: Disable the internal RTC")

If Wolfram agrees, I think we can go with my patch then.

Thanks

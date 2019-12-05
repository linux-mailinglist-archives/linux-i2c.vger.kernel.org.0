Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1027B11438D
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Dec 2019 16:29:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729187AbfLEP33 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Dec 2019 10:29:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:59294 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726028AbfLEP33 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 5 Dec 2019 10:29:29 -0500
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4286624653;
        Thu,  5 Dec 2019 15:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575559768;
        bh=NMm0/3XxuzYATSrBmkGz2JzVxQjnOlc5/5CPMSabyOE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LcDzJEL4CKtdqpWOmTmqLWocNjuQ+85SZvwibD0RVzpXYsft26NOCaHlHBuddGuj6
         NdU/VnuqqgGK+g2CzuIkyn8FhOJngQA9QEYSiRxF8K7Vyh21I1dHw/1+ha9Yb+oDgJ
         DHJ2pAb6+nEVYMMvh0sovbXOKkseGpmKEBOaPB2U=
Received: by mail-lj1-f178.google.com with SMTP id e28so4032509ljo.9;
        Thu, 05 Dec 2019 07:29:28 -0800 (PST)
X-Gm-Message-State: APjAAAXTTXkN3aV4j6iPpdx1T4WMFe/vuJh0xAm8WHZo6DcWZW6LyFWQ
        LM+aOb1E1q6eB+przUUG8Gwz/ZiaYVr8cP9XvVo=
X-Google-Smtp-Source: APXvYqy3vunKQdsEkMwS0MLF+dMbKsGSvNEtu7hlvqcw9Q9bM3/Wn6K7JcsMr8ryLkDM0QohCmuXR8Qi8xqF7voNyCs=
X-Received: by 2002:a2e:9d9a:: with SMTP id c26mr5974608ljj.225.1575559766374;
 Thu, 05 Dec 2019 07:29:26 -0800 (PST)
MIME-Version: 1.0
References: <20191205150500.21762-1-hyunki00.koo@gmail.com>
In-Reply-To: <20191205150500.21762-1-hyunki00.koo@gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Thu, 5 Dec 2019 16:29:15 +0100
X-Gmail-Original-Message-ID: <CAJKOXPemBE2AHW4aju+SzvHA-rRCNwYhpHpG8ThsY_W2v1tzoA@mail.gmail.com>
Message-ID: <CAJKOXPemBE2AHW4aju+SzvHA-rRCNwYhpHpG8ThsY_W2v1tzoA@mail.gmail.com>
Subject: Re: [PATCH] ANDROID: i2c: exynos5: remove default enable in Kconfig
To:     Hyunki Koo <hyunki00.koo@gmail.com>
Cc:     wsa@the-dreams.de, Hyunki Koo <hyunki00.koo@samsung.com>,
        Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Max Staudt <max@enpas.org>,
        Juergen Fitschen <jfi@ssv-embedded.de>,
        Elie Morisse <syniurge@gmail.com>, Stefan Roese <sr@denx.de>,
        Baolin Wang <baolin.wang@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-i2c@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 5 Dec 2019 at 16:05, Hyunki Koo <hyunki00.koo@gmail.com> wrote:
>
> From: Hyunki Koo <hyunki00.koo@samsung.com>
>
> There are many exynos device and not all exynos device does not have
> HSI2C controllers. Thus remove select this by default
>
> Signed-off-by: Hyunki Koo <hyunki00.koo@samsung.com>
> ---
>  drivers/i2c/busses/Kconfig | 1 -
>  1 file changed, 1 deletion(-)

Thanks for the patch but this is not a proper solution because:
1. Basically you disabled this driver on exynos, multi_v7 and ARMv8 defconfigs.
2. We provide one kernel for all ARMv7 Exynos and one for all ARMv8
platforms therefore this driver should be there. Having unnecessary
driver also does not hurt - it will not match by compatible.

So really no.

Best regards,
Krzysztof

> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 6a0aa76859f3..3955315f48c7 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -612,7 +612,6 @@ config I2C_EMEV2
>  config I2C_EXYNOS5
>         tristate "Exynos5 high-speed I2C driver"
>         depends on ARCH_EXYNOS && OF
> -       default y
>         help
>           High-speed I2C controller on Exynos5 based Samsung SoCs.
>
> --
> 2.17.1
>

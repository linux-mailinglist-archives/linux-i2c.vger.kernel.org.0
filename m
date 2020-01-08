Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECF0B133BEF
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2020 07:59:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbgAHG7h (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Jan 2020 01:59:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:55584 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726389AbgAHG7g (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 8 Jan 2020 01:59:36 -0500
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B0A2D2077B;
        Wed,  8 Jan 2020 06:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578466776;
        bh=lopF8Y27P3s8f9qJIWHeW1cbGQtBdCZSw/gJCdDsJ7w=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=GNkwrS5CxX2TGwNIz+6KbLNgnct/6+I+i7bNNbEFckhuc8n8eC5yCRMSj/OxiwOs9
         LhoEkhCXP70Ck6Fjp0z7kIVSiDOAwEidiAM6SQrdodink5MfoIk8g9zd1T0vlj7Niq
         vhn5w5haSSPXYPKl+hyYoZ38OMBdVUB5nNCNgl2w=
Received: by mail-lj1-f180.google.com with SMTP id y6so2226065lji.0;
        Tue, 07 Jan 2020 22:59:35 -0800 (PST)
X-Gm-Message-State: APjAAAV/Y+AIIAyD8xUuOtacatlRXn6cCudSNYDMQceDWSki4SUSVrom
        +n1deWTMLcWmZ0P1kqZvC6QnVRZIS+zmZI3DpkI=
X-Google-Smtp-Source: APXvYqwJ5OZrNLuxSSWJYxq/eTEZqpTwXVEVRSy5xlNfXiWb1ThbuyJkkJerK1aGtDzoII3scqi1c6/V50JbxaUvlXY=
X-Received: by 2002:a2e:9196:: with SMTP id f22mr2050869ljg.18.1578466773920;
 Tue, 07 Jan 2020 22:59:33 -0800 (PST)
MIME-Version: 1.0
References: <20200107215406.1632417-1-arnd@arndb.de>
In-Reply-To: <20200107215406.1632417-1-arnd@arndb.de>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 8 Jan 2020 07:59:22 +0100
X-Gmail-Original-Message-ID: <CAJKOXPfYYyBWED-f67-suWPOzwRjB3VtncnkDPeiTMiankTR8w@mail.gmail.com>
Message-ID: <CAJKOXPfYYyBWED-f67-suWPOzwRjB3VtncnkDPeiTMiankTR8w@mail.gmail.com>
Subject: Re: [PATCH] i2c: s3c24xx: allow compile-testing
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Max Staudt <max@enpas.org>,
        Juergen Fitschen <jfi@ssv-embedded.de>,
        Elie Morisse <syniurge@gmail.com>, Stefan Roese <sr@denx.de>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-i2c@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 7 Jan 2020 at 22:54, Arnd Bergmann <arnd@arndb.de> wrote:
>
> The PHY_EXYNOS5250_SATA driver can now be selected on
> any platform for compile testing, but this results in a Kconfig
> warning:
>
> WARNING: unmet direct dependencies detected for I2C_S3C2410
>   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && HAVE_S3C2410_I2C [=n]
>   Selected by [y]:
>   - PHY_EXYNOS5250_SATA [=y] && (SOC_EXYNOS5250 || COMPILE_TEST [=y]) && HAS_IOMEM [=y] && OF [=y]
>
> Allow the I2C driver to be compile-tested as well.
>
> Fixes: 1544133d48c3 ("phy: Enable compile testing for some of drivers")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Hi,

I already posted this with my first patchset of compile test addons:
v2: https://lore.kernel.org/lkml/1578384779-15487-1-git-send-email-krzk@kernel.org/
v1: https://lore.kernel.org/lkml/20191230172751.17985-5-krzk@kernel.org/

Best regards,
Krzysztof

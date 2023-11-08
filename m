Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E72857E5B8F
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Nov 2023 17:41:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232180AbjKHQl5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Nov 2023 11:41:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231953AbjKHQl4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Nov 2023 11:41:56 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A67F91BEA;
        Wed,  8 Nov 2023 08:41:54 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE3EFC433C9;
        Wed,  8 Nov 2023 16:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699461714;
        bh=mTSad6bJhZGA212S/cPdKprvVKPQ/Wzqui55Qdqk7Q0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mHEkXpn0YUGCi5tDa5stf8TWfMEbxcSgszu1XhzbVhTBRgxBnyU/PzKxof2V9XnaY
         zuYUA7lRdYFVNhIGuPpGjAzNGK9m6qjHSad5xZq9BXgyC7S8qhsGji0Ws70V9ECWQW
         jJoXZW/EGelR6dVh/x8jxbO2B5fARPBf47voCmN+SWIdg/iQeJBUS+Yd3MJoHVi6ab
         DGmxVQMHM/QW683mvTs3EjeZs6+grLIqhLcS5nMjoq9FdFM+A/2Cc4onYm75xzfDY4
         F/4s2fEWLVRP2PVf719XdVQKnBtekM8cBdJNMMOwLap8uCWbX1q7vDSzfyPAn2wgCM
         XZ+PJnY19Z6bg==
Date:   Wed, 8 Nov 2023 16:41:43 +0000
From:   Lee Jones <lee@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 11/17] ASoC: dt-bindings: samsung-i2s: add specific
 compatibles for existing SoC
Message-ID: <20231108164143.GC8909@google.com>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-12-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231108104343.24192-12-krzysztof.kozlowski@linaro.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 08 Nov 2023, Krzysztof Kozlowski wrote:

> Samsung Exynos SoC reuses several devices from older designs, thus
> historically we kept the old (block's) compatible only.  This works fine
> and there is no bug here, however guidelines expressed in
> Documentation/devicetree/bindings/writing-bindings.rst state that:
> 1. Compatibles should be specific.
> 2. We should add new compatibles in case of bugs or features.
> 
> Add compatibles specific to each SoC in front of all old-SoC-like
> compatibles.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> I propose to take the patch through Samsung SoC (me). See cover letter
> for explanation.
> ---
>  .../mfd/samsung,exynos5433-lpass.yaml         |  2 +-
>  .../bindings/sound/samsung-i2s.yaml           | 19 ++++++++++++-------
>  2 files changed, 13 insertions(+), 8 deletions(-)

Acked-by: Lee Jones <lee@kernel.org>

-- 
Lee Jones [李琼斯]

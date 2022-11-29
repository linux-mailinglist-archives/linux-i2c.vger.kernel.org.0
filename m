Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E43F63CA86
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Nov 2022 22:37:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236900AbiK2VhI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Nov 2022 16:37:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbiK2VhI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Nov 2022 16:37:08 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F001E5CD38
        for <linux-i2c@vger.kernel.org>; Tue, 29 Nov 2022 13:37:06 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id ml11so12066924ejb.6
        for <linux-i2c@vger.kernel.org>; Tue, 29 Nov 2022 13:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWF9gOd/OY/hKO0R1X+AR0OfRDJ2mDFKtPhWMv/Y0Hg=;
        b=C3cqCKNZvB+oxs2Z7PiDFvl3m4uH+qKJOwduAl71kmF3MfYto97m5S60Fz47UIGVVE
         kTnLFuPBp8XqzvmLdO2DhSNSd+/QRot4t0KXV7WJ9AAzeTkf/suAR3qs6xkayDF5L3T2
         b8ycGwfFGvOZxsfqaidTxUR3UbGtV59MiZFj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pWF9gOd/OY/hKO0R1X+AR0OfRDJ2mDFKtPhWMv/Y0Hg=;
        b=dbTKe0riZa272hU9H2vJX180dBHUk/sDlU/VBg241XWx6PnNQ6wK4pTfU05trsEB6z
         aGGqQ8JBfb/vuFHVkU5wNh2PIk1FVrtERE73JOseyAoDVxwP+UR7bFddfQ8AhpPWiuao
         JdjEbP7WT/GkVBu3fbK18cz5S1HaXqJ8XJYI9tj1Kuc/DO5NeekWRiIlZ9811Ua6i+2Z
         QfQIFTZhQPAUUpYdzYVZUkTgpuOFBtgSsSVfAZvNQijd4AWq3VaQl3Qry8MBDJ1zTSXk
         gNc1rmY5BYm/Q3tGJcDNeI2Grd3q1J9YJre04FQcZYFx/q0pS27aox46tXJhkV9t06m+
         SpAQ==
X-Gm-Message-State: ANoB5pk602CgNV03vKTeJFJSAOPjHzlTSUsduASOHZbboPRiivqJ6pua
        6lgOA93bJwe2XGPebAjTyeRJCZjV1gPaLeJp
X-Google-Smtp-Source: AA0mqf4GV7nku/q/Ai9YH87sjpBOCP+zTeTD5u07Bdfb7hc7JPjBUUwDYZA5a64+igOnnH1UJvd7cQ==
X-Received: by 2002:a17:906:d7ad:b0:7bc:e98e:2d50 with SMTP id pk13-20020a170906d7ad00b007bce98e2d50mr19832726ejb.743.1669757825067;
        Tue, 29 Nov 2022 13:37:05 -0800 (PST)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id p23-20020a17090635d700b00780b1979adesm6600090ejb.218.2022.11.29.13.37.02
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 13:37:03 -0800 (PST)
Received: by mail-wr1-f41.google.com with SMTP id bx10so12110546wrb.0
        for <linux-i2c@vger.kernel.org>; Tue, 29 Nov 2022 13:37:02 -0800 (PST)
X-Received: by 2002:adf:fd89:0:b0:242:1f81:7034 with SMTP id
 d9-20020adffd89000000b002421f817034mr4218482wrr.617.1669757822248; Tue, 29
 Nov 2022 13:37:02 -0800 (PST)
MIME-Version: 1.0
References: <20221118224540.619276-1-uwe@kleine-koenig.org> <20221118224540.619276-37-uwe@kleine-koenig.org>
In-Reply-To: <20221118224540.619276-37-uwe@kleine-koenig.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 29 Nov 2022 13:36:50 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VFuDRpkGPazE+xqwAj=0J8GO4EDU_fu+W72E+HQchLsQ@mail.gmail.com>
Message-ID: <CAD=FV=VFuDRpkGPazE+xqwAj=0J8GO4EDU_fu+W72E+HQchLsQ@mail.gmail.com>
Subject: Re: [PATCH 036/606] drm/bridge: ti-sn65dsi86: Convert to i2c's .probe_new()
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Fri, Nov 18, 2022 at 2:46 PM Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.or=
g> wrote:
>
> From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>
> The probe function doesn't make use of the i2c_device_id * parameter so i=
t
> can be trivially converted.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

As per request in the cover letter (and no countermands in the replies
to the cover), I'm landing this myself. Pushed to
drm-misc/drm-misc-next with my review and Laurent's.

de86815b3730 drm/bridge: ti-sn65dsi86: Convert to i2c's .probe_new()

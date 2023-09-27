Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE3077B04B3
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Sep 2023 14:54:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231378AbjI0MyG convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 27 Sep 2023 08:54:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230109AbjI0MyF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 Sep 2023 08:54:05 -0400
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ACCEC0;
        Wed, 27 Sep 2023 05:54:05 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-59c268676a9so136503617b3.0;
        Wed, 27 Sep 2023 05:54:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695819244; x=1696424044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sThNs3/TW7sTCSV76wSMCOz0Es9XY2adRXprcTalxv0=;
        b=R0Hiy+RgHDfLIV+YU7kGjxxW6faiC1TywkmScpFA5aZQi5WcaBKFDkMJX7nJCI86NQ
         8PHPqD/ErCZJuLQf2Jghxrb7vDn2g3b2cyb6ebzpF/mr2wCqa97zuDWJxYWgTKp1s2Ze
         G09A/GX3EpO7zME4YE27XfLt502wEXPJJJeFr88+P7ITPkTzAm4zadwa10UHXMch5IBf
         dhSIjR3O4AH0P+bjp4nlouUPEaBThZEScwhk+nwNzaYX8ArtJipCcNBiibtWt9jDwsYb
         Y/AKm5y5l1uQ15BETvJ17wnDl5qt6M4c+tnudX2kO5ed5GIWvVsqbBJSuigpzW1CiFGY
         ZZNA==
X-Gm-Message-State: AOJu0YyXPqDcR8HEcIEz7nx15BJ4e+9pOxgLdF5wx5PFQ/dqN7aK8+WV
        XGgFa+T+LthSPrB7GwbL7zww7M75yf4g+w==
X-Google-Smtp-Source: AGHT+IFGSn05jEgrLkFA4O0bEls7ifE+OL6GhMrzwES+SisilOgyAltUarNyK4L7lDOIoR6v3EKdfw==
X-Received: by 2002:a81:6241:0:b0:58c:b8b4:2785 with SMTP id w62-20020a816241000000b0058cb8b42785mr2383898ywb.45.1695819244071;
        Wed, 27 Sep 2023 05:54:04 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id c7-20020a0dc107000000b0058e37788bf7sm3678265ywd.72.2023.09.27.05.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 05:54:03 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-59bc956b029so135881757b3.2;
        Wed, 27 Sep 2023 05:54:03 -0700 (PDT)
X-Received: by 2002:a81:9e4e:0:b0:59b:c6a4:15c7 with SMTP id
 n14-20020a819e4e000000b0059bc6a415c7mr2090271ywj.46.1695819242821; Wed, 27
 Sep 2023 05:54:02 -0700 (PDT)
MIME-Version: 1.0
References: <06d4de31-dfe5-432d-acab-600b01422155@moroto.mountain>
In-Reply-To: <06d4de31-dfe5-432d-acab-600b01422155@moroto.mountain>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 27 Sep 2023 14:53:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWiQrswHrHJNc_DDu9COQn+yA6H3=E-LRDJh7VuUSNMeQ@mail.gmail.com>
Message-ID: <CAMuHMdWiQrswHrHJNc_DDu9COQn+yA6H3=E-LRDJh7VuUSNMeQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: rcar: fix error code in probe()
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 27, 2023 at 2:38 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> Return an error code if devm_reset_control_get_exclusive() fails.
> The current code returns success.
>
> Fixes: 0e864b552b23 ("i2c: rcar: reset controller is mandatory for Gen3+")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

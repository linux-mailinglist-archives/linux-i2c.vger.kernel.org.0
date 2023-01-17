Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4979D66DAA3
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jan 2023 11:10:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236166AbjAQKKs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Jan 2023 05:10:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236186AbjAQKKr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Jan 2023 05:10:47 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0954A2DE46
        for <linux-i2c@vger.kernel.org>; Tue, 17 Jan 2023 02:10:46 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id o75so33390411yba.2
        for <linux-i2c@vger.kernel.org>; Tue, 17 Jan 2023 02:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FeEunc7c57U5E1ES1PmT/Q3aXB6Rrk9Kw0lbs/3Ve34=;
        b=r4Y8AeRJHMntKx3E3zrj5Lg4Sc0z8x5ocjMZCtEz06VvYBC7o3nz0eoUkscm63Twni
         Dc5PvQ08L/s9q0cmRNMoF2mAyir8csfhqKS7RV37chmqCtj2/1WLvVyDsqoOs5MllaxB
         vm7MOM5BBxA+3xrOaUDL9ff/dPgwgcMxX663rdM5v6JhkaRBahnCaQ1Ke0MXFfWxqJJJ
         kJYwESfuhk1uYXizHNA1svrO4zKpenvSSagP/N7nO99l9gQWquy+eJx6ZIwr/ONLUexj
         xS3bIwp17/+FS0Bg3EyKIVOkytFBskiYPo6kWX1pMWTsdIaCMX7t2XhM0ifZbSGwj8Wc
         K58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FeEunc7c57U5E1ES1PmT/Q3aXB6Rrk9Kw0lbs/3Ve34=;
        b=KYxrt1k0y6xXg2YcW0eRDLAZlBGmGH0TtsEHHRhk+KpfwsWSrr3iSxcEEl7tvSxnTz
         bLL+UCJsyI4GVlowcfBa++F/peJrgIOXQic52yEAZyjLZ7RBJRK+DZ2hwcBFLupWvgk7
         vbyTm14jr4pDqdjRNKY2ynJdU+MCXseZ00TZyzU0nA5og4TCkjdSR0aqmMdPNspkUVB9
         alwOINSgLffpw0Ow6KDLJcXV60CI2hzwNY2XLayZW1GW4P5Ryk2Tlg3VQzWW5G7Ro5aI
         xCaUib0O2s+/CMCdXnZ+RqAAMeR+G9iALHQ6lTWOtirzeVIt5aZ9DtvDXbLs0gOEzei3
         XRdg==
X-Gm-Message-State: AFqh2kqkpd7ABPFx7EpEx1Yu5zi9kuCLkfEJTuVTSN91ryWDBT8mAfxE
        QrldvYTXOv+j5IDSN/Bx3Jm2NdAIsHLI4YA0oGiCbA==
X-Google-Smtp-Source: AMrXdXv0gA0hfaUYQyNfwgI6QBjO1oc3PkS2MFkcihdf6QXBd8Z9IkTidsmhdZmOCY94JZ8tbpX94NjYLMr3520GUEo=
X-Received: by 2002:a25:34c5:0:b0:7b3:105b:ac90 with SMTP id
 b188-20020a2534c5000000b007b3105bac90mr450563yba.196.1673950245215; Tue, 17
 Jan 2023 02:10:45 -0800 (PST)
MIME-Version: 1.0
References: <20221229160045.535778-1-brgl@bgdev.pl> <20221229160045.535778-3-brgl@bgdev.pl>
 <Y8ZzkfYZgJ54XzdH@ninjato>
In-Reply-To: <Y8ZzkfYZgJ54XzdH@ninjato>
From:   Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date:   Tue, 17 Jan 2023 11:10:34 +0100
Message-ID: <CACMJSev_hLAzaF2M15raxb49mkE7fFMN8T+BdT9-TYu2BJkasg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] i2c: dev: don't allow user-space to deadlock the kernel
To:     Wolfram Sang <wsa@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 17 Jan 2023 at 11:08, Wolfram Sang <wsa@kernel.org> wrote:
>
>
> > In order to fix that, we introduce a couple changes. They need to be
> > part of a single commit in order to preserve bisectability. First, drop
>
> Do you have maybe a branch at hand with more finegrained commits just
> for reviewing?
>

No, not really. It can be logically split into two elements though:
removing the existing completion and then adding the locking bits
which unfortunately go into many places. I tried to make the commit
description as elaborate as possible but let me know if you have any
specific questions.

Bart

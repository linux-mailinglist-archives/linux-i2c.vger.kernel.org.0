Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2689573DEEC
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Jun 2023 14:22:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230157AbjFZMW5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Jun 2023 08:22:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230436AbjFZMWY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Jun 2023 08:22:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51EB310CB
        for <linux-i2c@vger.kernel.org>; Mon, 26 Jun 2023 05:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687782025;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=f4vEnpeHtZHPppkUB7DQI3x8ba1zzvqDl/kIZMSjZfo=;
        b=aPS5E5ZChugmrQLcC3U9rxFyMWX4NG96KCtoWNOi1g5mYskeyr1HeAIOK9wnB4BNnBNWp8
        KDU7E6idjPl09wJ5q0aqTNq1tQgkWFCtZBBpISuRCO+wj7d6pVBm3H1YxR1bgmfqP8gQpj
        cc/InOr+dCKycSGOjMYYYKWIixQzcAI=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-DPHVuOFnNoepZqgnLFXKOA-1; Mon, 26 Jun 2023 08:20:23 -0400
X-MC-Unique: DPHVuOFnNoepZqgnLFXKOA-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-4ec790b902bso2192182e87.1
        for <linux-i2c@vger.kernel.org>; Mon, 26 Jun 2023 05:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687782020; x=1690374020;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4vEnpeHtZHPppkUB7DQI3x8ba1zzvqDl/kIZMSjZfo=;
        b=J1T+miUPzcI2vC9yrUF99jJJgLvj3j7JUbBGlB9GEWIdvXeJDFHDxVu5VqUaFIIHxG
         YdRLjE+kZmNGHKEnghYE7/rAZt7l2qx3s/RkXiFm+GCB9le21tmG7lpy2ui2SrC1mDpn
         RYeRxTm1tXoA14KJRgYJ9YIIEcnjImctwqnS3Kq3r908+TXpqBZjJdlEWW8gWFZsYMH0
         AKtsKVFgu+6P1Wis9eTPMHbXSGxE7kd9hXE75nBdnaF5qflGdxQJvEyJeQq38L98FEUK
         Xw2VOy7J4UrfHm/ClLNeP3HmZ2DwUg1FWu2IDMDWBE9yffHuod9uUUbizBl0JXZUTecG
         TokA==
X-Gm-Message-State: AC+VfDwGJT3iRvS9VXSyUiipNk+dxhkHhB0ygFf26pCr7qRqL0cbnBGQ
        am5KxqPQtXbbkNJmrHFbNzl5bFRK8GAoBRMbLT8bTJS8rRGUYdeYk8rznDDcmD8IbojeBxJcgVR
        ZwDawqlenB6DtO0rNU4xp
X-Received: by 2002:a05:6512:684:b0:4f9:b649:23d2 with SMTP id t4-20020a056512068400b004f9b64923d2mr3588223lfe.42.1687782020739;
        Mon, 26 Jun 2023 05:20:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4aYLMwAvDWzR5szGtAvFD6w2SLDLQOe4ec3ZLDV5fTAY/euApU3dfxpV/SJVi4DBgf7GbHbQ==
X-Received: by 2002:a05:6512:684:b0:4f9:b649:23d2 with SMTP id t4-20020a056512068400b004f9b64923d2mr3588199lfe.42.1687782020405;
        Mon, 26 Jun 2023 05:20:20 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id h11-20020a1ccc0b000000b003fa8158135esm8263953wmb.11.2023.06.26.05.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 05:20:20 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Wolfram Sang <wsa@kernel.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        kernel@pengutronix.de, linux-i2c@vger.kernel.org,
        Lee Jones <lee@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pavel Machek <pavel@ucw.cz>, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH] i2c: Drop legacy callback .probe_new()
In-Reply-To: <20230626094548.559542-1-u.kleine-koenig@pengutronix.de>
References: <20230626094548.559542-1-u.kleine-koenig@pengutronix.de>
Date:   Mon, 26 Jun 2023 14:20:19 +0200
Message-ID: <87v8fah0u4.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


Hello Uwe,

Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> writes:

> Now that all drivers are converted to the (new) .probe() callback, the
> temporary .probe_new() can go away. \o/
>

For some definition of "temporary" :)

> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
>
> I was planning to send out this patch for inclusion into next after
> v6.5-rc1 as I thought there were only three drivers left to be converted
> before (on top of today's next/master). While preparing to submit this
> patch I noticed that a few more .probe_new were introduced in next even
> after commit 03c835f498b5 ("i2c: Switch .probe() to not take an id
> parameter"). I just sent out patches for all drivers in next that are
> still using .probe_new. These are:
>
>  - w1: ds2482: Switch back to use struct i2c_driver's .probe()
>    https://lore.kernel.org/lkml/20230612072807.839689-1-u.kleine-koenig@p=
engutronix.de
>    Krzysztof Kozlowski already signaled this won't go into 6.5-rc via
>    his tree, and he's ok if it goes in via i2c then.
>
>  - drm/i2c: Switch i2c drivers back to use .probe()
>    https://lore.kernel.org/dri-devel/20230611202740.826120-1-u.kleine-koe=
nig@pengutronix.de
>    Currently applied to
>
> 	https://anongit.freedesktop.org/git/drm/drm-misc.git drm-misc-next
>
>    as d13b5d2b2b45. This won't make it onto v6.5-rc1 either.
>

Right, sorry for not getting that one in time...

[...]

> Until we're there, feel free to already look at this patch. I was unsure
> if I should split of the change to Documentation/hwmon/pmbus.rst. As
> .probe() already works in v6.3-rc2 this hunk could go in already
> earlier, e.g. via the hwmon tree. While thinking about that, the hunk
> for Documentation/i2c/writing-clients.rst could go in before, too.
> So tell me your thoughts, then I can split as desired.
>

I think that would be better to split indeed.

> Best regards
> Uwe
>

[...]

> -	union {
>  	/* Standard driver model interfaces */
> -		int (*probe)(struct i2c_client *client);
> -		/*
> -		 * Legacy callback that was part of a conversion of .probe().
> -		 * Today it has the same semantic as .probe(). Don't use for new
> -		 * code.
> -		 */
> -		int (*probe_new)(struct i2c_client *client);
> -	};
> +	int (*probe)(struct i2c_client *client);
>  	void (*remove)(struct i2c_client *client);
>

Thanks for your persistence to get to this point!

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


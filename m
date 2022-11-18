Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63B326302BF
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 00:15:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235442AbiKRXPE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 18:15:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231891AbiKRXNr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 18:13:47 -0500
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF32FCC167;
        Fri, 18 Nov 2022 14:57:59 -0800 (PST)
Received: by mail-qv1-xf32.google.com with SMTP id mi9so4337397qvb.8;
        Fri, 18 Nov 2022 14:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tT/wzOTMbhvvGHh4sBkzftGUxObb5sHdWneJalNb5T4=;
        b=RcbGUBg4xbwc3yPt7fsgLY4TJuYFKJQGI2mutEib/SK7cUCQS0BnzsURytWZpeDNNV
         CHM2mT39PdrBnlawZTvLcMyinVEG4gKgDVG2Ie46fYaDV1kButPPDF82qzoEYawWlGN4
         lLFPsBvDh2aGRpz/+Qp2+BGLIkp9HN8MbyRP2K8169zHJrrHYP7iYZETLZn0WLyV5kcN
         dr5sYudFiXfBeGJNZXO5VP+FRWEDW1O3en5Z5uL0PfwHZphYBYlqvNCfN9JTDEoaSWIq
         GOCeANKOAOlaY6O4ufod+cu3oo4XvLqYr8t5yJS2CMjEwnzNmRhLFFbb+hh0GjazTicH
         H6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tT/wzOTMbhvvGHh4sBkzftGUxObb5sHdWneJalNb5T4=;
        b=bhe4yVrgWkDCackPnMqUyKvtzoc+MGNriXS70jqpN0I1Q4DlSymdzCc+HWYoMALnzw
         MAnO8hsWAtCJMB2CBVlArpO2NDz2xjU/8UQP9TIiDrWiUDnk9FHBxi72886rFVy1l5gN
         WlSSzE4EHF9JaiIeu0iufg01gUR9ziA6xarXxYjrVWsAwlY4FInvGcn1JYhWlO6rRdhV
         W83oR4O4Cb7fufZHhrCO1I0N/z9lQMUscPKb/CXEGmOoWU/tIP+UzhB8k2MlQ/47phu/
         1TNfB5Ufekr1ILuZmoY4O7FXKFOgBPIS3g03vQKSIblKAkzuShBFJOABzESm89nPfMR3
         b6Mw==
X-Gm-Message-State: ANoB5pmYAEzjcc33lorYL4fIgoV6L6PVwl4K+TrJ7mrs0pnQMU03KUKg
        WqmTWIOoeIZ50rB7ygIphLI=
X-Google-Smtp-Source: AA0mqf4vDCu3XP0B4C9zT1Zl8ROTrEgmMWli/FAXN+GcmuInmqXvFTxQEScfE4LB0MYDNHPjJ8fCqw==
X-Received: by 2002:a05:6214:5984:b0:4c6:9390:983 with SMTP id ll4-20020a056214598400b004c693900983mr4646214qvb.65.1668812255158;
        Fri, 18 Nov 2022 14:57:35 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h9-20020a05620a244900b006fbdeecad51sm822570qkn.48.2022.11.18.14.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 14:57:34 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 18 Nov 2022 14:57:33 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 582/606] usb: typec: tcpm/tcpci_rt1711h: Convert to i2c's
 .probe_new()
Message-ID: <20221118225733.GE686528@roeck-us.net>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-583-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-583-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:45:16PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/usb/typec/tcpm/tcpci_rt1711h.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> index 7b217c712c11..a0e9e3fe8564 100644
> --- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> +++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> @@ -327,8 +327,7 @@ static int rt1711h_check_revision(struct i2c_client *i2c, struct rt1711h_chip *c
>  	return ret;
>  }
>  
> -static int rt1711h_probe(struct i2c_client *client,
> -			 const struct i2c_device_id *i2c_id)
> +static int rt1711h_probe(struct i2c_client *client)
>  {
>  	int ret;
>  	struct rt1711h_chip *chip;
> @@ -413,7 +412,7 @@ static struct i2c_driver rt1711h_i2c_driver = {
>  		.name = "rt1711h",
>  		.of_match_table = of_match_ptr(rt1711h_of_match),
>  	},
> -	.probe = rt1711h_probe,
> +	.probe_new = rt1711h_probe,
>  	.remove = rt1711h_remove,
>  	.id_table = rt1711h_id,
>  };
> -- 
> 2.38.1
> 

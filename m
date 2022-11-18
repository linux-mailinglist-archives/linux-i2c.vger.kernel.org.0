Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9E416302A7
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 00:13:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232591AbiKRXNN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 18:13:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235128AbiKRXMt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 18:12:49 -0500
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10AFEC4B7F;
        Fri, 18 Nov 2022 14:57:36 -0800 (PST)
Received: by mail-qk1-x72a.google.com with SMTP id v8so4481725qkg.12;
        Fri, 18 Nov 2022 14:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gqBZzenlXFsNRynWHVvoZBn8WRUCIsjBVyylMpKiFd4=;
        b=Arj2WeK5M1TrpcD+ufwGTrw65So5hzcgkX9kHA4HT6JXR5dIY/+J9Jv9FXywgt5R2i
         OMV4K9LPZ4/ud4p83xLt7EUTAUnOaERWoFMRLCvECS5mignod6B16Y1HZ1Q6H2Ndxd4I
         qPG0oMeUjRga6Owht0BL7UR7TT8eEbf7mNd2bgVw40hRtsIyLkSTzYhRKduYUapqzGr1
         Y+jgUCE6PytKDahprAyIgcfy5eZA6P1dVCfyD/x+yNVYcK/sCZUAe+ovAYF/G/9Nnmmg
         IcC5ZTz/XTHeHnXtlFy6/T42ckxzcb0EELMJbaP6aK1/Si5mR93ODt4XdcSybmEgZ/bM
         mJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gqBZzenlXFsNRynWHVvoZBn8WRUCIsjBVyylMpKiFd4=;
        b=Y97yvJklDJ50yH/RlwXeX5isB1Puq1kdz2n8PmEnl8blisgdrUCAiNTrVNYWx81Mv0
         y7A3gzaIPWqdzN0wkAuqI/BohoZruNkTw6gOI260xSAhEEpAS3iZo51qe+H6cb3Ez+M1
         hjuPDodQ2rjl1my0W2BCayFc7zbgg1yMTx00gw8JrlylnaJTsBkTjncFTvWWnYODLlUf
         23p30e39KFGq2KuvsPxhSzsPPeeV7EN4enKnMXFQe8xIVWnDKMoHL2ruRsO5cjQTN0hx
         SnUm0LmLGJzMilULPgx4vf/C+j/P8ZSQYhjLuwzGQVr6ZaYRbzkLg1dOxfl6liu8i/Wo
         T91g==
X-Gm-Message-State: ANoB5plTQjdKmPSbr5/MxvkHgPwxdzdnttyztdzKJpjfdAkxWjLbUQVi
        U82saZOVgRXGqJLUKGG6RhxHmTiJ+UI=
X-Google-Smtp-Source: AA0mqf5b5gFIjp30ij4O6cZxTH1QOgngXCoWIuuLpn7Jy43rM1pev67AhZbvjlGirLrMoRaWhar64A==
X-Received: by 2002:a05:620a:1e9:b0:6f9:fe9e:8920 with SMTP id x9-20020a05620a01e900b006f9fe9e8920mr7914884qkn.154.1668812233511;
        Fri, 18 Nov 2022 14:57:13 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bm3-20020a05620a198300b006ecfb2c86d3sm3237129qkb.130.2022.11.18.14.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 14:57:13 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 18 Nov 2022 14:57:11 -0800
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
Subject: Re: [PATCH 580/606] usb: typec: tcpm/tcpci: Convert to i2c's
 .probe_new()
Message-ID: <20221118225711.GC686528@roeck-us.net>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-581-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-581-uwe@kleine-koenig.org>
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

On Fri, Nov 18, 2022 at 11:45:14PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/usb/typec/tcpm/tcpci.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index b2bfcebe218f..d3efb9665901 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -807,8 +807,7 @@ void tcpci_unregister_port(struct tcpci *tcpci)
>  }
>  EXPORT_SYMBOL_GPL(tcpci_unregister_port);
>  
> -static int tcpci_probe(struct i2c_client *client,
> -		       const struct i2c_device_id *i2c_id)
> +static int tcpci_probe(struct i2c_client *client)
>  {
>  	struct tcpci_chip *chip;
>  	int err;
> @@ -878,7 +877,7 @@ static struct i2c_driver tcpci_i2c_driver = {
>  		.name = "tcpci",
>  		.of_match_table = of_match_ptr(tcpci_of_match),
>  	},
> -	.probe = tcpci_probe,
> +	.probe_new = tcpci_probe,
>  	.remove = tcpci_remove,
>  	.id_table = tcpci_id,
>  };
> -- 
> 2.38.1
> 

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F6316302B1
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 00:14:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232252AbiKRXOP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 18:14:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235383AbiKRXNN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 18:13:13 -0500
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6697C6895;
        Fri, 18 Nov 2022 14:57:52 -0800 (PST)
Received: by mail-qv1-xf2c.google.com with SMTP id k2so3164664qvo.1;
        Fri, 18 Nov 2022 14:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DRSZ8vz2JBurVDNkllq2zvTvjp7OIMvQxjZt0vDMROI=;
        b=C/DZRe5LMk3WkU1/CvVvb1esNDyrSTXi7JDlawr6DcPJ9ipIaf+WgOdMEJw1eHT4rs
         YN5AObOJvCMgiuVlMhiKT6Dx/VrXZg+VNR4vH+dtR5gUUtcFO1xBmG30BJp6emfdeUr9
         ScvkL44QohpE3xTYPPx0h65LTzW7iQTywq8W8yWFzS6drONh7hMwzWnbyGqqkLj3f6e6
         FTcnMjvc/6gbBeh+b1qC59a6IsmQZC8bdwcF1SqVtmUh4VqJf612mOHo87rhRWa/LwJn
         +cPFfTqPQmNgElME7+9H8L7yRSVIwHEGA9788yC61uMP8sFzx05dtHx1YhiVFsC3ooKC
         DIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DRSZ8vz2JBurVDNkllq2zvTvjp7OIMvQxjZt0vDMROI=;
        b=QHGQ9YljPcKE+Vjb+BNhVyjI9r48RsQslYuWSw77REBMTU9P7hkr2DQKdOnTC11ew4
         lS3anuUhoPlMxf+G8wXXpQyjQFXA10mhRibvY+svcy/rQ7aKZDlSWfNxyqMiStbo/gD1
         CYUopQHxfRKa24kDZ75Yjexx+JorNWHjhnyfIuVmLoXo1/INT+wwwfV2F080fitPci+l
         oIVNwzr8e8g84zTbES4uLtJ1w9FIXExuSD7RCAaITa4ewxicATs6zXBewOy7UlYHMDUF
         BjTZgiZHDys90kk0xHgLFMBZKfSFPYaQu+3hUCSeMmPx3K27vMDlz3T3y0Co7UrRL8x8
         yb5g==
X-Gm-Message-State: ANoB5plF60DdnvVLnbCQvDSqHoS2Ep3w5C0TB0SkRhfvo5kXr9+xJTrm
        RrN9zxjnEGWsZPUI2k/awbA=
X-Google-Smtp-Source: AA0mqf5yJgexXVhvlhbcHOy/hCVfY4LRrRXaYMw8m5x5Mx61iqXTq87tsHu8WnvwIp2PwTDX7H48EQ==
X-Received: by 2002:a0c:c350:0:b0:4b9:59d6:d936 with SMTP id j16-20020a0cc350000000b004b959d6d936mr8624789qvi.14.1668812244360;
        Fri, 18 Nov 2022 14:57:24 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l21-20020a37f915000000b006fa7b5ea2d1sm3289379qkj.125.2022.11.18.14.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 14:57:24 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 18 Nov 2022 14:57:22 -0800
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
Subject: Re: [PATCH 581/606] usb: typec: tcpm/tcpci_maxim: Convert to i2c's
 .probe_new()
Message-ID: <20221118225722.GD686528@roeck-us.net>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-582-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-582-uwe@kleine-koenig.org>
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

On Fri, Nov 18, 2022 at 11:45:15PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/usb/typec/tcpm/tcpci_maxim.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci_maxim.c b/drivers/usb/typec/tcpm/tcpci_maxim.c
> index 03f89e6f1a78..83e140ffcc3e 100644
> --- a/drivers/usb/typec/tcpm/tcpci_maxim.c
> +++ b/drivers/usb/typec/tcpm/tcpci_maxim.c
> @@ -438,7 +438,7 @@ static int tcpci_init(struct tcpci *tcpci, struct tcpci_data *data)
>  	return -1;
>  }
>  
> -static int max_tcpci_probe(struct i2c_client *client, const struct i2c_device_id *i2c_id)
> +static int max_tcpci_probe(struct i2c_client *client)
>  {
>  	int ret;
>  	struct max_tcpci_chip *chip;
> @@ -519,7 +519,7 @@ static struct i2c_driver max_tcpci_i2c_driver = {
>  		.name = "maxtcpc",
>  		.of_match_table = of_match_ptr(max_tcpci_of_match),
>  	},
> -	.probe = max_tcpci_probe,
> +	.probe_new = max_tcpci_probe,
>  	.remove = max_tcpci_remove,
>  	.id_table = max_tcpci_id,
>  };
> -- 
> 2.38.1
> 

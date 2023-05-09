Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E61856FC180
	for <lists+linux-i2c@lfdr.de>; Tue,  9 May 2023 10:14:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233960AbjEIIOV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 May 2023 04:14:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232838AbjEIIOU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 May 2023 04:14:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECA6A1BFF
        for <linux-i2c@vger.kernel.org>; Tue,  9 May 2023 01:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683620015;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=u2VzASqpSg1gqLcJEB7PrUxhOuQVcAY+9lz892Hy1iI=;
        b=M/1ppKfyYeY1zazf6H87oHwjWqBD2u0uO7ANXlujUwGn9lUQbmsMISOCWh5bpSb5BFd/dX
        K+KR7nJAZByDdJiC4Xxgj3YVW39HQpErLhUrFwAIabhOqi83isx9rtsBkLYB04MCwFNjU+
        hbww4RCmYYDp64ygM5raqjaSnfBKHAU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-s1iLhS3FP62xOQpE3zPbsw-1; Tue, 09 May 2023 04:13:34 -0400
X-MC-Unique: s1iLhS3FP62xOQpE3zPbsw-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-50bf847b267so6408615a12.3
        for <linux-i2c@vger.kernel.org>; Tue, 09 May 2023 01:13:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683620012; x=1686212012;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u2VzASqpSg1gqLcJEB7PrUxhOuQVcAY+9lz892Hy1iI=;
        b=aZMgEMIovZTHQOrERKXj/i/yJTMr/YFr0dBwAmuxPGxKwEdSg0R0wjcJ8rTutFkHV4
         c7v6pO+aVzDaX1Fc7mLbEynEK8p8iRFM+BIDUIQiz2L68C+nTURGw2pfJY3DNZWWrfaJ
         pOdX+/hS7v6S9wmQXgozKctoBJJLjN7KAOIosO0NS7wqK40MfHsRjy4dvRs1BfgdHAns
         vUOx5fI6QJQHpoZIBUwNAt6vAOZ8HF3LyhgLCSHkqJQLZNbVKqMkMBUaYrpUTHhm26Iy
         rJYoRE1rKAHCQhu71jvzavSaseG1CK71GCGtRK0+kMzJQ43sEXaQmor97g8+9UiCT3KL
         TFbw==
X-Gm-Message-State: AC+VfDxdX7pLyTPXVZ5DBopwCh5OA3B4uc6BjzfC5zvNf1R9LndKylK7
        eu0uFcDkK7eFQdVhIs0/Z1MaCyCTpOxhThua6Xk9j7YenMcczb/0mjNf/yqeny6NUiqo/KI62tt
        Qyf5nG4Y6r3fQqGH7DxIplPrf/q7+
X-Received: by 2002:aa7:d686:0:b0:50b:f9d8:ff72 with SMTP id d6-20020aa7d686000000b0050bf9d8ff72mr10753580edr.31.1683620012731;
        Tue, 09 May 2023 01:13:32 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ42sXlvo8bOmu+9PV3qD/95tfj+FzjAoP5CnSBjQDAOp/nEnS1cGWOoAwy8HXRc+MJNuG+8gA==
X-Received: by 2002:aa7:d686:0:b0:50b:f9d8:ff72 with SMTP id d6-20020aa7d686000000b0050bf9d8ff72mr10753566edr.31.1683620012399;
        Tue, 09 May 2023 01:13:32 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id s13-20020aa7c54d000000b00506b2af49fbsm454127edr.81.2023.05.09.01.13.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 01:13:31 -0700 (PDT)
Message-ID: <b5123508-e8b1-f651-f071-410cfb38dd2a@redhat.com>
Date:   Tue, 9 May 2023 10:13:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 13/89] i2c: cht-wc: Convert to platform remove callback
 returning void
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230508205306.1474415-14-u.kleine-koenig@pengutronix.de>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230508205306.1474415-14-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 5/8/23 22:51, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/i2c/busses/i2c-cht-wc.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-cht-wc.c b/drivers/i2c/busses/i2c-cht-wc.c
> index 2b2c3d090089..0209933b9a84 100644
> --- a/drivers/i2c/busses/i2c-cht-wc.c
> +++ b/drivers/i2c/busses/i2c-cht-wc.c
> @@ -529,15 +529,13 @@ static int cht_wc_i2c_adap_i2c_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int cht_wc_i2c_adap_i2c_remove(struct platform_device *pdev)
> +static void cht_wc_i2c_adap_i2c_remove(struct platform_device *pdev)
>  {
>  	struct cht_wc_i2c_adap *adap = platform_get_drvdata(pdev);
>  
>  	i2c_unregister_device(adap->client);
>  	i2c_del_adapter(&adap->adapter);
>  	irq_domain_remove(adap->irq_domain);
> -
> -	return 0;
>  }
>  
>  static const struct platform_device_id cht_wc_i2c_adap_id_table[] = {
> @@ -548,7 +546,7 @@ MODULE_DEVICE_TABLE(platform, cht_wc_i2c_adap_id_table);
>  
>  static struct platform_driver cht_wc_i2c_adap_driver = {
>  	.probe = cht_wc_i2c_adap_i2c_probe,
> -	.remove = cht_wc_i2c_adap_i2c_remove,
> +	.remove_new = cht_wc_i2c_adap_i2c_remove,
>  	.driver = {
>  		.name = "cht_wcove_ext_chgr",
>  	},


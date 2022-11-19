Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C55E630EE1
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 14:00:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233386AbiKSNAm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Nov 2022 08:00:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231843AbiKSNAl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Nov 2022 08:00:41 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C96975D84
        for <linux-i2c@vger.kernel.org>; Sat, 19 Nov 2022 04:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668862780;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UM5/eK0x4588vJ74t5BQpzCz6Kkx7HScHipjUXodFbQ=;
        b=Kaw/dvP+dwlxGhOQRVHTf3IqgKDAj6gDAqCDtTEF590ug/M7be5CY+MJ9q4F6lTPEwYG/W
        3569GSpNvSgoVdbBKzZN6uBX9rkYpB+8HcR7uN5wsFbFnNxh4APaIaDafYZVqHGwcmb75N
        ZLYGjdEqFql1HIBwauNdMBCjufvxFnU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-515-dzfKvfq6NZu4po0A9L7kRg-1; Sat, 19 Nov 2022 07:59:38 -0500
X-MC-Unique: dzfKvfq6NZu4po0A9L7kRg-1
Received: by mail-ed1-f69.google.com with SMTP id f20-20020a0564021e9400b00461ea0ce17cso4145403edf.16
        for <linux-i2c@vger.kernel.org>; Sat, 19 Nov 2022 04:59:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UM5/eK0x4588vJ74t5BQpzCz6Kkx7HScHipjUXodFbQ=;
        b=DPWycg/gGZaTqeaFnqYOSkxMgPKAXfuHODKclFYZzD+jnNIilWJte1bE91WwXZoo9+
         +p6p+583xnoFMzo+JwXGOBhWm9OJrMTU+1i3fYr6QoSTevTkue3SG07gCzmJz64HPRy9
         Il7AggGytpbsZAPe25nHTSpoY9FMndMqD17dZU+uWsh6EJIp2HIIBspDjr6rO6SMGa5P
         kZb52rlgZAT6WfF63plaVxxYxqKJhx0Jdm2d0NeUuyFQRb6mAQJAdJcq8qx4cLKcOM9O
         +UiXj9oPAp+2i71G/1n6rx6f4TdZIzJOl8jsMkR08HzcQNZ/Jg7doMvEKMNmjpGGn6pB
         jR4A==
X-Gm-Message-State: ANoB5plXg3VEINZNdskG0u9VwMhvVfcPFmYeViZ/xeIL3BDouYj7evFq
        6Toxfmpo6XVTnw9auO6IAQRJlo35x3Jz5A6ihQkWx9uXyskyLPCRj7cTcRt3y688BtcaCO5T6xF
        SYbhPBqDKytt3LznUsnjQ
X-Received: by 2002:aa7:d5c9:0:b0:463:c64e:bc75 with SMTP id d9-20020aa7d5c9000000b00463c64ebc75mr9669433eds.205.1668862777662;
        Sat, 19 Nov 2022 04:59:37 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4006RzPisPmLsYq2FV4QIzE0awfpDSgLwy2GRRpncZj22swQXn47+gtoldOQ8YsQPVXmBsAg==
X-Received: by 2002:aa7:d5c9:0:b0:463:c64e:bc75 with SMTP id d9-20020aa7d5c9000000b00463c64ebc75mr9669421eds.205.1668862777490;
        Sat, 19 Nov 2022 04:59:37 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id d12-20020a056402078c00b0045b3853c4b7sm2950296edy.51.2022.11.19.04.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Nov 2022 04:59:36 -0800 (PST)
Message-ID: <4e3deedc-40f1-0bf9-798b-88185bd89be8@redhat.com>
Date:   Sat, 19 Nov 2022 13:59:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 257/606] Input: silead - Convert to i2c's .probe_new()
Content-Language: en-US, nl
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-258-uwe@kleine-koenig.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221118224540.619276-258-uwe@kleine-koenig.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 11/18/22 23:39, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> .probe_new() doesn't get the i2c_device_id * parameter, so determine
> that explicitly in the probe function.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/input/touchscreen/silead.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/silead.c b/drivers/input/touchscreen/silead.c
> index 3eef8c01090f..8a7351c4414c 100644
> --- a/drivers/input/touchscreen/silead.c
> +++ b/drivers/input/touchscreen/silead.c
> @@ -652,9 +652,9 @@ static void silead_disable_regulator(void *arg)
>  	regulator_bulk_disable(ARRAY_SIZE(data->regulators), data->regulators);
>  }
>  
> -static int silead_ts_probe(struct i2c_client *client,
> -			   const struct i2c_device_id *id)
> +static int silead_ts_probe(struct i2c_client *client)
>  {
> +	const struct i2c_device_id *id = i2c_client_get_device_id(client);
>  	struct silead_ts_data *data;
>  	struct device *dev = &client->dev;
>  	int error;
> @@ -826,7 +826,7 @@ MODULE_DEVICE_TABLE(of, silead_ts_of_match);
>  #endif
>  
>  static struct i2c_driver silead_ts_driver = {
> -	.probe = silead_ts_probe,
> +	.probe_new = silead_ts_probe,
>  	.id_table = silead_ts_id,
>  	.driver = {
>  		.name = SILEAD_TS_NAME,


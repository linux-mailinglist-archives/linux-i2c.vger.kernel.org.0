Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA25E34D3EA
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 17:29:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231318AbhC2P2t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Mar 2021 11:28:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42675 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231396AbhC2P2R (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Mar 2021 11:28:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617031696;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=O2qGIcL3gPlDmT/SXMBUkWim0YVW929F3PLS859iGE4=;
        b=EvdI8XInjmPNTQ5xh2HbvhZYH6WQkKI4KR7lTM30vshqih25V/BRvz5ZUsys9b0bzhH4gk
        qmJQxXKAjlYquJMmh2hh1OzhF7KUnewKAWZtPc4JmDLQk99Vuke6UGKbJx/N6Phqh9WiMZ
        SydIJDS/DJi+RUuRR25ds0A9CUDYoAc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-kpoVucZZPyO_1q_76_vdBQ-1; Mon, 29 Mar 2021 11:28:14 -0400
X-MC-Unique: kpoVucZZPyO_1q_76_vdBQ-1
Received: by mail-ed1-f70.google.com with SMTP id cq11so8738775edb.14
        for <linux-i2c@vger.kernel.org>; Mon, 29 Mar 2021 08:28:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=O2qGIcL3gPlDmT/SXMBUkWim0YVW929F3PLS859iGE4=;
        b=Sou9W4MIkvv7oIkZbCOsgLGDh6ki/oR6muEfQRI3T9ekRiqdOkv5omB9vonnCvKc4V
         YfnURRr18qmaMFzo1hmj1q9vdrDZDiU9Ysh/XowNHdkLCtz0bdJQVeDFybhCyRVG9aM2
         LmoYh7akCYN1g28D+qXfvqKk8cQsQ9X1jEYk4D+S4BDZB0awPVutwU1jvWZo4L2tbYzs
         vk1lLcDlro8AKdUVPR2x4VxRRMyQJmVEBEvc8vRbT1SkyHSGwHxrvhj2SnRLk5cg6TOS
         HHm7jURG0NVRFykZhxdBmg+YA+D81AymUf2E+ec6Ly2Eev5utJtgEv37geyLa6PMsr8J
         mbJA==
X-Gm-Message-State: AOAM530rOcW+avtnrFNZQkZo0tmkjKIsb6TUMs0VP+3F+7xFC6FcCtJf
        nORwX6mrcVCGoUI9xGTqN60AA94mvUcedg9vZ1xDljsP9WmomaAF7/i5tDO7965LfaaioV2Dapr
        syRJUrVSPNBJ6BLczz7iH
X-Received: by 2002:a17:907:62a7:: with SMTP id nd39mr29228251ejc.510.1617031692271;
        Mon, 29 Mar 2021 08:28:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwN35hX/sQ1xF+aGTdUEvUTjiZjJvSoyEdPEOyIZez2kJAtO9JX2POrqlOnGoU+JKFMOHXM4w==
X-Received: by 2002:a17:907:62a7:: with SMTP id nd39mr29228239ejc.510.1617031692156;
        Mon, 29 Mar 2021 08:28:12 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id s14sm6924976ejm.110.2021.03.29.08.28.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Mar 2021 08:28:11 -0700 (PDT)
Subject: Re: [PATCH 07/12] i2c: cht-wc: Constify the software node
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
 <20210329105047.51033-8-heikki.krogerus@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ec0358e7-2545-2723-994d-653bb5c47bde@redhat.com>
Date:   Mon, 29 Mar 2021 17:28:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210329105047.51033-8-heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 3/29/21 12:50 PM, Heikki Krogerus wrote:
> Additional device properties are always just a part of a
> software fwnode. If the device properties are constant, the
> software node can also be constant.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/i2c/busses/i2c-cht-wc.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-cht-wc.c b/drivers/i2c/busses/i2c-cht-wc.c
> index f80d79e973cd2..08f491ea21ac9 100644
> --- a/drivers/i2c/busses/i2c-cht-wc.c
> +++ b/drivers/i2c/busses/i2c-cht-wc.c
> @@ -280,6 +280,10 @@ static const struct property_entry bq24190_props[] = {
>  	{ }
>  };
>  
> +static const struct software_node bq24190_node = {
> +	.properties = bq24190_props,
> +};
> +
>  static struct regulator_consumer_supply fusb302_consumer = {
>  	.supply = "vbus",
>  	/* Must match fusb302 dev_name in intel_cht_int33fe.c */
> @@ -308,7 +312,7 @@ static int cht_wc_i2c_adap_i2c_probe(struct platform_device *pdev)
>  		.type = "bq24190",
>  		.addr = 0x6b,
>  		.dev_name = "bq24190",
> -		.properties = bq24190_props,
> +		.swnode = &bq24190_node,
>  		.platform_data = &bq24190_pdata,
>  	};
>  	int ret, reg, irq;
> 


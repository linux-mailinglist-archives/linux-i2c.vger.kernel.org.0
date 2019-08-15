Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9286D8F115
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2019 18:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730559AbfHOQnH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Aug 2019 12:43:07 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46576 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730150AbfHOQnG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Aug 2019 12:43:06 -0400
Received: by mail-pg1-f195.google.com with SMTP id m3so927050pgv.13
        for <linux-i2c@vger.kernel.org>; Thu, 15 Aug 2019 09:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=RDP6dCH5SfbePXj50Yif9P0DeSA7UpHTBf1zvPFWOKs=;
        b=CCU74OVLrLaosPhbhlWUvm/fK344mtCf8+8LUVUjq11XQdbsdrcBpxuBasG+4dcLxk
         iNOVq5P9Ta2MM1OBqw4OTlhpq9lk9k2P8j4ElxzhsLM9qgcsq7yg45xJTpWr7SwkSIBo
         B9/XWFBlccxgCvJB3KUE5OUm2YJOK0RlcZKDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RDP6dCH5SfbePXj50Yif9P0DeSA7UpHTBf1zvPFWOKs=;
        b=MqIPmj+IrREuYDERuU7xJ4NUA+8aBwb6o9gUgo76ihZvsRTMqVXjcO16Ws3s/5Wtmq
         6uqhA2tJ85u3UhtTzDysS49jytaW0NvymHvnm6dNlSO3lAXh4ZpQzKPaLS2c2cZElVdo
         JeKeA09HqQ18XNnVAodEs5z2Ub7hz+tmWK6JHBNVj/KA7kVCAVz/aCbYdbey8SA35fln
         zxbWSgCNrS4oEOTfUV/XPHh0ukwOfd+A9JMOgp++wblrOPRBP+Ad1ssPk7C/46XbsFaa
         /wOBXwue/ijIjXqS1OhOwQQOBQ72jNvuOsNtgnQyqBgF3VYVnKjZvEYnfPyvJrEdatoT
         TGSw==
X-Gm-Message-State: APjAAAUM0q9NqpMpWMFQm0XFctyMfz3gLb5VufCMNJ6NyHedT+UPqGWZ
        vNvOpHzcSVyRdWJIHtpvgdNn8g==
X-Google-Smtp-Source: APXvYqyO/A5C+feWKubTl5Y5Nbg7TZpKOd/uYePnUOe+USwqkcuzntM3zu9WjAvZpaD+PLDWAUGONQ==
X-Received: by 2002:a17:90a:bb91:: with SMTP id v17mr2937162pjr.84.1565887385590;
        Thu, 15 Aug 2019 09:43:05 -0700 (PDT)
Received: from rj-aorus.ric.broadcom.com ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id s6sm3142547pfs.122.2019.08.15.09.43.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Aug 2019 09:43:04 -0700 (PDT)
Subject: Re: [PATCH] i2c: iproc: Make bcm_iproc_i2c_quirks constant
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>, rjui@broadcom.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20190815055550.1588-1-nishkadg.linux@gmail.com>
From:   Ray Jui <ray.jui@broadcom.com>
Message-ID: <4f71a174-9ded-172e-9c34-c492aee3c3e8@broadcom.com>
Date:   Thu, 15 Aug 2019 09:43:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190815055550.1588-1-nishkadg.linux@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Nishka,

On 8/14/19 10:55 PM, Nishka Dasgupta wrote:
> Static structure bcm_iproc_i2c_quirks, of type i2c_adapter_quirks, is
> only used when being assigned to constant field quirks of a variable
> having type i2c_adapter. Hence make bcm_iproc_i2c_quirks constant as
> well to prevent it from unintended modification.
> Issue found with Coccinelle.
> 
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---
>   drivers/i2c/busses/i2c-bcm-iproc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
> index d7fd76baec92..e9f0e5b6eadc 100644
> --- a/drivers/i2c/busses/i2c-bcm-iproc.c
> +++ b/drivers/i2c/busses/i2c-bcm-iproc.c
> @@ -805,7 +805,7 @@ static struct i2c_algorithm bcm_iproc_algo = {
>   	.unreg_slave = bcm_iproc_i2c_unreg_slave,
>   };
>   
> -static struct i2c_adapter_quirks bcm_iproc_i2c_quirks = {
> +static const struct i2c_adapter_quirks bcm_iproc_i2c_quirks = {
>   	.max_read_len = M_RX_MAX_READ_LEN,
>   };
>   
> 

This looks good to me. Thanks!

Reviewed-by: Ray Jui <ray.jui@broadcom.com>

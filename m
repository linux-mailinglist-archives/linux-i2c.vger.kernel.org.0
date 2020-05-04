Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F134A1C3652
	for <lists+linux-i2c@lfdr.de>; Mon,  4 May 2020 12:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728451AbgEDKBB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 May 2020 06:01:01 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:54869 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728003AbgEDKBB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 May 2020 06:01:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588586459;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yJkyvpNgmDmt2g0SlWdBRcilG1I4swf/Cj3EYZFCe0o=;
        b=LG8FCS8ndsCDKmPoP9Hq3NB61WvLx6XvWZxrosPebGCUzLwSu9E4zHLH+S+dNBaFo7rK0i
        lK0jl96SZCAHFPWZrtkZrzFM3MTxk3FxTcYr2lWJUJpfP2cDeuC65QW00CtSD6suDGs3z0
        LSspcFvB/N57BSWuxHzhV5iYJ7RRmGE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-TL9GTBHOP1qv6t69tXMF-w-1; Mon, 04 May 2020 06:00:58 -0400
X-MC-Unique: TL9GTBHOP1qv6t69tXMF-w-1
Received: by mail-wr1-f69.google.com with SMTP id f2so10525570wrm.9
        for <linux-i2c@vger.kernel.org>; Mon, 04 May 2020 03:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yJkyvpNgmDmt2g0SlWdBRcilG1I4swf/Cj3EYZFCe0o=;
        b=T1XUVrX7LCeAiGCpzsMTIhgEEnCBVEEQOaKMbILw/QPb2aWBoTTxOvA3tsR5Cooo87
         /NaYH+SWUU4qphr4Wxo0cbLI1aQS4m69KbtpvoAZ7Nq9CZwoyFuTQ7kfYmMCyJrZHHt6
         kVeFSjRFGV2cbVfJ1FFrRSl0qWuCfa7EnxmFByzdY5wK7MrnaNsn2F0O6M1ytbDUqDQy
         WZyXe/Mo2A0RCJRi39VBClApF0attxXIVCju0jTnNCmgQnymOpUTaT+OkRS2l+eFMpF+
         hFa2iijs3Qf5X6XmeWmItCIpACZp4LHimIrZqKoS/p4LugPiuRzcaa/++Z+Omvg25J+g
         xJsA==
X-Gm-Message-State: AGi0PubIefnTIu+XRO18LWwDyAKQy0i79LXPm0zZBlhCBR/QT70ThKNb
        mQhwZ7UANdpK7u271plNg3pu4odN5W7AQwQAG6Y7DBkqvUhMuKZQJ/8Uvpi0J0XkbEVr3dtGLSa
        RD0M2kdJh0skFpNqnbiAk
X-Received: by 2002:adf:8169:: with SMTP id 96mr18097871wrm.283.1588586456883;
        Mon, 04 May 2020 03:00:56 -0700 (PDT)
X-Google-Smtp-Source: APiQypLQy5hLsDEnTJRu3PFA8DqRI0Fz/y/rb45ogQc0EtnB3c3GLHDSSMAYlKb28Ib+4V9VlkGOng==
X-Received: by 2002:adf:8169:: with SMTP id 96mr18097855wrm.283.1588586456718;
        Mon, 04 May 2020 03:00:56 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id c190sm13003942wme.4.2020.05.04.03.00.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2020 03:00:56 -0700 (PDT)
Subject: Re: [PATCH] i2c: cht-wc: Remove superfluous error message in
 cht_wc_i2c_adap_i2c_probe()
To:     Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200503132339.17718-1-aishwaryarj100@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0605496b-d4f1-c87c-5b45-699c8c3dcaec@redhat.com>
Date:   Mon, 4 May 2020 12:00:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200503132339.17718-1-aishwaryarj100@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 5/3/20 3:23 PM, Aishwarya Ramakrishnan wrote:
> The function platform_get_irq can log an error by itself.
> This omit a redundant message for exception handling in the
> calling function.
> 
> Suggested by Coccinelle.
> 
> Signed-off-by: Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>

Thank you for the patch, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>   drivers/i2c/busses/i2c-cht-wc.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-cht-wc.c b/drivers/i2c/busses/i2c-cht-wc.c
> index 35e55feda763..343ae5754e6e 100644
> --- a/drivers/i2c/busses/i2c-cht-wc.c
> +++ b/drivers/i2c/busses/i2c-cht-wc.c
> @@ -314,10 +314,8 @@ static int cht_wc_i2c_adap_i2c_probe(struct platform_device *pdev)
>   	int ret, reg, irq;
>   
>   	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		dev_err(&pdev->dev, "Error missing irq resource\n");
> +	if (irq < 0)
>   		return -EINVAL;
> -	}
>   
>   	adap = devm_kzalloc(&pdev->dev, sizeof(*adap), GFP_KERNEL);
>   	if (!adap)
> 


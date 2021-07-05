Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF353BB821
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jul 2021 09:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229984AbhGEHtO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jul 2021 03:49:14 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:47331 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229978AbhGEHtN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jul 2021 03:49:13 -0400
Received: from mail-ed1-f70.google.com ([209.85.208.70])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1m0JJL-000219-PW
        for linux-i2c@vger.kernel.org; Mon, 05 Jul 2021 07:46:35 +0000
Received: by mail-ed1-f70.google.com with SMTP id d17-20020a05640208d1b0290399de3a0eecso523930edz.0
        for <linux-i2c@vger.kernel.org>; Mon, 05 Jul 2021 00:46:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OUlQvFhnqw4yNB5g21FpiNDLoa74ksIlL0BX+hEIYks=;
        b=FPw3S1UU5F76Wxrmi3AH4KcMIYCMeX1TI78cedk2044D9ziYGC2bTJT9EJ0LGWIUb6
         +E1T5dVJ2gd8ZWZ/ykHgFAKxbgEazPcyq6hT52ZfoPKyrD3/pt9uN+RInBwFQirFEhXM
         udaV9R9fg8jOq7nPDRHicjTPaeKrYOoMp43xaCRRyMKw1rclSLNhTNun6icP8+5AH7Yc
         9mNZ2wJhoI7WlYqWCNw0Oa9RdM0u9YerJxs3DhKQGgYACOnDnF8p40p6+M04edu2GDv/
         /k/FlCYYqzZmj3XPsQLKMUDs9NDdUHQmbpZ0UaGhYfW7xm60nXWnWktIfV7vpDpbtykQ
         15TA==
X-Gm-Message-State: AOAM531ariA51+MNfH3jaNHfBKAwI1Ide4/eAR0GxOhW2FV9Gd/X1GMz
        Z8ZoT4b8rmug921C0GYJg9QP3M7pjZMepxjbRLeLjRv31T0Z9BW1fCuhLB1mmA1aRdBEjUE6mL5
        CC/6TX7dn7PSs1RxSzfkTDcDbLQx37eQKQjuH5g==
X-Received: by 2002:a50:fe08:: with SMTP id f8mr14916117edt.186.1625471195550;
        Mon, 05 Jul 2021 00:46:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzW6PoBTiPiuHziQf0PYt2MvNb01/YBP8mxrJfN2emEpQSWFsLcmPfpPNgmeKiK8cDlYK2oLQ==
X-Received: by 2002:a50:fe08:: with SMTP id f8mr14916107edt.186.1625471195398;
        Mon, 05 Jul 2021 00:46:35 -0700 (PDT)
Received: from [192.168.3.211] (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id k25sm3450686eds.77.2021.07.05.00.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jul 2021 00:46:35 -0700 (PDT)
Subject: Re: [PATCH v2 4/5] i2c: s3c2410: fix IRQ check
To:     Sergey Shtylyov <s.shtylyov@omp.ru>, linux-i2c@vger.kernel.org
Cc:     linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <3712e871-bf2f-32c5-f9c2-2968c42087f8@omp.ru>
 <771d94cf-5e82-0cb7-fb1f-5af2f0b10dd4@omp.ru>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <2a76179d-b901-b971-ea99-b68833dc56cf@canonical.com>
Date:   Mon, 5 Jul 2021 09:46:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <771d94cf-5e82-0cb7-fb1f-5af2f0b10dd4@omp.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 04/07/2021 16:45, Sergey Shtylyov wrote:
> Iff platform_get_irq() returns 0, the driver's probe() method will return 0
> early (as if the method's call was successful).  Let's consider IRQ0 valid
> for simplicity -- devm_request_irq() can always override that decision...
> 
> Fixes: 2bbd681ba2b ("i2c-s3c2410: Change IRQ to be plain integer.")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> ---
>  drivers/i2c/busses/i2c-s3c2410.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof

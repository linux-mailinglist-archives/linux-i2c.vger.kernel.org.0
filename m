Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80A98136395
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Jan 2020 00:05:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbgAIXFR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jan 2020 18:05:17 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49742 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726267AbgAIXFQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Jan 2020 18:05:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578611116;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AFx45qTHz2JY0wspr7jk/iJLUduDK6Lhpsf8cM21O3Y=;
        b=hLw0bys2qPz61XrFjenJPzyjubx2HdJzD0SwChYzf0cL1akX81PdONRqXrJ9TKcsb1bZBu
        s7yUu3kobXp/eMcVNEhoM+lrpyxKCfHxTbV7a5QKxoJKI3FiCPTTv8j4MNdOvuzPOsnEBh
        fzK5cXI68h7eQ7+bqa/IcciaiOpz0+0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-hVK1sTUcPMef-WoSY951IA-1; Thu, 09 Jan 2020 18:05:14 -0500
X-MC-Unique: hVK1sTUcPMef-WoSY951IA-1
Received: by mail-wm1-f69.google.com with SMTP id 18so1514967wmp.0
        for <linux-i2c@vger.kernel.org>; Thu, 09 Jan 2020 15:05:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AFx45qTHz2JY0wspr7jk/iJLUduDK6Lhpsf8cM21O3Y=;
        b=Yd0qoAxdilxM9htmkxRREuBuR01VLOi6y6/IYBCxhN8eSsfhqII/1phgj7/zPyNVQd
         N/c0t6M3ilrbvCh1EwLi4L0Y1QPjB4irZK1tAmYMpNQeJkBES6Zqp4rxJuLSlq0FtDZD
         t9OlV+GZr6ubRQKZo09XZYSgzMS5Siy6FfX5f+jDjhRyqv2wVbaXGKiv2kIElf0QEtRf
         At2mod/MkoXXoy05lD7fTERqX0WZqM99MdSaz58zN9W+ax769pk164ULowdXIKjk9Gki
         Iy5mCvGjlw/E7cDGxeF7f4j6yMl7tuYYF3GQi/i3NWVFLICwkzDSNYZmwbe7I1yHFTjz
         SoSA==
X-Gm-Message-State: APjAAAUJ5yYPOnPSDByJ9tDSRh8JybpBsJjHLHiUS26c6pfq6WLHmyP/
        NNevaSrHjmGD0KJnIiyihwvKlO5hCEq7noLu3cv/KEd2BvnFyLiF+G1fce8pKnK/40Yb/Ya1GgC
        j9rEgicKqsNXPbZtQ4MsE
X-Received: by 2002:a5d:6ac2:: with SMTP id u2mr143470wrw.233.1578611113487;
        Thu, 09 Jan 2020 15:05:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqyvmhmMIsJeHkV1pqi8jbcQ5VJx686EjDVgH5CmJHOxiPWH4poWMludQqTFWKdndzLMlbxrLA==
X-Received: by 2002:a5d:6ac2:: with SMTP id u2mr143460wrw.233.1578611113237;
        Thu, 09 Jan 2020 15:05:13 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
        by smtp.gmail.com with ESMTPSA id r15sm90261wmh.21.2020.01.09.15.05.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2020 15:05:12 -0800 (PST)
Subject: Re: [PATCH 01/12] i2c: cht-wc: convert to use i2c_new_client_device()
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
References: <20200107174748.9616-1-wsa+renesas@sang-engineering.com>
 <20200107174748.9616-2-wsa+renesas@sang-engineering.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <6e267f65-5884-c0d1-fecc-9d21ce7336a3@redhat.com>
Date:   Fri, 10 Jan 2020 00:05:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200107174748.9616-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 07-01-2020 18:47, Wolfram Sang wrote:
> Move away from the deprecated API and return the shiny new ERRPTR where
> useful.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com> > ---
> Build tested only.

I've given this a quick test spin on hw which uses this drivers,
I've not noticed any regressions:

Tested-by: Hans de Goede <hdegoede@redhat.com>

Also the changes look good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> 
>   drivers/i2c/busses/i2c-cht-wc.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-cht-wc.c b/drivers/i2c/busses/i2c-cht-wc.c
> index b8fde61bb5d8..35e55feda763 100644
> --- a/drivers/i2c/busses/i2c-cht-wc.c
> +++ b/drivers/i2c/busses/i2c-cht-wc.c
> @@ -388,9 +388,9 @@ static int cht_wc_i2c_adap_i2c_probe(struct platform_device *pdev)
>   	 */
>   	if (acpi_dev_present("INT33FE", NULL, -1)) {
>   		board_info.irq = adap->client_irq;
> -		adap->client = i2c_new_device(&adap->adapter, &board_info);
> -		if (!adap->client) {
> -			ret = -ENOMEM;
> +		adap->client = i2c_new_client_device(&adap->adapter, &board_info);
> +		if (IS_ERR(adap->client)) {
> +			ret = PTR_ERR(adap->client);
>   			goto del_adapter;
>   		}
>   	}
> 


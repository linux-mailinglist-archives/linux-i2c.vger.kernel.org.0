Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CCD0BC567
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Sep 2019 12:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730002AbfIXKJQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Sep 2019 06:09:16 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43500 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbfIXKJQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Sep 2019 06:09:16 -0400
Received: by mail-pg1-f195.google.com with SMTP id v27so1032028pgk.10
        for <linux-i2c@vger.kernel.org>; Tue, 24 Sep 2019 03:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=buIWP+AhM1fqBub1ZD58PSqi9Se/91tn/60FgEyvjw8=;
        b=WCt/An6dyLhXsuKgKc7lWpJH6yLpSzgOLCvoS3eEhY/Fdof73L1lfDPpTBZmicJ5K8
         j/v1Gj8S6UMxQtiiZqzvO6IvdvW+BmPADyxerk1VEaQKDcjmBNMH1roG/07PBLvL8K/5
         NLLAqr+XDdBRGz72RK9ERB8kPY327kmPSxHgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=buIWP+AhM1fqBub1ZD58PSqi9Se/91tn/60FgEyvjw8=;
        b=pEgOVEPYoSX2TCldx0VKaAQiUP4paDUtnOgvd/Qa+hb6Vbi4hlkjCocbbyyvyZ7non
         AMCkuaoC6mNdJRJIwkBDZITV4M7W3IH3RYWdAi1Zeb0cCMloYRvxf6anoF3ux75vtdIw
         +hRpgoWQCTS4b0wp6pkRc9tkEy29zsLsfoEailHLeDiPWZChn/tL489J5kOwka6X9PgB
         taJTcthAu9posDjDQcCXpcurq9mtEU8nHAYwHDQxj60fN8ptVuJPSk0PzNeUkjNO3AjG
         WzWZmgfgw1+uFTGTfzWhjGh8z7LPDG1+VNZdOactKHPdxsQTWOz83Zzv2LgU95y4oUxf
         +7+Q==
X-Gm-Message-State: APjAAAVkbWUBC2YWmd3XL4923FZbySVlDErmDnxesCYsHJQr4APkg+hS
        +q0eXqKS7A8Xv7FdKPu9YAFHuA==
X-Google-Smtp-Source: APXvYqzD/tnzRFhIo82Apy9/srExKok96GNXsJMb9r8IqMQ79RQGlr/UAbCmZC0wN6tTZ8RP9T7oZg==
X-Received: by 2002:a62:2ad6:: with SMTP id q205mr2435548pfq.46.1569319755575;
        Tue, 24 Sep 2019 03:09:15 -0700 (PDT)
Received: from pihsun-z840.tpe.corp.google.com ([2401:fa00:1:10:7889:7a43:f899:134c])
        by smtp.gmail.com with ESMTPSA id f3sm1476185pgj.62.2019.09.24.03.09.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2019 03:09:14 -0700 (PDT)
Subject: Re: [PATCH v1] misc: eeprom: at24: support pm_runtime control
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c@vger.kernel.org
Cc:     tfiga@chromium.org, drinkcat@chromium.org,
        srv_heupstream@mediatek.com
References: <20190902033205.30276-1-bibby.hsieh@mediatek.com>
From:   Pi-Hsun Shih <pihsun@chromium.org>
Message-ID: <f6c4b009-fbb5-4155-469d-310a57e08eeb@chromium.org>
Date:   Tue, 24 Sep 2019 18:08:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190902033205.30276-1-bibby.hsieh@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Bibby,

On 9/2/19 11:32 AM, Bibby Hsieh wrote:
> ...
> +	pm_runtime_get_sync(dev);
> +	if (at24->has_supplies) {
> +		err = regulator_bulk_enable(AT24_NUM_SUPPLIES, at24->supplies);
> +		if (err) {
> +			dev_err(dev, "Failed to enable power regulators\n");
> +			return err;
> +		}
> +	} >
>   	/*
>   	 * Perform a one-byte test read to verify that the
>   	 * chip is functional.
>   	 */
>   	err = at24_read(at24, 0, &test_byte, 1);
> -	pm_runtime_idle(dev);
> +	pm_runtime_put(dev);
>   	if (err) {
>   		pm_runtime_disable(dev);

Should there be corresponding regulator_bulk_disable in the error path 
here and below?

>   		return -ENODEV;
> @@ -726,15 +752,46 @@ static int at24_probe(struct i2c_client *client)
>   
>   static int at24_remove(struct i2c_client *client)
>   {
> +	struct at24_data *at24 = i2c_get_clientdata(client);
> +
>   	pm_runtime_disable(&client->dev);
>   	pm_runtime_set_suspended(&client->dev);
> +	if (at24->has_supplies)
> +		regulator_bulk_disable(AT24_NUM_SUPPLIES, at24->supplies);
>   
>   	return 0;
>   } > ...

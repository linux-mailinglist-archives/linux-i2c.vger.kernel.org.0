Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 887898A44E
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2019 19:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbfHLR3V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Aug 2019 13:29:21 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40450 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726681AbfHLR3U (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Aug 2019 13:29:20 -0400
Received: by mail-wr1-f67.google.com with SMTP id r1so6193934wrl.7
        for <linux-i2c@vger.kernel.org>; Mon, 12 Aug 2019 10:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gLmU/oA3BCk2uiOw0NCotyQaVZi//v3NX7oeTBpbzPI=;
        b=HRqI7gpgVlreUi1D++HQHECQSCm+7bHRVkxlJA31xjKyAOIIwHmSF0LjBvN65ZEOzo
         xj0MNruGBDagLsis6PIDdhDXNL56WaiUmZalJAk7WI+Eu4argckKozpmRBWBGvGat+Ps
         jB1DJLIHnq73jpePKgYdnjSfprtsMhRY1uvCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gLmU/oA3BCk2uiOw0NCotyQaVZi//v3NX7oeTBpbzPI=;
        b=koyuiL8/imb3564671Kh3dnUdfQBT6sB+sjoS1uoZKCPq5S2KYk3a0ro3DofReJjUg
         Ubi6BDfW9fbYcUgmJ2xhJO+Z0TlREa7oC5MYS5uQSFaqkD9CVjcK+ZeI5up74Qqr2F1j
         9d4WeJDGMwzrSupf6NJW8/I1wqMEYaFA7BMO4CQv5bc2I9YwfEM7RRBVghioSGqmMg3r
         qPostnR/W15oGEIDSQvL7dxOymbaR07EIl42JTASUcy01fdIA8r4OHhwj51Oxlk2CVRV
         DUPobzi6JXJ9zoSarQ3jFwWFmR7wU/PVIYbqxJMTw9tpwckhb10Y0v8rUffWbbGaFEV8
         5njA==
X-Gm-Message-State: APjAAAV72dyrxhGzEmvBin9MaOO5O+hHlm+FkjlzXtZ92WcghnMnJND+
        7MIqGvVbHikbPv+8G+ZhcmZPbA==
X-Google-Smtp-Source: APXvYqxHJNwUpwVM9tbfVDO/o2ELdYI+GRRNwxKxz0h2W8TZ4S/n1eM8b2GMn7in/kY22iY0PrtG+w==
X-Received: by 2002:a5d:4f8e:: with SMTP id d14mr10405833wru.207.1565630958564;
        Mon, 12 Aug 2019 10:29:18 -0700 (PDT)
Received: from rj-aorus.ric.broadcom.com ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id a64sm606796wmf.1.2019.08.12.10.29.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Aug 2019 10:29:18 -0700 (PDT)
Subject: Re: [PATCH v1 1/2] i2c: iproc: Stop advertising support of SMBUS
 quick cmd
To:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        Florian Fainelli <f.fainelli@gmail.com>,
        Lori Hikichi <lori.hikichi@broadcom.com>
References: <1565235473-28461-1-git-send-email-rayagonda.kokatanur@broadcom.com>
 <1565235473-28461-2-git-send-email-rayagonda.kokatanur@broadcom.com>
From:   Ray Jui <ray.jui@broadcom.com>
Message-ID: <201903a5-c517-f436-0337-4110165d18a0@broadcom.com>
Date:   Mon, 12 Aug 2019 10:29:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565235473-28461-2-git-send-email-rayagonda.kokatanur@broadcom.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 8/7/19 8:37 PM, Rayagonda Kokatanur wrote:
> From: Lori Hikichi <lori.hikichi@broadcom.com>
> 
> The driver does not support the SMBUS Quick command so remove the
> flag that indicates that level of support.
> By default the i2c_detect tool uses the quick command to try and
> detect devices at some bus addresses.  If the quick command is used
> then we will not detect the device, even though it is present.
> 
> Fixes: e6e5dd3566e0 (i2c: iproc: Add Broadcom iProc I2C Driver)
> 
> Signed-off-by: Lori Hikichi <lori.hikichi@broadcom.com>
> Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
> ---
>   drivers/i2c/busses/i2c-bcm-iproc.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
> index d7fd76b..19ef2b0 100644
> --- a/drivers/i2c/busses/i2c-bcm-iproc.c
> +++ b/drivers/i2c/busses/i2c-bcm-iproc.c
> @@ -790,7 +790,10 @@ static int bcm_iproc_i2c_xfer(struct i2c_adapter *adapter,
>   
>   static uint32_t bcm_iproc_i2c_functionality(struct i2c_adapter *adap)
>   {
> -	u32 val = I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> +	u32 val;
> +
> +	/* We do not support the SMBUS Quick command */
> +	val = I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
>   
>   	if (adap->algo->reg_slave)
>   		val |= I2C_FUNC_SLAVE;
> 

Change looks good to me. Thanks.

Reviewed-by: Ray Jui <ray.jui@broadcom.com>



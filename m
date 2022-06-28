Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19E0255EDE3
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jun 2022 21:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231758AbiF1TmA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jun 2022 15:42:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231584AbiF1Tlf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Jun 2022 15:41:35 -0400
X-Greylist: delayed 1159 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 28 Jun 2022 12:33:15 PDT
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C22AC3AA7F;
        Tue, 28 Jun 2022 12:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
         s=default2002; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID;
        bh=1D+m0J17+AOFZu/sjCxpjPd9WVInKbq2xNS5/rhbdKM=; b=d9+mYUPpF8akd6kIrdxjM9Ca+I
        0lSLAjt5JEInLiHH0NBLtwVI7ryCOfI7iV30IOaPYTemJ9x0WEQRQQnE5KmfQeFyjomfyRKYmuNzi
        izruzrUUqhQaW8x2i+t3uOdv7ZEKH+Y9hbT/RcBVyedEU5bNuC0edurzjQdh6oPQiJBDWIylnG7T/
        HF0AoPc43dv0grj+dtD+tR+Guajl7MonTi10ACuk1KVoMRWdobOts7VreIp1zLlmaVLxaXGuPKObj
        pI3DenwbP3zhA0ebKP7/MyhyMYWnr90+AVa7yf2UQGy4qeV0eO1INy3STK5+47CRxyRwC0SEZf/+3
        GUmnWvJQ==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
        by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92.3)
        (envelope-from <lars@metafoo.de>)
        id 1o6Geo-0005Mm-4C; Tue, 28 Jun 2022 21:13:54 +0200
Received: from [2001:a61:2a49:8301:9e5c:8eff:fe01:8578]
        by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1o6Gen-000TYv-VP; Tue, 28 Jun 2022 21:13:53 +0200
Message-ID: <66134443-a400-15ca-ea92-691e3c269b5c@metafoo.de>
Date:   Tue, 28 Jun 2022 21:13:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] i2c: cadence: Unregister the clk notifier in error path
Content-Language: en-US
To:     Satish Nagireddy <satish.nagireddy@getcruise.com>, wsa@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        michal.simek@xilinx.com
References: <20220628191216.39459-1-satish.nagireddy@getcruise.com>
From:   Lars-Peter Clausen <lars@metafoo.de>
In-Reply-To: <20220628191216.39459-1-satish.nagireddy@getcruise.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.6/26587/Tue Jun 28 10:07:12 2022)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 6/28/22 21:12, Satish Nagireddy wrote:
> This patch ensures that the clock notifier is unregistered
> when driver probe is returning error.
>
> Signed-off-by: Satish Nagireddy <satish.nagireddy@getcruise.com>

Thanks! Looks good.

Tested-by: Lars-Peter Clausen <lars@metafoo.de>

> ---
>   drivers/i2c/busses/i2c-cadence.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
> index b4c1ad19cdae..3d6f8ee355bf 100644
> --- a/drivers/i2c/busses/i2c-cadence.c
> +++ b/drivers/i2c/busses/i2c-cadence.c
> @@ -1338,6 +1338,7 @@ static int cdns_i2c_probe(struct platform_device *pdev)
>   	return 0;
>   
>   err_clk_dis:
> +	clk_notifier_unregister(id->clk, &id->clk_rate_change_nb);
>   	clk_disable_unprepare(id->clk);
>   	pm_runtime_disable(&pdev->dev);
>   	pm_runtime_set_suspended(&pdev->dev);



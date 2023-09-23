Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7301E7ABEDD
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Sep 2023 10:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230474AbjIWIZs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 23 Sep 2023 04:25:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230419AbjIWIZq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 23 Sep 2023 04:25:46 -0400
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 252A419A
        for <linux-i2c@vger.kernel.org>; Sat, 23 Sep 2023 01:25:40 -0700 (PDT)
Received: from eig-obgw-5002a.ext.cloudfilter.net ([10.0.29.215])
        by cmsmtp with ESMTP
        id jx8dqJ7iMbK1VjxxLqkGaX; Sat, 23 Sep 2023 08:25:40 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with ESMTPS
        id jxxLqx2auZb7MjxxLq1Atz; Sat, 23 Sep 2023 08:25:39 +0000
X-Authority-Analysis: v=2.4 cv=Z57/oVdA c=1 sm=1 tr=0 ts=650ea103
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=P7XfKmiOJ4/qXqHZrN7ymg==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=LDBv8-xUAAAA:8 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8 a=qjWHau5h7Oqj65Zv8QkA:9
 a=QEXdDO2ut3YA:10 a=DZeXCJrVpAJBw65Qk4Ds:22 a=AjGcO6oz07-iQ99wixmX:22
 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=69N6cOusJBoB+aWEUF9YxI0jiuvYXLBIsPt/5EwIhNM=; b=RLEotFk9VYHb5Yf2fSVCeBWgzO
        IMjDsWCPxWwHtACJ8KwNR3KiD4trGkOaMkSTm/SxVXzRAYm0iLOqdrsDepTuQ6eWKBe/Qg1RWIaPN
        gajEaXGKhi7R6uRn/YcjgMA3jazAFevo+z/GWZlmFoK5n7v14wWEZts/PmKa4ShjVYmlk5GaZW+ZH
        3G32xWCtLL43AMQ3i9iaCe/6tfM7uY/iXTumHKPeHK6NG4vZwJqlnqR8egAHGEtnRzwU/gzwPem86
        /nqA2PhcjjVOi2p04VZRf/5dDz3lqFLjLdhIN328qk7Lpivzln6+7nmHoR4DjIgJtJvXQtGc8fQpl
        RJJ6qQdw==;
Received: from [94.239.20.48] (port=52858 helo=[192.168.1.98])
        by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.96)
        (envelope-from <gustavo@embeddedor.com>)
        id 1qjxxK-003V8c-0s;
        Sat, 23 Sep 2023 03:25:38 -0500
Message-ID: <31d9e182-8f8d-b47a-a9f3-db1b7df5bb38@embeddedor.com>
Date:   Sat, 23 Sep 2023 10:26:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] i2c: mux: demux-pinctrl: Annotate struct
 i2c_demux_pinctrl_priv with __counted_by
Content-Language: en-US
To:     Kees Cook <keescook@chromium.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org
References: <20230922174959.work.093-kees@kernel.org>
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230922174959.work.093-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 94.239.20.48
X-Source-L: No
X-Exim-ID: 1qjxxK-003V8c-0s
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.98]) [94.239.20.48]:52858
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 40
X-Org:  HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNyG/7zopPxvFY/Jw0ibagwZL+ggWvPDa+hXYgn3H5edTud4JWYnfiAuXf1lgaU+WE1SO99k4gFfYu6p5CvsQAuKHTXgZNd6ln7o2AO2Gp919f0bMPH0
 XiSdSkeAKVaLAQvO1ZiZVXQJBOcEaCs2nmi5yhZTw4182yt8gF3RluLDqJbkHB8H2XJEVKF5EVsC0oKPPJmjNffwC/OaFpEHHv8=
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 9/22/23 11:49, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct i2c_demux_pinctrl_priv.
> Additionally, since the element count member must be set before accessing
> the annotated flexible array member, move its initialization earlier.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: Peter Rosin <peda@axentia.se>
> Cc: linux-i2c@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-- 
Gustavo

> ---
>   drivers/i2c/muxes/i2c-demux-pinctrl.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-demux-pinctrl.c b/drivers/i2c/muxes/i2c-demux-pinctrl.c
> index a3a122fae71e..5e15d8777229 100644
> --- a/drivers/i2c/muxes/i2c-demux-pinctrl.c
> +++ b/drivers/i2c/muxes/i2c-demux-pinctrl.c
> @@ -32,7 +32,7 @@ struct i2c_demux_pinctrl_priv {
>   	const char *bus_name;
>   	struct i2c_adapter cur_adap;
>   	struct i2c_algorithm algo;
> -	struct i2c_demux_pinctrl_chan chan[];
> +	struct i2c_demux_pinctrl_chan chan[] __counted_by(num_chan);
>   };
>   
>   static int i2c_demux_master_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
> @@ -226,6 +226,8 @@ static int i2c_demux_pinctrl_probe(struct platform_device *pdev)
>   	if (!priv || !props)
>   		return -ENOMEM;
>   
> +	priv->num_chan = num_chan;
> +
>   	err = of_property_read_string(np, "i2c-bus-name", &priv->bus_name);
>   	if (err)
>   		return err;
> @@ -248,8 +250,6 @@ static int i2c_demux_pinctrl_probe(struct platform_device *pdev)
>   		of_changeset_init(&priv->chan[i].chgset);
>   		of_changeset_update_property(&priv->chan[i].chgset, adap_np, &props[i]);
>   	}
> -
> -	priv->num_chan = num_chan;
>   	priv->dev = &pdev->dev;
>   
>   	platform_set_drvdata(pdev, priv);

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D80156D3AD5
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Apr 2023 00:30:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbjDBWa2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 2 Apr 2023 18:30:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjDBWa2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 2 Apr 2023 18:30:28 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 571336EBB;
        Sun,  2 Apr 2023 15:30:27 -0700 (PDT)
Received: from [192.168.2.163] (109-252-124-32.nat.spd-mgts.ru [109.252.124.32])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: dmitry.osipenko)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 3ACE06602E34;
        Sun,  2 Apr 2023 23:30:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1680474626;
        bh=8PXBF8vV02LOUYcIW54cjJhIhkm+x7i45sfvjpWdHT8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=VavHMw5TBD5Vk/Vta/7MpXGm0jSCH9ZANdchgd6Xq+rEE2g2hiDE0FyDaXMYg2QpU
         D7w0+Oa+EAfbneCaruAPnZv7G3ZjzkY3ZEpeE5ZlHSmITCjKsgPkyF5vds0tbNkSGh
         ABNDkLxJcRFEtycPCfUNa88FVxMcDX6bg7UQO3yK2Iu7ZYsqhvQRPPyNm0LZ1QM78n
         dpdajKV051YcBxfjTBmX5mENPgiprJCwOkF9FHYaxChG0QKMfmWJnrTZDTmXOjAuUn
         nTdZH7gSiZ3xUlpn1/rVaENBrOYO6bsTV5EkkiR696ksIUZ92trKXF+7v4dtMk9rfO
         d/vKgIyiMNF/w==
Message-ID: <6abaa803-1639-b949-3af5-05a341f9b459@collabora.com>
Date:   Mon, 3 Apr 2023 01:30:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 4/4] mfd: tps6586x: register restart handler
Content-Language: en-US
To:     Benjamin Bara <bbara93@gmail.com>, Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee@kernel.org>, rafael.j.wysocki@intel.com
Cc:     jonathanh@nvidia.com, richard.leitner@linux.dev,
        treding@nvidia.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        Benjamin Bara <benjamin.bara@skidata.com>
References: <20230327-tegra-pmic-reboot-v3-0-3c0ee3567e14@skidata.com>
 <20230327-tegra-pmic-reboot-v3-4-3c0ee3567e14@skidata.com>
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230327-tegra-pmic-reboot-v3-4-3c0ee3567e14@skidata.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 3/27/23 16:57, Benjamin Bara wrote:
> From: Benjamin Bara <benjamin.bara@skidata.com>
> 
> There are a couple of boards which use a tps6586x as
> "ti,system-power-controller", e.g. the tegra20-tamonten.dtsi.
> For these, the only registered restart handler is the warm reboot via
> tegra's PMC. As the bootloader of the tegra20 requires the VDE, it must
> be ensured that VDE is enabled (which is the case after a cold reboot).
> For the "normal reboot", this is basically the case since
> 8f0c714ad9be1ef774c98e8819a7a571451cb019.
> However, this workaround is not executed in case of an emergency restart.
> In case of an emergency restart, the system now simply hangs in the
> bootloader, as VDE is not enabled (as not in use).
> 
> The TPS658629-Q1 (unfortunately the only TPS6586x with public data sheet)
> provides a SOFT RST bit in the SUPPLYENE reg to request a (cold) reboot.
> This avoids the hang-up.
> 
> Tested on a TPS658640.
> 
> Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> ---
>  drivers/mfd/tps6586x.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
> index 93f1bf440191..c8adf6a08277 100644
> --- a/drivers/mfd/tps6586x.c
> +++ b/drivers/mfd/tps6586x.c
> @@ -30,6 +30,7 @@
>  #include <linux/mfd/tps6586x.h>
>  
>  #define TPS6586X_SUPPLYENE	0x14
> +#define SOFT_RST_BIT		BIT(0)
>  #define EXITSLREQ_BIT		BIT(1)
>  #define SLEEP_MODE_BIT		BIT(3)
>  
> @@ -470,6 +471,17 @@ static int tps6586x_power_off_handler(struct sys_off_data *data)
>  	return tps6586x_set_bits(tps6586x_dev, TPS6586X_SUPPLYENE, SLEEP_MODE_BIT);
>  }
>  
> +static int tps6586x_restart_handler(struct sys_off_data *data)
> +{
> +	struct device *tps6586x_dev = data->cb_data;
> +
> +	/* bring pmic into HARD REBOOT state */
> +	tps6586x_set_bits(tps6586x_dev, TPS6586X_SUPPLYENE, SOFT_RST_BIT);
> +
> +	mdelay(500);
Is this delay needed? There is no delay in a case of power off.

-- 
Best regards,
Dmitry


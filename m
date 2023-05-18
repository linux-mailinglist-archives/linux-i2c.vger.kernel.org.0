Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3E81708060
	for <lists+linux-i2c@lfdr.de>; Thu, 18 May 2023 13:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231658AbjERLug (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 May 2023 07:50:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231657AbjERLuS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 May 2023 07:50:18 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C87FF1BF4;
        Thu, 18 May 2023 04:49:10 -0700 (PDT)
Received: from [192.168.2.250] (109-252-144-198.dynamic.spd-mgts.ru [109.252.144.198])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: dmitry.osipenko)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id E580C6605960;
        Thu, 18 May 2023 12:49:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1684410541;
        bh=OXwsteA01UCrw860jLSNiqKLBDWtvCA65iFbkrUoWCs=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Ga8El9uipKqxlT7LtpgOqzFD89dm1Pi6nD9bi8IfwjAyHCoGHmvQKJC7ZO2IvVn6V
         UwC0iPvK+u7JLBOZnRwpZM1TyDdQfpg4QujDv4KG+4FeAtdkBb+rdnZtM7W46WDpnA
         nfTBfkD2lQASXkPl0ge0byqDrEwMqybkaiSxdVtVAZT0sOkftI1ObSqeVpBAEsy7Ld
         qL3aXSG1bw+rRe47tPPoY/58/dVHd380LTrWsM9+VouaNZlrfDOo5wlWMK+gs1EW0Z
         MF589vCG4unnbJXhRy5M6Zye+qweNPFtHEW13Wt3uM7Da2Zn7jU5gbxlhcpNwBur+o
         en1Clw7qe3iwQ==
Message-ID: <7eddaf8c-ab04-7670-fc45-15f0fce5eff2@collabora.com>
Date:   Thu, 18 May 2023 14:48:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 5/5] mfd: tps6586x: register restart handler
Content-Language: en-US
To:     Benjamin Bara <bbara93@gmail.com>, Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee@kernel.org>, rafael.j.wysocki@intel.com
Cc:     peterz@infradead.org, jonathanh@nvidia.com,
        richard.leitner@linux.dev, treding@nvidia.com,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        Benjamin Bara <benjamin.bara@skidata.com>
References: <20230327-tegra-pmic-reboot-v6-0-af44a4cd82e9@skidata.com>
 <20230327-tegra-pmic-reboot-v6-5-af44a4cd82e9@skidata.com>
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230327-tegra-pmic-reboot-v6-5-af44a4cd82e9@skidata.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 5/9/23 22:03, Benjamin Bara wrote:
> From: Benjamin Bara <benjamin.bara@skidata.com>
> 
> There are a couple of boards which use a tps6586x as
> "ti,system-power-controller", e.g. the tegra20-tamonten.dtsi.
> For these, the only registered restart handler is the warm reboot via
> tegra's PMC. As the bootloader of the tegra20 requires the VDE, it must
> be ensured that VDE is enabled (which is the case after a cold reboot).
> For the "normal reboot", this is basically the case since 8f0c714ad9be.
> However, this workaround is not executed in case of an emergency restart.
> In case of an emergency restart, the system now simply hangs in the
> bootloader, as VDE is not enabled (because it is not used).
> 
> The TPS658629-Q1 provides a SOFT RST bit in the SUPPLYENE reg to request
> a (cold) reboot, which takes at least 20ms (as the data sheet states).
> This avoids the hang-up.
> 
> Tested on a TPS658640.
> 
> Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> ---
>  drivers/mfd/tps6586x.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
> index b12c9e18970a..3b8faa058e59 100644
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
> @@ -475,6 +476,24 @@ static int tps6586x_power_off_handler(struct sys_off_data *data)
>  	return notifier_from_errno(-ETIME);
>  }
>  
> +static int tps6586x_restart_handler(struct sys_off_data *data)
> +{
> +	int ret;
> +
> +	/* TPS6586X only provides a hard/cold reboot, skip others. */
> +	if (data->mode != REBOOT_UNDEFINED && data->mode != REBOOT_COLD &&
> +	    data->mode != REBOOT_HARD)
> +		return NOTIFY_DONE;

Not sure whether it's worthwhile to care about the reboot mode. If we
would really care, then the supported modes should be a part of sys-off
handler definition. Maybe Rafael could comment on it.

Otherwise looks good.

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry


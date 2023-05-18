Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD889707F5E
	for <lists+linux-i2c@lfdr.de>; Thu, 18 May 2023 13:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbjERLeS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 May 2023 07:34:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229985AbjERLeR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 May 2023 07:34:17 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7472A6;
        Thu, 18 May 2023 04:34:16 -0700 (PDT)
Received: from [192.168.2.250] (109-252-144-198.dynamic.spd-mgts.ru [109.252.144.198])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dmitry.osipenko)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 324EE6605960;
        Thu, 18 May 2023 12:34:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1684409655;
        bh=+TXyxOTZP/Vtgt+QNo3AE10lvK4kwBR2oyQ8kg0soQA=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=BuHW3em0n62l2EvlF8YHFraBbbOz+lEuGXUMS6MqRGaPq0YpQfwMtYWwdexaU6z7Q
         dH4b/jRSa4r/r9sOTX0VEKxyfcYl8rfj9m/gcQyRaDo5XJTgP9XXJKUrGzcbi+MaxW
         Pcx8H6C9GdF2YdDmVdN6YzDWfWNr+dhyrdDldirKX2pvRoVSV7z8KCn6PsoNeCtELz
         OpevP3Zee6BxnPmCyn21VMfJOKBJqTAoAjDRAmJW8qifonSwPmz+5a/H+0M9jsz/oJ
         w2h99FOq4fPG9ghYNghWlLAaxsKqwEBE3d3lZ3XXOng7Du/oSISysSYKYt2Ih18nTi
         Iqr12QDPslAUg==
Message-ID: <b4a10313-adce-8d9c-8dd0-510511051185@collabora.com>
Date:   Thu, 18 May 2023 14:34:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 1/5] kernel/reboot: emergency_restart: set correct
 system_state
Content-Language: en-US
To:     Benjamin Bara <bbara93@gmail.com>, Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee@kernel.org>, rafael.j.wysocki@intel.com
Cc:     peterz@infradead.org, jonathanh@nvidia.com,
        richard.leitner@linux.dev, treding@nvidia.com,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        Benjamin Bara <benjamin.bara@skidata.com>,
        stable@vger.kernel.org
References: <20230327-tegra-pmic-reboot-v6-0-af44a4cd82e9@skidata.com>
 <20230327-tegra-pmic-reboot-v6-1-af44a4cd82e9@skidata.com>
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230327-tegra-pmic-reboot-v6-1-af44a4cd82e9@skidata.com>
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

On 5/9/23 22:02, Benjamin Bara wrote:
> From: Benjamin Bara <benjamin.bara@skidata.com>
> 
> As the emergency restart does not call kernel_restart_prepare(), the
> system_state stays in SYSTEM_RUNNING.
> 
> Since bae1d3a05a8b, this hinders i2c_in_atomic_xfer_mode() from becoming
> active, and therefore might lead to avoidable warnings in the restart
> handlers, e.g.:
> 
> [   12.667612] WARNING: CPU: 1 PID: 1 at kernel/rcu/tree_plugin.h:318 rcu_note_context_switch+0x33c/0x6b0
> [   12.676926] Voluntary context switch within RCU read-side critical section!
> ...
> [   12.742376]  schedule_timeout from wait_for_completion_timeout+0x90/0x114
> [   12.749179]  wait_for_completion_timeout from tegra_i2c_wait_completion+0x40/0x70
> ...
> [   12.994527]  atomic_notifier_call_chain from machine_restart+0x34/0x58
> [   13.001050]  machine_restart from panic+0x2a8/0x32c
> 
> Avoid these by setting the correct system_state.
> 
> Fixes: bae1d3a05a8b ("i2c: core: remove use of in_atomic()")
> Cc: stable@vger.kernel.org # v5.2+
> Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> ---
>  kernel/reboot.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/kernel/reboot.c b/kernel/reboot.c
> index 3bba88c7ffc6..6ebef11c8876 100644
> --- a/kernel/reboot.c
> +++ b/kernel/reboot.c
> @@ -74,6 +74,7 @@ void __weak (*pm_power_off)(void);
>  void emergency_restart(void)
>  {
>  	kmsg_dump(KMSG_DUMP_EMERG);
> +	system_state = SYSTEM_RESTART;
>  	machine_emergency_restart();
>  }
>  EXPORT_SYMBOL_GPL(emergency_restart);
> 

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry


Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA7EA707F63
	for <lists+linux-i2c@lfdr.de>; Thu, 18 May 2023 13:34:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231209AbjERLee (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 May 2023 07:34:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231124AbjERLea (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 May 2023 07:34:30 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C53DD19B2;
        Thu, 18 May 2023 04:34:28 -0700 (PDT)
Received: from [192.168.2.250] (109-252-144-198.dynamic.spd-mgts.ru [109.252.144.198])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: dmitry.osipenko)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id C504E6605961;
        Thu, 18 May 2023 12:34:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1684409667;
        bh=QGfLG06H7/U3BYZ2IKDliNOlA1/w+8cf8eGRzQrKSkc=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ReEuLbo+ZoRiGPuEqfc355zLJYQLW/j0zJtoZKXX7WJ8tEgE6K/H/+pn7T+EJ6lFi
         OI3oE0y4fE8XV9Zk8Cv47W/8A381cLjR2o58XCwkcGX3dB6meWTOuu3+dJXwmxB0lP
         GZsnHQzJoKqlSHV8hiY2NYPvOALtrMsEPr5ZmnvTloTJyoYTusbbOfC7kLfOCyJQK/
         zYZZClz9sffjwFVUIXgYiyO5zOAGTfcMSuz7pPhkZogrzPRA26o9hph3b3vHxK+IwW
         CAiLOyQLCp3qRgHQM8pupTbCFkGEWmpoOFFuHOd+9czl220YX9QnjTwMJXfdnNMVeO
         bzVptJnCr7dGA==
Message-ID: <a0581bf1-8420-858f-6d9d-91c4824739a2@collabora.com>
Date:   Thu, 18 May 2023 14:34:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 2/5] i2c: core: run atomic i2c xfer when !preemptible
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
 <20230327-tegra-pmic-reboot-v6-2-af44a4cd82e9@skidata.com>
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230327-tegra-pmic-reboot-v6-2-af44a4cd82e9@skidata.com>
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
> Since bae1d3a05a8b, i2c transfers are non-atomic if preemption is
> disabled. However, non-atomic i2c transfers require preemption (e.g. in
> wait_for_completion() while waiting for the DMA).
> 
> panic() calls preempt_disable_notrace() before calling
> emergency_restart(). Therefore, if an i2c device is used for the
> restart, the xfer should be atomic. This avoids warnings like:
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
> Use !preemptible() instead, which is basically the same check as
> pre-v5.2.
> 
> Fixes: bae1d3a05a8b ("i2c: core: remove use of in_atomic()")
> Cc: stable@vger.kernel.org # v5.2+
> Suggested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Acked-by: Wolfram Sang <wsa@kernel.org>
> Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> ---
>  drivers/i2c/i2c-core.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
> index 1247e6e6e975..05b8b8dfa9bd 100644
> --- a/drivers/i2c/i2c-core.h
> +++ b/drivers/i2c/i2c-core.h
> @@ -29,7 +29,7 @@ int i2c_dev_irq_from_resources(const struct resource *resources,
>   */
>  static inline bool i2c_in_atomic_xfer_mode(void)
>  {
> -	return system_state > SYSTEM_RUNNING && irqs_disabled();
> +	return system_state > SYSTEM_RUNNING && !preemptible();
>  }
>  
>  static inline int __i2c_lock_bus_helper(struct i2c_adapter *adap)
> 

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry


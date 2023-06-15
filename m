Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A2E5730BED
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jun 2023 02:06:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235454AbjFOAGP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Jun 2023 20:06:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbjFOAGO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Jun 2023 20:06:14 -0400
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 872B1199D;
        Wed, 14 Jun 2023 17:06:12 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35F05ZO8043728;
        Wed, 14 Jun 2023 19:05:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1686787535;
        bh=Ro944csWL7XF8bTU/WPZzWSCBdvSsxg7qwCAJdlrbFg=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=jHlaxHDpCAJKpvYWkgeIlMdPEylesW5KT1MBZGCyxMlCSIcDjV7T2fd9bFhzGOtHt
         ZZhrY3ysJxuPQl3fUcNbxqbw2pp6qpllhgjfKM7sGl906xxLlXhS4ylmv+Q/ke0piN
         4aDPExz4IS2MCKM3KJyCpbpf7LSVTWrbVqx7N2rI=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35F05ZBR089860
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 14 Jun 2023 19:05:35 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Jun 2023 19:05:35 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Jun 2023 19:05:35 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35F05Yen095911;
        Wed, 14 Jun 2023 19:05:34 -0500
Date:   Wed, 14 Jun 2023 19:05:34 -0500
From:   Nishanth Menon <nm@ti.com>
To:     Benjamin Bara <bbara93@gmail.com>
CC:     Wolfram Sang <wsa@kernel.org>, Lee Jones <lee@kernel.org>,
        <rafael.j.wysocki@intel.com>, <dmitry.osipenko@collabora.com>,
        <peterz@infradead.org>, <jonathanh@nvidia.com>,
        <richard.leitner@linux.dev>, <treding@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>,
        Benjamin Bara <benjamin.bara@skidata.com>,
        <stable@vger.kernel.org>
Subject: Re: [PATCH v6 2/5] i2c: core: run atomic i2c xfer when !preemptible
Message-ID: <20230615000534.hhha2buodatmwugl@turban>
References: <20230327-tegra-pmic-reboot-v6-0-af44a4cd82e9@skidata.com>
 <20230327-tegra-pmic-reboot-v6-2-af44a4cd82e9@skidata.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230327-tegra-pmic-reboot-v6-2-af44a4cd82e9@skidata.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 21:03-20230509, Benjamin Bara wrote:
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
> -- 
> 2.34.1
> 
Tested-by: Nishanth Menon <nm@ti.com>

This in addition to a deeper bug in our driver seems to have helped
resolve a report we had been looking at. Tested on beagleplay platform

https://lore.kernel.org/all/ZGeHMjlnob2GFyHF@francesco-nb.int.toradex.com/

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

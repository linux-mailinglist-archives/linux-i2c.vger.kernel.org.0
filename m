Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 450B5730BF9
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jun 2023 02:07:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231700AbjFOAHQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Jun 2023 20:07:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbjFOAHP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Jun 2023 20:07:15 -0400
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 441121BF0;
        Wed, 14 Jun 2023 17:07:14 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35F06pxm110461;
        Wed, 14 Jun 2023 19:06:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1686787611;
        bh=HpjYC8Zy36oNKypgasHKYJFI82JR+WX3T/CX21uzjOM=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=whOjjlHRlBFiZWdQEWnQFUTx4NXx1BA/WUlcTv54Y91BbNDwXWjxPAaKXwoGeYHiO
         +IZdiiEoad9/cyQHGF7j1wgG3mH++o3kK/amAbLHAIxO5dxHpMrv9UVypDAKGbenjx
         zvwizOqx8+R4biap8J6kKKYc7hWTtjmOKk/ZkfnI=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35F06pCI011483
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 14 Jun 2023 19:06:51 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Jun 2023 19:06:51 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Jun 2023 19:06:51 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35F06ont047035;
        Wed, 14 Jun 2023 19:06:50 -0500
Date:   Wed, 14 Jun 2023 19:06:50 -0500
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
Subject: Re: [PATCH v6 1/5] kernel/reboot: emergency_restart: set correct
 system_state
Message-ID: <20230615000650.coyphnwdai7smww7@unblended>
References: <20230327-tegra-pmic-reboot-v6-0-af44a4cd82e9@skidata.com>
 <20230327-tegra-pmic-reboot-v6-1-af44a4cd82e9@skidata.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230327-tegra-pmic-reboot-v6-1-af44a4cd82e9@skidata.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 21:02-20230509, Benjamin Bara wrote:
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

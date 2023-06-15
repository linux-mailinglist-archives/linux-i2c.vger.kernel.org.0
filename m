Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 713B4731B87
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jun 2023 16:39:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344831AbjFOOji (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Jun 2023 10:39:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238807AbjFOOjh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Jun 2023 10:39:37 -0400
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2142A199;
        Thu, 15 Jun 2023 07:39:35 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35FEd9VZ030973;
        Thu, 15 Jun 2023 09:39:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1686839949;
        bh=Y9bvtf286pw8tf5Ndk8qnBgZRSTn851+8LwiWYBhhiQ=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=RLtTisZOpC0lHRYLuLBR3bqlrt6wx9RYRWag0pTbJ5VysSt/yKePtDkYWVfqAHYZx
         iMLuQvngBTiQIOnwzrRagFnqM/A7QZmQ9yaFcqfySp/cw+mtYbUESrR0n8ahm499hQ
         dTEl/UGeDdQC0EvqBrVIAOKIJC5GLhlPUc8lmMNs=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35FEd9Eg023224
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 15 Jun 2023 09:39:09 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Jun 2023 09:39:09 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Jun 2023 09:39:09 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35FEd9oE028627;
        Thu, 15 Jun 2023 09:39:09 -0500
Date:   Thu, 15 Jun 2023 09:39:09 -0500
From:   Nishanth Menon <nm@ti.com>
To:     Francesco Dolcini <francesco@dolcini.it>
CC:     Benjamin Bara <bbara93@gmail.com>, Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee@kernel.org>, <rafael.j.wysocki@intel.com>,
        <dmitry.osipenko@collabora.com>, <peterz@infradead.org>,
        <jonathanh@nvidia.com>, <richard.leitner@linux.dev>,
        <treding@nvidia.com>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Benjamin Bara <benjamin.bara@skidata.com>,
        <stable@vger.kernel.org>
Subject: Re: [PATCH v6 1/5] kernel/reboot: emergency_restart: set correct
 system_state
Message-ID: <20230615143909.fjr25wghwrtepk6g@unwieldy>
References: <20230327-tegra-pmic-reboot-v6-0-af44a4cd82e9@skidata.com>
 <20230327-tegra-pmic-reboot-v6-1-af44a4cd82e9@skidata.com>
 <20230615000650.coyphnwdai7smww7@unblended>
 <ZIsQPutiZWACawec@francesco-nb.int.toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZIsQPutiZWACawec@francesco-nb.int.toradex.com>
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

On 15:21-20230615, Francesco Dolcini wrote:
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> > Tested-by: Nishanth Menon <nm@ti.com>
> > 
> > This in addition to a deeper bug in our driver seems to have helped
> > resolve a report we had been looking at. Tested on beagleplay platform
> > 
> > https://lore.kernel.org/all/ZGeHMjlnob2GFyHF@francesco-nb.int.toradex.com/
> 
> Is this patch going to fix the RCU warning I reported on that email or
> it is just part of a more complex solution?

From what I see, It is part of the solution.
Problem happens as follows for us:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/firmware/ti_sci.c#n421

When i2c is not that frequently used, runtime pm disables the power
domain on our platform. As part of reset or power-off, when i2c is
invoked, it ends up calling into the firmware handler which (no
surprise), attempts to do the wrong thing (and rightly flagged by RCU).

We are in the middle of trying various combinations out to ensure we
are'nt messing things up.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

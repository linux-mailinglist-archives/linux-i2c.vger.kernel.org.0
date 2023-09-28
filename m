Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03C247B1A6D
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Sep 2023 13:17:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231778AbjI1LRe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Sep 2023 07:17:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232786AbjI1LQu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Sep 2023 07:16:50 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9CA742B9C3;
        Thu, 28 Sep 2023 04:12:21 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C9D51FB;
        Thu, 28 Sep 2023 04:12:34 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6BFE93F5A1;
        Thu, 28 Sep 2023 04:11:54 -0700 (PDT)
Date:   Thu, 28 Sep 2023 12:11:52 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     "lihuisong (C)" <lihuisong@huawei.com>
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/3] ACPI: PCC: Add PCC shared memory region command and
 status bitfields
Message-ID: <20230928111152.cctl3m5rwtopyg2g@bogus>
References: <20230926-pcc_defines-v1-0-0f925a1658fd@arm.com>
 <20230926-pcc_defines-v1-1-0f925a1658fd@arm.com>
 <a89bdd10-9388-01f5-6a7c-894af793e1c1@huawei.com>
 <20230927135909.6rssuywmj4k3odex@bogus>
 <fbc038e3-9719-3f90-0c09-f26318e21f38@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fbc038e3-9719-3f90-0c09-f26318e21f38@huawei.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 28, 2023 at 11:49:25AM +0800, lihuisong (C) wrote:
> 
> 在 2023/9/27 21:59, Sudeep Holla 写道:
> > On Wed, Sep 27, 2023 at 10:07:15AM +0800, lihuisong (C) wrote:

[...]

> > > > +/* Generic Communications Channel Shared Memory Region */
> > > > +#define PCC_SIGNATURE			0x50424300
> > > Why is this signature 0x50424300?
> > It is as per the specification.
> > 
> > > In ACPI spec, this signature is all 0x50434303.
> > No, not exactly. It is just an example.
> > The PCC signature - The signature of a subspace is computed by a bitwise-or
> > of the value 0x50434300 with the subspace ID. For example, subspace 3 has
> > signature 0x50434303
> Sorry for my mistake. I know this.
> I mean, why doesn't the following macro follow spec and define this
> signature as 0x504*3*430.
> "#define PCC_SIGNATURE **0x504*2*4300*"*
> Because it seems that all version of ACPI spec is 0x5043430.

Sorry my mistake. Stupidly the existing drivers have it wrong and I just
copied them without paying much attention. I will fix it up. It must be
0x50434300 instead of 0x50424300. If you have no other comments, can you
please ack v2 patch 4/4 changing soc kunpeng_hccs driver. I will fixup
the PCC_SIGNATURE and send it as part of my PR to Rafael.

Refer [1] for the change in PCC_SIGNATURE, sorry for missing the point. I
was confident that the existing code is correct :), but I am wrong.

-- 
Regards,
Sudeep

[1] https://git.kernel.org/sudeep.holla/l/pcc_defines

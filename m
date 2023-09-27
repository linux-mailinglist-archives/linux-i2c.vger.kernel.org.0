Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85BF37B05ED
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Sep 2023 16:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232000AbjI0OAd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Sep 2023 10:00:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231758AbjI0OAc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 Sep 2023 10:00:32 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7734AFC;
        Wed, 27 Sep 2023 07:00:31 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54CB31FB;
        Wed, 27 Sep 2023 07:01:09 -0700 (PDT)
Received: from bogus (unknown [10.57.37.227])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B9D0A3F59C;
        Wed, 27 Sep 2023 07:00:29 -0700 (PDT)
Date:   Wed, 27 Sep 2023 14:59:09 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     "lihuisong (C)" <lihuisong@huawei.com>
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        Sudeep Holla <sudeep.holla@arm.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/3] ACPI: PCC: Add PCC shared memory region command and
 status bitfields
Message-ID: <20230927135909.6rssuywmj4k3odex@bogus>
References: <20230926-pcc_defines-v1-0-0f925a1658fd@arm.com>
 <20230926-pcc_defines-v1-1-0f925a1658fd@arm.com>
 <a89bdd10-9388-01f5-6a7c-894af793e1c1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a89bdd10-9388-01f5-6a7c-894af793e1c1@huawei.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 27, 2023 at 10:07:15AM +0800, lihuisong (C) wrote:
> Hi Sudeep,
> 
> 在 2023/9/26 20:28, Sudeep Holla 写道:
> > Define the common macros to use when referring to various bitfields in
> > the PCC generic communications channel command and status fields.
>
> Can you define the bit0 macros in the "flags" for Extended PCC Subspace
> Shared Memory Region?

Sure I will take a look and include it in v2 if applicable.

> > 
> > Currently different drivers that need to use these bitfields have defined
> > these locally. This common macro is intended to consolidate and replace
> > those.
> > 
> > Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> > ---
> >   include/acpi/pcc.h | 11 +++++++++++
> >   1 file changed, 11 insertions(+)
> > 
> > diff --git a/include/acpi/pcc.h b/include/acpi/pcc.h
> > index 73e806fe7ce7..66d9934c2ee4 100644
> > --- a/include/acpi/pcc.h
> > +++ b/include/acpi/pcc.h
> > @@ -18,7 +18,18 @@ struct pcc_mbox_chan {
> >   	u16 min_turnaround_time;
> >   };
> > +/* Generic Communications Channel Shared Memory Region */
> > +#define PCC_SIGNATURE			0x50424300
> Why is this signature 0x50424300?

It is as per the specification.

> In ACPI spec, this signature is all 0x50434303.

No, not exactly. It is just an example.
The PCC signature - The signature of a subspace is computed by a bitwise-or
of the value 0x50434300 with the subspace ID. For example, subspace 3 has
signature 0x50434303

And I see the driver you mentioned(drivers/soc/hisilicon/kunpeng_hccs.c)
is doing the right thing. I am bit confused as why you being the author
of the driver are now confused.

-- 
Regards,
Sudeep

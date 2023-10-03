Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99B5E7B6B88
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Oct 2023 16:29:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240027AbjJCO3Y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Oct 2023 10:29:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239859AbjJCO3Y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Oct 2023 10:29:24 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E050DB0;
        Tue,  3 Oct 2023 07:29:20 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 295DDC15;
        Tue,  3 Oct 2023 07:29:59 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C0603F59C;
        Tue,  3 Oct 2023 07:29:19 -0700 (PDT)
Date:   Tue, 3 Oct 2023 15:29:16 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Huisong Li <lihuisong@huawei.com>
Subject: Re: [PATCH v2 1/4] ACPI: PCC: Add PCC shared memory region command
 and status bitfields
Message-ID: <20231003142916.6nbg5sfwd3tk6ol4@bogus>
References: <20230927-pcc_defines-v2-0-0b8ffeaef2e5@arm.com>
 <20230927-pcc_defines-v2-1-0b8ffeaef2e5@arm.com>
 <CAJZ5v0hG0sDJ4VOY+Gk0Fg1gebNft+z3YK9Jf-7NHb9Ow-C2mg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0hG0sDJ4VOY+Gk0Fg1gebNft+z3YK9Jf-7NHb9Ow-C2mg@mail.gmail.com>
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Oct 03, 2023 at 03:29:16PM +0200, Rafael J. Wysocki wrote:
> On Wed, Sep 27, 2023 at 6:32 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
> >
> > Define the common macros to use when referring to various bitfields in
> > the PCC generic communications channel command and status fields.
> >
> > Currently different drivers that need to use these bitfields have defined
> > these locally. This common macro is intended to consolidate and replace
> > those.
> >
> > Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> > ---
> >  include/acpi/pcc.h | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/include/acpi/pcc.h b/include/acpi/pcc.h
> > index 73e806fe7ce7..021891a7434f 100644
> > --- a/include/acpi/pcc.h
> > +++ b/include/acpi/pcc.h
> > @@ -18,7 +18,20 @@ struct pcc_mbox_chan {
> >         u16 min_turnaround_time;
> >  };
> >
> > +/* Generic Communications Channel Shared Memory Region */
> > +#define PCC_SIGNATURE                  0x50424300
> > +/* Generic Communications Channel Command Field */
> > +#define PCC_CMD_GENERATE_DB_INTR       BIT(15)
> > +/* Generic Communications Channel Status Field */
> > +#define PCC_STATUS_CMD_COMPLETE                BIT(0)
> > +#define PCC_STATUS_SCI_DOORBELL                BIT(1)
> > +#define PCC_STATUS_ERROR               BIT(2)
> > +#define PCC_STATUS_PLATFORM_NOTIFY     BIT(3)
> > +/* Initiator Responder Communications Channel Flags */
> > +#define PCC_CMD_COMPLETION_NOTIFY      BIT(0)
> > +
> >  #define MAX_PCC_SUBSPACES      256
> > +
> >  #ifdef CONFIG_PCC
> >  extern struct pcc_mbox_chan *
> >  pcc_mbox_request_channel(struct mbox_client *cl, int subspace_id);
> >
> > --
> 
> Do you want me to pick up this lot?

I have applied this to me branch [1]. It also has long pending PCC driver
changes. I will send the pull request by end of this week.

-- 
Regards,
Sudeep

[1] https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git/log/?h=for-next/pcc/updates

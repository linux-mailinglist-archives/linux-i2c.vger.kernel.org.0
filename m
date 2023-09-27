Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 283627B0741
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Sep 2023 16:47:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232134AbjI0OrR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Sep 2023 10:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232046AbjI0OrR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 Sep 2023 10:47:17 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E4A38F4;
        Wed, 27 Sep 2023 07:47:15 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACA521FB;
        Wed, 27 Sep 2023 07:47:53 -0700 (PDT)
Received: from bogus (unknown [10.57.37.227])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3CFA3F59C;
        Wed, 27 Sep 2023 07:47:13 -0700 (PDT)
Date:   Wed, 27 Sep 2023 15:45:52 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 0/3] ACPI: PCC: Define and use the common PCC shared
 memory regions related macros
Message-ID: <20230927144552.pqolbw5p22sgc22l@bogus>
References: <20230926-pcc_defines-v1-0-0f925a1658fd@arm.com>
 <CAJZ5v0hq37x_v6Z0Vqj2h8D5QZM8zWE4=GfrMk7YAEfUjeRydA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0hq37x_v6Z0Vqj2h8D5QZM8zWE4=GfrMk7YAEfUjeRydA@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 27, 2023 at 04:19:21PM +0200, Rafael J. Wysocki wrote:
> On Tue, Sep 26, 2023 at 2:33 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
> >
> > This set of 3 small patches intend to consolidate and replace the existing
> > locally defined macros within couple of PCC client drivers when accessing
> > the command and status bitfields.
> >
> > Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> > ---
> > Sudeep Holla (3):
> >       ACPI: PCC: Add PCC shared memory region command and status bitfields
> >       i2c: xgene-slimpro: Migrate to use generic PCC shmem related macros
> >       hwmon: (xgene) Migrate to use generic PCC shmem related macros
> >
> >  drivers/hwmon/xgene-hwmon.c            | 16 +++++-----------
> >  drivers/i2c/busses/i2c-xgene-slimpro.c | 16 ++++------------
> >  include/acpi/pcc.h                     | 11 +++++++++++
> >  3 files changed, 20 insertions(+), 23 deletions(-)
> > ---
> 
> This is fine with me.
> 
> How do you want to route it?

I have to respin this to include another driver.

I also have 2 PCC mailbox driver changes that I wanted to send a pull request
to you. I can make this part of that PR or you can take it directly. Both
hwmon and i2c maintainers have acked now.

--
Regards,
Sudeep

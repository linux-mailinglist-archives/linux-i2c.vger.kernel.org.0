Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30F9C7B05F4
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Sep 2023 16:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232011AbjI0OBq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Sep 2023 10:01:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231758AbjI0OBp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 Sep 2023 10:01:45 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3FBBBFC;
        Wed, 27 Sep 2023 07:01:44 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E7151042;
        Wed, 27 Sep 2023 07:02:22 -0700 (PDT)
Received: from bogus (unknown [10.57.37.227])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E03B3F59C;
        Wed, 27 Sep 2023 07:01:42 -0700 (PDT)
Date:   Wed, 27 Sep 2023 15:00:22 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     "lihuisong (C)" <lihuisong@huawei.com>
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 0/3] ACPI: PCC: Define and use the common PCC shared
 memory regions related macros
Message-ID: <20230927140022.qeck6t7mbnq7ky7s@bogus>
References: <20230926-pcc_defines-v1-0-0f925a1658fd@arm.com>
 <9497cf31-09b9-b083-bbe8-84307178b20a@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9497cf31-09b9-b083-bbe8-84307178b20a@huawei.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 27, 2023 at 10:11:21AM +0800, lihuisong (C) wrote:
> Hi Sudeep,
> 
> Could you please use these new common macros for kunpeng_hccs?

Sure, sorry for missing that. I had these changes in a branch for a while,
did check for new additions when I decided to post them.

-- 
Regards,
Sudeep

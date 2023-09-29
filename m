Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C187A7B31AA
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Sep 2023 13:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233170AbjI2Lps (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Sep 2023 07:45:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233188AbjI2Lpd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Sep 2023 07:45:33 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E4B1C1980;
        Fri, 29 Sep 2023 04:45:15 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D77501FB;
        Fri, 29 Sep 2023 04:45:53 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 29B803F59C;
        Fri, 29 Sep 2023 04:45:14 -0700 (PDT)
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        Sudeep Holla <sudeep.holla@arm.com>
Cc:     "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Huisong Li <lihuisong@huawei.com>
Subject: Re: [PATCH v2 0/4] ACPI: PCC: Define and use the common PCC shared memory regions related macros
Date:   Fri, 29 Sep 2023 12:45:10 +0100
Message-ID: <169598703811.2113895.1673081540867422060.b4-ty@arm.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230927-pcc_defines-v2-0-0b8ffeaef2e5@arm.com>
References: <20230927-pcc_defines-v2-0-0b8ffeaef2e5@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 27 Sep 2023 17:26:09 +0100, Sudeep Holla wrote:
> This set of 3 small patches intend to consolidate and replace the existing
> locally defined macros within couple of PCC client drivers when accessing
> the command and status bitfields.
>

Applied to sudeep.holla/linux (for-next/pcc/updates), thanks!

[1/4] ACPI: PCC: Add PCC shared memory region command and status bitfields
      [fixed the signature value]
      https://git.kernel.org/sudeep.holla/c/55d235ebb684
[2/4] i2c: xgene-slimpro: Migrate to use generic PCC shmem related macros
      https://git.kernel.org/sudeep.holla/c/89a4ad1f437c
[3/4] hwmon: (xgene) Migrate to use generic PCC shmem related macros
      https://git.kernel.org/sudeep.holla/c/2cf39b806be7
[4/4] soc: kunpeng_hccs: Migrate to use generic PCC shmem related macros
      https://git.kernel.org/sudeep.holla/c/a46e42c09798
--
Regards,
Sudeep


Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 564235E623E
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Sep 2022 14:23:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231392AbiIVMXS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Sep 2022 08:23:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231405AbiIVMXR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Sep 2022 08:23:17 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E4DFE62CE;
        Thu, 22 Sep 2022 05:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663849396; x=1695385396;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=anV/mtQTR0ZoFA6AaZoQH1kppXPIdPVrz2EF7CF8qj0=;
  b=XNW+/JdJ65YgiU9UWBL6w2U4D9cXi5E+qCkyML0AzW+tFeW6MbW6zww5
   i2AmdSAZyS4dbpHvz2IKBjVxjvVACzZNS79OUjJFS+6lSvaI70IwP5PHc
   apS/Hcc+WI2v/AzK50sGEuS/vyjECHI6Y7eJllBjZqAplh+bTtd6ZkBQe
   o7pDn9bRxhQ2Dt9YFiwPiX2DONiFvT9XnTi6E198dv2omX49tbL/cftia
   UuP2QSZ+ZPJXSYKRnOPrnLHYVDeYbNDlq/ABqIE9EElqfLxSrcigBRyLn
   TFMPr6rngKe6KKhkYLCLfntcG8N+DiOVcl7X+24SrNMYzswuYMwoFeyHb
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="298997804"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="298997804"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 05:23:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="948572563"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 22 Sep 2022 05:23:12 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 41F22238; Thu, 22 Sep 2022 15:23:30 +0300 (EEST)
Date:   Thu, 22 Sep 2022 15:23:30 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
        linux-acpi@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>,
        Jianmin Lv <lvjianmin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH 1/5] i2c: core: Pick i2c bus number from ACPI if present
Message-ID: <YyxTwl7mos/hARWm@black.fi.intel.com>
References: <cover.1663835855.git.zhoubinbin@loongson.cn>
 <be5cd69c7c58d44ca119d4ca692d95a2ae924533.1663835855.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be5cd69c7c58d44ca119d4ca692d95a2ae924533.1663835855.git.zhoubinbin@loongson.cn>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Thu, Sep 22, 2022 at 07:39:54PM +0800, Binbin Zhou wrote:
> Under LoongARCH based on ACPI(such as Loongson-3A + LS7A), the ls2x i2c
> driver obtains the i2c bus number from ACPI table.

Why this is needed? The I2CSerialBusV2() resource should be enough to
identify the adapter, and I don't see why static number would be needed
for anything?

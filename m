Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 392885E764C
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Sep 2022 10:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231474AbiIWIzW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Sep 2022 04:55:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231449AbiIWIzT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Sep 2022 04:55:19 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 145D893220;
        Fri, 23 Sep 2022 01:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663923317; x=1695459317;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CZ+L8fkLDljH3TQib+2ay5f/ZuvbmYFYzQuFhmMoxT0=;
  b=Uv2ij1toygVXfYOzVXbKAJKB4lAw2JeVwGLXbUqtBjSr7/FuU5IytSK4
   NBAy0nba3QAvpEn6BxJFgh83MTKZdpTovV5CyehMxGXGYHEtnLvHYdYsp
   e/kqMEH9STnQN7jovAcpQpBSJzruz+1nuTUEYT4DBJGmXAbbvZY8btk7O
   OlofnmDKrDkKlcJlMA1cPTW50fCMogpjrgTxaXxIRUU3QfLmZfSiNoC01
   J1vJABiqK0VnA1pMdckhSFYdC5AvOaqrsKLuVclOZYmFUrZitm/ltnW7E
   5GRRlz7xSecoNW/sR7LEGpLp0FrESG2zE15eRuLcpKpo1LX5FXMeSGt9w
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="301993685"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="301993685"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2022 01:55:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="865226199"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 23 Sep 2022 01:55:05 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 92C23F7; Fri, 23 Sep 2022 11:55:22 +0300 (EEST)
Date:   Fri, 23 Sep 2022 11:55:22 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Huacai Chen <chenhuacai@kernel.org>
Cc:     Binbin Zhou <zhoubinbin@loongson.cn>,
        Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Jianmin Lv <lvjianmin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH 1/5] i2c: core: Pick i2c bus number from ACPI if present
Message-ID: <Yy10eg4p45Y4M7Q/@black.fi.intel.com>
References: <cover.1663835855.git.zhoubinbin@loongson.cn>
 <be5cd69c7c58d44ca119d4ca692d95a2ae924533.1663835855.git.zhoubinbin@loongson.cn>
 <YyxTwl7mos/hARWm@black.fi.intel.com>
 <CAAhV-H4waMMDnctjkC61P6eurLuPfhs1+UP1vLc-XwHXieEhgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAhV-H4waMMDnctjkC61P6eurLuPfhs1+UP1vLc-XwHXieEhgQ@mail.gmail.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Fri, Sep 23, 2022 at 03:16:03PM +0800, Huacai Chen wrote:
> Hi, Mika,
> 
> On Thu, Sep 22, 2022 at 8:23 PM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> >
> > Hi,
> >
> > On Thu, Sep 22, 2022 at 07:39:54PM +0800, Binbin Zhou wrote:
> > > Under LoongARCH based on ACPI(such as Loongson-3A + LS7A), the ls2x i2c
> > > driver obtains the i2c bus number from ACPI table.
> >
> > Why this is needed? The I2CSerialBusV2() resource should be enough to
> > identify the adapter, and I don't see why static number would be needed
> > for anything?
> >
> In later patches we will add LS7A i2c driver, this driver is shared by
> MIPS-based Loongson-3A4000 system (use FDT) and LoongArch-based
> Loongson-3A5000 system (use ACPI).
> 
> FDT systems support static bus numbers, so we want to do the same
> thing on ACPI systems. I think keep this consistency can make user
> feel better

I don't think the user cares to be honest. As long as all the devices
work as expected ;-) And this saves a couple of lines of code too so if
not really needed, I would just drop that part.

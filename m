Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 294596EED19
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Apr 2023 06:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239026AbjDZEvZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Apr 2023 00:51:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238440AbjDZEvZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Apr 2023 00:51:25 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 410411B6
        for <linux-i2c@vger.kernel.org>; Tue, 25 Apr 2023 21:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682484684; x=1714020684;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3utn53lV/AUbE6pDAamZ04zbwipzS1zApClxbkctjQQ=;
  b=bggv+ucqL2iyNF2Hz0hOzk4NNeeten3RTuifh1wh37qi+wo9D4E7vIJ+
   ABq5idrEGiDrkcGsWRQao3lVSsciwnEJIe8rSjtfvznrBn++oGvsYUgcx
   isK0mATpOxgUGQ1ECHdHSBcOTxb5mHYRFbDMKcEaso+RA1kzEVGLXddg1
   WeRyZ0B3rTWQbfpQc1HR/y4mAjMPc7gSFqsOe3J2C/NJWbQo5cIEmRqGe
   WCSQeAvfs1dMj5WyWJSOgTceDql15ecjqHMq8nHd8f1qmJ0gX8FUn7dp0
   iiPuZ3ms8fUSCHczB6We4gqHMI3C84xz3cnamg0/OzZ9ZkaZb9FFcpJuG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="349795025"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="349795025"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 21:51:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="837735559"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="837735559"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 25 Apr 2023 21:51:22 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 40DBE4B9; Wed, 26 Apr 2023 07:51:27 +0300 (EEST)
Date:   Wed, 26 Apr 2023 07:51:27 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Chris Murphy <lists@colorremedies.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org
Subject: Re: intel-lpss 0000:00:15.1: idma64_irq: status=0x0, millions of
 lines spamming journal
Message-ID: <20230426045127.GZ66750@black.fi.intel.com>
References: <47ff45c8-20da-4eac-acad-6d51353f95c6@app.fastmail.com>
 <ZEdsLw+dJhdHVdEO@sai>
 <20230425070109.GU66750@black.fi.intel.com>
 <a08d27b1-6eed-4fba-a3e9-b3b6746c88c3@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a08d27b1-6eed-4fba-a3e9-b3b6746c88c3@app.fastmail.com>
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 25, 2023 at 01:14:35PM -0400, Chris Murphy wrote:
> 
> 
> On Tue, Apr 25, 2023, at 3:01 AM, Mika Westerberg wrote:
> > Hi Chris,
> >
> > Would you be able to bisect this to a mainline commit?
> 
> Difficult in the near term.
> 
> 
> > At least looking at the changes between v6.3-rc1 and v6.3-rc7 there is
> > virtually nothing to any of these drivers involved. The log itself looks
> > like:
> >
> >        dev_vdbg(idma64->dma.dev, "%s: status=%#x\n", __func__, status);
> >
> > so this should not be enabled at all unless CONFIG_DMADEVICES_VDEBUG is
> > set to y which seems odd in distro kernel.
> 
> $ grep DMADEVICES /boot/config-6.3.0-0.rc2.20230315git6015b1aca1a2.25.fc39.x86_64+debug 
> CONFIG_DMADEVICES=y
> CONFIG_DMADEVICES_DEBUG=y
> # CONFIG_DMADEVICES_VDEBUG is not set
> $ grep DMADEVICES /boot/config-6.3.0-0.rc2.20230317git38e04b3e4240.27.fc39.x86_64+debug 
> CONFIG_DMADEVICES=y
> CONFIG_DMADEVICES_DEBUG=y
> CONFIG_DMADEVICES_VDEBUG=y
> 
> It follows the bug, though I'm not sure if this is the true source of the problem?

Okay, so the issue here I think is just that the VDEBUG is enabled.
Since idma64 and I2C share the interrupt, each time a I2C transaction is
done the idma64 interrupt handler is called as well:

17:          0          0      18841          0          0          0          0          0  IR-IO-APIC   17-fasteoi   i2c_designware.1, idma64.1

so these end up in the dmesg and journal. I suggest to just disable the
VDEBUG. Probably was enabled in the Fedora .config by accident as this
is something that should not be enabled by distro kernels.

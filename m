Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E3D56EDC04
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Apr 2023 09:01:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231189AbjDYHBH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Apr 2023 03:01:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjDYHBH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Apr 2023 03:01:07 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0D5A5FF0
        for <linux-i2c@vger.kernel.org>; Tue, 25 Apr 2023 00:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682406065; x=1713942065;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=pAfE2YVdN/mrL6gd+hbl6TUa91ziJPX34kdCLJe2TJE=;
  b=gP1b5J6ldsLmo4OlbCiI7c4Amvo/TnhS983PXUfGJmi/TZ8vgr58VnX3
   QK/kpL0Qent7e/VIc5LJDf1OpNXti5hbQkTs+fj+r6zXzYWM1adymP4Y3
   DklDG4sSbqj1LZC9CElgY+B49wMcOoDABaiO+L3T4w2y4uOCiw/PHWYH3
   KcAxo8hmz3Dl0juiBzrcdnlwGGsuuxDkKtzDgDqe5tyt1sm4IOvYd8cMe
   92VXmQ36pvN6GApDw3096vfcDsdO1LqmG1tmotlnYXPPsPA4PaTFAjsyP
   hwSsXxyuypfLJSFgLCLf8I7lA5F8zB9KNYoku3+m4bbcJieGiittPPNhi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="335575969"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="335575969"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 00:01:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="757997104"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="757997104"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 25 Apr 2023 00:01:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id C95E84B9; Tue, 25 Apr 2023 10:01:09 +0300 (EEST)
Date:   Tue, 25 Apr 2023 10:01:09 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Chris Murphy <lists@colorremedies.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org
Subject: Re: intel-lpss 0000:00:15.1: idma64_irq: status=0x0, millions of
 lines spamming journal
Message-ID: <20230425070109.GU66750@black.fi.intel.com>
References: <47ff45c8-20da-4eac-acad-6d51353f95c6@app.fastmail.com>
 <ZEdsLw+dJhdHVdEO@sai>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZEdsLw+dJhdHVdEO@sai>
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Chris,

Would you be able to bisect this to a mainline commit?

At least looking at the changes between v6.3-rc1 and v6.3-rc7 there is
virtually nothing to any of these drivers involved. The log itself looks
like:

       dev_vdbg(idma64->dma.dev, "%s: status=%#x\n", __func__, status);

so this should not be enabled at all unless CONFIG_DMADEVICES_VDEBUG is
set to y which seems odd in distro kernel.

Also what does /proc/interrupts show for this?

On Tue, Apr 25, 2023 at 07:59:11AM +0200, Wolfram Sang wrote:
> 
> CCing the designware maintainers. Not sure if it really is the I2C part
> of lpss which regressed, though. There wasn't a change to the driver
> since 6.3-rc1. The changes in rc1 seem unrelated to me, but I leave that
> to the pros.
> 
> On Mon, Apr 24, 2023 at 05:51:15PM -0400, Chris Murphy wrote:
> > Downstream bug has dmesg, lspci, acpidump attached
> > https://bugzilla.redhat.com/show_bug.cgi?id=2188969
> > 
> > The gist is repeating message:
> > 
> > kernel: intel-lpss 0000:00:15.1: idma64_irq: status=0x0
> > 
> > ~6800 times in a couple seconds, and in a few hours racked up over 3.3 million.
> > 
> > Bug first appears in 6.3.0-0.rc2.20230317git38e04b3e4240.27.fc39.x86_64+debug
> > Last good version is 6.3.0-0.rc2.20230315git6015b1aca1a2.25.fc39.x86_64+debug
> > 
> > Bug appears in 6.3.0 release. It does not appear in 6.2 series kernels or older.
> > 
> > 
> > --
> > Chris Murphy



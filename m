Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3081F4B204A
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Feb 2022 09:40:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348051AbiBKIkD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Feb 2022 03:40:03 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344089AbiBKIkC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Feb 2022 03:40:02 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B20E1BF;
        Fri, 11 Feb 2022 00:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644568801; x=1676104801;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gjIsbK9GNfLO3HPtKpVD2XLjkjlVZ/05OE5660HJOlc=;
  b=Oh9O/skcwl7CTvUYojN4Hh2STIXlPeLqhh07JsdDDd/HRfZ8Vm92o0yW
   qldVvDCA/q5XJBfp6sxZPU566HXuHcpRTvargAauihKwbH3TchjlP6c14
   1+k9x66awqdDTeLclXhvkug/Spn51KD1cCIU4GD0la+gHVZtn97Ycaigm
   +HgsiN65KqMqmPynBw25n7S9gFn62HFlLc8ZYBxieDEwyAzBUrWEQdHp0
   jCiEocHUVKdIkeR7Oj88zsW0LvHbIdfsGjyKhcTti1awbfnkaTHaxSpLp
   0HLG1MNlJre7VDXn8toWyaSCVAx4DRstqVXVkmBOf4PoXhqQSmv8iKWBY
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="230332659"
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; 
   d="scan'208";a="230332659"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2022 00:39:55 -0800
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; 
   d="scan'208";a="634008657"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2022 00:39:52 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nIRSA-003N6D-J2;
        Fri, 11 Feb 2022 10:38:54 +0200
Date:   Fri, 11 Feb 2022 10:38:54 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     syzbot <syzbot+0591ccf54ee05344e4eb@syzkaller.appspotmail.com>
Cc:     akhilrajeev@nvidia.com, djrscally@gmail.com,
        gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com,
        johan@kernel.org, linux-acpi@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        rafael@kernel.org, sakari.ailus@linux.intel.com,
        syzkaller-bugs@googlegroups.com, wsa@kernel.org
Subject: Re: [syzbot] general protection fault in i2c_setup_smbus_alert
Message-ID: <YgYgnqnBqRe/pRoo@smile.fi.intel.com>
References: <0000000000006e988105d72fbe3f@google.com>
 <0000000000001a5dc005d7b5fab1@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0000000000001a5dc005d7b5fab1@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SORTED_RECIPS,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Feb 10, 2022 at 07:51:08PM -0800, syzbot wrote:
> syzbot has bisected this issue to:
> 
> commit a263a84088f689bf0c1552a510b25d0bcc45fcae
> Author: Akhil R <akhilrajeev@nvidia.com>
> Date:   Fri Jan 28 11:44:27 2022 +0000
> 
>     i2c: smbus: Use device_*() functions instead of of_*()
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=156c8174700000
> start commit:   ef6b35306dd8 Add linux-next specific files for 20220204
> git tree:       linux-next
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=176c8174700000
> console output: https://syzkaller.appspot.com/x/log.txt?x=136c8174700000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=e0431e0b00810b4f
> dashboard link: https://syzkaller.appspot.com/bug?extid=0591ccf54ee05344e4eb
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1105f472700000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16492aa4700000
> 
> Reported-by: syzbot+0591ccf54ee05344e4eb@syzkaller.appspotmail.com
> Fixes: a263a84088f6 ("i2c: smbus: Use device_*() functions instead of of_*()")
> 
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

I was faster :-)

https://lore.kernel.org/all/20220204155920.13364-1-andriy.shevchenko@linux.intel.com/

-- 
With Best Regards,
Andy Shevchenko



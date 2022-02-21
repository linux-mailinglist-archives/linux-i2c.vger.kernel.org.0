Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F8034BEB15
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Feb 2022 20:37:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231747AbiBUSmM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Feb 2022 13:42:12 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232321AbiBUSlw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Feb 2022 13:41:52 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1103062CF;
        Mon, 21 Feb 2022 10:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645468855; x=1677004855;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uQrV/nhZGmqBQaK5yJ+b1uhayz6zJFbAKucjtUG4ATU=;
  b=Ssci7z2FR5RGOqHXuDCSvpUsPn2hKa6QirU8cY3kJmGUZ7rxicJ1v7H7
   BKLcPC1U8sV9XwNe+NpStA8EPDXyfYk8CWPt7vrnIpCzTr1Y3u1qlXe2r
   LtYF/HoRAlbI/HlzlajK2T20eNIkLAS3XS28Aq/0BNBWfzphyWeheSc49
   aEdqlyjO7caf/WHSggnzYTphEhtwRM0omV8Gk9UhHthxzYaqjfkpY30uX
   FmA0Ec5NRmz4caCqN3u+LiPSYEj1LHEbfaree+8oHFdx0LGuA8RZQNpgO
   IlSTEYBFO8pqgtrQIrPmcwMMWKkHDk9kq9wxti+L+pERuXpoje9ptZ0aU
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="251739157"
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; 
   d="scan'208";a="251739157"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2022 10:40:54 -0800
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; 
   d="scan'208";a="490519800"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2022 10:40:53 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nMDbN-006siK-Ra;
        Mon, 21 Feb 2022 20:40:01 +0200
Date:   Mon, 21 Feb 2022 20:40:01 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>,
        syzbot+0591ccf54ee05344e4eb@syzkaller.appspotmail.com
Subject: Re: [PATCH v1 1/1] i2c: robotfuzz-osif: Propagate parent device to
 I2C core
Message-ID: <YhPcgTNmAN0uICJx@smile.fi.intel.com>
References: <20220204151726.8924-1-andriy.shevchenko@linux.intel.com>
 <YhNhxPEt6kZ2xzMJ@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YhNhxPEt6kZ2xzMJ@hovoldconsulting.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Feb 21, 2022 at 10:56:20AM +0100, Johan Hovold wrote:
> On Fri, Feb 04, 2022 at 05:17:26PM +0200, Andy Shevchenko wrote:
> > I2C core might use parent device to retrieve properties of
> > the controller. Propagate parent device for that.
> 
> What is the problem you're trying to solve here?

Okay, let's drop the patch.

-- 
With Best Regards,
Andy Shevchenko



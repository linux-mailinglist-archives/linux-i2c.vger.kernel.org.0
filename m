Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 208764ABE74
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 13:16:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383409AbiBGMJz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 07:09:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1388272AbiBGLnU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 06:43:20 -0500
X-Greylist: delayed 62 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 07 Feb 2022 03:43:18 PST
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC932C043188
        for <linux-i2c@vger.kernel.org>; Mon,  7 Feb 2022 03:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644234198; x=1675770198;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=w6w2ccADFu4cgHqYIRIYRuBh3hLMbxfmsazq1+C6hWg=;
  b=ITKsoeYvDMFzene0G6X80Ht5FpJNgG0+e/9TN00WeFVG9RZJw74KDZZZ
   pfOcqO//T55DGKFn8inL9QnMhsF7oEkK+bbG75Gk8oMO8Jj/r5KiZF9In
   HBeuHOhIsu3FrL7w6iHu7dCqtyICFvVzI1+BCrzxMsSez0H7wqO8JNsEt
   ho7kQyKktSWqsRIkp0dYXjhMk9s4f+cO8wOgF7RLOdcSNcoqEUfvx5b9/
   /x4w6YrPZT+fGk/zgJJmpZAWflMtEW6FWhvdDwVf2QO9X4ceFipRCN3/V
   LwUUeJPSjdO2PiIIuZyhbTDhXglGK9cKoG2jFbPEYBwbzG6sxsolbuYlW
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="246287263"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; 
   d="scan'208";a="246287263"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2022 03:42:15 -0800
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; 
   d="scan'208";a="700436349"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2022 03:42:12 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nH2OO-001ss2-Lg;
        Mon, 07 Feb 2022 13:41:12 +0200
Date:   Mon, 7 Feb 2022 13:41:12 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jan =?utf-8?B?RMSFYnJvxZs=?= <jsd@semihalf.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Wolfram Sang <wsa@kernel.org>,
        Raul E Rangel <rrangel@chromium.org>,
        Marcin Wojtas <mw@semihalf.com>,
        Grzegorz Jaszczyk <jaz@semihalf.com>, upstream@semihalf.com,
        Tom Lendacky <thomas.lendacky@amd.com>,
        "Deucher, Alexander" <alexander.deucher@amd.com>,
        "Easow, Nimesh" <Nimesh.Easow@amd.com>,
        "Limonciello, Mario" <mario.limonciello@amd.com>
Subject: Re: [PATCH v3 2/2] i2c: designware: Add AMD PSP I2C bus support
Message-ID: <YgEFWN8K7Yh452GY@smile.fi.intel.com>
References: <20220120001621.705352-2-jsd@semihalf.com>
 <20220202144302.1438303-1-jsd@semihalf.com>
 <20220202144302.1438303-2-jsd@semihalf.com>
 <YfqtkBIZZxp2Au2l@smile.fi.intel.com>
 <CAOtMz3O_j5-0ZLJngQpzQSGduhZVnQ8awBvGkMdUQWAX8nN5Hw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOtMz3O_j5-0ZLJngQpzQSGduhZVnQ8awBvGkMdUQWAX8nN5Hw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Feb 07, 2022 at 09:27:12AM +0100, Jan Dąbroś wrote:
> śr., 2 lut 2022 o 17:16 Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> napisał(a):
> > On Wed, Feb 02, 2022 at 03:43:02PM +0100, Jan Dabros wrote:

...

> > > +struct psp_i2c_req {
> > > +     struct psp_req_buffer_hdr hdr;
> > > +     enum psp_i2c_req_type type;
> > > +} __aligned(32);
> >
> > I forgot if this alignment is requirement due to DMA or so?
> > We may use ____cacheline_aligned in such case.
> 
> I used some old code as a reference - this structure is mapped by PSP,
> thus alignment applied here. I'm checking this with AMD whether it is
> really needed or at least can be somehow limited - still waiting for
> their response.
> I propose to left this as is right now and eventually remove or make
> more liberal in the future.

Would be nice to clarify sooner than later.
In either case it needs a good comment.

...

> > > +     return readl_poll_timeout(&mbox->cmd_fields, tmp, (tmp == expected),
> > > +                               0, 1000 * PSP_CMD_TIMEOUT_MS);
> >
> > 0?!
> 
> Yes, we are checking for readiness of PSP mailbox in a tight loop. We
> would like to proceed further quickly as soon as this bit is set.
> Actually checking this twice per every ACQUIRE&RELEASE - once before
> sending command (to check whether PSP is ready to accept requests) and
> second time after sending it. Do you think we should increase
> @sleep_us value?

It depends on what you have in mind about hardware. I'm fine with either way,
but 0 has to be explained (in the comment).

-- 
With Best Regards,
Andy Shevchenko



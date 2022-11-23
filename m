Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF251636042
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Nov 2022 14:46:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238263AbiKWNql (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Nov 2022 08:46:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238294AbiKWNqX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Nov 2022 08:46:23 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF348E1BE2;
        Wed, 23 Nov 2022 05:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669210511; x=1700746511;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0dPBcIou1yq73/ShQ5ge15FFqP86cP4E6nEb250ZlWo=;
  b=K0VulbJse9A41zXVuIsWR7lzJIvxf452Y/g1P8EMxHuL+btsI7aM3y8g
   4hu3WE7R0y8r6UT25oFPCjvB8Y3zJAqwRZUo6e+5sh+cqimY+9hcOIZjP
   1uhFex2g8IM2Xd+GSSilm0JvUEZvUfrmb4ShSHiXxf/ezdABFKlSfDeWu
   4feQg7/L4xhIc/4kQ/CvX0/Bxkvrbw7OpG3XDvx4wHthR67aWmoqhQQ1M
   sbduSworxN5Hh0AqGJaM9uKQnyscUmjTAOXZbk2Eml70UjkuKpOieGHca
   KhTnzFGJYby8bacvFtpsPfbbP53L9uL4Dwr/nA0axACal1PiyaEnwf2Wo
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="312766025"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; 
   d="scan'208";a="312766025"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2022 05:35:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="970863671"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; 
   d="scan'208";a="970863671"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 23 Nov 2022 05:35:00 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oxptw-00GImp-12;
        Wed, 23 Nov 2022 15:34:56 +0200
Date:   Wed, 23 Nov 2022 15:34:56 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Stefan Richter <stefanr@s5r6.in-berlin.de>,
        Wolfram Sang <wsa@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Chaitanya Kulkarni <kch@nvidia.com>,
        Ming Lei <ming.lei@redhat.com>,
        Jilin Yuan <yuanjilin@cdjrlc.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ira Weiny <ira.weiny@intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Won Chung <wonchung@google.com>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-block@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-i3c@lists.infradead.org, linux-input@vger.kernel.org,
        linux-media@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-usb@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 3/5] driver core: make struct device_type.uevent() take a
 const *
Message-ID: <Y34hgIW8p1RlQTBB@smile.fi.intel.com>
References: <20221123122523.1332370-1-gregkh@linuxfoundation.org>
 <20221123122523.1332370-3-gregkh@linuxfoundation.org>
 <711d5275-7e80-c00d-0cdc-0f3d52175361@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <711d5275-7e80-c00d-0cdc-0f3d52175361@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Nov 23, 2022 at 02:14:31PM +0100, Maximilian Luz wrote:
> On 11/23/22 13:25, Greg Kroah-Hartman wrote:
> > The uevent() callback in struct device_type should not be modifying the
> > device that is passed into it, so mark it as a const * and propagate the
> > function signature changes out into all relevant subsystems that use
> > this callback.

[...]

> > -static inline struct ssam_device *to_ssam_device(struct device *d)
> > +static inline struct ssam_device *to_ssam_device(const struct device *d)
> >   {
> >   	return container_of(d, struct ssam_device, dev);
> >   }
> 
> I am slightly conflicted about this change as that now more or less
> implicitly drops the const. So I'm wondering if it wouldn't be better to
> either create a function specifically for const pointers or to just
> open-code it in the instance above.
> 
> I guess we could also convert this to a macro. Then at least there
> wouldn't be an explicit and potentially misleading const-conversion
> indicated in the function signature.

This is an intermediate step as far as I know since moving container_of to
recognize const is a bit noisy right now. I guess you can find a discussion
on the topic between Greg and Sakari.

-- 
With Best Regards,
Andy Shevchenko



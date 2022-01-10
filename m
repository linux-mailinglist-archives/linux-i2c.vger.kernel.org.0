Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E664748A2D0
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jan 2022 23:32:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241750AbiAJWcA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jan 2022 17:32:00 -0500
Received: from mga06.intel.com ([134.134.136.31]:34627 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238635AbiAJWcA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 10 Jan 2022 17:32:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641853920; x=1673389920;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6euwceMmdMz5mhSCD5eQOfqFem+JFeSm6tECMTbt/aM=;
  b=ay6Gbbiav6hrJbTRyTcDpW7GL2xqsX4WFJ7yxw3b0NLAYc4DuV7gamGx
   TitNyqWW5cPUJLoboLWKNR6vbt9mYt+j0jDVIYiQy2d8M1cZ0Vio4/BRL
   oddGyNDv2MR8jQGdg4ubUOsiNA9Hkdypbf6bDJF3gcMzp3FwiH0ZHAV7+
   APJvL4nSOXQOVKYVAaQHdmMHUVH8D+v9/MFNZ7G5BvJOCqBP5ZH9XaDHb
   YqBHvPcWAwqMunALo8fiiKmGX6JhSNxirvMsI39/b79MgqHb4EiSFd8hW
   862FBzukXFO+jQryVU/Q/AEhBAlrcypo2Fg2vG8mNyR/1vEU10vCUagtI
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="304084379"
X-IronPort-AV: E=Sophos;i="5.88,278,1635231600"; 
   d="scan'208";a="304084379"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2022 14:31:58 -0800
X-IronPort-AV: E=Sophos;i="5.88,278,1635231600"; 
   d="scan'208";a="558142856"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2022 14:31:54 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 9C75D2043C;
        Tue, 11 Jan 2022 00:31:52 +0200 (EET)
Date:   Tue, 11 Jan 2022 00:31:52 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Rajat Jain <rajatja@google.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Robert Moore <robert.moore@intel.com>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
        devel@acpica.org, rajatxjain@gmail.com
Subject: Re: ACPI: scan: Obtain device's desired enumeration power state
Message-ID: <Ydyz2HSbLLbVc9ql@paasikivi.fi.intel.com>
References: <20210210230800.30291-2-sakari.ailus@linux.intel.com>
 <20211007022527.2448652-1-rajatja@google.com>
 <YW3XwDxwBsJdFslA@paasikivi.fi.intel.com>
 <CACK8Z6FcBusdMMsu2vKZT8vx6yvcWS7Gh7bDyYqdB1ikspEHDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACK8Z6FcBusdMMsu2vKZT8vx6yvcWS7Gh7bDyYqdB1ikspEHDA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Rajat,

On Mon, Jan 10, 2022 at 10:55:58AM -0800, Rajat Jain wrote:
> > > https://lore.kernel.org/linux-acpi/CAJZ5v0gwDEjC9T7wfCqDr7R0q_ptz2nVU52_8i8noXHPEign1g@mail.gmail.com/T/
> > >
> > > I was wondering what is happening with the corresponding kernel patchset:
> > > https://lore.kernel.org/linux-acpi/20210210230800.30291-1-sakari.ailus@linux.intel.com/T/#m24e9f51119cbe6eb39f31c097ea3941d00a0baeb
> > >
> > > I didn't see any pending comments, so is there a reason it did not land?
> >
> > Thanks for the ping.
> >
> > I've rebased the set and switched to _DSC so I believe it is ready to be
> > merged now:
> >
> >         <URL:https://lore.kernel.org/linux-media/20211018121729.6357-1-sakari.ailus@linux.intel.com/T/#t>
> >
> > I dropped the ov5670 patch from the set to avoid a conflict, I'll get this
> > merged through the media tree when the rest have landed there.
> 
> 
> Thanks, I see that your patches series has been merged. Can you please
> also line up this follow up series by Bingbu for inclusion into the
> mainline kernel?
> 
> https://patchwork.kernel.org/project/linux-media/list/?series=595925

These patches are in media tree master:

<URL:https://git.linuxtv.org/media_tree.git/log/>

I'd expect to see these in Linux 5.17.

-- 
Kind regards,

Sakari Ailus

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79B23263024
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 17:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729940AbgIIPEC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Sep 2020 11:04:02 -0400
Received: from mga06.intel.com ([134.134.136.31]:2359 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726399AbgIIMSo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 9 Sep 2020 08:18:44 -0400
IronPort-SDR: Uo3eCdVbOKruVKp2lql8FH0+TBQqekgxkSi24YXUWnTEZLGtZbfSWTbBKmlyU+K447Fqc/snu5
 sBA8ZZK6BrLg==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="219874839"
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="219874839"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2020 05:16:42 -0700
IronPort-SDR: 700qIIIuvykqXE2gqCdKoiRkvZqgnZfWaFbrA1VXnX36kZp141OQRBjFeTaSAw3mJgI6JTqBQd
 qwfNlpoo2qpg==
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="480442307"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2020 05:16:39 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id AAA5C20765; Wed,  9 Sep 2020 15:16:07 +0300 (EEST)
Date:   Wed, 9 Sep 2020 15:16:07 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v8 6/6] at24: Support probing while off
Message-ID: <20200909121607.GD6566@paasikivi.fi.intel.com>
References: <20200903081550.6012-1-sakari.ailus@linux.intel.com>
 <20200903081550.6012-7-sakari.ailus@linux.intel.com>
 <CAMpxmJX40=iYYxL9Uvs1Pjj9c3NvZBGJ9Mh9-87T0c==FKEXRw@mail.gmail.com>
 <20200909111121.GJ2272@ninjato>
 <CAMpxmJXDrL92QH_Vb+P4LoQ-WGBMM42GvzXjquW2Lzotm5wggA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJXDrL92QH_Vb+P4LoQ-WGBMM42GvzXjquW2Lzotm5wggA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 09, 2020 at 01:56:34PM +0200, Bartosz Golaszewski wrote:
> On Wed, Sep 9, 2020 at 1:11 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> >
> >
> > > This currently conflicts with the fix I queued for at24 for v5.9.
> > > Which tree is going to take this series?
> >
> > I recall we agreed on I2C.
> >
> 
> Sakari,
> 
> can you rebase the at24 driver patch on top of Wolfram's tree as soon
> as he merges my PR with at24 fixes?

Sure! This would be of course better than postponing this patch.

-- 
Regards,

Sakari Ailus

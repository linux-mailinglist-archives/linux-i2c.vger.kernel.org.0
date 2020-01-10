Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69BB7136BF2
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Jan 2020 12:29:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727685AbgAJL3G (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Jan 2020 06:29:06 -0500
Received: from mga18.intel.com ([134.134.136.126]:51015 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727457AbgAJL3G (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 10 Jan 2020 06:29:06 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Jan 2020 03:28:55 -0800
X-IronPort-AV: E=Sophos;i="5.69,416,1571727600"; 
   d="scan'208";a="371585812"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Jan 2020 03:28:53 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 8398320F35; Fri, 10 Jan 2020 13:28:51 +0200 (EET)
Date:   Fri, 10 Jan 2020 13:28:51 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v3 5/5] at24: Support probing while off
Message-ID: <20200110112851.GC5440@paasikivi.fi.intel.com>
References: <20200109154529.19484-1-sakari.ailus@linux.intel.com>
 <20200109154529.19484-6-sakari.ailus@linux.intel.com>
 <CAMRc=MfqRqtW=nMuKFcpLrBHYg7wwPboUEvYpj2sBXM8yWEM_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfqRqtW=nMuKFcpLrBHYg7wwPboUEvYpj2sBXM8yWEM_w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Bartosz,

On Fri, Jan 10, 2020 at 12:16:14PM +0100, Bartosz Golaszewski wrote:
> czw., 9 sty 2020 o 16:44 Sakari Ailus <sakari.ailus@linux.intel.com> napisał(a):
> >
> > In certain use cases (where the chip is part of a camera module, and the
> > camera module is wired together with a camera privacy LED), powering on
> > the device during probe is undesirable. Add support for the at24 to
> > execute probe while being powered off. For this to happen, a hint in form
> > of a device property is required from the firmware.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Why am I not Cc'ed on this patch?

I'll make sure you'll be cc'd on any future versions of the patch.

-- 
Kind regards,

Sakari Ailus

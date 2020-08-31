Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33052257F37
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Aug 2020 19:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728644AbgHaRFd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Aug 2020 13:05:33 -0400
Received: from mga09.intel.com ([134.134.136.24]:46756 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727929AbgHaRFd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 31 Aug 2020 13:05:33 -0400
IronPort-SDR: CL7c+Xpi0qrFPH+8/0w+0aJ2womaQG2SLPo+2a/+CIFGDhInaWSGaPk63JswfuPBkyfthxJ6Bb
 2i4HpU5NLUOQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="158029315"
X-IronPort-AV: E=Sophos;i="5.76,376,1592895600"; 
   d="scan'208";a="158029315"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2020 10:05:31 -0700
IronPort-SDR: g1lBwoztU18Wr7S0DWGuq3tbcYExMT/QZn8OFKF923kdQq46pJ+q4zZ3eY/Cb+ZbwI/PrYW3dW
 T0gE+K7HjxiA==
X-IronPort-AV: E=Sophos;i="5.76,376,1592895600"; 
   d="scan'208";a="476807046"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2020 10:05:27 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id C12D020623; Mon, 31 Aug 2020 20:05:24 +0300 (EEST)
Date:   Mon, 31 Aug 2020 20:05:24 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com, Tomasz Figa <tfiga@chromium.org>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Subject: Re: [PATCH v6 1/6] i2c: Allow an ACPI driver to manage the device's
 power state during probe
Message-ID: <20200831170524.GM31019@paasikivi.fi.intel.com>
References: <20200826115432.6103-1-sakari.ailus@linux.intel.com>
 <20200826115432.6103-2-sakari.ailus@linux.intel.com>
 <20200831100022.GB1070@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200831100022.GB1070@ninjato>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Aug 31, 2020 at 12:00:23PM +0200, Wolfram Sang wrote:
> 
> > +	unsigned int flags;
> 
> u32?
> 

Yes.

-- 
Sakari Ailus

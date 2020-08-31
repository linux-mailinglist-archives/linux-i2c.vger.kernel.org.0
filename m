Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 503562576EF
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Aug 2020 11:54:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726459AbgHaJyZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Aug 2020 05:54:25 -0400
Received: from mga18.intel.com ([134.134.136.126]:8673 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726100AbgHaJyX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 31 Aug 2020 05:54:23 -0400
IronPort-SDR: YlDNsN4uMJlydttRXC4rH0cd0bCi3szeHTQgUt9xBwMigpYvDrIgiQshQPgfnYVHxTm7DZ9aoH
 U23Kor91b3lw==
X-IronPort-AV: E=McAfee;i="6000,8403,9729"; a="144618033"
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; 
   d="scan'208";a="144618033"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2020 02:54:21 -0700
IronPort-SDR: d5gLELt2lTQRUIXEBSdc6fdcZ5b13vzz31me6iNf44HTYjNYlHivhJ5Z9cNkWZ8I1LumS8y7q8
 I+qRufJk6oXA==
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; 
   d="scan'208";a="314297172"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2020 02:54:18 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id DFC1B204F9; Mon, 31 Aug 2020 12:54:15 +0300 (EEST)
Date:   Mon, 31 Aug 2020 12:54:15 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
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
Message-ID: <20200831095415.GG31019@paasikivi.fi.intel.com>
References: <20200826115432.6103-1-sakari.ailus@linux.intel.com>
 <20200826115432.6103-2-sakari.ailus@linux.intel.com>
 <20200828083832.GE1343@ninjato>
 <20200831082305.GD31019@paasikivi.fi.intel.com>
 <20200831093109.GA4632@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200831093109.GA4632@kunai>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Aug 31, 2020 at 11:31:09AM +0200, Wolfram Sang wrote:
> 
> > This patchset is really about changing the default of ACPI powering up I²C
> > devices. On OF the drivers are indeed responsible for that.
> 
> So, maybe it makes sense then to move from 'device_property_present()'
> to 'acpi_dev_get_property()' or something alike? To clearly tell this

I'll do that for v7 soon.

> binding is expected to be used with ACPI only. Then, we can skip this
> discussion now and postpone it to when someone wants to use it with DT.
> Which is hopefully never. Or does this approach have drawbacks?

The same issue in principle could be there on DT, too, as the cameras are
the same. There are a few sensor drivers supporting DT that currently don't
access the device in probe to avoid having to power it on. For cameras I
suppose that's just fine but I'd be hesitant changing the behaviour of e.g.
the at24 driver to support that use case without making it somehow
configurable.

> 
> > My original series had a field in struct device_driver for this purpose but
> > Greg K-H suggested moving it to I²C instead:
> > 
> > <URL:https://lore.kernel.org/linux-acpi/20190826084343.GA1095@kroah.com/>
> 
> Ok, we can still factor it out in the unlikely case it needs to be done
> again.
> 
> I still have the question via which tree this should go upstream?
> It is probably more I2C than ACPI?

I think so.

Rafael, would you be fine with this set being merged through the I²C tree?
There's a single patch adding an ACPI function there.

-- 
Sakari Ailus

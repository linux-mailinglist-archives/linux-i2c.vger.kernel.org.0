Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 762082FA994
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 20:05:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407943AbhARTEC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 14:04:02 -0500
Received: from smtprelay0179.hostedemail.com ([216.40.44.179]:38868 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2393817AbhARTBn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jan 2021 14:01:43 -0500
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay08.hostedemail.com (Postfix) with ESMTP id AA91D182CED5B;
        Mon, 18 Jan 2021 19:01:00 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:988:989:1260:1261:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1538:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3868:3872:3873:4321:5007:6742:6743:7652:7903:10004:10400:10848:11232:11658:11914:12297:12740:12895:13069:13311:13357:13439:13894:14659:14777:21080:21627:30029:30041:30054:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: shame59_0308f192754b
X-Filterd-Recvd-Size: 2090
Received: from [192.168.1.159] (unknown [47.151.137.21])
        (Authenticated sender: joe@perches.com)
        by omf09.hostedemail.com (Postfix) with ESMTPA;
        Mon, 18 Jan 2021 19:00:56 +0000 (UTC)
Message-ID: <82a5635e608a1c176bc1d0954d42b4d3ae0f8d7a.camel@perches.com>
Subject: Re: [PATCH v2 4/7] i2c: i2c-core-acpi: Add i2c_acpi_dev_name()
From:   Joe Perches <joe@perches.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Daniel Scally <djrscally@gmail.com>, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        devel@acpica.org, rjw@rjwysocki.net, lenb@kernel.org,
        andy@kernel.org, mika.westerberg@linux.intel.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@kernel.org, lee.jones@linaro.org, hdegoede@redhat.com,
        mgross@linux.intel.com, robert.moore@intel.com,
        erik.kaneda@intel.com, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Date:   Mon, 18 Jan 2021 11:00:55 -0800
In-Reply-To: <20210118185644.GH4077@smile.fi.intel.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
         <20210118003428.568892-5-djrscally@gmail.com>
         <20210118133942.GI4077@smile.fi.intel.com>
         <d4671ea998010c9400ed7fd6cdf0d8ecf9a79af4.camel@perches.com>
         <20210118185644.GH4077@smile.fi.intel.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 2021-01-18 at 20:56 +0200, Andy Shevchenko wrote:
> On Mon, Jan 18, 2021 at 10:43:14AM -0800, Joe Perches wrote:
> > On Mon, 2021-01-18 at 15:39 +0200, Andy Shevchenko wrote:
> > > On Mon, Jan 18, 2021 at 12:34:25AM +0000, Daniel Scally wrote:
> > > > We want to refer to an i2c device by name before it has been
> > > 
> > > I²C
> > 
> > Andy, are you next going to suggest renaming all the files with i2c?
> 
> Where did you get this from?

By extension from the request to use I²C.
And it's a leading question not a statement of fact.



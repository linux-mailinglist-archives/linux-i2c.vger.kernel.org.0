Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E24F52FA95C
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 19:55:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436906AbhARSyQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 13:54:16 -0500
Received: from smtprelay0097.hostedemail.com ([216.40.44.97]:36896 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2407839AbhARSyM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jan 2021 13:54:12 -0500
X-Greylist: delayed 604 seconds by postgrey-1.27 at vger.kernel.org; Mon, 18 Jan 2021 13:54:10 EST
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave03.hostedemail.com (Postfix) with ESMTP id D4F8A181CAC78;
        Mon, 18 Jan 2021 18:44:11 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id 746F61801AC86;
        Mon, 18 Jan 2021 18:43:19 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:982:988:989:1260:1261:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1540:1593:1594:1711:1730:1747:1777:1792:2198:2199:2393:2553:2559:2562:2736:2828:3138:3139:3140:3141:3142:3352:3622:3865:3867:3868:3870:3871:3872:3873:3874:4250:4321:5007:6742:6743:7652:7903:8784:10004:10400:10946:11232:11658:11914:12294:12297:12740:12895:13069:13160:13229:13311:13357:13439:13894:14659:14777:21080:21627:21990:30029:30054:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: team75_1e0c60f2754b
X-Filterd-Recvd-Size: 2364
Received: from [192.168.1.159] (unknown [47.151.137.21])
        (Authenticated sender: joe@perches.com)
        by omf03.hostedemail.com (Postfix) with ESMTPA;
        Mon, 18 Jan 2021 18:43:16 +0000 (UTC)
Message-ID: <d4671ea998010c9400ed7fd6cdf0d8ecf9a79af4.camel@perches.com>
Subject: Re: [PATCH v2 4/7] i2c: i2c-core-acpi: Add i2c_acpi_dev_name()
From:   Joe Perches <joe@perches.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org,
        rjw@rjwysocki.net, lenb@kernel.org, andy@kernel.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, lee.jones@linaro.org,
        hdegoede@redhat.com, mgross@linux.intel.com,
        robert.moore@intel.com, erik.kaneda@intel.com,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Date:   Mon, 18 Jan 2021 10:43:14 -0800
In-Reply-To: <20210118133942.GI4077@smile.fi.intel.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
         <20210118003428.568892-5-djrscally@gmail.com>
         <20210118133942.GI4077@smile.fi.intel.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 2021-01-18 at 15:39 +0200, Andy Shevchenko wrote:
> On Mon, Jan 18, 2021 at 12:34:25AM +0000, Daniel Scally wrote:
> > We want to refer to an i2c device by name before it has been
> 
> I²C

Andy, are you next going to suggest renaming all the files with i2c?

$ git ls-files | grep i2c | wc -l
953

Please do not use the pedantic I²C, 7 bit ascii is just fine here.

My keyboard does not have a superscripted 2 key, and yes, I know
how to use it with multiple keypresses but it's irrelevant.

> > created by the kernel; add a function that constructs the name
> > from the acpi device instead.
> 
> acpi -> ACPI

Same deal with acpi filenames.  Everyone already recognizes acpi is
actually ACPI and there isn't any confusion in anyone's mind.

$ git ls-files | grep acpi | wc -l
533

> Prefix: "i2c: core: "

Please stop being a pedant on these trivial things.
It's unimportant and has almost no value.



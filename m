Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61B2E2FAB03
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 21:10:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388570AbhARUIk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 15:08:40 -0500
Received: from smtprelay0021.hostedemail.com ([216.40.44.21]:49188 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387977AbhARUIe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jan 2021 15:08:34 -0500
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id 715CD180A7FDE;
        Mon, 18 Jan 2021 20:07:27 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:968:973:988:989:1260:1261:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1542:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2828:2895:3138:3139:3140:3141:3142:3353:3622:3653:3865:3866:3867:3868:3870:3872:4250:4321:5007:6117:6119:6120:6238:6742:6743:7652:7809:7901:7903:10004:10400:10848:11026:11232:11473:11658:11914:12043:12296:12297:12438:12555:12740:12760:12895:12986:13018:13019:13439:14096:14097:14181:14659:14721:21080:21220:21451:21627:21889:21939:30054:30070:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: box36_1c182e92754c
X-Filterd-Recvd-Size: 3497
Received: from [192.168.1.159] (unknown [47.151.137.21])
        (Authenticated sender: joe@perches.com)
        by omf04.hostedemail.com (Postfix) with ESMTPA;
        Mon, 18 Jan 2021 20:07:23 +0000 (UTC)
Message-ID: <dcc9fbef12ec58dfd3a2a98d9d3986fc5fa15f73.camel@perches.com>
Subject: Re: [PATCH v2 7/7] mfd: Remove tps68470 MFD driver
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
Date:   Mon, 18 Jan 2021 12:07:22 -0800
In-Reply-To: <20210118135310.GN4077@smile.fi.intel.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
         <20210118003428.568892-8-djrscally@gmail.com>
         <20210118135310.GN4077@smile.fi.intel.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 2021-01-18 at 15:53 +0200, Andy Shevchenko wrote:
> On Mon, Jan 18, 2021 at 12:34:28AM +0000, Daniel Scally wrote:
> > This driver only covered one scenario in which ACPI devices with _HID
> > INT3472 are found, and its functionality has been taken over by the
> > intel-skl-int3472 module, so remove it.
> 
> Prefix: "mfd: tps68470: ". Rationale: easier to look for specific commits, by,
> for example, running `git log --grep tps68470`.

It's also reasonable to grep by path instead

$ git log --pretty=oneline --grep 'tps68470'
cf2e8c544cd3b33e9e403b7b72404c221bf888d1 Merge tag 'mfd-next-5.1' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd
66265e719b4603ef9a1b8a6c876bcb542c021496 mfd: tps68470: Drop unused MODULE_DEVICE_TABLE
883cad5ba8cc2d9b740b4ad0a8a91063c99c75a3 Merge tag 'mfd-next-4.18' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd
ca34b4f0bed802e1c8612ef08456b20992aeb02a gpio: tps68470: Update to SPDX license identifier

vs

$ git log --pretty=oneline -- '*tps68470*'
e42615ec233b30dfaf117b108d4cb49455b4df1d gpio: Use new GPIO_LINE_DIRECTION
66265e719b4603ef9a1b8a6c876bcb542c021496 mfd: tps68470: Drop unused MODULE_DEVICE_TABLE
36b835176fe014197639f335d9d35424b7805027 ACPI / PMIC: Sort headers alphabetically
37c089d1facaf03969f66a5469c169a2c73429f6 mfd: Update to SPDX license identifier
1b2951dd99af3970c1c1a8385a12b90236b837de Merge tag 'gpio-v4.17-1' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio
ca34b4f0bed802e1c8612ef08456b20992aeb02a gpio: tps68470: Update to SPDX license identifier
66444f460e68d641a63f0787627bac6c1ee340b5 ACPI / PMIC: Replace license boilerplate with SPDX license identifier
e13452ac379070f038c264618e35559434252175 ACPI / PMIC: Add TI PMIC TPS68470 operation region driver
968c61f7da3cf6d58a49587cfe00d899ca72c1ad Merge tag 'mfd-next-4.14' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd
9bbf6a15ce19dd947b7fa6ad4095931ab3682da8 mfd: Add support for TPS68470 device
275b13a65547e2dc39c75d660d2e0f0fddde90f6 gpio: Add support for TPS68470 GPIOs





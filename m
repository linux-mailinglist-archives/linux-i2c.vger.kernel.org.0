Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D8471AD06D
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Apr 2020 21:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728944AbgDPTg1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Apr 2020 15:36:27 -0400
Received: from smtprelay0152.hostedemail.com ([216.40.44.152]:39730 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725894AbgDPTg1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Apr 2020 15:36:27 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay01.hostedemail.com (Postfix) with ESMTP id 18888100E7B47;
        Thu, 16 Apr 2020 19:36:26 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:968:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1538:1568:1593:1594:1711:1714:1730:1747:1777:1792:2393:2559:2562:2691:2693:2828:3138:3139:3140:3141:3142:3622:3865:3867:3870:3871:3872:3873:4321:5007:6691:6742:7903:9545:10004:10400:10848:11026:11232:11658:11914:12297:12740:12760:12895:13069:13095:13161:13229:13311:13357:13439:14659:14721:21080:21433:21451:21627:30054:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:2,LUA_SUMMARY:none
X-HE-Tag: dress88_71e6f49a6bc61
X-Filterd-Recvd-Size: 2200
Received: from XPS-9350.home (unknown [47.151.136.130])
        (Authenticated sender: joe@perches.com)
        by omf12.hostedemail.com (Postfix) with ESMTPA;
        Thu, 16 Apr 2020 19:36:22 +0000 (UTC)
Message-ID: <7713a931e4475294de85b74aca298dde8be4242d.camel@perches.com>
Subject: Re: [PATCH v2] i2c: busses: remove duplicate dev_err()
From:   Joe Perches <joe@perches.com>
To:     Markus Elfring <Markus.Elfring@web.de>,
        Dejin Zheng <zhengdejin5@gmail.com>, linux-i2c@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Thor Thayer <thor.thayer@linux.intel.com>,
        Tang Bin <tangbin@cmss.chinamobile.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Patrick Williams <alpawi@amazon.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Barry Song <baohua@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        George Cherian <gcherian@marvell.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>
Date:   Thu, 16 Apr 2020 12:34:10 -0700
In-Reply-To: <6ca3cd57-de73-5327-5773-e08bf12c4a85@web.de>
References: <20200416152345.23077-1-zhengdejin5@gmail.com>
         <6ca3cd57-de73-5327-5773-e08bf12c4a85@web.de>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 2020-04-16 at 20:22 +0200, Markus Elfring wrote:
> > it will print an error message by itself when platform_get_irq()
> > goes wrong. so don't need dev_err() in here again.
> 
> I suggest to improve the commit message considerably.

I suggest you ignore Markus' suggestion.

The commit message is OK.

The subject _could_ have included "platform_get_irq" something like

Subject: [PATCH v2] i2c: busses: Remove platform_get_irq()'s duplicated dev_err()

but I believe it's not important enough to redo.



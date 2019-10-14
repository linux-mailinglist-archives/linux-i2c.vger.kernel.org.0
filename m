Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37E97D660D
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2019 17:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387484AbfJNPWz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Oct 2019 11:22:55 -0400
Received: from stcim.de ([78.46.90.227]:60512 "EHLO stcim.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733176AbfJNPWz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 14 Oct 2019 11:22:55 -0400
X-Greylist: delayed 1176 seconds by postgrey-1.27 at vger.kernel.org; Mon, 14 Oct 2019 11:22:53 EDT
Received: from xdsl-87-78-90-111.nc.de ([87.78.90.111] helo=porty)
        by stcim with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <contact@stefanchrist.eu>)
        id 1iK1sR-0006CN-7B; Mon, 14 Oct 2019 17:03:15 +0200
Date:   Mon, 14 Oct 2019 17:03:14 +0200
From:   Stefan Lengfeld <contact@stefanchrist.eu>
To:     Stefan Agner <stefan@agner.ch>
Cc:     linux-i2c@vger.kernel.org, wsa+renesas@sang-engineering.com,
        linux-i2c-owner@vger.kernel.org,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: Re: [RFC PATCH 0/3] Re: i2c: core: introduce atomic transfers
Message-ID: <20191014150314.ndvuvbvssh3yynpm@porty>
References: <20190403124019.8947-1-wsa+renesas@sang-engineering.com>
 <20190415213432.8972-1-contact@stefanchrist.eu>
 <d9005c72243eff38b6c4223f0199e02b@agner.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d9005c72243eff38b6c4223f0199e02b@agner.ch>
X-PGP-Key: https://stefanchrist.eu/personal/Stefan_Lengfeld_0xE44A23B289092311.asc
User-Agent: NeoMutt/20180716
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Stefan,

On Sat, Oct 12, 2019 at 11:12:59PM +0200, Stefan Agner wrote:
> Hi Stefan,
> 
> On 2019-04-15 23:34, Stefan Lengfeld wrote:
> > Hi Wolfram,
> > 
> > the following RFC patches are based on your branch
> > 
> >> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/i2c/atomic_xfer
> > 
> > I have used them to test your changes and my usecase on my available
> > hardware setup: an i.MX6 Solo (phyCORE-i.MX6).
> > 
> > In general: Great stuff! And I vote for inclusion :-)
> > 
> > Even so this series does not tackle all problems at once, it's a step
> > into the right direction to support reboot handlers using an external
> > PMIC via I2C.
> 
> We have the same problem on our Colibri iMX7 board. Wolfram's patches
> made it already upstream, I applied your patches successfully on 5.4-rc1
> and rebooting via I2C seems to work fine now! Hence we would like to see
> master_xfer_atomic support for the i.MX I2C driver too.
> 
> Are you continuing working on this patch set?

Currently, no.

I'm doing the kernel work voluntary in my spare time and right now there
is not much free time left. I did not submit my master_xfer_atomic patch
for the i.MX driver, because I feared breaking the DMA path or other
non-i.MX6 platforms for that driver.

So if you like to invest some time to polish the patch or rewrite it
completely, feel free to do it. If you submit a patch for review, I
would definitely find some time to test it on my i.MX6 boards and give
my Tested-by.

I'm also cc'ing Stefan Riedmueller, because he is currently maintaining
the i.MX6 boards at Phytec and is maybe also interested in upstreaming
the code.

Kind Regards,
    Stefan

P.S.: Yes, now there are three different 'Stefans' on this thread :-)

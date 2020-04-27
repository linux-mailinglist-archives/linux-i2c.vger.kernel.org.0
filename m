Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31A3B1BA74D
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 17:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727006AbgD0PIE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 11:08:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726539AbgD0PID (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Apr 2020 11:08:03 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A80AC0610D5
        for <linux-i2c@vger.kernel.org>; Mon, 27 Apr 2020 08:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=7YRZPdFvsKk/tn18IOw7GMRhQgBpEIgHtXBKKqy/oao=; b=CrDuugp/3bAf86tEigH+/YHPN
        i2v08oWhVr6QqpklqS/GWz9aIhBjQs/2OnP7iT3wxh1ECBmHrsU/WO+sSxn8fTgXgDC7jXP8BCRJr
        zrDjODte1Zem+6A+I0ozIO77oTiWCd95Y5g6UU1q8bpU0yVzmPp6IsBvrXaS269YO7rVI8Sa1SLHk
        7gCHCfeq466HYYPCL6H2rFs7y/Myto+cgMksen35YKxMeuXrb7SBJGSrmFjs3IMCc7X9cR7ZXmqhr
        FItH+tKAmm+vaC3+IO/qgk5P5Mm8Zz8Oxo54ccxYSubjS+YJCunM1wWd/dv5n56T3hg6rmG1MCw4T
        c901kbkCg==;
Received: from shell.armlinux.org.uk ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:44666)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jT5MV-0003X2-A8
        for linux-i2c@vger.kernel.org; Mon, 27 Apr 2020 16:07:59 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jT5MU-0006kY-ND; Mon, 27 Apr 2020 16:07:58 +0100
Date:   Mon, 27 Apr 2020 16:07:58 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Subject: [PATCH REPOST 00/12] i2c-pxa cleanups
Message-ID: <20200427150755.GT5827@shell.armlinux.org.uk>
References: <20191215160444.GB25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191215160444.GB25745@shell.armlinux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

This series cleans up the i2c-pxa code via the following changes:

1. replace i2c_pxa_addr_byte() with the functional equivalent
   i2c_8bit_addr_from_msg().

2. removing unnecessary headers, and rearranging those that remain
   in alphabetical order.

3. rearranging functions in the file to flow better; particularly
   placing the PIO specific functions next to the PIO algorithm
   structure, so all the PIO mode related code is together.  This
   eliminates the forward declaration of i2c_pxa_handler().

4. group the register bitfield definitions, which were split over two
   separate locations in the file, into a single location, and add
   some definitions for the IBMR register.

5. always set the 'fm' and 'hs' members for each hardware type; the
   storage for these members is always allocated, we don't need to
   bloat the code (neither runtime, nor in the source) for this.

6. move definitions private to i2c-pxa out of the platform data
   header; platforms have no business knowing these details.

7. group all driver-based IDs match (platform and OF) to one common
   location rather than at either end of the file.

8. fix i2c_pxa_scream_blue_murder()'s log output to be printed on a
   single line as it was intended, rather than being printed one
   entry per line - which makes it difficult to read particularly
   when it has been enabled and you're getting lots of them.  Also
   fix decode_bits() output in the same way.

9. fix i2c_pxa_wait_bus_not_busy() boundary condition, so that a
   coincidental success and timeout results in the function being
   successful rather than failing. (This has never been seen in
   practice, but was spotted while reviewing the code.)

All in all, these changes should have (and have had so far) no
observable impact on the driver; therefore, I do not see any reason
to backport any of these changes to stable trees.

This series has been rebased on the linux-i2c for-next branch.

 drivers/i2c/busses/i2c-pxa.c          | 591 ++++++++++++++++++----------------
 include/linux/platform_data/i2c-pxa.h |  48 ---
 2 files changed, 315 insertions(+), 324 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 10.2Mbps down 587kbps up

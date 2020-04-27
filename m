Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84C861BAD15
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 20:47:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbgD0SrD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 14:47:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726249AbgD0SrD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Apr 2020 14:47:03 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6ABDC0610D5
        for <linux-i2c@vger.kernel.org>; Mon, 27 Apr 2020 11:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
        Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=kLVfCMptv7yfrPST7kuXIvLQNdNKPhQK4vfJ4RON5Rw=; b=OQ6vPBPAVtXn0kkI3FjxfvAR7
        byGiBw1fG1iYdctckIQqeDLGgiUxlME5UZ5N+JwvDI+009MYXwczOj6aWBo1Muba+ie7lfSrhrpNA
        fFzvf2tfcaiVg+FBe127W3DkhshJWKx+ODiPi2L/KFBbg/bCkSZiZ8Sb87KPlpjKcks4KcoXrNt+s
        fw7DMioOFKNvzCPGesDY1pEKXEdRt3MLj/5zCzCRrOV5OdrJxp0dQkKWhs8QQx8s8rno0XKDF/GG6
        aWT41aPbbbFwnBv6Ry0ZeRtj7fbThXQX+e617ipu93rJJTHnHRDafWyvjpLxx9bHhIhmhMZ3EDzON
        VFJ6LvvwA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56392)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jT8mQ-0004RU-Sg
        for linux-i2c@vger.kernel.org; Mon, 27 Apr 2020 19:46:59 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jT8mQ-0006ti-Bg; Mon, 27 Apr 2020 19:46:58 +0100
Date:   Mon, 27 Apr 2020 19:46:58 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Subject: [PATCH v2 00/12] i2c-pxa cleanups
Message-ID: <20200427184658.GM25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

v2: fix build warning in patch 1

 drivers/i2c/busses/i2c-pxa.c          | 590 ++++++++++++++++++----------------
 include/linux/platform_data/i2c-pxa.h |  48 ---
 2 files changed, 314 insertions(+), 324 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 10.2Mbps down 587kbps up

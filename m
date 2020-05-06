Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EB601C6CE9
	for <lists+linux-i2c@lfdr.de>; Wed,  6 May 2020 11:28:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728685AbgEFJ2l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 May 2020 05:28:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728865AbgEFJ2l (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 May 2020 05:28:41 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DBB6C061A0F
        for <linux-i2c@vger.kernel.org>; Wed,  6 May 2020 02:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
        Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=vJVPc/tl/82cpPKHt/9767PNxH9IVM0MJ448DoTT9yc=; b=HkggEYB8JSwhYmvu0usGnGPFv
        OT/wd4fu25qw6essKDHDGsrajBBHBu0MBpQo3xpa1kNtYBFtkjhPJyEXyzD7KWuXAEMzlfaTsYtSw
        kcuZ+cqhgaqTSKPfS31Puys8m2PsCQcD1l9gTVMxuS7DXsmfRuQX823jvyVGjwgXG6J2gNNj0rBAq
        cffBMhibs+V+nBdV1i8JZdk25HUK06VyWB+l9Bz0fv8zNcDKReXG4qSyI2/0DBGKPD5URsDrYTWJX
        soEd/Jr3ltkWv8SBh6dgkBMTj7h15DpintXq2QgUxZlwCBasgfmWILRdltLbnQkuBy3apVAKNz2Og
        95yz8cyEA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56844)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jWGLw-0007lE-LC
        for linux-i2c@vger.kernel.org; Wed, 06 May 2020 10:28:32 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jWGLw-00083O-41; Wed, 06 May 2020 10:28:32 +0100
Date:   Wed, 6 May 2020 10:28:32 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Subject: [PATCH 0/4] Further i2c-pxa cleanups
Message-ID: <20200506092831.GN1551@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

This small series contains some further cleanups to i2c-pxa:

Patch 1 gets rid of the duplication between i2c_pxa_pio_xfer() and
i2c_pxa_xfer(), which are mostly identical.

Patch 2 avoids the "exhausted retries" spamming the kernel log when
running i2cdetect - this occurs when a slave does not respond.  We
keep the existing behaviour for all other retries.

Patch 3 changes the kernel messages printed when timeouts happen so
they are unique - thus allowing identification of which one triggered.

Patch 4 removes an unnecessary show_state() while waiting for the
bus to become free.

 drivers/i2c/busses/i2c-pxa.c | 56 +++++++++++++++++++++-----------------------
 1 file changed, 27 insertions(+), 29 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 10.2Mbps down 587kbps up

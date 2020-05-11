Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC5911CE725
	for <lists+linux-i2c@lfdr.de>; Mon, 11 May 2020 23:09:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728149AbgEKVJx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 May 2020 17:09:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725888AbgEKVJx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 May 2020 17:09:53 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16F9CC061A0C
        for <linux-i2c@vger.kernel.org>; Mon, 11 May 2020 14:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
        Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=drZu0ZspRaXVrzvC8jCex7b1djav+NUKwQXIuGoSa3M=; b=Fr+3xO2PJ5Ndt2sd0OlPbUtsn
        v+1E7SNbDfwQdyzCfnAmaViyMKIkMpWsp+2H6dKQxG8Q2vGhkbJcBSGtepQ+4He7PQgrkRgpwqh/d
        Db6Jc5BfuoUp7UcnuNyjoSdbJZfPxFkIrAqMnmvLaRIIstaQd43MuK85KtQnSfqOlufMW6ArP4qOj
        bwwPf0zuioF8F805zcpAMhFbF5VTQJQ+vcW13yeQarCAkiRHVuvfvLHqWRz3bk8uEbL+rCRgFEHy7
        OOJx8UYiNFJ5XFkeOBOpShbiJFMNgVEZ7/6jRmFUK0eP6G14xNbq9O7Cv+MQiYmWqlhDlUrYHn8tp
        pydQ6uMiQ==;
Received: from shell.armlinux.org.uk ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:39050)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jYFgL-0007co-Hk; Mon, 11 May 2020 22:09:49 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jYFgK-00064G-Vz; Mon, 11 May 2020 22:09:49 +0100
Date:   Mon, 11 May 2020 22:09:48 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Subject: [PATCH v2 0/4] Further i2c-pxa cleanups
Message-ID: <20200511210948.GY1551@shell.armlinux.org.uk>
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

v2: fix compile error in patch 1.

 drivers/i2c/busses/i2c-pxa.c | 56 +++++++++++++++++++++-----------------------
 1 file changed, 27 insertions(+), 29 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 10.2Mbps down 587kbps up

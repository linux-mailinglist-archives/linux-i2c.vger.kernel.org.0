Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E77901C6D08
	for <lists+linux-i2c@lfdr.de>; Wed,  6 May 2020 11:36:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728941AbgEFJgU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 May 2020 05:36:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728640AbgEFJgU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 May 2020 05:36:20 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4175C061A0F
        for <linux-i2c@vger.kernel.org>; Wed,  6 May 2020 02:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
        Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=hqG1WbafwY2wTH670zLHTtxu7zyVtajux2PLVrtI/10=; b=CKfE5oT2vqWEKYdRCiY6PIUOA
        FWl8IEvOlgCVyxGNb/+cEVyhKbl3hdc0TVzopvwdvTezbILPRYHGlZfGQcfJ7fNYV6Z5xSJ/F/ogh
        uosVxfQ+Kjnibz1/6sPDGty0UToSKDeBoeldJE1G8Enfs/XJBD6ad8Entj3OOpx7FuEwzCk+pxW1a
        kzypJbwgrTa35Pj3/emtmLeeo85EYn3k0COAjx4wuyBArWHfdX2F8dbT2JI7Co513B/CMTOP6O9QC
        azNhgIcnFYvf84RcW4aKMmL8s2QMpQ3hm1zknL3yScQRAA3RVLf201LdEBMnuBGyYeRuRiVZMZsgZ
        Xg4c+y7Qg==;
Received: from shell.armlinux.org.uk ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:54410)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jWGTQ-0007nV-CU
        for linux-i2c@vger.kernel.org; Wed, 06 May 2020 10:36:16 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jWGTP-00083f-M1; Wed, 06 May 2020 10:36:15 +0100
Date:   Wed, 6 May 2020 10:36:15 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Subject: [PATCH 0/2] Use master-abort for slave probes
Message-ID: <20200506093615.GO1551@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

This series allows us to use the "master abort" feature when probing
slaves rather than resetting the controller, which allows more
graceful recovery to bus free state after sending the address byte.

The i2c-pxa controller expects to send data after the address byte
rather than a stop.  Rather than resetting the bus (and thus forcing
a bus-free state by releasing the SCL line) which may leave the bus
in an indeterminant state, use the master-abort command instead.

This patch series applies on top of the previous posted cleanup patches,
although it may also apply to -rc.

 drivers/i2c/busses/i2c-pxa.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 10.2Mbps down 587kbps up

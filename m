Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B4391C6D23
	for <lists+linux-i2c@lfdr.de>; Wed,  6 May 2020 11:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729063AbgEFJkJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 May 2020 05:40:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729120AbgEFJkI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 May 2020 05:40:08 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD1F4C061A10
        for <linux-i2c@vger.kernel.org>; Wed,  6 May 2020 02:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
        Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=I+qs3qhPQHX4nodFlkoxDAYDvM1CjkFl9lpV2Lzdjvc=; b=MbX4I921oty+JENr+buItVP9S
        1vixZ1Ygmz5VEhFBIQqkf/gvws+F/aq8H/rJqW9BcNB0McaCODTuam0I7Htpz2HCybZgU6TMvBzuo
        /o8UP4Qq5dSD+cuaXAfbp8BDlZsrieVyNunZPm8xw994apiupofAjLJP3Y+Dr5Xww0W6QNoVgIP27
        hczsbRytRbHu17NCrv0UixZMqqHunRM1+VbNzs5zjnsD3GrEt7CPqzwiHh5plwXD0HhUj2PdjItXY
        HuDKuyPluZKXHnZzyvhPV1L+gDsaejrn7y+Bh0zHRFYCKmKG+5yIm2JvOtWHhSTIRWppf4rIAYsoR
        gibbt8PbQ==;
Received: from shell.armlinux.org.uk ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:54414)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jWGX4-0007pS-7E
        for linux-i2c@vger.kernel.org; Wed, 06 May 2020 10:40:02 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jWGX3-00084g-Gh; Wed, 06 May 2020 10:40:01 +0100
Date:   Wed, 6 May 2020 10:40:01 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Subject: [PATCH 0/2] Add bus recovery to i2c-pxa
Message-ID: <20200506094001.GP1551@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

This series adds bus recovery to i2c-pxa, using GPIOs to manually
recover the bus. This has been proven to work on Armada 3720 with
various SFP modules that appear to misbehave.

I am only expecting patch 1 to be applied to the i2c tree; patch 2
should be applied through normal routes via the arm-soc tree, but
are included in this series since it is part of the same change.

 arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts |  22 ++-
 drivers/i2c/busses/i2c-pxa.c                     | 176 ++++++++++++++++++++---
 2 files changed, 179 insertions(+), 19 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 10.2Mbps down 587kbps up

Return-Path: <linux-i2c+bounces-5-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6475C7E7EF0
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 18:48:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DAB63B21555
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 17:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FF7B3B2A1;
	Fri, 10 Nov 2023 17:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="02EITr0O"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B463F3B2AB
	for <linux-i2c@vger.kernel.org>; Fri, 10 Nov 2023 17:46:45 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D5BF2BE36;
	Fri, 10 Nov 2023 01:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RCqQsSVyM3DoXJTLUpazgJs9NwUukmIgdnC+ahMaGSU=; b=02EITr0OdLqv0CrU0Iuf65HdLz
	ihjguQJZ+aOheh6x0VJm3tU0/AFj4I38usxj+5SaOy9N8HN7heoNCjgyMqGiHY1Re84aQXs8nphcd
	5TbtBdAs0pvmsojcyhTBr5aNOyXzLQnBxLvyYfU8IYx2BdP8R1LV/RprefPa/62N9JtCRtzYY4/YL
	v2XyvJAL9V9P9O72c751zb339ii1SWayLwtEzjihLEe8p+LBwplBoHOdRthPnfe64+JAVlEbVx/EH
	k2GprCYgShO0DpAWg4g9Tui/vZICK5po39lpOZyrKUw78uqmtkg6RSYheoRBBKE1t2QYac+8KZqJr
	iz5C2eLA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43810)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1r1O3b-0003QY-0D;
	Fri, 10 Nov 2023 09:44:07 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1r1O3c-0001SO-J6; Fri, 10 Nov 2023 09:44:08 +0000
Date: Fri, 10 Nov 2023 09:44:08 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Robert Marko <robert.marko@sartura.hr>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
	wsa@kernel.org, codrin.ciubotariu@microchip.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] Revert "i2c: pxa: move to generic GPIO recovery"
Message-ID: <ZU37aJfDpcixU2OZ@shell.armlinux.org.uk>
References: <20231110093039.190076-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231110093039.190076-1-robert.marko@sartura.hr>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Fri, Nov 10, 2023 at 10:30:11AM +0100, Robert Marko wrote:
> This reverts commit 0b01392c18b9993a584f36ace1d61118772ad0ca.
> 
> Conversion of PXA to generic I2C recovery, makes the I2C bus completely
> lock up if recovery pinctrl is present in the DT and I2C recovery is
> enabled.
> 
> So, until the generic I2C recovery can also work with PXA lets revert
> to have working I2C and I2C recovery again.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Cc: stable@vger.kernel.org # 5.11+

My feels were that this should not have been converted to the generic
recovery as pointed out at the time, so thanks for confirming that it
broke as a result of that conversion, it did indeed break.

Acked-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


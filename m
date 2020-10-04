Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8937B2829C5
	for <lists+linux-i2c@lfdr.de>; Sun,  4 Oct 2020 11:25:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725826AbgJDJY6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 4 Oct 2020 05:24:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgJDJY6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 4 Oct 2020 05:24:58 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A012C0613CE;
        Sun,  4 Oct 2020 02:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=uk61xPxvfvQYj4ScWiDcE+iDq+hfu82CzM2wpEZmDpY=; b=jMk4keie6G55oRdb4YXWPQXyC
        d/EeFgJhUCL4RpjOXxCn+Ix6k89x+OmAihD2hYeSLtvsy/hQlPA2kL3258dAAo7FwVexxBbdP43td
        8jx6E70m0ByhCR2UkKPTDXjRLkyXZD24/wcDrTXfRzbt0jsQyx4aeyN/lhNwNzckdtMgJY0hv+0s1
        mbBvj65A6/IIhoBNuwtxTGWsuZMn8G0akJaJTE6eKllm2YWlsQowPezZzgF4MBMdB1fJyhMxs1Dlm
        P0ngGgFVLMkmpBqoxHMteX7nw+gYyR+PK7y01AXRqfUItHb0q8ZlGknNYGj85jY+jPs0v3gCdkmCD
        URMuYqlSQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41774)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1kP0GG-00005h-Es; Sun, 04 Oct 2020 10:24:56 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1kP0GF-00061D-T1; Sun, 04 Oct 2020 10:24:55 +0100
Date:   Sun, 4 Oct 2020 10:24:55 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, wsa@kernel.org,
        alpawi@amazon.com
Subject: Re: [PATCH v2] i2c: pxa: move to generic GPIO recovery
Message-ID: <20201004092455.GI1551@shell.armlinux.org.uk>
References: <20201004091656.1004575-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201004091656.1004575-1-codrin.ciubotariu@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Oct 04, 2020 at 12:16:56PM +0300, Codrin Ciubotariu wrote:
> Starting with
> commit 75820314de26 ("i2c: core: add generic I2C GPIO recovery")
> GPIO bus recovery is supported by the I2C core, so we can remove the
> driver implementation and use that one instead.
> 
> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> ---
> 
> This patch is not tested.
> 
> Changes in v2:
>  - readded the pinctrl state change to default from the
>    unprepare_recovery callback;

I don't think you've build tested this patch...

> diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
> index 35ca2c02c9b9..006cc1d5931f 100644
> --- a/drivers/i2c/busses/i2c-pxa.c
> +++ b/drivers/i2c/busses/i2c-pxa.c
> @@ -264,9 +264,6 @@ struct pxa_i2c {
>  	u32			hs_mask;
>  
>  	struct i2c_bus_recovery_info recovery;
> -	struct pinctrl		*pinctrl;
> -	struct pinctrl_state	*pinctrl_default;
> -	struct pinctrl_state	*pinctrl_recovery;

i2c_pxa_unprepare_recovery() refers to pinctrl and pinctrl_default which
you've retained in this version of the patch, but you've deleted the
members from this structure - which will lead to a build error.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

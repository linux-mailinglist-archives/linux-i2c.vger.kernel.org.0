Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D57AD1C720A
	for <lists+linux-i2c@lfdr.de>; Wed,  6 May 2020 15:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726093AbgEFNsW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 May 2020 09:48:22 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:45028 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725801AbgEFNsW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 May 2020 09:48:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=UtaGRb3kkKTgPuF4ezNKw0wVo+/nkRp3H28c3f84pTI=; b=CZBnVPDh1TOeD1U2INSIenhmVi
        TLvy4DDIu/AYCqWWGzArCSu9oMY8I71temXZxQE0Jw/+8odhrkCKk+Sfqw9zXWXHwAOunhNVhjrMu
        ptwoKqlK7rAOLenjfMzo9DTPTuLFE55R3sxC9wEdpniRxc36HT2YpvrNtSWq+GqKfdWQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
        (envelope-from <andrew@lunn.ch>)
        id 1jWKPK-0015g2-VW; Wed, 06 May 2020 15:48:18 +0200
Date:   Wed, 6 May 2020 15:48:18 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Gregory Clement <gregory.clement@bootlin.com>,
        Jason Cooper <jason@lakedaemon.net>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Vladimir Vid <vladimir.vid@sartura.hr>
Subject: Re: [PATCH 2/2] arm64: dts: add uDPU i2c bus recovery
Message-ID: <20200506134818.GF224913@lunn.ch>
References: <20200506094001.GP1551@shell.armlinux.org.uk>
 <E1jWGXd-0000Z7-1n@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1jWGXd-0000Z7-1n@rmk-PC.armlinux.org.uk>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 06, 2020 at 10:40:37AM +0100, Russell King wrote:
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> ---
>  .../boot/dts/marvell/armada-3720-uDPU.dts     | 22 +++++++++++++++++--

Hi Russell

Interesting that the 3720 uses pxa, not orion i2c. I had not noticed
that before.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

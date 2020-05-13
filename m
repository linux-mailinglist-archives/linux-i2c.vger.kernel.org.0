Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FBF41D147F
	for <lists+linux-i2c@lfdr.de>; Wed, 13 May 2020 15:18:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387574AbgEMNSq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 May 2020 09:18:46 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:57786 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387509AbgEMNSq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 13 May 2020 09:18:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=wcdwRpYIIGbs4kVKQLYCrwdiYpZ2LvQdr5bacIYT+B4=; b=KPFEz/adcR7geY4WpPjvxy0hp7
        y/wWZkJzmUOH8f4O5T90NSrY5ru2XX1Akf64bqeDgW5l45WFPkDYDpnGyx9WB4nguMDJszcJb1nL9
        g4ciUb6uDG+CUrNpTs8QXixAm/RsutwaRokmRekH8Cs/jgQNpLUZwOkcmIrn1q/zyeA8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
        (envelope-from <andrew@lunn.ch>)
        id 1jYrHX-002A93-E1; Wed, 13 May 2020 15:18:43 +0200
Date:   Wed, 13 May 2020 15:18:43 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Gregory Clement <gregory.clement@bootlin.com>,
        Jason Cooper <jason@lakedaemon.net>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Vladimir Vid <vladimir.vid@sartura.hr>
Subject: Re: [PATCH] i2c: pxa: implement generic i2c bus recovery
Message-ID: <20200513131843.GB499265@lunn.ch>
References: <E1jYnlI-0002Nw-83@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1jYnlI-0002Nw-83@rmk-PC.armlinux.org.uk>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 13, 2020 at 10:33:12AM +0100, Russell King wrote:
> Implement generic GPIO-based I2C bus recovery for the PXA I2C driver.

Hi Russell

I assume this is going to be merged via i2c? So Wolfram Sang?  He is
not on To: or Cc:

  Andrew

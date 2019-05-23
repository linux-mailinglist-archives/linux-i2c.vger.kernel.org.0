Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0F8C27CF5
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2019 14:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730601AbfEWMeu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 May 2019 08:34:50 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:44902 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728309AbfEWMeu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 23 May 2019 08:34:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=kzTgxZupA7hbLq4h+ysA5lKtx8rooCtnoiPerHmRDtk=; b=mX7hFCnVVU5gXlZVbtQV49J0RR
        1RbakI/TLZCKmqLaacEyYJ89p+DRzCD5Y02/I/M0nJEUBx9PvbzzPMkfUxBCyxmXymxh5zukjiFm+
        sbZ7x9/W3PvlXcqbZk+ZfWXa/rKsghXXbFlM4lKtuk7JkbWkKx8+ITUHy1V2H4LOlwUY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
        (envelope-from <andrew@lunn.ch>)
        id 1hTmvb-000474-HJ; Thu, 23 May 2019 14:34:35 +0200
Date:   Thu, 23 May 2019 14:34:35 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Sagar Kadam <sagar.kadam@sifive.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, peter@korsgaard.com,
        Palmer Dabbelt <palmer@sifive.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/3] i2c-ocores: sifive: add polling mode workaround
 for FU540-C000 SoC.
Message-ID: <20190523123435.GA15531@lunn.ch>
References: <1558515574-11155-1-git-send-email-sagar.kadam@sifive.com>
 <1558515574-11155-4-git-send-email-sagar.kadam@sifive.com>
 <20190522194529.GJ7281@lunn.ch>
 <CAARK3HmMVibudG2CFLBoMSAqnraXyirTL6CXYo1T_XJEuGJy7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAARK3HmMVibudG2CFLBoMSAqnraXyirTL6CXYo1T_XJEuGJy7Q@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> Thank you Andrew for reviewing the patch set.
> Can you please let me know weather you or Peter will be pick up the patch
> for v5.3 or they  should go in via some other tree?

Hi Sagar

Wolfram Sang should pick the patchset up.

	Andrew

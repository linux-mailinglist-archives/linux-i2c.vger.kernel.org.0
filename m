Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41BCC166A2
	for <lists+linux-i2c@lfdr.de>; Tue,  7 May 2019 17:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726685AbfEGPYy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 May 2019 11:24:54 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:57396 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726236AbfEGPYy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 May 2019 11:24:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=FtjyM26XsYTblD9NmW/RCrjv8PwkOYDcOPzujGk6vtk=; b=q3WfvQiY7Z7At64kvXI0x7gNhh
        wqXcJUShVLJJ9CiVFG7L1C7yV7cKTnnehPkjG2mKfL9z+ZBEZrvnleMapbQEJn2eS90kzKh1iX3dI
        rXHcdqjK+RlZn3uF3/YVSCVf8zqAudqKeN1R/RV9vjMkwTuQ9hfdSTmEzOujD29gXTxY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
        (envelope-from <andrew@lunn.ch>)
        id 1hO1xR-00019y-TJ; Tue, 07 May 2019 17:24:41 +0200
Date:   Tue, 7 May 2019 17:24:41 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
        palmer@sifive.com, paul.walmsley@sifive.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 v2 1/3] dt-bindings: i2c: extend existing opencore
 bindings.
Message-ID: <20190507152441.GC25013@lunn.ch>
References: <1557242108-13580-1-git-send-email-sagar.kadam@sifive.com>
 <1557242108-13580-2-git-send-email-sagar.kadam@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1557242108-13580-2-git-send-email-sagar.kadam@sifive.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> +or
> +	/*
> +	  An Opencore based I2C node in FU540-C000 chip from SiFive
> +	  This chip has a hardware erratum for broken IRQ
> +	  so it's recommended not to define interrupt in the device node
> +	*/
> +	i2c@10030000 {
> +			compatible = "sifive,i2c0","sifive,fu540-c000-i2c";

The most specific compatible comes first.

You also need to be forward thinking. The next revision of the silicon
could have the bug fixed. You can then use plain "sifive,i2c0" to
indicate just polling is needed, not bug workaround. But for that to
work, you need "sifive,fu540-c000-i2c" first.

      Andrew

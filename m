Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F17CF14AC7
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2019 15:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbfEFNT2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 May 2019 09:19:28 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:55758 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725853AbfEFNT2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 6 May 2019 09:19:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=/39Byr8Jz1d2Cq9RZc884MwZCtSwkYNYQBE+LN5ZoMk=; b=KonHm0ud0tHXY8V6u9Y7S9GRJ4
        caA7TK2xPZ7euRsB90vYTt67HPHd3ui/AzbKSGb439axZfxMfIjQ3VZuV7YKUxD2hbNDAuE52+aaD
        dWD4Ta0yqq9x4lNYcvgxqC/9Xh5NlWev5/szH72aMCzBxow4cX3I9YL8geSvSZEQKgOg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
        (envelope-from <andrew@lunn.ch>)
        id 1hNdWZ-0004xc-1J; Mon, 06 May 2019 15:19:19 +0200
Date:   Mon, 6 May 2019 15:19:19 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, palmer@sifive.com,
        paul.walmsley@sifive.com, peter@korsgaard.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 v1 1/3] dt-bindings: i2c: add documentation for adding
 SiFive I2C driver
Message-ID: <20190506131919.GC15291@lunn.ch>
References: <1557147240-29551-1-git-send-email-sagar.kadam@sifive.com>
 <1557147240-29551-2-git-send-email-sagar.kadam@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1557147240-29551-2-git-send-email-sagar.kadam@sifive.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, May 06, 2019 at 06:23:58PM +0530, Sagar Shrikant Kadam wrote:
> Add DT binding for OpenCore's based i2c device as found in
> FU540 Chipset on HiFive Unleashed Platform (Rev A00).
> 
> The doc explains, how to add DT support for I2C devices.
> 
> Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
> ---
>  .../devicetree/bindings/i2c/i2c-sifive.txt         | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-sifive.txt

Hi Sagar

Please extend the existing i2c-ocores.txt file, not add a new file.

       Andrew

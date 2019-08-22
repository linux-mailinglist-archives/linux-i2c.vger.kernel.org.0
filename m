Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82A1E9956F
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2019 15:49:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731048AbfHVNsq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Aug 2019 09:48:46 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:51892 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725941AbfHVNsp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 22 Aug 2019 09:48:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=Wa9ICQMLAkpnUdtW+YKoJlW1OdLRx4OMeLNV/HO4rkE=; b=vmwnltKT4ugdUB8ZCu8srnRnnk
        bMQVJ+gJtyCR/Tmp991ooRQh2dw70kqVVOSnYuOfTR4Ylk3OjMjGtVs+DsTJfsY1jYjsjWssBqw08
        LrvTVSI72obWRuKgbfl7xOasjyvBC85u2GQojwaFiM1qzurKbHCbYBzcz2mgwz08Oe+s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
        (envelope-from <andrew@lunn.ch>)
        id 1i0nSD-00044Q-OF; Thu, 22 Aug 2019 15:48:41 +0200
Date:   Thu, 22 Aug 2019 15:48:41 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Federico Vaga <federico.vaga@cern.ch>
Cc:     Peter Korsgaard <peter@korsgaard.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: ocores: use request_any_context_irq() to register
 IRQ handler
Message-ID: <20190822134841.GG13020@lunn.ch>
References: <20190822132132.16557-1-federico.vaga@cern.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190822132132.16557-1-federico.vaga@cern.ch>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Aug 22, 2019 at 03:21:32PM +0200, Federico Vaga wrote:
> The i2c-ocores device is an HDL component that get instantiated in FPGA.
> The software stack used to drive an FPGA can be very different, and the
> i2c-ocore ip-core must work in different context. With respect to this
> patch the IRQ controller behind this device, and its driver, can have
> different implementations (nested threads). For this reason, it is safer
> to use `request_any_context_irq()` to avoid errors at probe time.
> 
> Signed-off-by: Federico Vaga <federico.vaga@cern.ch>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

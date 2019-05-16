Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AF4F20789
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2019 15:03:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726696AbfEPNDA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 May 2019 09:03:00 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:37237 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726618AbfEPNC7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 16 May 2019 09:02:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=TxWIdfV2hL7/iT51c08JGwX3nJjgTJ/fYPgEs9gxoGM=; b=CELJ9w/bLskERYh1DvzhJgdlGf
        54lADYLraF3PDZwmFVt7Jnk2lWkPZpPAlv2ET94JJQda86DYoESF1Z3Kxq10+xtoh00lzdSpnjRSt
        N/ZSXMHaqMtIVUFndc/fMyAUKNfwcU0f9pBLoSSTxWYgcNz6qj+LombOlFDZrCDT21zg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
        (envelope-from <andrew@lunn.ch>)
        id 1hRG26-0003He-KB; Thu, 16 May 2019 15:02:50 +0200
Date:   Thu, 16 May 2019 15:02:50 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Sagar Kadam <sagar.kadam@sifive.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
        Palmer Dabbelt <palmer@sifive.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] i2c-ocores: sifive: add polling mode workaround
 for FU540-C000 SoC
Message-ID: <20190516130250.GD14298@lunn.ch>
References: <1557983320-14461-1-git-send-email-sagar.kadam@sifive.com>
 <1557983320-14461-4-git-send-email-sagar.kadam@sifive.com>
 <20190516123120.GB14298@lunn.ch>
 <CAARK3H=L2AFtog6wdJGU7rKi7yk-AzDgFdjcjktZgkqdDwnOZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAARK3H=L2AFtog6wdJGU7rKi7yk-AzDgFdjcjktZgkqdDwnOZQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> Other SiFive chip's with Ocore based I2C re-implementation might not
> need the broken IRQ workaround.

They then get a different compatible string, because they are not bug
compatible.

	Andrew

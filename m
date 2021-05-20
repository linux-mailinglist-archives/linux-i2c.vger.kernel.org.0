Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B60A1389BC9
	for <lists+linux-i2c@lfdr.de>; Thu, 20 May 2021 05:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbhETDVC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 May 2021 23:21:02 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:45377 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbhETDVC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 May 2021 23:21:02 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 14K33WIl039595;
        Thu, 20 May 2021 11:03:32 +0800 (GMT-8)
        (envelope-from jamin_lin@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 20 May
 2021 11:16:09 +0800
Date:   Thu, 20 May 2021 11:16:08 +0800
From:   Jamin Lin <jamin_lin@aspeedtech.com>
To:     Rob Herring <robh@kernel.org>
CC:     Brendan Higgins <brendanhiggins@google.com>,
        Steven Lee <steven_lee@aspeedtech.com>,
        Rayn Chen <rayn_chen@aspeedtech.com>,
        "Benjamin Herrenschmidt" <benh@kernel.crashing.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        "ChiaWei Wang" <chiawei_wang@aspeedtech.com>,
        Joel Stanley <joel@jms.id.au>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Rob Herring <robh+dt@kernel.org>,
        "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list" <linux-kernel@vger.kernel.org>,
        Troy Lee <troy_lee@aspeedtech.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 3/3] dt-bindings: aspeed-i2c: Convert txt to yaml format
Message-ID: <20210520031608.GA3601@aspeedtech.com>
References: <20210519080436.18975-1-jamin_lin@aspeedtech.com>
 <20210519080436.18975-4-jamin_lin@aspeedtech.com>
 <1621438164.132520.3134233.nullmailer@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <1621438164.132520.3134233.nullmailer@robh.at.kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 14K33WIl039595
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The 05/19/2021 15:29, Rob Herring wrote:
> On Wed, 19 May 2021 16:04:29 +0800, Jamin Lin wrote:
> > Add global-reg node for AST2600. Document the properties for
> > "aspeed,ast2600-i2c-global" compatible node.
> > 
> > Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> > ---
> >  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 89 +++++++++++++++++++
> >  .../devicetree/bindings/i2c/i2c-aspeed.txt    | 49 ----------
> >  2 files changed, 89 insertions(+), 49 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/i2c/aspeed,i2c.example.dt.yaml:0:0: /example-0/i2c-global-regs@0: failed to match any schema with compatible: ['aspeed,ast2600-i2c-global', 'syscon']
> 
> See https://patchwork.ozlabs.org/patch/1480769
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
>
Thanks for your review.
yes, I did not add "DT_CHECKER_FLAGS" to check my patch.
I will re-sent this patch.
Thanks

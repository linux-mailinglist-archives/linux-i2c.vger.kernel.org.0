Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D3B2770CF7
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Aug 2023 03:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbjHEBUo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Aug 2023 21:20:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjHEBUn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Aug 2023 21:20:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24E7911B;
        Fri,  4 Aug 2023 18:20:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ADEDE60AEE;
        Sat,  5 Aug 2023 01:20:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 924E4C433C8;
        Sat,  5 Aug 2023 01:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691198442;
        bh=ofjXmL8ljSBXB2sYmAqpa4VoixQYJGBIRjbCzebS5i4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c2l24Q5OCNQ0gfcmGd5CLhn555uETmqpzdgO9dA2bc17yoTwdIq29mwyaScagTivg
         WxZI/Ed0nIdFl/DrxkjqXU3Q894gp59ut8s/f2M9ngH5hJx6xJ9Yrlk3GidzNKXMUx
         fdMj2JBtY53kvK8c9rpsLPCvYJiXFiT6m4nH8/i/FpUXbiSVtKBM4I2Viwe/tWepa2
         yAM0Kv2eVUCGwrNZLEIXeAJknAXjRrWaBss7f9DcXc2quFbONMfLj43rYF5VFzqvLB
         nl6zH7QQO5bqDZzHjL1BBN/UGtoCRZyh1pmF3UAdu1mmWYHpoCYY0uArasA4d/n3Mt
         6c6QJl5D4Hx5Q==
Date:   Sat, 5 Aug 2023 03:20:39 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Samuel Holland <samuel.holland@sifive.com>
Cc:     Peter Korsgaard <peter@korsgaard.com>,
        Andrew Lunn <andrew@lunn.ch>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: ocores: Move system PM hooks to the NOIRQ phase
Message-ID: <20230805012039.lnekkg7zcspvsnkl@intel.intel>
References: <20230717203857.2626773-1-samuel.holland@sifive.com>
 <20230727003551.dtjx3shwpjs3le6x@intel.intel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230727003551.dtjx3shwpjs3le6x@intel.intel>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Thu, Jul 27, 2023 at 02:35:51AM +0200, Andi Shyti wrote:
> Hi Samuel,
> 
> On Mon, Jul 17, 2023 at 01:38:57PM -0700, Samuel Holland wrote:
> > When an I2C device contains a wake IRQ subordinate to a regmap-irq chip,
> > the regmap-irq code must be able to perform I2C transactions during
> > suspend_device_irqs() and resume_device_irqs(). Therefore, the bus must
> > be suspended/resumed during the NOIRQ phase.
> > 
> > Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> 
> it's OK for me.
> 
> Peter, any comment on this?

a kind ping...

Andi

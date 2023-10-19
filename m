Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05A4A7CF43E
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Oct 2023 11:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbjJSJqH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Oct 2023 05:46:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjJSJqH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Oct 2023 05:46:07 -0400
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2D0610F;
        Thu, 19 Oct 2023 02:46:02 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DCBBD1C000D;
        Thu, 19 Oct 2023 09:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1697708760;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Je4zaOCqnvXWygZEknQfLrVGZdi68AOt0DsOWGgF264=;
        b=g8RqOFVAjwPbgY2TUv2Zg57ruJQI/O/7LKkk6+LtxrMxUjawY2g30CTSkR/Evdz221nTpX
        ru6K1pakZzx2yXAx/i2P4agDHUIjR/AcS67DJfuu7+tuE4Cbw13AN+oG0w2cW/9/b2Cxvz
        01iIlmHywDwbtw5GVjrwk4xGDFhAAfdVguBEWt9arEu8qkdxfaKi1Lx7akbAtGmDtzXUwp
        ZPAd0W7jFgtpeg6/bldN4Ky2UpgVaavEKfau8fBlvCOjGcM7ldkZ7XUWmVQl7EvDSo2iRb
        viZmyqmbrC/2cXt292UYbyCo6jisWvSALbq4JxKFQIPbmnL68g+VUaOe8Smv1Q==
Date:   Thu, 19 Oct 2023 11:45:59 +0200
From:   Herve Codina <herve.codina@bootlin.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Allan Nielsen <allan.nielsen@microchip.com>,
        Horatiu Vultur <horatiu.vultur@microchip.com>,
        Steen Hegelund <steen.hegelund@microchip.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 1/3] i2c: muxes: i2c-mux-pinctrl: Use
 of_get_i2c_adapter_by_node()
Message-ID: <20231019114559.5a81741e@bootlin.com>
In-Reply-To: <668b7c50-bcd7-b99e-3438-eceff6594dd7@axentia.se>
References: <20231019073533.386563-1-herve.codina@bootlin.com>
        <20231019073533.386563-2-herve.codina@bootlin.com>
        <668b7c50-bcd7-b99e-3438-eceff6594dd7@axentia.se>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Peter,

On Thu, 19 Oct 2023 11:25:35 +0200
Peter Rosin <peda@axentia.se> wrote:

> Hi!
> 
> 2023-10-19 at 09:35, Herve Codina wrote:
> > i2c-mux-pinctrl uses the pair of_find_i2c_adapter_by_node() /
> > i2c_put_adapter(). These pair alone is not correct to properly lock the
> > I2C parent adapter.
> > 
> > Indeed, i2c_put_adapter() decrements the module refcount while
> > of_find_i2c_adapter_by_node() does not increment it. This leads to an
> > overflow over zero of the parent adapter user counter.  
> 
> Perhaps "... underflow of the parent module refcount."?

Yes, will be changed in the next iteration.

> 
> > 
> > Use the dedicated function, of_get_i2c_adapter_by_node(), to handle
> > correctly the module refcount.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>  
> 
> Good find, and sorry about that!
> 
> Fixes: c4aee3e1b0de ("i2c: mux: pinctrl: remove platform_data")
> Acked-by: Peter Rosin <peda@axentia.se>
> 
Will be added in the next iteration.

Thanks for the review,
Hervé

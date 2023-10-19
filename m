Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 434D77CF442
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Oct 2023 11:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345105AbjJSJqO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Oct 2023 05:46:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345100AbjJSJqN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Oct 2023 05:46:13 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7DD8115;
        Thu, 19 Oct 2023 02:46:11 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 460792000E;
        Thu, 19 Oct 2023 09:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1697708770;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gpBYM8yj5DDBz64Ezplfd4eNKw/isGlGmKk+0v/hlbM=;
        b=I9ObLOv71qACjYaw20rW+4mrDoxzJST8xfWHWJ+/Skj2Afr8TQUViRY//c3efmIjzCmlcc
        j+mXcOu58yXGBNJ9Hr7dQEi9H0LKbDIFLdX6qNlaeY318F+mcQ9dmcDV7JxeFg0YUOniiY
        skFs/kjie12gla+iRRptIROPsPGNaxhz7UUuIpSd7SJc9aj7FW7zjamPmzb1AsxkNp1WMM
        XdqhdGTdhdmOqGGoAFDe8FVrWzMK87zP8OKfqpCA9z8raxm27ID2mxxFVYVTinJnBv+AjU
        EJsLQ0tkgN1VuzoP9zcOQ3hITA8EHxkk3mgCnqpM7g+svQwJHSmkN0z4uKhKXw==
Date:   Thu, 19 Oct 2023 11:46:08 +0200
From:   Herve Codina <herve.codina@bootlin.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Allan Nielsen <allan.nielsen@microchip.com>,
        Horatiu Vultur <horatiu.vultur@microchip.com>,
        Steen Hegelund <steen.hegelund@microchip.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 3/3] i2c: muxes: i2c-mux-gpmux: Use
 of_get_i2c_adapter_by_node()
Message-ID: <20231019114608.798b89b1@bootlin.com>
In-Reply-To: <4b641f48-7673-9d55-0963-35b52189b6ad@axentia.se>
References: <20231019073533.386563-1-herve.codina@bootlin.com>
        <20231019073533.386563-4-herve.codina@bootlin.com>
        <4b641f48-7673-9d55-0963-35b52189b6ad@axentia.se>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Peter,

On Thu, 19 Oct 2023 11:26:41 +0200
Peter Rosin <peda@axentia.se> wrote:

> Hi!
> 
> 2023-10-19 at 09:35, Herve Codina wrote:
> > i2c-mux-gpmux uses the pair of_find_i2c_adapter_by_node() /
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
> Fixes: ac8498f0ce53 ("i2c: i2c-mux-gpmux: new driver")
> Acked-by: Peter Rosin <peda@axentia.se>

Will be added in the next iteration.

Thanks for the review,
Hervé

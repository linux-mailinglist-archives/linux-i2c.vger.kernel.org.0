Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49F4057195B
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jul 2022 14:02:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231593AbiGLMCR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Jul 2022 08:02:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231184AbiGLMCQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Jul 2022 08:02:16 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB9C011F
        for <linux-i2c@vger.kernel.org>; Tue, 12 Jul 2022 05:02:15 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1oBEac-000104-77; Tue, 12 Jul 2022 14:02:06 +0200
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1oBEaa-00070K-UO; Tue, 12 Jul 2022 14:02:04 +0200
Date:   Tue, 12 Jul 2022 14:02:04 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1] i2c: imx: Retry transfer on transient failure
Message-ID: <20220712120204.w3ky7xh24npokg75@pengutronix.de>
References: <20220712082415.319738-1-francesco.dolcini@toradex.com>
 <20220712084716.bw626gt7cwcjt3wq@pengutronix.de>
 <Ys1bw9zuIwWS+bqw@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ys1bw9zuIwWS+bqw@shikoro>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 22-07-12, Wolfram Sang wrote:
> 
> > > +#define I2C_IMX_MAX_RETRIES 3     /* Retries on arbitration loss */
> > 
> > Just one question: Why 3 and should we document this within the commit
> > message?
> 
> Note that you can always change this from userspace via i2c-dev and the
> I2C_RETRIES ioctl. So, it is really about a default value here.

Ah okay, this makes now a bit more sense. So the message should point
out to set it to a more reasonable default value and that 3 looks like
common sense for most of the drivers if I got this correctly. If this is
correct, would it make more sense to set it within the core?

Regards,
  Marco

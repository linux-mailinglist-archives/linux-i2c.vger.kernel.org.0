Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB2AB2492CC
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Aug 2020 04:14:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726372AbgHSCOG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Aug 2020 22:14:06 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:60474 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726486AbgHSCOG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 18 Aug 2020 22:14:06 -0400
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1k8Dc2-00A1KU-Cn; Wed, 19 Aug 2020 04:14:02 +0200
Date:   Wed, 19 Aug 2020 04:14:02 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Mohammed Billoo <mab@mab-labs.com>
Cc:     Peter Korsgaard <peter@korsgaard.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: ocores: Allow endian-specific grlib accessors
Message-ID: <20200819021402.GC2347062@lunn.ch>
References: <20200814210154.14402-1-mab@mab-labs.com>
 <20200818013410.GG2294711@lunn.ch>
 <CALkjhPo9rvaM4_uOPFxZ3PjkfOqpC01O==o-gz9aNAxqkRWcNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALkjhPo9rvaM4_uOPFxZ3PjkfOqpC01O==o-gz9aNAxqkRWcNQ@mail.gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Aug 18, 2020 at 06:14:31PM -0400, Mohammed Billoo wrote:
> Andrew,
> 
> Thanks for your comments. Does it make sense to replace the big_endian
> bool with a small_endian bool? The code to choose the appropriate
> non-grlib accessors assumes that big_endian will be specified, either
> in a device tree blob or via platform_data:
> 
> if (!i2c->setreg || !i2c->getreg) {
>         bool be = pdata ? pdata->big_endian :
>                 of_device_is_big_endian(pdev->dev.of_node);
> .
> .
> .
> case 2:
>         i2c->setreg = be ? oc_setreg_16be : oc_setreg_16;
> 
> And so if endianess isn't specified (assuming the default is big
> endian), it will actually default to small endian.

You have to assume there is no indication of endianness in device tree
by default. For your broken hardware you will indicate little endian
in device tree. If you want, you could add support for DT indicating
big endian, but it is not required.

       Andrew

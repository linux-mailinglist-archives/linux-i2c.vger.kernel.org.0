Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE61B74C08
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jul 2019 12:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727379AbfGYKo4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Jul 2019 06:44:56 -0400
Received: from gofer.mess.org ([88.97.38.141]:41021 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726513AbfGYKoz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 25 Jul 2019 06:44:55 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id EA01460474; Thu, 25 Jul 2019 11:44:53 +0100 (BST)
Date:   Thu, 25 Jul 2019 11:44:53 +0100
From:   Sean Young <sean@mess.org>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: ir-kbd-i2c: prevent potential NULL pointer
 access
Message-ID: <20190725104453.5kqusisyg44zbbcy@gofer.mess.org>
References: <20190722172632.4402-1-wsa+renesas@sang-engineering.com>
 <20190722172632.4402-2-wsa+renesas@sang-engineering.com>
 <20190725051202.o47mz4unbn63z6uk@gofer.mess.org>
 <20190725075538.GB1323@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190725075538.GB1323@kunai>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Thu, Jul 25, 2019 at 09:55:38AM +0200, Wolfram Sang wrote:
> Hi Sean,
> 
> thanks for the review!
> 
> On Thu, Jul 25, 2019 at 06:12:02AM +0100, Sean Young wrote:
> > On Mon, Jul 22, 2019 at 07:26:31PM +0200, Wolfram Sang wrote:
> > > i2c_new_dummy() can fail returning a NULL pointer. The code does not
> > > bail out in this case and the returned pointer is blindly used.
> > 
> > I don't see how. The existing code tries to set up the tx part; if
> > i2c_new_dummy() return NULL then the rcdev is registered without tx,
> > and tx_c is never used.
> 
> Yes, you are totally right. I missed that the send_block function is
> also only called iff zilog_init succeeded. Thanks for the heads up and
> sorry for the noise.

Not at all, thank you for the patch.

> > > Convert
> > > to devm_i2c_new_dummy_device() which returns an ERR_PTR and also bail
> > > out when failing the validity check.
> > 
> > Possibly I was being overly cautious with not bailing out if tx can't
> > be registered; moving to devm is probably a good idea. However the
> > commit message is misleading, because the existing code has no
> > NULL pointer access.
> 
> Yep, I will resend with a proper commit message. Technically, there is
> no need to bail out anymore because there is no NULL pointer access. My
> tendency is now to not bail out and keep the old behaviour (registering
> without tx). What do you think?

Since I write this code I've got pretty much every model with this zilog
transmitter/receiver, and they all work fine, including different firmware
versions. If there is a problem it would be nice to hear about it, and
not silently swallow the error. I think.

Thanks,

Sean

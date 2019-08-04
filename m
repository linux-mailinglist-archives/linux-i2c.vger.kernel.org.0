Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFE52808EC
	for <lists+linux-i2c@lfdr.de>; Sun,  4 Aug 2019 04:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726579AbfHDC5b (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 3 Aug 2019 22:57:31 -0400
Received: from gofer.mess.org ([88.97.38.141]:49813 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726268AbfHDC5b (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 3 Aug 2019 22:57:31 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 2D44F604C0; Sun,  4 Aug 2019 03:57:29 +0100 (BST)
Date:   Sun, 4 Aug 2019 03:57:29 +0100
From:   Sean Young <sean@mess.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: ir-kbd-i2c: convert to
 i2c_new_dummy_device()
Message-ID: <20190804025728.5v5r42zmjn5onxl7@gofer.mess.org>
References: <20190730175555.14098-1-wsa+renesas@sang-engineering.com>
 <20190730175555.14098-2-wsa+renesas@sang-engineering.com>
 <20190803131749.4d6517ab@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190803131749.4d6517ab@coco.lan>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Aug 03, 2019 at 01:17:49PM -0300, Mauro Carvalho Chehab wrote:
> Em Tue, 30 Jul 2019 19:55:54 +0200
> Wolfram Sang <wsa+renesas@sang-engineering.com> escreveu:
> 
> > Convert this driver to use the new i2c_new_dummy_device() call and bail
> > out if the dummy device cannot be registered to make failure more
> > visible to the user.
> > 
> 
> Please don't do that.
> 
> At first glance, devm_* sounds a good idea, but we had enough issues
> using it on media system.
> 
> I don't mind mind much if some SoC specific would use it, but doing
> it on generic drivers is a very bad idea. We have removed almost all
> devm_* calls from the media system.
> 
> The problem with devm is that it the de-allocation routines aren't
> called during device unbind. They happen a way later, only when the
> device itself is physically removed, or the driver is removed.

Yes, good point.

> That caused lots of headaches to debug memory lifetime issues on
> media.

Indeed this becomes much more complex. Explicit freeing is much better.


Thanks,
Sean

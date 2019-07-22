Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAEE270AD9
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2019 22:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729699AbfGVUu6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Jul 2019 16:50:58 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:44667 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727164AbfGVUu6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Jul 2019 16:50:58 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 2D5EA1BF20A;
        Mon, 22 Jul 2019 20:50:56 +0000 (UTC)
Date:   Mon, 22 Jul 2019 22:50:55 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 0/4] rtc: convert subsystem to i2c_new_dummy_device()
Message-ID: <20190722205055.GE24911@piout.net>
References: <20190722172618.4061-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190722172618.4061-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 22/07/2019 19:26:14+0200, Wolfram Sang wrote:
> This series is part of a tree-wide movement to replace the I2C API call
> 'i2c_new_dummy' which returns NULL with its new counterpart returning an
> ERRPTR.
> 
> The series was generated with coccinelle (audited afterwards, of course) and
> build tested by me and by buildbot. No tests on HW have been performed.
> 
> The branch is based on v5.3-rc1. A branch (with some more stuff included) can
> be found here:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/i2c/new_dummy
> 
> Some drivers still need to be manually converted. Patches for those will be
> sent out individually.
> 
> 
> Wolfram Sang (4):
>   rtc: isl12026: convert to i2c_new_dummy_device
>   rtc: max77686: convert to i2c_new_dummy_device
>   rtc: s35390a: convert to i2c_new_dummy_device
>   rtc: s5m: convert to i2c_new_dummy_device
> 
>  drivers/rtc/rtc-isl12026.c | 6 +++---
>  drivers/rtc/rtc-max77686.c | 6 +++---
>  drivers/rtc/rtc-s35390a.c  | 6 +++---
>  drivers/rtc/rtc-s5m.c      | 6 +++---
>  4 files changed, 12 insertions(+), 12 deletions(-)
> 
All applied, thanks!

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

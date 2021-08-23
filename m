Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B66723F4C97
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Aug 2021 16:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230354AbhHWOq2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Aug 2021 10:46:28 -0400
Received: from relay.uni-heidelberg.de ([129.206.100.212]:57139 "EHLO
        relay.uni-heidelberg.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230290AbhHWOq1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Aug 2021 10:46:27 -0400
X-Greylist: delayed 428 seconds by postgrey-1.27 at vger.kernel.org; Mon, 23 Aug 2021 10:46:27 EDT
X-IPAS-Result: =?us-ascii?q?A2CDAABesiNh/1BqzoFaHQEBAQEJARIBBQUBQIFHBgELA?=
 =?us-ascii?q?YMhVoUzkQubbYIHAQEBAQEBAQEBCTcHAQIEAQGEaoI7AiU2Bw4BAgQBAQEBA?=
 =?us-ascii?q?wIDAQEBAQEBAwEBBgEBAQEBBgSBJIVoDYZCAQEEASMPAUYQCxgCAiYCAhQoI?=
 =?us-ascii?q?S6CV4JmIQ+oZ3qBMYEBg00BhFuBKh0GgRAqAYVwU4UJgk+CKYQKMD6CS4IWg?=
 =?us-ascii?q?nqCZASFMgiBOVREvxkHjWyTfQQWLJVYkSCQXpF3k1mFMIFoBIIJMz6DOU8ZD?=
 =?us-ascii?q?5cmhUxCZwIGAQoBAQMJhT0BAYkrAQE?=
IronPort-HdrOrdr: A9a23:z62F1anQsZK+CoY9KY3YfzVlSl/pDfIb3DAbv31ZSRFFG/Fwz/
 re+MjzpiWE7wr5OUtQ4uxoV5PhfZqxz/NICMwqTNKftWrdyRGVxeNZnOjfKlTbckWUnNK1l5
 0QEZSWY+eeMbEOt6fHCX6DferIruPqzEniv5a5854kd3ASV0hP1XYANjqm
X-IronPort-Anti-Spam-Filtered: true
Received: from lemon.iwr.uni-heidelberg.de ([129.206.106.80])
  by relay.uni-heidelberg.de with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Aug 2021 16:38:35 +0200
Received: from hlauer by lemon.iwr.uni-heidelberg.de with local (Exim 4.92)
        (envelope-from <hlauer@lemon.iwr.uni-heidelberg.de>)
        id 1mIB5u-000112-Ey; Mon, 23 Aug 2021 16:38:34 +0200
Date:   Mon, 23 Aug 2021 16:38:34 +0200
From:   Hermann.Lauer@uni-heidelberg.de
To:     Gregory CLEMENT <gregory.clement@bootlin.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: Re: I2C MV64XXX: Showing Allwinner debug LCR register in bus
 lock case
Message-ID: <20210823143834.GP8757@lemon.iwr.uni-heidelberg.de>
References: <20210729073100.GA8757@lemon.iwr.uni-heidelberg.de>
 <87mtq3zxhx.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87mtq3zxhx.fsf@BL-laptop>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Grégory,

On Fri, Jul 30, 2021 at 04:28:58PM +0200, Gregory CLEMENT wrote:
> > if Allwinner i2c locks, the is a LCR register (reg_base + 0x20),
> > which shows directly the state of the SCL and SDA lines. So you can
> > see which line (if any) is pulled externally low.
> >
> > Is there a similar usefull register in the original MV64XXX MARVELL
> > chip?
> 
> I've check on the Armada 38x datasheet and at least on this one there is
> no such register or register with similar information. That's mean you
> won't be able to use it for any device only the Allwinner ones.

Thanks for looking! So, is ifdefing in the driver then the best solution to
display that valueable information?

Thanks for any idea,
 greetings
  Hermann

> > I'd like to make the patch https://bitbucket.org/hlauer/kernel/src/master/patches/i2c-buslock.patchl working for that chip, too.

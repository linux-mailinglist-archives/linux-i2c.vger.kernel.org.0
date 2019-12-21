Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85EDD128AAF
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Dec 2019 18:59:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726114AbfLUR66 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 Dec 2019 12:58:58 -0500
Received: from mail-sender240.upb.ro ([141.85.13.240]:34520 "EHLO mx.upb.ro"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726107AbfLUR66 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 21 Dec 2019 12:58:58 -0500
Received: from localhost (localhost [127.0.0.1])
        by mx.upb.ro (Postfix) with ESMTP id 4D484B56279B;
        Sat, 21 Dec 2019 19:58:55 +0200 (EET)
Received: from mx.upb.ro ([127.0.0.1])
        by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id rS-wCd-Av3WE; Sat, 21 Dec 2019 19:58:53 +0200 (EET)
Received: from localhost (localhost [127.0.0.1])
        by mx.upb.ro (Postfix) with ESMTP id 89D7EB56279C;
        Sat, 21 Dec 2019 19:58:53 +0200 (EET)
DKIM-Filter: OpenDKIM Filter v2.10.3 mx.upb.ro 89D7EB56279C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=upb.ro;
        s=96342B8A-77E4-11E5-BA93-D93D0963A2DF; t=1576951133;
        bh=X+42fjabk+WLOB1bPd12eCpPGYMZu89kQtWGOPGu13I=;
        h=Message-ID:From:To:Date:MIME-Version;
        b=dZumlSXGZqk7S3vz0l3XH/E8QmWrWWByIdVC01rPRR7aoeOkRxc3uj07nRP6x9y7A
         PmxsYJL7TXSM3eOnSIIgub/Fue2hFRpmw8e+EJ6S77WDFyNbt/WlDuMA//J0hlldMu
         quytGl4caIT7zp5A4K1MSOTs2ONSdh17zC7RjTG0=
X-Virus-Scanned: amavisd-new at upb.ro
Received: from mx.upb.ro ([127.0.0.1])
        by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 5FG3taiS2m5M; Sat, 21 Dec 2019 19:58:53 +0200 (EET)
Received: from sabertoorh (unknown [86.120.75.237])
        by mx.upb.ro (Postfix) with ESMTPSA id ECE47B56279B;
        Sat, 21 Dec 2019 19:58:52 +0200 (EET)
Message-ID: <0a09d9ed5fc5ae6c651491dead5f81bfecdbca4b.camel@upb.ro>
Subject: Re: [PATCH] i2c: cadence: Added slave support
From:   Radu Nicolae Pirea <radu_nicolae.pirea@upb.ro>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>
Date:   Sat, 21 Dec 2019 19:58:50 +0200
In-Reply-To: <CAKfKVtFqbtovQGQuzgCYzTu4bHOmAOmTz-tZMD89iUkMPc8awA@mail.gmail.com>
References: <20191219124120.53754-1-radu_nicolae.pirea@upb.ro>
         <20191219130501.GA958@kunai>
         <6504123809effc310ade02dbb8a63f10db6b6c92.camel@upb.ro>
         <CAKfKVtFqbtovQGQuzgCYzTu4bHOmAOmTz-tZMD89iUkMPc8awA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 2019-12-20 at 14:55 +0530, Shubhrajyoti Datta wrote:
> Hi ,
> 
> On Thu, Dec 19, 2019 at 7:00 PM Radu Pirea <radu_nicolae.pirea@upb.ro
> > wrote:
> > On Thu, 2019-12-19 at 14:05 +0100, Wolfram Sang wrote:
> > > > +/**
> > > > + * enum cdns_i2c_mode - I2C Controller current operating mode
> > > > + *
> > > > + * @CDNS_I2C_MODE_SLAVE:       I2C controller operating in
> > > > slave
> > > > mode
> > > > + * @CDNS_I2C_MODE_MASTER:      I2C Controller operating in
> > > > master
> > > > mode
> > > > + */
> > > 
> > > Can't the hardware operate as master and slave at the same time?
> > > 
> > 
> > Of course, it can. If the driver has a slave registered wait and
> > listens and if the subsystem needs to use the controller as master,
> > the
> > driver changes the state of the controller to master, sends and
> > reads
> > data from the bus and after this change the state of the controller
> > to
> > slave.
> 
> However that should be done only if no master is talking to the slave
> right?

Yes. The state of the slave must be IDLE, otherwise
cdns_i2c_master_xfer will return -EAGAIN.

> 
> > In cdns_i2c_master_xfer is done all the magic.


Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D169412637D
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2019 14:29:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbfLSN3j (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Dec 2019 08:29:39 -0500
Received: from mail-sender250.upb.ro ([141.85.13.250]:49320 "EHLO mx.upb.ro"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726695AbfLSN3j (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 19 Dec 2019 08:29:39 -0500
Received: from localhost (localhost [127.0.0.1])
        by mx.upb.ro (Postfix) with ESMTP id 11E21B561CCE;
        Thu, 19 Dec 2019 15:29:36 +0200 (EET)
Received: from mx.upb.ro ([127.0.0.1])
        by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id t9TArq6fxlRF; Thu, 19 Dec 2019 15:29:34 +0200 (EET)
Received: from localhost (localhost [127.0.0.1])
        by mx.upb.ro (Postfix) with ESMTP id 53944B561E4B;
        Thu, 19 Dec 2019 15:29:34 +0200 (EET)
DKIM-Filter: OpenDKIM Filter v2.10.3 mx.upb.ro 53944B561E4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=upb.ro;
        s=96342B8A-77E4-11E5-BA93-D93D0963A2DF; t=1576762174;
        bh=5E2ub4lgVn1Y+WESvtSyxuhO9OUVpYxCqfwsPhkG4No=;
        h=Message-ID:From:To:Date:MIME-Version;
        b=SEa33hgLNAh3ZQ4qwSWozHnUBlNwAEA1fgNx9BXHD6UFNDX3juD9VZYUUG4L3PEV/
         W8K0oOa3HP+ohpyOS+kWPiGW/08PHnUxCp7Y1kYYUIObydWs9WznDO7qoAptV6ntXG
         Mk9ctB3U5LeJBfGabafvtnL8nkFnedFIYT9rnAlw=
X-Virus-Scanned: amavisd-new at upb.ro
Received: from mx.upb.ro ([127.0.0.1])
        by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 0VemASvl5qg3; Thu, 19 Dec 2019 15:29:34 +0200 (EET)
Received: from nemo (unknown [90.69.82.201])
        by mx.upb.ro (Postfix) with ESMTPSA id A2CD3B561CCE;
        Thu, 19 Dec 2019 15:29:33 +0200 (EET)
Message-ID: <6504123809effc310ade02dbb8a63f10db6b6c92.camel@upb.ro>
Subject: Re: [PATCH] i2c: cadence: Added slave support
From:   Radu Pirea <radu_nicolae.pirea@upb.ro>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chirag Parekh <chirag.parekh@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>
Date:   Thu, 19 Dec 2019 15:29:30 +0200
In-Reply-To: <20191219130501.GA958@kunai>
References: <20191219124120.53754-1-radu_nicolae.pirea@upb.ro>
         <20191219130501.GA958@kunai>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 2019-12-19 at 14:05 +0100, Wolfram Sang wrote:
> > +/**
> > + * enum cdns_i2c_mode - I2C Controller current operating mode
> > + *
> > + * @CDNS_I2C_MODE_SLAVE:       I2C controller operating in slave
> > mode
> > + * @CDNS_I2C_MODE_MASTER:      I2C Controller operating in master
> > mode
> > + */
> 
> Can't the hardware operate as master and slave at the same time?
> 

Of course, it can. If the driver has a slave registered wait and
listens and if the subsystem needs to use the controller as master, the
driver changes the state of the controller to master, sends and reads
data from the bus and after this change the state of the controller to
slave. In cdns_i2c_master_xfer is done all the magic.


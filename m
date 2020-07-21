Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 650C5227D37
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jul 2020 12:39:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbgGUKjC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Jul 2020 06:39:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:58562 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726084AbgGUKjC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 Jul 2020 06:39:02 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5D50720714;
        Tue, 21 Jul 2020 10:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595327941;
        bh=gPtQSJcxNwPCdZzu4MjV8u9d2PdXnbL3Gy75/JQmnmQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xX6vP0XgrRW27NwWhrUQIzEBBM4rqaHGndD2Zh1zR2FleWqZgidqzQd0Pp50cPEz7
         7UMaV1eMLK6LFpgT0hpzfycILl9Y2v0l1fdPZp7ZCbalASI8AYs47vAOBgtcr81qhQ
         nAloarfN2T6nUVAYnjPIdLp5JFQ6oCMv4s+5bnio=
Date:   Tue, 21 Jul 2020 12:39:10 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: Two weeks off..
Message-ID: <20200721103910.GB1676612@kroah.com>
References: <20200706210412.GA11492@ninjato>
 <20200707061931.GA214289@kroah.com>
 <20200721062525.GB1044@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200721062525.GB1044@kunai>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jul 21, 2020 at 08:25:25AM +0200, Wolfram Sang wrote:
> 
> > Sure, I'll be glad to take anything urgent that has to go in "now".
> 
> And I am back again. Thanks a lot, Greg!

No problem, welcome back :)

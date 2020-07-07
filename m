Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B607D21664C
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jul 2020 08:19:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbgGGGTf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jul 2020 02:19:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:59202 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726889AbgGGGTf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 Jul 2020 02:19:35 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 220BB20739;
        Tue,  7 Jul 2020 06:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594102774;
        bh=p/mnFSd41cEmI9tbMU9PSi8Y4O8Mm7EAAFnT3DxhQX8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mcDzPHsws9fYAKnfyw5tZ8YxkQAJffa6Annk4o0z/TA8m9J7hhGvjbJa2UAS2Z3sZ
         n1YfdGjRX9UEIBjhFDUb9CmSW7oi94MF8L0oiWfaempMogSyfXDXMH9k/AtU3LJUwD
         XSUuBbtAZTj0KC3PbdRMziPwTxwv9nSqvyHShcIE=
Date:   Tue, 7 Jul 2020 08:19:31 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: Two weeks off..
Message-ID: <20200707061931.GA214289@kroah.com>
References: <20200706210412.GA11492@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200706210412.GA11492@ninjato>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jul 06, 2020 at 11:04:13PM +0200, Wolfram Sang wrote:
> Hiya all,
> 
> I hope you are well!
> 
> I'll be off the internet for the next two weeks. My for current-queue is
> empty and my for-next not very full, but I hope I have provided enough
> feedback for some series, so they can be applied easily when I am back.
> 
> If there is something super urgent, I guess you will find a tree it can
> go through. Probably Greg KH, as the driver maintainer (Hi Greg! :)) Or
> just wait the two weeks.

Sure, I'll be glad to take anything urgent that has to go in "now".

Enjoy your break!

greg k-h

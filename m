Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE295FEC5E
	for <lists+linux-i2c@lfdr.de>; Sat, 16 Nov 2019 13:57:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727517AbfKPM5P (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 16 Nov 2019 07:57:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:54354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727437AbfKPM5P (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 16 Nov 2019 07:57:15 -0500
Received: from localhost (unknown [84.241.192.145])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 10A87206F4;
        Sat, 16 Nov 2019 12:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573909034;
        bh=jSz+kXwPX2CRrUxvd98ksd17zPSRI8eXhTcDK8ZhKXw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qQuO5nwv7k7wQLXkXUPvOxDRl2fh53AIziBI6/E4BG0xADXhBBt4IlVoe03/dAgTE
         6JgF2NLj8xxr3DdP/pvI4gGopTMdblutQ90kXszkjE6vBH7VWjoTfqY5VnQ+lVd0vt
         A0i1bIns53A7BmPj92cDNB84ECVfV7GZITF+Q3hc=
Date:   Sat, 16 Nov 2019 13:57:11 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Saravana Kannan <saravanak@google.com>, kernel-team@android.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: of: Populate fwnode in of_i2c_get_board_info()
Message-ID: <20191116125711.GA451566@kroah.com>
References: <20191115045049.261104-1-saravanak@google.com>
 <20191115053201.GA800105@kroah.com>
 <20191115091035.GA2227@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191115091035.GA2227@kunai>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 15, 2019 at 10:10:36AM +0100, Wolfram Sang wrote:
> On Fri, Nov 15, 2019 at 01:32:01PM +0800, Greg Kroah-Hartman wrote:
> > On Thu, Nov 14, 2019 at 08:50:48PM -0800, Saravana Kannan wrote:
> > > This allows the of_devlink feature to work across i2c devices too. This
> > > avoid unnecessary probe deferrals of i2c devices, defers consumers of
> > > i2c devices till the i2c devices probe, and allows i2c drivers to
> > > implement sync_state() callbacks.
> > > 
> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > > ---
> > > The of_devlink feature is present in driver-core-next branch. It started
> > > off with [1] but it has been improving since then.
> > > 
> > > [1] -- https://lore.kernel.org/linux-acpi/20190904211126.47518-1-saravanak@google.com/
> > > 
> > >  drivers/i2c/i2c-core-of.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > 
> > Wolfram, I can take this through my tree now if you have no objections
> > to this.
> 
> What would be the advantage? I can also apply it today if you ack it.

I think it will not build in your tree if you apply it now as this is a
new api :)

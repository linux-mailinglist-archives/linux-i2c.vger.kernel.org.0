Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3993D393FDF
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 11:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbhE1J1a (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 05:27:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:52094 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229911AbhE1J13 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 May 2021 05:27:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5C06C613AB;
        Fri, 28 May 2021 09:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1622193954;
        bh=CJ+P7siYbSW1H4BbN8u7+5l/KqaiNpcw83OS+LQEq5A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0Y1ZEHZHlnLnfpBJKywP6drxzRJ/uTlks30OxvJv6Q6ircAe0dCdFb4xYSHH14R3I
         fF1Bs9jWIxFFlsmGXmSMttOYSp3SPC7zJYDekUrNj35aXqT7NRi7WSwUYo4xr3svl7
         g33Po+iL4GHR0kSqXey+t9mke/BQIj3J/ciyGZjo=
Date:   Fri, 28 May 2021 11:25:51 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v1 1/6] i2c: acpi: Export i2c_acpi_find_client_by_adev()
 for users
Message-ID: <YLC3HzCUhEYmfckj@kroah.com>
References: <20210526124322.48915-1-andriy.shevchenko@linux.intel.com>
 <YLAAedlB6UaJQh0X@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLAAedlB6UaJQh0X@kunai>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, May 27, 2021 at 10:26:33PM +0200, Wolfram Sang wrote:
> On Wed, May 26, 2021 at 03:43:17PM +0300, Andy Shevchenko wrote:
> > There is at least one user that will gain from the
> > i2c_acpi_find_client_by_adev() being exported.
> 
> No objections per se. But as the user is in staging, I want to ask if
> the use there is really a solution we would also accept outside of
> staging? Or is it a hack?

staging drivers should be self-contained, do not accept code in the core
kernel that only is used by staging drivers.

So I would not recommend this be accepted at this point in time.

Andy, work to get the driver out of staging first before doing stuff
like this.

thanks,

greg k-h

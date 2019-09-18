Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F2B4B6B0A
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2019 20:53:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387656AbfIRSxA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Sep 2019 14:53:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:57918 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387624AbfIRSxA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 18 Sep 2019 14:53:00 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B8ADB21BE5;
        Wed, 18 Sep 2019 18:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568832780;
        bh=XnWKNr8fD5TWt/S5fVeOFVQXajauDkjPGe0OfujFr1w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GIxs9qR8hxJUxzi6UiyuSzkgHXc032YMT6nCtH4b+VUeIejNKHqsNBkjWto7TOPWK
         VNOx94pB2c1KsjZyXrOOXZZ9xl16CZFp2azipMV1kG5bTk9wQs6rGbKuzPe6Jh/R63
         u/GnmOnm6nFFonBbZQmhPLWcnPiFZYmuufSQgHbg=
Date:   Wed, 18 Sep 2019 20:52:57 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Mark Brown <broonie@kernel.org>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Message-ID: <20190918185257.GC1933777@kroah.com>
References: <20190918170952.GT2596@sirena.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190918170952.GT2596@sirena.co.uk>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 18, 2019 at 06:09:52PM +0100, Mark Brown wrote:
> Hi all,
> 
> After merging the driver-core tree, today's linux-next build
> for arm64 allmodconfig failed like this:
> 
> /home/broonie/next/next/drivers/i2c/i2c-core-acpi.c: In function 'i2c_acpi_find_adapter_by_handle':
> /home/broonie/next/next/drivers/i2c/i2c-core-acpi.c:352:10: error: 'i2c_acpi_find_match_adapter' undeclared (first use in this function); did you mean 'i2c_acpi_find_bus_speed'?
>           i2c_acpi_find_match_adapter);
>           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>           i2c_acpi_find_bus_speed
> /home/broonie/next/next/drivers/i2c/i2c-core-acpi.c:352:10: note: each undeclared identifier is reported only once for each function it appears in
> 
> Caused by commit
> 
>   644bf600889554210 ("i2c: Revert incorrect conversion to use generic helper")
> 
> In yesterday's -next that function existed but it appears to have been
> removed in Linus' tree as part of the merge:
> 
>   4feaab05dc1eda3 ("Merge tag 'leds-for-5.4-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds")
> 
> by the commit
> 
>   00500147cbd3fc5 ("drivers: Introduce device lookup variants by ACPI_COMPANION device")
> 
> (ie, the commit that the failing commit was trying to revert.)  I
> suspect this is confusion caused by things going into Linus' tree in
> different orders.  I've fixed this up by re-adding the function.

Wait, I thought Linus said this fixup was now resolved.  What went
wrong?

Linus, should I submit a fix for this?

thanks,

greg k-h

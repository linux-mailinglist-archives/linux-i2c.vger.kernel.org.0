Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89C541C54FC
	for <lists+linux-i2c@lfdr.de>; Tue,  5 May 2020 14:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728584AbgEEMCX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 May 2020 08:02:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728497AbgEEMCX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 May 2020 08:02:23 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2307C061A0F
        for <linux-i2c@vger.kernel.org>; Tue,  5 May 2020 05:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=44J2Ve2CjKmfv0WZwyNNYlHpeLF6E8M/lJWRjnHVlDE=; b=saaC9niwn4QBTsVVFgi7vO7Qa
        ZPyYR2nvilKXf5BMkASHWzJO/QyQoBiKHV8I7HVuvFTw6hcBermi43dkuFcKlSFeqBfGHFepssGrG
        ZLJYX+shnBF8kAk+lGXoxyVhvWaruUD4lQ8dRcCTFmcraOl9C/i5ZSfP1dA3Gg6w803Cm54SWw0tu
        eY1Z+gB8CycbzI7zKQIzO9pzij9uv2F7vIipTgQhZeeIuuqIvzcIv/fydWtJouei4Rahm/olsukrT
        h4RPn272QWrVTDNXSwXC8dNzZPVfimecavl9OtRixPNGMrsY0KUhoENvH5Ez/km7DZPUJkW2ECNfr
        2f7uvS+kA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56460)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jVwGy-0002Fv-3y; Tue, 05 May 2020 13:02:04 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jVwGw-00077z-Om; Tue, 05 May 2020 13:02:02 +0100
Date:   Tue, 5 May 2020 13:02:02 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 00/12] i2c-pxa cleanups
Message-ID: <20200505120202.GE1551@shell.armlinux.org.uk>
References: <20200427184658.GM25745@shell.armlinux.org.uk>
 <20200428220616.GA7698@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200428220616.GA7698@kunai>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Apr 29, 2020 at 12:06:16AM +0200, Wolfram Sang wrote:
> On Mon, Apr 27, 2020 at 07:46:58PM +0100, Russell King - ARM Linux admin wrote:
> > Hi,
> > 
> > This series cleans up the i2c-pxa code via the following changes:
> > 
> > 1. replace i2c_pxa_addr_byte() with the functional equivalent
> >    i2c_8bit_addr_from_msg().
> > 
> > 2. removing unnecessary headers, and rearranging those that remain
> >    in alphabetical order.
> > 
> > 3. rearranging functions in the file to flow better; particularly
> >    placing the PIO specific functions next to the PIO algorithm
> >    structure, so all the PIO mode related code is together.  This
> >    eliminates the forward declaration of i2c_pxa_handler().
> > 
> > 4. group the register bitfield definitions, which were split over two
> >    separate locations in the file, into a single location, and add
> >    some definitions for the IBMR register.
> > 
> > 5. always set the 'fm' and 'hs' members for each hardware type; the
> >    storage for these members is always allocated, we don't need to
> >    bloat the code (neither runtime, nor in the source) for this.
> > 
> > 6. move definitions private to i2c-pxa out of the platform data
> >    header; platforms have no business knowing these details.
> > 
> > 7. group all driver-based IDs match (platform and OF) to one common
> >    location rather than at either end of the file.
> > 
> > 8. fix i2c_pxa_scream_blue_murder()'s log output to be printed on a
> >    single line as it was intended, rather than being printed one
> >    entry per line - which makes it difficult to read particularly
> >    when it has been enabled and you're getting lots of them.  Also
> >    fix decode_bits() output in the same way.
> > 
> > 9. fix i2c_pxa_wait_bus_not_busy() boundary condition, so that a
> >    coincidental success and timeout results in the function being
> >    successful rather than failing. (This has never been seen in
> >    practice, but was spotted while reviewing the code.)
> > 
> > All in all, these changes should have (and have had so far) no
> > observable impact on the driver; therefore, I do not see any reason
> > to backport any of these changes to stable trees.
> > 
> > This series has been rebased on the linux-i2c for-next branch.
> 
> Applied all to for-next, thanks!

I don't see it in the i2c tree yet at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git

which has the top commit for the for-next branch of:

  38d357bdc5c6 Merge branch 'i2c/for-current-fixed' into i2c/for-next

which contains commits dated after your email.

Have you forgotten to merge a branch?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 10.2Mbps down 587kbps up

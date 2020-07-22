Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6040229A6F
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jul 2020 16:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728837AbgGVOnL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jul 2020 10:43:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:50664 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731000AbgGVOnL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 22 Jul 2020 10:43:11 -0400
Received: from embeddedor (unknown [201.166.157.114])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EE39020771;
        Wed, 22 Jul 2020 14:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595428991;
        bh=G/0+PS1ME2vNfMTZZAKnHzJi7Fk3q+kRCbaGcdc8iMA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q1yPpCsLEiExymVzLhCSxCNnNPDoatndMjyK2USKmQFDU5QOFTGzn5mjZeF1A+4/l
         YMb1p3/tmFV9TtV5SJsa+LzWn1iPGYBljEli8aZKcKBEuf3kEB/gN30a54hUwJ5qZW
         E484Erm8Xe2kHzsqNFsxeaUlt3juKo72XnogzK7o=
Date:   Wed, 22 Jul 2020 09:48:48 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH][next] i2c: designware: Use fallthrough pseudo-keyword
Message-ID: <20200722144848.GC22267@embeddedor>
References: <20200721233814.GA3058@embeddedor>
 <CAHp75VcinO2QrQfk-GqfFic=Ktah5s-ndLigmVNdfvfo5cS_Pw@mail.gmail.com>
 <20200722143713.GB22267@embeddedor>
 <20200722143814.GS1030@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200722143814.GS1030@ninjato>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Wed, Jul 22, 2020 at 04:38:14PM +0200, Wolfram Sang wrote:
> 
> > > > [1] https://www.kernel.org/doc/html/v5.7/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through
> > > 
> > > Perhaps you may do it as Link: tag?
> > > 
> > 
> > mmh... that's a good suggestion; thanks, Andy.
> 
> If you want to resend, please only one patch for all I2C drivers. The
> change is "cosmetic" enough to do that IMO.
> 

The reason why I'm sending separate patches for this is because
the drivers have different maintainers.

Also, I think theses patches are fine as is; and I will consider
using a link tag for new patches.

Thanks
--
Gustavo


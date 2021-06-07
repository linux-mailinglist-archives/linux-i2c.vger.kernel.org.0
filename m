Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C98F339E15A
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jun 2021 18:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbhFGQCg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Jun 2021 12:02:36 -0400
Received: from smtprelay0234.hostedemail.com ([216.40.44.234]:45310 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230220AbhFGQCg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Jun 2021 12:02:36 -0400
Received: from omf16.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay02.hostedemail.com (Postfix) with ESMTP id 161A887C5;
        Mon,  7 Jun 2021 16:00:44 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf16.hostedemail.com (Postfix) with ESMTPA id E9FA62550F1;
        Mon,  7 Jun 2021 16:00:42 +0000 (UTC)
Message-ID: <e84d2094a6fc3c827e157b325addce4aa10b871f.camel@perches.com>
Subject: Re: [PATCH v2 1/3] units: Add SI metric prefix definitions
From:   Joe Perches <joe@perches.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        wsa@kernel.org
Date:   Mon, 07 Jun 2021 09:00:41 -0700
In-Reply-To: <YL5B1tIPNpQiWrQ/@smile.fi.intel.com>
References: <20210607152344.57458-1-andriy.shevchenko@linux.intel.com>
         <dbcd926e934dc66e17cc35c4c0d2b867474379e5.camel@perches.com>
         <YL5B1tIPNpQiWrQ/@smile.fi.intel.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: E9FA62550F1
X-Spam-Status: No, score=-2.90
X-Stat-Signature: uw5gc1ezwo8ac5kkaio99abhchskhpfz
X-Rspamd-Server: rspamout03
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+S6GjPoPQ8fyHkldiP/qv1uOpmU94ZSQg=
X-HE-Tag: 1623081642-457992
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 2021-06-07 at 18:57 +0300, Andy Shevchenko wrote:
> On Mon, Jun 07, 2021 at 08:43:02AM -0700, Joe Perches wrote:
> > On Mon, 2021-06-07 at 18:23 +0300, Andy Shevchenko wrote:
> > > Sometimes it's useful to have well-defined SI metric prefix to be used
> > > to self-describe the formulas or equations.
-=
> > The only use of any of these seems to be:
> > 
> > sound/pcmcia/vx/vxp_ops.c:      [VX_MICRO]      = 0x0c,         // MICRO
> > sound/pcmcia/vx/vxp_ops.c:              vx_outb(chip, MICRO, level);
> > sound/pcmcia/vx/vxp_ops.c:                      vx_outb(chip, MICRO, vx_compute_mic_level(chip->mic_level));
> > 
> > and these vx_outb uses are themselves macros that prepend VX_ to the 2nd arg.
> 
> Is it a real issue there?

No, it's all good.



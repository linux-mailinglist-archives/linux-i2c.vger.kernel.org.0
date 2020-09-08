Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC78026136A
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 17:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730260AbgIHPTy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 11:19:54 -0400
Received: from mx2.suse.de ([195.135.220.15]:59366 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730324AbgIHPTR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 8 Sep 2020 11:19:17 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id A24EBACDF;
        Tue,  8 Sep 2020 15:19:09 +0000 (UTC)
Date:   Tue, 8 Sep 2020 17:19:08 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        David Jedynak <sileasresearch@gmail.com>
Subject: Re: [PATCH] i2cset: Fix short writes with mask
Message-ID: <20200908171908.65690731@endymion>
In-Reply-To: <20200908065111.GA5936@ninjato>
References: <20200903110054.52a3a69f@endymion>
        <20200908065111.GA5936@ninjato>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 8 Sep 2020 08:51:11 +0200, Wolfram Sang wrote:
> On Thu, Sep 03, 2020 at 11:00:54AM +0200, Jean Delvare wrote:
> > Short writes used "daddress" for the value, but the masking code did
> > not expect that, and instead applied the mask to a variable that was
> > never used.
> > 
> > So change short writes to use "value" for the value, as all other
> > commands do. Adjust all code paths accordingly.
> > 
> > Reported by David Jedynak.
> > 
> > Signed-off-by: Jean Delvare <jdelvare@suse.de>  
> 
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> Passed my test as well. One question:

Thank you very much for testing! I'll commit that now.

> > @@ -140,7 +140,7 @@ static int confirm(const char *filename,
> >  	} else
> >  		fprintf(stderr, "data 0x%02x%s, mode %s.\n", value,
> >  			vmask ? " (masked)" : "",
> > -			size == I2C_SMBUS_BYTE_DATA ? "byte" : "word");
> > +			size == I2C_SMBUS_WORD_DATA ? "word" : "byte");  
> 
> Does this really change something or is it a refactoring leftover?

It does change something. Before the changes, size could only have two
values here, I2C_SMBUS_BYTE_DATA and I2C_SMBUS_WORD_DATA, so the result
would indeed be the same. But after the changes, size can also have
value I2C_SMBUS_BYTE, for which we want to display "mode byte", not
"mode word". Which is why we test explicitly for I2C_SMBUS_WORD_DATA,
else default to "byte", rather than the other way around.

Note that this also aligns nicely with the rest of the code in this
file, which does the same in various places.

Funny story, while I only posted this last week, I wrote the fix
several months ago, so last week I actually got to review my own code
with fresh eyes, and when I stumbled upon that specific change, first
thing that came to my mind was "this is a useless change, why did I do
that ?" Then I scrolled up, checked the other changes in that function,
noticed the removed "else" and said OK, I'm not that stupid after all
;-)

-- 
Jean Delvare
SUSE L3 Support

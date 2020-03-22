Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84F6418ECD4
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Mar 2020 23:11:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbgCVWLK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 22 Mar 2020 18:11:10 -0400
Received: from mx2.suse.de ([195.135.220.15]:35488 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726809AbgCVWLJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 22 Mar 2020 18:11:09 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 9A575AFC1;
        Sun, 22 Mar 2020 22:11:07 +0000 (UTC)
Date:   Sun, 22 Mar 2020 23:11:06 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Daniel Kurtz <djkurtz@chromium.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        syzbot <syzbot+ed71512d469895b5b34e@syzkaller.appspotmail.com>
Subject: Re: [PATCH] i2c: i801: Fix memory corruption in
 i801_isr_byte_done()
Message-ID: <20200322231106.3d431ced@endymion>
In-Reply-To: <20200114073406.qaq3hbrhtx76fkes@kili.mountain>
References: <0000000000009586b2059c13c7e1@google.com>
        <20200114073406.qaq3hbrhtx76fkes@kili.mountain>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Dan,

On Tue, 14 Jan 2020 10:34:06 +0300, Dan Carpenter wrote:
> Assigning "priv->data[-1] = priv->len;" obviously doesn't make sense.
> What it does is it ends up corrupting the last byte of priv->len so
> priv->len becomes a very high number.

I don't follow you, sorry. "priv->data[-1] = priv->len" is writing to
priv->data, not priv->len, so I can't see how this could corrupt
priv->len;

Yes, I see that len is right before data in struct i801_priv, however
priv->data is a pointer, not an array inside the structure, it points
outside the structure so whatever is done through that pointer can't
affect the structure's content.

As for priv->data[-1], in priv->data is defined as:

		priv->data = &data->block[1];

which means the pointer is 1 byte inside the actual block array,
therefore priv->data[-1] albeit convoluted looks legal to me.

> Reported-by: syzbot+ed71512d469895b5b34e@syzkaller.appspotmail.com
> Fixes: d3ff6ce40031 ("i2c-i801: Enable IRQ for byte_by_byte transactions")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Untested.
> 
>  drivers/i2c/busses/i2c-i801.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index f5e69fe56532..420d8025901e 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -584,7 +584,6 @@ static void i801_isr_byte_done(struct i801_priv *priv)
>  					"SMBus block read size is %d\n",
>  					priv->len);
>  			}
> -			priv->data[-1] = priv->len;
>  		}
>  
>  		/* Read next byte */

Definitely not correct. The first byte of the block data array MUST be
the size of the block read. Even if the code above does not do the
right thing, removing the line will not help.

Is it possible that kasan got this wrong due to the convoluted logic?
It's late and I'll check again tomorrow morning but the code looks OK
to me.

-- 
Jean Delvare
SUSE L3 Support

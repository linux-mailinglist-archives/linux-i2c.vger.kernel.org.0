Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A424FB900
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2019 20:39:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbfKMTjl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Nov 2019 14:39:41 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41418 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbfKMTjl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Nov 2019 14:39:41 -0500
Received: by mail-pf1-f195.google.com with SMTP id p26so2325650pfq.8;
        Wed, 13 Nov 2019 11:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=39/fJscXRyO2tYaTDAmRXtA6OWbN1sBYki5/jAnURBo=;
        b=iB7wHma6xYIop3/jfiI7hxqBowv9/bAorX/gpCTAW7wp7dGC8DKnIlf2L0cDsUk4As
         I83bG0o6ey0N1lThj05XGwUnk5MLOoOBZTApwdy7DfkglZ5T9DIU1lI6WrddI+Ofc9zP
         yjTdfVrlum1LQndX02NvJb6gaaeApX8j3rdPwv2IgGftGUPresI23oFltJtj2TQ9ShCJ
         GCG0pH+tt/0GkKQhiu768kmt0nBv4uytEhvZ33tNcj0miQ2hE48ZHPmDgjlZsccK+mr8
         ZnmiZ1FYhiM9M3HSUA6aPE8tomZ/Ln7WTjR4iXulhYJ4CUsQEJEYkPJ5Wki1gsIA2y7M
         5xMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=39/fJscXRyO2tYaTDAmRXtA6OWbN1sBYki5/jAnURBo=;
        b=SKdfqtYyoLA5y+iqDbnLStBSJSqjfCy46G5YsDSaOwX1CKZ0YV2SDRGRdEpjQHqfFJ
         hT6hd/VLfB7BD3qGyTJS/crCfVDsKMgjbxzJEjWY9B2bUAo+IrVDhiElAHyHr864wukM
         9016blDB6n/1WMQ6XONkzOsjrdr5X0wLxp4xppprJ3CVRYO/lqfEzwKqVzfjbWSgHwgU
         FTNgPRY5Uy1duxqdEjvogsZTNzaMzIpKA2EfuI3t3EHyXHQc3szVnWlBvBWaSAKXS51m
         Si+Ez70QUwXidx/ugAgLKVCXgN85FqGt6K+Ngjkc9tIDcCslXbV+igGffyJIMOtBYAVj
         RxhQ==
X-Gm-Message-State: APjAAAXmfEmOXn+yHORNce8UkBb24qAM71eiEn1FSYvzm9mG5R7JTJ0/
        iVXxEuwoXsHCaImtHOJOicGEwPFf
X-Google-Smtp-Source: APXvYqzCJ0h7L3tV2w2hiUfe0mtCLjc6i4Zta1V4vXoE3g2Fr3JU55Z4PJr9U1mFysn5hQu/3ddH1g==
X-Received: by 2002:a17:90a:a114:: with SMTP id s20mr7315017pjp.44.1573673980497;
        Wed, 13 Nov 2019 11:39:40 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id u9sm4006218pfm.102.2019.11.13.11.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 11:39:39 -0800 (PST)
Date:   Wed, 13 Nov 2019 11:39:37 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-iio@vger.kernel.orgi,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] i2c: smbus: use get/put_unaligned_le16 when
 working with word data
Message-ID: <20191113193937.GQ13374@dtor-ws>
References: <20191112203132.163306-1-dmitry.torokhov@gmail.com>
 <20191112203132.163306-3-dmitry.torokhov@gmail.com>
 <099e8f9c-354a-8756-a79b-e66c72d36aa7@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <099e8f9c-354a-8756-a79b-e66c72d36aa7@lucaceresoli.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Luca,

On Wed, Nov 13, 2019 at 10:47:42AM +0100, Luca Ceresoli wrote:
> Hi Dmitry,
> 
> On 12/11/19 21:31, Dmitry Torokhov wrote:
> > It is potentially more performant, and also shows intent more clearly,
> > to use get_unaligned_le16() and put_unaligned_le16() when working with
> > word data.
> > 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > 
> > ---
> > 
> > Changes in v3:
> > - split put_unaligned_le16 into a separate patch
> > - more call sites converted to get/put_unaligned_le16
> > 
> >  drivers/i2c/i2c-core-smbus.c | 12 +++++-------
> >  1 file changed, 5 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
> > index f8708409b4dbc..7b4e2270eeda1 100644
> > --- a/drivers/i2c/i2c-core-smbus.c
> > +++ b/drivers/i2c/i2c-core-smbus.c
> > @@ -15,6 +15,7 @@
> >  #include <linux/i2c.h>
> >  #include <linux/i2c-smbus.h>
> >  #include <linux/slab.h>
> > +#include <asm/unaligned.h>
> >  
> >  #include "i2c-core.h"
> >  
> > @@ -370,8 +371,7 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
> >  			msg[1].len = 2;
> >  		else {
> >  			msg[0].len = 3;
> > -			msgbuf0[1] = data->word & 0xff;
> > -			msgbuf0[2] = data->word >> 8;
> > +			put_unaligned_le16(data->word, msgbuf0 + 1);
> >  		}
> >  		break;
> >  	case I2C_SMBUS_PROC_CALL:
> > @@ -379,8 +379,7 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
> >  		read_write = I2C_SMBUS_READ;
> >  		msg[0].len = 3;
> >  		msg[1].len = 2;
> > -		msgbuf0[1] = data->word & 0xff;
> > -		msgbuf0[2] = data->word >> 8;
> > +		put_unaligned_le16(data->word, msgbuf0 + 1);
> >  		break;
> >  	case I2C_SMBUS_BLOCK_DATA:
> >  		if (read_write == I2C_SMBUS_READ) {
> > @@ -487,7 +486,7 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
> >  			break;
> >  		case I2C_SMBUS_WORD_DATA:
> >  		case I2C_SMBUS_PROC_CALL:
> > -			data->word = msgbuf1[0] | (msgbuf1[1] << 8);
> > +			data->word = get_unaligned_le16(msgbuf1);
> 
> Well, msgbuf1 cannot be unaligned, so it looks like you just need to
> convert little endian to host endian. Perhaps __le16_to_cpu(msgbuf1) is
> better (and equally or more efficient).

Well, msgbuf1 (as is any other variable unless adjusted by special
alignment attribute) is naturally aligned for its own data type (which
for u8 means it can start at any address), but that does not mean that
is is aligned for the purpose of storing word data. In fact, the
preceding msgbuf0 variable is 32 + 3 = 35 bytes long, which means that
msgbuf1 is starting on an odd address, and is definitely not aligned for
word access and using __le16_to_cpu to fetch that word will trap on some
architectures.

Thanks.

-- 
Dmitry

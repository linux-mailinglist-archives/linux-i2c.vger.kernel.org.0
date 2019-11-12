Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E2B0F996B
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Nov 2019 20:11:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727015AbfKLTLy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Nov 2019 14:11:54 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:46910 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727050AbfKLTLx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Nov 2019 14:11:53 -0500
Received: by mail-pl1-f194.google.com with SMTP id l4so9773681plt.13;
        Tue, 12 Nov 2019 11:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6wnjVJNiNGBNCKbfitQ8nRvbfeqLmiziqmbiztt6dMw=;
        b=uF05IGneF7eiHDEZxLay3N0hu8BhaVbmG/Djg5RBwPJehPiZvNfXTGxA8T5IYC16Oq
         khs5DDzR9A14HBDqQpsVl+FmSASQLlHMexb7TpG8GAcMbZbHzh+DRKc3Ay57bGSqn2zv
         T+xS4dr+4xXEvMbUSb3g/8HLUj/EJXTeFUx3n+xKv4EkfJDCkEAld+vMEnRnU/ZLpuBN
         THzCcdE46Ko4eGcnWcjwwMQFRCJrW7sY/FsoDcA3L3OzmlvVgQrb4xIrAODTmknwkavA
         2gu2IQAldUU/kJlSETXZrNUSAg809NTIawbqx+7fu0HZr2GDpiZAPSrVOkcnR5aVckKS
         Bf3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6wnjVJNiNGBNCKbfitQ8nRvbfeqLmiziqmbiztt6dMw=;
        b=VKJ1Nux/lXP9OuyXM4qKwQHDJH1ZJgFKVXwkVSH128eCflhyV1vx0Hwd671KjUIWdm
         Cy40VOs9J6eL98w51MgbcxMbsYQ5LwTjylZwliTueeECDA4oZvfXTKcB3cFmk8cSWEEj
         +NaeVj500Verib81yg0bRi0PQThN0nQxfGVQOqMsJWuW7MvyDH7En7slyYo6smz4tWVG
         DGHBBbJRTHCL/u3N+LGitmaToVTCWi+77laag6IQmtpzKRqPzCV/Y9SW8P0C0ivQnzSL
         GnLJkCGTyHO05j8bVkST0boBLMYDSDpV/VqYdjNSZgDfVffJPPyWnhaywHGRUZWuXJwR
         ctcA==
X-Gm-Message-State: APjAAAXvaJ3xTjM2I1mym/tKItp7ukKYVuLRuuR/PZUU4cYm7JUSbqGz
        OBNBS9bM53Ib6vUEazL5Y3c=
X-Google-Smtp-Source: APXvYqzSf8BGpB1lxzu/3YDxbHRq1CfqCvB2TqJ6On+ESkU3Sdbfee2ZAfwEQTRQj0gyMaub/201gA==
X-Received: by 2002:a17:902:8f94:: with SMTP id z20mr33283511plo.21.1573585912467;
        Tue, 12 Nov 2019 11:11:52 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id s3sm3309141pjr.13.2019.11.12.11.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 11:11:51 -0800 (PST)
Date:   Tue, 12 Nov 2019 11:11:49 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-iio@vger.kernel.org
Subject: Re: [PATCH v2] i2c: use void pointers for supplying data for reads
 and writes
Message-ID: <20191112191149.GA13374@dtor-ws>
References: <20191112005826.GA96746@dtor-ws>
 <f1bda5eb-b3ad-e7e1-f832-54a62e708d9c@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1bda5eb-b3ad-e7e1-f832-54a62e708d9c@lucaceresoli.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Nov 12, 2019 at 09:45:56AM +0100, Luca Ceresoli wrote:
> Hi Dmitry,
> 
> On 12/11/19 01:58, Dmitry Torokhov wrote:
> > There is no need to force users of i2c_master_send()/i2c_master_recv()
> > and other i2c read/write bulk data API to cast everything into u8
> > pointers.  While everything can be considered byte stream, the drivers
> > are usually work with more structured data.
> > 
> > Let's switch the APIs to accept [const] void pointers to cut amount of
> > casting needed.
> > 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> I agree on the principle, but I have a question, see below.
> 
> [...]
> >  s32 i2c_smbus_read_i2c_block_data_or_emulated(const struct i2c_client *client,
> > -					      u8 command, u8 length, u8 *values)
> > +					      u8 command, u8 length, void *values)
> >  {
> >  	u8 i = 0;
> >  	int status;
> > @@ -647,8 +648,7 @@ s32 i2c_smbus_read_i2c_block_data_or_emulated(const struct i2c_client *client,
> >  			status = i2c_smbus_read_word_data(client, command + i);
> >  			if (status < 0)
> >  				return status;
> > -			values[i] = status & 0xff;
> > -			values[i + 1] = status >> 8;
> > +			put_unaligned_le16(status, values + i);
> 
> The switch to put_unaligned_le16() looks unrelated, is it?

Yeah, I'll split it out.

> 
> >  			i += 2;
> >  		}
> >  	}
> > @@ -657,7 +657,7 @@ s32 i2c_smbus_read_i2c_block_data_or_emulated(const struct i2c_client *client,
> >  		status = i2c_smbus_read_byte_data(client, command + i);
> >  		if (status < 0)
> >  			return status;
> > -		values[i] = status;
> > +		*(u8 *)(values + i) = status;
> 
> My preference is to use an u8* helper variable in these cases:

Sure, I can do this.

> 
> s32 i2c_smbus_read_i2c_block_data_or_emulated(const struct i2c_client
> *client,
> -			      u8 command, u8 length, u8 *values)
> +			      u8 command, u8 length, void *buf)
>  {
> +	u8 *bytes = buf;
> @@
> -		values[i] = status;
> +		bytes[i] = status;
> 
> This clarifies we are accessing the raw bytes, avoids typecasts in the
> middle of code for readability and avoids void pointer math.
> 
> PS: look, it's exactly what you do in the max1363.c file below! :)
> 
> > diff --git a/drivers/iio/adc/max1363.c b/drivers/iio/adc/max1363.c
> > index 5c2cc61b666e7..48ed76a0e83d4 100644
> > --- a/drivers/iio/adc/max1363.c
> > +++ b/drivers/iio/adc/max1363.c
> > @@ -182,9 +182,9 @@ struct max1363_state {
> >  	struct regulator		*vref;
> >  	u32				vref_uv;
> >  	int				(*send)(const struct i2c_client *client,
> > -						const char *buf, int count);
> > +						const void *buf, int count);
> >  	int				(*recv)(const struct i2c_client *client,
> > -						char *buf, int count);
> > +						void *buf, int count);
> >  };
> >  
> >  #define MAX1363_MODE_SINGLE(_num, _mask) {				\
> > @@ -310,27 +310,29 @@ static const struct max1363_mode
> >  	return NULL;
> >  }
> >  
> > -static int max1363_smbus_send(const struct i2c_client *client, const char *buf,
> > +static int max1363_smbus_send(const struct i2c_client *client, const void *buf,
> >  		int count)
> >  {
> > +	const u8 *data = buf;
> 
> Here it is! ^
>

Thanks for the review!

-- 
Dmitry

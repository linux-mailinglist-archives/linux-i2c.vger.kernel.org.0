Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED87010000F
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Nov 2019 09:09:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbfKRIJo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Nov 2019 03:09:44 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:34941 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726464AbfKRIJn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Nov 2019 03:09:43 -0500
Received: by mail-pj1-f65.google.com with SMTP id s8so1257606pji.2;
        Mon, 18 Nov 2019 00:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=vBUlayihdGnEP5X+y2Clso2IXibwzRhsbW73z0BN6yA=;
        b=EcsNe4u99CSCk6YPmn9SgvWlQvml6q7EjkZFBbLpn7lJv8FiRBxcc26u7rH3i8MQpn
         6T98zSCp2shjBQysrTnNAWD3/TKk4IXBsnzlI0NrwyczPVdRRw0RdpbbWBgpeg901KOg
         ks1czJkyPQ4E9zOOnAmZUFjwOUFDzoTz3iiVyWSad9yMbzNDNyC0XJsR+W4SHliri4s0
         Y7n/rUZh0xIqE8BWjWejfL/UTIDBszsg5uN1dijdxTLRYktRRIb5SF11mhwNmoWegTJF
         ZfzXZnmA0aLGipvGsj6SB59RwMGaMI+F/6W7+MZ9d/SCnPSn61eKTWAu6Z4tf9mh6pfo
         fK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=vBUlayihdGnEP5X+y2Clso2IXibwzRhsbW73z0BN6yA=;
        b=aTUqWm8Les9t9IXYhjqW2TZXaid68y5ZQV2XakQ6I3G+DRsoW7VV9qZ+rd7c2/oa+R
         rslecdqVg376jWKIreUNeoqz+vkVP+BsKUxld5yEsJq/F6tAgnKNb6R/jYuy0evZatfj
         N+thsaPdCYkTWBEGlkd5RBih3oLx81YLpph0G2NrAOxTcpV3NVCQTpWgLhDMeD5ZvD0s
         BiVQ36aPFI08L8mSK2ew3WAFzUB50iqExicODbkeFxGoYlQfoCOjbaXQZmiG9BLR4BM+
         Q44A9Cc5bXiLkcr7Z6ETBicPvI/1PNjwxyj6lIQeAhotllhShosumaVkAxfICHikoRd8
         ta5A==
X-Gm-Message-State: APjAAAUa1zGp8Q2wUqpROTaHIwEvYNz6JLLsw0+dkGoqS5HRvOhhrdX5
        lJUdf4zxXlXWCbwjhy1gI9GLENFv
X-Google-Smtp-Source: APXvYqwSeUmbS2bLDo3twzIhvrt8iLYEqiH/T4EJPMGb/ptFmGnaJvpL+DEM8+rRL3TrMjGoKH+RPQ==
X-Received: by 2002:a17:902:6946:: with SMTP id k6mr1143816plt.164.1574064582503;
        Mon, 18 Nov 2019 00:09:42 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id h5sm18666428pjc.9.2019.11.18.00.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 00:09:41 -0800 (PST)
Date:   Mon, 18 Nov 2019 00:09:39 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-iio@vger.kernel.org,
        Luca Ceresoli <luca@lucaceresoli.net>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] i2c: smbus: switch from loops to memcpy
Message-ID: <20191118080939.GC251795@dtor-ws>
References: <20191112203132.163306-1-dmitry.torokhov@gmail.com>
 <20191112203132.163306-4-dmitry.torokhov@gmail.com>
 <20191118074757.edyfvz5s3pqnu67y@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191118074757.edyfvz5s3pqnu67y@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 18, 2019 at 08:47:57AM +0100, Uwe Kleine-König wrote:
> Hello Dmitry,
> 
> On Tue, Nov 12, 2019 at 12:31:32PM -0800, Dmitry Torokhov wrote:
> > When copying memory from one buffer to another, instead of open-coding
> > loops with byte-by-byte copies let's use memcpy() which might be a bit
> > faster and makes intent more clear.
> > 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > 
> > ---
> > 
> > Changes in v3:
> > - new patch using memcpy() for moving data around
> > 
> >  drivers/i2c/i2c-core-smbus.c | 15 +++++----------
> >  1 file changed, 5 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
> > index 7b4e2270eeda1..bbafdd3b1b114 100644
> > --- a/drivers/i2c/i2c-core-smbus.c
> > +++ b/drivers/i2c/i2c-core-smbus.c
> > @@ -397,8 +397,7 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
> >  			}
> >  
> >  			i2c_smbus_try_get_dmabuf(&msg[0], command);
> > -			for (i = 1; i < msg[0].len; i++)
> > -				msg[0].buf[i] = data->block[i - 1];
> > +			memcpy(msg[0].buf + 1, data->block, msg[0].len - 1);
> 
> Can it happen that msg[0].len is zero?

No, it can not, because of the "msg[0].len = data->block[0] + 2;" line
above.

Thanks.

-- 
Dmitry

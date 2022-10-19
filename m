Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21E32605159
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Oct 2022 22:34:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbiJSUeQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Oct 2022 16:34:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230215AbiJSUeO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Oct 2022 16:34:14 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5E3F18D462;
        Wed, 19 Oct 2022 13:34:13 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id d26so42696169ejc.8;
        Wed, 19 Oct 2022 13:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jtKtCWpBJcv4mG/otuUX3oh6TOctp+WF/lD5F/4NwCA=;
        b=DBWs6p7v8osqdXIRgYTYmTyPwyxcLe6XOY94WrZ4gR1htmo5l5K1YRQBVGDxlSGoYk
         HqlwnFGfCkuqvmCKZf+pF2BGiCVv1ue8LooY/E7GikUe1vX3B0WGAYnI0rP66N73I1wl
         YtuMJbq6d54Sahk0ljZjXQl5t62xDy1ejGtphtGQRnrxYCejFN3K0/cpHmOjeNbnHxl3
         SAViIpRbBFZktb2EFVUkdiJgt83xzVJlhmmOTxAqXPpS+k6224Nwlpptx5J/lMVRfy8P
         4iY64x6hURCNjZkRaIFQsDpjeppVcpkrmucwHTN1dIO1aplq7G3AQL5Pdy/74UpMqPyY
         fDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jtKtCWpBJcv4mG/otuUX3oh6TOctp+WF/lD5F/4NwCA=;
        b=R8/vOJHUtBcqunazVKgJe49dbMeprRpmZf4RIMY3hk9sH0Lv1tLD8DYFUwy8G4MDW6
         IBMdAw4Z7j1jJPWZZnSy/Tfc6stNWz3oUnpJnxS7A7E8HlMfBZkDnsnyxvZhMSYxzdcb
         3E6szeZibgkLB+f4a0kacgBWyHPu+BWE6Ps0KQwYqVk2CAUBQNXEgBQEHvz5j99pzvli
         CnNDYewneCmElqpOMsWo8KXVQhgRQg0VPQIVIu7AqzOqzFhIGeB0NDRbeXa3M5AE3lHC
         u1BIigXBbYkrnu/g2K8huRtwA3vjL8bqFvrz893NJLwRnFDSmFoxBmxoM2ixU+J0NlZj
         xnsA==
X-Gm-Message-State: ACrzQf1kAoU3+88Z2qqDZY7TM8HXm3WN6MFVyT08qYNaxIOUKPJFYo4y
        h1E6oJYc1/BARfMsjwIn2fEyfD4AX2k=
X-Google-Smtp-Source: AMsMyM5OzeetuMFxb/R4kt5OLq3k3NWBPZMWiCOrhFThCEiB9l7GydZHkiWTm0PZQUNJV/sG11bThA==
X-Received: by 2002:a17:906:1b49:b0:78d:b7b5:71cc with SMTP id p9-20020a1709061b4900b0078db7b571ccmr8167150ejg.536.1666211652323;
        Wed, 19 Oct 2022 13:34:12 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-158.ip.prioritytelecom.net. [217.105.46.158])
        by smtp.gmail.com with ESMTPSA id q1-20020a170906360100b00773c60c2129sm9487313ejb.141.2022.10.19.13.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 13:34:11 -0700 (PDT)
Date:   Wed, 19 Oct 2022 22:34:03 +0200
From:   Nam Cao <namcaov@gmail.com>
To:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc:     Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: add lis3lv02d's I2C address for Vostro 5568
Message-ID: <20221019203403.GA149239@nam-dell>
References: <20221006145440.10281-1-namcaov@gmail.com>
 <20221018193951.40787445@endymion.delvare>
 <20221018180051.236tz4yxsdzrgguq@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221018180051.236tz4yxsdzrgguq@pali>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Oct 18, 2022 at 08:00:51PM +0200, Pali Rohár wrote:
> On Tuesday 18 October 2022 19:39:51 Jean Delvare wrote:
> > On Thu, 06 Oct 2022 16:54:40 +0200, Nam Cao wrote:
> > > Dell Vostro 5568 laptop has lis3lv02d, but its i2c address is not known
> > > to the kernel. Add this address.
> > > 
> > > Output of "cat /sys/devices/platform/lis3lv02d/position" on Dell Vostro
> > > 5568 laptop:
> > >     - Horizontal: (-18,0,1044)
> > >     - Front elevated: (522,-18,1080)
> > >     - Left elevated: (-18,-360,1080)
> > >     - Upside down: (36,108,-1134)
> > > 
> > > Signed-off-by: Nam Cao <namcaov@gmail.com>
> > > ---
> > >  drivers/i2c/busses/i2c-i801.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> > > index a176296f4fff..e46561e095c6 100644
> > > --- a/drivers/i2c/busses/i2c-i801.c
> > > +++ b/drivers/i2c/busses/i2c-i801.c
> > > @@ -1243,6 +1243,7 @@ static const struct {
> > >  	 */
> > >  	{ "Latitude 5480",      0x29 },
> > >  	{ "Vostro V131",        0x1d },
> > > +	{ "Vostro 5568",        0x29 },
> > >  };
> > >  
> > >  static void register_dell_lis3lv02d_i2c_device(struct i801_priv *priv)
> > 
> > Fine with me.
> > 
> > Reviewed-by: Jean Delvare <jdelvare@suse.de>
> > 
> > Pali, OK with you?
> 
> Yes, nice to see that other people discovered another hidden hardware
> devices in their own laptops :-)
> 
> Reviewed-by: Pali Rohár <pali@kernel.org>
> 
> 
> Nam Cao, could you check your ACPI DSDT table if there is not specified
> this smbus/i2c address 0x29? Autodiscovery would be better than
> hardcoding. At least for E6440 I was told that BIOS does not provide it.

My reply got rejected by mailing list because the attachment was too big.
So I re-send this without the attachment, so that everyone can see.

I searched the DSDT table for "29", but none of them looks like an i2c
address.

But this is the first time I hear about ACPI DSDT table, so I may did
something incorrectly. I did:
        - cp /sys/firmware/acpi/tables/DSDT table
        - iasl -d table
        - Search through table.dsl

Best regards,
Nam

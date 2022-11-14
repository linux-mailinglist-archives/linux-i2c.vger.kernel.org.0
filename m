Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B7D66278D9
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Nov 2022 10:18:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236320AbiKNJSD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Nov 2022 04:18:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235816AbiKNJSC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Nov 2022 04:18:02 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FCF5BCAA
        for <linux-i2c@vger.kernel.org>; Mon, 14 Nov 2022 01:18:00 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id fn7-20020a05600c688700b003b4fb113b86so7435301wmb.0
        for <linux-i2c@vger.kernel.org>; Mon, 14 Nov 2022 01:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W3b//FjMS4rYYJ7oM3rSzlRHPMsqyV/xeMF8hoPwJfw=;
        b=GHNzWSMw2xUVtaFE/cz5B7bbo0NOd8jx56sPoYFujgt7gLXf4U3mr622kiQa0M81Ce
         FCR3osuBna4mdy1KnYKDTo5hLVCK29pM3eUa2tRVwf3TiZhmf6TW0uPB65GafDW/woY1
         uRlmWdOLvvpO4yLA0Vz8UfNPImBffnALVFM3VAKIMtynNtZ7JGy701vy9ni809A00AIM
         zUoPcqNCv5muyLWFcJoMVm7jHQiL1al8cVnmaS7P0qrykh10d9EAbJ+SM6TzB5Hwrr4q
         vhQoNoHpcWPtRSsS4299G+qTzl2itDpq/BO1SFc4Rkke6KNMtZtMlnthgoUuFWz+RhEz
         kBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W3b//FjMS4rYYJ7oM3rSzlRHPMsqyV/xeMF8hoPwJfw=;
        b=Od8z3rt0SsUepIB1lb3HGam5bEv4I6pEI22J1TVBhacMlpVnVco947Dohccs6XkW90
         csbKPxJ+eRnAZFkiqG3GX28X41CY0PG5j0rsIlI9OUM5oCmLHnof7abbN3jeZfhS5cZ9
         xpkmhmFQ8s6GYWg3oYht0uR4bjZARRDQ+KBMfkQZ+LhnsAEH9xrJ2zXmkrH7QHrHaxHz
         IXSyAu1DL1Jyp7pD63Ky+Ugoir4md7XvDX9F6hlYQ33/zvfGy4uIxoZSg3VHvI3fH12V
         fhdFfx9uiyQ0OJVy8BasITYzesizlz6DxhP0m/z/bxP8lxzKRnXA+FgzdiQ5JaQSgmdM
         5ZCw==
X-Gm-Message-State: ANoB5pnbrfBllQmAV+cePeipGinSTupuEzWBJcjYiA5ONGvla+CheipS
        oocpbJoxA48064/VtmU4DNq/jQ==
X-Google-Smtp-Source: AA0mqf4dTfVHmiL7wpiXIz4RgBRxSZJ+C/K8Hysdg8u+Ul3idSSDXjlIweJkTxrx1B2fqRed19tr3A==
X-Received: by 2002:a05:600c:1e11:b0:3cf:84e9:e705 with SMTP id ay17-20020a05600c1e1100b003cf84e9e705mr7385922wmb.28.1668417478546;
        Mon, 14 Nov 2022 01:17:58 -0800 (PST)
Received: from Red ([2a01:cb1d:3d5:a100:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id u12-20020adfdb8c000000b002417ed67bfdsm5900809wri.5.2022.11.14.01.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 01:17:58 -0800 (PST)
Date:   Mon, 14 Nov 2022 10:17:54 +0100
From:   Corentin LABBE <clabbe@baylibre.com>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     wsa@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: smbus: support new RAM variant for SPD
Message-ID: <Y3IHwug3UmTzb2wq@Red>
References: <20221107160602.1912225-1-clabbe@baylibre.com>
 <20221108114851.4436c3cb@endymion.delvare>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221108114851.4436c3cb@endymion.delvare>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Le Tue, Nov 08, 2022 at 11:48:51AM +0100, Jean Delvare a écrit :
> Hi Corentin,
> 
> On Mon,  7 Nov 2022 16:06:02 +0000, Corentin Labbe wrote:
> > On my x05 laptop I got:
> > Memory type 0x12 not supported yet, not instantiating SPD
> 
> 
> Oh, that one must be old.
> 
> > Adding the 0x12 case lead to a successful instantiated SPD AT24 EEPROM.
> > i801_smbus 0000:00:1f.3: SMBus using polling
> > i2c i2c-6: 2/2 memory slots populated (from DMI)
> > at24 6-0050: 256 byte spd EEPROM, read-only
> > i2c i2c-6: Successfully instantiated SPD at 0x50
> > at24 6-0051: 256 byte spd EEPROM, read-only
> > i2c i2c-6: Successfully instantiated SPD at 0x51
> > 
> > And then, I decoded it successfully via decode-dimms.
> > 
> > Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> > ---
> > The result of decode-dimms could be found at http://kernel.montjoie.ovh/zoo/x05/decode-dimms.txt
> > Since RAM is DDR, I wanted to add '/* DDR */' comment, but I didnt find any document with
> > proof that this 0x12 is for DDR.
> 
> It is. The document you are looking for is:
> https://www.dmtf.org/sites/default/files/standards/documents/DSP0134_3.6.0.pdf
> 
> and specifically section 7.18.2 (Memory Device — Type), table 78
> (Memory Device: Type).
> 

Hello

Thanks for the link, I will add it also as comment.

> > 
> >  drivers/i2c/i2c-smbus.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
> > index 07c92c8495a3..6dca19c994db 100644
> > --- a/drivers/i2c/i2c-smbus.c
> > +++ b/drivers/i2c/i2c-smbus.c
> > @@ -362,6 +362,7 @@ void i2c_register_spd(struct i2c_adapter *adap)
> >  	}
> >  
> >  	switch (common_mem_type) {
> > +	case 0x12:
> >  	case 0x13:	/* DDR2 */
> >  	case 0x18:	/* DDR3 */
> >  	case 0x1C:	/* LPDDR2 */
> 
> Please also add LPDDR (0x1B) for consistency.


Will do it.

Thanks
Regards

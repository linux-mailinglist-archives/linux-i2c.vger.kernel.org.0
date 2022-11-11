Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA6C62602D
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Nov 2022 18:13:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233776AbiKKRN0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Nov 2022 12:13:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233762AbiKKRNZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Nov 2022 12:13:25 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 828A727D;
        Fri, 11 Nov 2022 09:13:23 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id r186-20020a1c44c3000000b003cfa97c05cdso88697wma.4;
        Fri, 11 Nov 2022 09:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WR4ZsPco/CVzRRsDXNuvPlkKAJC2kjEvAa/rMERYHO4=;
        b=M3AEbeqXZHuWqEwxLOhiuRHLEVS/grmK5UD/bw1c3c5u1jSf5cVZkkl9a7x15JGFrp
         EeOHFz9J+hzamMY6qzAXGQvXU1T21qXVihfY9Mi717h0bnN1aPBdJmtqBzPB7gPdon7c
         QJ1Wb0YrPNg6Ceiiwvh0TACZfMWy9fffqMGhRGJYRBdrA9smS6FfuFIlhDMhydvaszVz
         xn5Be5/ZMgtI44TokbRN7I/4WDzs5f6k7u7kalVqdxcXcHKri0gesrf+T6dq/+/tu8d/
         lX/EnMThYOOhngSscebq+z81kljBCjXpj3OoE2TEcZtrpkQwhc2KXFmzxAXEXhOb87Uc
         HjQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WR4ZsPco/CVzRRsDXNuvPlkKAJC2kjEvAa/rMERYHO4=;
        b=Ps4iImRVMLi1Yq5dKNK5lenjrNB7w9BjsycM4Gzb4nk8ua4csvtUQDN/uierVmnOW4
         xNcB2dTmQEO/YkRp4WlAgg1RLktokqcwYhiunNnbgP3wcoiGpy9MrROf3+m4k1XZf506
         UYxehqfUdVC0HFOw/mHArHDheZPt5GuUPTz1aMEFY95fSDg/bTCG//g5ryhvPvlN/irV
         2LnSIwVf0B9GBOeR8x1zP1knHYHUBVO6Rk9ag6Te6nVqjqA3+/JBe8/7Ob7mwKcsMnKV
         lsFontxOIVyhYTuUIV1TfsqjvES7qCqPtNM+4NsSOKLVqS5eSKN5eZPtnI4kBmqPZ7LJ
         ZfgQ==
X-Gm-Message-State: ANoB5pmGtuEQuYJ5kgzCQzyHbKWN6jIVPq73oUO+0T3Pzj1aro7gqrFe
        aJCGbtidkCJJlf5FGg5cUunvGF5oSRAo6g==
X-Google-Smtp-Source: AA0mqf4brqlgDjFtqDK/8Sg9349i3GnsKYIQNV5QeNn0nBxE9Gri9+6KjqmRGBXfAF6pA9feV28GvQ==
X-Received: by 2002:a05:600c:4e4d:b0:3cf:81b1:bc7b with SMTP id e13-20020a05600c4e4d00b003cf81b1bc7bmr1933783wmq.121.1668186801919;
        Fri, 11 Nov 2022 09:13:21 -0800 (PST)
Received: from michael-VirtualBox (89-139-102-221.bb.netvision.net.il. [89.139.102.221])
        by smtp.gmail.com with ESMTPSA id p5-20020a05600c358500b003c6b9749505sm10370124wmq.30.2022.11.11.09.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 09:13:21 -0800 (PST)
Date:   Fri, 11 Nov 2022 19:13:18 +0200
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org, Enrik.Berkhan@inka.de,
        Michael Zaidman <michael.zaidman@gmail.com>,
        Andrew Robertson <andrew.robertson@ftdichip.com>
Subject: Re: [PATCH v4 00/13] HID: ft260: fixes and performance improvements
Message-ID: <Y26CrhASiOuPXOl3@michael-VirtualBox>
References: <20221105211151.7094-1-michael.zaidman@gmail.com>
 <nycvar.YFH.7.76.2211111109490.6045@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2211111109490.6045@cbobk.fhfr.pm>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 11, 2022 at 11:19:32AM +0100, Jiri Kosina wrote:
> On Sat, 5 Nov 2022, Michael Zaidman wrote:
> 
> > This patch series is an updated version of this one:
> > https://lore.kernel.org/all/20221030203403.4637-1-michael.zaidman@gmail.com/
> > 
> > Changes since v3:
> >   - Fixes for the kernel CI bot warnings
> >   - We now do not miss NACK on the wakeup from the power saving mode
> >     on the KVM installation reported by Enrik. For details, see
> >     https://github.com/MichaelZaidman/hid-ft260/pull/7
> > 
> > Changes since v2:
> > 
> >   - Remove SMBus Quick command support
> >   - Missed NACK from big i2c read
> >   - Wake up device from power saving mode
> >   - Fix a NULL pointer dereference in ft260_i2c_write
> >   - Missed NACK from busy device
> > 
> > Changes since v1:
> > 
> >   - Do not populate hidraw device
> >   - Avoid stale read buffer pointer
> > 
> > Michael Zaidman (13):
> >   HID: ft260: ft260_xfer_status routine cleanup
> >   HID: ft260: improve i2c write performance
> >   HID: ft260: support i2c writes larger than HID report size
> >   HID: ft260: support i2c reads greater than HID report size
> >   HID: ft260: improve i2c large reads performance
> >   HID: ft260: do not populate /dev/hidraw device
> >   HID: ft260: skip unexpected HID input reports
> >   HID: ft260: remove SMBus Quick command support
> >   HID: ft260: missed NACK from big i2c read
> >   HID: ft260: wake up device from power saving mode
> >   HID: ft260: fix a NULL pointer dereference in ft260_i2c_write
> >   HID: ft260: missed NACK from busy device
> >   HID: ft260: fix sparse warnings
> 
> Hi Michael,
> 
> this is now queued in hid.git#for-6.2/ft260.
> 
> Thanks,
> 
> -- 
> Jiri Kosina
> SUSE Labs
> 

Thanks, Jiri! Much appreciated.

Michael


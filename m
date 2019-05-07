Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 668851600C
	for <lists+linux-i2c@lfdr.de>; Tue,  7 May 2019 11:02:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbfEGJCS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 May 2019 05:02:18 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40417 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726473AbfEGJCR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 May 2019 05:02:17 -0400
Received: by mail-lj1-f195.google.com with SMTP id d15so13587753ljc.7;
        Tue, 07 May 2019 02:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=idf6J5BYIz2qpvZphx7IVfySZl6fHba9vEhZ9Dg+tNo=;
        b=JGZHfyKR1B4j0sfbqrtFouyX9ZlCy/oB6GalaN7JMdopZbtoSrycF7igkFh5PQMGAJ
         1A66do7+ckC4y9Dz/UMe4sUH8/0YWBPw02Rwx2KReYVEtkwq047CX5oTpvl2lprU9AKa
         lkM4P+M4M2Wl8eQbAoI4TTi795tE1R+MLctQfpsFyP2TFvyuOCg/oITxdsJunIFgWnht
         0FABCWn9ptiCJLqHREEql4DdM9BhVA8G8B81MZXFs1UzhzQsxnlFZU8p48iqsgV5uCbK
         kF4MaFaTWVaNPkeQgDcVmjVISVOSvbhFegQl2bWrPIgt6S7vLDvxtN1PNnUtnStGcTyX
         IDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=idf6J5BYIz2qpvZphx7IVfySZl6fHba9vEhZ9Dg+tNo=;
        b=FPPInpbyxAJOXnqs0M2iy2wDlKnvGotHe41RGGon/Kh/J3CpdIrWnMXVlp0u9KK56F
         ZxYbeCyC/Nx3oNJx79y40Hdio80jMS4ofQ6L9q93+iV1DbUR7Cpoq1xTlpngkskrU15a
         pg5E16mpFVzDD9j8t0/euma8h2SozxIX6AFWUNq1qDCKaDzDuMPmiHuUeJw8endFZewJ
         eHXMWMdgOpVnU1FlNYDAbin89A8xdJBDxbGE+Bx1tA6sNFM/P9d4vhw46c63edtk5DkR
         MWFb5oCoXwBIJrbG0QwAEZdKywCkBpKev2+sUIN1tpNAFuBOo8qyHiTHTCRIRyID7C8p
         jiFQ==
X-Gm-Message-State: APjAAAVSC/lzfV99y2pgkqbJ9Y5BHj9CZZ9NsNJ+O5AglHussHN4LxDh
        JPQ7QeXWOdFNuc+L58y3Y8U=
X-Google-Smtp-Source: APXvYqz2xL4Z6UGfAgNHY/bP4Obl7GW1M9Shr1U7Mt9s7z4K2QpPCDVnSuQA1Zq8DO3Q1hnR9xp+VA==
X-Received: by 2002:a05:651c:97:: with SMTP id 23mr5193077ljq.143.1557219734819;
        Tue, 07 May 2019 02:02:14 -0700 (PDT)
Received: from mobilestation ([5.164.217.122])
        by smtp.gmail.com with ESMTPSA id g13sm3138451lfh.49.2019.05.07.02.02.13
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 07 May 2019 02:02:14 -0700 (PDT)
Date:   Tue, 7 May 2019 12:02:12 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Peter Korsgaard <peter.korsgaard@barco.com>,
        Peter Rosin <peda@axentia.se>
Cc:     Serge Semin <Sergey.Semin@t-platforms.ru>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] i2c-mux-gpio: Split plat- and dt-specific code up
Message-ID: <20190507090210.hn6vgcjg2q6tysbp@mobilestation>
References: <20190424123414.25311-1-fancer.lancer@gmail.com>
 <20190425232028.9333-1-fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190425232028.9333-1-fancer.lancer@gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello folks,

Any updates on this patchset status? I haven't got any comment on v2, but
instead a notification about the status change was sent to me:

> * linux-i2c: [v2,1/3] i2c-mux-gpio: Unpin a platform-based device initialization
>     - http://patchwork.ozlabs.org/patch/1091120/
>     - for: Linux I2C development
>    was: New
>    now: Superseded
>
> * linux-i2c: [v2,2/3] i2c-mux-gpio: Unpin the platform-specific GPIOs request code
>     - http://patchwork.ozlabs.org/patch/1091122/
>     - for: Linux I2C development
>    was: New
>    now: Superseded
>
> * linux-i2c: [v2,3/3] i2c-mux-gpio: Create of-based GPIOs request method
>     - http://patchwork.ozlabs.org/patch/1091121/
>     - for: Linux I2C development
>    was: New
>    now: Superseded

I may misunderstand something, but how come the v2 patchset switched to be superseded
while it is the last patchset version I've sent?

-Sergey

On Fri, Apr 26, 2019 at 02:20:25AM +0300, Serge Semin wrote:
> The main idea of this patchset was to add the full dt GPIOs specifier
> support in i2c-mux-gpio driver. In particular we needed to have the
> full GPIOs specifier being handled including the flags like GPIO_ACTIVE_HIGH,
> GPIO_ACTIVE_LOW, GPIO_PUSH_PULL, GPIO_OPEN_DRAIN or GPIO_OPEN_SOURCE.
> Due to using a legacy GPIO interface the former driver implementation
> didn't provide this ability.
> 
> On the way of adding the full dt-GPIO flags support a small set of
> refactorings has been done in order to keep the platform_data-based
> systems support, make the code more readable and the alterations - clearer.
> In general the whole changes might be considered as the plat- and dt-
> specific code split up. In the first patch we unpinned the platform-specific
> method of GPIO-chip probing. The second patch introduces a new initial_state
> value field into the "gpiomux" structure. The third one is responsible for
> GPIO request loop isoltaing into a dedicated function. At this stage common
> it is a common function for both dt- and plat- code paths. Finally last
> patch introduces a full dt-based GPIOs request method, which uses
> gpiod_get_from_of_node() method in order to parse the corresponding dt GPIO
> specifiers with their falgs. The last patch does what we inteded this patchset
> for in the first place - adds the full dt-GPIO specifiers support.
> 
> Changelog v2
> - Remove fallback pattern when selecting the dt- or plat-based code paths.
>   (Cause the patch "i2c-mux-gpio: Return an error if no onfig data found"
>    removal.)
> - Use a dedicated initial_state variable to keep the initial channels selector
>   state. (Causes the patch "i2c-mux-gpio: Save initial channel number to the
>   idle" removal.)
> - Mention open-drain, open-source flags in the patchset descriptions.
> 
> 
> Serge Semin (3):
>   i2c-mux-gpio: Unpin a platform-based device initialization
>   i2c-mux-gpio: Unpin the platform-specific GPIOs request code
>   i2c-mux-gpio: Create of-based GPIOs request method
> 
>  drivers/i2c/muxes/i2c-mux-gpio.c | 226 ++++++++++++++++++++-----------
>  1 file changed, 146 insertions(+), 80 deletions(-)
> 
> -- 
> 2.21.0
> 

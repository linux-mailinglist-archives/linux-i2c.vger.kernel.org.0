Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E72815F8CC7
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Oct 2022 20:13:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230208AbiJISNv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 9 Oct 2022 14:13:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230156AbiJISNs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 9 Oct 2022 14:13:48 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 767CB248C4;
        Sun,  9 Oct 2022 11:13:46 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id bu25so13776881lfb.3;
        Sun, 09 Oct 2022 11:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=64cKJ1bXkuhfZtUIYbnBluC3FPEMFT8rqd0uaD8eans=;
        b=K4cQq6cyD+k42i7tzU0BYFT0WMpfPUjVqKnUynBg9KgsCylBM17N0rzP7qscv9J1GM
         n3hh23N7SR474rk3VT9NtA/UtXxjYD+H00vuJKRGjYvokiZBzkToJXOAcg/9h5UDkI4L
         zEaSJWY7VpjsqKu5Jsq1xlzRbVAcx6QqkELhuwIpgBm8kNR6HfgWEpVyyjs6gJ0oLvWk
         69erTDwe/yZD3YeA6uEY4wwiE93MVpd6b58S9bS0Lsa6wz6+h8KF/F91BB61QxjfhPmB
         O/LtbNgVSKqprSu+6T3Xn8tXIM4lgd+FhKd/ZBBuRvUqjhTuh2MZJslq2umrxBOIN3qu
         hZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64cKJ1bXkuhfZtUIYbnBluC3FPEMFT8rqd0uaD8eans=;
        b=a5/zmd7/ZssqLLtaJrFu3yHuQn2DeGGOkqpfi5yP0kf6p1Z+0LTtV5jr9GUjsVJCXU
         rvUyQmy6fFJ4HrKduaudyihyGzuhlnTR71+pxe9dilNNLLM/84Lj2v2P79f2R6i4Db50
         cVyxO8V4MnVL/HckHsn5IpOszr9xTG21plciK0aojv+N4DyA3ZpVVXlLPK9XlRbBVWGY
         +r1/xovH15jx2gI6rSDLkLW+ZYfr9Z2yOIFJTl2KCTyIsH7LS9GEHjpeYZ3havlSdFXu
         Zo2xafc7nLnz0uWLF6a+6moxKN7MshNRgbUOboO30ilcow6M0mFyu8k1AFrNy99+x+IY
         aDGQ==
X-Gm-Message-State: ACrzQf3/yyk6ppweRXqLhWl+cQ6q4Y5RjuwERRUUV57HdFpxtnT/26RS
        Ipp0mL1ojX/Pu3o6H0ZefpHZpVM/tww=
X-Google-Smtp-Source: AMsMyM6L/q++zCXe4GWeBrAPIwqG39fFbfBAIKnPh6MuiuyxdztOz8g4AVli9P9bJHXVMfV/21m3+g==
X-Received: by 2002:a05:6512:1309:b0:492:e273:d800 with SMTP id x9-20020a056512130900b00492e273d800mr5018765lfu.93.1665339224546;
        Sun, 09 Oct 2022 11:13:44 -0700 (PDT)
Received: from mobilestation ([95.79.133.202])
        by smtp.gmail.com with ESMTPSA id s1-20020a056512314100b00494a27500c1sm1101006lfi.163.2022.10.09.11.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Oct 2022 11:13:43 -0700 (PDT)
Date:   Sun, 9 Oct 2022 21:13:41 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>, robh@kernel.org,
        laurent.pinchart@ideasonboard.com, wsa@kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [v9 3/4] i2c: muxes: pca954x: Configure MAX7357 in enhanced mode
Message-ID: <20221009181341.z4j6vcf3ncwi7q5i@mobilestation>
References: <20221007075354.568752-1-patrick.rudolph@9elements.com>
 <20221007075354.568752-4-patrick.rudolph@9elements.com>
 <20221008125436.ndj2nwesx5lgppsf@mobilestation>
 <386fe4ae-0fae-0822-f86d-f5903369b424@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <386fe4ae-0fae-0822-f86d-f5903369b424@axentia.se>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Oct 09, 2022 at 06:36:52PM +0200, Peter Rosin wrote:
> 2022-10-08 at 14:54, Serge Semin wrote:
> > On Fri, Oct 07, 2022 at 09:53:52AM +0200, Patrick Rudolph wrote:
> >> +	u8 maxim_enhanced_mode;
> > 

> > So long name.( What about a shorter version, i.e. max(im)?_enh ?
> 
> No thank you, please keep the long name as is. This is a corner
> case and the name is not repeated that many times. Spelling it
> out makes the code more readable.

I don't insist. It was just a suggestion.

Anyway seeing there are going to be two variables with the flag
semantic (has_irq and maxim_enhanced_mode) it would be better to
convert them to a single quirk field. Moreover it will be useful
taking into account that a single maxim_enhanced_mode flag can't be
used to distinguish the Maxim I2C-muxes with the enhanced mode
disabled by default. Thus another flag will be needed for such
devices.

One more thing. Using u8 type for the flag variables isn't that
descriptive. It should be of the boolean type.

-Sergey

> 
> Cheers,
> Peter

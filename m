Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 939E95BB3EC
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Sep 2022 23:31:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbiIPVbb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Sep 2022 17:31:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbiIPVba (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Sep 2022 17:31:30 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF9EFB99C4
        for <linux-i2c@vger.kernel.org>; Fri, 16 Sep 2022 14:31:25 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id t70so21495329pgc.5
        for <linux-i2c@vger.kernel.org>; Fri, 16 Sep 2022 14:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=gAOpf4VaiyzuyzEgBlSDI/rb/mxIT2fGVc3O4sRyz8Q=;
        b=ESaZCkLet+Qy6/RvuyqCTnQHokSf4VLHnPureVwo7ogYklmGP1Sztila7n66Rd4Rpx
         p8mM7GZYSPEVPVnneskMYs3iQhwxLf9yo9KPvmptyMHSHdIHgLLpttwzX2mDEzYLLpST
         vioqg93hpJQCo9Uc4aIg3ueQPLLjc07hHzXxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=gAOpf4VaiyzuyzEgBlSDI/rb/mxIT2fGVc3O4sRyz8Q=;
        b=Veg/x0CYF9E9xIEnqHGblU/M7ETycmHwMhWJ49eHbNcjcwHhZzkBD0tjYrj8XLJOm2
         YjW4sSDToQ2B+2QViApqwEumU1F23rFZ/y8NI26VCTFsSkja46HwzXC349yz156QiUPY
         ZEqpM138F/OcRVz9C+vuOyNlkG5FWP8hzVopyleIgU3XymSkq3msoyqLWtcmNMAwpkoD
         nwZEwkJjeOSdyYSsJswVnC1o5ZzUdJIX1H4KKpYXJFl9HDa/RKSwZcDSBhf2gWqD8uYM
         pjPka/AbTwmsc9T0ojiQocV4FYcVdtvkl6ReuTu4SqMvOA83uSUKocPEWeTudNKl1pWO
         +XLg==
X-Gm-Message-State: ACrzQf0k6eqgMEw8q5KxVuLieMJBQGzk/zLS9nuoKFshxksIuQikb807
        pvMfT7kEJdXvH/DdsQOIekbQeA==
X-Google-Smtp-Source: AMsMyM6NXdExmvfrm3oknYIgGPotEd25We5Echz9dev/PyZDMj2iXCY/P49FQgqOgPGc3Lo0M3EjBQ==
X-Received: by 2002:a05:6a02:309:b0:434:d151:639e with SMTP id bn9-20020a056a02030900b00434d151639emr6100944pgb.124.1663363885331;
        Fri, 16 Sep 2022 14:31:25 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z11-20020a170902cccb00b00173cfaed233sm15307582ple.62.2022.09.16.14.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 14:31:23 -0700 (PDT)
Date:   Fri, 16 Sep 2022 14:31:22 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] i2c: mux: harden i2c_mux_alloc() against integer
 overflows
Message-ID: <202209160812.2B4AB7FC@keescook>
References: <YyMM8iVSHJ4ammsg@kili>
 <YyMt2cWtHC2SeG62@work>
 <YyMyKQnWgu0SL6jj@kadam>
 <202209160101.2A240E9@keescook>
 <YyQyfaI0WCsQ8F48@kadam>
 <202209160630.CF7AE9708D@keescook>
 <YySOewo2YUY+fk1l@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YySOewo2YUY+fk1l@kadam>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Sep 16, 2022 at 05:55:55PM +0300, Dan Carpenter wrote:
> On Fri, Sep 16, 2022 at 06:31:45AM -0700, Kees Cook wrote:
> > On Fri, Sep 16, 2022 at 11:23:25AM +0300, Dan Carpenter wrote:
> > > [...]
> > > net/ipv6/mcast.c:450 ip6_mc_source() saving 'size_add' to type 'int'
> > 
> > Interesting! Are you able to report the consumer? e.g. I think a bunch
> > of these would be fixed by:
> > 
> 
> Are you asking if I can add "passed to sock_kmalloc()" to the report?

Yeah.

> It's possible but it's kind of a headache the way this code is written.

Okay, no worries -- I was curious if it would be "easy". I can happily
just spit out the source line.

-- 
Kees Cook

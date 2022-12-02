Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C7E56410F9
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Dec 2022 23:58:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234097AbiLBW6Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Dec 2022 17:58:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234431AbiLBW6Y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 2 Dec 2022 17:58:24 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADB32EC097;
        Fri,  2 Dec 2022 14:58:23 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id q71so5527724pgq.8;
        Fri, 02 Dec 2022 14:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cy2UtKleeLZ3kCTVt2gRSimuxqebF9iiFVLTLadXDP0=;
        b=Z1NtWfRJ2Pg7CemAZIzrFBOCWuPIn7RSMFi6RoAzeS6olRw6B1f3Nlpu2Wht+Qh+gQ
         yWoK0RSdew+BIImtaRtQUmXluVvcoMiVRx+yjNtdg6xfZHm4zDjfoqybZDUqNI4i/9i/
         JTVgzBWqg20OfeBxeUNwb2ELA+GDZb136x3bmuoR5BCpXvtElO49HCmJQ9GttD6mNZCq
         wryJ1JfKxqVymMOMOC4wFrhA+V4QuFAqKmJyLRJ3LSeJCsGUAb+wwslbbDQ7KXzlSpdN
         afrEahOpAt+BMZSglyKz0gpICPWkLsSzjq4WDii6fuCJhcp/VlLo7pTDZgknxYNyg/Op
         JhoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cy2UtKleeLZ3kCTVt2gRSimuxqebF9iiFVLTLadXDP0=;
        b=xhXKqWpE0YrsGO6DzbS3UfZbkidrzQWoIPu9ZJvKtDD7Wb8eQ8BhLcaB56EUyDgooo
         +M6vFpvSAUmg4JzpRw+e84+H/TGU2q3E5/xF2DfN20fYX2rP3eLlGNcSSSss2EeOcJgF
         /ZADkC4Tesei1pWFDNyhfjUAL53a8MRuB7qMd4ZsTinMKT1mK0WWJFnSIlMucQOYs5BL
         bVayWnmGEumbx4SgnqLbE7TQuzHfPtYzjasFoqj9xDnqpsObwwcLux9hR2LJ5FLBUU18
         6Kdy6iYJkRgnwkmqiCknMBCwgjovCnw+aoDoL54txNr9EzvsCp+rBLtQXBl7bpCNMm7B
         c9TQ==
X-Gm-Message-State: ANoB5pkryg2Div36FhQ/EA4zLYrYGeUsflfTsF99zh00nFpfvkO738Uo
        nbrrOwXcdWwjZBfxIPucoEA=
X-Google-Smtp-Source: AA0mqf6iGptzkPyylz5aXaFP3Ox5LMMp7TxyY6+R8g9aDxlFLJAXywByHeKCQ6VpzuUiFaybEDPLfA==
X-Received: by 2002:a05:6a00:2ad:b0:575:3987:ea4f with SMTP id q13-20020a056a0002ad00b005753987ea4fmr25893916pfs.80.1670021902930;
        Fri, 02 Dec 2022 14:58:22 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:cc0e:e156:5def:3b2e])
        by smtp.gmail.com with ESMTPSA id c29-20020aa7953d000000b0057524960947sm5608419pfp.39.2022.12.02.14.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 14:58:22 -0800 (PST)
Date:   Fri, 2 Dec 2022 14:58:19 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 192/606] Input: adp5588-keys - Convert to i2c's
 .probe_new()
Message-ID: <Y4qDCwlohCFroCUE@google.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-193-uwe@kleine-koenig.org>
 <20221202105227.r3qhia3lgd6ee765@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221202105227.r3qhia3lgd6ee765@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Dec 02, 2022 at 11:52:27AM +0100, Uwe Kleine-König wrote:
> Hello Dmitry,
> 
> On Fri, Nov 18, 2022 at 11:38:46PM +0100, Uwe Kleine-König wrote:
> > From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > 
> > The probe function doesn't make use of the i2c_device_id * parameter so it
> > can be trivially converted.
> > 
> > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> I didn't get any feedback from your side about this patch set.
> 
> In case the problem is "only" to get the input patches out of this
> series, I recommend:
> 
> 	b4 am -l -s -P191-267 20221118224540.619276-1-uwe@kleine-koenig.org

Thanks, I was trying to figure out how to consume the relevant portion.
Applied now.

-- 
Dmitry

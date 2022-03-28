Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD9404EA1A0
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Mar 2022 22:37:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345231AbiC1Ujg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Mar 2022 16:39:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343629AbiC1Ujf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Mar 2022 16:39:35 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D529C4926D
        for <linux-i2c@vger.kernel.org>; Mon, 28 Mar 2022 13:37:53 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id a16-20020a17090a6d9000b001c7d6c1bb13so588498pjk.4
        for <linux-i2c@vger.kernel.org>; Mon, 28 Mar 2022 13:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=ftOkaLxffUNn0UIvFFh85pkRel4UoC8QUOBNdj53Afs=;
        b=CMKKR3lFgackfgTVVWESREwEUx3E+WL7J+TqfQNMRECiHz71yj/VeH6JyZYk0NyDhB
         vToP+xlnxA+ZmPYrusmxo9mH+CT2sh54WumswxVGETHc5hOC70yn6vIL+tl34Pla5K9J
         UN73/vaQJ3lQBFWlX45mH1p1lBRPThJeb2Lp9ZTteOUkLjj591CSWSNdmuU+LnB5lCmU
         4ELWEWErqKVc4wX3Jl1eaa7VO8RIMfZLO1+r6SZA875hDgJTQIsCtExjdExUlVgi3Qtf
         oIn5Hbb5LqIrQPOfcznXNOuCZcEMeSRhuAopNt3mAZR1y9YhzlR8HpVqNBncZSoNoeJD
         9szw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=ftOkaLxffUNn0UIvFFh85pkRel4UoC8QUOBNdj53Afs=;
        b=7IK3q/Wt0CgSugrjoHbE+J/MShtVsB6sb1RK4iVrgLPcmFq7pnANWC7Q6ygiHdIVgG
         pESfGyGgUq0ZthXvebaQs4DUBda5/Y9789C1lZnRv15clLI9AXMf9P+tclAsMmYExxL/
         jlt5No52f7sEd+CvULeVcv5TRnhZTPNx5phhW6u7MJVzIwT620uryWCqqg/ndooI2HZM
         oqWcFtm3FSx5PmTZF2nKPgbeWDsMIahiZt70Z+/VISCPf/a20/HpZoNLC6f3B9rQoHcR
         vD42V7/+P+f0q51ZjZCzp265o9wNUFl5BTd4eO/AaJMQlbNchb0yf3Jc2dgB7ZipEwDB
         +doQ==
X-Gm-Message-State: AOAM530K8LVLo9RRxGDFv5SeiR1OmyBkV0f8u06LPpJqUgHvR736LLak
        5zGp6mAswYyYuSEYb/+LfMKoxg==
X-Google-Smtp-Source: ABdhPJzbfjVSjIhRJrOwAxFCzWkGeHwmUnsNPA04svo6SzEJbPLyKsboopfOVOQ9GMFz58BrWkcXQw==
X-Received: by 2002:a17:90b:1d0e:b0:1c9:b74e:494 with SMTP id on14-20020a17090b1d0e00b001c9b74e0494mr921905pjb.238.1648499873342;
        Mon, 28 Mar 2022 13:37:53 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id k137-20020a633d8f000000b0039800918b00sm10033798pga.77.2022.03.28.13.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 13:37:52 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Lucas Tanure <tanure@linux.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lucas Tanure <tanure@linux.com>
Subject: Re: [PATCH 0/3] Ensure Low period of SCL is correct
In-Reply-To: <20220326102229.421718-1-tanure@linux.com>
References: <20220326102229.421718-1-tanure@linux.com>
Date:   Mon, 28 Mar 2022 13:37:52 -0700
Message-ID: <7hee2lu82n.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Lucas,

Lucas Tanure <tanure@linux.com> writes:

> The default duty cycle of 33% is less than the required
> by the I2C specs for the LOW period of the SCL clock.
>
> So, for 100Khz or less, use 50%H/50%L duty cycle, and
> for the clock above 100Khz, use 40%H/60%L duty cycle.
> That ensures the low period of SCL is always more than
> the minimum required by the specs at any given frequency.

Thanks for the fixes!

This is going to affect all SoCs, so ould you please summarize how your
changes were tested, and on which SoCs & boards?

Thanks,

Kevin

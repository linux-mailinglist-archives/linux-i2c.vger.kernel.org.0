Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4543064C77F
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Dec 2022 11:56:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237778AbiLNK4r (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Dec 2022 05:56:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237486AbiLNK4q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Dec 2022 05:56:46 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FDF7E024
        for <linux-i2c@vger.kernel.org>; Wed, 14 Dec 2022 02:56:46 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id g10so2907609plo.11
        for <linux-i2c@vger.kernel.org>; Wed, 14 Dec 2022 02:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=++Gb2lBFkve8gSRO08jWImahxW9f7wYHqGKRXd6CCqk=;
        b=ZuHbhCVHQ5/Vbs7yHy20WY/2sODWYzCNxqrrUnPubbka9QwUiFyRa5t8+3IPkBYYn3
         6cU6EiIT/p7UoDbDYuw1+r7PXsDGq5eJeAXOsx/6e0StGgxj9xZ+9F1TuyRHkkkdUX0C
         m/HlkmP68kTOLdp64++soEzCWGFZ26LYRVWCd/UYlYmdfU7c+2lb0YjKC8VBQ0mVWCZM
         s0IHFJgxDRXU7bDCV13nK+I4Kru/sdZep1qCGtmsXOIj0hpMYrAZzo/MmoxNUN/+W1cE
         7kPReEeqtU53/7zapaXILjNjwWBbzyoc7OFg4JaOPnAX8NqB8kCimdqYsYn/b5PuNjNL
         XwmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++Gb2lBFkve8gSRO08jWImahxW9f7wYHqGKRXd6CCqk=;
        b=7fyadRMzkEYmKM9+Qh5Rf21ee7piDOFnEjn/8POVe/EQLfTJ/YZwDipC0YejvjRZoJ
         VEyI5euiYej2XRi2wlMcp4vQytZcVRkkHXCepW0WQtH3dPNCADIyJ1LWL7bAD/pT6zWA
         Bh/AqGfg0QG5ysAJvOmT/Uye2OZpUpi6yH5nGwxQ52Et0iBVQFiV5ORuDuoSPUmnXTTL
         09KaFtRjBLfcXaCO1eyzEbRkq4pqaoDbN8fOmx3/KJYQgJVawAYQl4qfMEAkXNw4fi1c
         MMX/ST9MO7VEPOQTGLj4rozNmpwts2qZR40BxMj5/LDVl0mK5VNFpYPO3VEjZBFB5nOH
         KMSQ==
X-Gm-Message-State: ANoB5pkYykMzY6PLux4gdvkbmt89BZ9XPAuohyuSfP09XkqcbTAUGgJn
        3LOimUtrdWs0mtbF2m9WmeLnUQ==
X-Google-Smtp-Source: AA0mqf7D7DAodYs9+5h6TcqKnXht2atiHA5k/DDBcqIQMB3KebGhmUBUJ4B+4Xk+WZxsnbHSN1jOLw==
X-Received: by 2002:a17:902:f64b:b0:186:de2c:97e3 with SMTP id m11-20020a170902f64b00b00186de2c97e3mr23744609plg.54.1671015405704;
        Wed, 14 Dec 2022 02:56:45 -0800 (PST)
Received: from localhost ([122.172.87.149])
        by smtp.gmail.com with ESMTPSA id d22-20020a63fd16000000b00439c6a4e1ccsm8163703pgh.62.2022.12.14.02.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 02:56:44 -0800 (PST)
Date:   Wed, 14 Dec 2022 16:26:42 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Wolfram Sang <wsa@kernel.org>, mst@redhat.com, asowang@redhat.com,
        Conghui <conghui.chen@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org,
        Jian Jun Chen <jian.jun.chen@intel.com>
Subject: Re: [PATCH] MAINTAINERS: Update maintainer list for virtio i2c
Message-ID: <20221214105642.3xagckvbbgu5mubl@vireshk-i7>
References: <20221214053631.3225164-1-conghui.chen@intel.com>
 <20221214063107.fazrfq3n26hw4ndl@vireshk-i7>
 <Y5mjcuCRP45ynJis@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5mjcuCRP45ynJis@shikoro>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 14-12-22, 11:20, Wolfram Sang wrote:
> Dunno if this is really a rule, but if a maintainer steps out and makes
> sure there is someone to pick up the work, this is more than welcome.
> Way better than a stale entry in the MAINTAINERS file.

Sure, a stale entry is always bad.

> I mean, it does not limit the chance to have further maintainers, for
> example. I believe in meritocracy here. Those who do and collaborate,
> shall get responsibility. If not, then not. We can fix this, too, if
> needed.
> 
> What is the reason for your question?

It was a general question that I asked myself and didn't know an
answer to. I wasn't sure if adding someone to be a maintainer here to
a driver, which they haven't contributed to until now (at least based
on open source commits), is right or not, since this isn't a stale
entry in MAINTAINERS anyway.

An entry as R: would be okay normally IMO, as this makes sure
interested party is kept aware of the development in the area. An M:
entry somehow gives a higher level of authority to the person and
without any prior contributions, it feels tricky at least.

Anyway, I don't have any objection to the patch at least as it was
primarily developed by Intel engineers.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

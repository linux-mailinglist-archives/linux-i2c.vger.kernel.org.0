Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71EA828B11B
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Oct 2020 11:07:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727482AbgJLJHy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Oct 2020 05:07:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726428AbgJLJHy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Oct 2020 05:07:54 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51F7CC0613CE;
        Mon, 12 Oct 2020 02:07:52 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id lw21so22168446ejb.6;
        Mon, 12 Oct 2020 02:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WBP0ukfg4bFUZZ8QI0iTYDIdCmp1ksVWbobi3gjGmJA=;
        b=VKPM45KMaQStON5NAFbV9TPHSROxX4rvZ6xMY9f/mTEz8NZ08VJ6tKcUKtMOfa6Lh4
         S2Ok6+JlD39XR2ItQCTPe466/QYF+m5frXD0kFEPo6wceZtP+bc8yIo0CKqfu3MMerpQ
         xZvrlDBUa0tHdHz1evHWWx6Nns6S3CSiG5NPQqYKqav5iPccWLtSOGUnPf3+R724hQ38
         V4ZfGDyA42QzGGyCNI36tldOIS8Qs5RS9NqRvymVWhBe0aCFMgXyaUMba7up3Kca+V4H
         A9QTR1xpQ8I6WbNv8hZ1qbvk7QW6G01kxFRHMkJrWf8qZiE2cKq84Pv5SDoki89TDr9d
         9ORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WBP0ukfg4bFUZZ8QI0iTYDIdCmp1ksVWbobi3gjGmJA=;
        b=Jqp+DhLXxENg56AScfGhIFFVBGyt1HVRkJmEO4cMv6xxAFJCOBDpsWI0DoSSofUERN
         FNmexHrOpGfVyGGgEgFar0O7dRWh87AtD2kz6Z7qH+tV2340+5gaqpm19KUpBrwql5eB
         O7mWi/Z43O2wIRDs9wISvBX9RZHckBWdgiq0D80zZxsHBIR9GixJjgtwEawaT0yjgE1N
         VXIqXzi4G+zEq22uyGYERzBya3TA95jWbEyAl8cZj06kgzcd0fk6ZuhkpSL4CmEBydI4
         2c8TP9gnQD65S7M2WqWV0XTEhPEX+9cxG716y6/zC54H+Ugtt1p3JZjxBQgadEWEQ7Iy
         PMFQ==
X-Gm-Message-State: AOAM530a38t/oeZtf/ahYs1zMXr6Y7Yc7DgxyAbp8Xi2R1IcXRrJ5CPA
        VCJu6zlI5x7rBBuV/9Vxr68=
X-Google-Smtp-Source: ABdhPJzGtSWf6qZSdSdrnDLrLYkt+xop/WQnkOoCpLjW3n9eUhP+o6txr3NIKKXdR1SJKE/3AvmXXw==
X-Received: by 2002:a17:906:c015:: with SMTP id e21mr26451902ejz.432.1602493670667;
        Mon, 12 Oct 2020 02:07:50 -0700 (PDT)
Received: from ubuntu2004 ([188.24.159.61])
        by smtp.gmail.com with ESMTPSA id d1sm5003346ejo.17.2020.10.12.02.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 02:07:50 -0700 (PDT)
Date:   Mon, 12 Oct 2020 12:07:53 +0300
From:   Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org
Subject: Re: [PATCH 2/3] i2c: owl: Add support for atomic transfers
Message-ID: <20201012090753.GB73734@ubuntu2004>
References: <cover.1602190168.git.cristian.ciocaltea@gmail.com>
 <1af37112fafd6cf069dfe864560f77996f57d80d.1602190168.git.cristian.ciocaltea@gmail.com>
 <20201011140920.GB4971@Mani-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201011140920.GB4971@Mani-XPS-13-9360>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Oct 11, 2020 at 07:39:20PM +0530, Manivannan Sadhasivam wrote:
> On Fri, Oct 09, 2020 at 12:44:40AM +0300, Cristian Ciocaltea wrote:
> > Atomic transfers are required to properly power off a machine through
> > an I2C controlled PMIC, such as the Actions Semi ATC260x series.
> > 
> > System shutdown may happen with interrupts being disabled and, as a
> > consequence, the kernel may hang if the driver does not support atomic
> > transfers.
> > 
> > This functionality is essentially implemented by polling the FIFO
> > Status register until either Command Execute Completed or NACK Error
> > bits are set.
> > 
> > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Thanks,
> Mani

Thanks for reviewing,
Cristi

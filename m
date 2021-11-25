Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5853845D39D
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Nov 2021 04:28:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236074AbhKYDbl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Nov 2021 22:31:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238170AbhKYD3k (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Nov 2021 22:29:40 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CDE3C061395
        for <linux-i2c@vger.kernel.org>; Wed, 24 Nov 2021 19:21:23 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id o6-20020a17090a0a0600b001a64b9a11aeso4511482pjo.3
        for <linux-i2c@vger.kernel.org>; Wed, 24 Nov 2021 19:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kl9QFdxeQT+ZdNe5xXwILBYCvxJMvl+e0+hxIPhlJP4=;
        b=pY9LGPHk4GsETow/BIfhAVy1fXTYs03/BfFNQaCwQ1SISuth9VjsALMfDtZq9D9j9S
         57q+uDA5rg1jEJjrkHxKmjQNYOMln5BNr7w3l7J7ZALuGNHEOPgK2YpIFE2/DWh7ZS7I
         RXy+NTExlJBl8cwxLmBLHwH422jONNq4CUGBQm/TaQbto5AIH8l0a6kOrB6oE4ldrFFB
         c+UcJtGRmAhOmJJ+UYvchNkXNSgsazkwJFMZN9WTdQrJQSAlELG6x240gIc7Oz17nn6X
         S4PjitXePvbskGDuaqeTzEtXK3djDgrM9IND2Rc+E5/kGEjuEK/4WRISisYpuOyAmBin
         cEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kl9QFdxeQT+ZdNe5xXwILBYCvxJMvl+e0+hxIPhlJP4=;
        b=dHsP5l9hCjBkBK6PybP801TVwFFQfRuVdUAK0DUQ5gJCfYFpQVoxTQbkcX4TZ+Hfkn
         6/5FKEtNGJEyKtDiFFl3Lgm8u7TsLEyOJB3IhUUMaiabICqCIA5Hj9NYRmuElJWTfnNo
         1Yqiwsi5jPoa/ZZyD+1T239cZJILKyGqC32EQMrlsAjPySiHOC5FkigO2wl5LnH8HE8f
         vOPsS2MqXUqgXl++6Ap/kRvnizHUegyuC5PUpbpjzeLCpc49UuS9W6Bvip5lWhek9ZD2
         HUqOrITlAVycvHaKdkhcA9ztmSYiUx9kU+fiRh8yDStYW2tvO0RTMNfbqEZrXO9Qh3je
         tOrQ==
X-Gm-Message-State: AOAM5313GPuoyN9WTbQ/Ri7ocCI6Gwj2Y5rZxoNGrkMosecQonN1ETFx
        EksC9aAM6LUyKRV+srXu0AvjGA==
X-Google-Smtp-Source: ABdhPJxO6BHDZemocrThhO4FCIcZqEhKUZzepBue7p+e37VnZ16tNLPHS1GtahtspFNrmOnik+J2xA==
X-Received: by 2002:a17:90a:df88:: with SMTP id p8mr3090793pjv.32.1637810482599;
        Wed, 24 Nov 2021 19:21:22 -0800 (PST)
Received: from localhost ([122.181.57.99])
        by smtp.gmail.com with ESMTPSA id h13sm824811pgg.16.2021.11.24.19.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 19:21:21 -0800 (PST)
Date:   Thu, 25 Nov 2021 08:51:19 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Vincent Whitchurch <vincent.whitchurch@axis.com>, wsa@kernel.org,
        jie.deng@intel.com, conghui.chen@intel.com,
        virtualization@lists.linux-foundation.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@axis.com
Subject: Re: [PATCH v2 0/2] virtio-i2c: Fix buffer handling
Message-ID: <20211125032119.vklsh4yymwnalh5b@vireshk-i7>
References: <20211111160412.11980-1-vincent.whitchurch@axis.com>
 <20211124185546-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211124185546-mutt-send-email-mst@kernel.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 24-11-21, 18:55, Michael S. Tsirkin wrote:
> On Thu, Nov 11, 2021 at 05:04:10PM +0100, Vincent Whitchurch wrote:
> > This fixes a couple of bugs in the buffer handling in virtio-i2c which can
> > result in incorrect data on the I2C bus or memory corruption in the guest.
> > 
> > I tested this on UML (virtio-uml needs a bug fix too, I will sent that out
> > later) with the device implementation in rust-vmm/vhost-device.
> > 
> > Changes in v2:
> > - Added Acked-by and Fixes tags
> 
> 
> What are the plans for this patchset?

Wolfram applied the first patch, but not the second.

Wolfram, you can apply that one as well, it looks okay.

-- 
viresh

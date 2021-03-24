Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3FBF34716A
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Mar 2021 07:09:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233084AbhCXGJU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Mar 2021 02:09:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232733AbhCXGJK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Mar 2021 02:09:10 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 676FFC061763
        for <linux-i2c@vger.kernel.org>; Tue, 23 Mar 2021 23:09:10 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id ay2so7357503plb.3
        for <linux-i2c@vger.kernel.org>; Tue, 23 Mar 2021 23:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Bqt5VqMTy19a5DZTnPEjtlmJPD8x0Bwdpiw0tfEv6eY=;
        b=vv70pojJKiEe8f6oTbQ0b0U7rlPeg4FpS9sahXr59+djPyVocj+4q/NZMhvOED9fp9
         dgF43kz8Hb7kWXXV0JouEMCjqP8VGf5SaIEL6F3VzQxxTqHGeuYRlwz/sLUow95mL1Ae
         nLcLHe8u0vzJgMJpqg93ZCI4DiPwE1oaihnxOkVHt59aVBknuAjryVE7iCEJ/tHqrz0E
         KhnXIfCe9UC/FZ4Z6nWkN6rOAnb5IxN+7KmdUM7PowkZY7ygUwixs9mmRXGsnUGAyzlm
         rJ+5LSKzbAt+IPimhF4YpYwsutIFe4QV2pF4TkEA/OWjkTr0q1TmeSBg5fQizcc4tm52
         d6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Bqt5VqMTy19a5DZTnPEjtlmJPD8x0Bwdpiw0tfEv6eY=;
        b=NB5RjOrWcIKjtL6JW/driIDzz9MyREg6DvvP+4S8/Di2tdQdDfbw5Kj6VbqxEGyY2D
         LoGmkBymaDCMdJx/j6wn7WNRFPHcE1OSU+mJCZPB8EDOPVHJNG99hpfOOXVZBppVIVpK
         +YXi5xLZB4O+d+ZR8b9FCsB6RPKlQEiOw0besL9Qdvka+D4cefuTgoXzR5lEfeI6ynWV
         JZwprCghIX+6BR973D1pDKQQSQQ/dCUx2VZ/TO7vzW4t+PINROHhu8HB4l5qKPb8zLL3
         VAjz1opVT5R4zvLXmfLN3Aw/K/64yhLM4Fls6uMdbvBf3Vm46/bxQZJoHbkXSlldsAt0
         QBDA==
X-Gm-Message-State: AOAM533YFTRBIxwx5DLHBU0TKKUauSC+Eyeg38ME7JwHlj6m3aYy3aqa
        sNegayxQahklmUliqCjRGbTpyg==
X-Google-Smtp-Source: ABdhPJz72V1Ehz5QzUYV0UwpfeeT8qryCamqR7SxQrI7hMZDMn/PcdRxmU/vtj99/9xVVf+mF+DSAw==
X-Received: by 2002:a17:90b:3609:: with SMTP id ml9mr1906891pjb.142.1616566149898;
        Tue, 23 Mar 2021 23:09:09 -0700 (PDT)
Received: from localhost ([122.172.6.13])
        by smtp.gmail.com with ESMTPSA id a15sm1030237pju.34.2021.03.23.23.09.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Mar 2021 23:09:09 -0700 (PDT)
Date:   Wed, 24 Mar 2021 11:39:07 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jie Deng <jie.deng@intel.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, wsa@kernel.org,
        jasowang@redhat.com, wsa+renesas@sang-engineering.com,
        andriy.shevchenko@linux.intel.com, conghui.chen@intel.com,
        arnd@arndb.de, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com, Sergey.Semin@baikalelectronics.ru,
        rppt@kernel.org, loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com, stefanha@redhat.com,
        pbonzini@redhat.com
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210324060907.nwilmghg2xcdz7nv@vireshk-i7>
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <20210324042046.idkctj2t7cxi53jf@vireshk-i7>
 <70908366-c270-848e-0be3-c85fec7958ec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <70908366-c270-848e-0be3-c85fec7958ec@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 24-03-21, 14:05, Jie Deng wrote:
> For simplicity, the original patch sent only 1 message to vq each time . I
> changed the way to send

I missed those earlier discussions :)

> a batch of requests in one time in order to improve efficiency according to
> Jason' suggestion.

I agree.

> As we discussed in the previous emails, the device can raise interrupt when
> some requests are still not completed
> 
> though this is not a good operation.  In this case, the remaining requests
> in the vq will be ignored and
> 
> the i2c_algorithm. master_xfer will return 1 for your example. I will
> clarify this in the specs.

Right, this needs to be clarified that the receiver shall generate the interrupt
only once the virtqueue is empty, not in the middle of it.

Or, now that I think about it a bit more, another thing we can do here is see if
virtqueue_get_buf() returns NULL, if it does then we should keep expecting more
messages as it may be early interrupt. What do you say ?


-- 
viresh

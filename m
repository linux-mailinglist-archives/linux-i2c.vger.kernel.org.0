Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FBBE3D31CE
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jul 2021 04:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233183AbhGWBsE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Jul 2021 21:48:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233166AbhGWBsE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Jul 2021 21:48:04 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB8FDC061757
        for <linux-i2c@vger.kernel.org>; Thu, 22 Jul 2021 19:28:38 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id j8-20020a17090aeb08b0290173bac8b9c9so6955296pjz.3
        for <linux-i2c@vger.kernel.org>; Thu, 22 Jul 2021 19:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tAw85E8NXV/d5HgkTo259jtbI4ouhmcg6pjHUDSWPjc=;
        b=Q7CIwrCSaunZRhC18Xlo4DvY8+aN4ehQ8+o9kvikwLv3PHHcQ4BFGQhX9vu8e28p3/
         vuFeJmrPpxB4Ach1ym4qW9yJPyYnTIdLn4z3y/8Ihhe+s61EFqv8PjfvgMRR3rOXoUP6
         nLDsUlogdx/HTaxNHdkBk0SzAQKwDkCxTN4Oqz8nvr2FEtbdXnFJt5R4W4Zyb2+qRanh
         SiXn7ka7sLQPZSEj2AlCDkJF+v6Bf0C9cTO4QlY6svJJUVm5F07h6D/Zu4FYwIDkTdlN
         vRLbZA4Lxz5Wp3xNxNCxmu8OO3+cRKITygD40IWp+Q7X5t0CFpEdR9FGfbmsJD6CmHgQ
         g0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tAw85E8NXV/d5HgkTo259jtbI4ouhmcg6pjHUDSWPjc=;
        b=VpIIXHgFMpuHl6bSfF5gpFL6N2qFD1j/ArFD7jQ09UYEnPIbM+qeDoflIy+XRqnM4E
         TpgEdOxiR8jYrIF/0taJnKFlPN5F16BWLHIpaCUpqsRoIKM7xHyN4n/ajGgO01icl9TB
         gf+rdzUTgSVSyKWmAd/PeyH17WfNdOlH53XNT6KeB9+mwuLtm3NT64kLQMPVVXbxHiQZ
         Nm18BYq5i8c33zj/dg2ySbOjmfu5EeckgXz5toSpIpGmEjzbNNgzczmR+hM/vVqGPLaR
         rwhZqop6skSfuExzcSAvzZsxbaDUIw32Vo6rUJq6d/VbBmFY7AnH61Kc78/NZQgwdyEC
         +Z1A==
X-Gm-Message-State: AOAM530IKDkrdPzNw5QvMZ7DDABvwSQYWSvQu10oK60jVEoglv67Fw53
        D6X6LfIzle7LIhn1xTbJiM/WPeUNwPl2HA==
X-Google-Smtp-Source: ABdhPJxSWSpC//R2a9331w7aLWF4tUcZt/V6puU33PGp87Oq9CNUj0lUb/eotMn0lPyFT2oVs4VjiQ==
X-Received: by 2002:aa7:93ac:0:b029:32e:4fce:bde1 with SMTP id x12-20020aa793ac0000b029032e4fcebde1mr2586387pff.54.1627007318309;
        Thu, 22 Jul 2021 19:28:38 -0700 (PDT)
Received: from localhost ([106.201.108.2])
        by smtp.gmail.com with ESMTPSA id y15sm32865753pfn.63.2021.07.22.19.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 19:28:37 -0700 (PDT)
Date:   Fri, 23 Jul 2021 07:58:36 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Wolfram Sang <wsa@kernel.org>, Jie Deng <jie.deng@intel.com>,
        linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, jasowang@redhat.com,
        andriy.shevchenko@linux.intel.com, conghui.chen@intel.com,
        arnd@arndb.de, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com, Sergey.Semin@baikalelectronics.ru,
        rppt@kernel.org, loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com, stefanha@redhat.com,
        pbonzini@redhat.com
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210723022836.ews7bshlwcsaktud@vireshk-i7>
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <YNrw4rxihFLuqLtY@ninjato>
 <20210629101627.kwc2rszborc3kvjs@vireshk-i7>
 <YNr0uDx1fv+Gjd7m@ninjato>
 <20210629103014.nlk3mpetydc4mi6l@vireshk-i7>
 <YNr5Jf3WDTH7U5b7@ninjato>
 <YNr5ZRhT3qn+e9/m@ninjato>
 <20210705121832.fmye5xnlbydoc5ir@vireshk-i7>
 <YPmLoeLSPS1tfYUK@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPmLoeLSPS1tfYUK@ninjato>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 22-07-21, 17:15, Wolfram Sang wrote:
> Nope, I think you misinterpreted that. SMBUS_QUICK will not send any
> byte. After the address phase (with the RW bit as data), a STOP will
> immediately follow. len = 0 will ensure that.
> 
> msgbuf0[0] is set to 'command' because every mode except SMBUS_QUICK
> will need that. So, it is convenient to always do it. For SMBUS_QUICK
> it is superfluous but does not hurt.

Yeah, I think I was confused by this stuff.

> > If so, it would be difficult to implement this with the current i2c virtio
> > specification, as the msg.len isn't really passed from guest to host, rather it
> > is inferred using the length of the buffer itself. And so we can't really pass a
> > buffer if length is 0.
> 
> And you can't leave out the buffer and assume len = 0 then?

Would need a spec update, which I am going to send.

We would also need another update to spec to make the Quick thing
working. Lemme do it separately and we merge the latest version of the
driver for linux-next until then.

I checked the code with i2cdetect -q and it worked fine, I was
required to do some changes to the backend (and spec) to make it work.
I will propose the changes to the spec first for the same.

-- 
viresh

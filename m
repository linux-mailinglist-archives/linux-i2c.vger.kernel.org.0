Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A3CB3BBCC7
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jul 2021 14:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231243AbhGEMVM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jul 2021 08:21:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231186AbhGEMVM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jul 2021 08:21:12 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61D8FC06175F
        for <linux-i2c@vger.kernel.org>; Mon,  5 Jul 2021 05:18:35 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id f20so8637354pfa.1
        for <linux-i2c@vger.kernel.org>; Mon, 05 Jul 2021 05:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=u4GEMXqrVqxTiuERmBBzhK0c9EgdVjMcqN5EyjmdR60=;
        b=IxrUn1LmGvOtzScwNxvADvtlbcqMdlIb2lKdy744YfPAlPzhXlfo2xb9uEYNhFUHc6
         oWOSJUTSoMDUttRI0b9TaZts+dkOP1PuGqJdxM5Bo3BC/5IeLW8QaAG32wLD9HFPIHl5
         i1Rqz/8RbeQom8kwEmlCNkGMTIGSvV1IeYDAnrPMm0AZkWUQGrQF/oovTz+1ltVCAl6q
         Vtn0ta5A0zGr+Tag2SAH33SNdXKRGaTYASlihNvMApKV0tQAtkDTCS3uD47TBj+AFW4d
         S7IF0YH9w+6iSkvaAFUBSmx+W1s/0Vtbk9y2qF/s2AxjZBgy50hKCBsKS3h3tYas+WO2
         bzBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=u4GEMXqrVqxTiuERmBBzhK0c9EgdVjMcqN5EyjmdR60=;
        b=rpJGnO9dM93hY1hI1vZrPKcFu1OS0/y0m6QSIPmva9Gagmbw+FxhJs35VWO/1NNKlf
         BjxmzpL0XIkGKzTLNR0HOTQSk/jz8NqdecHdCpXpV0ETtF/76XK7Dr6banIAVqIA623F
         cnGyWTIsxH05M/mkwBIuVWbOdGgfyhc/qiO9P90iP6LvjRyTgcsaL3hwp1CEb2taWJ2g
         7R0Nes03L+9ulejX87qQQDgPfLuEZ1XzUmvG2K80RttLkrikUAyEOkhWA7+5Re8emZAe
         kMyrzxgoF854GwQZgOf1/3qOJ0WJDWjxB3Wseqzsi6+dqg5SD2dOofyurozELI6+nLZr
         58tA==
X-Gm-Message-State: AOAM530m2398I8jRLYx6Hlsu03G7VXcXKkU8HCL9zqOcR2tkvQaUvdL9
        wFHNZt1MWf5zRzwigCcO9IgkFA==
X-Google-Smtp-Source: ABdhPJyTYM9QsZt+DYXU859OWip3irzytNPEbNakK54hTszjXI/wJpcc+0dtyXT55ww9/BS+VBzBVA==
X-Received: by 2002:a63:f556:: with SMTP id e22mr15436308pgk.189.1625487514767;
        Mon, 05 Jul 2021 05:18:34 -0700 (PDT)
Received: from localhost ([106.201.108.2])
        by smtp.gmail.com with ESMTPSA id f17sm21157918pjj.21.2021.07.05.05.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 05:18:34 -0700 (PDT)
Date:   Mon, 5 Jul 2021 17:48:32 +0530
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
Message-ID: <20210705121832.fmye5xnlbydoc5ir@vireshk-i7>
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <YNrw4rxihFLuqLtY@ninjato>
 <20210629101627.kwc2rszborc3kvjs@vireshk-i7>
 <YNr0uDx1fv+Gjd7m@ninjato>
 <20210629103014.nlk3mpetydc4mi6l@vireshk-i7>
 <YNr5Jf3WDTH7U5b7@ninjato>
 <YNr5ZRhT3qn+e9/m@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNr5ZRhT3qn+e9/m@ninjato>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 29-06-21, 12:43, Wolfram Sang wrote:
> 
> > From the spec:
> > 
> > The case when ``length of \field{write_buf}''=0, and at the same time,
> > ``length of \field{read_buf}''=0 doesn't make any sense.
> > 
> > I mentioned this in my first reply and to my understanding I did not get
> > a reply that this has changed meanwhile.
> > 
> 
> Also, this code as mentioned before:
> 
> > +             if (!msgs[i].len)
> > +                     break;
> 
> I hope this can extended in the future to allow zero-length messages. If
> this is impossible we need to set an adapter quirk instead.

Wolfram,

I stumbled again upon this while working at the backend implementation.

If you look at i2c_smbus_xfer_emulated(), the command is always sent via
msgbuf0[0]. Even in the case of I2C_SMBUS_QUICK, where we set msg[0].len = 0, we
still send the buf. This is really confusing :(

Do I understand correctly that we always need to send msg[0].buf even when
msg[0].len is 0 ?

If so, it would be difficult to implement this with the current i2c virtio
specification, as the msg.len isn't really passed from guest to host, rather it
is inferred using the length of the buffer itself. And so we can't really pass a
buffer if length is 0.

Moreover, the driver uses i2c_get_dma_safe_msg_buf(), which also depends on the
length parameter here to allocate the buffer and copy data to it.

All in all, the latest version of the driver doesn't work with "i2cdetect -q <bus>".

To make it work, I had to add this:

diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-virtio.c
index 731267d42292..5b8bd98ae38e 100644
--- a/drivers/i2c/busses/i2c-virtio.c
+++ b/drivers/i2c/busses/i2c-virtio.c
@@ -73,6 +73,9 @@ static int virtio_i2c_prepare_reqs(struct virtqueue *vq,
                sg_init_one(&out_hdr, &reqs[i].out_hdr, sizeof(reqs[i].out_hdr));
                sgs[outcnt++] = &out_hdr;

+               if (!msgs[i].len)
+                       msgs[i].len = 1;
+
                if (msgs[i].len) {
                        reqs[i].buf = i2c_get_dma_safe_msg_buf(&msgs[i], 1);
                        if (!reqs[i].buf)

which made it I2C_SMBUS_BYTE instead of I2C_SMBUS_QUICK.

What should we do here Wolfram?


Jie, while wolfram comes back and replies to this, I think you need to switch
back to NOT supporting zero length transfer and set update virtio_i2c_func() to
return:

        I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);

Support for zero-length transfers and I2C_FUNC_SMBUS_QUICK can be added
separately.

Thanks.

-- 
viresh

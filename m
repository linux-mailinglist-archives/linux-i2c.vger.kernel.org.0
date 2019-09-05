Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4276A9E77
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2019 11:35:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387467AbfIEJet (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Sep 2019 05:34:49 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43165 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732508AbfIEJet (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Sep 2019 05:34:49 -0400
Received: by mail-wr1-f68.google.com with SMTP id y8so1872489wrn.10
        for <linux-i2c@vger.kernel.org>; Thu, 05 Sep 2019 02:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=pXNJ5zxAZdffoIhjgeNEzW79E8dcv18vdpXa7euQmqw=;
        b=sIWDPSa762NqP0jAqYvtDgXKYGJDvi3INGD/xgBdvJFSKvCGi0oicG9EtoYeblRFIH
         VbYG3uNcqdBzCiaVs5YAHpMFhVsfpQ5Y7jzBuGrP5uP5ndrIhK8RvE5YB+TqjCT/Pqee
         o2FnNt245G4HhUbLeNVwmiC0gfkWavIs1JKKYUG+hVq/G+eqJczbl1u7eBjWvPiOsGRE
         qTD0JVm4lLDxG79xIOJhVLLVOvDQPs+hAH++0sIRB2xNadNOmlTg9VP8ih5lUr1YUUTP
         OP4YiTMiqAe4xI/yI2VK1PRF7lq9AyltPtunxBiWSqv06+MVn60oLAw8qnWkclrJnzWI
         rbqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=pXNJ5zxAZdffoIhjgeNEzW79E8dcv18vdpXa7euQmqw=;
        b=E6iFiNCp9cCCXBnP5gkSg6hUFcSAcGOM8KisyEApQgEMfVGQC+WAAVw5+k3wwlBDsz
         pbZrYsA96fBOajOG0hOJEmMqrOjeXDbpyxma/7QYUrS+r/j7Y2M9zbI8/BQ3dD/9DH7W
         culbCetlA+UPiawpbnUGHmo9n83fMXUZhxAGSXkqDkRTYPEpV3ar/HdDzgeNKfviDry9
         y5KbBKmcMAILvsyM4JAYTTCfkYztInHYtVtruReWAWifbaVjjiVogdIJKy36W7O19QDs
         eo2gZtig6Vf49GEAdeMfXqoFOQqlzqPBgSUslbjYs5YPHSKxhDKZc25UFLCOJG2KoYY1
         pA0A==
X-Gm-Message-State: APjAAAV2pYkX9T2c0Kngr5AMjpT9Gvypk371rPE2SOPUY9Qg339vOHpA
        cmuz1kYGJinmGSCTSoMFjn8q0Q==
X-Google-Smtp-Source: APXvYqz+PlZ2++c+1pdnHHC8kczGTCTfRXI8OA/X49x2MsnB2O2SZaoocQz3z6r0C4XzJrFHZuK99g==
X-Received: by 2002:a5d:4247:: with SMTP id s7mr1786602wrr.110.1567676086829;
        Thu, 05 Sep 2019 02:34:46 -0700 (PDT)
Received: from dell ([95.147.198.36])
        by smtp.gmail.com with ESMTPSA id o9sm2221110wrh.46.2019.09.05.02.34.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Sep 2019 02:34:46 -0700 (PDT)
Date:   Thu, 5 Sep 2019 10:34:44 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>, alokc@codeaurora.org,
        agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: qcom-geni: Provide an option to select FIFO
 processing
Message-ID: <20190905093444.GE26880@dell>
References: <20190904113613.14997-1-lee.jones@linaro.org>
 <20190904203548.GC580@tuxbook-pro>
 <20190904212337.GF23608@ninjato>
 <20190905071103.GX26880@dell>
 <20190905091617.GC1157@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190905091617.GC1157@kunai>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 05 Sep 2019, Wolfram Sang wrote:
> > > It looks like a workaround to me. It would be interesting to hear which
> > > I2C client breaks with DMA and if it's driver can't be fixed somehow
> > > instead. But even if we agree on a workaround short term, adding a
> 
> So, are there investigations running why this reboot happens?

Yes, but they have been running for months, literally.

Unfortunately, since these are production level platforms, all of the
usual low-level debugging avenues (JTAG) have been closed off.  Also,
only a very small number of people have access to documentation, but
even those who are in possession are stumped.

Andy Gross did have one idea as to what might be happening, but it
turned out to be a red herring.

> > > Is there no other way to disable DMA which is local to this driver so we
> > > can easily revert the workaround later?
> > 
> > This is the most local low-impact solution (nomenclature aside).
> 
> I disagree. You could use of_machine_is_compatible() and disable DMA for
> that machine. Less impact because we save the workaround binding.

That could also work.

> > The beautiful thing about this approach is that, *if* the Geni SE DMA
> 
> I'd say 'advantage' instead of 'beautiful' ;)

Okay, "the advantage thing about ..." ;)

> > ever starts working, we can remove the C code and any old properties
> > left in older DTs just become NOOP.  Older kernels with newer DTs
> > (less of a priority) *still* won't work, but they don't work now
> > anyway.
> 
> Which is a clear disadvantage of that solution. It won't fix older
> kernels. My suggestion above should fix them, too.

Not sure how this is possible.  Unless you mean LTS?

> > The offending line can be found at [0].  There is no obvious bug to
> > fix and this code obviously works well on some of the hardware
> > platforms using it.  But on our platform (Lenovo Yoga C630 - QCom
> > SMD850) that final command, which initiates the DMA transaction, ends
> > up rebooting the machine.
> 
> Unless we know why the reboot happens on your platform, I'd be careful
> with saying "work obviously well" on other platforms.

Someone must have tested it?  Surely ... ;)

> > With regards to the nomenclature, my original suggestion was
> > 'qcom,geni-se-no-dma'.  Would that better suit your request?
> 
> My suggestion:
> 
> For 5.3, use of_machine_is_compatible() and we backport that. For later,
> try to find out the root cause and fix it. If that can't be done, try to
> set up a generic "disable-dma" property and use it.
> 
> What do you think about that?

Sounds okay to me.  Let me code that up.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

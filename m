Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63CCD33F15F
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Mar 2021 14:44:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231354AbhCQNng (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Mar 2021 09:43:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231344AbhCQNna (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 17 Mar 2021 09:43:30 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1164C06175F
        for <linux-i2c@vger.kernel.org>; Wed, 17 Mar 2021 06:43:29 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id bm21so2703114ejb.4
        for <linux-i2c@vger.kernel.org>; Wed, 17 Mar 2021 06:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ThARaZxD/3OUnNU9/bYmje+4H9d2E7bxAU0v//8RdlA=;
        b=VHo15d9gUnmvgPpklPTuqS4GOQ+mxM3D2rkQF784vK8jMzoXBvZut2ktwlPQqOgdaW
         uYWs5OKunxNbAS3YHQvwe0/8a7ffcs2nmHt6wtQr9QR6Z4LBT4YIE7mOBy6wLm2vfMCH
         +jD0E9qZiSvHZGRS1nojdtf71WEKJQ3+c2FYdGCX1++PzFujPlHcghtKQdCsBzM2FNbf
         KMRTOjldsuFOQ8I6loQEUbNHinC1+UOKjZheQS2Ej5VgqezUgcwiVksxB4tn3fh6mOBU
         lTUoVxrr8BdRCvNOi1DE52exCzDvKGu5Skqd6DGw3ebVZrtZylmL7kywCoirFMzKeNP6
         c2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ThARaZxD/3OUnNU9/bYmje+4H9d2E7bxAU0v//8RdlA=;
        b=ByeIykpxToJDX77SN0VQKCNuAxiHeYSsnmz0gvYn/8EQoij1IMegO5oYhswFMUuwmJ
         pZZ0M2xAn6Cb+AmAzZlgmp2PBJ+n+XU6TnVotDE/fuf/Lf/UQup7Z195mL+9t7ufRra3
         6C4P4kdo1H5JyhBqyLU0IOSka3f8rMOwapYs2SAR5wg38iM8U2+uLVWX9wWqzngT1xD/
         C8/4eZFo+CrXJCByy4reRIROsMdBfM3WNfF8ziZ0zIx0RmiQJydw0mfOt4xyQyDRUxDk
         5l11FYR+z7kRtAhPuSygsBosQPVsuyPSpyQX+16b3j1nkcU/kH7T9U9CL0uZIMgZcmhm
         Zk5A==
X-Gm-Message-State: AOAM531kA516Ezs3p0Uh3BtgY6GbnUg6VSm9T6r2THHv6C4Qs8fIUdct
        H4zSlmWjmWB+xR9+a1OgbMQ3oA==
X-Google-Smtp-Source: ABdhPJxCg6LIcSNSdFOee/L8SI6E4O/pBQ2ZwalwVYKeJlARiDNXt03k6rZqzch07xsVps0s0PKOpQ==
X-Received: by 2002:a17:907:76ed:: with SMTP id kg13mr33664258ejc.99.1615988608375;
        Wed, 17 Mar 2021 06:43:28 -0700 (PDT)
Received: from dell ([91.110.221.194])
        by smtp.gmail.com with ESMTPSA id u15sm13011965eds.6.2021.03.17.06.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 06:43:27 -0700 (PDT)
Date:   Wed, 17 Mar 2021 13:43:26 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     "Jonas Mark (BT-FIR/ENG1-Grb)" <Mark.Jonas@de.bosch.com>
Cc:     "Adam.Thomson.Opensource@diasemi.com" 
        <Adam.Thomson.Opensource@diasemi.com>,
        Wolfram Sang <wsa@kernel.org>,
        Support Opensource <support.opensource@diasemi.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "stwiss.opensource@diasemi.com" <stwiss.opensource@diasemi.com>,
        "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
        "RUAN Tingquan (BT-FIR/ENG1-Zhu)" <Tingquan.Ruan@cn.bosch.com>,
        "Streidl Hubert (BT-FIR/ENG1-Grb)" <Hubert.Streidl@de.bosch.com>
Subject: Re: [PATCH v6 1/1] mfd: da9063: Support SMBus and I2C mode
Message-ID: <20210317134326.GA2916463@dell>
References: <20210316162237.877436-1-mark.jonas@de.bosch.com>
 <20210316170722.GF701493@dell>
 <9d64829d35474258a53b6785c0265e1c@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9d64829d35474258a53b6785c0265e1c@de.bosch.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 17 Mar 2021, Jonas Mark (BT-FIR/ENG1-Grb) wrote:

> Hi,
> 
> > > From: Hubert Streidl <hubert.streidl@de.bosch.com>
> > >
> > > By default the PMIC DA9063 2-wire interface is SMBus compliant. This
> > > means the PMIC will automatically reset the interface when the clock
> > > signal ceases for more than the SMBus timeout of 35 ms.
> > >
> > > If the I2C driver / device is not capable of creating atomic I2C
> > > transactions, a context change can cause a ceasing of the clock signal.
> > > This can happen if for example a real-time thread is scheduled. Then
> > > the DA9063 in SMBus mode will reset the 2-wire interface. Subsequently
> > > a write message could end up in the wrong register. This could cause
> > > unpredictable system behavior.
> > >
> > > The DA9063 PMIC also supports an I2C compliant mode for the 2-wire
> > > interface. This mode does not reset the interface when the clock
> > > signal ceases. Thus the problem depicted above does not occur.
> > >
> > > This patch tests for the bus functionality "I2C_FUNC_I2C". It can
> > > reasonably be assumed that the bus cannot obey SMBus timings if this
> > > functionality is set. SMBus commands most probably are emulated in
> > > this case which is prone to the latency issue described above.
> > >
> > > This patch enables the I2C bus mode if I2C_FUNC_I2C is set or
> > > otherwise keeps the default SMBus mode.
> > >
> > > Signed-off-by: Hubert Streidl <hubert.streidl@de.bosch.com>
> > > Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
> > 
> > Applied with Wolfram's RB, thanks.
> 
> Thank you very much for your support to all reviewers.

Any time.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

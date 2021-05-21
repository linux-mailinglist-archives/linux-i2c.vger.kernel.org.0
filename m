Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13F4738C01F
	for <lists+linux-i2c@lfdr.de>; Fri, 21 May 2021 08:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233272AbhEUG60 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 May 2021 02:58:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234550AbhEUG6X (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 May 2021 02:58:23 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C3DAC06138A
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 23:56:18 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id o127so10497230wmo.4
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 23:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=QRBJ/Eb2aRuCWOAm83HDyHJya7fTP6YfpnFgiFNwPwY=;
        b=PeB4Jp8JKHMH5uEQrwTX9WwWGGtnm7DtrV2kA/LjtL5tSI0bfgpJOGSAo6u/0IEVk6
         h67RCcAk6TFLUZJSDdwCTNfXVi73dC17V+hpbVHefQNFzVOBvUdH1/N5KmxOn12tmY1S
         sJ74M26xKin7dgkNXa+nKfk65zowil1gx+FAc0TkcRI9fqC8+xWrW334zT6BFC5aRGjQ
         uT1DhyO9IGLX+Ork1BJWUEbtE6ya8RJvL+Gk1zuIqb39hVFqKXkY0mho/0FNVKI9X2Wa
         hiMyhy6KRtpY/UpnYUJOx6n7u2otwDen6HiRiuvxqyJxt2hR2M4HLO3YCfZIdxwGQliP
         hN1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=QRBJ/Eb2aRuCWOAm83HDyHJya7fTP6YfpnFgiFNwPwY=;
        b=XhNHMYXVQOvK5ogRnfom/OZ+BQ1FTuPRYRKJx8kEZACqAwUaRTJ0Y/w1Sabs7hPcga
         vbJQ9dgxXSCq6JweU/RP2g/W8adZPxAFKYxbzj1akIDPMlOXX7dHzaghPZCKm43sCAQW
         wjxCL9jjMa+qfxThxbBy1SZefRKtkSDuDsH9wokVBd1bDxTr56YsmeiWBmFfXcdige04
         txPL9Xpa1WbA3MDRtz7xPX/M1iYnFpeyUDBqJ0pcRWmKNHPLm8mOutIxqUSR8+90CafC
         gmUkgKH705GzCpjrR08A1Ibm7cU4gDSzOXqpTldiCi3HvEoJqcWwlKZz0GhEPT6MD5hK
         6xWA==
X-Gm-Message-State: AOAM532I/qpAkvXZYtA+5oOsu7R4r5CSEUXPlxgQKMfxkaDK31qMceGI
        PTU/XAOfH1/oztlR8iRG8gU2vw==
X-Google-Smtp-Source: ABdhPJyzLV7PPC84rvHhmIYLTph0ydZ+uf3f187PRPoIE3KWZx/cnNqbMnbz3GJLjExZVWUmgwHnNw==
X-Received: by 2002:a1c:6a0f:: with SMTP id f15mr5064918wmc.29.1621580177144;
        Thu, 20 May 2021 23:56:17 -0700 (PDT)
Received: from dell ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id n13sm960902wrg.75.2021.05.20.23.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 23:56:16 -0700 (PDT)
Date:   Fri, 21 May 2021 07:56:14 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc:     linux-kernel@vger.kernel.org, Max Schwarz <max.schwarz@online.de>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 12/16] i2c: busses: i2c-rk3x: Demote unworthy headers and
 help more complete ones
Message-ID: <20210521065614.GO2549456@dell>
References: <20210520190105.3772683-1-lee.jones@linaro.org>
 <20210520190105.3772683-13-lee.jones@linaro.org>
 <6083609.GXAFRqVoOG@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6083609.GXAFRqVoOG@diego>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 20 May 2021, Heiko Stübner wrote:

> Hi Lee,
> 
> Am Donnerstag, 20. Mai 2021, 21:01:01 CEST schrieb Lee Jones:
> > Fixes the following W=1 kernel build warning(s):
> > 
> >  drivers/i2c/busses/i2c-rk3x.c:242: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> >  drivers/i2c/busses/i2c-rk3x.c:261: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> >  drivers/i2c/busses/i2c-rk3x.c:304: warning: Function parameter or member 'i2c' not described in 'rk3x_i2c_prepare_read'
> >  drivers/i2c/busses/i2c-rk3x.c:304: warning: expecting prototype for Setup a read according to i2c(). Prototype was for rk3x_i2c_prepare_read() instead
> >  drivers/i2c/busses/i2c-rk3x.c:335: warning: Function parameter or member 'i2c' not described in 'rk3x_i2c_fill_transmit_buf'
> >  drivers/i2c/busses/i2c-rk3x.c:335: warning: expecting prototype for Fill the transmit buffer with data from i2c(). Prototype was for rk3x_i2c_fill_transmit_buf() instead
> >  drivers/i2c/busses/i2c-rk3x.c:535: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> >  drivers/i2c/busses/i2c-rk3x.c:552: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> >  drivers/i2c/busses/i2c-rk3x.c:713: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> >  drivers/i2c/busses/i2c-rk3x.c:963: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> >  drivers/i2c/busses/i2c-rk3x.c:973: warning: Function parameter or member 'i2c' not described in 'rk3x_i2c_setup'
> > 
> > Cc: Heiko Stuebner <heiko@sntech.de>
> > Cc: Max Schwarz <max.schwarz@online.de>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-rockchip@lists.infradead.org
> > Cc: linux-i2c@vger.kernel.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  drivers/i2c/busses/i2c-rk3x.c | 18 +++++++++---------
> >  1 file changed, 9 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
> > index 819ab4ee517e1..1dfbd1185aefc 100644
> > --- a/drivers/i2c/busses/i2c-rk3x.c
> > +++ b/drivers/i2c/busses/i2c-rk3x.c
> > @@ -238,7 +238,7 @@ static inline void rk3x_i2c_clean_ipd(struct rk3x_i2c *i2c)
> >  	i2c_writel(i2c, REG_INT_ALL, REG_IPD);
> >  }
> >  
> > -/**
> > +/*
> >   * Generate a START condition, which triggers a REG_INT_START interrupt.
> >   */
> >  static void rk3x_i2c_start(struct rk3x_i2c *i2c)
> > @@ -257,7 +257,7 @@ static void rk3x_i2c_start(struct rk3x_i2c *i2c)
> >  	i2c_writel(i2c, val, REG_CON);
> >  }
> >  
> > -/**
> > +/*
> >   * Generate a STOP condition, which triggers a REG_INT_STOP interrupt.
> 
> what made you decide between demoting and completing comments?
> I.e. here you demot the "static void rk3x_i2c_stop()", while below
> you for example complete the "static rk3x_i2c_get_spec()".
> 
> So I somehow do not yet see the pattern ;-)

Completeness.  This one is missing parameter descriptions, the one I
provided the function name to below, is otherwise complete.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

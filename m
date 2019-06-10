Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D41A33B00B
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2019 09:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388262AbfFJH5e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jun 2019 03:57:34 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35542 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388189AbfFJH5e (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jun 2019 03:57:34 -0400
Received: by mail-wr1-f67.google.com with SMTP id m3so8139390wrv.2
        for <linux-i2c@vger.kernel.org>; Mon, 10 Jun 2019 00:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=xTVf10rNwhHdq0na/JiMNEiN+1J2gR7CZjLBDvBlZ9M=;
        b=C/7BgS21M51i7i2CmNw0m1n793WHuwfoYQkS3WRWJWKQsQBxjw9CIy2+Faq9ymMTeV
         U2GBuJzPbjKCHDCazNCv3EufybIeE1wUBtLZaPDWMGaINHWIIzfHC+0p9nVF7beZGSBd
         //LURySsxd2kT8FOBdUsOWxnFZ+5dl+hoVq7XeFhuZowUdZd4O1UvhPIRq4tH0zazkBr
         3TnjUYgkVr92aniAKuyUF8QQKGfjozeMSXNOnfXAnZNynC+7HVoNCxcff8tCQ4ZbboQl
         zVeN/hmZoEiKQoXh76n41vtHuJpPK1irmunendNLi9m6ZVhJKXOgCoZBuaGpKeVJspaT
         PIVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=xTVf10rNwhHdq0na/JiMNEiN+1J2gR7CZjLBDvBlZ9M=;
        b=aL3+qWinVOV9XTi4+T/GACZS8Iy1Fs2AZI5NmEelg1yVDi9eq330ZScAeXACRAPy/0
         tJF4tvcpU8nGW1cDrPwaNpgp8/8we/uCXSleHPMEF+Pz6ltzT6iGF/8Nbp47UoLFeLML
         ZECnWmkaZwAtiGiz4CFiY7jpyHMgJtwcd6pejT6TXMsDBt+HBGHJUiTsiBAOMcnG6Fmi
         KwWEGMbaCpGqOtKEY+kLNCJhAxqywatXcpIjydz/3FYqmMpAKGv9ao+gQka3u0hzlFiA
         Y6vrlF5fgMJecdrDLFVAISdU/O+UCI4HKaTpvOvHxR3K756b9Lp5SE764o0NGSEYHsMi
         y+iw==
X-Gm-Message-State: APjAAAWJgNxGR6bmketTKgUZeGyfwpA92uQ0VLdcUOJPFiG7lNayS+MA
        cW4VcmrXUrnNuZTIHE9P88YLBw==
X-Google-Smtp-Source: APXvYqwPND89CTG631SsvW5xJabNs8hX8frrZKJyV7VaYPuMk/7oG5ltYmF1iH5bZQdZa0Uy/r0eCA==
X-Received: by 2002:a5d:6583:: with SMTP id q3mr47343484wru.184.1560153452753;
        Mon, 10 Jun 2019 00:57:32 -0700 (PDT)
Received: from dell ([2.31.167.229])
        by smtp.gmail.com with ESMTPSA id f13sm5796159wrt.27.2019.06.10.00.57.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Jun 2019 00:57:32 -0700 (PDT)
Date:   Mon, 10 Jun 2019 08:57:30 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>, alokc@codeaurora.org,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        jlhugo@gmail.com, linux-i2c@vger.kernel.org,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 3/8] pinctrl: msm: Add ability for drivers to supply a
 reserved GPIO list
Message-ID: <20190610075730.GH4797@dell>
References: <20190605114302.22509-1-lee.jones@linaro.org>
 <20190605114302.22509-3-lee.jones@linaro.org>
 <CACRpkdaEe3uKAsSuhbToevXH1cMsuMUvwaopLPuD+JkDTnuEnQ@mail.gmail.com>
 <20190608041044.GK24059@builder>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190608041044.GK24059@builder>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 07 Jun 2019, Bjorn Andersson wrote:

> On Fri 07 Jun 16:02 PDT 2019, Linus Walleij wrote:
> 
> > On Wed, Jun 5, 2019 at 1:43 PM Lee Jones <lee.jones@linaro.org> wrote:
> > 
> > > When booting MSM based platforms with Device Tree or some ACPI
> > > implementations, it is possible to provide a list of reserved pins
> > > via the 'gpio-reserved-ranges' and 'gpios' properties respectively.
> > > However some ACPI tables are not populated with this information,
> > > thus it has to come from a knowledgable device driver instead.
> > >
> > > Here we provide the MSM common driver with additional support to
> > > parse this informtion and correctly populate the widely used
> > > 'valid_mask'.
> > >
> > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > 
> > Exactly how we should use of the API, so if Björn can supply an
> > ACK to patches 3 and 4 I'm happy to apply them.
> > 
> > Björn?
> > 
> 
> I'm waiting for a version that does not specify the reserved_gpios for
> struct msm_pinctrl_soc_data sdm845_pinctrl {}, as this would override
> the ability of getting these from DT.
> 
> I haven't seen such revision yet, will review it once I find it.

Just testing it now.  It should be on the list by the time you start.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

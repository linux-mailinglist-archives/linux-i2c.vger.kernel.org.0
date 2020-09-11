Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABED0266332
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Sep 2020 18:12:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbgIKQLu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Sep 2020 12:11:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbgIKPhH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Sep 2020 11:37:07 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E765CC061757;
        Fri, 11 Sep 2020 08:35:52 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id n25so12802519ljj.4;
        Fri, 11 Sep 2020 08:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dLeT7KFOofVNutwmXWg7C/fdmcebGqCSDn3/nZjCzkw=;
        b=UcQ8GDd4FuKg1Z0S0GlIEt/Fvd6pdZfR/1e51QRBNnjS5POIP8uCnADrGHDr6oXXOu
         x0S4O08By+9kkDoMVoD6Hj9/+TP2OFRGvKa6Pok3Oy3gGnm2RnY9uwsP4YwsDnqEGnRI
         iiL5bsIs5CvoFJy0F4LxuiDOV9kVIqz2drn8fZU+x3fGaaZI+BADFvFR2J/xIHeBoI/I
         CwiEfKwP/1tAc29ZEuSZOzB5NotqrIqukilt+EUeufFqX6Zhi+nSH/JL5328Vr4Q3JB7
         tfXQk7QW5FH4goaEyw6x3G41AAR0J40G+Vv32/d1Atp5TwhWEJuUGkvu5GXFSWuV4vW2
         9yOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dLeT7KFOofVNutwmXWg7C/fdmcebGqCSDn3/nZjCzkw=;
        b=O6beAa/+OYxyhG+5J2Uor2bZ+9B6BcD5fWtWkBl6VcRZTAPpAwGUS79B7vCPgqw5Zv
         GVPV8gDFcjW0UG+1Axd4z+0pq5w0ut8cYAcmYnf1RPVUwxecNyQmPuZSz/7gVAlJO4kA
         aj7TxWHZivomYwrgGgjB9F4RqB7Mgh7Ajv2TEX+YRbtRQ15HdZ8pjuKMEYRycGikvdV9
         CFDxZrD/mCp02cC/paCHgzBSWYTLzI2Ra6+C9cVtpqZgGFLU/ywZudW/Ngfwqjqr8/Sh
         LVBMPxfjj6ovukENz4LZ8/Y6hkkDpBdfUwu99MareEKJyCjf+KbK+rU7mD1yJefDZhzo
         rLnw==
X-Gm-Message-State: AOAM532VURuG67bZPwMKMLLUuv1kGYF2bTp+VfSGD84qvLh96LJ2cTs+
        7hYKoHAGGgOMQmhtjF1IjpeD2WvqGe8vntu8Udj/gcHl
X-Google-Smtp-Source: ABdhPJwA4PboQ0BWGAdgY+oc/x6Vy1FsrhRIO6lD6QLIjA/ser05ZMlrveM8271V4Rnw3ZnCpg03naMgfx/rvuTI94I=
X-Received: by 2002:a2e:b4ca:: with SMTP id r10mr727487ljm.452.1599838551377;
 Fri, 11 Sep 2020 08:35:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200911150139.13690-1-matthias.schiffer@ew.tq-group.com>
In-Reply-To: <20200911150139.13690-1-matthias.schiffer@ew.tq-group.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Fri, 11 Sep 2020 12:35:40 -0300
Message-ID: <CAOMZO5C4h2weBX-cJRRcJbkPO9_wxHzn7fbNXXFYtnN5w+iCwg@mail.gmail.com>
Subject: Re: [PATCH] i2c: mxs: use MXS_DMA_CTRL_WAIT4END instead of DMA_CTRL_ACK
To:     Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Matthias,

On Fri, Sep 11, 2020 at 12:01 PM Matthias Schiffer
<matthias.schiffer@ew.tq-group.com> wrote:
>
> The driver-specific usage of the DMA_CTRL_ACK flag was replaced with a
> custom flag in commit ceeeb99cd821 ("dmaengine: mxs: rename custom flag"),
> but i2c-mxs was not updated to use the new flag, completely breaking I2C
> transactions using DMA.
>
> Fixes: ceeeb99cd821 ("dmaengine: mxs: rename custom flag")
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>

Thanks for the fix:

Reviewed-by: Fabio Estevam <festevam@gmail.com>

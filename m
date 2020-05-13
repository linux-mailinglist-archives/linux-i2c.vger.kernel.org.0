Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F21801D0A65
	for <lists+linux-i2c@lfdr.de>; Wed, 13 May 2020 10:01:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730105AbgEMIBG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 May 2020 04:01:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728101AbgEMIBF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 May 2020 04:01:05 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6FE3C061A0E
        for <linux-i2c@vger.kernel.org>; Wed, 13 May 2020 01:01:03 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id w7so19630005wre.13
        for <linux-i2c@vger.kernel.org>; Wed, 13 May 2020 01:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=qOmmunlWx5TbxpEYsCi6LXm1KoaU+vaRN5iuBeMyAvA=;
        b=wwGGIzfhjfM9NgXhcpJu8mIl16HfUpZxpzVQ0jfZyEuuJGGHo6S3WyOm4VQNJqtNJ/
         Zz93RR+VCNEoT+QCqEzG2uAUgNhcaMiybCUp+DobkeU64t8Za/EyWgGHc9O6Lx3oOsNM
         TPIQ/1bNv/yAs6qveLsyOUaJqV9S+l0LnS4N4ndUR6IBwgVktAZUDeGPg7lDs/1TbkiZ
         pizBletTSn7fUiS6rRNQXESiQuNFvoYgScCVqHaNRqRbl4ZwuzRVNOOOxtYuf6WvO1Ty
         thsS1053p4825+Sh7yU70apSzy1Va35O3gTFABx8YTEocfHcEsW9hfxnvgtZ1lcPFeY9
         umjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=qOmmunlWx5TbxpEYsCi6LXm1KoaU+vaRN5iuBeMyAvA=;
        b=KGuABTD7MS7/ucvyXd+PiYXCxqjkcWxvsdcCAQHe+P/72NyC3RaBCewayVLAYsG1ry
         sCGiqeojLa1CDwD2FbofmYGwMAsmvzSdftbNyZ4BL0HdTRwvUpNIlOKeXlXhfd0WQ7JM
         t4g4WadJoqG7F3YOKyz6sYCXT7XrDQZZfPjJpxhaGDeA7PiJKIl6sIQ5K05+IZlYtw/o
         zIZzNVF9x1r7a7TMUjlLFj+l3FgzG0BRPmeSBEdDPVpvYMEwkBkge1Nl1q7jdPbXVMDa
         wKVbWf6vU/btAmRRfuq8u/Vqcx47Lz0t0WmTRIZztySZmaQEbAxnSEWq5OwuFJ1h5H35
         1B8g==
X-Gm-Message-State: AGi0PuYYTLMh8+dGgaouBjOXyxn22bCeSip2ZxpbTLfqUiYF1t0piZgy
        KTWQLLfyUd5lEYnHZpeS5MhXsdsOpqo=
X-Google-Smtp-Source: APiQypLqRksq0eSlol4tSTwedgyaTVM2PgFckTaG8ma5JptZgQpiUumnGNrPnWn12cdi9hLSZsxIVQ==
X-Received: by 2002:adf:80d0:: with SMTP id 74mr15451539wrl.338.1589356862397;
        Wed, 13 May 2020 01:01:02 -0700 (PDT)
Received: from dell ([2.31.163.63])
        by smtp.gmail.com with ESMTPSA id c25sm33770259wmb.44.2020.05.13.01.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 01:01:01 -0700 (PDT)
Date:   Wed, 13 May 2020 09:00:59 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] video: backlight: tosa_lcd: convert to use
 i2c_new_client_device()
Message-ID: <20200513080059.GD3548@dell>
References: <20200326210959.13111-1-wsa+renesas@sang-engineering.com>
 <20200326210959.13111-2-wsa+renesas@sang-engineering.com>
 <20200417101446.GB3737@dell>
 <20200512162546.GG13516@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200512162546.GG13516@ninjato>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 12 May 2020, Wolfram Sang wrote:

> On Fri, Apr 17, 2020 at 11:14:46AM +0100, Lee Jones wrote:
> > On Thu, 26 Mar 2020, Wolfram Sang wrote:
> > 
> > > Move away from the deprecated API and return the shiny new ERRPTR where
> > > useful.
> > > 
> > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > ---
> > >  drivers/video/backlight/tosa_lcd.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > Applied, thanks.
> 
> Thanks! I don't see it in -next, though?

Just pushed.  Should be there soon.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

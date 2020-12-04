Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 442C92CEB4A
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Dec 2020 10:47:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728360AbgLDJqv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Dec 2020 04:46:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727430AbgLDJqu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Dec 2020 04:46:50 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 536A2C061A4F
        for <linux-i2c@vger.kernel.org>; Fri,  4 Dec 2020 01:46:10 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id d17so7742428ejy.9
        for <linux-i2c@vger.kernel.org>; Fri, 04 Dec 2020 01:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=13j7//U5ngAAwJ/+cKruaoMObrSqoN1DZscR3S47Ako=;
        b=hMRjcGrjmQsE+J2JLEUdAS62G7hoO/ZiYlUf7DBnIj5ngvK67B9n6RIo/3wgMPiwol
         OXY6H9VzG3g9+V9pD0ix5Vq6VHrb1gouXcZ0xBAb8EycOIhoIYBHfYH7StKrEyWk01v4
         Q+LPkOT/i1FoQWUk8hMudFUJLnk14jvmRGiFjRFp29Jmlljdt75yItEEa4idtYwwH6aN
         vqgyUoO4m4Lk+3Cs7JW9OTrOFxoRJZet9lXhmtr5bI022Js/eJbb8ut0S7CaH+xN4vRo
         Nc1KqYOmrIYHnjptq3bjMsOOcIaSpSuitAzETyzCTo5mMm0KmRGOuLfpUdH1Ed3vyDU4
         l8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=13j7//U5ngAAwJ/+cKruaoMObrSqoN1DZscR3S47Ako=;
        b=hbGhsWkxqxu5SMoMCRhM1BcfToWRF8R98YWcKRSCoajACAcF+5QHtVrGqUNRWjwk+o
         PxGXBwiAjAu4mtsTMMZe/KQupt5oTVWjX4Yz6iamVd4Zz3GTkIPGIFWz3B8vHmdmk2O+
         MMvL5ESNMWK+XxOhGWuRoiO88ebdLetkGXlOTRYn9v+3OSMxKy8BVAqCsnrntWkkbY69
         B8kPr5dk5p0XwY6xtX2eMDmZxqdnCH7kwwSojNyVkNAxSN0gcLZ18xScTBL0ZOznORis
         fTE73kisptuGiuw6QCCXLTxlGrdkPsLUE36lTRDFFAsYklf7L0xSoFGo9/vtMJORDG4W
         /pBw==
X-Gm-Message-State: AOAM532IF10IEGpURC+mUit+pNdVzEVxf8hNwkfVnn5u9ZI8vZI1VRg9
        dmwHt1yX978PYGbGnATQE45f8f9BIC89+VLiMlAJXUmngWQ=
X-Google-Smtp-Source: ABdhPJygQa2sSe05Xs+oK8luho4EHcatB4h+cHNF7dz6qjfLD8QecuHskOlOv3cTChSAqlcJP3eT2vKL8X/WPwLy8+c=
X-Received: by 2002:a17:906:3513:: with SMTP id r19mr6151541eja.445.1607075169050;
 Fri, 04 Dec 2020 01:46:09 -0800 (PST)
MIME-Version: 1.0
References: <20201203214703.18258-1-Diego.SantaCruz@spinetix.com>
In-Reply-To: <20201203214703.18258-1-Diego.SantaCruz@spinetix.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 4 Dec 2020 10:45:58 +0100
Message-ID: <CAMpxmJWL+gBAxe10KX2aYDFR2aWxDHCquewAdF5jvaqkY1pufQ@mail.gmail.com>
Subject: Re: [PATCH] misc: eeprom: at24: fix NVMEM name with custom AT24
 device name
To:     Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 3, 2020 at 10:47 PM Diego Santa Cruz
<Diego.SantaCruz@spinetix.com> wrote:
>
> When the "label" property is set on the AT24 EEPROM the NVMEM devid is
> set to NVMEM_DEVID_NONE, but it is not effective since there is a
> leftover line setting it back to NVMEM_DEVID_AUTO a few lines after.
>
> Fixes: 61f764c307f6 ("eeprom: at24: Support custom device names for AT24 EEPROMs")
> Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
> ---
>  drivers/misc/eeprom/at24.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index 35fabaf539b7..fbf69148b5ad 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -704,7 +704,6 @@ static int at24_probe(struct i2c_client *client)
>
>         nvmem_config.type = NVMEM_TYPE_EEPROM;
>         nvmem_config.dev = dev;
> -       nvmem_config.id = NVMEM_DEVID_AUTO;
>         nvmem_config.read_only = !writable;
>         nvmem_config.root_only = !(flags & AT24_FLAG_IRUGO);
>         nvmem_config.owner = THIS_MODULE;
> --
> 2.18.4
>

Goog catch, thanks. Applied to fixes.

Bartosz

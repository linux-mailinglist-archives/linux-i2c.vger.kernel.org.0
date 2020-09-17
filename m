Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C618126D5D9
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 10:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726217AbgIQIKV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 04:10:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726347AbgIQIGf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 04:06:35 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B614C06178A
        for <linux-i2c@vger.kernel.org>; Thu, 17 Sep 2020 01:06:19 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id z22so1972430ejl.7
        for <linux-i2c@vger.kernel.org>; Thu, 17 Sep 2020 01:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y5BAoQ8Ga3wPT4OqKnKaprIGJrT/HusINmypTex/K/Y=;
        b=fykaRfQxvrMFJBznzJC/4DXMvQdeEBXRCs0ipScrz7+TPQLj/PDg3NN+YFiRbyaU7B
         VJO+L2D9In6sycTN85X+zrnOPiWVZ33kF9HGFGbrlfbnwBg0dIdBOWuC8cNxDwuihD+J
         P4nRreyyL/zIRM0SJn02HVctVDiqEtYYyR9aenjUWScNfPljCalUFsOnwBCrcCH5quHp
         avU/HWv8vqjAsxTfDotKNqdqFIskXaAuxTC27+MdJAUeOCqeE5k1UsIomEze3gkAj2b5
         JGnjXp1o5yfQLIp4yFsLPzI+JNF8wTuvjEWgyYgf0V53kg0zkpIL/tM6lSUzO6kwWews
         MoMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y5BAoQ8Ga3wPT4OqKnKaprIGJrT/HusINmypTex/K/Y=;
        b=dBVAfdrEf30Adx3kS+zqm+iXkR+U/qfk2+ypgRsTbQLN05442gn1hW2Sw2GHKvb62A
         ngrPgcFZ+IlvNUEyc85natj/MXbYf0TyDOJuhmtfnVMJh8xm2NlYh7OPNvbwHo8u48LJ
         rs0ftSKocjxqpnwallIuMqDUJaClhpkCWhfE9ZaSMfQiv8ESIcGueq/VNzGgH74W69ol
         bHhDEjdQh3N/faST1QBu/SP+zBsnvD4XGUkkz9nMgCr+YvK6I+a9FR9hWaSN5eQ6j9w4
         3paUUI04Do1kbSohY7hBIEDL6SgdSLonkwROEQrAlVplHypUo8MG0qA27XhbiUQ9hJRb
         cZlA==
X-Gm-Message-State: AOAM533aeoLVgwxmj34cTLo/JtM6oMsNVmCJtm7qK/eRrdkvZtS0iXUh
        s/MToyPhTD8OieKav6dgbfQpt0HjPXs+r8wvHPdtdw==
X-Google-Smtp-Source: ABdhPJyVrvKr9O4Mdmci3LL1u8dOErH3YZeH/3QVImK3nZcr6/ha1wPAfWTKAntu/g6l2IcYVH8rCrQQSXatqi0ubnM=
X-Received: by 2002:a17:906:7489:: with SMTP id e9mr28986969ejl.154.1600329978090;
 Thu, 17 Sep 2020 01:06:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200916170933.20302-1-vadym.kochan@plvision.eu> <20200916170933.20302-2-vadym.kochan@plvision.eu>
In-Reply-To: <20200916170933.20302-2-vadym.kochan@plvision.eu>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 17 Sep 2020 10:06:07 +0200
Message-ID: <CAMpxmJXehV1R7FdgefxWL3aG9dZvtO1SQJdhL4MjDDbuGtuMhA@mail.gmail.com>
Subject: Re: [PATCH 1/3] eeprom: at24: set type id as EEPROM
To:     Vadym Kochan <vadym.kochan@plvision.eu>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 16, 2020 at 7:10 PM Vadym Kochan <vadym.kochan@plvision.eu> wrote:
>
> Set type as NVMEM_TYPE_EEPROM to expose this info via
> sysfs:
>
> $ cat /sys/bus/nvmem/devices/{DEVICE}/type
> EEPROM
>
> Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
> ---
>  drivers/misc/eeprom/at24.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index 2591c21b2b5d..800300296c74 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -678,6 +678,7 @@ static int at24_probe(struct i2c_client *client)
>                         return err;
>         }
>
> +       nvmem_config.type = NVMEM_TYPE_EEPROM;
>         nvmem_config.name = dev_name(dev);
>         nvmem_config.dev = dev;
>         nvmem_config.read_only = !writable;
> --
> 2.17.1
>

Queued for v5.10, thanks!

Bartosz

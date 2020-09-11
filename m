Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FB0C265ABC
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Sep 2020 09:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725823AbgIKHqG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Sep 2020 03:46:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725820AbgIKHp5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Sep 2020 03:45:57 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BEEEC061756
        for <linux-i2c@vger.kernel.org>; Fri, 11 Sep 2020 00:45:56 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id ay8so8975065edb.8
        for <linux-i2c@vger.kernel.org>; Fri, 11 Sep 2020 00:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H10t/PoYzFp2YJmus+JauG6BT44xTI8He+24ZzfKGuc=;
        b=iJSfcSRDOI0uj91Wf8MfSv/rALU7QF9mAKdWgTtdYgxxMFt80M8rsPWnXsXYMzUpZK
         xHebxWWZTzyE/epGDO1WpaKpE8SOrd0QpZqajO8z3MCuct47/WoledDN2wrpFrTVsELB
         C/Dyw6kPcsR4JDILPM/nBFjJEI3h0YHOinecmu1KOgC5RsTbTTEEaZwZDv4YHbWn9RIm
         ZviGWZDSck3+GZAMoo2bfIS1Lxd32PEiG9+OLmj4P9a/W52MoUUrfQmqYprssftujuh9
         DmCIv8Yi1GSnT8yjI/bThPIVd20V7UVAMCV+ydLH3qveG2n2iguoJxEkaBA2PVarhCv6
         2M+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H10t/PoYzFp2YJmus+JauG6BT44xTI8He+24ZzfKGuc=;
        b=YsL15DuyRjSsu3z8/Np9sn2Yy5zmwQrCByFKTWpRaZ2A0F6C6mAJ90KbCBUFZrLAOj
         TBpsgSFHNTSKXOE1PNJIyvbXXan9BI1hPKewDpgCA9ylyGbdPGCW3vumSQxNFPq5Nuyl
         2i8HZbT8cdtUqhkm/SUQcbBqZ1jhXWeei9W3DsLjRmDcRmCJvaTZ7Dr2ujLnotZh9D9y
         HxoFVfnxDpySJV9IcVifSGHAt4LJfF9r4IhNNyHNGUTDPsXVujIZ9cSbshWneRLUNTvw
         4Z+eRWfls+rZP9ieeokSxfMOFmXLNJC1+RFbAr5eO73E5tjJ8CYSUVbRUgcuPjdLJYJz
         RNYw==
X-Gm-Message-State: AOAM530xmISPpa97gZRjP1X8XUFPcjbY0FBfgku/yqHSxXfQh4e84yGy
        ymImVmZxCFZWzmAnEUsbmKMzadbthTK82vUAFV/A9w==
X-Google-Smtp-Source: ABdhPJzoAxY70MZcPNGWxyG6zQ6qr5FKoQPOg9NgPLDiF+Ir58RNLJLUI7l1ei3YibuFb2rBegUpdWQ+ccblZaesBJc=
X-Received: by 2002:a50:e79c:: with SMTP id b28mr712767edn.371.1599810354627;
 Fri, 11 Sep 2020 00:45:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200910134239.192030-1-jonathanh@nvidia.com> <20200910134239.192030-2-jonathanh@nvidia.com>
 <CAMpxmJXbhrmJJn4f3zk4=Y2tCwLzpFc+c6NbxcqVe8eaLSRvtw@mail.gmail.com>
 <88021f57-b8cf-d3d6-0e9c-19ed0bccb729@nvidia.com> <5afe9537-dc50-16ff-028e-b4539c6f924a@nvidia.com>
In-Reply-To: <5afe9537-dc50-16ff-028e-b4539c6f924a@nvidia.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 11 Sep 2020 09:45:43 +0200
Message-ID: <CAMpxmJUAhJmGA_3nKs51hF=08vY19U5Rpfz30DLgOOiTMuxjzA@mail.gmail.com>
Subject: Re: [PATCH 1/5] misc: eeprom: at24: Initialise AT24 NVMEM ID field
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 10, 2020 at 8:19 PM Jon Hunter <jonathanh@nvidia.com> wrote:
>
>
> On 10/09/2020 19:15, Jon Hunter wrote:
> >
> > On 10/09/2020 16:35, Bartosz Golaszewski wrote:
> >> On Thu, Sep 10, 2020 at 3:43 PM Jon Hunter <jonathanh@nvidia.com> wrote:
> >>>
> >>> The AT24 EEPROM driver does not initialise the 'id' field of the
> >>> nvmem_config structure and because the entire structure is not
> >>> initialised, it ends up with a random value. This causes the NVMEM
> >>> driver to append the device 'devid' value to name of the NVMEM
> >>> device. Although this is not a problem per-se, for I2C devices such as
> >>> the AT24, that already have a device unique name, there does not seem
> >>> much value in appending an additional 0 to the I2C name. For example,
> >>> appending a 0 to an I2C device name such as 1-0050 does not seem
> >>> necessary and maybe even a bit confusing. Therefore, fix this by
> >>> setting the NVMEM config.id to NVMEM_DEVID_NONE for AT24 EEPROMs.
> >>>
> >>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> >>> ---
> >>>  drivers/misc/eeprom/at24.c | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> >>> index e9df1ca251df..3f7a3bb6a36c 100644
> >>> --- a/drivers/misc/eeprom/at24.c
> >>> +++ b/drivers/misc/eeprom/at24.c
> >>> @@ -715,6 +715,7 @@ static int at24_probe(struct i2c_client *client)
> >>>
> >>>         nvmem_config.name = dev_name(dev);
> >>>         nvmem_config.dev = dev;
> >>> +       nvmem_config.id = NVMEM_DEVID_NONE;
> >>>         nvmem_config.read_only = !writable;
> >>>         nvmem_config.root_only = !(flags & AT24_FLAG_IRUGO);
> >>>         nvmem_config.owner = THIS_MODULE;
> >>> --
> >>> 2.25.1
> >>>
> >>
> >> This patch is correct and thanks for catching it. I vaguely recall
> >> wondering at some point why the appended 0 in the nvmem name for at24.
> >> Unfortunately this change would affect how the device is visible in
> >> user-space in /sys/bus/nvmem/devices/ and this could break existing
> >> users. Also: there are many in-kernel users that would need to be
> >> updated. I'm afraid we'll need some sort of backward compatibility.
> >
> >
> > Thanks, yes that is a problem. I guess for now we could explicitly init
> > to NVMEM_DEVID_AUTO or maybe just 0 so that it defaults to the same path
> > in the NVMEM driver. However, I am not sure how we can make allow some
> > devices to use NVMEM_DEVID_NONE and others use something else. This is
> > not really something that we can describe in DT because it has nothing
> > to do with h/w.
>
>
> Unless we make the configuration of the 'id' dependent on the 'label'
> property so something like ...
>
>         if (device_property_present(dev, "label")) {
>                 nvmem_config.id = NVMEM_DEVID_NONE;
>                 err = device_property_read_string(dev, "label",
>                                                   &nvmem_config.name);
>                 if (err)
>                         return err;
>         } else {
>                 nvmem_config.id = NVMEM_DEVID_AUTO;
>                 nvmem_config.name = dev_name(dev);
>         }
>
> Cheers
> Jon
>
> --
> nvpublic

Yes, this looks like the best compromise we can get for now. Please
make sure to document why we do this in the code.

Bartosz

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4375C4E89B5
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Mar 2022 21:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236523AbiC0T2G (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 27 Mar 2022 15:28:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236482AbiC0T2F (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 27 Mar 2022 15:28:05 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E4C84FC56;
        Sun, 27 Mar 2022 12:26:24 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id g22so3601098edz.2;
        Sun, 27 Mar 2022 12:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7u/IHZTMMNEVIvkjom8tFzhIxcFyM6SDAgEJE2XZMBs=;
        b=fHLY0qp1h4G6ii9QkujYyq2DRmTSsd41OpOa556+ei2awO97Ry2xWFfnKB6mhF3F1H
         9P/J6g2tox6UToZwadOC49Nvg1HF8nypXrvXYlynP+KgyxD74Bnp95THx/dUc7F+zvry
         cgT8KqRWaSP8U+8DfRj0c4pR19bOk4paBj+6hideJo8wIPmHsTBTlba2Mpbs2p2i1w2m
         Upr8IX5D8qXB0jQHGKaqMzJqVAYI6e1ei071+hkEktsH9/9D6w3DtwZNs/Hyqi38ZyUb
         mDF5Le062Y7+iAY8TjmlE/PfFZ00Ir092KsTYk9eBlJzxzigfDBVRpD0fPxENQ9RnYB+
         UXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7u/IHZTMMNEVIvkjom8tFzhIxcFyM6SDAgEJE2XZMBs=;
        b=Ukiwf5HYoWxRdy1sWfealXEVwlTEPCIV00lXX9FFPi1+MLHU8HuUYxCWPIowOWYNmn
         jGxNphL5nNMjUga3KZ5+dUDkyGqNWJnpEmiPtdOpfWV4pAPKnclivqeBc+T1nlZmGf6r
         mFkEqevpY9UdwzFLUdUHzd/YvNaBIeg2tcW6/f0knk4pxcW4yAOn7P//xwnKCn6pORnG
         aqHNHvThbkfCCDi6pwq+jc5poacj124BD/Lzx7TqMD4VGuNT+kaWXdeDa5+oacTtX3Mg
         mEy+BIF8mW6FWMZUsRWaFbsHtTaRJXMyl4Kr37a4BS6E0P94sqZU2V7Xegcx6YLTZqoF
         k6/g==
X-Gm-Message-State: AOAM5304iE3P/PKVaNB8j2rTtSNhdnUaemQfxrVhgn1i/N7IS7FU3znT
        OzW9qwhANen4ZGPQGP4FJkCxPmE1XWbg1+hwyS4=
X-Google-Smtp-Source: ABdhPJyK2hTyIsAuLrlbVXw+PJBRnlzwpn02DMMR/ZN9sPe0DbaesL/EmMd8iFQIMFPbTYjcJ0oNid8vmqPD1/bqhfo=
X-Received: by 2002:a50:e696:0:b0:419:998d:5feb with SMTP id
 z22-20020a50e696000000b00419998d5febmr12300413edm.122.1648409183140; Sun, 27
 Mar 2022 12:26:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220324234340.32402-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20220324234340.32402-1-laurent.pinchart@ideasonboard.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 27 Mar 2022 22:25:47 +0300
Message-ID: <CAHp75Vcf6Vhi4Fb-88HAKPLktqhGKAh7Snj00hEG4sk2hLD9Eg@mail.gmail.com>
Subject: Re: [PATCH v2] iio: dac: dac5571: Fix chip id detection for OF devices
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-iio <linux-iio@vger.kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Sean Nyekjaer <sean@geanix.com>,
        Jose Cazarin <joseespiriki@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Mar 25, 2022 at 6:55 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> From: Jose Cazarin <joseespiriki@gmail.com>
>
> When matching an OF device, the match mechanism tries all components of
> the compatible property. This can result with a device matched with a
> compatible string that isn't the first in the compatible list. For
> instance, with a compatible property set to
>
>     compatible = "ti,dac081c081", "ti,dac5571";
>
> the driver will match the second compatible string, as the first one
> isn't listed in the of_device_id table. The device will however be named
> "dac081c081" by the I2C core.
>
> This causes an issue when identifying the chip. The probe function
> receives a i2c_device_id that comes from the module's I2C device ID
> table. There is no entry in that table for "dac081c081", which results
> in a NULL pointer passed to the probe function.
>
> To fix this, add chip_id information in the data field of the OF device
> ID table, and retrieve it with of_device_get_match_data() for OF
> devices.

It's a good fix, but...

...

> +       if (dev->of_node)

Why OF nodes?!

> +               chip_id = (uintptr_t)device_get_match_data(dev);
> +       else
> +               chip_id = id->driver_data;

> +       spec = &dac5571_spec[chip_id];


What I would rather expect here is

const ... *spec;

spec = device_get_match_data(dev);
if (!spec)
  spec = (const ...)id->driver_data;

And don't use enum in the driver data with ugly castings.

-- 
With Best Regards,
Andy Shevchenko

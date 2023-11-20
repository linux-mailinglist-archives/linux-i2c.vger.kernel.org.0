Return-Path: <linux-i2c+bounces-303-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1857F1005
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 11:14:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42DE328211C
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 10:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B54F12B8E;
	Mon, 20 Nov 2023 10:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="UGcENXqJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E92EACF
	for <linux-i2c@vger.kernel.org>; Mon, 20 Nov 2023 02:13:59 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1ce675e45f9so9989185ad.3
        for <linux-i2c@vger.kernel.org>; Mon, 20 Nov 2023 02:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1700475239; x=1701080039; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e4CHijFD14Xxg2nzR9yrp9XXk5gOBgZhgDt97xki324=;
        b=UGcENXqJkfP9gvFqYp0Wv5Rfj74PoKsdf23GntM8pBrfEUYUjxI+JtKyBMfN0wUDsL
         IZCpJs+7B3PEfYzl7aeGmAHahRFG9fnXA0xjx3rb0qxej54bqbEMy8z4gesVMo1rR1VH
         SBYDfueczrbLEgUBRVUW2mI6tJwtnRzA9kxeipz5K2F7tg24a3z20BVs8dU/95S3VLaQ
         EZoXFQp3VTBb8/d8k1rupxUymT5JWql2Y9ww7N84aGaiNQ3N6xCo43EF6kXVTKzG1bxx
         T2sYtaGps65Pcv0IdaRGMqPb+isBfinJWgA9EX2nDjneEyPzlYUjZRPKNVVdk9koDAUW
         8U1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700475239; x=1701080039;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e4CHijFD14Xxg2nzR9yrp9XXk5gOBgZhgDt97xki324=;
        b=HfyWcerWbdSqwrYAx01A+HnFSlbZXufTiErc1nteFfsBaIIZh8YdtqroHzc0ulS6wz
         Wi4rItGIpIvOHt0Y9XqvE7i2lixscADjrWsDeYdT02d2qn/5II+ruMOHD360i9Gkferp
         jeR9F1nnCRWs3YGuJfhQPP3BHSbghkC5lhFMjY90DxUOoiE7e7WVR+g2meeg+WVcmGJS
         TVjikw7kgNc8YKJe27whEDimXJ6aZKAAVeSRQZhSOrKEm5L3Ux9QmVVnnE+/Laj6ECct
         QwII0YGhjbhyTNtzcfIK8PbAdNX0KfFQACM1IJ+7BQNNSJD54Jc9GAmHH5ie53K8Jgnk
         NVmA==
X-Gm-Message-State: AOJu0YwBgKP91BNf5bVAQu+nE8s3oPL4x6zNY8wJ5KP7GKuhiuBbE50m
	XzA0vMLhu4kKCDoQc1MlLqSqS9+aQQ3tof94EWwKMg==
X-Google-Smtp-Source: AGHT+IFxeznwRXbUI/ATv0ljCmhUfIlt2taW5Q9dqhCz/w1a8E3CS+tUVscaaFjOyu9FSokpE+ofKjokvND/rVJ3QKo=
X-Received: by 2002:a17:90b:38c1:b0:280:ff37:8981 with SMTP id
 nn1-20020a17090b38c100b00280ff378981mr4581829pjb.44.1700475239416; Mon, 20
 Nov 2023 02:13:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231109092328.3238241-1-naresh.solanki@9elements.com> <20231109092328.3238241-2-naresh.solanki@9elements.com>
In-Reply-To: <20231109092328.3238241-2-naresh.solanki@9elements.com>
From: Naresh Solanki <naresh.solanki@9elements.com>
Date: Mon, 20 Nov 2023 15:43:50 +0530
Message-ID: <CABqG17gj+NFQUrXByp07YMMh0aAhV7=szXuQfATu4DtRoB9BRA@mail.gmail.com>
Subject: Re: [RESEND PATCH v5 2/2] i2c: muxes: pca954x: Enable features on MAX7357
To: Peter Rosin <peda@axentia.se>
Cc: andi.shyti@kernel.org, robh@kernel.org, 
	Patrick Rudolph <patrick.rudolph@9elements.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi

I wanted to confirm whether there are any additional details or
modifications needed on my end to expedite the review
process.
I am more than willing to address any concerns or make
necessary adjustments to ensure that the patch is aligned

Regards,
Naresh

On Thu, 9 Nov 2023 at 14:53, Naresh Solanki
<naresh.solanki@9elements.com> wrote:
>
> From: Patrick Rudolph <patrick.rudolph@9elements.com>
>
> Enable additional features based on DT settings and unconditionally
> release the shared interrupt pin after 1.6 seconds and allow to use
> it as reset.
>
> These features aren't enabled by default and it's up to board designer
> to validate for proper functioning and detection of devices in secondary
> bus as sometimes it can cause secondary bus being disabled.
>
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
>
> ---
> Changes in V5:
> - Fix typos
> - Update comment
> - Add newline in dev_warn
> Changes in V4:
> - Drop max7358
> - Update #define
> - Move conf variable
> - Print warning when I2C_FUNC_SMBUS_WRITE_BYTE_DATA isn't supported
> Changes in V3:
> - Delete unused #define
> - Update pca954x_init
> - Update commit message
> Changes in V2:
> - Update comments
> - Update check for DT properties
> ---
>  drivers/i2c/muxes/i2c-mux-pca954x.c | 43 ++++++++++++++++++++++++++++-
>  1 file changed, 42 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
> index 2219062104fb..f5dfc33b97c0 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> @@ -57,6 +57,20 @@
>
>  #define PCA954X_IRQ_OFFSET 4
>
> +/*
> + * MAX7357's configuration register is writeable after POR, but
> + * can be locked by setting the basic mode bit. MAX7358 configuration
> + * register is locked by default and needs to be unlocked first.
> + * The configuration register holds the following settings:
> + */
> +#define MAX7357_CONF_INT_ENABLE                        BIT(0)
> +#define MAX7357_CONF_FLUSH_OUT                 BIT(1)
> +#define MAX7357_CONF_RELEASE_INT               BIT(2)
> +#define MAX7357_CONF_DISCON_SINGLE_CHAN                BIT(4)
> +#define MAX7357_CONF_PRECONNECT_TEST           BIT(7)
> +
> +#define MAX7357_POR_DEFAULT_CONF               MAX7357_CONF_INT_ENABLE
> +
>  enum pca_type {
>         max_7356,
>         max_7357,
> @@ -470,7 +484,34 @@ static int pca954x_init(struct i2c_client *client, struct pca954x *data)
>         else
>                 data->last_chan = 0; /* Disconnect multiplexer */
>
> -       ret = i2c_smbus_write_byte(client, data->last_chan);
> +       if (device_is_compatible(&client->dev, "maxim,max7357")) {
> +               if (i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_WRITE_BYTE_DATA)) {
> +                       u8 conf = MAX7357_POR_DEFAULT_CONF;
> +                       /*
> +                        * The interrupt signal is shared with the reset pin. Release the
> +                        * interrupt after 1.6 seconds to allow using the pin as reset.
> +                        */
> +                       conf |= MAX7357_CONF_RELEASE_INT;
> +
> +                       if (device_property_read_bool(&client->dev, "maxim,isolate-stuck-channel"))
> +                               conf |= MAX7357_CONF_DISCON_SINGLE_CHAN;
> +                       if (device_property_read_bool(&client->dev,
> +                                                     "maxim,send-flush-out-sequence"))
> +                               conf |= MAX7357_CONF_FLUSH_OUT;
> +                       if (device_property_read_bool(&client->dev,
> +                                                     "maxim,preconnection-wiggle-test-enable"))
> +                               conf |= MAX7357_CONF_PRECONNECT_TEST;
> +
> +                       ret = i2c_smbus_write_byte_data(client, data->last_chan, conf);
> +               } else {
> +                       dev_warn(&client->dev, "Write byte data not supported."
> +                                "Cannot enable enhanced mode features\n");
> +                       ret = i2c_smbus_write_byte(client, data->last_chan);
> +               }
> +       } else {
> +               ret = i2c_smbus_write_byte(client, data->last_chan);
> +       }
> +
>         if (ret < 0)
>                 data->last_chan = 0;
>
> --
> 2.41.0
>


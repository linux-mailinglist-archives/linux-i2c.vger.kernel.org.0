Return-Path: <linux-i2c+bounces-12445-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A71B3812C
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Aug 2025 13:36:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94CA75E6D97
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Aug 2025 11:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 759752D12F3;
	Wed, 27 Aug 2025 11:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xt1zNUAF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2122E228D
	for <linux-i2c@vger.kernel.org>; Wed, 27 Aug 2025 11:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756294575; cv=none; b=hZg7Xd9Obg/NyyXqqq4ZUkeoxUgYkHMIFg2coNwHHoh5DaGDnpTNvzbByaMHCWIabxzdK/eKaRJVtmEMtB36E2oD99HuHxoTOZUxgUyhIF/pA4pp9kl1bd+oJgetla7KtJ95Ry7t37v9iOG/mDFyUQE5HkjvTEIA5qe8Y+sm0Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756294575; c=relaxed/simple;
	bh=FT0s8kw41lh7XLh9ZK8YaBa3GcL4odZjd7FSA7DbHoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kVTzpY4dDhx6haG22ytsJMxCQuHffiZ4sTWqj2CabwaLk9VVAv1Ium30tWDJ6UJFH+KLwZwANuZwQAWL4iNkz80dzJrSakYnVNxQl0t7Q2dHEV0hVmB04MpsZd/FOW2j0rI+LAvxFNbHYiysCy6WeMMdEfV/WsbtXaLoovQjPAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xt1zNUAF; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e96d65194c1so2122084276.1
        for <linux-i2c@vger.kernel.org>; Wed, 27 Aug 2025 04:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756294572; x=1756899372; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9VG5xrATL8X/GcTcsX9nEHVjaVO8K7/6h5aarOYWFk8=;
        b=xt1zNUAFt+yDYkeiKcczQqR5vkn+9dPPTcLsrn1IxuFCfSfQSxjAD0EyL8IpgOTHE5
         BFx0B+q/4M8F4dY2lR4AbRWaQl20H2UQMN0xpLU10uK9wGRnXXiHWZJLrxO1K5TONCu8
         ofiI2PW09MSt1Wl3Zxg2ZETUGn0u2S7Js81qzJYjMfH52LBMHW3c8kpHfcNr0C2htiRK
         MoVsQv4YaAvyWJ1suLKAuUa/0Q5LON/Kw5NeqTsTZ/XNPOYx6z+KcVnQt3/ZxCcHGp46
         Ely5/Xg7tz3EJ+3mEVoaD8A0u6EWJ5xofwPTFy9pRylAjxJ7pz1nJ7KNfUAud+I2XtLR
         XeOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756294572; x=1756899372;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9VG5xrATL8X/GcTcsX9nEHVjaVO8K7/6h5aarOYWFk8=;
        b=mQd96iXyZemOc977W0SLrXciCSAtgBo3DUMCVT5oXMzAGYIJnMwlMQdcHtFaPm5yEb
         Pq36aldIpXswr7iNftn797AF82hM6see0YMKdU8TZxt0aVUDj6gDivMD0lTzN4dfaZnw
         qDzBf3WcoOMf8hQt1mTz4Z12TqH8sn/LGRCQUR5kTNL/iTVjbGwnX0jBixO+1FG6bg39
         qD4jOCrcyKmC95MoWcA5G55c2SN9OECy6mRt4e1s+EfVwYWk+s0jwIk5xdlwiJuWHaI8
         bOLrVWCW8LG7kRyd12jhcRvBgzuW/zo0yQ0TKqY1BXwkdSUcEp/OhA/jJFhTxaj29wY0
         eyxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvBypVbbc7iW9RNjy4KtfWBl42yQIxxVlOU9y4cdiO7gaYksJUmWbyU1YduXzxNeDh2GyV/dVdClU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPOkONNJNdbJK2f53aMO3gNh/QaeQdVdSjtw82YcVz9N6l0Edw
	l3goc/4kh74w5hfK5rLjiTkxpfqPi7TPw/GgN3j7ipA1AI/lA4+z+vO8IHo8k+bYoHRoOzYFkBl
	AfWFVuN7BSmx7p/fZ1TV0s5ZUY7IEIoxvwqD1YiT9aA==
X-Gm-Gg: ASbGncv+PJr7tgxuhtopZXJbvgpcYNwcS64feAr/uf+DWk0OGBUJZ3FhuNnPD8it0b/
	PaAZBIJTV6sjH4JIzRE3V6AnSmnQS1z/OYWHRx1zfm6Gv0uOtYshkqelwIa0V7vIogUYEWR419O
	lychhz2DabVaZklyC8hrsHHMC4tt/mHtnipm7+W/YjVNX/P2G2bRAq93V5bjnIhoCo0vENNRXnA
	fOZaqI=
X-Google-Smtp-Source: AGHT+IHKFPj5se1K7TYn6o3xFEaQCORUTR5JU3Zz8jDmN5IorKGz4Sl4irmTDH6t99CaaG/n52EPWeLeIcLYaaef9zY=
X-Received: by 2002:a05:690c:3808:b0:720:79a:b0c4 with SMTP id
 00721157ae682-720079ab737mr138986057b3.17.1756294572360; Wed, 27 Aug 2025
 04:36:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250827101042.927030-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250827101042.927030-1-claudiu.beznea.uj@bp.renesas.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 27 Aug 2025 13:35:36 +0200
X-Gm-Features: Ac12FXzduobe0L7ACBcxkpyV4d-PlCOk6ENFZ0k5sNARMGhUMtFGdjUDbeEXDao
Message-ID: <CAPDyKFoY0v9Eq=YqECytfs4Tb8aaqJ+gKmEarqZ7EpHjYzigvQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: core: Drop dev_pm_domain_detach() call
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: wsa+renesas@sang-engineering.com, rafael@kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Aug 2025 at 12:10, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Starting with commit f99508074e78 ("PM: domains: Detach on
> device_unbind_cleanup()"), there is no longer a need to call
> dev_pm_domain_detach() in the bus remove function. The
> device_unbind_cleanup() function now handles this to avoid
> invoking devres cleanup handlers while the PM domain is
> powered off, which could otherwise lead to failures as
> described in the above-mentioned commit.
>
> Drop the explicit dev_pm_domain_detach() call and rely instead
> on the flags passed to dev_pm_domain_attach() to power off the
> domain.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe


> ---
>  drivers/i2c/i2c-core-base.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index ecca8c006b02..ae7e9c8b65a6 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -573,7 +573,8 @@ static int i2c_device_probe(struct device *dev)
>                 goto err_clear_wakeup_irq;
>
>         do_power_on = !i2c_acpi_waive_d0_probe(dev);
> -       status = dev_pm_domain_attach(&client->dev, do_power_on ? PD_FLAG_ATTACH_POWER_ON : 0);
> +       status = dev_pm_domain_attach(&client->dev, PD_FLAG_DETACH_POWER_OFF |
> +                                     (do_power_on ? PD_FLAG_ATTACH_POWER_ON : 0));
>         if (status)
>                 goto err_clear_wakeup_irq;
>
> @@ -581,7 +582,7 @@ static int i2c_device_probe(struct device *dev)
>                                                     GFP_KERNEL);
>         if (!client->devres_group_id) {
>                 status = -ENOMEM;
> -               goto err_detach_pm_domain;
> +               goto err_clear_wakeup_irq;
>         }
>
>         client->debugfs = debugfs_create_dir(dev_name(&client->dev),
> @@ -608,8 +609,6 @@ static int i2c_device_probe(struct device *dev)
>  err_release_driver_resources:
>         debugfs_remove_recursive(client->debugfs);
>         devres_release_group(&client->dev, client->devres_group_id);
> -err_detach_pm_domain:
> -       dev_pm_domain_detach(&client->dev, do_power_on);
>  err_clear_wakeup_irq:
>         dev_pm_clear_wake_irq(&client->dev);
>         device_init_wakeup(&client->dev, false);
> @@ -636,8 +635,6 @@ static void i2c_device_remove(struct device *dev)
>
>         devres_release_group(&client->dev, client->devres_group_id);
>
> -       dev_pm_domain_detach(&client->dev, true);
> -
>         dev_pm_clear_wake_irq(&client->dev);
>         device_init_wakeup(&client->dev, false);
>
> --
> 2.43.0
>


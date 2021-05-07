Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20A95376BF7
	for <lists+linux-i2c@lfdr.de>; Sat,  8 May 2021 00:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbhEGWBl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 May 2021 18:01:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbhEGWBl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 May 2021 18:01:41 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1400C061761
        for <linux-i2c@vger.kernel.org>; Fri,  7 May 2021 15:00:40 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id n32-20020a9d1ea30000b02902a53d6ad4bdso9172442otn.3
        for <linux-i2c@vger.kernel.org>; Fri, 07 May 2021 15:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=pHGpBPn7Vn0QhtA1pV17/jRpabR6QCqZfLFyPRSi3+8=;
        b=MtRUWN3NdIe8WJV5L1m4UKE/6IVj0lSLJ9hd9+q9hT6VZvQ/OvZRj68oY8kQ9VEQdK
         Bm0Wgonsj09qR6/gDPJ61+gO20a0XDTGgacgRCt2On6rs/PBFgorX+VpYnClx2hAaUKt
         GtDUlqNIqG/8p0S3N9Gd4xOUWdvTs5y9FtyefnRxLd+zRps93/Uara/r+Xo3j80jR2um
         EsQZl/BvDZ4qM3cfcX+xQLjdE+n9E9N5QbPP1bcjCpxWo3AXsEsX3DkOwH/VhOM6di7f
         ApPg3zZC1rY8XJbaQId5JFVgrpJ0lVwOGTFuqEKJgxoBb39JtNEcrd8EHh90jo4h56gc
         9c0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=pHGpBPn7Vn0QhtA1pV17/jRpabR6QCqZfLFyPRSi3+8=;
        b=YEIVpz0MUzpVeJsfpAaZBKUFGUAZvrAeqKnjpCYlJMxXv6ILJU7sEDkJdBdIQYiTs4
         P7onHOFaFudAeLIBe/1wPIyVO0pR1Ff+qKxaOlhxpBBtjk08k6j9cED+qa9lFA+JtAvz
         DsyNQ95c0SR3Gron2feaJh17N3ElxGcU+htmXOimC5vrDCScCFqrHcXBP3lgnFWFLSVx
         wYnAApOW6xJtxYOElNlH2aG0z6kQYePetaR9hmFMa/nE8KLgFBmhykCU3bieFJvuoQjP
         ACy3gsLsFCGMEwY0K1+TRZ9U3GcMPJWK9gOv6b8NWDyRrSIB0MaIC5qncR7CzCgwEzzN
         s5Hg==
X-Gm-Message-State: AOAM532qYZoknx6yAmvkUwIu+YqqDivDKHVR14l3k3Sczg1CQLPJLUol
        LZvd/ke4nkBBLlhS/XkBYwtJBw==
X-Google-Smtp-Source: ABdhPJwml4NJxDp+z8QnYGmN/27SVl0D/MkeGXJRaGlqAQ75zZ3MDGKIZ8gR6NgZhWHnOQQaau97TA==
X-Received: by 2002:a9d:728b:: with SMTP id t11mr5850135otj.230.1620424840128;
        Fri, 07 May 2021 15:00:40 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w66sm1327673ooa.37.2021.05.07.15.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 15:00:39 -0700 (PDT)
Date:   Fri, 7 May 2021 17:00:36 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Lyude Paul <lyude@redhat.com>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>,
        Ville Syrjala <ville.syrjala@intel.com>,
        Steev Klimaszewski <steev@kali.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Linus W <linus.walleij@linaro.org>, robdclark@chromium.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thierry Reding <treding@nvidia.com>, linux-i2c@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/5] drm/dp: Allow an early call to register DDC i2c
 bus
Message-ID: <20210507220036.GI2484@yoga>
References: <20210503215844.2996320-1-dianders@chromium.org>
 <20210503145750.v6.2.Iff8f2957d86af40f2bfcfb5a7163928481fccea4@changeid>
 <8eedeb02dc56ecaed5d2f3cb8d929a3675b2c3da.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8eedeb02dc56ecaed5d2f3cb8d929a3675b2c3da.camel@redhat.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri 07 May 16:18 CDT 2021, Lyude Paul wrote:

> Adding ville from Intel to also get their take on this.
> 
> In general we've been trying to move DRM to a design where we don't expose any
> devices until everything is ready. That's pretty much the main reason that we
> register things during bridge attach time. Note though that even before the
> DDC bus is registered it should still be usable, just things like get_device()
> won't work.
> 
> This isn't the first time we've run into a problem like the one you're trying
> to solve though, Tegra currently has a similar issue. Something we discussed
> as a possible long-term solution for this was splitting i2c_add_adapter() into
> a minimal initialization function and a registration function. Linux's device
> core already allows for this (device_initialize() and device_add(), which are
> called together when device_register() is called). Would this be a solution
> that might work for you (and even better, would you possibly be willing to
> write the patches? :)
> 

It's not enough that the adapter is half-baked, because the bridge's
initialization depends on that the panel device is done probing, and the
panel driver will only complete its probe if it can find it's resources.

So we need a mechanism to fully create the resources exposed by the
bridge chip (i2c bus, gpio chip and (soon) a pwm chip), then allow the
panel to probe and after that initialize the bridge.

We did discuss possible ways to register these resources and then
"sleep for a while" before resolving the panel, but what we came up with
was definitely suboptimal - and ugly.

Regards,
Bjorn

> On Mon, 2021-05-03 at 14:58 -0700, Douglas Anderson wrote:
> > It can be helpful to fully register the AUX channel as an i2c bus even
> > before the bridge is created. Let's optionally allow bridges to do
> > that.
> > 
> > Specifically the case we're running into:
> > - The panel driver wants to get its DDC bus at probe time.
> > - The ti-sn65dsi86 MIPI-to-eDP bridge code, which provides the DDC
> >   bus, wants to get the panel at probe time.
> > 
> > The next patches ("drm/bridge: ti-sn65dsi86: Promote the AUX channel
> > to its own sub-dev") solves the chicken-and-egg problem by breaking
> > the ti-sn65dsi86 driver into sub-devices, but in order for it to
> > actually work we need the i2c bus to get registered at probe time and
> > not in bridge attach time.
> > 
> > Cc: Lyude Paul <lyude@redhat.com>
> > Cc: Thierry Reding <treding@nvidia.com>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > 
> > Changes in v6:
> > - ("drm/dp: Allow an early call to register DDC i2c bus") new for v6.
> > 
> >  drivers/gpu/drm/drm_dp_helper.c | 67 +++++++++++++++++++++++++++------
> >  include/drm/drm_dp_helper.h     |  2 +
> >  2 files changed, 57 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_dp_helper.c
> > b/drivers/gpu/drm/drm_dp_helper.c
> > index cb56d74e9d38..830294f0b341 100644
> > --- a/drivers/gpu/drm/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/drm_dp_helper.c
> > @@ -1757,6 +1757,49 @@ void drm_dp_aux_init(struct drm_dp_aux *aux)
> >  }
> >  EXPORT_SYMBOL(drm_dp_aux_init);
> >  
> > +/**
> > + * drm_dp_aux_register_ddc() - register the DDC parts of the aux channel
> > + * @aux: DisplayPort AUX channel
> > + *
> > + * This can be called after drm_dp_aux_init() to fully register the ddc bus
> > + * as an i2c adapter with the rest of Linux.
> > + *
> > + * If you don't explicitly call this function it will be done implicitly as
> > + * part of drm_dp_aux_register().
> > + *
> > + * Returns 0 on success or a negative error code on failure.
> > + */
> > +int drm_dp_aux_register_ddc(struct drm_dp_aux *aux)
> > +{
> > +       WARN_ON_ONCE(!aux->dev);
> > +
> > +       aux->ddc.class = I2C_CLASS_DDC;
> > +       aux->ddc.owner = THIS_MODULE;
> > +       aux->ddc.dev.parent = aux->dev;
> > +
> > +       strlcpy(aux->ddc.name, aux->name ? aux->name : dev_name(aux->dev),
> > +               sizeof(aux->ddc.name));
> > +
> > +       return i2c_add_adapter(&aux->ddc);
> > +}
> > +EXPORT_SYMBOL(drm_dp_aux_register_ddc);
> > +
> > +/**
> > + * drm_dp_aux_unregister_ddc() - unregister the DDC parts of the aux
> > channel
> > + *
> > + * This is useful if you called drm_dp_aux_register_ddc(). If you let
> > + * drm_dp_aux_register() implicitly register the DDC for you then you don't
> > + * need to worry about calling this yourself.
> > + *
> > + * @aux: DisplayPort AUX channel
> > + */
> > +void drm_dp_aux_unregister_ddc(struct drm_dp_aux *aux)
> > +{
> > +       i2c_del_adapter(&aux->ddc);
> > +       aux->ddc.dev.parent = NULL;
> > +}
> > +EXPORT_SYMBOL(drm_dp_aux_unregister_ddc);
> > +
> >  /**
> >   * drm_dp_aux_register() - initialise and register aux channel
> >   * @aux: DisplayPort AUX channel
> > @@ -1793,20 +1836,19 @@ int drm_dp_aux_register(struct drm_dp_aux *aux)
> >         if (!aux->ddc.algo)
> >                 drm_dp_aux_init(aux);
> >  
> > -       aux->ddc.class = I2C_CLASS_DDC;
> > -       aux->ddc.owner = THIS_MODULE;
> > -       aux->ddc.dev.parent = aux->dev;
> > -
> > -       strlcpy(aux->ddc.name, aux->name ? aux->name : dev_name(aux->dev),
> > -               sizeof(aux->ddc.name));
> > +       /*
> > +        * Implicitly register if drm_dp_aux_register_ddc() wasn't already
> > +        * called (as evidenced by a NULL parent pointer).
> > +        */
> > +       if (!aux->ddc.dev.parent) {
> > +               ret = drm_dp_aux_register_ddc(aux);
> > +               if (ret)
> > +                       return ret;
> > +       }
> >  
> >         ret = drm_dp_aux_register_devnode(aux);
> > -       if (ret)
> > -               return ret;
> > -
> > -       ret = i2c_add_adapter(&aux->ddc);
> >         if (ret) {
> > -               drm_dp_aux_unregister_devnode(aux);
> > +               drm_dp_aux_unregister_ddc(aux);
> >                 return ret;
> >         }
> >  
> > @@ -1821,7 +1863,8 @@ EXPORT_SYMBOL(drm_dp_aux_register);
> >  void drm_dp_aux_unregister(struct drm_dp_aux *aux)
> >  {
> >         drm_dp_aux_unregister_devnode(aux);
> > -       i2c_del_adapter(&aux->ddc);
> > +       if (aux->ddc.dev.parent)
> > +               drm_dp_aux_unregister_ddc(aux);
> >  }
> >  EXPORT_SYMBOL(drm_dp_aux_unregister);
> >  
> > diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> > index e932b2c40095..d4d2d5e25bb7 100644
> > --- a/include/drm/drm_dp_helper.h
> > +++ b/include/drm/drm_dp_helper.h
> > @@ -2021,6 +2021,8 @@ bool drm_dp_lttpr_pre_emphasis_level_3_supported(const
> > u8 caps[DP_LTTPR_PHY_CAP_
> >  
> >  void drm_dp_remote_aux_init(struct drm_dp_aux *aux);
> >  void drm_dp_aux_init(struct drm_dp_aux *aux);
> > +int drm_dp_aux_register_ddc(struct drm_dp_aux *aux);
> > +void drm_dp_aux_unregister_ddc(struct drm_dp_aux *aux);
> >  int drm_dp_aux_register(struct drm_dp_aux *aux);
> >  void drm_dp_aux_unregister(struct drm_dp_aux *aux);
> >  
> 
> -- 
> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat
> 

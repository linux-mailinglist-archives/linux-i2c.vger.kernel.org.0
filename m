Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16249376C1A
	for <lists+linux-i2c@lfdr.de>; Sat,  8 May 2021 00:10:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbhEGWLF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 May 2021 18:11:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50606 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229887AbhEGWLD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 May 2021 18:11:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620425402;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5WJJq6IevEpABzSQ7XC+QiC5NuM7mIVKlgQhXJSzZzI=;
        b=Jp4XGlDdr628U2w/JpJRCLwZHNouiQf6n+dW0AaGA+l6hHMdXEL9Z2vmJYrX8zKPPVW90T
        9McNTzEadZBTmgQNs9+JWOIsiK8k6b84cdN889NRiqtTIxAqmGZOaROi8DmTJhROQjVCDL
        Tsza+8pGR52dlrYc282DUNX9wcbXJSo=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-CJc0l5LlOwKbuX-9HhSdyw-1; Fri, 07 May 2021 18:10:01 -0400
X-MC-Unique: CJc0l5LlOwKbuX-9HhSdyw-1
Received: by mail-qv1-f70.google.com with SMTP id h17-20020a0cb4d10000b02901c51890529dso7635694qvf.18
        for <linux-i2c@vger.kernel.org>; Fri, 07 May 2021 15:10:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=5WJJq6IevEpABzSQ7XC+QiC5NuM7mIVKlgQhXJSzZzI=;
        b=AALVlgqiAP42hGppzjAdQJahRPGEQMF9QiXwlmbRahWXnkCqI/8WTTTOMcEGgBnwpm
         fbQh9oRtMhPBFajvSszYpGldELbsG4iqnkfLxaXLGRIUGefJXGPT8ydJhpEd8bOsDGOH
         fCQ/UZUv7BnfvVWf2NGXaIWQboSr67oZNSyhSZVC3/Q5+OWh75Lt4x6/wY0ezQ9YeaIo
         HtWhYk2Y71/R6DZH4G93yTzRU65VahvjApgt10R0GeIxqrZxbWHF8xJ3OO/Euh+UbfHb
         PE0q9XbWubKlIRG+CG0+dForadRLeiYR055qaAVhLkrGVwY5DnF0An1ByUTFLexNzypC
         gSkA==
X-Gm-Message-State: AOAM533caYnUYTHmOnhkG8n/+pcMzBLrqVwqGkzr4kLiAs0IIegp8BpY
        NwmhLGQSMvDSIcEgfljWJBQO0aUFp2zfIdYTBoowqkcu6TU4vxAKyeLpL6lZenpAYRYBWkmKZOg
        5X6sqhxCFqCvN3ty6uyac
X-Received: by 2002:a37:9ac1:: with SMTP id c184mr12247758qke.201.1620425400725;
        Fri, 07 May 2021 15:10:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLzsAVchYyCje0PWTJifmtfr+sf8PNZAlFN9oz7CLdeUuMGeSA8m1PuM4UdwCa1FfM+hW5rw==
X-Received: by 2002:a37:9ac1:: with SMTP id c184mr12247719qke.201.1620425400430;
        Fri, 07 May 2021 15:10:00 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
        by smtp.gmail.com with ESMTPSA id f66sm5965691qke.42.2021.05.07.15.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 15:10:00 -0700 (PDT)
Message-ID: <22632aba5bc118f5e96e155f240445b1547733c7.camel@redhat.com>
Subject: Re: [PATCH v6 2/5] drm/dp: Allow an early call to register DDC i2c
 bus
From:   Lyude Paul <lyude@redhat.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@redhat.com>,
        Jani Nikula <jani.nikula@intel.com>,
        Ville Syrjala <ville.syrjala@intel.com>
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
Date:   Fri, 07 May 2021 18:09:58 -0400
In-Reply-To: <20210507220036.GI2484@yoga>
References: <20210503215844.2996320-1-dianders@chromium.org>
         <20210503145750.v6.2.Iff8f2957d86af40f2bfcfb5a7163928481fccea4@changeid>
         <8eedeb02dc56ecaed5d2f3cb8d929a3675b2c3da.camel@redhat.com>
         <20210507220036.GI2484@yoga>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 2021-05-07 at 17:00 -0500, Bjorn Andersson wrote:
> On Fri 07 May 16:18 CDT 2021, Lyude Paul wrote:
> 
> > Adding ville from Intel to also get their take on this.
> > 
> > In general we've been trying to move DRM to a design where we don't expose
> > any
> > devices until everything is ready. That's pretty much the main reason that
> > we
> > register things during bridge attach time. Note though that even before
> > the
> > DDC bus is registered it should still be usable, just things like
> > get_device()
> > won't work.
> > 
> > This isn't the first time we've run into a problem like the one you're
> > trying
> > to solve though, Tegra currently has a similar issue. Something we
> > discussed
> > as a possible long-term solution for this was splitting i2c_add_adapter()
> > into
> > a minimal initialization function and a registration function. Linux's
> > device
> > core already allows for this (device_initialize() and device_add(), which
> > are
> > called together when device_register() is called). Would this be a
> > solution
> > that might work for you (and even better, would you possibly be willing to
> > write the patches? :)
> > 
> 
> It's not enough that the adapter is half-baked, because the bridge's
> initialization depends on that the panel device is done probing, and the
> panel driver will only complete its probe if it can find it's resources.
> 
> So we need a mechanism to fully create the resources exposed by the
> bridge chip (i2c bus, gpio chip and (soon) a pwm chip), then allow the
> panel to probe and after that initialize the bridge.
> 
> We did discuss possible ways to register these resources and then
> "sleep for a while" before resolving the panel, but what we came up with
> was definitely suboptimal - and ugly.

Sigh, I'm really starting to wonder if we should reconsider the rules on
exposing ddc adapters early...

Danvet, Jani, and/or airlied: can I get your take on this?

> 
> Regards,
> Bjorn
> 
> > On Mon, 2021-05-03 at 14:58 -0700, Douglas Anderson wrote:
> > > It can be helpful to fully register the AUX channel as an i2c bus even
> > > before the bridge is created. Let's optionally allow bridges to do
> > > that.
> > > 
> > > Specifically the case we're running into:
> > > - The panel driver wants to get its DDC bus at probe time.
> > > - The ti-sn65dsi86 MIPI-to-eDP bridge code, which provides the DDC
> > >   bus, wants to get the panel at probe time.
> > > 
> > > The next patches ("drm/bridge: ti-sn65dsi86: Promote the AUX channel
> > > to its own sub-dev") solves the chicken-and-egg problem by breaking
> > > the ti-sn65dsi86 driver into sub-devices, but in order for it to
> > > actually work we need the i2c bus to get registered at probe time and
> > > not in bridge attach time.
> > > 
> > > Cc: Lyude Paul <lyude@redhat.com>
> > > Cc: Thierry Reding <treding@nvidia.com>
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > > 
> > > Changes in v6:
> > > - ("drm/dp: Allow an early call to register DDC i2c bus") new for v6.
> > > 
> > >  drivers/gpu/drm/drm_dp_helper.c | 67 +++++++++++++++++++++++++++------
> > >  include/drm/drm_dp_helper.h     |  2 +
> > >  2 files changed, 57 insertions(+), 12 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_dp_helper.c
> > > b/drivers/gpu/drm/drm_dp_helper.c
> > > index cb56d74e9d38..830294f0b341 100644
> > > --- a/drivers/gpu/drm/drm_dp_helper.c
> > > +++ b/drivers/gpu/drm/drm_dp_helper.c
> > > @@ -1757,6 +1757,49 @@ void drm_dp_aux_init(struct drm_dp_aux *aux)
> > >  }
> > >  EXPORT_SYMBOL(drm_dp_aux_init);
> > >  
> > > +/**
> > > + * drm_dp_aux_register_ddc() - register the DDC parts of the aux
> > > channel
> > > + * @aux: DisplayPort AUX channel
> > > + *
> > > + * This can be called after drm_dp_aux_init() to fully register the ddc
> > > bus
> > > + * as an i2c adapter with the rest of Linux.
> > > + *
> > > + * If you don't explicitly call this function it will be done
> > > implicitly as
> > > + * part of drm_dp_aux_register().
> > > + *
> > > + * Returns 0 on success or a negative error code on failure.
> > > + */
> > > +int drm_dp_aux_register_ddc(struct drm_dp_aux *aux)
> > > +{
> > > +       WARN_ON_ONCE(!aux->dev);
> > > +
> > > +       aux->ddc.class = I2C_CLASS_DDC;
> > > +       aux->ddc.owner = THIS_MODULE;
> > > +       aux->ddc.dev.parent = aux->dev;
> > > +
> > > +       strlcpy(aux->ddc.name, aux->name ? aux->name : dev_name(aux-
> > > >dev),
> > > +               sizeof(aux->ddc.name));
> > > +
> > > +       return i2c_add_adapter(&aux->ddc);
> > > +}
> > > +EXPORT_SYMBOL(drm_dp_aux_register_ddc);
> > > +
> > > +/**
> > > + * drm_dp_aux_unregister_ddc() - unregister the DDC parts of the aux
> > > channel
> > > + *
> > > + * This is useful if you called drm_dp_aux_register_ddc(). If you let
> > > + * drm_dp_aux_register() implicitly register the DDC for you then you
> > > don't
> > > + * need to worry about calling this yourself.
> > > + *
> > > + * @aux: DisplayPort AUX channel
> > > + */
> > > +void drm_dp_aux_unregister_ddc(struct drm_dp_aux *aux)
> > > +{
> > > +       i2c_del_adapter(&aux->ddc);
> > > +       aux->ddc.dev.parent = NULL;
> > > +}
> > > +EXPORT_SYMBOL(drm_dp_aux_unregister_ddc);
> > > +
> > >  /**
> > >   * drm_dp_aux_register() - initialise and register aux channel
> > >   * @aux: DisplayPort AUX channel
> > > @@ -1793,20 +1836,19 @@ int drm_dp_aux_register(struct drm_dp_aux *aux)
> > >         if (!aux->ddc.algo)
> > >                 drm_dp_aux_init(aux);
> > >  
> > > -       aux->ddc.class = I2C_CLASS_DDC;
> > > -       aux->ddc.owner = THIS_MODULE;
> > > -       aux->ddc.dev.parent = aux->dev;
> > > -
> > > -       strlcpy(aux->ddc.name, aux->name ? aux->name : dev_name(aux-
> > > >dev),
> > > -               sizeof(aux->ddc.name));
> > > +       /*
> > > +        * Implicitly register if drm_dp_aux_register_ddc() wasn't
> > > already
> > > +        * called (as evidenced by a NULL parent pointer).
> > > +        */
> > > +       if (!aux->ddc.dev.parent) {
> > > +               ret = drm_dp_aux_register_ddc(aux);
> > > +               if (ret)
> > > +                       return ret;
> > > +       }
> > >  
> > >         ret = drm_dp_aux_register_devnode(aux);
> > > -       if (ret)
> > > -               return ret;
> > > -
> > > -       ret = i2c_add_adapter(&aux->ddc);
> > >         if (ret) {
> > > -               drm_dp_aux_unregister_devnode(aux);
> > > +               drm_dp_aux_unregister_ddc(aux);
> > >                 return ret;
> > >         }
> > >  
> > > @@ -1821,7 +1863,8 @@ EXPORT_SYMBOL(drm_dp_aux_register);
> > >  void drm_dp_aux_unregister(struct drm_dp_aux *aux)
> > >  {
> > >         drm_dp_aux_unregister_devnode(aux);
> > > -       i2c_del_adapter(&aux->ddc);
> > > +       if (aux->ddc.dev.parent)
> > > +               drm_dp_aux_unregister_ddc(aux);
> > >  }
> > >  EXPORT_SYMBOL(drm_dp_aux_unregister);
> > >  
> > > diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> > > index e932b2c40095..d4d2d5e25bb7 100644
> > > --- a/include/drm/drm_dp_helper.h
> > > +++ b/include/drm/drm_dp_helper.h
> > > @@ -2021,6 +2021,8 @@ bool
> > > drm_dp_lttpr_pre_emphasis_level_3_supported(const
> > > u8 caps[DP_LTTPR_PHY_CAP_
> > >  
> > >  void drm_dp_remote_aux_init(struct drm_dp_aux *aux);
> > >  void drm_dp_aux_init(struct drm_dp_aux *aux);
> > > +int drm_dp_aux_register_ddc(struct drm_dp_aux *aux);
> > > +void drm_dp_aux_unregister_ddc(struct drm_dp_aux *aux);
> > >  int drm_dp_aux_register(struct drm_dp_aux *aux);
> > >  void drm_dp_aux_unregister(struct drm_dp_aux *aux);
> > >  
> > 
> > -- 
> > Cheers,
> >  Lyude Paul (she/her)
> >  Software Engineer at Red Hat
> > 
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat


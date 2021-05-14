Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C05EF380846
	for <lists+linux-i2c@lfdr.de>; Fri, 14 May 2021 13:16:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232195AbhENLSA convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Fri, 14 May 2021 07:18:00 -0400
Received: from mga11.intel.com ([192.55.52.93]:7647 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232164AbhENLR7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 14 May 2021 07:17:59 -0400
IronPort-SDR: pcza2gezxLHX/3P2KfbJH0qqU7Sb00nAuaDBz/h0sW01M9FSg+JmEanAPPiNbTFTwGdAS+EsRE
 gR48Mn9wr/Xw==
X-IronPort-AV: E=McAfee;i="6200,9189,9983"; a="197073046"
X-IronPort-AV: E=Sophos;i="5.82,299,1613462400"; 
   d="scan'208";a="197073046"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2021 04:16:47 -0700
IronPort-SDR: 3B9oYuAxq54p4R1uSTn+M7QFk1rwcY+BCptYtxgSQbxc/EYlwj3kZdJf+35VQ2yU76ENAa+k4n
 q/SSyW8AGxkw==
X-IronPort-AV: E=Sophos;i="5.82,299,1613462400"; 
   d="scan'208";a="626929096"
Received: from abacha1-mobl1.ger.corp.intel.com (HELO localhost) ([10.249.34.141])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2021 04:16:40 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     Lyude Paul <lyude@redhat.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@redhat.com>,
        Ville Syrjala <ville.syrjala@intel.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Sam Ravnborg <sam@ravnborg.org>, robdclark@chromium.org,
        Ville Syrjala <ville.syrjala@intel.com>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Thierry Reding <treding@nvidia.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        Steev Klimaszewski <steev@kali.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Douglas Anderson <dianders@chromium.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v6 2/5] drm/dp: Allow an early call to register DDC i2c bus
In-Reply-To: <22632aba5bc118f5e96e155f240445b1547733c7.camel@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210503215844.2996320-1-dianders@chromium.org> <20210503145750.v6.2.Iff8f2957d86af40f2bfcfb5a7163928481fccea4@changeid> <8eedeb02dc56ecaed5d2f3cb8d929a3675b2c3da.camel@redhat.com> <20210507220036.GI2484@yoga> <22632aba5bc118f5e96e155f240445b1547733c7.camel@redhat.com>
Date:   Fri, 14 May 2021 14:16:37 +0300
Message-ID: <871ra9tvje.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 07 May 2021, Lyude Paul <lyude@redhat.com> wrote:
> On Fri, 2021-05-07 at 17:00 -0500, Bjorn Andersson wrote:
>> On Fri 07 May 16:18 CDT 2021, Lyude Paul wrote:
>> 
>> > Adding ville from Intel to also get their take on this.
>> > 
>> > In general we've been trying to move DRM to a design where we don't expose
>> > any
>> > devices until everything is ready. That's pretty much the main reason that
>> > we
>> > register things during bridge attach time. Note though that even before
>> > the
>> > DDC bus is registered it should still be usable, just things like
>> > get_device()
>> > won't work.
>> > 
>> > This isn't the first time we've run into a problem like the one you're
>> > trying
>> > to solve though, Tegra currently has a similar issue. Something we
>> > discussed
>> > as a possible long-term solution for this was splitting i2c_add_adapter()
>> > into
>> > a minimal initialization function and a registration function. Linux's
>> > device
>> > core already allows for this (device_initialize() and device_add(), which
>> > are
>> > called together when device_register() is called). Would this be a
>> > solution
>> > that might work for you (and even better, would you possibly be willing to
>> > write the patches? :)
>> > 
>> 
>> It's not enough that the adapter is half-baked, because the bridge's
>> initialization depends on that the panel device is done probing, and the
>> panel driver will only complete its probe if it can find it's resources.
>> 
>> So we need a mechanism to fully create the resources exposed by the
>> bridge chip (i2c bus, gpio chip and (soon) a pwm chip), then allow the
>> panel to probe and after that initialize the bridge.
>> 
>> We did discuss possible ways to register these resources and then
>> "sleep for a while" before resolving the panel, but what we came up with
>> was definitely suboptimal - and ugly.
>
> Sigh, I'm really starting to wonder if we should reconsider the rules on
> exposing ddc adapters early...
>
> Danvet, Jani, and/or airlied: can I get your take on this?

Granted, I did not study this in detail, but it sounds like we'd need to
be able to add and use an i2c adapter in kernel, before deciding to
register it with the userspace. But that does not seem to be as trivial
as making it possible to call the now-static i2c_register_adapter()
separately.


BR,
Jani.


>
>> 
>> Regards,
>> Bjorn
>> 
>> > On Mon, 2021-05-03 at 14:58 -0700, Douglas Anderson wrote:
>> > > It can be helpful to fully register the AUX channel as an i2c bus even
>> > > before the bridge is created. Let's optionally allow bridges to do
>> > > that.
>> > > 
>> > > Specifically the case we're running into:
>> > > - The panel driver wants to get its DDC bus at probe time.
>> > > - The ti-sn65dsi86 MIPI-to-eDP bridge code, which provides the DDC
>> > >   bus, wants to get the panel at probe time.
>> > > 
>> > > The next patches ("drm/bridge: ti-sn65dsi86: Promote the AUX channel
>> > > to its own sub-dev") solves the chicken-and-egg problem by breaking
>> > > the ti-sn65dsi86 driver into sub-devices, but in order for it to
>> > > actually work we need the i2c bus to get registered at probe time and
>> > > not in bridge attach time.
>> > > 
>> > > Cc: Lyude Paul <lyude@redhat.com>
>> > > Cc: Thierry Reding <treding@nvidia.com>
>> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>> > > ---
>> > > 
>> > > Changes in v6:
>> > > - ("drm/dp: Allow an early call to register DDC i2c bus") new for v6.
>> > > 
>> > >  drivers/gpu/drm/drm_dp_helper.c | 67 +++++++++++++++++++++++++++------
>> > >  include/drm/drm_dp_helper.h     |  2 +
>> > >  2 files changed, 57 insertions(+), 12 deletions(-)
>> > > 
>> > > diff --git a/drivers/gpu/drm/drm_dp_helper.c
>> > > b/drivers/gpu/drm/drm_dp_helper.c
>> > > index cb56d74e9d38..830294f0b341 100644
>> > > --- a/drivers/gpu/drm/drm_dp_helper.c
>> > > +++ b/drivers/gpu/drm/drm_dp_helper.c
>> > > @@ -1757,6 +1757,49 @@ void drm_dp_aux_init(struct drm_dp_aux *aux)
>> > >  }
>> > >  EXPORT_SYMBOL(drm_dp_aux_init);
>> > >  
>> > > +/**
>> > > + * drm_dp_aux_register_ddc() - register the DDC parts of the aux
>> > > channel
>> > > + * @aux: DisplayPort AUX channel
>> > > + *
>> > > + * This can be called after drm_dp_aux_init() to fully register the ddc
>> > > bus
>> > > + * as an i2c adapter with the rest of Linux.
>> > > + *
>> > > + * If you don't explicitly call this function it will be done
>> > > implicitly as
>> > > + * part of drm_dp_aux_register().
>> > > + *
>> > > + * Returns 0 on success or a negative error code on failure.
>> > > + */
>> > > +int drm_dp_aux_register_ddc(struct drm_dp_aux *aux)
>> > > +{
>> > > +       WARN_ON_ONCE(!aux->dev);
>> > > +
>> > > +       aux->ddc.class = I2C_CLASS_DDC;
>> > > +       aux->ddc.owner = THIS_MODULE;
>> > > +       aux->ddc.dev.parent = aux->dev;
>> > > +
>> > > +       strlcpy(aux->ddc.name, aux->name ? aux->name : dev_name(aux-
>> > > >dev),
>> > > +               sizeof(aux->ddc.name));
>> > > +
>> > > +       return i2c_add_adapter(&aux->ddc);
>> > > +}
>> > > +EXPORT_SYMBOL(drm_dp_aux_register_ddc);
>> > > +
>> > > +/**
>> > > + * drm_dp_aux_unregister_ddc() - unregister the DDC parts of the aux
>> > > channel
>> > > + *
>> > > + * This is useful if you called drm_dp_aux_register_ddc(). If you let
>> > > + * drm_dp_aux_register() implicitly register the DDC for you then you
>> > > don't
>> > > + * need to worry about calling this yourself.
>> > > + *
>> > > + * @aux: DisplayPort AUX channel
>> > > + */
>> > > +void drm_dp_aux_unregister_ddc(struct drm_dp_aux *aux)
>> > > +{
>> > > +       i2c_del_adapter(&aux->ddc);
>> > > +       aux->ddc.dev.parent = NULL;
>> > > +}
>> > > +EXPORT_SYMBOL(drm_dp_aux_unregister_ddc);
>> > > +
>> > >  /**
>> > >   * drm_dp_aux_register() - initialise and register aux channel
>> > >   * @aux: DisplayPort AUX channel
>> > > @@ -1793,20 +1836,19 @@ int drm_dp_aux_register(struct drm_dp_aux *aux)
>> > >         if (!aux->ddc.algo)
>> > >                 drm_dp_aux_init(aux);
>> > >  
>> > > -       aux->ddc.class = I2C_CLASS_DDC;
>> > > -       aux->ddc.owner = THIS_MODULE;
>> > > -       aux->ddc.dev.parent = aux->dev;
>> > > -
>> > > -       strlcpy(aux->ddc.name, aux->name ? aux->name : dev_name(aux-
>> > > >dev),
>> > > -               sizeof(aux->ddc.name));
>> > > +       /*
>> > > +        * Implicitly register if drm_dp_aux_register_ddc() wasn't
>> > > already
>> > > +        * called (as evidenced by a NULL parent pointer).
>> > > +        */
>> > > +       if (!aux->ddc.dev.parent) {
>> > > +               ret = drm_dp_aux_register_ddc(aux);
>> > > +               if (ret)
>> > > +                       return ret;
>> > > +       }
>> > >  
>> > >         ret = drm_dp_aux_register_devnode(aux);
>> > > -       if (ret)
>> > > -               return ret;
>> > > -
>> > > -       ret = i2c_add_adapter(&aux->ddc);
>> > >         if (ret) {
>> > > -               drm_dp_aux_unregister_devnode(aux);
>> > > +               drm_dp_aux_unregister_ddc(aux);
>> > >                 return ret;
>> > >         }
>> > >  
>> > > @@ -1821,7 +1863,8 @@ EXPORT_SYMBOL(drm_dp_aux_register);
>> > >  void drm_dp_aux_unregister(struct drm_dp_aux *aux)
>> > >  {
>> > >         drm_dp_aux_unregister_devnode(aux);
>> > > -       i2c_del_adapter(&aux->ddc);
>> > > +       if (aux->ddc.dev.parent)
>> > > +               drm_dp_aux_unregister_ddc(aux);
>> > >  }
>> > >  EXPORT_SYMBOL(drm_dp_aux_unregister);
>> > >  
>> > > diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
>> > > index e932b2c40095..d4d2d5e25bb7 100644
>> > > --- a/include/drm/drm_dp_helper.h
>> > > +++ b/include/drm/drm_dp_helper.h
>> > > @@ -2021,6 +2021,8 @@ bool
>> > > drm_dp_lttpr_pre_emphasis_level_3_supported(const
>> > > u8 caps[DP_LTTPR_PHY_CAP_
>> > >  
>> > >  void drm_dp_remote_aux_init(struct drm_dp_aux *aux);
>> > >  void drm_dp_aux_init(struct drm_dp_aux *aux);
>> > > +int drm_dp_aux_register_ddc(struct drm_dp_aux *aux);
>> > > +void drm_dp_aux_unregister_ddc(struct drm_dp_aux *aux);
>> > >  int drm_dp_aux_register(struct drm_dp_aux *aux);
>> > >  void drm_dp_aux_unregister(struct drm_dp_aux *aux);
>> > >  
>> > 
>> > -- 
>> > Cheers,
>> >  Lyude Paul (she/her)
>> >  Software Engineer at Red Hat
>> > 
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center

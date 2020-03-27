Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52D18195FA9
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Mar 2020 21:26:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbgC0U0m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Mar 2020 16:26:42 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50197 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727254AbgC0U0m (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Mar 2020 16:26:42 -0400
Received: by mail-wm1-f66.google.com with SMTP id d198so12870393wmd.0
        for <linux-i2c@vger.kernel.org>; Fri, 27 Mar 2020 13:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ovuSRHyjTyYRmZNDzLWoRDZUeXXL5IWfbBzaBcdUcIE=;
        b=jCs1582gbf3j3S/OwTqoqLG1lmlKh9EAV6E+imqq/J24VcxFKb1xW4EkiF89fvWhxJ
         j5T4PprNeK8BOKHAjZsi8uoSWpsT1WNrAJ0JrBFZTirXOcV0pT4YhHMpSU4L07T4jl21
         59OLcJzqD9rYzcCL8unW4VqoaxplkgUKsx44U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ovuSRHyjTyYRmZNDzLWoRDZUeXXL5IWfbBzaBcdUcIE=;
        b=TP0jNMjDQK2fGLtqNCXtEwDXsQ9PwxvCZxuXtTD2TSG9AACTvXq/67AfPhWTrTyrKr
         VKkkT7EzoFQQW00g6rmKEwjqguKeaZS/bF9xzzcsBggXgdGKCI8jNn7PAtE0zVESC65X
         hAoruwmLQUtutioWNGQI0SI6li49oZiLyjeHQwk0Hi8T9QnWtGQgtTX15F+6a/NaRXlX
         U/RseGVPJXcR0OcIUyVtte8/l4xYoFm2rzRvETnDJcDSrT8+g0SoVbevi+9LUwc5e5pK
         KG+W1Gcd0p1muA727HGHmFCb2mmMHqGcMkeblx2om1FA2P6pBkqa5eqZ3mQo/0JWV3YY
         PxmA==
X-Gm-Message-State: ANhLgQ2q0jRy0HJTpkAc13so83dJ0NOxt6lBXLQ07eNmZ8p86YLWkCQB
        tDp0U0AsaeK97uZpWPPhrINe8WepJpw1UwD30H5Y+A==
X-Google-Smtp-Source: ADFU+vsbz5mdJGGZGucacZuiWVFx6SyZ8S8yVfyM3SaRwdvYejw+NuiQtsPoZmRMs2T6SyNLZ9yRXtKfR+fF6iIRaWA=
X-Received: by 2002:a1c:f205:: with SMTP id s5mr483778wmc.101.1585340798622;
 Fri, 27 Mar 2020 13:26:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200327151951.18111-1-ricardo.canuelo@collabora.com> <20200327154345.GA3971@ninjato>
In-Reply-To: <20200327154345.GA3971@ninjato>
From:   "dbasehore ." <dbasehore@chromium.org>
Date:   Fri, 27 Mar 2020 13:26:26 -0700
Message-ID: <CAGAzgsqJznZi83ijxCgQg463Q4AnwiNX-a0Q9+Og9MW5OJ4Vew@mail.gmail.com>
Subject: Re: [PATCH] i2c: enable async suspend/resume on i2c devices
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     =?UTF-8?Q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
        linux-i2c@vger.kernel.org, Guenter Roeck <groeck@chromium.org>,
        Linux-pm mailing list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Mar 27, 2020 at 8:43 AM Wolfram Sang <wsa@the-dreams.de> wrote:
>
> On Fri, Mar 27, 2020 at 04:19:51PM +0100, Ricardo Ca=C3=B1uelo wrote:
> > This enables the async suspend property for i2c devices. This reduces
> > the suspend/resume time considerably on platforms with multiple i2c
> > devices (such as a trackpad or touchscreen).
> >
> > (am from https://patchwork.ozlabs.org/patch/949922/)
> >
> > Signed-off-by: Derek Basehore <dbasehore@chromium.org>
> > Reviewed-on: https://chromium-review.googlesource.com/1152411
> > Tested-by: Venkateswarlu V Vinjamuri <venkateswarlu.v.vinjamuri@intel.c=
om>
> > Reviewed-by: Venkateswarlu V Vinjamuri <venkateswarlu.v.vinjamuri@intel=
.com>
> > Reviewed-by: Justin TerAvest <teravest@chromium.org>
> > Signed-off-by: Guenter Roeck <groeck@chromium.org>
> > Signed-off-by: Ricardo Ca=C3=B1uelo <ricardo.canuelo@collabora.com>
> > ---
>
> Adding linux-pm to CC. I don't know much about internals of async
> suspend. Is there a guide like "what every maintainer needs to know
> about"?

For more details, you can look at the function dpm_resume in the
drivers/base/power/main.c file and follow from there.

I can't find anything in Documentation/, so here's a short overview:
Async devices have suspend/resume callbacks scheduled via
async_schedule at every step (normal, late, noirq, etc.) for
suspending/resuming devices. We wait for all device callbacks to
complete at the end of each of these steps before moving onto the next
one. This means that you won't have a resume_early callback running
when you start the normal device resume callbacks.

The async callbacks still wait individually for children on suspend
and parents on resume to complete their own callbacks before calling
their own. Because some dependencies may not be tracked by the
parent/child graph (or other unknown reasons), async is off by
default.

Enabling async is a confirmation that all dependencies to other
devices are properly tracked, whether through the parent/child
relationship or otherwise.

>
> > This patch was originally created for chromeos some time ago and I'm
> > evaluating if it's a good candidate for upstreaming.
> >
> > By the looks of it I think it was done with chromebooks in mind, but
> > AFAICT this would impact every i2c client in every platform, so I'd lik=
e
> > to know your opinion about it.
> >
> > As far as I know there was no further investigation or testing on it, s=
o
> > I don't know if it was tested on any other hardware.
> >
> > Best,
> > Ricardo
> >
> >  drivers/i2c/i2c-core-base.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> > index cefad0881942..643bc0fe0281 100644
> > --- a/drivers/i2c/i2c-core-base.c
> > +++ b/drivers/i2c/i2c-core-base.c
> > @@ -769,6 +769,7 @@ i2c_new_client_device(struct i2c_adapter *adap, str=
uct i2c_board_info const *inf
> >       client->dev.of_node =3D of_node_get(info->of_node);
> >       client->dev.fwnode =3D info->fwnode;
> >
> > +     device_enable_async_suspend(&client->dev);
> >       i2c_dev_set_name(adap, client, info);
> >
> >       if (info->properties) {
> > --
> > 2.18.0
> >

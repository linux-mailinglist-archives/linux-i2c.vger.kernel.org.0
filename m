Return-Path: <linux-i2c+bounces-7689-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D62069B8376
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Oct 2024 20:30:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A2F61F21ACB
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Oct 2024 19:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D99631C9DC9;
	Thu, 31 Oct 2024 19:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N6LmsYRQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F5B14264A
	for <linux-i2c@vger.kernel.org>; Thu, 31 Oct 2024 19:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730403014; cv=none; b=MhtfgVh5R0yWttUH3wzvF/nEeJTTI22+Hg9eSqhsUtKwOGd2RdOHydBBMLfNYEaXI79IbPLPUODFNObkkrnWwzP/GX2ZVWY/mFecnXzTat38heT/214uTfj+XWOtlxZFjCFi24UPHAti/w75m06U+OeIZFeOlmLPW1mI0WSv2V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730403014; c=relaxed/simple;
	bh=JEt1Up+INIfm+iJKDjNzXaZiC7OBpJytxAHxjP01YCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BmYLshT2ooZmyf79pstjddA+Apni4mvJ16pH3xNoL/NR6tbPRP2Rv9Ln6SQGe7LZ1XGYyhRs2UYbzC79sbZiKACGaiTA8RFP3I9tQgEig8f88hYwK32RI9f9RYYRGRWnXFHMsATs9YI1tb3MQZjJGB6Y0VqyaArQmi14packqiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N6LmsYRQ; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53a0c160b94so1503887e87.2
        for <linux-i2c@vger.kernel.org>; Thu, 31 Oct 2024 12:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730403010; x=1731007810; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=31snwxEgII8Vk6u+4+11z3gM5zDzJPBD0BIeCBrJcCw=;
        b=N6LmsYRQPsbxTlgQ4Jd8czMlAOWqdy7WA6XC9tRN+pCFUm6oe8wP4kcOjn4fMuAAFv
         Y+YoIpBZ/lY8z6BqJ+v4hlYioO9ekP1jwt5H/gLr2lt+ggRpDEbly7lG2T8eUFdBtnv7
         RR9TzTant81/WB9j/F7YYiXHHNEULksAQB3rDb4y3ydH9PNBsXESUTWmm+po+IxpAgw5
         BDV+mxmtW/EqK6hneHEFqFH+W7gPpTiK4cJTc18niGnqnpSFC3HGhQbU16941Q4Yd4Ba
         SPVkaGNBVu7eSzV7eAsigJeLlWmY2LhucAMNXuG82MbVfEgDw01ORdIvMSBD9SYoRoQV
         V4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730403010; x=1731007810;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31snwxEgII8Vk6u+4+11z3gM5zDzJPBD0BIeCBrJcCw=;
        b=UKEdpDYg67CryFx76iNqQRJxjJE5GsGnVznrKIFid7rU1JJ+NE5LL7txRbfS4hsxfL
         0urL3+lrGaQ9GQWuqXo/1i0BHJoZMeok0GGYiRmxWBMa4OqefurDDRFBVqZgoOBGRYO7
         qwhEiTIOLZK3M4HTIscGfMmB22L7DGnzGSP8EZ7YXClNiJNMS1lL9eUD14lZ+ZM6mHUA
         B7yqzZHErQjZM7udljms6nT16DhzQWdlZKIKVATHB2qWh5oIHo7lPZaurtxt0EU/2x08
         ZwYq+Lw+862eQe3o/KbFCUTV6b0/wv1mj4gjGZouTIJIf3Phl4G876p2uXEVy2zWYgBg
         Rggw==
X-Forwarded-Encrypted: i=1; AJvYcCV1vCLm41JKPMY4/XmmJEvzLIMGxLngtF42VPRVuJHMSU5U2IFk0hRDsCfTyVjEBNM7EigZv1/0qBA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxQdNn97tznIghDQwU9WY1SGvn/fD/nc3z8FfJXR+7CDI5h19w
	gTdPvh1Aoneega83ORVH/aoVrhHZI0Snu8Vsy+/THQsDgTuPAFRZntQ/W29U7CU=
X-Google-Smtp-Source: AGHT+IEXOiLypbvMGxd2hyzMiKYXFJFT2FTyEhMspQ58nB+nmG3OjYg+hM8a0VciWysPPE0vTAJ4cA==
X-Received: by 2002:a05:6512:2315:b0:536:a6c6:33f with SMTP id 2adb3069b0e04-53d65df22e7mr753424e87.13.1730403010310;
        Thu, 31 Oct 2024 12:30:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bc9bed5sm307283e87.74.2024.10.31.12.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 12:30:08 -0700 (PDT)
Date: Thu, 31 Oct 2024 21:30:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, robdclark@gmail.com, 
	swboyd@chromium.org, airlied@gmail.com, quic_jesszhan@quicinc.com, lyude@redhat.com, 
	simona@ffwll.ch, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] i2c: skip of_i2c_register_device() for invalid child
 nodes
Message-ID: <mlpiuko7n6rp3x55z4qterdns2wzqnfwgjxikbshrvakrscsak@antl2vzla5bd>
References: <20241030010723.3520941-1-quic_abhinavk@quicinc.com>
 <CAA8EJppKou84MZm0JS_4bPveMO2UxpMs5ejCoL7OMWd-umtDmQ@mail.gmail.com>
 <92217ec6-c21c-462a-a934-9e93183c1230@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92217ec6-c21c-462a-a934-9e93183c1230@quicinc.com>

On Thu, Oct 31, 2024 at 11:45:53AM -0700, Abhinav Kumar wrote:
> 
> 
> On 10/31/2024 11:23 AM, Dmitry Baryshkov wrote:
> > On Wed, 30 Oct 2024 at 03:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > 
> > > of_i2c_register_devices() adds all child nodes of a given i2c bus
> > > however in certain device trees of_alias_from_compatible() and
> > > of_property_read_u32() can fail as the child nodes of the device
> > > might not be valid i2c client devices. One such example is the
> > > i2c aux device for the DRM MST toplogy manager which uses the
> > > display controller device node to add the i2c adaptor [1] leading
> > > to an error spam like below
> > > 
> > > i2c i2c-20: of_i2c: register /soc@0/display-subsystem@ae00000/display-controller@ae01000/ports
> > > i2c i2c-20: of_i2c: modalias failure on /soc@0/display-subsystem@ae00000/display-controller@ae01000/ports
> > > i2c i2c-20: Failed to create I2C device for /soc@0/display-subsystem@ae00000/display-controller@ae01000/ports
> > > i2c i2c-20: of_i2c: register /soc@0/display-subsystem@ae00000/display-controller@ae01000/opp-table
> > > i2c i2c-20: of_i2c: invalid reg on /soc@0/display-subsystem@ae00000/display-controller@ae01000/opp-table
> > > i2c i2c-20: Failed to create I2C device for /soc@0/display-subsystem@ae00000/display-controller@ae01000/opp-table
> > > 
> > > Add protection against invalid child nodes before trying to register
> > > i2c devices for all child nodes.
> > > 
> > > [1] : https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/display/drm_dp_mst_topology.c#L5985
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > ---
> > >   drivers/i2c/i2c-core-of.c | 6 ++++++
> > >   1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
> > > index a6c407d36800..62a2603c3092 100644
> > > --- a/drivers/i2c/i2c-core-of.c
> > > +++ b/drivers/i2c/i2c-core-of.c
> > > @@ -86,6 +86,8 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
> > >   {
> > >          struct device_node *bus, *node;
> > >          struct i2c_client *client;
> > > +       u32 addr;
> > > +       char temp[16];
> > > 
> > >          /* Only register child devices if the adapter has a node pointer set */
> > >          if (!adap->dev.of_node)
> > > @@ -101,6 +103,10 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
> > >                  if (of_node_test_and_set_flag(node, OF_POPULATED))
> > >                          continue;
> > > 
> > > +               if (of_property_read_u32(node, "reg", &addr) ||
> > > +                   of_alias_from_compatible(node, temp, sizeof(temp)))
> > > +                       continue;
> > 
> > I think just of_property_read_u32() should be enough to skip
> > non-I2C-device children. If of_alias_from_compatible() fails, it is a
> > legit error.
> > 
> 
> Thanks for the review.
> 
> of_alias_from_compatible() looks for a compatible string but all child nodes
> such as ports will not have the compatible. Hence below error will still be
> seen:
> 
> i2c i2c-20: of_i2c: modalias failure on
> /soc@0/display-subsystem@ae00000/display-controller@ae01000/ports

But ports node don't have a reg property too, so it should be skipped
based on that.

> 
> > > +
> > >                  client = of_i2c_register_device(adap, node);
> > >                  if (IS_ERR(client)) {
> > >                          dev_err(&adap->dev,
> > > --
> > > 2.34.1
> > > 
> > 
> > 

-- 
With best wishes
Dmitry


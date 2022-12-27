Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 543826567B6
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Dec 2022 08:09:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbiL0HJ3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Dec 2022 02:09:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbiL0HJ2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Dec 2022 02:09:28 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAF216355
        for <linux-i2c@vger.kernel.org>; Mon, 26 Dec 2022 23:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1672124920;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=CNSl+0ECi610jkobwQHRDIhZHSbY7C3DN466PQa953c=;
        b=PxkgSFX/sin04JdaPqfAiVHDM+DWPHZ3GrhlnGR96A52XoG0PSG3yGnXXcz0FVzhOWxumS
        tltjR4GqRCzKGwKYj/dtV/Iv1jKbxjV8mZXsmbCWn+wXANTgZ5Va5X02fXnEiYqq/BN6VA
        rr9+VHEXNxK35mDCSdKvlAl83f47boc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-205-OuOueVF-NiGQRN6zKlRLEQ-1; Tue, 27 Dec 2022 02:08:39 -0500
X-MC-Unique: OuOueVF-NiGQRN6zKlRLEQ-1
Received: by mail-wm1-f69.google.com with SMTP id fm25-20020a05600c0c1900b003d9702a11e5so4907516wmb.0
        for <linux-i2c@vger.kernel.org>; Mon, 26 Dec 2022 23:08:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CNSl+0ECi610jkobwQHRDIhZHSbY7C3DN466PQa953c=;
        b=25H0NjMgQpze5ugJPlEuzWguyP1/fiVFn0gTCpkdh/fWfkE7fxaP0bMfi6pE/x1ZRW
         p1kqdjyOIJXLTSAgQFZ7ipPJ9v26Lv/z85/3/8oTmfaDEjYCeoyV4A3DdSssG0CJq4aQ
         uidLSTfLVKN+JSsH4Wc673Xc/ftm3ENNXt93ZLpnPxkeVDBwQZUI2k5VZR/a0oLG4N+u
         y9fYaMp3UR7FzItCL29yHInHr62WzsKzgWoodfR9K7NBr8S6O9/dDzxPKGCwTu7zZhsa
         maPS2brCW9yD2Upkq/R6aOo1zygWJe5qR5Hzm/xx9SypMfFinMUZvLnExj7fXi4Ds4eo
         iiNA==
X-Gm-Message-State: AFqh2kqsDI+Ghk8Q0tpCZbQt9PDm+6sjm32zVsyJ5qA59UDVoEjvqtNM
        etwdFFaLITr4WbMk7q4LVB/+pxmaWk+sWdajjGxe5OKxroic8v4gzRVah0zItf5eM55/IxhMsWO
        uXO/MO7H6u4CclvTSh+Zn
X-Received: by 2002:a05:600c:218f:b0:3d1:fbf9:3bd4 with SMTP id e15-20020a05600c218f00b003d1fbf93bd4mr14570199wme.10.1672124918371;
        Mon, 26 Dec 2022 23:08:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtc99GCoJhnK8zS6H5TFpyy0SjPSOlEw+pD0N2cOTloIwBCRzZwnIIqKPd/kod61jIX+AMcnw==
X-Received: by 2002:a05:600c:218f:b0:3d1:fbf9:3bd4 with SMTP id e15-20020a05600c218f00b003d1fbf93bd4mr14570189wme.10.1672124918163;
        Mon, 26 Dec 2022 23:08:38 -0800 (PST)
Received: from redhat.com ([2.52.151.85])
        by smtp.gmail.com with ESMTPSA id h14-20020a05600c314e00b003d237d60318sm17613983wmo.2.2022.12.26.23.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 23:08:37 -0800 (PST)
Date:   Tue, 27 Dec 2022 02:08:34 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     "Chen, Jian Jun" <jian.jun.chen@intel.com>
Cc:     Conghui <conghui.chen@intel.com>, wsa@kernel.org,
        asowang@redhat.com, viresh.kumar@linaro.org,
        linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Update maintainer list for virtio i2c
Message-ID: <20221227020812-mutt-send-email-mst@kernel.org>
References: <20221214053631.3225164-1-conghui.chen@intel.com>
 <20221214063352-mutt-send-email-mst@kernel.org>
 <3557e69a-0c17-0a24-0706-8b48c350b75a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3557e69a-0c17-0a24-0706-8b48c350b75a@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 27, 2022 at 12:04:10PM +0800, Chen, Jian Jun wrote:
> 
> On 12/14/2022 19:37, Michael S. Tsirkin wrote:
> > On Wed, Dec 14, 2022 at 01:36:31PM +0800, Conghui wrote:
> > > This updates the maintainer for virtio i2c drvier
> > I got that, but what is going on here exactly?
> > I generally expect a new maintainer to be active in the
> > project for a while first.
> > I don't see contributions or reviews for this driver or
> > for that matter for any virtio or i2c drivers from Jian Jun Chen.
> > It looks like you are no longer interested in maintaining
> > this? In that case pls just send a patch removing yourself.
> > 
> > Jian Jun Chen, if you are interested in reviewing
> > patches please start doing so, you don't need to
> > be listed as a maintainer for this to happen.
> > Once you do this for a while and write some patches,
> > you can become a maintainer, this is not a high bar
> > to clear.
> 
> Hi Michael,
> 
> Yes. I am interested in the virtio I2C maintenance. I have lots of virtio
> experience in ACRN device model development and was involved in the early
> phase virtio I2C discussion in ACRN before Jie/Conghui upstream the virtio
> I2C spec. Sure, I will start to collaborate first.


Excellent, thanks a lot!

> > > Signed-off-by: Conghui <conghui.chen@intel.com>
> > > Acked-by: Jian Jun Chen <jian.jun.chen@intel.com>
> > > ---
> > >   MAINTAINERS | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index a8c8f6b42436..44747f4641a6 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -21920,7 +21920,7 @@ F:	include/uapi/linux/virtio_snd.h
> > >   F:	sound/virtio/*
> > >   VIRTIO I2C DRIVER
> > > -M:	Conghui Chen <conghui.chen@intel.com>
> > > +M:	Jian Jun Chen <jian.jun.chen@intel.com>
> > >   M:	Viresh Kumar <viresh.kumar@linaro.org>
> > >   L:	linux-i2c@vger.kernel.org
> > >   L:	virtualization@lists.linux-foundation.org
> > > -- 
> > > 2.25.1


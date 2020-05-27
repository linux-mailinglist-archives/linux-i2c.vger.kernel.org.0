Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AD061E3D60
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 11:15:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728244AbgE0JP0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 05:15:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726600AbgE0JPZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 May 2020 05:15:25 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B685C03E97E
        for <linux-i2c@vger.kernel.org>; Wed, 27 May 2020 02:15:24 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id s1so23618970qkf.9
        for <linux-i2c@vger.kernel.org>; Wed, 27 May 2020 02:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=idtnrQWeAURzpQW+RLs00G+O8A4gS3L+K9UkeXCQe20=;
        b=kaep8FtjTBescBuh/DTMipJrlsUmsVVNCeoJaIoHjvFY3aLX/ypieDP9Eq0bg2Z8Fy
         mfEtfW6eHGq4NWtk78hJA1GrV3b34qvVN1y21NxIWuPsmIIXM3kXfejRW4UodWTNTGQt
         YABx6/a5Ku1L3BTkJ0r9WGY0xs/SJ+8CxmdNMGjb3/7hEkYvKlwFZQmAKkojuQcYbqHm
         wfcdyvs6+MwWQTqgRRzcFX/xcVW3zkg99aMg/449QxobkNDo8rTRYi2IYoVyuomDKqhv
         sBoGhIIszOrZDFM6DGvgkQHYND20PdHpwXfvfZuf9WzJSYFFV0iDQC1JNV1jMqjJ2VlQ
         tvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=idtnrQWeAURzpQW+RLs00G+O8A4gS3L+K9UkeXCQe20=;
        b=jg1V8jgHGDtpB9PLWylF0qd1+bWMIBv9qC6N5JgGhM/423myTlht92hRL7rVFaiPOk
         Fsh8BZcB/pgDPuRKKeA3IxNbtLIN6Svqq1J3AxAvdG8uJBCA/jdvp8nwMPpTpSL8+u0P
         Y+EaE2AJmDKxv5APke0uwhWcSxsq1ssdLm28FntcB8A3Ct6isd8YTi3gwS7SPPShnMap
         xVPfpCZQaPZVMDGkKTqzYawTkN4hGHIeE4+SFFlL9OIOREMb+4FK1KkpHa5rXKgx6NC8
         Uj/SU2V+JwKa32V/Babgy65EdKqamZcqXVkFp8Gn0y8zXDHfPgUkHpufmYgUHNv+7s7q
         3/eQ==
X-Gm-Message-State: AOAM533ppyF6tyH63fGPKzP2wlSdg5nEtjtFHMY4yQ6iHynNpAO0tdrD
        o7Z234qlzX7Wk5hU14fTs267EuDHn85hRAT+Yfnpy+MVFWA=
X-Google-Smtp-Source: ABdhPJz2rYXRknrAa47G5ZoicHWOBJaEnkLv8Z2pCeyzrLZa3p9k5mhYAvQMKK0N2KMt5GCFK7O6dYRm2sJ476AKlKA=
X-Received: by 2002:a37:6851:: with SMTP id d78mr2994513qkc.86.1590570923313;
 Wed, 27 May 2020 02:15:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
 <20200427072342.5499-1-jian-hong@endlessm.com> <20200428162152.ztsqp7nxqbwqrm6r@gilmour.lan>
 <CAPpJ_efvtVzb_hvoVOeaePh7UdE13wOiiGaDBH38cToB-yhkUg@mail.gmail.com>
 <20200507172158.cybtakpo6cxv6wcs@gilmour.lan> <CAPpJ_efxenmSXt2OXkhkQ1jDJ59tyWBDUvmpyOB-bfPMDENQZg@mail.gmail.com>
 <CAPpJ_ed9TMJjN8xS1_3saf5obQhULJSLNgQSAFxgiWM2QX9A7Q@mail.gmail.com>
 <20200526102018.kznh6aglpkqlp6en@gilmour.lan> <CAD8Lp467DiYWLwH6T1Jeq-uyN4VEuef-gGWw0_bBTtmSPr00Ag@mail.gmail.com>
 <20200527091335.7wc3uy67lbz7j4di@gilmour.lan>
In-Reply-To: <20200527091335.7wc3uy67lbz7j4di@gilmour.lan>
From:   Daniel Drake <drake@endlessm.com>
Date:   Wed, 27 May 2020 17:15:12 +0800
Message-ID: <CAD8Lp45ucK-yZ5G_DrUVA7rnxo58UF1LPUy65w2PCOcSxKx_Sg@mail.gmail.com>
Subject: Re: [PATCH v2 00/91] drm/vc4: Support BCM2711 Display Pipelin
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Jian-Hong Pan <jian-hong@endlessm.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Eric Anholt <eric@anholt.net>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-rpi-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
        Linux Upstreaming Team <linux@endlessm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 27, 2020 at 5:13 PM Maxime Ripard <maxime@cerno.tech> wrote:
> I'm about to send a v3 today or tomorrow, I can Cc you (and Jian-Hong) if you
> want.

That would be great, although given the potentially inconsistent
results we've been seeing so far it would be great if you could
additionally push a git branch somewhere.
That way we can have higher confidence that we are applying exactly
the same patches to the same base etc.

Thanks
Daniel

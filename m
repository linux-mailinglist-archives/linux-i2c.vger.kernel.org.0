Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F23A35D378
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 00:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240151AbhDLWxV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Apr 2021 18:53:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237444AbhDLWxV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Apr 2021 18:53:21 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9410FC061574;
        Mon, 12 Apr 2021 15:53:01 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id f2-20020a17090a4a82b02900c67bf8dc69so9689075pjh.1;
        Mon, 12 Apr 2021 15:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0Ftw/Jgrd2OkIGduaSL6Sd+C58gr6UDp9zw3E1fsmtM=;
        b=hd4FfPO8HsHFjHqb08I/8AMDf3/8NN+t529lhW5APIvW4JAnMY8RnCgFnf0AmwlUp/
         uH6o6ORHeSHdjih7XvLy/GAR1YidPUFBxMFoTtqGn1nT9fNUMn1O6dTNEgI1dA3WacRj
         lPedgIU/7o+LWW3kHqW4airyhsvmweuURHfrmcwVR/Gk4TflcNPN/2F89IKj7AYFIO5e
         WsyLBsxp8n+IuhEX5gEnAeFYihEB4iLphJxtqShN+zVIJ2kTMZxyuDDthorzAdk8GeT2
         +WukDyydqTjjHRECIiMfEqdY49G14lgjMcXPSKpplt0bWX0q89ByCsWkpL2kLgk9WtSZ
         pVJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0Ftw/Jgrd2OkIGduaSL6Sd+C58gr6UDp9zw3E1fsmtM=;
        b=rkC1xgOl8Jd2Yh5ke7IHb+Cv2g+tW5ZY+Hblj0oe3P+8kCgfoisfYzKPRsdF+rcUoE
         a5ILF3IsSMdMlV4rdVcetxh0tmrHe++XVS6eCObDPFo14a/KIb5K92ETfS+mIBlPo8d3
         cxAPmGCkTO+CzbnYKyGr+ct7dhCg7BlM1UM1KunexyTlna3y/h9WBjfG3FQxW34ym+H1
         TVegAYx2+JfaUvQ+wUwyP1YK/+iFqF4GMG10xD5p5wv1uU2u3G3LBQEk7MPnun3Y0/ab
         5hm6Mjke9rNQKhoqyRMZJEvSSHeO40O4AQ1oXloQrLelhMDzvyb4f4NNMU3xbxa85RNg
         dD/A==
X-Gm-Message-State: AOAM532kVNtbatgq6MREtiXfX1CW9CZ+bQDJVf1iyK2sypi71YdeXfB8
        W3kGrK168CCbAwh8iTa1Cl2dsJW7MoOrv0DYg7U=
X-Google-Smtp-Source: ABdhPJxMFOIjxS2t/XQ3pRIIef1EO2i8/nKcD0VTu7upfnFpOX35hAP5v1z6SJd+BhEov+vQOUwm/ZgIydstfGqU1LU=
X-Received: by 2002:a17:90a:156:: with SMTP id z22mr1627420pje.181.1618267980917;
 Mon, 12 Apr 2021 15:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210329015206.17437-1-chris.packham@alliedtelesis.co.nz> <20210329015206.17437-6-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20210329015206.17437-6-chris.packham@alliedtelesis.co.nz>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 13 Apr 2021 01:52:44 +0300
Message-ID: <CAHp75VfRXeeP0uQFDBUS6=n2TvG+_5=pe8rWp6BpbDNMz6=OSg@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] i2c: mpc: use device managed APIs
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 29, 2021 at 4:54 AM Chris Packham
<chris.packham@alliedtelesis.co.nz> wrote:
>
> Use device managed functions an clean up error handling.

For the god sake how have you tested this?
The patch is broken.

-- 
With Best Regards,
Andy Shevchenko

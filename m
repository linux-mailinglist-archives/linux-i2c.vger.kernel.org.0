Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E59FF6CA1DB
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Mar 2023 12:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232091AbjC0K7p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Mar 2023 06:59:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231990AbjC0K7o (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Mar 2023 06:59:44 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F30103C29
        for <linux-i2c@vger.kernel.org>; Mon, 27 Mar 2023 03:59:42 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id n125so9946142ybg.7
        for <linux-i2c@vger.kernel.org>; Mon, 27 Mar 2023 03:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1679914782;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4cIVo2dlqJiiyp85rWZ9bI1y0w9kmh/mgSwb0qLyW7E=;
        b=HpAU6+Yufd8ekUlVDHkFI81rDPd94b4qWTH7yuDsOEA2Ut0f5J9ba2s3LHM7SMrzD0
         w4fZByz8p4ux2lldYl3Q1UsWPLfmAcEf/nDVyEBb/ndixUMiN8pxVvjIqr7bVdm8ury0
         sg97heLG4+thQaiKAgBZ29ytx6MeDpoIz+tCv3bvymjOe25rY+GO5p+ikIMWu9jyuhn4
         W2IZDHevp92O1BcmnOh8RmtV5hw/VZH0BqjixPMJqjiJl9FFjq+OhRch/rh/pVhbdrd9
         dxaxbnvOcfRF/Kzto/tuDreZSm9wNbGsfp7VmlmGInt1sU4+xdWBrNxWvYmwbgzbE0v1
         /o3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679914782;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4cIVo2dlqJiiyp85rWZ9bI1y0w9kmh/mgSwb0qLyW7E=;
        b=V5DgbLzHnNMoCXSA+s+CgnL/o9nPjJj6RSJlRmil5UTQm8JZc3TVymYpy+azeIiP4U
         e4M18c1f2xBrNTwXZOy4opw+dGARgPApfmS8LfFA6p4LwYD/ojAesmkbHOrhKrLIzSFC
         5tqfII4fyaUvxSykOD5MwQu3IaPqrRVWSYGpxBA0D3QIfTjNYr8NN0VevxLa/eTm9r/v
         wn2+SlwnSizPwpxDRvhvu2BmiUDAh6h53qhWJWsMEhYICJnqMkwR5kr4yuOg8B/JVMR1
         Tdcz37Iy5KJjn+jlgofGu6dZHcN38vcLxFYlVkOOkVR5HbZ6se00iBiSmI1P9Abae/m6
         bE3g==
X-Gm-Message-State: AAQBX9eqiTaZhA4RBHgxSwAECLDRseLm2jLps1r1VVLjpgm9/hUvrwNn
        wlobIPWCgzDt942X8/ha/0pCOK9tW7TfEND121dspg==
X-Google-Smtp-Source: AKy350b5PoC9b2J9/khe3V6Tkw9uAc0Lp6gjwZcsHGSG0CxqeaAumyEo+6eqBsCqxlWqhiTzMb1m1rI7YuEqSoTqylI=
X-Received: by 2002:a05:6902:1586:b0:98e:6280:74ca with SMTP id
 k6-20020a056902158600b0098e628074camr6889426ybu.1.1679914782191; Mon, 27 Mar
 2023 03:59:42 -0700 (PDT)
MIME-Version: 1.0
References: <20221122-mt8365-i2c-support-v5-0-6e4f3b54937f@baylibre.com>
 <20221122-mt8365-i2c-support-v5-2-6e4f3b54937f@baylibre.com>
 <2a1b1f66-970e-5adb-389e-b9c47a790712@collabora.com> <CAFGrd9pf+ojPDciF3Mtw-QT51LZCj+GNLHXurGx_vcC17GHA2A@mail.gmail.com>
In-Reply-To: <CAFGrd9pf+ojPDciF3Mtw-QT51LZCj+GNLHXurGx_vcC17GHA2A@mail.gmail.com>
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Mon, 27 Mar 2023 12:59:31 +0200
Message-ID: <CAFGrd9r-s564RPk+F5J_=Ns-1tjWo-osEYaXNNt0uXU_k=TKqw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] arm64: dts: mediatek: enable i2c0 for mt8365-evk board
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> > ...and please do *not* use the mediatek,pull-up-adv property: this is
> > supposed to be there only for older devicetrees and there's a replacement
> > for it.... unless you have any specific reason to do so (and if you do,
> > you should well explain that).
>
> bias-pull-up isn't necessary currently because MT8365 doesn't use MTK

I mean mediatek,pull-up-adv. bias-pull-up can be kept.
